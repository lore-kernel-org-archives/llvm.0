Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA4241672
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741370394; cv=fail; b=W9GY6vvDToiPHSzDrx+Qz3joCTsB0KAraCOGLYGwIH2yOjBkUInU/KAmW2vcJ5CgOdLi77sxOrQydlw9x0AOzwv6WnBo0DzIf/5pWVN7oG9QntTyyIWB3FbwAvh5TmgSMbjcdpNQ/Zoul3xXO/tXMdERTmxgAKkXPrFsEtDDXO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741370394; c=relaxed/simple;
	bh=Ake/euDB6aPuM+sqS9hVG2vlyFEVroC3wiRg0BrHxFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SBzSozUXy/0Q2l8beInHLnCzoQKo+bSx4jrc/bQT/KuM+2exTrQyzrDg2sLu0RcJe1ODCmd5E28Xv0O1DK+2404z/GhnDzpecbHsC4PZaXtWuPspU6iJ6+5qERbV1Ipaziax/1tfoXS8aYcBxq0hvIjKfN2bVmZZHQm93a+3exA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=JVbjronM; arc=fail smtp.client-ip=40.107.162.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="JVbjronM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/8s0pCwYKNcfo2OXJmZu9Cfu34lwbdd6VnErn67/I5MxmiYAtpQa2+6UVj7NxgvvPpaARlk1QpSYbWSL8fm/+NM7cz5rtYP13bY+S1SgLEzf2XpYTiE9szO8a4vVtYdKFD5aKofAOpyl0g2NhNLS0LnELulwhj7X9HxbURCf6cS6JLXSlDlrZA5EEjBzFp3CgFUjuR9/cXMDEvcBnn5ytLZ69/2u9tOw0WrZ3y7c/PpECmFsgKSqJyQr2OvY/kXLU3pcevjGM/ak0GSQRF5WqOLPixleiYbCZuEblFL0KqJycmW5kI7xeZcS+KA1hXpTPguCqpoUtpsbBGKRvXyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jakm70fkLI3cZT4S9raTypSnJce/nqVmvzIioOHAdHc=;
 b=BFb6zIuOQ8PdThA38CCmsC33G0xO0FIvqxvvEHBtkx36hnWsLepZ3RkZ65DoRK6c122I7bNOAEU6SAsilGEaf3arfBWcIPW4bQuptwekhSFXNoHeo5Q6Y+JLyTtkSz54eyQ8yXwbohXLnSmEeiFt7I4BzEI6zaDpcUjTZy+7aHsFcvtbGRFM0FeWyAN/oxnjjJ5qh24IfU4L/GM4ZdgNF711SBM5XyHxDm1FSOqWjFA694MGWRg30C3ayOqTCrFr6dP6qSP4wc9+SjiOSargOIY8XDzp9/scLG+W0bO1f5LgLzKUQhSqPgTVEdQPXqsOtmgW/rfJV5PXRqLois5noQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jakm70fkLI3cZT4S9raTypSnJce/nqVmvzIioOHAdHc=;
 b=JVbjronMUytzWb0lWugfd8d7vCIZnUZtw+pOE5wmCDZjZBUBqLHQygFTd4Ys/gVTR3/36hzmDKK4QboH+wGWGB6TxJmlTcvYZbcuJmzAzuCJ5y3pbi+L10bomKbFOl43/Mxo8aQEcNJgEDznzaWSKlbaEpEt7LKdm3ho6MskQUUJteXgQGJcA1FX1zVk++CkK9vD8O3EQD7zb0YuXhG1AeWEvKgPk4OhBw3XdQHXxYVXvaU5X53tp2JLpwOi8/HuStTLrHyx5YQI21AkSF1/nDQklpegA2f9A5SVPWOe1vTlYMvnlp/jZpfCllaMuAD+ALlChOghBAHJB32ErahRqA==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 GVXPR02MB10762.eurprd02.prod.outlook.com (2603:10a6:150:158::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 17:59:49 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 17:59:49 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Bart Van Assche <bvanassche@acm.org>, Boqun Feng
	<boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAGWK4CAAGY9gIAAB6aAgAEXUGA=
Date: Fri, 7 Mar 2025 17:59:49 +0000
Message-ID:
 <DB7PR02MB36266CD6025FAB7701A344A1E7D52@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <119f37e4-bbcb-403a-9f63-5b9001233c0a@paulmck-laptop>
 <DB7PR02MB36260D226AF2863E6F404B79E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <03c9e1e0-cd70-4b2b-b494-97b98449adde@paulmck-laptop>
In-Reply-To: <03c9e1e0-cd70-4b2b-b494-97b98449adde@paulmck-laptop>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|GVXPR02MB10762:EE_
x-ms-office365-filtering-correlation-id: 5eddc69d-8f90-419a-11f9-08dd5da1da6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QLYoGuZD/NyCVYpWCVaUcID6TnAXcKMITNfbn/J357zvkFW+/5T7D30cLI3b?=
 =?us-ascii?Q?ouzwcQ2OfT/UGXkSEh+YuQ56k6BHJMU15Cl5FzwXf1TA522cDTNLFIfUOwJW?=
 =?us-ascii?Q?DBAM8IUWS0I052WU92CgHfIdU2c9tvoLCn8OqtYdp0BO3g9i23RyTjzSnnB3?=
 =?us-ascii?Q?ffWBjrtUK+bQV0q+jgY6PA01dO4GrSHOFm9yzuXOEILDKs3/yOKbmhT32GyG?=
 =?us-ascii?Q?W5zyTLdGTT8BFNlLGfApYYPJrSj3ayTeDH1xx3PLU1CT75Z9sVETN/biCisP?=
 =?us-ascii?Q?MI5qQi5EYi+R4TyzDTLKdn7au1e+igUDAPS9vBw44dRS2dHJ6RcqN2GG0PsE?=
 =?us-ascii?Q?hcYeCmzfvyHkUl6BC86j21ybHOEbaF9NCilrsUdT4wF7w567f+4ktr1Nuf2n?=
 =?us-ascii?Q?U1VbthoEMCUaihCrQI9FErQNQpJqzGFhhTNNUnE+3QrZHraeGZhu+WCz0cuJ?=
 =?us-ascii?Q?BykSSXtrVsy8R/Zv/LBXmjEz2vhc3MMoSFnRrGAkSrVQgUXXqmt2cYNERVDV?=
 =?us-ascii?Q?b4NOgbIYnkVvzaFeDta9yt+8eydR0GVbfChDHjbHO6DHajhJubI8SXDnTLs5?=
 =?us-ascii?Q?jov8oKl7pEsa6E5eeC6ZQp6QBd58t4AuEFnr1nHqghdGD958YAHVyPXuQscy?=
 =?us-ascii?Q?4rd5fKeDSDtGZABjFYM3V+BFgMkCLJeiZXU0Bf/I9WJZGsXpJsxz9ntf+Pb5?=
 =?us-ascii?Q?vuWQoj0LR/Nn7qa2G6++hO90+bkjh5lBONV66Imtnlzr1OfhVvwHweq5plcF?=
 =?us-ascii?Q?qitcpirV/wQYM0Ip4YCmnmua137WvISouTkSqr6YCSKee5LLp9w1YDK0npkW?=
 =?us-ascii?Q?3MZipREigEgzyu1o2IqEiln0AHhlTIonvMK5bWod9e6HPamdHX8EQR+HQ2T8?=
 =?us-ascii?Q?hHwR/EzQ56NfTryTdq1gWSz6m3xM5jiDTkqMJepBURIUmJYZOvWnTu9T+POh?=
 =?us-ascii?Q?GkT0l7PW3rMBF7WnG4yjXpSYmMc79rx63znjjFdmwvSeKc8WrF3qOccRqJnC?=
 =?us-ascii?Q?NbGZS2ZU7oqZ7tTlY2XbZ/d5pFspvM0LxlRlymPEwBOTJ7ckAvVxQ08c+19D?=
 =?us-ascii?Q?DGpmUPEAkAj/CMGZMEjWhMpdMaPlsFYkp9CVLDDMGpoYgAXsyD3bBLGtGUsy?=
 =?us-ascii?Q?WPqYaV9WirfZYN13kgACD5Y5kBLac/LDcG57ZB+xNV5XFI2tn4kyzYxx+DG3?=
 =?us-ascii?Q?90XyqTzu1z2fQwuGRD3MGTqa8sa7NczSSLYmqGY2VSZwuBUgKGYkZshXvuC5?=
 =?us-ascii?Q?igMWa29mfHhJZt0TvDxsEcUFUxJ0mU+WQTooSPvcuf5ZwNfV678tbG00bIUa?=
 =?us-ascii?Q?zI8YX/ab4JSKC9M1dm8KK3GG/Jd2BZR3mPWeuYkc5hp9h7fexf1/KTUJM3nc?=
 =?us-ascii?Q?jWsEUinfuLKrifMuqMhej85lcdHdpKnNBWxDSYTW61caaFg+5Pq1lwUmEuEj?=
 =?us-ascii?Q?y6+bUImS8ZeC2pZWk3PVGj0R2rCpl+b2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3OnurjzmxzGB5F8h/z61MMBTypW8bPq7+QkLObaaJNoRqUaqtIU0lGsTsdm9?=
 =?us-ascii?Q?vQiw769atiJGirGvdduR3VKfe8B5mSsRweAInvFhuiHzYgtfQf58PQphDeQo?=
 =?us-ascii?Q?ZsTb996ortOT2t9A4nmWgpcVbBxhGxQuPGjnfaozgymyJBWRXhZMxlzgQgWD?=
 =?us-ascii?Q?Gi75mBq3EzSWDGDdcf7qc0kplAgYARxS8KlWLH+N/QetNulvkwSTv785yw7r?=
 =?us-ascii?Q?o2aaMTL/IKN+NTaiTr20ovF50+F3gK4BC3SYXDdD4GUj3UkgUG2rIAhUbHIw?=
 =?us-ascii?Q?4lTUFcfwN0q1wD9CrmreKzafXwqb6EHVG1NthW3pzK7NgvWEUoYffvNmTasw?=
 =?us-ascii?Q?zXk5T74/n2svosdLxdt7pBeE5EXVe0S48jb4bQpm9UQLL4U5Ia4swdrV3R4Q?=
 =?us-ascii?Q?BP1oZ6LoZvZNzeuqmS7JjaYn9qzxJvoSGhNtNitYsP3VwL2nr2y2X/jmHyMk?=
 =?us-ascii?Q?7pEuMki6HXsJz2bQsbSylNj3ddVy7NBcAJWbpG0wWrBsrnZuwvNEFzuj8C3R?=
 =?us-ascii?Q?fsODaWeE53phdMlj/MTxn1cdQvdeIVTspmU+0qvTZzyAcN9rHAoOrtpaxhXB?=
 =?us-ascii?Q?X+x+DjGrdwTbjdLVQZ0GIDfrjjlpz0D1AWnAAeQG0opy7qQ40TjG2CK1ybxo?=
 =?us-ascii?Q?/5z/hP8CrCemk+7nLOAjeH5GDnbaDJedIImjAcyxzOSja26UclUEXRayXTMd?=
 =?us-ascii?Q?jJ2ygZItaQVAHnzKQ8KOFc9xdkZSiUm5CUQeaJtoheFcfsbOFcgTLaEQ/jqn?=
 =?us-ascii?Q?ELqLyGeU09Yk/9Qx9v+qhiD5+NGe4hkTAJq7XF24z6qINoqPeVB877trYtB0?=
 =?us-ascii?Q?5fit8HW11pECwIe457WqFAHXABWN9wZKzz0As2YR93mz50u1K1jPeZlR+eWa?=
 =?us-ascii?Q?t6QKFyF1uEjglEav0qI0hKySz5+pPi+2Imkm266xgwAoCdZjCtFjM8A8O45T?=
 =?us-ascii?Q?oOSKfhBy9YBSjqL6bo1rs8VhKp/mpGW4wEy7m/jpjQ7NK3k/ir4TfOHAplZ/?=
 =?us-ascii?Q?MbdDp7vBwMwVUO6A4RWdJEVsvlsdXl3Tt/6Jlex6xYiwyfOrxaLQIerX/TgA?=
 =?us-ascii?Q?VVKGRNx57MJ9uIFM4cVv8C5T35TqldeFWJikxUS8vcR1fyZQpic9SaMEMEtK?=
 =?us-ascii?Q?qZif1kVBuoH7LC2wzvL8t1Pd8J1VYUox25XJJqQNQL7Vze9LsKldgVvwAezh?=
 =?us-ascii?Q?F5zkZ/GY1cEdhzZkKyWd2iLacax4X+9mwto2Ts1W6zNDbbTCHaypIGVotsbn?=
 =?us-ascii?Q?9DjBuOriolLxmDr1NT1BNnADK69brYs9MhecxLDzfc08pNIyjbZADI/PZw4I?=
 =?us-ascii?Q?r0w8SlqvEoSiNJf6Key4DMZf1cDFLLK4lpWGzQPuMbe8NOp/Reppvwjkyiod?=
 =?us-ascii?Q?e/866Sod1yQXSQokRCYb3xiBhplyBP2MffUbTf1yb5CZZLmsiZUCRTRkWg50?=
 =?us-ascii?Q?dIZmVALzRlHFAIDBkllkTV+hqJvxK3Exkj0s9xYlv7syYBUoJmo4Ss3SEJ21?=
 =?us-ascii?Q?xiTTU2obbVhHWhJA1D9Ua+iJwD50klI5S7UuZCJl6K+gxblxaSLTVq4Rpaa0?=
 =?us-ascii?Q?3QEOZKXqWAhN55b45ML6waH3PVO3h+HCs+/jfCLP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR02MB3626.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eddc69d-8f90-419a-11f9-08dd5da1da6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 17:59:49.1712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AgcfA0XyjxmZLPTM/29B9dEU+BrSeDEvCJaKrm6jcawdJkaoR8e51savMb3TXof7TqkuWwgzhwTuf6VH9d4FTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10762

> From: Paul E. McKenney <paulmck@kernel.org>
> Until such time as the analysis is carried out after inlining.  ;-)

The idea behind requiring the attributes is that we'll never have to do tha=
t. We let the programmer specify interface preconditions/postconditions so =
that we don't have to inspect the function body.

Inlining has enough disadvantages that it will probably never work here:
* Since we're looking at individual translation units and not the whole pro=
gram, we might not see function definitions. So the analysis would behave d=
ifferently based on whether a function is defined in a header or source fil=
e, which is undesirable. Some definitions might be in external libraries an=
d never be available.=20
* Even if we could see all definitions, there are complexity issues with in=
lining. We'd have to draw a line somewhere, which would make the analysis u=
npredictable as well.

But these are just the reasons for the design decision. What matters is the=
 decision itself to consider bodies of other functions as black boxes and o=
nly work with the attributes on their declaration. I guess we could also mo=
re clearly document this.

Aaron
