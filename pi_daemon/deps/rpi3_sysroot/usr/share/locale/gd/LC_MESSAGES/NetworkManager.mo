��    y      �  �   �      8
  *   9
  2  d
  &   �     �     �  /   �  %   &  5   L  4   �  %   �     �     �          '     A     V     o     �     �  %   �     �     �       0     '   M  )   u  !   �     �     �  )   �     '  -   ;  "   i     �     �     �  !   �     �  L     1   Q  #   �     �     �     �     �  0        3     O     n     �     �     �     �     �  
   �     �          4     D  '   Z     �      �  )   �  ,   �  '   	  $   1  1   V     �  *   �  ,   �     �          0     A     ^  E   ~     �     �     �  *   �     	  �   #  	     %        2  %   K      q     �  +   �     �     �  �   �  �   �     #  (   0  �   Y     V  V  p  �   �  �   L          "     A     S     g  0   {  .   �  
  �  �   �  U   j  5   �     �        )   )   (   S      |      �   	   �   ?   �   :   �     !  2   -#  o  `#  1   �%  3   &  &   6&  1   ]&  '   �&  3   �&  6   �&  3   "'     V'  "   t'  *   �'     �'  #   �'  %   (     ((     B(  *   ^(  H   �(  %   �(  &   �(  $   )  7   D)  =   |)  2   �)  )   �)  $   *  &   <*  3   c*     �*  :   �*  -   �*  	   +  *   +  *   I+  0   t+     �+  v   �+  =   7,  7   u,  &   �,  '   �,     �,     -  ?   !-  *   a-  -   �-  !   �-  %   �-     .  "   ".      E.     f.     �.  ,   �.  '   �.     �.  #   �.  :   "/     ]/  /   p/  <   �/  A   �/  /   0  !   O0  :   q0  &   �0  5   �0  3   	1  $   =1  .   b1     �1     �1  !   �1  L   �1     .2     =2     Y2  -   ]2     �2  �   �2  
   �3  -   �3     �3  *   �3  $    4     E4  5   b4     �4     �4  �   �4  �   �5     O6  0   c6  V  �6  &   �7  �  8  �   �9  �   @:     +;  4   A;     v;     �;     �;  -   �;  1   �;  t  <  �   �=  v   2>  J   �>  &   �>      ?  6   <?  0   s?     �?     �?     �?  G   �?  B   #@        6                 d       f   8      "       y      M       &   .               w       Y           R       D   9   v   F   K   <   h      (   7       `   J       r   :      k              !       A      u   '   >   %       N      ;   )   I      V          L   x       g   Q             0          4      m       #   c   E   o       ]   X   -   j         5   	   2       ?   $   G   H   W                 @   Z      s   B   O   *   C   S       n       i      1       +   P          /           U   _   3   =      ^                         t           a           e   \   q   
      [   b           p   T   ,   l       '%s' is not a valid value for the property ---[ Property menu ]---
set      [<value>]               :: set new value
add      [<value>]               :: add new option to the property
change                           :: change current value
remove   [<index> | <option>]    :: delete the value
describe                         :: describe property
print    [setting | connection]  :: print property (setting/connection) value(s)
back                             :: go to upper level
help/?   [<command>]             :: print this help or command description
quit                             :: exit nmcli
 802.1X supplicant configuration failed 802.1X supplicant disconnected 802.1X supplicant failed 802.1X supplicant took too long to authenticate A dependency of the connection failed A problem with the RFC 2684 Ethernet over ADSL bridge A secondary connection of the base connection failed Allowed values for '%s' property: %s
 AutoIP service error AutoIP service failed AutoIP service failed to start Available properties: %s
 Carrier/link changed DCB or FCoE setup failed DHCP client error DHCP client failed DHCP client failed to start Device disconnected by user or client Device is now managed Device is now unmanaged Enter connection type:  Error: <setting>.<property> argument is missing. Error: failed to set '%s' property: %s
 Error: invalid <setting>.<property> '%s'. Error: invalid property '%s': %s. Error: invalid property: %s
 Error: invalid property: %s%s
 Error: missing setting for '%s' property
 Error: property %s
 Failed to register with the requested network Failed to select the specified APN GROUP GSM Modem's SIM PIN required GSM Modem's SIM PUK required GSM Modem's SIM card not inserted GSM Modem's SIM wrong IP configuration could not be reserved (no available address, timeout, etc.) InfiniBand device does not support connected mode Modem failed or no longer available Modem initialization failed Modem now ready and available ModemManager is unavailable NAME Necessary firmware for the device may be missing Network registration denied Network registration timed out NetworkManager went to sleep No carrier could be established No dial tone No reason given Not searching for networks PIN check failed PPP failed PPP service disconnected PPP service failed to start Property name?  SIM PIN was incorrect Secrets were required, but not provided Setting name?  Shared connection service failed Shared connection service failed to start The Bluetooth connection failed or timed out The IP configuration is no longer valid The Wi-Fi network could not be found The device could not be readied for configuration The device was removed The device's active connection disappeared The device's existing connection was assumed The dialing attempt failed The dialing request timed out The line is busy The modem could not be found The supplicant is now available Type 'describe [<setting>.<prop>]' for detailed property description. Unknown Unknown error VPN You may edit the following properties: %s
 [NM property description] add [<value>]  :: append new value to the property

This command adds provided <value> to this property, if the property is of a container type. For single-valued properties the property value is replaced (same as 'set').
 connected connecting (checking IP connectivity) connecting (configuring) connecting (getting IP configuration) connecting (need authentication) connecting (prepare) connecting (starting secondary connections) connection failed deactivating describe  :: describe property

Shows property description. You can consult nm-settings(5) manual page to see all NM settings and properties.
 describe [<setting>.<prop>]  :: describe property

Shows property description. You can consult nm-settings(5) manual page to see all NM settings and properties.
 disconnected don't know how to get the property value goto <setting>[.<prop>] | <prop>  :: enter setting/property for editing

This command enters into a setting or property for editing it.

Examples: nmcli> goto connection
          nmcli connection> goto secondaries
          nmcli> goto ipv4.addresses
 invalid priority map '%s' nmcli can accepts both direct JSON configuration data and a file name containing the configuration. In the latter case the file is read and the contents is put into this property.

Examples: set team.config { "device": "team0", "runner": {"name": "roundrobin"}, "ports": {"eth1": {}, "eth2": {}} }
          set team.config /etc/my-team.conf
 print [all]  :: print setting or connection values

Shows current property or the whole connection.

Example: nmcli ipv4> print all
 print [property|setting|connection]  :: print property (setting, connection) value(s)

Shows property value. Providing an argument you can also display values for the whole setting or connection.
 property invalid property invalid (not enabled) property is empty property is invalid property is missing property is not specified and neither is '%s:%s' property value '%s' is empty or too long (>64) remove <setting>[.<prop>]  :: remove setting or reset property value

This command removes an entire setting from the connection, or if a property
is given, resets that property to the default value.

Examples: nmcli> remove wifi-sec
          nmcli> remove eth.mtu
 set [<setting>.<prop> <value>]  :: set property value

This command sets property value.

Example: nmcli> set con.id My connection
 set [<value>]  :: set new value

This command sets provided <value> to this property
 setting this property requires non-zero '%s' property teamd control failed the property can't be changed this property cannot be empty for '%s=%s' this property is not allowed for '%s=%s' unavailable unknown unmanaged use 'goto <setting>' first, or 'describe <setting>.<property>'
 use 'goto <setting>' first, or 'set <setting>.<property>'
 Project-Id-Version: NetworkManager
Report-Msgid-Bugs-To: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/issues
PO-Revision-Date: 2016-01-29 11:29+0100
Last-Translator: GunChleoc <fios@foramnagaidhlig.net>
Language-Team: Fòram na Gàidhlig
Language: gd
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=4; plural=(n==1 || n==11) ? 0 : (n==2 || n==12) ? 1 : (n > 2 && n < 20) ? 2 : 3;
X-Generator: Virtaal 0.7.1
X-Launchpad-Export-Date: 2016-01-28 16:48+0000
 chan eil "%s" 'na luach dligheach airson na buaidh ---[ Clàr-taice na buaidh ]---
set      [<luach>]                :: suidhich luach ùr
add      [<luach>]                :: cuir an roghainn ùr ris a' bhuadh
change                            :: atharraich an luach làithreach
remove   [<inneacs> | <roghainn>] :: sguab às an luach
describe                          :: mìnich a' bhuadh
print    [setting | connection]   :: seall luach(an) na buaidh (roghainn/ceangal)
back                              :: rach gu leibheil nas àirde
help/?   [<àithne>]               :: seall a' chobhair seo no tuairisgeul na h-àithne
quit                              :: fàg nmcli
 Dh'fhàillig le rèiteachadh a' 802.1X supplicant Chaidh an ceangal aig 802.1X supplicant a bhriseadh Dh'fhàillig leis a' 802.1X supplicant Thug e ro fhada an 802.1X supplicant a dhearbhadh Dh'fhàillig eisimeileachd a' cheangail Duilgheadas le RFC 2684 Ethernet thar drochaid ADSL Dh'fhàillig le ceangal dàrnach a' cheangail thùsail Luachan a tha ceadaichte airson na buaidh "%s": %s
 Mearachd na seirbheise AutoIP Dh'fhàillig an t-seirbheis AutoIP Cha deach le seirbheis AutoIP tòiseachadh Buadhan ri am faighinn: %s
 Dh'atharraich an giùlanair/ceangal Dh'fhàillig suidheachadh DCB no FCoE Mearachd a' chliaint DHCP Dh'fhàillig an cliant DCHP Dh'fhàillig tòiseachadh a' chliaint DHCP Chaidh ceangal an uidheim a bhriseadh le cleachdaiche no leis a' chliant Tha an t-uidheam fo stiùireadh a-nis Tha an t-uidheam gun stiùireadh a-nis Cuir a-steach seòrsa a' cheangail:  Mearachd: tha argamaid a dhìth air <roghainn>.<buadh>. Mearachd: cha deach leinn a' bhuadh "%s" a shuidheachadh: %s
 Mearachd: <roghainn>.<buadh> mhì-dhligheach "%s". Mearachd: buadh mhì-dhligheach "%s": %s. Mearachd: buadh mhì-dhligheach: %s
 Mearachd: buadh mhì-dhligheach: %s%s
 Mearachd: tha roghainn a dhìth air a' bhuadh "%s"
 Mearachd: buadh %s
 Cha deach leinn clàradh leis an lìonra a chaidh iarraidh Cha deach leinn an APN sònraichte a thaghadh BUIDHEANN Tha feum air PIN an t-SIM aig a' GSM Modem Tha feum air PUK an t-SIM aig a' GSM Modem Cha deach cairt SIM a' GSM Modem a chur a-steach Tha SIM a' GSM Modem cearr Tha b' urrainn dhuinn rèiteachadh an IP a ghlèidheadh (chan eil seòladh ri làimh, dh'fhalbh an ùine air is msaa.) Cha chuir an t-uidheam InfiniBand taic dhan mhodh cheangailte Dh'fhàillig am modem no chan eil e ri làimh tuilleadh Dh'fhàillig le tòiseachadh a' mhodem Tha am modem deiseil 's ri làimh a-nis Chan eil ModemManager ri làimh AINM Dh'fhaoidte gu bheil firmware riatanach a dhìth air an uidheam Chaidh clàradh an lìonraidh a dhiùltadh Dh'fhalbh an ùine air clàradh an lìonraidh Chaidh an NetworkManager a chadal Cha deach giùlanair a stèidheachadh Chan eil seirm daithealaidh ann Cha deach adhbhar a thoirt seachad Chan eil lìonraidhean 'gan lorg Dh'fhàillig dearbhadh a' PIN Dh'fhàillig am PPP Chaidh ceangal na seirbheise PPP a bhriseadh Cha deach le seirbheis PPP tòiseachadh Ainm na buaidh?  Cha robh PIN an t-SIM mar bu chòir Chaidh rùintean-dìomhair iarraidh ach cha deach an solar Ainm na roghainn?  Dh'fhàillig seirbheis a' cheangail cho-roinnte Dh'fhàillig tòiseachadh seirbheis a' cheangail cho-roinnte Dh'fhàillig leis a' cheangal bluetooth no dh'fhalbh an ùine air Chan eil rèiteachadh an IP dligheach tuilleadh Cha deach an lìonra Wi-Fi a lorg Cha deach leinn an t-uidheam ullachadh airson rèiteachadh Chaidh an t-uidheam a thoirt air falbh Rach ceangal gnìomhach an uidheim a-mach à sealladh Bhathar an dùil air ceangal làithreach an uidheim Dh'fhàillig oidhirp an daithealaidh Dh'fhalbh an ùine air an iarrtas daithealaidh Tha an loidhne rang Cha deach am modem a lorg Tha an supplicant ri làimh a-nis Sgrìobh 'describe [<roghainn>.<buadh>]' airson mion-fhiosrachadh na buaidh. Chan eil fhios Mearachd nach aithne dhuinn VPN Faodaidh tu na buadhan seo a dheasachadh: %s
 [tuairisgeul buaidh NM] add [<luach>]  :: cuir luach ùr ris a' bhuadh

Cuiridh an àithne seo an <luach> a chaidh a shònrachadh ris a' bhuadh seo ma tha
a' bhuadh 'na soitheach. Airson buadhan le luach a-mhàin, thèid luach na buaidh
a chur an àite (mar a nì "set").
 ceangailte 'ga cheangal (a' dearbhadh comas-ceangail IP) 'ga cheangal ('ga rèiteachadh) 'ga cheangal (a' faighinn rèiteachadh IP) 'ga cheangal (feumach air dearbhadh) 'ga cheangal ('ga ullachadh) 'ga cheangal (a' tòiseachadh ceanglaichean dàrnach) dh'fhàillig leis a' cheangal 'ga chur à gnìomh describe  :: mìnich a' bhuadh

Seall tuairisgeul na buaidh. Thoir sùil air duilleag an leabhair-mìneachaidh aig
nm-settings(5) gus a h-uile roghainn is buadh aig NM a shealltainn.
 describe [<roghainn>.<buadh>]  :: mìnich a' bhuadh

Seall tuairisgeul na buaidh. Thoir sùil air duilleag an leabhair-mìneachaidh aig
nm-settings(5) gus a h-uile roghainn is buadh aig NM a shealltainn.
 air a dhì-cheangal chan eil fhios mar a gheibh sinn luach na buaidh goto <roghainn>[.<buadh>] | <buadh>     :: rach a-steach dha roghainn/buadh
                                           a chum deasachaidh

Bheir an àithne seo gu roghainn no buadh thu ach an deasaich thu i.

Mar eisimpleir: nmcli> goto connection
                nmcli connection> goto secondaries
                nmcli> goto ipv4.addresses
 mapa prìomhachais "%s" mì-dhligheach Gabhaidh nmcli an dà chuid ri dàta rèiteachaidh JSON dìreach agus ainm faidhle sa bheil an rèiteachadh. Mas e ainm faidhle a th' ann, thèid am faidhle a leughadh agus an t-susbaint aige a chur dhan bhuadh seo.

Mar eisimpleir: set team.config { "device": "team0", "runner": {"name": "roundrobin"}, "ports": {"eth1": {}, "eth2": {}} }
                set team.config /etc/my-team.conf
 print [all]  :: seall fiosrachadh roghainn no luachan a' cheangail

Seallaidh seo a' bhuadh làithreach no an ceangal air fad.

Mar eisimpleir: nmcli ipv4> print all
 print [buadh|roghainn|ceangal]  :: seall luach(an) buaidh (roghainn, ceangal)

Seallaidh seo luach na buaidh. Ma bheir thu seachad argamaid, 's urrainn dhut luachan
a shealltainn airson na roghainn no a' cheangail gu lèir cuideachd.
 buadh mhì-dhligheach chan eil a' bhuadh dligheach (chan eil i gnìomhach) tha a' bhuadh falamh tha a' bhuadh mì-dhligheach tha buadh a dhìth cha deach a' bhuadh no "%s:%s" a shònrachadh tha luach na buaidh "%s" falamh no ro fhada (>64) remove <roghainn>[.<buadh>]             :: thoir roghainn air falbh no
                                           ath-shuidhich luach buaidhe

Bheir an àitne seo air falbh roghainn shlàn on cheangal, no ma chaidh buadh a thoirt
seachad, ath-shuidhichidh e a' bhuadh sin air an luach tùsail.

Mar eisimpleir: nmcli> remove wifi-sec
                nmcli> remove eth.mtu
 set [<roghainn>.<buadh> <luach>]        :: suidhich luach na buaidh

Suidhichidh an àithne seo luach buaidh.

Mar eisimpleir: nmcli> set con.id An ceangal agam
 set [<luach>]  :: suidhich luach ùr

Suidhichidh an àithne seo a' bhuadh seo air an <luach> a chaidh a shònrachadh
 feumaidh tu buadh "%s" nach eil na neoni gus a' bhuadh seo a shuidheachadh Dh'fhàillig an t-uidheam-smachd teamd cha ghabh a' bhuadh atharrachadh chan fhaod a' bhuadh seo a bhith falamh airson "%s=%s" chan eil a' bhuadh seo ceadaichte airson "%s=%s" chan eil e ri fhaighinn chan eil fhios gun stiùireadh cleachd "goto <roghainn>" an toiseach no "describe <roghainn>.<buadh>"
 cleachd "goto <roghainn>" an toiseach no "set <roghainn>.<buadh>"
 