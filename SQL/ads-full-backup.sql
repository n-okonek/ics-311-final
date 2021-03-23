--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 10.15

-- Started on 2021-03-23 13:21:29 CDT

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

--
-- TOC entry 8 (class 2615 OID 16856)
-- Name: ads; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ads;


ALTER SCHEMA ads OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 13241)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16880)
-- Name: doctor; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.doctor (
    id integer NOT NULL,
    fname character varying(45) NOT NULL,
    lname character varying(45) NOT NULL,
    mi character varying(45)
);


ALTER TABLE ads.doctor OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16878)
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.doctor_id_seq OWNER TO postgres;

--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 201
-- Name: doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.doctor_id_seq OWNED BY ads.doctor.id;


--
-- TOC entry 213 (class 1259 OID 16946)
-- Name: inventory; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.inventory (
    drawer integer NOT NULL,
    machine integer NOT NULL,
    medication integer,
    qty integer,
    active boolean,
    audit_date date,
    last_audited_by integer,
    min_qty integer,
    max_qty integer
);


ALTER TABLE ads.inventory OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16919)
-- Name: machine; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.machine (
    id integer NOT NULL,
    floor integer,
    num_drawers integer
);


ALTER TABLE ads.machine OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16917)
-- Name: machine_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.machine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.machine_id_seq OWNER TO postgres;

--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 207
-- Name: machine_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.machine_id_seq OWNED BY ads.machine.id;


--
-- TOC entry 204 (class 1259 OID 16888)
-- Name: medication; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.medication (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    expiration date NOT NULL
);


ALTER TABLE ads.medication OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16886)
-- Name: medication_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.medication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.medication_id_seq OWNER TO postgres;

--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 203
-- Name: medication_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.medication_id_seq OWNED BY ads.medication.id;


--
-- TOC entry 215 (class 1259 OID 16968)
-- Name: nurse; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.nurse (
    id integer NOT NULL,
    shift character varying(45)
);


ALTER TABLE ads.nurse OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16966)
-- Name: nurse_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.nurse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.nurse_id_seq OWNER TO postgres;

--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 214
-- Name: nurse_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.nurse_id_seq OWNED BY ads.nurse.id;


--
-- TOC entry 206 (class 1259 OID 16896)
-- Name: order; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads."order" (
    id integer NOT NULL,
    patient integer,
    doctor integer,
    medication integer,
    status character varying(45)
);


ALTER TABLE ads."order" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16894)
-- Name: order_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.order_id_seq OWNER TO postgres;

--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 205
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.order_id_seq OWNED BY ads."order".id;


--
-- TOC entry 200 (class 1259 OID 16867)
-- Name: patient; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.patient (
    id integer NOT NULL,
    fname character varying(45) NOT NULL,
    lname character varying(45) NOT NULL,
    mi character varying(45),
    floor integer NOT NULL,
    p_group integer,
    status integer
);


ALTER TABLE ads.patient OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16865)
-- Name: patient_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.patient_id_seq OWNER TO postgres;

--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 199
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.patient_id_seq OWNED BY ads.patient.id;


--
-- TOC entry 210 (class 1259 OID 16927)
-- Name: role; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.role (
    id integer NOT NULL,
    type character varying(45) NOT NULL
);


ALTER TABLE ads.role OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16925)
-- Name: role_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.role_id_seq OWNER TO postgres;

--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 209
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.role_id_seq OWNED BY ads.role.id;


--
-- TOC entry 198 (class 1259 OID 16859)
-- Name: status; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads.status (
    id integer NOT NULL,
    status character varying(45)
);


ALTER TABLE ads.status OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16857)
-- Name: status_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.status_id_seq OWNER TO postgres;

--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 197
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.status_id_seq OWNED BY ads.status.id;


--
-- TOC entry 212 (class 1259 OID 16935)
-- Name: user; Type: TABLE; Schema: ads; Owner: postgres
--

