--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "startToken" timestamp with time zone DEFAULT now(),
    "expireToken" timestamp with time zone
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shortUrls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."shortUrls" (
    id integer NOT NULL,
    identifier text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "urlId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


ALTER TABLE public."shortUrls" OWNER TO postgres;

--
-- Name: shortUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."shortUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."shortUrls_id_seq" OWNER TO postgres;

--
-- Name: shortUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."shortUrls_id_seq" OWNED BY public."shortUrls".id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shortUrls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shortUrls" ALTER COLUMN id SET DEFAULT nextval('public."shortUrls_id_seq"'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, "userId", "startToken", "expireToken") FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjU5NzEyNjk4fQ.1DrgcN2VaftZUVgMgSBlthiOwap-TOSQXBJdw3rjTvI	2	2022-08-05 12:18:18.461697-03	\N
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjU5NzEyNzYxfQ.sipbdN2sly3r7M9LZHhTE5g8UBGj4vjS2C7DfKBSip8	1	2022-08-05 12:19:21.592573-03	\N
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjU5NzEyNzc0fQ.fBVI4cXecT5oC3jY3IpCXSy_xTDLfOeSWsmF0Grhhl0	1	2022-08-05 12:19:34.755701-03	\N
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU5NzMxMzM2fQ.QFtZKnWrr5V-lrnE0tyU-qfq0Ut8z_RKHz8A8DrkZb4	3	2022-08-05 17:28:56.063888-03	\N
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImlhdCI6MTY1OTc5Nzk1NH0.SvKhd96CcfbsQRUzgtfyoe33eO71lLWuVT0WUtIL5TE	10	2022-08-06 11:59:14.952592-03	\N
\.


--
-- Data for Name: shortUrls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."shortUrls" (id, identifier, "visitCount", "urlId", "userId", "createdAt") FROM stdin;
10	5DVQGQUo2D7WZPXmG4gnj	0	27	10	2022-08-06
11	Xoc5BrUWAdIfEZRMxxRta	0	27	10	2022-08-06
12	ycCG1q-sgbQFJnBWnZz7d	0	27	10	2022-08-06
13	65-V2esQ3BIEV-TSF1fLJ	0	27	10	2022-08-06
5	PmdoMdXRWS4LeNkePkvbA	2	22	3	2022-08-05
2	XKavEGpmtpJtZSRzrKxhb	2	14	1	2022-08-05
6	bO0LXu6QV8mv2Bhmw5hc7	101	23	3	2022-08-05
7	jKMVKiajKYAOQfZFhdWZd	0	24	3	2022-08-05
3	3KJvyWwJgySzJbUU4SEBt	11	20	1	2022-08-05
8	Js7Er321PwGTMnDmNnAa0	5	25	3	2022-08-05
14	fQ53Ht9nPpUanWuQirudK	35	27	10	2022-08-06
9	LoercWWXXwkcGJWW2j24O	21	26	3	2022-08-05
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url, "createdAt", "userId") FROM stdin;
1	https://www.google.com	2022-08-05	1
2	https://www.google.com	2022-08-05	1
3	https://www.google.com	2022-08-05	1
4	https://www.google.com	2022-08-05	1
5	https://www.google.com	2022-08-05	1
6	https://www.google.com	2022-08-05	1
7	https://www.google.com	2022-08-05	1
8	https://www.google.com	2022-08-05	1
9	https://www.google.com	2022-08-05	1
10	https://www.google.com	2022-08-05	1
11	https://www.google.com	2022-08-05	1
12	https://www.google.com	2022-08-05	1
13	https://www.google.com	2022-08-05	1
14	https://www.google.com.br	2022-08-05	1
15	https://www.google.com.br	2022-08-05	1
16	https://www.google.com.br	2022-08-05	1
17	https://www.google.com.br	2022-08-05	1
18	https://www.google.com.br	2022-08-05	1
19	https://www.google.com.br	2022-08-05	1
20	https://www.facebook.com	2022-08-05	1
21	https://www.facebook.com	2022-08-05	2
22	www.com	2022-08-05	3
23	www.facebook.com.br	2022-08-05	3
24	http://.www	2022-08-05	3
25	https://.www	2022-08-05	3
26	https://www.google.com.br	2022-08-05	3
27	https://www.google.com.br	2022-08-06	10
28	https://www.google.com.br	2022-08-06	10
29	https://www.google.com.br	2022-08-06	10
30	https://www.google.com.br	2022-08-06	10
31	https://www.google.com.br	2022-08-06	10
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	lucas local	lucas@lucas.com	$2b$10$62yOqYsCADacrILYe0rPEO0O/6zcUXAIquckyqd.AmE8MDKmbksqW	2022-08-05
2	lucas local	lucas@lucassss.com	$2b$10$UF4lVpBJMu9JvPVP4/lqPe2GL53d5XftVFIntT8N.3eitYFStF2Mu	2022-08-05
3	meu novo teste	meuemail@email.com	$2b$10$0laLo12ap3dj.HF8vWFzHOGw/.HGRCaXL5VNB3MufKFD1ryE2K6Wu	2022-08-05
4	lucas1	lucas@email1.com	$2b$10$kBPvvzDK9RN.KlJsAJy/we80jV5YhFH7xHUgnoQe8dTzzi2XUz2iK	2022-08-06
5	lucas2	lucas@email2.com	$2b$10$.9TFA1PdI3rCrhNbg8iSI.yHE0xnithgZICGkBP0qcWafW.qWIBFq	2022-08-06
6	lucas3	lucas@email3.com	$2b$10$dSTH7OYkz0rH8pWZm1WUX.KEdWuJ.02GodBEuvrms/1Cdp2oDALTm	2022-08-06
7	lucas4	lucas@email4.com	$2b$10$pVAWlTX6P2L88RVuQsDQSedZXECimpUSmVSydh6.TtTMyezG87oui	2022-08-06
8	lucas5	lucas@email5.com	$2b$10$3t9g39/789aE15EFnQAN8eTel3Rfnp3JEqkgKddl6FDNpD6n8d2gK	2022-08-06
9	lucas6	lucas@email6.com	$2b$10$MYxv/11yVVneLOIyqAEAQOpzqZMOwOgp4PbyR42Ccar5wVe46AhxW	2022-08-06
10	lucas7	lucas@email7.com	$2b$10$moUDVpbX5CpaR8uNM3nl5OsFAy47N/SsIR1uSHSrxHA1as1ldq3Jm	2022-08-06
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 5, true);


--
-- Name: shortUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."shortUrls_id_seq"', 14, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 31, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: shortUrls shortUrls_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_identifier_key" UNIQUE (identifier);


--
-- Name: shortUrls shortUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_pkey" PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shortUrls shortUrls_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: shortUrls shortUrls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shortUrls"
    ADD CONSTRAINT "shortUrls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

