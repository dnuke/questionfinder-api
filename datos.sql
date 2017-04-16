--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO jose;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO jose;

--
-- Name: v1_answers; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE v1_answers (
    id integer NOT NULL,
    ansdata text,
    ref text,
    v1_question_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE v1_answers OWNER TO jose;

--
-- Name: v1_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE v1_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v1_answers_id_seq OWNER TO jose;

--
-- Name: v1_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE v1_answers_id_seq OWNED BY v1_answers.id;


--
-- Name: v1_categories; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE v1_categories (
    id integer NOT NULL,
    name text,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE v1_categories OWNER TO jose;

--
-- Name: v1_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE v1_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v1_categories_id_seq OWNER TO jose;

--
-- Name: v1_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE v1_categories_id_seq OWNED BY v1_categories.id;


--
-- Name: v1_forms; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE v1_forms (
    id integer NOT NULL,
    title text,
    details text,
    banksize integer,
    questions_count integer,
    visits_count integer,
    reports_count integer,
    v1_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE v1_forms OWNER TO jose;

--
-- Name: v1_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE v1_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v1_forms_id_seq OWNER TO jose;

--
-- Name: v1_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE v1_forms_id_seq OWNED BY v1_forms.id;


--
-- Name: v1_questions; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE v1_questions (
    id integer NOT NULL,
    questdata text,
    v1_form_id integer,
    v1_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE v1_questions OWNER TO jose;

--
-- Name: v1_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE v1_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v1_questions_id_seq OWNER TO jose;

--
-- Name: v1_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE v1_questions_id_seq OWNED BY v1_questions.id;


--
-- Name: v1_reports; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE v1_reports (
    id integer NOT NULL,
    email character varying,
    debrief text,
    v1_form_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE v1_reports OWNER TO jose;

--
-- Name: v1_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE v1_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v1_reports_id_seq OWNER TO jose;

--
-- Name: v1_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE v1_reports_id_seq OWNED BY v1_reports.id;


--
-- Name: v1_types; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE v1_types (
    id integer NOT NULL,
    alias character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE v1_types OWNER TO jose;

--
-- Name: v1_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE v1_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v1_types_id_seq OWNER TO jose;

--
-- Name: v1_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE v1_types_id_seq OWNED BY v1_types.id;


--
-- Name: v1_answers id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_answers ALTER COLUMN id SET DEFAULT nextval('v1_answers_id_seq'::regclass);


--
-- Name: v1_categories id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_categories ALTER COLUMN id SET DEFAULT nextval('v1_categories_id_seq'::regclass);


--
-- Name: v1_forms id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_forms ALTER COLUMN id SET DEFAULT nextval('v1_forms_id_seq'::regclass);


--
-- Name: v1_questions id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_questions ALTER COLUMN id SET DEFAULT nextval('v1_questions_id_seq'::regclass);


--
-- Name: v1_reports id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_reports ALTER COLUMN id SET DEFAULT nextval('v1_reports_id_seq'::regclass);


--
-- Name: v1_types id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_types ALTER COLUMN id SET DEFAULT nextval('v1_types_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-04-09 14:19:32.399291	2017-04-09 14:19:32.399291
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY schema_migrations (version) FROM stdin;
20170328165654
20170328165655
20170328165656
20170328165657
20170328165658
20170328165659
\.


--
-- Data for Name: v1_answers; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY v1_answers (id, ansdata, ref, v1_question_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: v1_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('v1_answers_id_seq', 1, false);


--
-- Data for Name: v1_categories; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY v1_categories (id, name, description, created_at, updated_at) FROM stdin;
2	Idiomas	Cuestionarios relacionados con idiomas y lenguas extranjeras	2017-04-09 14:23:45.987281	2017-04-09 14:23:45.987281
3	Matemática	Cuestionarios relacionados con las ciencias matemáticas.	2017-04-14 23:27:40.001273	2017-04-14 23:27:40.001273
\.


--
-- Name: v1_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('v1_categories_id_seq', 3, true);


--
-- Data for Name: v1_forms; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY v1_forms (id, title, details, banksize, questions_count, visits_count, reports_count, v1_category_id, created_at, updated_at) FROM stdin;
7	Expresiones en inglés	Preguntas acerca de algunas expresiones que en ingles tienen un significado muy diferente al que tienen en español.	5	0	0	0	2	2017-04-09 20:14:46.860577	2017-04-09 20:15:53.941553
6	Venezolanismos mas comunes	Preguntas acerca de palabras que en Venezuela son usadas comúnmente, aunque no siempre coincida su significado con el internacional	4	0	0	0	2	2017-04-09 14:34:54.65498	2017-04-09 20:37:01.982506
5	Palabras japonesas mas usadas	Muchas preguntas acerca del significado de diversas palabras japonesas, las cuales se colocan de forma transliterada.	4	0	0	0	2	2017-04-09 14:32:50.608973	2017-04-14 23:26:18.040484
8	Números especiales en la matemática	En este cuestionario se trata el tema de los valores matemáticos mas importantes en la naturaleza, como es el caso del número ∏, el e, o el número áureo.	6	0	0	0	3	2017-04-14 23:28:43.837411	2017-04-14 23:28:43.837411
\.


--
-- Name: v1_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('v1_forms_id_seq', 8, true);


--
-- Data for Name: v1_questions; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY v1_questions (id, questdata, v1_form_id, v1_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: v1_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('v1_questions_id_seq', 1, false);


--
-- Data for Name: v1_reports; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY v1_reports (id, email, debrief, v1_form_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: v1_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('v1_reports_id_seq', 1, false);


--
-- Data for Name: v1_types; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY v1_types (id, alias, created_at, updated_at) FROM stdin;
\.


--
-- Name: v1_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('v1_types_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: v1_answers v1_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_answers
    ADD CONSTRAINT v1_answers_pkey PRIMARY KEY (id);


--
-- Name: v1_categories v1_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_categories
    ADD CONSTRAINT v1_categories_pkey PRIMARY KEY (id);


--
-- Name: v1_forms v1_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_forms
    ADD CONSTRAINT v1_forms_pkey PRIMARY KEY (id);


--
-- Name: v1_questions v1_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_questions
    ADD CONSTRAINT v1_questions_pkey PRIMARY KEY (id);


--
-- Name: v1_reports v1_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_reports
    ADD CONSTRAINT v1_reports_pkey PRIMARY KEY (id);


--
-- Name: v1_types v1_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_types
    ADD CONSTRAINT v1_types_pkey PRIMARY KEY (id);


--
-- Name: index_v1_answers_on_v1_question_id; Type: INDEX; Schema: public; Owner: jose
--

CREATE INDEX index_v1_answers_on_v1_question_id ON v1_answers USING btree (v1_question_id);


--
-- Name: index_v1_forms_on_v1_category_id; Type: INDEX; Schema: public; Owner: jose
--

CREATE INDEX index_v1_forms_on_v1_category_id ON v1_forms USING btree (v1_category_id);


--
-- Name: index_v1_questions_on_v1_form_id; Type: INDEX; Schema: public; Owner: jose
--

CREATE INDEX index_v1_questions_on_v1_form_id ON v1_questions USING btree (v1_form_id);


--
-- Name: index_v1_questions_on_v1_type_id; Type: INDEX; Schema: public; Owner: jose
--

CREATE INDEX index_v1_questions_on_v1_type_id ON v1_questions USING btree (v1_type_id);


--
-- Name: index_v1_reports_on_v1_form_id; Type: INDEX; Schema: public; Owner: jose
--

CREATE INDEX index_v1_reports_on_v1_form_id ON v1_reports USING btree (v1_form_id);


--
-- Name: v1_forms fk_rails_151809e65d; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_forms
    ADD CONSTRAINT fk_rails_151809e65d FOREIGN KEY (v1_category_id) REFERENCES v1_categories(id);


--
-- Name: v1_answers fk_rails_55e734054c; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_answers
    ADD CONSTRAINT fk_rails_55e734054c FOREIGN KEY (v1_question_id) REFERENCES v1_questions(id);


--
-- Name: v1_questions fk_rails_6c42794222; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_questions
    ADD CONSTRAINT fk_rails_6c42794222 FOREIGN KEY (v1_type_id) REFERENCES v1_types(id);


--
-- Name: v1_reports fk_rails_b5653dbb1e; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_reports
    ADD CONSTRAINT fk_rails_b5653dbb1e FOREIGN KEY (v1_form_id) REFERENCES v1_forms(id);


--
-- Name: v1_questions fk_rails_dadaec7536; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY v1_questions
    ADD CONSTRAINT fk_rails_dadaec7536 FOREIGN KEY (v1_form_id) REFERENCES v1_forms(id);


--
-- PostgreSQL database dump complete
--

