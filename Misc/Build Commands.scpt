FasdUAS 1.101.10   ��   ��    k             x     �� ����    4    �� 
�� 
frmk  m     	 	 � 
 
  F o u n d a t i o n��        x    �� ����    4    �� 
�� 
frmk  m       �    A p p K i t��        x    $�� ����    2   ��
�� 
osax��        l     ��������  ��  ��        j   $ &�� �� 0 
uselogging 
useLogging  m   $ %��
�� boovtrue      l     ��������  ��  ��        i   ' *    I     ������
�� .aevtoappnull  �   � ****��  ��    k    �      !   I    ������
�� .miscactvnull��� ��� null��  ��   !  " # " I   "�� $ %
�� .sysodlogaskr        TEXT $ b     & ' & b     ( ) ( b    	 * + * m     , , � - - T h i s   a p p l e t   w i l l   c o n s t r u c t   a   s e t   o f   c u s t o m   D i c t a t i o n   C o m m a n d s   b y   c r e a t i n g   a   p r e f e r e n c e s   p r o p e r t y   l i s t   f i l e   c o n t a i n i n g   t h e   c o m m a n d s ,   a n d   b y   c r e a t i n g   a n d   i n s t a l l i n g   t h e i r   c o r r e s p o n d i n g   A p p l e S c r i p t   t r i g g e r   s c r i p t s   i n   t h e   S c r i p t s   f o l d e r   i n   t h e   u s e r   L i b r a r y   f o l d e r . + 1    ��
�� 
lnfd ) 1   	 
��
�� 
lnfd ' m     . . � / / � B e f o r e   r u n n i n g   t h i s   a p p l e t ,   r u n   t h e   A u t o m a t i o n   T o o l s   I n s t a l l e r   a p p l e t   l o c a t e d   i n   t h e   s a m e   f o l d e r   a s   t h i s   a p p l e t . % �� 0 1
�� 
btns 0 J     2 2  3 4 3 m     5 5 � 6 6  C a n c e l 4  7�� 7 m     8 8 � 9 9  C o n t i n u e��   1 �� : ;
�� 
dflt : m    ����  ; �� <��
�� 
appr < c     = > = b     ? @ ? b     A B A m     C C � D D 0 B u i l d   D C   P r e f e r e n c e   F i l e B 1    ��
�� 
spac @ l    E���� E n     F G F m    ��
�� 
vers G  f    ��  ��   > m    ��
�� 
TEXT��   #  H I H l  # #��������  ��  ��   I  J K J l  # #�� L M��   L   IS DICTATION ON?    M � N N "   I S   D I C T A T I O N   O N ? K  O P O Q   # W Q R S Q k   & J T T  U V U r   & 7 W X W c   & 3 Y Z Y c   & / [ \ [ l  & + ]���� ] I  & +�� ^��
�� .sysoexecTEXT���     TEXT ^ m   & ' _ _ � ` ` � d e f a u l t s   r e a d   c o m . a p p l e . s p e e c h . r e c o g n i t i o n . A p p l e S p e e c h R e c o g n i t i o n . p r e f s   D i c t a t i o n I M M a s t e r D i c t a t i o n E n a b l e d��  ��  ��   \ m   + .��
�� 
long Z m   / 2��
�� 
bool X o      ���� "0 dictationstatus dictationStatus V  a�� a Z  8 J b c���� b =  8 ? d e d o   8 ;���� "0 dictationstatus dictationStatus e m   ; > f f � g g   c R   B F������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   R R      ������
�� .ascrerr ****      � ****��  ��   S r   R W h i h m   R S��
�� boovfals i o      ���� "0 dictationstatus dictationStatus P  j k j l  X X��������  ��  ��   k  l m l l  X X�� n o��   n %  IS ENHANCED DICTATION ENABLED?    o � p p >   I S   E N H A N C E D   D I C T A T I O N   E N A B L E D ? m  q r q Q   X � s t u s k   [ � v v  w x w r   [ n y z y c   [ j { | { c   [ f } ~ } l  [ b ����  I  [ b�� ���
�� .sysoexecTEXT���     TEXT � m   [ ^ � � � � � � d e f a u l t s   r e a d   c o m . a p p l e . s p e e c h . r e c o g n i t i o n . A p p l e S p e e c h R e c o g n i t i o n . p r e f s   D i c t a t i o n I M U s e O n l y O f f l i n e D i c t a t i o n��  ��  ��   ~ m   b e��
�� 
long | m   f i��
�� 
bool z o      ���� 20 enhanceddictationstatus enhancedDictationStatus x  ��� � Z  o � � ����� � =  o v � � � o   o r���� 20 enhanceddictationstatus enhancedDictationStatus � m   r u � � � � �   � R   y }������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   t R      ������
�� .ascrerr ****      � ****��  ��   u r   � � � � � m   � ���
�� boovfals � o      ���� 20 enhanceddictationstatus enhancedDictationStatus r  � � � l  � ���������  ��  ��   �  � � � Z   �] � ����� � G   � � � � � =  � � � � � o   � ����� "0 dictationstatus dictationStatus � m   � ���
�� boovtrue � =  � � � � � o   � ����� 20 enhanceddictationstatus enhancedDictationStatus � m   � ���
�� boovfals � k   �Y � �  � � � I  � ��� � �
�� .sysodlogaskr        TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � " D i c a t i o n   s t a t u s :   � o   � ����� "0 dictationstatus dictationStatus � 1   � ���
�� 
lnfd � m   � � � � � � � 6 E n h a n c e d   D i c t a t i o n   s t a t u s :   � o   � ����� 20 enhanceddictationstatus enhancedDictationStatus � 1   � ���
�� 
lnfd � 1   � ���
�� 
lnfd � m   � � � � � � � � I M P O R T A N T :   B e f o r e   r u n n i n g   t h i s   a p p l e t ,   p l e a s e   m a k e   s u r e   t h a t   i n   t h e   D i c a t a t i o n   &   S p e e c h   s y s t e m   p r e f e r e n c e   p a n e : � 1   � ���
�� 
lnfd � 1   � ���
�� 
lnfd � 1   � ���
�� 
tab  � m   � � � � � � � f "   T h e    U s e   e n h a n c e d   d i c t a t i o n    c h e c k b o x   i s   s e l e c t e d � 1   � ���
�� 
lnfd � 1   � ���
�� 
tab  � m   � � � � � � � 2 "   D i c t a t i o n   i s   s e t   t o   o f f � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � � ( O p e n   P r e f e r e n c e   P a n e �  ��� � m   � � � � � � �  C a n c e l��   � �� ���
�� 
dflt � m   � ����� ��   �  � � � Z   �N � ��� � � @  � � � � � l  � � ����� � e   � � � � n   � � � � � 1   � ���
�� 
sisv � l  � � ����� � e   � � � � I  � �������
�� .sysosigtsirr   ��� null��  ��  ��  ��  ��  ��   � m   � � � � � � � 
 1 0 . 1 2 � O   �  � � � k   � �  � � � I ������
�� .miscactvnull��� ��� null��  ��   �  ��� � I 	�� ���
�� .miscmvisnull���     **** � n  	 � � � 4  �� �
�� 
xppa � m   � � � � �  D i c t a t i o n � 5  	�� ���
�� 
xppb � m   � � � � � 6 c o m . a p p l e . p r e f e r e n c e . s p e e c h
�� kfrmID  ��  ��   � 5   � �� ��
�� 
capp � m   � � � � � � � 6 c o m . a p p l e . s y s t e m p r e f e r e n c e s
� kfrmID  ��   � O  #N � � � k  1M � �  � � � I 16�~�}�|
�~ .miscactvnull��� ��� null�}  �|   �  ��{ � I 7M�z ��y
�z .miscmvisnull���     **** � n  7I � � � 4  BI�x �
�x 
xppa � m  EH � � � � �  D i c t a t i o n � 5  7B�w ��v
�w 
xppb � m  ;> � � � � � 6 c o m . a p p l e . p r e f e r e n c e . s p e e c h
�v kfrmID  �y  �{   � 5  #.�u ��t
�u 
capp � m  '* � � �   6 c o m . a p p l e . s y s t e m p r e f e r e n c e s
�t kfrmID   � �s R  OY�r�q
�r .ascrerr ****      � ****�q   �p�o
�p 
errn m  SV�n�n���o  �s  ��  ��   �  l ^^�m�l�k�m  �l  �k    l ^^�j	�j     GET THE PLIST FILE   	 �

 &   G E T   T H E   P L I S T   F I L E  Q  ^� k  a�  r  al l ah�i�h I ah�g�f
�g .sysoexecTEXT���     TEXT m  ad � � d e f a u l t s   r e a d   c o m . N y t h h a w k P r o d u c t i o n s . C u s t o m C o m m a n d s P l i s t   i n s t a l l L o c a t i o n�f  �i  �h   o      �e�e 0 apath aPath  Z m��d�c = mt o  mp�b�b 0 apath aPath m  ps �    n o t s t o r e d R  w}�a!�`
�a .ascrerr ****      � ****! m  y|"" �##  A S K _ F O R _ F I L E�`  �d  �c   $�_$ Z  ��%&�^'% = ��()( I  ���]*�\�] .0 checkforitemexistence checkForItemExistence* +�[+ o  ���Z�Z 0 apath aPath�[  �\  ) m  ���Y
�Y boovtrue& r  ��,-, o  ���X�X 0 apath aPath- o      �W�W 0 plistfilepath plistFilePath�^  ' R  ���V.�U
�V .ascrerr ****      � ****. m  ��// �00  A S K _ F O R _ F I L E�U  �_   R      �T�S�R
�T .ascrerr ****      � ****�S  �R   k  ��11 232 I ���Q�P�O
�Q .miscactvnull��� ��� null�P  �O  3 454 r  ��676 l ��8�N�M8 I ���L�K9
�L .sysostdfalis    ��� null�K  9 �J:;
�J 
prmp: m  ��<< �== t P l e a s e   l o c a t e   a n d   s e l e c t   t h e    C u s t o m   C o m m a n d s . p l i s t    f i l e :; �I>�H
�I 
ftyp> m  ��?? �@@ . c o m . a p p l e . p r o p e r t y - l i s t�H  �N  �M  7 o      �G�G 0 	plistfile 	plistFile5 A�FA r  ��BCB l ��D�E�DD n  ��EFE 1  ���C
�C 
psxpF o  ���B�B 0 	plistfile 	plistFile�E  �D  C o      �A�A 0 plistfilepath plistFilePath�F   GHG l ���@�?�>�@  �?  �>  H IJI l ���=KL�=  K !  BUILD THE FILE AND SCRIPTS   L �MM 6   B U I L D   T H E   F I L E   A N D   S C R I P T SJ N�<N I  ���;O�:�; 0 buildcommands buildCommandsO P�9P o  ���8�8 0 plistfilepath plistFilePath�9  �:  �<    QRQ l     �7�6�5�7  �6  �5  R STS i   + .UVU I      �4W�3�4 0 buildcommands buildCommandsW X�2X o      �1�1 20 commandoutlineplistpath commandOutlinePlistPath�2  �3  V Q    XYZ[Y k   +\\ ]^] l    �0_`�0  _   SETUP    ` �aa    S E T U P  ^ bcb r    ded l   f�/�.f n    ghg 1   
 �-