CREATE TABLE ads."user" (
    id integer NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(255) NOT NULL,
    role integer,
    fname character varying(45),
    lname character varying(45),
    mi character varying(10)
);


ALTER TABLE ads."user" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16933)
-- Name: user_id_seq; Type: SEQUENCE; Schema: ads; Owner: postgres
--

CREATE SEQUENCE ads.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads.user_id_seq OWNER TO postgres;

--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 211
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: ads; Owner: postgres
--

ALTER SEQUENCE ads.user_id_seq OWNED BY ads."user".id;


--
-- TOC entry 3042 (class 2604 OID 16883)
-- Name: doctor id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.doctor ALTER COLUMN id SET DEFAULT nextval('ads.doctor_id_seq'::regclass);


--
-- TOC entry 3045 (class 2604 OID 16922)
-- Name: machine id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.machine ALTER COLUMN id SET DEFAULT nextval('ads.machine_id_seq'::regclass);


--
-- TOC entry 3043 (class 2604 OID 16891)
-- Name: medication id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.medication ALTER COLUMN id SET DEFAULT nextval('ads.medication_id_seq'::regclass);


--
-- TOC entry 3048 (class 2604 OID 16971)
-- Name: nurse id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.nurse ALTER COLUMN id SET DEFAULT nextval('ads.nurse_id_seq'::regclass);


--
-- TOC entry 3044 (class 2604 OID 16899)
-- Name: order id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."order" ALTER COLUMN id SET DEFAULT nextval('ads.order_id_seq'::regclass);


