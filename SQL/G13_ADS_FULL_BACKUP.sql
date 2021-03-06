PGDMP     3                    y           ADS    10.15    10.15 j    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ^           1262    16803    ADS    DATABASE     ?   CREATE DATABASE "ADS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "ADS";
             postgres    false                        2615    25702    ads    SCHEMA        CREATE SCHEMA ads;
    DROP SCHEMA ads;
             postgres    false            _           0    0 
   SCHEMA ads    ACL     &   GRANT USAGE ON SCHEMA ads TO ads_web;
                  postgres    false    5                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            `           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            a           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    25727    doctor    TABLE     ?   CREATE TABLE ads.doctor (
    id integer NOT NULL,
    fname character varying(45) NOT NULL,
    lname character varying(45) NOT NULL,
    mi character varying(45)
);
    DROP TABLE ads.doctor;
       ads         postgres    false    5            b           0    0    TABLE doctor    ACL     B   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.doctor TO ads_web;
            ads       postgres    false    202            ?            1259    25725    doctor_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE ads.doctor_id_seq;
       ads       postgres    false    5    202            c           0    0    doctor_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE ads.doctor_id_seq OWNED BY ads.doctor.id;
            ads       postgres    false    201            d           0    0    SEQUENCE doctor_id_seq    ACL     >   GRANT SELECT,UPDATE ON SEQUENCE ads.doctor_id_seq TO ads_web;
            ads       postgres    false    201            ?            1259    25799 	   inventory    TABLE       CREATE TABLE ads.inventory (
    drawer integer NOT NULL,
    machine integer NOT NULL,
    medication integer NOT NULL,
    qty integer NOT NULL,
    active boolean,
    audit_date date,
    last_audited_by integer,
    min_qty integer NOT NULL,
    max_qty integer NOT NULL
);
    DROP TABLE ads.inventory;
       ads         postgres    false    5            e           0    0    TABLE inventory    ACL     E   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.inventory TO ads_web;
            ads       postgres    false    213            ?            1259    25772    machine    TABLE     k   CREATE TABLE ads.machine (
    id integer NOT NULL,
    building_floor integer,
    num_drawers integer
);
    DROP TABLE ads.machine;
       ads         postgres    false    5            f           0    0    TABLE machine    ACL     C   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.machine TO ads_web;
            ads       postgres    false    208            ?            1259    25770    machine_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.machine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE ads.machine_id_seq;
       ads       postgres    false    208    5            g           0    0    machine_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE ads.machine_id_seq OWNED BY ads.machine.id;
            ads       postgres    false    207            h           0    0    SEQUENCE machine_id_seq    ACL     ?   GRANT SELECT,UPDATE ON SEQUENCE ads.machine_id_seq TO ads_web;
            ads       postgres    false    207            ?            1259    25735 
   medication    TABLE     ?   CREATE TABLE ads.medication (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    strength character varying(10) NOT NULL,
    expiration date NOT NULL
);
    DROP TABLE ads.medication;
       ads         postgres    false    5            i           0    0    TABLE medication    ACL     F   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.medication TO ads_web;
            ads       postgres    false    204            ?            1259    25733    medication_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.medication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE ads.medication_id_seq;
       ads       postgres    false    204    5            j           0    0    medication_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE ads.medication_id_seq OWNED BY ads.medication.id;
            ads       postgres    false    203            k           0    0    SEQUENCE medication_id_seq    ACL     B   GRANT SELECT,UPDATE ON SEQUENCE ads.medication_id_seq TO ads_web;
            ads       postgres    false    203            ?            1259    25821    nurse    TABLE     U   CREATE TABLE ads.nurse (
    id integer NOT NULL,
    shift character varying(45)
);
    DROP TABLE ads.nurse;
       ads         postgres    false    5            l           0    0    TABLE nurse    ACL     A   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.nurse TO ads_web;
            ads       postgres    false    215            ?            1259    25819    nurse_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.nurse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE ads.nurse_id_seq;
       ads       postgres    false    215    5            m           0    0    nurse_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE ads.nurse_id_seq OWNED BY ads.nurse.id;
            ads       postgres    false    214            n           0    0    SEQUENCE nurse_id_seq    ACL     =   GRANT SELECT,UPDATE ON SEQUENCE ads.nurse_id_seq TO ads_web;
            ads       postgres    false    214            ?            1259    25743    order    TABLE     %  CREATE TABLE ads."order" (
    id integer NOT NULL,
    patient integer NOT NULL,
    doctor integer NOT NULL,
    medication integer NOT NULL,
    dosage character varying(255) NOT NULL,
    status integer NOT NULL,
    CONSTRAINT order_status_check CHECK (((status = 1) OR (status = 2)))
);
    DROP TABLE ads."order";
       ads         postgres    false    5            o           0    0    TABLE "order"    ACL     C   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads."order" TO ads_web;
            ads       postgres    false    206            ?            1259    25741    order_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE ads.order_id_seq;
       ads       postgres    false    206    5            p           0    0    order_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE ads.order_id_seq OWNED BY ads."order".id;
            ads       postgres    false    205            q           0    0    SEQUENCE order_id_seq    ACL     =   GRANT SELECT,UPDATE ON SEQUENCE ads.order_id_seq TO ads_web;
            ads       postgres    false    205            ?            1259    25713    patient    TABLE     E  CREATE TABLE ads.patient (
    id integer NOT NULL,
    fname character varying(45) NOT NULL,
    lname character varying(45) NOT NULL,
    mi character varying(45),
    building_floor integer,
    status integer,
    bed integer,
    CONSTRAINT patient_status_check CHECK (((status = 3) OR (status = 4) OR (status = 5)))
);
    DROP TABLE ads.patient;
       ads         postgres    false    5            r           0    0    TABLE patient    ACL     C   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.patient TO ads_web;
            ads       postgres    false    200            ?            1259    25711    patient_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE ads.patient_id_seq;
       ads       postgres    false    5    200            s           0    0    patient_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE ads.patient_id_seq OWNED BY ads.patient.id;
            ads       postgres    false    199            t           0    0    SEQUENCE patient_id_seq    ACL     ?   GRANT SELECT,UPDATE ON SEQUENCE ads.patient_id_seq TO ads_web;
            ads       postgres    false    199            ?            1259    25780    role    TABLE     \   CREATE TABLE ads.role (
    id integer NOT NULL,
    type character varying(45) NOT NULL
);
    DROP TABLE ads.role;
       ads         postgres    false    5            u           0    0 
   TABLE role    ACL     @   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.role TO ads_web;
            ads       postgres    false    210            ?            1259    25778    role_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE ads.role_id_seq;
       ads       postgres    false    5    210            v           0    0    role_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE ads.role_id_seq OWNED BY ads.role.id;
            ads       postgres    false    209            w           0    0    SEQUENCE role_id_seq    ACL     <   GRANT SELECT,UPDATE ON SEQUENCE ads.role_id_seq TO ads_web;
            ads       postgres    false    209            ?            1259    25705    status    TABLE     W   CREATE TABLE ads.status (
    id integer NOT NULL,
    status character varying(45)
);
    DROP TABLE ads.status;
       ads         postgres    false    5            x           0    0    TABLE status    ACL     B   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads.status TO ads_web;
            ads       postgres    false    198            ?            1259    25703    status_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE ads.status_id_seq;
       ads       postgres    false    198    5            y           0    0    status_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE ads.status_id_seq OWNED BY ads.status.id;
            ads       postgres    false    197            z           0    0    SEQUENCE status_id_seq    ACL     >   GRANT SELECT,UPDATE ON SEQUENCE ads.status_id_seq TO ads_web;
            ads       postgres    false    197            ?            1259    25788    user    TABLE       CREATE TABLE ads."user" (
    id integer NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(255) NOT NULL,
    role integer,
    fname character varying(45) NOT NULL,
    lname character varying(45) NOT NULL,
    mi character varying(10)
);
    DROP TABLE ads."user";
       ads         postgres    false    5            {           0    0    TABLE "user"    ACL     B   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE ads."user" TO ads_web;
            ads       postgres    false    212            ?            1259    25786    user_id_seq    SEQUENCE     ?   CREATE SEQUENCE ads.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE ads.user_id_seq;
       ads       postgres    false    212    5            |           0    0    user_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE ads.user_id_seq OWNED BY ads."user".id;
            ads       postgres    false    211            }           0    0    SEQUENCE user_id_seq    ACL     <   GRANT SELECT,UPDATE ON SEQUENCE ads.user_id_seq TO ads_web;
            ads       postgres    false    211            ?
           2604    25730 	   doctor id    DEFAULT     `   ALTER TABLE ONLY ads.doctor ALTER COLUMN id SET DEFAULT nextval('ads.doctor_id_seq'::regclass);
 5   ALTER TABLE ads.doctor ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    201    202    202            ?
           2604    25775 
   machine id    DEFAULT     b   ALTER TABLE ONLY ads.machine ALTER COLUMN id SET DEFAULT nextval('ads.machine_id_seq'::regclass);
 6   ALTER TABLE ads.machine ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    208    207    208            ?
           2604    25738    medication id    DEFAULT     h   ALTER TABLE ONLY ads.medication ALTER COLUMN id SET DEFAULT nextval('ads.medication_id_seq'::regclass);
 9   ALTER TABLE ads.medication ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    203    204    204            ?
           2604    25824    nurse id    DEFAULT     ^   ALTER TABLE ONLY ads.nurse ALTER COLUMN id SET DEFAULT nextval('ads.nurse_id_seq'::regclass);
 4   ALTER TABLE ads.nurse ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    215    214    215            ?
           2604    25746    order id    DEFAULT     `   ALTER TABLE ONLY ads."order" ALTER COLUMN id SET DEFAULT nextval('ads.order_id_seq'::regclass);
 6   ALTER TABLE ads."order" ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    206    205    206            ?
           2604    25716 
   patient id    DEFAULT     b   ALTER TABLE ONLY ads.patient ALTER COLUMN id SET DEFAULT nextval('ads.patient_id_seq'::regclass);
 6   ALTER TABLE ads.patient ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    200    199    200            ?
           2604    25783    role id    DEFAULT     \   ALTER TABLE ONLY ads.role ALTER COLUMN id SET DEFAULT nextval('ads.role_id_seq'::regclass);
 3   ALTER TABLE ads.role ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    209    210    210            ?
           2604    25708 	   status id    DEFAULT     `   ALTER TABLE ONLY ads.status ALTER COLUMN id SET DEFAULT nextval('ads.status_id_seq'::regclass);
 5   ALTER TABLE ads.status ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    198    197    198            ?
           2604    25791    user id    DEFAULT     ^   ALTER TABLE ONLY ads."user" ALTER COLUMN id SET DEFAULT nextval('ads.user_id_seq'::regclass);
 5   ALTER TABLE ads."user" ALTER COLUMN id DROP DEFAULT;
       ads       postgres    false    212    211    212            K          0    25727    doctor 
   TABLE DATA                     ads       postgres    false    202   d       V          0    25799 	   inventory 
   TABLE DATA                     ads       postgres    false    213   ?d       Q          0    25772    machine 
   TABLE DATA                     ads       postgres    false    208   ff       M          0    25735 
   medication 
   TABLE DATA                     ads       postgres    false    204   ?f       X          0    25821    nurse 
   TABLE DATA                     ads       postgres    false    215   ?h       O          0    25743    order 
   TABLE DATA                     ads       postgres    false    206   ^i       I          0    25713    patient 
   TABLE DATA                     ads       postgres    false    200   ?k       S          0    25780    role 
   TABLE DATA                     ads       postgres    false    210   ?m       G          0    25705    status 
   TABLE DATA                     ads       postgres    false    198   n       U          0    25788    user 
   TABLE DATA                     ads       postgres    false    212   ?n       ~           0    0    doctor_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('ads.doctor_id_seq', 1, false);
            ads       postgres    false    201                       0    0    machine_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ads.machine_id_seq', 1, false);
            ads       postgres    false    207            ?           0    0    medication_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ads.medication_id_seq', 1, false);
            ads       postgres    false    203            ?           0    0    nurse_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('ads.nurse_id_seq', 1, false);
            ads       postgres    false    214            ?           0    0    order_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('ads.order_id_seq', 1, false);
            ads       postgres    false    205            ?           0    0    patient_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ads.patient_id_seq', 1, false);
            ads       postgres    false    199            ?           0    0    role_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('ads.role_id_seq', 1, false);
            ads       postgres    false    209            ?           0    0    status_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('ads.status_id_seq', 1, false);
            ads       postgres    false    197            ?           0    0    user_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('ads.user_id_seq', 1, false);
            ads       postgres    false    211            ?
           2606    25732    doctor doctor_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY ads.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY ads.doctor DROP CONSTRAINT doctor_pkey;
       ads         postgres    false    202            ?
           2606    25803    inventory inventory_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (drawer, machine);
 ?   ALTER TABLE ONLY ads.inventory DROP CONSTRAINT inventory_pkey;
       ads         postgres    false    213    213            ?
           2606    25777    machine machine_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY ads.machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY ads.machine DROP CONSTRAINT machine_pkey;
       ads         postgres    false    208            ?
           2606    25740    medication medication_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY ads.medication
    ADD CONSTRAINT medication_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY ads.medication DROP CONSTRAINT medication_pkey;
       ads         postgres    false    204            ?
           2606    25826    nurse nurse_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY ads.nurse
    ADD CONSTRAINT nurse_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY ads.nurse DROP CONSTRAINT nurse_pkey;
       ads         postgres    false    215            ?
           2606    25749    order order_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY ads."order" DROP CONSTRAINT order_pkey;
       ads         postgres    false    206            ?
           2606    25719    patient patient_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY ads.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY ads.patient DROP CONSTRAINT patient_pkey;
       ads         postgres    false    200            ?
           2606    25785    role role_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY ads.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 5   ALTER TABLE ONLY ads.role DROP CONSTRAINT role_pkey;
       ads         postgres    false    210            ?
           2606    25710    status status_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY ads.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY ads.status DROP CONSTRAINT status_pkey;
       ads         postgres    false    198            ?
           2606    25793    user user_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY ads."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY ads."user" DROP CONSTRAINT user_pkey;
       ads         postgres    false    212            ?
           2606    25755    order doctor    FK CONSTRAINT     g   ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT doctor FOREIGN KEY (doctor) REFERENCES ads.doctor(id);
 5   ALTER TABLE ONLY ads."order" DROP CONSTRAINT doctor;
       ads       postgres    false    206    202    2740            ?
           2606    25827    nurse id    FK CONSTRAINT     ]   ALTER TABLE ONLY ads.nurse
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES ads."user"(id);
 /   ALTER TABLE ONLY ads.nurse DROP CONSTRAINT id;
       ads       postgres    false    215    212    2750            ?
           2606    25809    inventory last_audited_by    FK CONSTRAINT     {   ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT last_audited_by FOREIGN KEY (last_audited_by) REFERENCES ads."user"(id);
 @   ALTER TABLE ONLY ads.inventory DROP CONSTRAINT last_audited_by;
       ads       postgres    false    212    2750    213            ?
           2606    25804    inventory machine    FK CONSTRAINT     l   ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT machine FOREIGN KEY (machine) REFERENCES ads.machine(id);
 8   ALTER TABLE ONLY ads.inventory DROP CONSTRAINT machine;
       ads       postgres    false    208    2746    213            ?
           2606    25760    order medication    FK CONSTRAINT     s   ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT medication FOREIGN KEY (medication) REFERENCES ads.medication(id);
 9   ALTER TABLE ONLY ads."order" DROP CONSTRAINT medication;
       ads       postgres    false    204    206    2742            ?
           2606    25814    inventory medication    FK CONSTRAINT     u   ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT medication FOREIGN KEY (medication) REFERENCES ads.medication(id);
 ;   ALTER TABLE ONLY ads.inventory DROP CONSTRAINT medication;
       ads       postgres    false    2742    213    204            ?
           2606    25750    order patient    FK CONSTRAINT     j   ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT patient FOREIGN KEY (patient) REFERENCES ads.patient(id);
 6   ALTER TABLE ONLY ads."order" DROP CONSTRAINT patient;
       ads       postgres    false    206    200    2738            ?
           2606    25794 	   user role    FK CONSTRAINT     `   ALTER TABLE ONLY ads."user"
    ADD CONSTRAINT role FOREIGN KEY (role) REFERENCES ads.role(id);
 2   ALTER TABLE ONLY ads."user" DROP CONSTRAINT role;
       ads       postgres    false    2748    210    212            ?
           2606    25720    patient status    FK CONSTRAINT     g   ALTER TABLE ONLY ads.patient
    ADD CONSTRAINT status FOREIGN KEY (status) REFERENCES ads.status(id);
 5   ALTER TABLE ONLY ads.patient DROP CONSTRAINT status;
       ads       postgres    false    198    2736    200            ?
           2606    25765    order status    FK CONSTRAINT     g   ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT status FOREIGN KEY (status) REFERENCES ads.status(id);
 5   ALTER TABLE ONLY ads."order" DROP CONSTRAINT status;
       ads       postgres    false    206    2736    198            ?           826    25833    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ?   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA ads REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA ads GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO ads_web;
            ads       postgres    false    5            K   ?   x???v
Q???WHL)?K?O.?/R??L?QH?K?M?QȁP???
a?>???
?:
?ΉE?9??@?W~q?Q״??$?@#???Ҕ?T?9a?yə?y f(?F?????A????7?????̼b???l?d& ??^U      V   ?  x?ՙ?k?0?w
mI?)???N2J
M??(???ڡ??6߾ҝ???B??w?w?T??ף???a?˃o????]???|?S,?~ر?????q?<????caZgo???v?5?q~?i.????kN??`ǆN?',6????mwk????p????R˭̷Z??~??er???H?	3 M?4 M??  ͈? ??!UA$PA4?g??)???*???*? ???t]:iB?) iJ?9 iF?% ???#?_s??H*??h*`??*?B?**?<?????O ?YU?Z)? ?? ?*???B?+j?U ~?<]C?J??@p?X?Z?(?$T??Z*?g??4?Ŵ?`Z???BP??+9?k!y?B?Ũ ??8?Jc?Y?D?ЪP??? T{??????Y??`?8s???l&??_hAm?      Q   p   x???v
Q???WHL)??ML???KU??L?QH*??I??K?O???/?Q?+͍O)J,O-*?Ts?	uV?0?Q !cMk.O?3?Q "C#?f??`B5Ìt???h Db_?      M   ?  x???Qo? ???+xK+???8???n??h]R???F?Q1xGq~??^?4??W?dK??ӹ?{?r?x??!??fM??^5J?J?,??rB?hԄl?W?9???????K??????#?`2??Rya?8>??y???f9?????h?@?	?I?J?1,R?F???mՀ)?p9?f?ϰp?g???+??4?@lb??t??+R???9eh?f??箍K?o?Wa?Q?"neh????:?Vg>dpa????ȑ??+mY???Vƪ/N???1???B?,?]T??*?F>?B? ????v?E???,c?F??X7?????X0G? ?ܸ???{?;??{d<e????3???pJy?F?̸?}?0??r???@?U?]\?!????w?????sP?ސ{???y??;V$?7m??E?9`?????????6λ???1V¬???C~,?ν?:eHE?_??0?w6i?6?z΢?      X      x???v
Q???WHL)??+-*NU??L?Q(??L+?Ts?	uV?0?QP7,.Q״??$Z?9????d?d??B?&Sr4?5??ɜM?h?$?O?@]???y?$?3$?6#2m3&S?	?>.. BB׀      O   0  x??W?n?0??+?(?B?(KFO9?`?H??흵?X?$"???%??64E*t ?????ή?w??_VXޭ>C??Åj5\಩??6???^[=0t?n?tS???Xiw?
?n>}???%g??E?$öi[pئS?l?}BO?>Ζo??{L?򩑅Ǥ+K?ҠW?V5??(???g?6n?s?"8?:?%?<$9?2?C?#?T'z?m?G>,)?=~??;Dc?`?B??o42??+?&Z%\?^x?)Q?԰'^???`@,t?????{???[eީ?+ђ????J??Q?4?q??e?h??$???Z?????m?<?\?Q&b?R?Q?????u????Puzm??A?ndOe#?M?KD???̽??^?Y?Ʋ??Y:??,GI?j>^%???so}S?;??[???"?$n?iҿt$??E???4?? sjq~???ܙ_?????h???6??wz?*O'om??hc}mNűVN???!g:???o?OKŹJ??6-???R?X?'?W??|qĝ?d$v?y??{????VIc?/5??<?3@s;??:??C???      I     x???Mo?@?????9????i??D?"A?J?Tc??b???.???;kJ?????|?G3??k/7????-7?Oxs +???J???*?D????ɔUN?\????Vk??ނu??\?k?2{??ر?,e?:???????J????_????dI ?=?ހz??as"???d?+?z??u?6? "??"k??~???$"߆w???? ??Q?2Jp_s??u?0?:????7NZ?@??OJlen??????X???????,?Ke?'y?O??$\U?%"4??ه?	???O???Trg?`+݄??c\-?????l? ^???T^ga3ܥ?"?sR?3??8????>Fd*?3??qu???k??ɜ??????????dJ?ű??=???s?A?Sy[!??5.h???Z???Y?t?A???%????L?p??0y_??T??kg}??I?h+g??J?C?Q?}W???$?;/B?????????@????94b?Ш?d?	g?      S   Z   x???v
Q???WHL)?+??IU??L?Q(?,H?Ts?	uV?0?QP?+-*NU״??$R?PS@FbQnbr?BHjrF^frfb?.. ?#?      G   v   x???v
Q???WHL)?+.I,)-V??L?Q??5?}B]?4u??K2?R?5??<I?i???Y???W??W??B?~c??)??%%??5?)J?+NK-*"]?)???E??\\ G?]?      U     x?ŔOo1????\H$T???E=??
 (P?fwX??+{]D>}<^@?T?T?'?=h?????.V??u0]?_V?/?F??????)??Aô>Jeϔ??~???r??`?8?9^wa??m???Գ_knD*???J??Qifr??oz??n??#???%q?$2ayjx???c ??@l?ε6??,}?I?G-???sv?????!???=J?e??ll??#&?pc?? ??w????? -[v֟?n?9W?-W???i|??sSf?1??_??f?????QH|w????6???z?ɟ?2a?{?K?Z??3??*q???8?pO?4? ?]V^?2Bs?KP=
AJolG?ζ?zC!????r,/ض ?,???-(p?????c?X?6N+g?n?Kla?BM?
??R?R1??t???_,??????:ג?
st3ۀ0???wi??(Q?)M?$m?%?P?>????Y"????fǊ%M<$???a?9???!?h4?uK???
?]??on> Xh?     