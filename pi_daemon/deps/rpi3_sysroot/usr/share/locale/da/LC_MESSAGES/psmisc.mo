��    ^           �      �  l   �     f  �  �  b   >  M   �  H   �  p   8  �   �  q   K  �   �  �   �  �   �  �   T  #   �          5     L  )   b  	   �  3   �     �  �   �      u  ,   �  $   �     �      �          >  #   ]  !   �     �     �  <   �  <     %   J     p     �     �     �     �     �     �          *  �   J  &        2     Q     f  �   }  d   `     �     �  $   �  u     C   �  =   �       &   )  +   P     |  (   �  )   �     �     �      (     /  D  �   t!  }   0"  .   �"  F   �"  "   $#  -   G#     u#  
   �#     �#  2   �#  $   �#  ,   $  '   8$  '   `$     �$     �$  +   �$     �$     �$     �$      %     	%     %     %  �  %  r   �&     V'  �  l'  Z   A+  U   �+  I   �+  {   <,  �   �,     n-  �   �-  �   �.  �   �/  �   �0  $   '1     L1     h1     �1  )   �1     �1  C   �1     2  �   02  6   �2  3   �2  %   ,3     R3      n3  "   �3  #   �3  &   �3  !   �3     4     =4  7   ]4  7   �4  !   �4      �4      5     15     N5     m5     ~5     �5     �5     �5  �   �5  -   �6  &   �6     �6     7  �   07  _   8     x8     �8  "   �8     �8  E   T9  A   �9     �9      �9  /   :     F:  +   \:  3   �:  #   �:     �:  I  �:  (   C?  ]  l?  �   �A  ~   �B  5   C  J   8C     �C  9   �C  #   �C  
    D     D  5   D  '   TD  2   |D  %   �D  ,   �D     E     	E  0   E     NE     cE     wE     ~E     �E     �E     �E     1          )             7       0   9   >                   6   I   +          O       <   C      -         W   $   ]       L   5       .          S   N   T                 #              (       :      ,       F   '         K       "      [              J   H      =          P      ^   X   ;   R       4   !           	   Q   Z   G   3   E   D   2          &   A      @   %       8   M               *   U   Y              B       \      V   /   ?      
                    
  PID    start at this PID; default is 1 (init)
  USER   show only trees rooted at processes of this user

 
