# read: https://forum.mikrotik.com/viewtopic.php?t=72070
:local PrimaryDNS "192.168.88.10";
:local BackupDNS "1.1.1.1";
:local TestDomain "google.com";

:local ConfiguredDNS [/ip dns get servers];

:if ($ConfiguredDNS = $PrimaryDNS) do={
    :do {:put [:resolve $TestDomain server $PrimaryDNS];} on-error={log warning "Primary DNS $PrimaryDNS query failed. Setting $BackupDNS as DNS server";/ip dns set servers=$BackupDNS;}
} else={
    :do {:put [:resolve $TestDomain server $PrimaryDNS]; log warning "Primary DNS $PrimaryDNS is back online. Setting $PrimaryDNS as DNS server";/ip dns set servers=$PrimaryDNS;} on-error={ }
}