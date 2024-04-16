PGDMP     *                    |            rut_library    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399    rut_library    DATABASE        CREATE DATABASE rut_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE rut_library;
                postgres    false            �            1259    16402    author    TABLE     �   CREATE TABLE public.author (
    id integer NOT NULL,
    surname character varying(64) NOT NULL,
    name character varying(64) NOT NULL
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    16401    author_id_seq    SEQUENCE     �   CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.author_id_seq;
       public          postgres    false    215                       0    0    author_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;
          public          postgres    false    214            �            1259    16416    book    TABLE     L  CREATE TABLE public.book (
    id integer NOT NULL,
    id_author integer NOT NULL,
    id_publisher integer NOT NULL,
    title character varying(256) NOT NULL,
    page_count smallint NOT NULL,
    publication_year smallint DEFAULT 2024 NOT NULL,
    CONSTRAINT book_check CHECK (((page_count > 0) AND (publication_year > 0)))
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    16415    book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.book_id_seq;
       public          postgres    false    219                       0    0    book_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;
          public          postgres    false    218            �            1259    16409 	   publisher    TABLE     f   CREATE TABLE public.publisher (
    id integer NOT NULL,
    label character varying(128) NOT NULL
);
    DROP TABLE public.publisher;
       public         heap    postgres    false            �            1259    16408    publisher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.publisher_id_seq;
       public          postgres    false    217                       0    0    publisher_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.publisher_id_seq OWNED BY public.publisher.id;
          public          postgres    false    216            o           2604    16405 	   author id    DEFAULT     f   ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);
 8   ALTER TABLE public.author ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            q           2604    16419    book id    DEFAULT     b   ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);
 6   ALTER TABLE public.book ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            p           2604    16412    publisher id    DEFAULT     l   ALTER TABLE ONLY public.publisher ALTER COLUMN id SET DEFAULT nextval('public.publisher_id_seq'::regclass);
 ;   ALTER TABLE public.publisher ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16402    author 
   TABLE DATA           3   COPY public.author (id, surname, name) FROM stdin;
    public          postgres    false    215   6                 0    16416    book 
   TABLE DATA           `   COPY public.book (id, id_author, id_publisher, title, page_count, publication_year) FROM stdin;
    public          postgres    false    219   �                 0    16409 	   publisher 
   TABLE DATA           .   COPY public.publisher (id, label) FROM stdin;
    public          postgres    false    217   �!                  0    0    author_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.author_id_seq', 4, true);
          public          postgres    false    214                       0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 43, true);
          public          postgres    false    218                       0    0    publisher_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.publisher_id_seq', 10, true);
          public          postgres    false    216            u           2606    16407    author author_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    215            y           2606    16439 ;   book book_id_author_id_publisher_title_publication_year_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_id_author_id_publisher_title_publication_year_key UNIQUE (id_author, id_publisher, title, publication_year);
 e   ALTER TABLE ONLY public.book DROP CONSTRAINT book_id_author_id_publisher_title_publication_year_key;
       public            postgres    false    219    219    219    219            {           2606    16437    book book_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    219            w           2606    16414    publisher publisher_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_pkey;
       public            postgres    false    217            |           2606    16424    book fk_book_authors    FK CONSTRAINT     v   ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_book_authors FOREIGN KEY (id_author) REFERENCES public.author(id);
 >   ALTER TABLE ONLY public.book DROP CONSTRAINT fk_book_authors;
       public          postgres    false    219    215    3189            }           2606    16429    book fk_book_publisher    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_book_publisher FOREIGN KEY (id_publisher) REFERENCES public.publisher(id);
 @   ALTER TABLE ONLY public.book DROP CONSTRAINT fk_book_publisher;
       public          postgres    false    217    219    3191               �   x�5�K�@D�ӧ�&~��aD� ��.O@�Ad^����a�]�U/�vT̚��7zf��R=�/�q<��Q.1UqX>h�ˤfZd�k�M�>�	�!��_�޲s<�q^�Ws=���ȫ�z�3���$���� �RwM         �  x��T�n�0<�_!��"%��/����>�"�h�c!�m)�����,���TE�)rwvvvHWo
#e/]8��ʐ�NF,�pn���w֕1�!�p)$͹֤QS���޺Y���~۰0E��aeXX����E&WZk��.�2�m&7Ji�2��!oA�gƗG6uD�QC8'��G|v �k�"��:�����ɘ��.��Ct�2ڄM�,�d�dӣl �Ҹ6�@o�8A�H�H*�ɂ�Q�4K���ɚD��g��:�:v{����Q5Tp��-� ^�yR���=��2�"/S�?v1�Q�CXRa������ď"RBG��ʎ�@.�a\�=�3~f����N2�Ƃ�b(��k��!�"��zk}D�8S�)�BX��Uzj=FQ�A���}M�u�R�P��}����9��o|��Y�:�j�[ĵ�ƕM4rQg\n���	g*���s5��80�3�SE�)TO?�2

�f�;®H���A�$�����e�O���X��*
����`�I>W@Zq<��e�h�ܖn:��
A���v��3�KW�,�Q>�ѻ���M����"x�c�_Uˆ���6S(�t�� ����UU3Og>������,/�s� �՗z���K7�O@��5��j
���T��䵭&������i�L��������S��J         �   x��M
�P���)z��{������X���
�9]d�d曉7K���NT��D�����Xf�ex!�Lp���%h�[���Xn�.'8����V�R�i�i(u%8���G���|"��v��J~C��Wr��?�<C�P�lKv`��HU��5�     