Display a tree of processes.

        killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          don't print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
  -n,--ns PID         match processes that belong to the same namespaces
                      as PID
   -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
   -C, --color=TYPE    color process by attribute
                      (age)
   -Z, --security-context
                      show security attributes
   -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
   -a, --arguments     show command line arguments
  -A, --ascii         use ASCII line drawing characters
  -c, --compact-not   don't compact identical subtrees
   -g, --show-pgids    show process group ids; implies -c
  -G, --vt100         use VT100 line drawing characters
   -h, --highlight-all highlight current process and its ancestors
  -H PID, --highlight-pid=PID
                      highlight this process and its ancestors
  -l, --long          don't truncate long lines
   -n, --numeric-sort  sort output by PID
  -N TYPE, --ns-sort=TYPE
                      sort output by this namespace type
                              (cgroup, ipc, mnt, net, pid, time, user, uts)
  -p, --show-pids     show PIDs; implies -c
   -s, --show-parents  show parents of the selected process
  -S, --ns-changes    show namespace transitions
  -t, --thread-names  show full thread names
  -T, --hide-threads  hide threads, show only processes
   -u, --uid-changes   show uid transitions
  -U, --unicode       use UTF-8 (Unicode) line drawing characters
  -V, --version       display version information
 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
 CPU Times
  This Process    (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Child processes (user system guest):       %6.2f %6.2f %6.2f
 Can't get terminal capabilities
 Cannot allocate memory for matched proc: %s
 Cannot find socket's device number.
 Cannot find user %s
 Cannot open /proc directory: %s
 Cannot open /proc/net/unix: %s
 Cannot open a network socket.
 Cannot open protocol file "%s": %s
 Cannot resolve local port %s: %s
 Cannot stat %s: %s
 Cannot stat file %s: %s
 Copyright (C) 1993-2021 Werner Almesberger and Craig Small

 Copyright (C) 1993-2022 Werner Almesberger and Craig Small

 Copyright (C) 2007 Trent Waddington

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace PID Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Memory
  Vsize:       %-10s
  RSS:         %-10s 		 RSS Limit: %s
  Code Start:  %#-10lx		 Code Stop:  %#-10lx
  Stack Start: %#-10lx
  Stack Pointer (ESP): %#10lx	 Inst Pointer (EIP): %#10lx
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 PSmisc comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under
the terms of the GNU General Public License.
For more information about these matters, see the files named COPYING.
 Page Faults
  This Process    (minor major): %8lu  %8lu
  Child Processes (minor major): %8lu  %8lu
 Press return to close
 Process %d not found.
 Process with pid %d does not exist.
 Process, Group and Session IDs
  Process ID: %d		  Parent ID: %d
    Group ID: %d		 Session ID: %d
  T Group ID: %d

 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Scheduling
  Policy: %s
  Nice:   %ld 		 RT Priority: %ld %s
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 Specified filename %s is not a mountpoint.
 TERM is not set
 Unable to allocate memory for proc_info
 Unable to open stat file for pid %d (%s)
 Unable to scan stat file Unknown local port AF %d
 Usage: fuser [-fIMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE]
             [-k [-i] [-SIGNAL]] NAME...
       fuser -l
       fuser -V
Show which processes use the named files, sockets, or filesystems.

  -a,--all              display unused files too
  -i,--interactive      ask before killing (ignored without -k)
  -I,--inode            use always inodes to compare files
  -k,--kill             kill processes accessing the named file
  -l,--list-signals     list available signal names
  -m,--mount            show all processes using the named filesystems or
                        block device
  -M,--ismountpoint     fulfill request only if NAME is a mount point
  -n,--namespace SPACE  search in this name space (file, udp, or tcp)
  -s,--silent           silent operation
  -SIGNAL               send this signal instead of SIGKILL
  -u,--user             display user IDs
  -v,--verbose          verbose output
  -w,--writeonly        kill only processes with write access
  -V,--version          display version information
 Usage: killall [OPTION]... [--] NAME...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8, --eight-bit-clean        output 8 bit clean streams.
    -n, --no-headers             don't display read/write from fd headers.
    -c, --follow                 peek at any new child processes too.
    -t, --tgid                   peek at all threads where tgid equals <pid>.
    -d, --duplicates-removed     remove duplicate read/writes from the output.
    -V, --version                prints version info.
    -h, --help                   prints this help.

  Press CTRL-C to end output.
 Usage: prtstat [options] PID ...
       prtstat -V
Print information about a process
    -r,--raw       Raw display of information
    -V,--version   Display version information and exit
 Usage: pstree [-acglpsStTuZ] [ -h | -H PID ] [ -n | -N type ]
              [ -A | -G | -U ] [ PID | USER ]
   or: pstree -V
 You can only use files with mountpoint options You cannot search for only IPv4 and only IPv6 sockets at the same time You must provide at least one PID. all option cannot be used with silent option. asprintf in print_stat failed.
 disk sleep fuser (PSmisc) %s
 killall: %s lacks process entries (not mounted ?)
 killall: Bad regular expression: %s
 killall: Cannot get UID from process status
 killall: Maximum number of names is %d
 killall: skipping partial match %s(%d)
 paging peekfd (PSmisc) %s
 procfs file for %s namespace not available
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running sleeping traced unknown zombie Project-Id-Version: psmisc 23.5rc1
Report-Msgid-Bugs-To: csmall@dropbear.xyz
PO-Revision-Date: 2022-05-28 18:11+0200
Last-Translator: Joe Hansen <joedalton2@yahoo.dk>
Language-Team: Danish <dansk@dansk-gruppen.dk>
Language: da
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Bugs: Report translation errors to the Language-Team address.
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: Virtaal 0.6.1
 
  PID    start ved denne PID; standard er 1 (init)
  USER   vis kun træstrukturer som har denne bruger som rod

 
Vis et procestræ.

        killall -l, --list
       killall -V, --version

  -e,--exact          kræver eksakt match for meget lange navne
  -I,--ignore-case    ikke-versalfølsom match af navn på proces
  -g,--process-group  dræb proces-gruppe i stedet for proces
  -y,--younger-than   dræb processer yngre end TID
  -o,--older-than     dræb processer ældre end TID
  -i,--interactive    spørg efter bekræftelse før der dræbes
  -l,--list           vis alle kendte signalnavne
  -q,--quiet          udskriv ikke reklamationer
  -r,--regexp         fortolk NAVN som et udvidet regulært udtryk
  -s,--signal SIGNAL  send dette signal i stedet for SIGTERM
  -u,--user BRUGER    dræb kun proces(ser) som kører som BRUGER
  -v,--verbose        rapportér hvis signalet blev sendt med succes
  -V,--version        vis information om version
  -w,--wait           vent på at processer dør
  -n,--ns PID         match processer som tilhører det samme navnerum
                      som PID
   -4,--ipv4             søg kun IPv4-sokler
  -6,--ipv6             søg kun IPv6-sokler
   -C, --color=TYPE    farvelæg process efter attribut
                      (alder)
   -Z, --security-context
                      vis sikkerhedsattributter
   -Z,--context REGUDTRYK dræb kun proces(ser) som har kontekst
                         (skal stå før andre argumenter)
   -a, --arguments     vis kommandolinje-argumenter
  -A, --ascii         anvend ASCII-skrifttegn til linjetegn
  -c, --compact       undlad at sammenpakke identiske understrukturer
   -g, --show-pgids    vis procesgruppe-id'er; -c er underforstået
  -G, --vt100         anvend VT100-skrifttegn til linjetegn
   -h, --highlight-all fremhæv nuværende proces og dens forfædre
  -H PID, --highlight-pid=PID
                      fremhæv denne proces og dens forfædre
  -l, --long          undlad at afkorte lange linjer
   -n, --numeric-sort  sorter uddata efter PID
  -N TYPE, --ns-sort=TYPE
                      sorter efter navnerumstype
                      (cgroup, ipc, mnt, net, pid, time, user, uts)
  -p, --show-pids     vis PID'er; -c er underforstået
   -s, --show-parents  vis overprocesser for den valgte proces
  -S, --ns-changes    vis navnerumsovergange
  -t, --thread-names  vis fulde trådnavne
  -T, --hide-threads  skjul tråde og vis kun processer
   -u, --uid-changes   vis uid-overgange
  -U, --unicode       anvend UTF-8-skrifttegn (Unicode) til linjetegn
  -V, --version       vis information om version
 %*s BRUGER      PID ADGANG KOMMANDO
 %s er tom (ikke monteret)?
 %s: Ugyldigt tilvalg %s
 %s: ingen proces fundet
 %s: ukendt signal; %s -l viser signaler.
 (ukendt) /proc er ikke monteret, kan ikke udføre stat for /proc/self/stat.
 Ugyldigt regulært udtryk: %s
 CPU-tider
  Denne proces   (bruger system gæst blkio): %6.2f %6.2f %6.2f %6.2f
  Barneprocesser (bruger system gæst):       %6.2f %6.2f %6.2f
 Kan ikke skaffe oplysninger om terminalens funktioner
 Kan ikke allokere hukommelse til matchede proc: %s
 Kan ikke finde sokkels enhedsnummer.
 Kan ikke finde brugeren %s
 Kan ikke åbne mappen /proc: %s
 Kan ikke åbne /proc/net/unix: %s
 Kan ikke åbne en netværkssokkel.
 Kan ikke åbne protokolfil »%s«: %s
 Kan ikke løse lokal port %s: %s
 Kan ikke udføre stat %s: %s
 Kan ikke danne stat-fil %s: %s
 Ophavsret 1993-2021 Werner Almesberger og Craig Small

 Ophavsret 1993-2022 Werner Almesberger og Craig Small

 Ophavsret 2007 Trent Waddington

 Kunne ikke dræbe proces %d: %s
 Fejl ved tilslutning til pid %i
 Ugyldig PID for navneområde Ugyldigt navn på navneområde Ugyldigt tilvalg Ugyldigt tidsformat Dræb %s(%s%d) ? (j/N)  Dræb proces %d ? (j/N)  Dræbte %s(%s%d) med signal %d
 Hukommelse
  Vstørrelse:  %-10s
  RSS:         %-10s 		 RSS-grænse: %s
  Kodestart:   %#-10lx		 Kodestop:   %#-10lx
  Stakstart:   %#-10lx
  Stakpeger (ESP): %#10lx	 Inst-peger (EIP): %#10lx
 Tilvalg for navneområde kræver et argument. Ingen specifikation angivet for proces Fandt ingen processer.
 Brugernavnet findes ikke: %s
 PSmisc leveres med absolut ingen garanti.
Dette er fri software, og du er velkommen til at videredistribuere
det under vilkårene i GNU General Public License.
Yderligere oplysninger om disse sager, se filerne med navnene COPYING.
 Sidefejl
  Denne proces   (minor major): %8lu  %8lu
  Barneprocesser (minor major): %8lu  %8lu
 Tryk retur for at lukke
 Processen %d blev ikke fundet.
 Processen med pid %d findes ikke.
 Proces, Gruppe og Sessions-ID'er
    Proces ID: %d		  Forælder-ID: %d
    Gruppe-ID: %d		  Sessions-ID: %d
  T Gruppe-ID: %d

 Proces:  %-14s		Tilstand: %c (%s)
  CPU#:  %-3d		TTY: %s	Tråde: %ld
 Skedulering
  Politik: %s
  Venlig:  %ld 		 RT-prioritet: %ld %s
 Signal %s(%s%d) ? (j/N)  Angivne filnavn %s findes ikke.
 Angivne filnavn %s er ikke et monteringspunkt.
 TERM er ikke angivet
 Kan ikke allokere hukommelse til proc_info
 Ikke i stand til at åbne stat-fil for pid %d (%s)
 Ikke i stand til at skanne stat-fil Ukendt lokal port AF %d
 Brug: fuser [-fIMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE]
            [-k [-i] [-SIGNAL]] NAVN...
      fuser -l
      fuser -V
Vis hvilke processer, der bruger de navngivne filer, sokler eller filsystemer.

  -a,--all              vis også ubrugte filer
  -i,--interactive      spørg før der dræbes (ignoreres uden -k)
  -I,--inode            brug altid iknuder til at sammenligne filer
  -k,--kill             dræb processer som tilgår den navngivne fil
  -l,--list-signals     vis tilgængelige signalnavne
  -m,--mount            vis alle processer med brug af de navngivne filsystemer
                        eller blokenhed
  -M,--ismountpoint     udfør kun forespørgsel hvis NAVN er et monteringspunkt
  -n,--namespace RUM    søg i dette navneområde (file, udp eller tcp)
  -s,--silent           stille kørsel
  -SIGNAL               send dette signal i stedet for SIGKILL
  -u,--user             vis id for brugere
  -v,--verbose          udskriv uddybende information
  -w,--writeonly        dræb kun processer med skriveadgang
  -V,--version          vis information om version
 Brug: killall [TILVALG]... [--] NAVN...
 Brug: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8, --eight-bit-clean        giver uddata i rene 8-bit strømme.
    -n, --no-headers             vis ikke læsning/skrivning fra fd-headere.
    -c, --follow                 smugkig også på alle nye barneprocesser.
    -t, --tgid                   kig på alle tråde hvor tgid er lig med <pid>.
    -d, --duplicates-removed     fjern duplikerede læsninger/skrivninger fra uddata.
    -V, --version                udskriver versionsinfo.
    -h, --help                   udskriver denne hjælpetekst.

  Tryk CTRL-C for at stoppe uddata.
 Brug: prtstat [tilvalg] PID ...
      prtstat -V
Udskriv information om en proces
    -r,--raw       Rå visning af information
    -V,--version   Vis information om version og afslut
 Brug: pstree [-acglpsStTuZ] [ -h | -H PID ] [ -n | -N type ]
             [ -A | -G | -U ] [ PID | USER ]
   eller: pstree -V
 Du kan kun bruge filer med et angivet monteringspunkt Du kan ikke begrænse søgning til blot IPv4- og IPv6-sokler på samme tid Du skal mindst angive én PID. tilvalget --all kan ikke anvendes med tilvalget --silent. asprintf i print_stat mislykkedes.
 disk sover fuser (PSmisc) %s
 killall: %s mangler proceselementer (ikke monteret)?
 killall: Ugyldigt regulært udtryk: %s
 killall: Kan ikke hente UID fra status for proces
 killall: Maksimalt antal navne er %d
 killall: springer over delvist match %s(%d)
 paging peekfd (PSmisc) %s
 procfs-fil for %s-navnerum er ikke tilgængelig
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 kører sover spores ukendt zombie 