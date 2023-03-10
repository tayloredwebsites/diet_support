PGDMP                          {            glycemic_development %   12.13 (Ubuntu 12.13-0ubuntu0.20.04.1) %   12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16385    glycemic_development    DATABASE     ?   CREATE DATABASE glycemic_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 $   DROP DATABASE glycemic_development;
                dave    false            ?            1259    16395    ar_internal_metadata    TABLE     ?   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap    dave    false            ?            1259    16387    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    dave    false            ?            1259    16405    users    TABLE     Z  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    username character varying,
    full_name character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    dave    false            ?            1259    16403    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          dave    false    205            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          dave    false    204                       2604    16430    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          dave    false    204    205    205            ?          0    16395    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          dave    false    203          ?          0    16387    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          dave    false    202   c       ?          0    16405    users 
   TABLE DATA           #  COPY public.users (id, email, username, full_name, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, created_at, updated_at) FROM stdin;
    public          dave    false    205   ?       ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          dave    false    204                        2606    16402 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            dave    false    203                       2606    16394 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            dave    false    202            &           2606    16416    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            dave    false    205            !           1259    16419 !   index_users_on_confirmation_token    INDEX     h   CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);
 5   DROP INDEX public.index_users_on_confirmation_token;
       public            dave    false    205            "           1259    16417    index_users_on_email    INDEX     N   CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public            dave    false    205            #           1259    16418 #   index_users_on_reset_password_token    INDEX     l   CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public            dave    false    205            $           1259    16420    index_users_on_unlock_token    INDEX     \   CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);
 /   DROP INDEX public.index_users_on_unlock_token;
       public            dave    false    205            ?   ?   x?K?+?,???M?+?LI-K??/ ????uu?-??,???,M?̍??Hq??qqq ??j      ?      x?320260446?0030?????? '?o      ?   -  x?u??n?@E??]?u??f??U??)P??JL???bE???__m?M?M??ޜ??@??&?$Y??|??Mc??L??w?
?
`?<??B??????زH_jEQ?}_??7\?oO?O??&? ????͒?p?&y???J??]?m??[??Y?B???Ոi?)?"bh&??H?'??žZ??)1uF?????3?o?8??a?????q;???6??ة-?-?&|?;^=.?-?<Ko+?z6-:)x??ۅ?k???}w?|T?0m??<w??y?q
?R"?Q?21,
 ?.?	_?????OSGDU?Oldz?     