�- 
psxph l   
i�,�+i I   
�*jk
�* .earsffdralis        afdrj m    �)
�) afdrscr�k �(l�'
�( 
froml m    �&
�& fldmfldu�'  �,  �+  �/  �.  e o      �%�% &0 scriptsfolderpath scriptsFolderPathc mnm r    opo b    qrq o    �$�$ &0 scriptsfolderpath scriptsFolderPathr m    ss �tt & D i c t a t i o n   C o m m a n d s /p o      �#�# 20 defaultscriptfolderpath defaultScriptFolderPathn uvu I    �"w�!�" 0 createfolder createFolderw x� x o    �� 20 defaultscriptfolderpath defaultScriptFolderPath�   �!  v yzy Z   /{|��{ o    !�� 0 
uselogging 
useLogging| n  $ +}~} I   % +��� 0 nslog NSLog ��� m   % &�� ���  % @� ��� o   & '�� 20 defaultscriptfolderpath defaultScriptFolderPath�  �  ~ m   $ %�
� misccura�  �  z ��� l  0 0����  �  �  � ��� l   0 0����  �   BUILD    � ���    B U I L D  � ��� l  0 0����  � $  read the source property list   � ��� <   r e a d   t h e   s o u r c e   p r o p e r t y   l i s t� ��� r   0 ;��� n  0 9��� I   4 9���� >0 dictionarywithcontentsoffile_ dictionaryWithContentsOfFile_� ��� o   4 5�� 20 commandoutlineplistpath commandOutlinePlistPath�  �  � n  0 4��� 4   1 4��
� 
pcls� m   2 3�� ���  N S D i c t i o n a r y� m   0 1�
� misccura� o      �� $0 sourcedictionary sourceDictionary� ��� l  < <�
���
  � > 8 create an empty dictionary for the new preferences file   � ��� p   c r e a t e   a n   e m p t y   d i c t i o n a r y   f o r   t h e   n e w   p r e f e r e n c e s   f i l e� ��� r   < E��� l  < C��	�� n  < C��� I   ? C���� 0 new  �  �  � n  < ?��� o   = ?�� *0 nsmutabledictionary NSMutableDictionary� m   < =�
� misccura�	  �  � o      �� 0 
masterdict 
masterDict� ��� l  F F����  � , & get a list of the command identifiers   � ��� L   g e t   a   l i s t   o f   t h e   c o m m a n d   i d e n t i f i e r s� ��� r   F Q��� c   F O��� l  F K�� ��� n  F K��� I   G K�������� 0 allkeys allKeys��  ��  � o   F G���� $0 sourcedictionary sourceDictionary�   ��  � m   K N��
�� 
list� o      ���� &0 commandcategories commandCategories� ��� I  R W�����
�� .ascrcmnt****      � ****� o   R S���� &0 commandcategories commandCategories��  � ��� r   X e��� n  X c��� I   Y c������� :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_� ��� J   Y ^�� ���� m   Y \�� ���  *��  � ���� o   ^ _���� &0 commandcategories commandCategories��  ��  �  g   X Y� o      ���� &0 commandcategories commandCategories� ��� I  f k�����
�� .ascrcmnt****      � ****� o   f g���� &0 commandcategories commandCategories��  � ��� l  l l������  � 8 2 get the count of the source property list entries   � ��� d   g e t   t h e   c o u n t   o f   t h e   s o u r c e   p r o p e r t y   l i s t   e n t r i e s� ��� r   l s��� I  l q�����
�� .corecnte****       ****� o   l m���� &0 commandcategories commandCategories��  � o      ���� 00 commandcategoriescount commandCategoriesCount� ��� Y   t��������� k   ~��� ��� r   ~ ���� n   ~ ���� 4    ����
�� 
cobj� o   � ����� 0 i  � o   ~ ���� &0 commandcategories commandCategories� o      ���� 0 acategoryname aCategoryName� ��� I  � ������
�� .ascrcmnt****      � ****� o   � ����� 0 acategoryname aCategoryName��  � ��� r   � ���� l  � ������� n  � ���� I   � �������� 0 valueforkey_ valueForKey_� ���� o   � ����� 0 acategoryname aCategoryName��  ��  � o   � ����� $0 sourcedictionary sourceDictionary��  ��  � o      ���� *0 acategorydictionary aCategoryDictionary� ��� r   � ���� c   � ���� l  � ������� n  � ���� I   � ��������� 0 allkeys allKeys��  ��  � o   � ����� *0 acategorydictionary aCategoryDictionary��  ��  � m   � ���
�� 
list� o      ���� "0 acategorytopics aCategoryTopics� ��� r   � ���� l  � ������� n  � �� � I   � ������� :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_  J   � � �� m   � � �  *��   �� o   � ����� "0 acategorytopics aCategoryTopics��  ��     g   � ���  ��  � o      ���� "0 acategorytopics aCategoryTopics� 	
	 I  � �����
�� .ascrcmnt****      � **** o   � ����� "0 acategorytopics aCategoryTopics��  
 �� Y   ������ k   ��  r   � � n   � � 4   � ���
�� 
cobj o   � ����� 0 q   o   � ����� "0 acategorytopics aCategoryTopics o      ����  0 acategorytopic aCategoryTopic  I  � �����
�� .ascrcmnt****      � **** o   � �����  0 acategorytopic aCategoryTopic��    r   � � l  � ����� n  � � !  I   � ���"���� 0 valueforkey_ valueForKey_" #��# o   � �����  0 acategorytopic aCategoryTopic��  ��  ! o   � ����� *0 acategorydictionary aCategoryDictionary��  ��   o      ���� $0 atopicdictionary aTopicDictionary $%$ I  � ���&��
�� .ascrcmnt****      � ****& o   � ����� $0 atopicdictionary aTopicDictionary��  % '(' r   � �)*) c   � �+,+ l  � �-����- n  � �./. I   � ��������� 0 allkeys allKeys��  ��  / o   � ����� $0 atopicdictionary aTopicDictionary��  ��  , m   � ���
�� 
list* o      ����  0 atopiccommands aTopicCommands( 010 r   � �232 l  � �4����4 n  � �565 I   � ���7���� :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_7 898 J   � �:: ;��; m   � �<< �==  *��  9 >��> o   � �����  0 atopiccommands aTopicCommands��  ��  6  g   � ���  ��  3 o      ����  0 atopiccommands aTopicCommands1 ?@? r   �ABA l  �C����C I  ���D��
�� .corecnte****       ****D o   � �����  0 atopiccommands aTopicCommands��  ��  ��  B o      ���� *0 atopiccommandscount aTopicCommandsCount@ EFE r  GHG o  ���� *0 atopiccommandscount aTopicCommandsCountH 1  
��
�� 
ppgtF I��I Y  �J��KL��J k  �MM NON r  &PQP n  "RSR 4  "��T
�� 
cobjT o  !���� 0 w  S o  ����  0 atopiccommands aTopicCommandsQ o      ���� 0 acommand aCommandO UVU l ''��WX��  W , & get the property list for the command   X �YY L   g e t   t h e   p r o p e r t y   l i s t   f o r   t h e   c o m m a n dV Z[Z r  '3\]\ l '/^����^ n '/_`_ I  (/��a���� 0 valueforkey_ valueForKey_a b��b o  (+���� 0 acommand aCommand��  ��  ` o  '(���� $0 atopicdictionary aTopicDictionary��  ��  ] o      ���� (0 acommanddictionary aCommandDictionary[ cdc r  4Wefe l 4Qg����g b  4Qhih b  4Kjkj b  4Glml b  4?non b  4;pqp b  49rsr o  45���� 0 acategoryname aCategoryNames m  58tt �uu    :  q o  9:����  0 acategorytopic aCategoryTopico m  ;>vv �ww    :  m l ?Fx����x c  ?Fyzy o  ?B���� 0 w  z m  BE�
� 
TEXT��  ��  k m  GJ{{ �||    o f  i l KP}�~�}} c  KP~~ o  KL�|�| *0 atopiccommandscount aTopicCommandsCount m  LO�{
�{ 
TEXT�~  �}  ��  ��  f 1  QV�z
�z 
ppgdd ��� l XX�y���y  � $  create a new blank dictionary   � ��� <   c r e a t e   a   n e w   b l a n k   d i c t i o n a r y� ��� l XX�x���x  � 1 + create a dictionary for the custom command   � ��� V   c r e a t e   a   d i c t i o n a r y   f o r   t h e   c u s t o m   c o m m a n d� ��� r  Xc��� l X_��w�v� n X_��� I  [_�u�t�s�u 0 new  �t  �s  � n X[��� o  Y[�r�r *0 nsmutabledictionary NSMutableDictionary� m  XY�q
�q misccura�w  �v  � o      �p�p (0 customcommandsdict CustomCommandsDict� ��� l dd�o���o  �   add the CustomType element   � ��� 4 a d d   t h e   C u s t o m T y p e   e l e m e n t� ��� l dq��n�m� n dq��� I  gq�l��k�l &0 setobject_forkey_ setObject_forKey_� ��� m  gj�� ���  F i l e� ��j� m  jm�� ���  C u s t o m T y p e�j  �k  � o  dg�i�i (0 customcommandsdict CustomCommandsDict�n  �m  � ��� l rr�h���h  � &  add the CustomModifyDate element   � ��� @ a d d   t h e   C u s t o m M o d i f y D a t e   e l e m e n t� ��� l r���g�f� n r���� I  u��e��d�e &0 setobject_forkey_ setObject_forKey_� ��� l u~��c�b� n u~��� I  z~�a�`�_�a 0 date  �`  �_  � n uz��� o  vz�^�^ 0 nsdate NSDate� m  uv�]
�] misccura�c  �b  � ��\� m  ~��� ���   C u s t o m M o d i f y D a t e�\  �d  � o  ru�[�[ (0 customcommandsdict CustomCommandsDict�g  �f  � ��� l ���Z���Z  �   get the scope   � ���    g e t   t h e   s c o p e� ��� r  ����� l ����Y�X� n ����� I  ���W��V�W 0 valueforkey_ valueForKey_� ��U� m  ���� ���  C u s t o m S c o p e�U  �V  � o  ���T�T (0 acommanddictionary aCommandDictionary�Y  �X  � o      �S�S 0 customscope CustomScope� ��� Z �����R�Q� o  ���P�P 0 
uselogging 
useLogging� n ����� I  ���O��N�O 0 nslog NSLog� ��� m  ���� ���  % @� ��M� o  ���L�L 0 customscope CustomScope�M  �N  � m  ���K
�K misccura�R  �Q  � ��� l ���J���J  �   set the scope   � ���    s e t   t h e   s c o p e� ��� l ����I�H� n ����� I  ���G��F�G &0 setobject_forkey_ setObject_forKey_� ��� o  ���E�E 0 customscope CustomScope� ��D� m  ���� ���  C u s t o m S c o p e�D  �F  � o  ���C�C (0 customcommandsdict CustomCommandsDict�I  �H  � ��� l ���B���B  �   get the commands   � ��� "   g e t   t h e   c o m m a n d s� ��� r  ����� l ����A�@� n ����� I  ���?��>�? 0 valueforkey_ valueForKey_� ��=� m  ���� ���  C u s t o m C o m m a n d s�=  �>  � o  ���<�< (0 acommanddictionary aCommandDictionary�A  �@  � o      �;�; 0 commandarray commandArray� ��� r  ����� l ����:�9� n ����� I  ���8�7�6�8 0 new  �7  �6  � n ����� o  ���5�5 *0 nsmutabledictionary NSMutableDictionary� m  ���4
�4 misccura�:  �9  � o      �3�3 0 commandsdict commandsDict� � � l ���2�1 n �� I  ���0�/�0 &0 setobject_forkey_ setObject_forKey_  o  ���.�. 0 commandarray commandArray �- m  �� �		 
 e n _ U S�-  �/   o  ���,�, 0 commandsdict commandsDict�2  �1    

 l ���+�+     set the commands    � "   s e t   t h e   c o m m a n d s  l ���*�) n �� I  ���(�'�( &0 setobject_forkey_ setObject_forKey_  o  ���&�& 0 commandsdict commandsDict �% m  �� �  C u s t o m C o m m a n d s�%  �'   o  ���$�$ (0 customcommandsdict CustomCommandsDict�*  �)    l ���#�#     get the script file name    � 2   g e t   t h e   s c r i p t   f i l e   n a m e   r  � !"! l ��#�"�!# n ��$%$ I  ��� &��  0 valueforkey_ valueForKey_& '�' m  ��(( �))  S c r i p t F i l e N a m e�  �  % o  ���� (0 acommanddictionary aCommandDictionary�"  �!  " o      �� ,0 customscriptfilename CustomScriptFileName  *+* Z ,-��, o  �� 0 
uselogging 
useLogging- n 	./. I  
�0�� 0 nslog NSLog0 121 m  
33 �44  % @2 5�5 o  �� ,0 customscriptfilename CustomScriptFileName�  �  / m  	
�
� misccura�  �  + 676 l �89�  8   add the script file name   9 �:: 2   a d d   t h e   s c r i p t   f i l e   n a m e7 ;<; r  +=>= l '?��? n '@A@ I  '�B�� "0 arraywitharray_ arrayWithArray_B C�C J  #DD E�E o  !�� ,0 customscriptfilename CustomScriptFileName�  �  �  A n FGF o  �� 0 nsarray NSArrayG m  �

�
 misccura�  �  > o      �	�	 *0 scriptfilenamearray scriptFileNameArray< HIH l ,9J��J n ,9KLK I  /9�M�� &0 setobject_forkey_ setObject_forKey_M NON o  /2�� *0 scriptfilenamearray scriptFileNameArrayO P�P m  25QQ �RR $ C u s t o m F i l e N a m e L i s t�  �  L o  ,/�� (0 customcommandsdict CustomCommandsDict�  �  I STS l ::�UV�  U 7 1 get the name of the folder containing the script   V �WW b   g e t   t h e   n a m e   o f   t h e   f o l d e r   c o n t a i n i n g   t h e   s c r i p tT XYX r  :HZ[Z l :D\� ��\ n :D]^] I  =D��_���� 0 valueforkey_ valueForKey__ `��` m  =@aa �bb & S c r i p t D i r e c t o r y N a m e��  ��  ^ o  :=���� (0 acommanddictionary aCommandDictionary�   ��  [ o      ���� *0 scriptdirectoryname ScriptDirectoryNameY cdc Z I`ef����e o  IN���� 0 
uselogging 
useLoggingf n Q\ghg I  R\��i���� 0 nslog NSLogi jkj m  RUll �mm  % @k n��n o  UX���� *0 scriptdirectoryname ScriptDirectoryName��  ��  h m  QR��
�� misccura��  ��  d opo l aa��qr��  q 2 , create the relative path to the script file   r �ss X   c r e a t e   t h e   r e l a t i v e   p a t h   t o   t h e   s c r i p t   f i l ep tut r  azvwv b  avxyx b  anz{z b  aj|}| o  ab���� 20 defaultscriptfolderpath defaultScriptFolderPath} l bi~����~ c  bi� o  be���� *0 scriptdirectoryname ScriptDirectoryName� m  eh��
�� 
ctxt��  ��  { m  jm�� ���  /y l nu������ c  nu��� o  nq���� ,0 customscriptfilename CustomScriptFileName� m  qt��
�� 
ctxt��  ��  w o      ����  0 scriptfilepath scriptFilePathu ��� Z {�������� o  {����� 0 
uselogging 
useLogging� n ����� I  ��������� 0 nslog NSLog� ��� m  ���� ���  % @� ���� o  ������  0 scriptfilepath scriptFilePath��  ��  � m  ����
�� misccura��  ��  � ��� l ��������  � 0 * write the trigger script to a script file   � ��� T   w r i t e   t h e   t r i g g e r   s c r i p t   t o   a   s c r i p t   f i l e� ��� I  ��������� 60 createfoldernamedinfolder createFolderNamedInFolder� ��� o  ������ *0 scriptdirectoryname ScriptDirectoryName� ���� o  ������ 20 defaultscriptfolderpath defaultScriptFolderPath��  ��  � ��� r  ����� c  ����� l �������� n ����� I  ��������� 0 valueforkey_ valueForKey_� ���� m  ���� ���  S c r i p t L a n g u a g e��  ��  � o  ������ (0 acommanddictionary aCommandDictionary��  ��  � m  ����
�� 
ctxt� o      ����  0 scriptlanguage scriptLanguage� ��� Z  �������� = ����� o  ������  0 scriptlanguage scriptLanguage� m  ���� ���  J a v a S c r i p t� r  ����� m  ���� ���  J a v a S c r i p t� o      ����  0 scriptlanguage scriptLanguage��  � r  ����� m  ���� ���  A p p l e S c r i p t� o      ����  0 scriptlanguage scriptLanguage� ��� r  ����� c  ����� l �������� n ����� I  ��������� 0 valueforkey_ valueForKey_� ���� m  ���� ���  S c r i p t T e x t��  ��  � o  ������ (0 acommanddictionary aCommandDictionary��  ��  � m  ����
�� 
ctxt� o      ���� 0 
scripttext 
scriptText� ��� Z ��������� o  ������ 0 
uselogging 
useLogging� n ����� I  ��������� 0 nslog NSLog� ��� m  ���� ���  % @� ���� o  ������ 0 
scripttext 
scriptText��  ��  � m  ����
�� misccura��  ��  � ��� I �2�����
�� .sysoexecTEXT���     TEXT� l �.������ b  �.��� b  �*��� b  �"��� b  ���� b  ���� b  ���� b  ���� b  �
��� b  ���� b  ���� b  ����� m  ���� ���  o s a c o m p i l e� 1  ����
�� 
spac� m  ��� ���  - l� 1  ��
�� 
spac� o  	����  0 scriptlanguage scriptLanguage� 1  
��
�� 
spac� m  �� ���  - e� 1  ��
�� 
spac� l ������ n  ��� 1  ��
�� 
strq� o  ���� 0 
scripttext 
scriptText��  ��  � m  !�� ���    - o  � l ")������ n  ")��� 1  %)��
�� 
strq� o  "%����  0 scriptfilepath scriptFilePath��  ��  � m  *-�� ���    - d��  ��  ��  � ��� l 33�� ��    = 7 generate and add the bookmark data for the script file    � n   g e n e r a t e   a n d   a d d   t h e   b o o k m a r k   d a t a   f o r   t h e   s c r i p t   f i l e�  r  3C l 3?���� n 3?	 I  8?��
���� &0 stringwithstring_ stringWithString_
 �� o  8;����  0 scriptfilepath scriptFilePath��  ��  	 n 38 o  48���� 0 nsstring NSString m  34��
�� misccura��  ��   o      ����  0 scriptfilepath scriptFilePath  r  DO n DK o  GK���� <0 stringbyexpandingtildeinpath stringByExpandingTildeInPath o  DG����  0 scriptfilepath scriptFilePath o      ����  0 scriptfilepath scriptFilePath  r  P\ l PX���� n PX I  QX������ *0 getbookmarkdatafor_ getBookmarkDataFor_ �� o  QT����  0 scriptfilepath scriptFilePath��  ��    g  PQ��  ��   o      ���� 00 scriptfilebookmarkdata scriptFileBookmarkData  r  ]j  n ]f!"! I  bf�������� 0 new  ��  ��  " n ]b#$# o  ^b����  0 nsmutablearray NSMutableArray$ m  ]^��
�� misccura  o      ���� 0 anarray anArray %&% l ku'����' n ku()( I  nu��*���� 0 
addobject_ 
addObject_* +��+ o  nq���� 00 scriptfilebookmarkdata scriptFileBookmarkData��  ��  ) o  kn���� 0 anarray anArray��  ��  & ,-, l v�.����. n v�/0/ I  y���1���� &0 setobject_forkey_ setObject_forKey_1 232 o  y|���� 0 anarray anArray3 4��4 m  |55 �66 $ C u s t o m B o o k m a r k L i s t��  ��  0 o  vy���� (0 customcommandsdict CustomCommandsDict��  ��  - 787 l ����9:��  9 I C add the created custom command dictionary to the master dictionary   : �;; �   a d d   t h e   c r e a t e d   c u s t o m   c o m m a n d   d i c t i o n a r y   t o   t h e   m a s t e r   d i c t i o n a r y8 <=< r  ��>?> I  ���������� &0 generatecommandid generateCommandID��  ��  ? o      �� 0 	commandid 	commandID= @A@ l ���~BC�~  B #  add to the master dictionary   C �DD :   a d d   t o   t h e   m a s t e r   d i c t i o n a r yA EFE l ��G�}�|G n ��HIH I  ���{J�z�{ &0 setobject_forkey_ setObject_forKey_J KLK o  ���y�y (0 customcommandsdict CustomCommandsDictL M�xM o  ���w�w 0 	commandid 	commandID�x  �z  I o  ���v�v 0 
masterdict 
masterDict�}  �|  F N�uN r  ��OPO o  ���t�t 0 w  P 1  ���s
�s 
ppgc�u  �� 0 w  K m  �r�r L I �qQ�p
�q .corecnte****       ****Q o  �o�o  0 atopiccommands aTopicCommands�p  ��  ��  �� 0 q   m   � ��n�n  I  � ��mR�l
�m .corecnte****       ****R o   � ��k�k "0 acategorytopics aCategoryTopics�l  ��  ��  �� 0 i  � m   w x�j�j � o   x y�i�i 00 commandcategoriescount commandCategoriesCount��  � STS l ���h�g�f�h  �g  �f  T UVU l ���eWX�e  W A ; write the master dictionary to a binary property list file   X �YY v   w r i t e   t h e   m a s t e r   d i c t i o n a r y   t o   a   b i n a r y   p r o p e r t y   l i s t   f i l eV Z[Z r  ��\]\ m  ��^^ �__ � ~ / D e s k t o p / c o m . a p p l e . s p e e c h . r e c o g n i t i o n . A p p l e S p e e c h R e c o g n i t i o n . C u s t o m C o m m a n d s . p l i s t] o      �d�d 40 preferencefileoutputpath preferenceFileOutputPath[ `a` n ��bcb I  ���cd�b�c *0 storerecord_inpath_ storeRecord_inPath_d efe o  ���a�a 0 
masterdict 
masterDictf g�`g o  ���_�_ 40 preferencefileoutputpath preferenceFileOutputPath�`  �b  c  g  ��a hih l ���^�]�\�^  �]  �\  i jkj n ��lml I  ���[n�Z�[ 0 
openfolder 
openFoldern o�Yo l ��p�X�Wp I ���Vqr
�V .earsffdralis        afdrq m  ���U
�U afdmprefr �Ts�S
�T 
froms m  ���R
�R fldmfldu�S  �X  �W  �Y  �Z  m  f  ��k tut I ���Qv�P
�Q .sysodelanull��� ��� nmbrv m  ��ww ?�      �P  u xyx n ��z{z I  ���O|�N�O  0 revealinfinder revealInFinder| }�M} o  ���L�L 40 preferencefileoutputpath preferenceFileOutputPath�M  �N  {  f  ��y ~�K~ O  �+� k  �*�� ��� I ���J�I�H
�J .miscactvnull��� ��� null�I  �H  � ��G� I �*�F��
�F .sysodlogaskr        TEXT� b  ���� b  ���� b  ���� b  ���� b  ���� b  ���� b  � ��� b  ����� b  ����� m  ���� ��� @ T h e   b u i l d   p r o c e s s   h a s   c o m p l e t e d .� 1  ���E
�E 
lnfd� 1  ���D
�D 
lnfd� m  ���� ��� : T o   a c t i v a t e   t h e   n e w   c o m m a n d s :� 1   �C
�C 
lnfd� 1  �B
�B 
lnfd� m  �� ��� 1 )   M o v e   t h e   s e l e c t e d   p l i s t   f i l e   i n   t h e   D e s k t o p   f o l d e r   i n t o   t h e   P r e f e r e n c e s   f o l d e r   ( n o w   o p e n   o n   t h e   d e s k t o p )   r e p l a c i n g   a n y   e x i s t i n g   f i l e .� 1  �A
�A 
lnfd� 1  �@
�@ 
lnfd� m  �� ��� � 2 )   T u r n   D i c t a t i o n   o n   i n   t h e   D i c t a t i o n   &   S p e e c h   s y s t e m   p r e f e r e n c e   p a n e .� �?��
�? 
btns� J   �� ��>� m  �� ���  O K�>  � �=��<
�= 
dflt� m  #$�;�; �<  �G  � m  �����                                                                                  MACS  alis    4  System                     �i��BD ����
Finder.app                                                     �����i��        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    S y s t e m  &System/Library/CoreServices/Finder.app  / ��  �K  Z R      �:��
�: .ascrerr ****      � ****� o      �9�9 0 errormessage errorMessage� �8��7
�8 
errn� o      �6�6 0 errornumber errorNumber�7  [ Z  3X���5�4� > 3:��� o  36�3�3 0 errornumber errorNumber� m  69�2�2��� k  =T�� ��� I =B�1�0�/
�1 .miscactvnull��� ��� null�0  �/  � ��.� I CT�-��
�- .sysodisAaleR        TEXT� b  CJ��� m  CF�� ���  E R R O R :  � o  FI�,�, 0 errornumber errorNumber� �+��*
�+ 
mesS� o  MP�)�) 0 errormessage errorMessage�*  �.  �5  �4  T ��� l     �(�'�&�(  �'  �&  � ��� i   / 2��� I      �%��$�% :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_� ��� o      �#�# 	0 list2  � ��"� o      �!�! 	0 list1  �"  �$  � k     %�� ��� r     
��� n    ��� I    � ���  0 setwitharray_ setWithArray_� ��� o    �� 	0 list2  �  �  � n    ��� o    �� 0 nsset NSSet� m     �
� misccura� o      �� 0 set2  � ��� r    ��� n   ��� I    ���� 0 setwitharray_ setWithArray_� ��� o    �� 	0 list1  �  �  � n   ��� o    �� 0 nsmutableset NSMutableSet� m    �
� misccura� o      �� 0 set1  � ��� n   ��� I    ���� 0 	minusset_ 	minusSet_� ��� o    �� 0 set2  �  �  � o    �� 0 set1  � ��� L    %�� c    $��� l   "���� n   "��� I    "�
�	��
 0 
allobjects 
allObjects�	  �  � o    �� 0 set1  �  �  � m   " #�
� 
list�  � ��� l     ����  �  �  � ��� i   3 6��� I      ��� � &0 generatecommandid generateCommandID�  �   � k     �� ��� l     ������  �   delay 0.25   � ���    d e l a y   0 . 2 5� ��� r     ��� n    ��� I    �������� 40 cfabsolutetimegetcurrent CFAbsoluteTimeGetCurrent��  ��  � m     ��
�� misccura� o      ���� 0 x  � ��� n   ��� I    ������� &0 stringwithformat_ stringWithFormat_� ��� m       �  C u s t o m . % @� �� o    ���� 0 x  ��  ��  � n    o   	 ���� 0 nsstring NSString m    	��
�� misccura� �� L     l   ���� c    	 1    ��
�� 
rslt	 m    ��
�� 
ctxt��  ��  ��  � 

 l     ��������  ��  ��    i   7 : I      ������ *0 getbookmarkdatafor_ getBookmarkDataFor_ �� o      ���� 0 apath aPath��  ��   k     #  r      n    	 I    	������ $0 fileurlwithpath_ fileURLWithPath_ �� o    ���� 0 apath aPath��  ��   n     4    ��
�� 
pcls m     � 
 N S U R L m     ��
�� misccura o      ���� 0 theurl theURL  !  r    "#" l   $����$ c    %&% l   '����' n   ()( o    ���� L0 $nsurlbookmarkcreationminimalbookmark $NSURLBookmarkCreationMinimalBookmark) m    ��
�� misccura��  ��  & m    ��
�� 
long��  ��  # o      ���� 0 
theoptions 
theOptions! *+* l   ��,-��  , � � set bookmarkData to theURL's bookmarkDataWithOptions:theOptions includingResourceValuesForKeys:{} relativeToURL:(missing value) |error|:(missing value)   - �..0   s e t   b o o k m a r k D a t a   t o   t h e U R L ' s   b o o k m a r k D a t a W i t h O p t i o n s : t h e O p t i o n s   i n c l u d i n g R e s o u r c e V a l u e s F o r K e y s : { }   r e l a t i v e T o U R L : ( m i s s i n g   v a l u e )   | e r r o r | : ( m i s s i n g   v a l u e )+ /0/ r     121 n   343 I    ��5���� �0 Kbookmarkdatawithoptions_includingresourcevaluesforkeys_relativetourl_error_ KbookmarkDataWithOptions_includingResourceValuesForKeys_relativeToURL_error_5 676 m    ����  7 898 J    ����  9 :;: l   <����< m    ��
�� 
msng��  ��  ; =��= l   >����> m    ��
�� 
msng��  ��  ��  ��  4 o    ���� 0 theurl theURL2 o      ���� 0 bookmarkdata bookmarkData0 ?��? L   ! #@@ o   ! "���� 0 bookmarkdata bookmarkData��   ABA l     ��������  ��  ��  B CDC i   ; >EFE I      ��G���� *0 storerecord_inpath_ storeRecord_inPath_G HIH o      ���� 0 	therecord 	theRecordI J��J o      ���� 0 thepath thePath��  ��  F k     0KK LML r     
NON n    PQP I    ��R���� &0 stringwithstring_ stringWithString_R S��S o    ���� 0 thepath thePath��  ��  Q n    TUT o    ���� 0 nsstring NSStringU m     ��
�� misccuraO o      ���� 0 thepath thePathM VWV r    XYX n   Z[Z I    �������� <0 stringbyexpandingtildeinpath stringByExpandingTildeInPath��  ��  [ o    ���� 0 thepath thePathY o      ���� 0 thepath thePathW \]\ r    "^_^ n    `a` I     ��b���� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_b cdc o    ���� 0 	therecord 	theRecordd efe l   g����g n   hih o    ���� B0 nspropertylistbinaryformat_v1_0 NSPropertyListBinaryFormat_v1_0i m    ��
�� misccura��  ��  f jkj m    ����  k l��l l   m����m m    ��
�� 
msng��  ��  ��  ��  a n   non o    ���� :0 nspropertylistserialization NSPropertyListSerializationo m    ��
�� misccura_ o      ���� 0 thedata theData] pqp n  # *rsr I   $ *��t���� 20 writetofile_atomically_ writeToFile_atomically_t uvu o   $ %���� 0 thepath thePathv w��w m   % &��
�� boovtrue��  ��  s o   # $���� 0 thedata theDataq x��x l  + 0yz{y I  + 0��|��
�� .ascrcmnt****      � ****| 1   + ,��
�� 
rslt��  z : 4 so we can see if it saved end saveRecord:toPlistAt:   { �}} h   s o   w e   c a n   s e e   i f   i t   s a v e d   e n d   s a v e R e c o r d : t o P l i s t A t :��  D ~~ l     ��������  ��  ��   ��� i   ? B��� I      ������� .0 replacestringinstring replaceStringInString� ��� o      ���� 0 
sourcetext 
sourceText� ��� o      ���� 0 searchstring searchString� ���� o      ���� &0 replacementstring replacementString��  ��  � k     �� ��� r     
��� n    ��� I    ������� &0 stringwithstring_ stringWithString_� ���� o    ���� 0 
sourcetext 
sourceText��  ��  � n    ��� o    ���� 0 nsstring NSString� m     ��
�� misccura� o      ���� 0 astring aString� ��� r    ��� l   ������ l   ������ n   ��� I    ������� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_� ��� o    ���� 0 searchstring searchString� ���� o    ���� &0 replacementstring replacementString��  ��  � o    ���� 0 astring aString��  ��  ��  ��  � o      ���� 0 resultstring resultString� ���� L    �� c    ��� o    �� 0 resultstring resultString� m    �~
�~ 
ctxt��  � ��� l     �}�|�{�}  �|  �{  � ��� l     �z���z  � �  Creates a new folder. There is no error if the folder already exists, and it will also create intermediate folders if required   � ��� �   C r e a t e s   a   n e w   f o l d e r .   T h e r e   i s   n o   e r r o r   i f   t h e   f o l d e r   a l r e a d y   e x i s t s ,   a n d   i t   w i l l   a l s o   c r e a t e   i n t e r m e d i a t e   f o l d e r s   i f   r e q u i r e d� ��� i   C F��� I      �y��x�y 60 createfoldernamedinfolder createFolderNamedInFolder� ��� o      �w�w 0 proposedname proposedName� ��v� o      �u�u 0 folderorpath folderOrPath�v  �x  � k     q�� ��� r     ��� n    ��� I    �t��s�t 00 makeurlfromfileorpath_ makeURLFromFileOrPath_� ��r� o    �q�q 0 folderorpath folderOrPath�r  �s  �  f     � o      �p�p 0 thefolderurl theFolderURL� ��� Z  	 ���o�n� =  	 ��� n   	 ��� m   
 �m
�m 
pcls� o   	 
�l�l 0 proposedname proposedName� m    �k
�k 
ctxt� r    ��� n   ��� I    �j��i�j &0 stringwithstring_ stringWithString_� ��h� o    �g�g 0 proposedname proposedName�h  �i  � n   ��� o    �f�f 0 nsstring NSString� m    �e
�e misccura� o      �d�d 0 proposedname proposedName�o  �n  � ��� r     )��� n    '��� I   ! '�c��b�c d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_� ��� m   ! "�� ���  /� ��a� m   " #�� ���  :�a  �b  � o     !�`�` 0 proposedname proposedName� o      �_�_ 0 proposedname proposedName� ��� r   * 2��� n  * 0��� I   + 0�^��]�^ <0 urlbyappendingpathcomponent_ URLByAppendingPathComponent_� ��\� o   + ,�[�[ 0 proposedname proposedName�\  �]  � o   * +�Z�Z 0 thefolderurl theFolderURL� o      �Y�Y 0 
thedesturl 
theDestURL� ��� r   3 <��� n  3 :��� I   6 :�X�W�V�X 0 defaultManager  �W  �V  � n  3 6��� o   4 6�U�U 0 nsfilemanager NSFileManager� m   3 4�T
�T misccura� o      �S�S  0 thefilemanager theFileManager� ��� r   = Y��� n  = F��� I   > F�R��Q�R �0 Bcreatedirectoryaturl_withintermediatedirectories_attributes_error_ BcreateDirectoryAtURL_withIntermediateDirectories_attributes_error_� ��� o   > ?�P�P 0 
thedesturl 
theDestURL� ��� m   ? @�O
�O boovtrue� ��� l  @ A��N�M� m   @ A�L
�L 
msng�N  �M  � ��K� l  A B��J�I� m   A B�H
�H 
obj �J  �I  �K  �Q  � o   = >�G�G  0 thefilemanager theFileManager� J      �� ��� o      �F�F 0 	theresult 	theResult� ��E� o      �D�D 0 theerror theError�E  � ��C� Z  Z q �B�A  H   Z ` l  Z _�@�? c   Z _ o   Z [�>�> 0 	theresult 	theResult m   [ ^�=
�= 
bool�@  �?   R   c m�<�;
�< .ascrerr ****      � **** l  e l�:�9 c   e l	 n  e j

 I   f j�8�7�6�8 0 localizedDescription  �7  �6   o   e f�5�5 0 theerror theError	 m   j k�4
�4 
ctxt�:  �9  �;  �B  �A  �C  �  l     �3�2�1�3  �2  �1    i   G J I      �0�/�0 0 createfolder createFolder �. o      �-�- 0 folderorpath folderOrPath�.  �/   k     A  r      n     I    �,�+�, 00 makeurlfromfileorpath_ makeURLFromFileOrPath_ �* o    �)�) 0 folderorpath folderOrPath�*  �+    f      o      �(�( 0 thefolderurl theFolderURL  r   	   n  	 !"! I    �'�&�%�' 0 defaultManager  �&  �%  " n  	 #$# o   
 �$�$ 0 nsfilemanager NSFileManager$ m   	 
�#
�# misccura  o      �"�"  0 thefilemanager theFileManager %&% r    +'(' n   )*) I    �!+� �! �0 Bcreatedirectoryaturl_withintermediatedirectories_attributes_error_ BcreateDirectoryAtURL_withIntermediateDirectories_attributes_error_+ ,-, o    �� 0 thefolderurl theFolderURL- ./. m    �
� boovtrue/ 010 l   2��2 m    �
� 
msng�  �  1 3�3 l   4��4 m    �
� 
obj �  �  �  �   * o    ��  0 thefilemanager theFileManager( J      55 676 o      �� 0 	theresult 	theResult7 8�8 o      �� 0 theerror theError�  & 9�9 Z  , A:;��: H   , 0<< l  , /=��= c   , />?> o   , -�� 0 	theresult 	theResult? m   - .�
� 
bool�  �  ; R   3 =�@�

� .ascrerr ****      � ****@ l  5 <A�	�A c   5 <BCB n  5 :DED I   6 :���� 0 localizedDescription  �  �  E o   5 6�� 0 theerror theErrorC m   : ;�
� 
ctxt�	  �  �
  �  �  �   FGF l     ��� �  �  �   G HIH l     ��JK��  J / ) This handler is called by other handlers   K �LL R   T h i s   h a n d l e r   i s   c a l l e d   b y   o t h e r   h a n d l e r sI MNM i   K NOPO I      ��Q���� 00 makeurlfromfileorpath_ makeURLFromFileOrPath_Q R��R o      ���� (0 thefileorpathinput theFileOrPathInput��  ��  P k     �SS TUT l     ��VW��  V 8 2 make it into a Cocoa object for easier comparison   W �XX d   m a k e   i t   i n t o   a   C o c o a   o b j e c t   f o r   e a s i e r   c o m p a r i s o nU YZY r     [\[ n     ]^] 4    ��_
�� 
cobj_ m   	 
���� ^ l    `����` n    aba I    ��c���� $0 arraywithobject_ arrayWithObject_c d��d o    ���� (0 thefileorpathinput theFileOrPathInput��  ��  b n    efe o    ���� 0 nsarray NSArrayf m     ��
�� misccura��  ��  \ o      ���� 0 thefileorpath theFileOrPathZ g��g Z    �hijkh c    lml l   n����n n   opo I    ��q����  0 iskindofclass_ isKindOfClass_q r��r l   s����s n   tut o    ���� 0 nsstring NSStringu m    ��
�� misccura��  ��  ��  ��  p o    ���� 0 thefileorpath theFileOrPath��  ��  m m    ��
�� 
booli Z    ]vwxyv c    #z{z l   !|����| n   !}~} I    !������ 0 
hasprefix_ 
hasPrefix_ ���� m    �� ���  /��  ��  ~ o    ���� 0 thefileorpath theFileOrPath��  ��  { m   ! "��
�� 
boolw l  & 0���� L   & 0�� n  & /��� I   * /������� $0 fileurlwithpath_ fileURLWithPath_� ���� o   * +���� 0 thefileorpath theFileOrPath��  ��  � n  & *��� 4   ' *���
�� 
pcls� m   ( )�� ��� 
 N S U R L� m   & '��
�� misccura�   full POSIX path   � ���     f u l l   P O S I X   p a t hx ��� c   3 ;��� l  3 9������ n  3 9��� I   4 9������� 0 
hasprefix_ 
hasPrefix_� ���� m   4 5�� ���  ~��  ��  � o   3 4���� 0 thefileorpath theFileOrPath��  ��  � m   9 :��
�� 
bool� ���� l  > L���� L   > L�� n  > K��� I   B K������� $0 fileurlwithpath_ fileURLWithPath_� ���� l  B G������ n  B G��� I   C G��������  0 stringByExpandingTildeInPath  ��  ��  � o   B C���� 0 thefileorpath theFileOrPath��  ��  ��  ��  � n  > B��� 4   ? B���
�� 
pcls� m   @ A�� ��� 
 N S U R L� m   > ?��
�� misccura� %  POSIX path needing ~ expansion   � ��� >   P O S I X   p a t h   n e e d i n g   ~   e x p a n s i o n��  y l  O ]���� L   O ]�� n  O \��� I   S \������� $0 fileurlwithpath_ fileURLWithPath_� ���� l  S X������ n   S X��� 1   T X��
�� 
psxp� o   S T���� (0 thefileorpathinput theFileOrPathInput��  ��  ��  ��  � n  O S��� 4   P S���
�� 
pcls� m   Q R�� ��� 
 N S U R L� m   O P��
�� misccura�   must be HFS path   � ��� "   m u s t   b e   H F S   p a t hj ��� c   ` m��� l  ` k������ n  ` k��� I   a k�������  0 iskindofclass_ isKindOfClass_� ���� l  a g������ n  a g��� 4   b g���
�� 
pcls� m   c f�� ��� 
 N S U R L� m   a b��
�� misccura��  ��  ��  ��  � o   ` a���� 0 thefileorpath theFileOrPath��  ��  � m   k l��
�� 
bool� ���� l  p r���� L   p r�� o   p q���� 0 thefileorpath theFileOrPath� . ( happens with files and aliases in 10.11   � ��� P   h a p p e n s   w i t h   f i l e s   a n d   a l i a s e s   i n   1 0 . 1 1��  k l  u ����� L   u ��� n  u ���� I   { �������� $0 fileurlwithpath_ fileURLWithPath_� ���� l  { ������� n   { ���� 1   | ���
�� 
psxp� o   { |���� (0 thefileorpathinput theFileOrPathInput��  ��  ��  ��  � n  u {��� 4   v {���
�� 
pcls� m   w z�� ��� 
 N S U R L� m   u v��
�� misccura�   must be a file or alias   � ��� 0   m u s t   b e   a   f i l e   o r   a l i a s��  N ��� l     ��������  ��  ��  � ��� i   O R��� I      �������  0 revealinfinder revealInFinder� ���� o      ���� 0 
theseitems 
theseItems��  ��  � k     `�� ��� l     ������  � D > convert passed file refs to POSIX paths and then to file URLs   � ��� |   c o n v e r t   p a s s e d   f i l e   r e f s   t o   P O S I X   p a t h s   a n d   t h e n   t o   f i l e   U R L s� ��� Z    ������� >    ��� l    ������ n     ��� m    ��
�� 
pcls� o     ���� 0 
theseitems 
theseItems��  ��  � m    ��
�� 
list� r    ��� c    ��� o    	���� 0 
theseitems 
theseItems� m   	 
��
�� 
list� o      ���� 0 
theseitems 
theseItems��  ��  �    r     J    ����   o      ���� 0 	theseurls 	theseURLs  Y    E���� k   % @		 

 r   % + n   % ) 4   & )��
�� 
cobj o   ' (���� 0 i   o   % &���� 0 
theseitems 
theseItems o      ���� 0 thisitem thisItem  r   , 4 n  , 2 I   - 2������ *0 getposixpathforitem getPOSIXPathForItem �� o   - .���� 0 thisitem thisItem��  ��    f   , - o      ���� &0 thisitemposixpath thisItemPOSIXPath �� r   5 @ l  5 =���� n  5 = I   8 =������ $0 fileurlwithpath_ fileURLWithPath_  �  o   8 9�~�~ &0 thisitemposixpath thisItemPOSIXPath�  ��   n  5 8!"! o   6 8�}�} 0 nsurl NSURL" m   5 6�|
�| misccura��  ��   l     #�{�z# n      $%$  ;   > ?% o   = >�y�y 0 	theseurls 	theseURLs�{  �z  ��  �� 0 i   m    �x�x  l    &�w�v& I    �u'�t
�u .corecnte****       ****' o    �s�s 0 
theseitems 
theseItems�t  �w  �v  ��   ()( l  F F�r*+�r  * "  reveal items in file viewer   + �,, 8   r e v e a l   i t e m s   i n   f i l e   v i e w e r) -.- O  F T/0/ r   L S121 I   L Q�q�p�o�q "0 sharedworkspace sharedWorkspace�p  �o  2 o      �n�n 0 theworkspace theWorkspace0 n  F I343 o   G I�m�m 0 nsworkspace NSWorkspace4 m   F G�l
�l misccura. 5�k5 O  U `676 I   Y _�j8�i�j D0  activatefileviewerselectingurls_  activateFileViewerSelectingURLs_8 9�h9 o   Z [�g�g 0 	theseurls 	theseURLs�h  �i  7 o   U V�f�f 0 theworkspace theWorkspace�k  � :;: l     �e�d�c�e  �d  �c  ; <=< i   S V>?> I      �b@�a�b 0 
openfolder 
openFolder@ A�`A o      �_�_ 0 thisitem thisItem�`  �a  ? k     #BB CDC r     EFE I     �^G�]�^ *0 getposixpathforitem getPOSIXPathForItemG H�\H o    �[�[ 0 thisitem thisItem�\  �]  F o      �Z�Z 0 apath aPathD IJI r   	 KLK n  	 MNM I    �YO�X�Y $0 fileurlwithpath_ fileURLWithPath_O P�WP o    �V�V 0 apath aPath�W  �X  N n  	 QRQ 4   
 �US
�U 
pclsS m    TT �UU 
 N S U R LR m   	 
�T
�T misccuraL o      �S�S 0 aurl aURLJ VWV r    XYX n   Z[Z o    �R�R "0 sharedworkspace sharedWorkspace[ n   \]\ o    �Q�Q 0 nsworkspace NSWorkspace] m    �P
�P misccuraY o      �O�O 0 
aworkspace 
aWorkspaceW ^�N^ n   #_`_ I    #�Ma�L�M 0 openurl_ openURL_a b�Kb o    �J�J 0 aurl aURL�K  �L  ` o    �I�I 0 
aworkspace 
aWorkspace�N  = cdc l     �H�G�F�H  �G  �F  d efe i   W Zghg I      �Ei�D�E (0 pathtoparentfolder pathToParentFolderi j�Cj o      �B�B 0 thisitem thisItem�C  �D  h k      kk lml r     non I     �Ap�@�A *0 getposixpathforitem getPOSIXPathForItemp q�?q o    �>�> 0 thisitem thisItem�?  �@  o o      �=�= 0 thispath thisPathm rsr r   	 tut n  	 vwv I    �<x�;�< &0 stringwithstring_ stringWithString_x y�:y o    �9�9 0 thispath thisPath�:  �;  w n  	 z{z o   
 �8�8 0 nsstring NSString{ m   	 
�7
�7 misccurau o      �6�6 0 apath aPaths |}| r    ~~ n   ��� o    �5�5 F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent� o    �4�4 0 apath aPath o      �3�3 $0 parentfolderpath parentFolderPath} ��2� L     �� b    ��� l   ��1�0� c    ��� o    �/�/ $0 parentfolderpath parentFolderPath� m    �.
�. 
ctxt�1  �0  � m    �� ���  /�2  f ��� l     �-�,�+�-  �,  �+  � ��� i   [ ^��� I      �*��)�* *0 getposixpathforitem getPOSIXPathForItem� ��(� o      �'�' &0 thisitemreference thisItemReference�(  �)  � k     w�� ��� l      �&���&  � I C This routine attempts to return a clean full POSIX path reference    � ��� �   T h i s   r o u t i n e   a t t e m p t s   t o   r e t u r n   a   c l e a n   f u l l   P O S I X   p a t h   r e f e r e n c e  � ��� l     �%���%  �   check class of input   � ��� *   c h e c k   c l a s s   o f   i n p u t� ��� Z     t����$� =    ��� l    ��#�"� n     ��� m    �!
�! 
pcls� o     � �  &0 thisitemreference thisItemReference�#  �"  � m    �
� 
alis� r    ��� l   ���� n    ��� 1   	 �
� 
psxp� o    	�� &0 thisitemreference thisItemReference�  �  � o      �� &0 thisitemreference thisItemReference� ��� =   ��� l   ���� n    ��� m    �
� 
pcls� o    �� &0 thisitemreference thisItemReference�  �  � m    �
� 
furl� ��� r    ��� l   ���� n    ��� 1    �
� 
psxp� o    �� &0 thisitemreference thisItemReference�  �  � o      �� &0 thisitemreference thisItemReference� ��� G     /��� =    %��� n     #��� m   ! #�
� 
pcls� o     !�� &0 thisitemreference thisItemReference� m   # $�
� 
TEXT� =  ( -��� n   ( +��� m   ) +�
� 
pcls� o   ( )�� &0 thisitemreference thisItemReference� m   + ,�

�
 
ctxt� ��	� k   2 p�� ��� Z   2 Q����� F   2 =��� C  2 5��� o   2 3�� &0 thisitemreference thisItemReference� m   3 4�� ���  '� D   8 ;��� o   8 9�� &0 thisitemreference thisItemReference� m   9 :�� ���  '� k   @ M�� ��� l  @ @����  �   remove single quotes   � ��� *   r e m o v e   s i n g l e   q u o t e s� ��� r   @ M��� n   @ K��� 7  A K���
� 
ctxt� m   E G�� � m   H J� � ��� o   @ A���� &0 thisitemreference thisItemReference� o      ���� &0 thisitemreference thisItemReference�  �  �  � ���� Z   R p������� C  R U��� o   R S���� &0 thisitemreference thisItemReference� m   S T�� ���  ~� k   X l�� ��� r   X b��� n  X `��� I   [ `������� &0 stringwithstring_ stringWithString_� ���� o   [ \���� &0 thisitemreference thisItemReference��  ��  � n  X [��� o   Y [���� 0 nsstring NSString� m   X Y��
�� misccura� o      ���� "0 thiscocoastring thisCocoaString� ���� r   c l��� c   c j��� l  c h������ n  c h��� I   d h�������� <0 stringbyexpandingtildeinpath stringByExpandingTildeInPath��  ��  � o   c d���� "0 thiscocoastring thisCocoaString��  ��  � m   h i��
�� 
TEXT� o      ���� &0 thisitemreference thisItemReference��  ��  ��  ��  �	  �$  � ���� L   u w�� o   u v���� &0 thisitemreference thisItemReference��  �    l     ��������  ��  ��    i   _ b I      ������ .0 checkforitemexistence checkForItemExistence �� o      ���� "0 posixpathtoitem POSIXPathToItem��  ��   k      	
	 l     ����   - ' create an instance of the File Manager    � N   c r e a t e   a n   i n s t a n c e   o f   t h e   F i l e   M a n a g e r
  r     	 n     I    ��������  0 defaultmanager defaultManager��  ��   n     o    ���� 0 nsfilemanager NSFileManager m     ��
�� misccura o      ���� "0 thisfilemanager thisFileManager  l  
 
����     check for existence    � (   c h e c k   f o r   e x i s t e n c e  r   
  c   
   l  
 !����! n  
 "#" I    ��$���� &0 fileexistsatpath_ fileExistsAtPath_$ %��% o    ���� "0 posixpathtoitem POSIXPathToItem��  ��  # o   
 ���� "0 thisfilemanager thisFileManager��  ��    m    ��
�� 
bool o      ���� *0 fileexistencestatus fileExistenceStatus &'& l   ��()��  (   return result   ) �**    r e t u r n   r e s u l t' +��+ L    ,, o    ���� *0 fileexistencestatus fileExistenceStatus��   -.- l     ��������  ��  ��  . /0/ i   c f121 I      �������� L0 $pathoffolderofcurrentapplicationfile $pathOfFolderOfCurrentApplicationFile��  ��  2 k     :33 454 I    ��6��
�� .sysodelanull��� ��� nmbr6 m     ���� ��  5 787 r    9:9 l   	;����; n    	<=< 1    	��
�� 
ID  =  f    ��  ��  : o      ���� 0 	thisappid 	thisAppID8 >?> O    &@A@ r    %BCB n    #DED 1   ! #��
�� 
posxE l   !F����F n    !GHG 1    !��
�� 
ctnrH l   I����I n    JKJ 1    ��
�� 
appfK l   L����L 6   MNM 4   ��O
�� 
prcsO m    ���� N =   PQP 1    ��
�� 
bnidQ o    ���� 0 	thisappid 	thisAppID��  ��  ��  ��  ��  ��  C o      ���� $0 parentfolderpath parentFolderPathA m    RR�                                                                                  sevs  alis    P  System                     �i��BD ����System Events.app                                              �����i��        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    S y s t e m  -System/Library/CoreServices/System Events.app   / ��  ? STS Z  ' 7UV����U H   ' +WW D   ' *XYX o   ' (���� $0 parentfolderpath parentFolderPathY m   ( )ZZ �[[  /V r   . 3\]\ b   . 1^_^ o   . /���� $0 parentfolderpath parentFolderPath_ m   / 0`` �aa  /] o      ���� $0 parentfolderpath parentFolderPath��  ��  T b��b L   8 :cc o   8 9���� $0 parentfolderpath parentFolderPath��  0 ded l     ��������  ��  ��  e f��f l     ��������  ��  ��  ��       ��gh��ijklmnopqrstuvwx��  g ������������������������������������
�� 
pimr�� 0 
uselogging 
useLogging
�� .aevtoappnull  �   � ****�� 0 buildcommands buildCommands�� :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_�� &0 generatecommandid generateCommandID�� *0 getbookmarkdatafor_ getBookmarkDataFor_�� *0 storerecord_inpath_ storeRecord_inPath_�� .0 replacestringinstring replaceStringInString�� 60 createfoldernamedinfolder createFolderNamedInFolder�� 0 createfolder createFolder�� 00 makeurlfromfileorpath_ makeURLFromFileOrPath_��  0 revealinfinder revealInFinder�� 0 
openfolder 
openFolder�� (0 pathtoparentfolder pathToParentFolder�� *0 getposixpathforitem getPOSIXPathForItem�� .0 checkforitemexistence checkForItemExistence�� L0 $pathoffolderofcurrentapplicationfile $pathOfFolderOfCurrentApplicationFileh ��y�� y  z{|z ��}��
�� 
cobj} ~~   �� 	
�� 
frmk��  { ����
�� 
cobj ��   �� 
�� 
frmk��  | �����
�� 
cobj� ��   ��
�� 
osax��  
�� boovtruei �� ��������
�� .aevtoappnull  �   � ****��  ��  �  � B�� ,�� .� 5 8�~�} C�|�{�z�y�x _�w�v�u�t f�s�r ��q � � � ��p � � � ��o�n�m ��l ��k�j ��i ��h � � ��g�f�e"�d�c/�b<�a?�`�_�^�]
�� .miscactvnull��� ��� null
�� 
lnfd
� 
btns
�~ 
dflt
�} 
appr
�| 
spac
�{ 
vers
�z 
TEXT�y 
�x .sysodlogaskr        TEXT
�w .sysoexecTEXT���     TEXT
�v 
long
�u 
bool�t "0 dictationstatus dictationStatus�s  �r  �q 20 enhanceddictationstatus enhancedDictationStatus
�p 
tab �o 
�n .sysosigtsirr   ��� null
�m 
sisv
�l 
capp
�k kfrmID  
�j 
xppb
�i 
xppa
�h .miscmvisnull���     ****
�g 
errn�f���e 0 apath aPath�d .0 checkforitemexistence checkForItemExistence�c 0 plistfilepath plistFilePath
�b 
prmp
�a 
ftyp
�` .sysostdfalis    ��� null�_ 0 	plistfile 	plistFile
�^ 
psxp�] 0 buildcommands buildCommands���*j  O��%�%�%���lv�k���%)�,%�&� O )�j a &a &E` O_ a   	)jhY hW X  fE` O +a j a &a &E` O_ a   	)jhY hW X  fE` O_ e 
 _ f a & �a _ %�%a %_ %�%�%a %�%�%_ %a %�%_ %a %�a  a !lv�la " O*j #a $,Ea % 0)a &a 'a (0 *j  O*a )a *a (0a +a ,/j -UY -)a &a .a (0 *j  O*a )a /a (0a +a 0/j -UO)a 1a 2lhY hO Ca 3j E` 4O_ 4a 5  )ja 6Y hO*_ 4k+ 7e  _ 4E` 8Y )ja 9W 0X  *j  O*a :a ;a <a =a " >E` ?O_ ?a @,E` 8O*_ 8k+ Aj �\V�[�Z���Y�\ 0 buildcommands buildCommands�[ �X��X �  �W�W 20 commandoutlineplistpath commandOutlinePlistPath�Z  � #�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�V 20 commandoutlineplistpath commandOutlinePlistPath�U &0 scriptsfolderpath scriptsFolderPath�T 20 defaultscriptfolderpath defaultScriptFolderPath�S $0 sourcedictionary sourceDictionary�R 0 
masterdict 
masterDict�Q &0 commandcategories commandCategories�P 00 commandcategoriescount commandCategoriesCount�O 0 i  �N 0 acategoryname aCategoryName�M *0 acategorydictionary aCategoryDictionary�L "0 acategorytopics aCategoryTopics�K 0 q  �J  0 acategorytopic aCategoryTopic�I $0 atopicdictionary aTopicDictionary�H  0 atopiccommands aTopicCommands�G *0 atopiccommandscount aTopicCommandsCount�F 0 w  �E 0 acommand aCommand�D (0 acommanddictionary aCommandDictionary�C (0 customcommandsdict CustomCommandsDict�B 0 customscope CustomScope�A 0 commandarray commandArray�@ 0 commandsdict commandsDict�? ,0 customscriptfilename CustomScriptFileName�> *0 scriptfilenamearray scriptFileNameArray�= *0 scriptdirectoryname ScriptDirectoryName�<  0 scriptfilepath scriptFilePath�;  0 scriptlanguage scriptLanguage�: 0 
scripttext 
scriptText�9 00 scriptfilebookmarkdata scriptFileBookmarkData�8 0 anarray anArray�7 0 	commandid 	commandID�6 40 preferencefileoutputpath preferenceFileOutputPath�5 0 errormessage errorMessage�4 0 errornumber errorNumber� f�3�2�1�0�/s�.�-��,�+��*�)�(�'�&�%��$�#�"�!<� tv�{�����������(3��Qal������������������������5��^��
�	w��������������� ��������
�3 afdrscr�
�2 
from
�1 fldmfldu
�0 .earsffdralis        afdr
�/ 
psxp�. 0 createfolder createFolder
�- misccura�, 0 nslog NSLog
�+ 
pcls�* >0 dictionarywithcontentsoffile_ dictionaryWithContentsOfFile_�) *0 nsmutabledictionary NSMutableDictionary�( 0 new  �' 0 allkeys allKeys
�& 
list
�% .ascrcmnt****      � ****�$ :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_
�# .corecnte****       ****
�" 
cobj�! 0 valueforkey_ valueForKey_
�  
ppgt
� 
TEXT
� 
ppgd� &0 setobject_forkey_ setObject_forKey_� 0 nsdate NSDate� 0 date  � 0 nsarray NSArray� "0 arraywitharray_ arrayWithArray_
� 
ctxt� 60 createfoldernamedinfolder createFolderNamedInFolder
� 
spac
� 
strq
� .sysoexecTEXT���     TEXT� 0 nsstring NSString� &0 stringwithstring_ stringWithString_� <0 stringbyexpandingtildeinpath stringByExpandingTildeInPath� *0 getbookmarkdatafor_ getBookmarkDataFor_�  0 nsmutablearray NSMutableArray� 0 
addobject_ 
addObject_� &0 generatecommandid generateCommandID
� 
ppgc� *0 storerecord_inpath_ storeRecord_inPath_
�
 afdmpref�	 0 
openfolder 
openFolder
� .sysodelanull��� ��� nmbr�  0 revealinfinder revealInFinder
� .miscactvnull��� ��� null
� 
lnfd
� 
btns
� 
dflt� 
� .sysodlogaskr        TEXT�  0 errormessage errorMessage� ������
�� 
errn�� 0 errornumber errorNumber��  ����
�� 
mesS
�� .sysodisAaleR        TEXT�YY-���l �,E�O��%E�O*�k+ Ob   ��l+ 	Y hO���/�k+ E�O��,j+ E�O�j+ a &E�O�j O*a kv�l+ E�O�j O�j E�O=k�kh �a �/E�O�j O��k+ E�O�j+ a &E�O*a kv�l+ E�O�j O�k�j kh �a �/E�O�j O��k+ E�O�j O�j+ a &E�O*a kv�l+ E�O�j E�O�*a ,FO�k�j kh �a ] /E^ O�] k+ E^ O�a %�%a %] a &%a %�a &%*a ,FO��,j+ E^ O] a a  l+ !O] �a ",j+ #a $l+ !O] a %k+ E^ Ob   �a &] l+ 	Y hO] ] a 'l+ !O] a (k+ E^ O��,j+ E^ O] ] a )l+ !O] ] a *l+ !O] a +k+ E^ Ob   �a ,] l+ 	Y hO�a -,] kvk+ .E^ O] ] a /l+ !O] a 0k+ E^ Ob   �a 1] l+ 	Y hO�] a 2&%a 3%] a 2&%E^ Ob   �a 4] l+ 	Y hO*] �l+ 5O] a 6k+ a 2&E^ O] a 7  a 8E^ Y 	a 9E^ O] a :k+ a 2&E^ Ob   �a ;] l+ 	Y hOa <_ =%a >%_ =%] %_ =%a ?%_ =%] a @,%a A%] a @,%a B%j CO�a D,] k+ EE^ O] a F,E^ O*] k+ GE^ O�a H,j+ E^ O] ] k+ IO] ] a Jl+ !O*j+ KE^ O�] ] l+ !O] *a L,F[OY�q[OY�[OY��Oa ME^  O*�]  l+ NO)a O��l k+ POa Qj RO)]  k+ SOa T A*j UOa V_ W%_ W%a X%_ W%_ W%a Y%_ W%_ W%a Z%a [a \kva ]ka ^ _UW ,X ` a] "a b *j UOa c] "%a d] !l eY hk ������������� :0 removeitemsinlist_fromlist_ removeItemsInList_fromList_�� ����� �  ������ 	0 list2  �� 	0 list1  ��  � ���������� 	0 list2  �� 	0 list1  �� 0 set2  �� 0 set1  � ��������������
�� misccura�� 0 nsset NSSet�� 0 setwitharray_ setWithArray_�� 0 nsmutableset NSMutableSet�� 0 	minusset_ 	minusSet_�� 0 
allobjects 
allObjects
�� 
list�� &��,�k+ E�O��,�k+ E�O��k+ O�j+ �&l ������������� &0 generatecommandid generateCommandID��  ��  � ���� 0 x  � ������ ������
�� misccura�� 40 cfabsolutetimegetcurrent CFAbsoluteTimeGetCurrent�� 0 nsstring NSString�� &0 stringwithformat_ stringWithFormat_
�� 
rslt
�� 
ctxt�� �j+ E�O��,�l+ O��&m ������������ *0 getbookmarkdatafor_ getBookmarkDataFor_�� ����� �  ���� 0 apath aPath��  � ���������� 0 apath aPath�� 0 theurl theURL�� 0 
theoptions 
theOptions�� 0 bookmarkdata bookmarkData� 	����������������
�� misccura
�� 
pcls�� $0 fileurlwithpath_ fileURLWithPath_�� L0 $nsurlbookmarkcreationminimalbookmark $NSURLBookmarkCreationMinimalBookmark
�� 
long
�� 
msng�� �� �0 Kbookmarkdatawithoptions_includingresourcevaluesforkeys_relativetourl_error_ KbookmarkDataWithOptions_includingResourceValuesForKeys_relativeToURL_error_�� $���/�k+ E�O��,�&E�O�jjv���+ E�O�n ��F���������� *0 storerecord_inpath_ storeRecord_inPath_�� ����� �  ������ 0 	therecord 	theRecord�� 0 thepath thePath��  � �������� 0 	therecord 	theRecord�� 0 thepath thePath�� 0 thedata theData� ������������������������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� <0 stringbyexpandingtildeinpath stringByExpandingTildeInPath�� :0 nspropertylistserialization NSPropertyListSerialization�� B0 nspropertylistbinaryformat_v1_0 NSPropertyListBinaryFormat_v1_0
�� 
msng�� �� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_�� 20 writetofile_atomically_ writeToFile_atomically_
�� 
rslt
�� .ascrcmnt****      � ****�� 1��,�k+ E�O�j+ E�O��,���,j��+ E�O��el+ 	O�j o ������������� .0 replacestringinstring replaceStringInString�� ����� �  �������� 0 
sourcetext 
sourceText�� 0 searchstring searchString�� &0 replacementstring replacementString��  � ������������ 0 
sourcetext 
sourceText�� 0 searchstring searchString�� &0 replacementstring replacementString�� 0 astring aString�� 0 resultstring resultString� ����������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_
�� 
ctxt�� ��,�k+ E�O���l+ E�O��&p ������������� 60 createfoldernamedinfolder createFolderNamedInFolder�� ����� �  ������ 0 proposedname proposedName�� 0 folderorpath folderOrPath��  � ���������������� 0 proposedname proposedName�� 0 folderorpath folderOrPath�� 0 thefolderurl theFolderURL�� 0 
thedesturl 
theDestURL��  0 thefilemanager theFileManager�� 0 	theresult 	theResult�� 0 theerror theError� �������������������������������������� 00 makeurlfromfileorpath_ makeURLFromFileOrPath_
�� 
pcls
�� 
ctxt
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_�� <0 urlbyappendingpathcomponent_ URLByAppendingPathComponent_�� 0 nsfilemanager NSFileManager�� 0 defaultManager  
�� 
msng
�� 
obj �� �� �0 Bcreatedirectoryaturl_withintermediatedirectories_attributes_error_ BcreateDirectoryAtURL_withIntermediateDirectories_attributes_error_
�� 
cobj
�� 
bool�� 0 localizedDescription  �� r)�k+  E�O��,�  ��,�k+ E�Y hO���l+ E�O��k+ 	E�O��,j+ E�O��e���+ E[a k/E�Z[a l/E�ZO�a & )j�j+ �&Y hq ������������ 0 createfolder createFolder�� ��� �  �~�~ 0 folderorpath folderOrPath��  � �}�|�{�z�y�} 0 folderorpath folderOrPath�| 0 thefolderurl theFolderURL�{  0 thefilemanager theFileManager�z 0 	theresult 	theResult�y 0 theerror theError� �x�w�v�u�t�s�r�q�p�o�n�m�x 00 makeurlfromfileorpath_ makeURLFromFileOrPath_
�w misccura�v 0 nsfilemanager NSFileManager�u 0 defaultManager  
�t 
msng
�s 
obj �r �q �0 Bcreatedirectoryaturl_withintermediatedirectories_attributes_error_ BcreateDirectoryAtURL_withIntermediateDirectories_attributes_error_
�p 
cobj
�o 
bool�n 0 localizedDescription  
�m 
ctxt�� B)�k+  E�O��,j+ E�O��e���+ E[�k/E�Z[�l/E�ZO��& )j�j+ 
�&Y hr �lP�k�j���i�l 00 makeurlfromfileorpath_ makeURLFromFileOrPath_�k �h��h �  �g�g (0 thefileorpathinput theFileOrPathInput�j  � �f�e�f (0 thefileorpathinput theFileOrPathInput�e 0 thefileorpath theFileOrPath� �d�c�b�a�`�_�^��]�\��[���Z��Y��
�d misccura�c 0 nsarray NSArray�b $0 arraywithobject_ arrayWithObject_
�a 
cobj�` 0 nsstring NSString�_  0 iskindofclass_ isKindOfClass_
�^ 
bool�] 0 
hasprefix_ 
hasPrefix_
�\ 
pcls�[ $0 fileurlwithpath_ fileURLWithPath_�Z  0 stringByExpandingTildeInPath  
�Y 
psxp�i ���,�k+ �k/E�O���,k+ �& G��k+ �& ���/�k+ Y ,��k+ �& ���/�j+ k+ Y ���/�a ,k+ Y '���a /k+ �& �Y ��a /�a ,k+ s �X��W�V���U�X  0 revealinfinder revealInFinder�W �T��T �  �S�S 0 
theseitems 
theseItems�V  � �R�Q�P�O�N�M�R 0 
theseitems 
theseItems�Q 0 	theseurls 	theseURLs�P 0 i  �O 0 thisitem thisItem�N &0 thisitemposixpath thisItemPOSIXPath�M 0 theworkspace theWorkspace� �L�K�J�I�H�G�F�E�D�C�B
�L 
pcls
�K 
list
�J .corecnte****       ****
�I 
cobj�H *0 getposixpathforitem getPOSIXPathForItem
�G misccura�F 0 nsurl NSURL�E $0 fileurlwithpath_ fileURLWithPath_�D 0 nsworkspace NSWorkspace�C "0 sharedworkspace sharedWorkspace�B D0  activatefileviewerselectingurls_  activateFileViewerSelectingURLs_�U a��,� 
��&E�Y hOjvE�O -k�j kh ��/E�O)�k+ E�O��,�k+ �6F[OY��O��, 	*j+ 	E�UO� *�k+ 
Ut �A?�@�?���>�A 0 
openfolder 
openFolder�@ �=��= �  �<�< 0 thisitem thisItem�?  � �;�:�9�8�; 0 thisitem thisItem�: 0 apath aPath�9 0 aurl aURL�8 0 
aworkspace 
aWorkspace� �7�6�5T�4�3�2�1�7 *0 getposixpathforitem getPOSIXPathForItem
�6 misccura
�5 
pcls�4 $0 fileurlwithpath_ fileURLWithPath_�3 0 nsworkspace NSWorkspace�2 "0 sharedworkspace sharedWorkspace�1 0 openurl_ openURL_�> $*�k+  E�O���/�k+ E�O��,�,E�O��k+ u �0h�/�.���-�0 (0 pathtoparentfolder pathToParentFolder�/ �,��, �  �+�+ 0 thisitem thisItem�.  � �*�)�(�'�* 0 thisitem thisItem�) 0 thispath thisPath�( 0 apath aPath�' $0 parentfolderpath parentFolderPath� �&�%�$�#�"�!��& *0 getposixpathforitem getPOSIXPathForItem
�% misccura�$ 0 nsstring NSString�# &0 stringwithstring_ stringWithString_�" F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
�! 
ctxt�- !*�k+  E�O��,�k+ E�O��,E�O��&�%v � �������  *0 getposixpathforitem getPOSIXPathForItem� ��� �  �� &0 thisitemreference thisItemReference�  � ��� &0 thisitemreference thisItemReference� "0 thiscocoastring thisCocoaString� ���������������
� 
pcls
� 
alis
� 
psxp
� 
furl
� 
TEXT
� 
ctxt
� 
bool���
� misccura� 0 nsstring NSString� &0 stringwithstring_ stringWithString_� <0 stringbyexpandingtildeinpath stringByExpandingTildeInPath� x��,�  
��,E�Y f��,�  
��,E�Y V��,� 
 	��,� �& C��	 ���& �[�\[Zl\Z�2E�Y hO�� ��,�k+ E�O�j+ �&E�Y hY hO�w ���
���	� .0 checkforitemexistence checkForItemExistence� ��� �  �� "0 posixpathtoitem POSIXPathToItem�
  � ���� "0 posixpathtoitem POSIXPathToItem� "0 thisfilemanager thisFileManager� *0 fileexistencestatus fileExistenceStatus� ���� ��
� misccura� 0 nsfilemanager NSFileManager�  0 defaultmanager defaultManager�  &0 fileexistsatpath_ fileExistsAtPath_
�� 
bool�	 ��,j+ E�O��k+ �&E�O�x ��2���������� L0 $pathoffolderofcurrentapplicationfile $pathOfFolderOfCurrentApplicationFile��  ��  � ������ 0 	thisappid 	thisAppID�� $0 parentfolderpath parentFolderPath� ����R�����������Z`
�� .sysodelanull��� ��� nmbr
�� 
ID  
�� 
prcs�  
�� 
bnid
�� 
appf
�� 
ctnr
�� 
posx�� ;kj  O)�,E�O� *�k/�[�,\Z�81�,�,�,E�UO�� 
��%E�Y hO�ascr  ��ޭ