--
-- TOC entry 3041 (class 2604 OID 16870)
-- Name: patient id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.patient ALTER COLUMN id SET DEFAULT nextval('ads.patient_id_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 16930)
-- Name: role id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.role ALTER COLUMN id SET DEFAULT nextval('ads.role_id_seq'::regclass);


--
-- TOC entry 3040 (class 2604 OID 16862)
-- Name: status id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.status ALTER COLUMN id SET DEFAULT nextval('ads.status_id_seq'::regclass);


--
-- TOC entry 3047 (class 2604 OID 16938)
-- Name: user id; Type: DEFAULT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."user" ALTER COLUMN id SET DEFAULT nextval('ads.user_id_seq'::regclass);


--
-- TOC entry 3204 (class 0 OID 16880)
-- Dependencies: 202
-- Data for Name: doctor; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.doctor (id, fname, lname, mi) VALUES (1, 'Caroly', 'Josh', 'T');
INSERT INTO ads.doctor (id, fname, lname, mi) VALUES (2, 'Rudie', 'Vincion', 'U');
INSERT INTO ads.doctor (id, fname, lname, mi) VALUES (3, 'Luffy', 'Jay', 'J');
INSERT INTO ads.doctor (id, fname, lname, mi) VALUES (4, 'Robinson', 'Robin', 'H');


--
-- TOC entry 3215 (class 0 OID 16946)
-- Dependencies: 213
-- Data for Name: inventory; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.inventory (drawer, machine, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) VALUES (1, 3, 3, 10, true, '2020-06-20', 15, 20, 50);
INSERT INTO ads.inventory (drawer, machine, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) VALUES (3, 4, 6, 10, true, '2020-06-20', 15, 20, 50);
INSERT INTO ads.inventory (drawer, machine, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) VALUES (4, 4, 7, 10, true, '2020-06-20', 15, 20, 50);
INSERT INTO ads.inventory (drawer, machine, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) VALUES (2, 1, 5, 10, true, '2020-06-20', 15, 20, 50);
INSERT INTO ads.inventory (drawer, machine, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) VALUES (1, 2, 5, 10, true, '2020-06-20', 15, 20, 50);


--
-- TOC entry 3210 (class 0 OID 16919)
-- Dependencies: 208
-- Data for Name: machine; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.machine (id, floor, num_drawers) VALUES (1, 1, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (2, 2, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (3, 3, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (4, 4, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (5, 5, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (6, 6, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (7, 1, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (8, 2, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (9, 3, 5);
INSERT INTO ads.machine (id, floor, num_drawers) VALUES (10, 4, 5);


--
-- TOC entry 3206 (class 0 OID 16888)
-- Dependencies: 204
-- Data for Name: medication; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.medication (id, name, expiration) VALUES (1, '', '2021-03-20');
INSERT INTO ads.medication (id, name, expiration) VALUES (2, 'Adderall', '2020-09-01');
INSERT INTO ads.medication (id, name, expiration) VALUES (3, 'Amitriptyline', '2019-06-26');
INSERT INTO ads.medication (id, name, expiration) VALUES (4, 'Amlodipine', '2018-05-20');
INSERT INTO ads.medication (id, name, expiration) VALUES (5, 'Dupixent', '2017-03-16');
INSERT INTO ads.medication (id, name, expiration) VALUES (6, 'Buprenorphine', '2020-01-10');
INSERT INTO ads.medication (id, name, expiration) VALUES (7, 'Brilinta', '2011-11-11');
INSERT INTO ads.medication (id, name, expiration) VALUES (8, 'Clindamycin', '2015-10-15');
INSERT INTO ads.medication (id, name, expiration) VALUES (9, 'Trazodone', '2011-07-19');
INSERT INTO ads.medication (id, name, expiration) VALUES (10, 'Ozempic', '2011-10-11');
INSERT INTO ads.medication (id, name, expiration) VALUES (11, 'Kevzara', '2013-08-08');
INSERT INTO ads.medication (id, name, expiration) VALUES (12, 'Omeprazole', '2000-01-30');
INSERT INTO ads.medication (id, name, expiration) VALUES (13, 'Probuphine', '2013-05-28');
INSERT INTO ads.medication (id, name, expiration) VALUES (14, 'Zubsolv', '2019-04-23');
INSERT INTO ads.medication (id, name, expiration) VALUES (15, 'Lyrica', '2017-06-17');
INSERT INTO ads.medication (id, name, expiration) VALUES (16, 'Methotrexate', '2014-07-10');
INSERT INTO ads.medication (id, name, expiration) VALUES (17, 'Fentanyl Patch', '2000-10-01');
INSERT INTO ads.medication (id, name, expiration) VALUES (18, 'Gilenya', '2013-09-11');
INSERT INTO ads.medication (id, name, expiration) VALUES (19, 'Hydroxychloroquine', '2019-08-10');
INSERT INTO ads.medication (id, name, expiration) VALUES (20, 'Invokana', '2021-10-20');
INSERT INTO ads.medication (id, name, expiration) VALUES (21, 'Naltrexone', '1999-10-20');


--
-- TOC entry 3217 (class 0 OID 16968)
-- Dependencies: 215
-- Data for Name: nurse; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.nurse (id, shift) VALUES (2, 'One');
INSERT INTO ads.nurse (id, shift) VALUES (3, '1st');
INSERT INTO ads.nurse (id, shift) VALUES (17, '1st');
INSERT INTO ads.nurse (id, shift) VALUES (4, '1st');
INSERT INTO ads.nurse (id, shift) VALUES (5, '2nd');
INSERT INTO ads.nurse (id, shift) VALUES (6, '2nd');
INSERT INTO ads.nurse (id, shift) VALUES (11, '3rd');
INSERT INTO ads.nurse (id, shift) VALUES (10, '3rd');
INSERT INTO ads.nurse (id, shift) VALUES (9, '3rd');
INSERT INTO ads.nurse (id, shift) VALUES (8, '2nd');
INSERT INTO ads.nurse (id, shift) VALUES (7, '4th');
INSERT INTO ads.nurse (id, shift) VALUES (12, '2nd');
INSERT INTO ads.nurse (id, shift) VALUES (13, '4th');
INSERT INTO ads.nurse (id, shift) VALUES (14, '4rd');
INSERT INTO ads.nurse (id, shift) VALUES (16, '4th');


--
-- TOC entry 3208 (class 0 OID 16896)
-- Dependencies: 206
-- Data for Name: order; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (2, 6, 1, 2, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (3, 7, 2, 3, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (4, 8, 3, 10, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (5, 7, 2, 15, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (6, 5, 1, 10, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (7, 8, 3, 13, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (8, 5, 1, 4, 'A prescription is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (9, 8, 3, 12, 'A prescription is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (10, 7, 2, 8, 'A prescription is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (11, 9, 4, 11, 'A prescription is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (12, 7, 2, 5, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (13, 9, 4, 10, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (14, 7, 2, 9, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (15, 7, 2, 9, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (16, 8, 3, 6, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (17, 8, 3, 8, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (18, 8, 3, 2, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (19, 9, 4, 16, 'A payment is due');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (20, 8, 3, 6, 'A payment is due');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (21, 7, 2, 2, 'A payment is due');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (22, 8, 3, 10, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (23, 8, 3, 20, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (24, 8, 3, 10, 'Your order is ready to pick up');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (25, 8, 3, 20, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (26, 9, 4, 11, 'A presciption is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (27, 9, 4, 17, 'A prescription is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (28, 9, 4, 12, 'An order had been taken');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (29, 8, 3, 17, 'A prescription is ready for refill');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (30, 9, 4, 3, 'Your careteam needs to speak with you');
INSERT INTO ads."order" (id, patient, doctor, medication, status) VALUES (31, 9, 4, 21, 'An order had been taken');


--
-- TOC entry 3202 (class 0 OID 16867)
-- Dependencies: 200
-- Data for Name: patient; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.patient (id, fname, lname, mi, floor, p_group, status) VALUES (5, 'Nami', 'Christin', '', 2, 1, 7);
INSERT INTO ads.patient (id, fname, lname, mi, floor, p_group, status) VALUES (6, 'Franky', 'king', '', 1, 3, 6);
INSERT INTO ads.patient (id, fname, lname, mi, floor, p_group, status) VALUES (7, 'Robinson', 'Smith', '', 3, 4, 8);
INSERT INTO ads.patient (id, fname, lname, mi, floor, p_group, status) VALUES (8, 'Victoria', 'Hasty', '', 4, 4, 9);
INSERT INTO ads.patient (id, fname, lname, mi, floor, p_group, status) VALUES (9, 'Kim', 'Nguyen', '', 4, 4, 10);


--
-- TOC entry 3212 (class 0 OID 16927)
-- Dependencies: 210
-- Data for Name: role; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.role (id, type) VALUES (1, 'Nurse');


--
-- TOC entry 3200 (class 0 OID 16859)
-- Dependencies: 198
-- Data for Name: status; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads.status (id, status) VALUES (6, 'Good');
INSERT INTO ads.status (id, status) VALUES (7, 'Fair');
INSERT INTO ads.status (id, status) VALUES (8, 'Poor');
INSERT INTO ads.status (id, status) VALUES (9, 'Critical');
INSERT INTO ads.status (id, status) VALUES (10, 'Treated and Released');
INSERT INTO ads.status (id, status) VALUES (11, 'Treated and Transferred');


--
-- TOC entry 3214 (class 0 OID 16935)
-- Dependencies: 212
-- Data for Name: user; Type: TABLE DATA; Schema: ads; Owner: postgres
--

INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (2, 'Vitory', 'Thunder234', NULL, 'victor', 'Lucas', 'T');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (3, 'John3421', 'Hacker9', NULL, 'John', 'Lee', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (4, 'Mssummer8573', 'Flower', NULL, 'May', 'Lee', 'K');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (5, 'gjior88', 'Jupiter', NULL, 'Bao', 'Vu', 'T');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (6, 'f4snke', 'Minnesota', NULL, 'Luois', 'christerpher', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (7, 'Jhug8d', 'Hacker9', NULL, 'John', 'Lee', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (8, 'John3421', 'Hacker9', NULL, 'Ruddie', 'Illinoize', 'H');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (9, 'jjllji4', 'Minnesota', NULL, 'Harry', 'Porter', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (10, 'fihnk43', 'hnfaof', NULL, 'Jonny', 'Depp', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (11, 'Hon3421', 'Sunshine3u4', NULL, 'Anna', 'Ellizabet', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (12, 'lgkaeer1', 'Kitten48520', NULL, 'Robert', 'John', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (13, 'OwlsNight35k', 'MsNight101', NULL, 'Michaiel', 'kein', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (14, 'Programmer592', 'Javacodeisthebest43', NULL, 'Patricia', 'Venus', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (15, 'Coddingisfun204', 'I345po', NULL, 'Linda', 'Jame', '');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (16, 'Jo42e1', 'DinoSaurou394', NULL, 'John', 'Nguyen', 'T');
INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) VALUES (17, 'BBB', 'BBB22', NULL, 'Trinh', 'Nguyen', '');


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 201
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.doctor_id_seq', 4, true);


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 207
-- Name: machine_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.machine_id_seq', 10, true);


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 203
-- Name: medication_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.medication_id_seq', 21, true);


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 214
-- Name: nurse_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.nurse_id_seq', 641, true);


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 205
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.order_id_seq', 33, true);


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 199
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.patient_id_seq', 9, true);


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 209
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.role_id_seq', 1, true);


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 197
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.status_id_seq', 11, true);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 211
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: ads; Owner: postgres
--

SELECT pg_catalog.setval('ads.user_id_seq', 17, true);


--
-- TOC entry 3054 (class 2606 OID 16885)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- TOC entry 3066 (class 2606 OID 16950)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (drawer, machine);


--
-- TOC entry 3060 (class 2606 OID 16924)
-- Name: machine machine_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (id);


--
-- TOC entry 3056 (class 2606 OID 16893)
-- Name: medication medication_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.medication
    ADD CONSTRAINT medication_pkey PRIMARY KEY (id);


--
-- TOC entry 3068 (class 2606 OID 16973)
-- Name: nurse nurse_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.nurse
    ADD CONSTRAINT nurse_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 16901)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 2606 OID 16872)
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 16932)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 16864)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 3064 (class 2606 OID 16940)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 16907)
-- Name: order doctor; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT doctor FOREIGN KEY (doctor) REFERENCES ads.doctor(id);


--
-- TOC entry 3077 (class 2606 OID 16974)
-- Name: nurse id; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.nurse
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES ads."user"(id);


--
-- TOC entry 3075 (class 2606 OID 16956)
-- Name: inventory last_audited_by; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT last_audited_by FOREIGN KEY (last_audited_by) REFERENCES ads."user"(id);


--
-- TOC entry 3074 (class 2606 OID 16951)
-- Name: inventory machine; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT machine FOREIGN KEY (machine) REFERENCES ads.machine(id);


--
-- TOC entry 3072 (class 2606 OID 16912)
-- Name: order medication; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT medication FOREIGN KEY (medication) REFERENCES ads.medication(id);


--
-- TOC entry 3076 (class 2606 OID 16961)
-- Name: inventory medication; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.inventory
    ADD CONSTRAINT medication FOREIGN KEY (medication) REFERENCES ads.medication(id);


--
-- TOC entry 3070 (class 2606 OID 16902)
-- Name: order patient; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."order"
    ADD CONSTRAINT patient FOREIGN KEY (patient) REFERENCES ads.patient(id);


--
-- TOC entry 3073 (class 2606 OID 16941)
-- Name: user role; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads."user"
    ADD CONSTRAINT role FOREIGN KEY (role) REFERENCES ads.role(id);


--
-- TOC entry 3069 (class 2606 OID 16873)
-- Name: patient status; Type: FK CONSTRAINT; Schema: ads; Owner: postgres
--

ALTER TABLE ONLY ads.patient
    ADD CONSTRAINT status FOREIGN KEY (status) REFERENCES ads.status(id);


-- Completed on 2021-03-23 13:21:30 CDT

--
-- PostgreSQL database dump complete
--

