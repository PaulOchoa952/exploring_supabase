--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-1.pgdg20.04+1)

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    patient_id integer,
    doctor_name character varying(100) NOT NULL,
    appointment_date date NOT NULL,
    appointment_time time without time zone NOT NULL,
    reason text,
    status character varying(50) DEFAULT 'Scheduled'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    date_of_birth date NOT NULL,
    gender character varying(10),
    contact_number character varying(15),
    email character varying(255),
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_patient_id_seq OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: patients patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (appointment_id, patient_id, doctor_name, appointment_date, appointment_time, reason, status, created_at) FROM stdin;
1	1	Dr. Smith	2024-11-01	09:00:00	Annual Checkup	Scheduled	2024-10-25 19:07:21.885626
2	2	Dr. Johnson	2024-11-03	10:30:00	Follow-up on Blood Test	Scheduled	2024-10-25 19:07:21.885626
3	3	Dr. Wilson	2024-11-05	14:00:00	Consultation for Headache	Scheduled	2024-10-25 19:07:21.885626
4	4	Dr. Lee	2024-11-07	11:00:00	Routine Examination	Scheduled	2024-10-25 19:07:21.885626
5	5	Dr. Brown	2024-11-10	13:30:00	Skin Rash Evaluation	Scheduled	2024-10-25 19:07:21.885626
6	6	Dr. Taylor	2024-11-12	15:00:00	Allergy Testing	Scheduled	2024-10-25 19:07:21.885626
7	7	Dr. Davis	2024-11-15	09:30:00	Physical Therapy	Scheduled	2024-10-25 19:07:21.885626
8	8	Dr. Garcia	2024-11-17	11:30:00	Nutritional Counseling	Scheduled	2024-10-25 19:07:21.885626
9	9	Dr. Martinez	2024-11-20	14:30:00	Mental Health Consultation	Scheduled	2024-10-25 19:07:21.885626
10	10	Dr. Anderson	2024-11-25	10:00:00	Cardiology Check	Scheduled	2024-10-25 19:07:21.885626
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, first_name, last_name, date_of_birth, gender, contact_number, email, address, created_at) FROM stdin;
1	John	Doe	1985-03-15	Male	555-1234	john.doe@example.com	123 Main St, Anytown, USA	2024-10-25 19:07:09.040544
2	Jane	Smith	1990-07-22	Female	555-5678	jane.smith@example.com	456 Elm St, Anytown, USA	2024-10-25 19:07:09.040544
3	Alice	Johnson	1982-11-30	Female	555-8765	alice.j@example.com	789 Maple St, Anytown, USA	2024-10-25 19:07:09.040544
4	Robert	Brown	1978-02-10	Male	555-4321	robert.brown@example.com	321 Oak St, Anytown, USA	2024-10-25 19:07:09.040544
5	Michael	Davis	1995-05-20	Male	555-1357	michael.davis@example.com	654 Pine St, Anytown, USA	2024-10-25 19:07:09.040544
6	Emily	Wilson	1993-09-18	Female	555-2468	emily.wilson@example.com	987 Cedar St, Anytown, USA	2024-10-25 19:07:09.040544
7	James	Taylor	1988-12-01	Male	555-3691	james.taylor@example.com	159 Birch St, Anytown, USA	2024-10-25 19:07:09.040544
8	Linda	Anderson	1984-06-25	Female	555-7890	linda.anderson@example.com	753 Walnut St, Anytown, USA	2024-10-25 19:07:09.040544
9	David	Thomas	1992-01-11	Male	555-8520	david.thomas@example.com	369 Spruce St, Anytown, USA	2024-10-25 19:07:09.040544
10	Sarah	Jackson	1986-04-05	Female	555-9632	sarah.jackson@example.com	258 Ash St, Anytown, USA	2024-10-25 19:07:09.040544
\.


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 10, true);


--
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 10, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- PostgreSQL database dump complete
--

