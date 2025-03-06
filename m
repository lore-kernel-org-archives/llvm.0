Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2089.outbound.protection.outlook.com [40.107.104.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2127602D
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741299518; cv=fail; b=fvvan01GaiRH50iuycRN3/ZlkGYiwMCEByxOepLtocEhrynB2rvhPOxvPRV0ak1UiUzhDsgZuLmfIkihkAeArG1JMQTuJxRBTMTl86nf4y/Wykk/s5jPSDvsyIqOCeAF/Z0fmvPOsbvnfqJNu02JOeqOSXfbb5s8RFll7lscfxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741299518; c=relaxed/simple;
	bh=7cvxBoAnN91chGwQaW7RA+248PBJvIFvN+hbZruF2/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tUriKHXK5lDlg+2eXiQ0NK+KG/5yKBu71y7AY5z5XNEx47Q7Xbc88SXaKUl+HfmNodMcL3BLAGD6JydjacJpWcZIOx+0nJwGeARjbcY5wvhBjzaeBQ7OojFKZ3rH0etMjTyVza+hre3PFeratThn2Yd7QlLyFd0x3Mtiij2AgEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=GIE+/xf1; arc=fail smtp.client-ip=40.107.104.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="GIE+/xf1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsWXRwgOO4Zsecm++bExiiMa//GrSnwx9XvXRZAt7BxOeXmeqkj921ETeqw0Nq60OiWrWpUribUmbJnIYy/UH03qNKWj8rKuFIFKt6vRuq+uTtDHqa6Zwa/h/GBR06miDpNrb8M8Ue08HbX0gI/nZmyoihtrCOEI+wa8TTC8MoaCfBpqjRQJ1KMNoNuuDcf6DKGEGEEiHPypS0LPKXI6BR3YhTfretvfqpgLNdEVdiD/GMPUHthppBosCND1eGy421N8oa+wA37eVqSc5Rh1yTRVa5JFoC7w70L8snsTMGD+SnUFaL7MMfCDsz2ooDQbfq8iiwymVWQGv6nsmkAk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2kaSknJYI8h69D6xkvqTMYAxjsIkJXQioFo6fvea0E=;
 b=eYZNa9lTAm4UxmCJEbJNx3vdaIJKVFQWlbU4P5vhQwhPPUqhVK1R4qCj2H6yNSe8zqkabx8S1lkBBFJE82v611ToczrAxPXxNMQrbMJ9jTk8r2Z/nv+iwVW1E8nTjmKb0TwKhe+5+4D0Qp+qjLG5yWZT8KKN4/wWvZVfdLwHoaczwynF1IUDw9Jvc0XVj2C8QDwC1eAuWk13AD3y4pJLnh/HpIDmxeeUKjXAD8C1pVmVSQBCNmfg6Gvu2TkupnZ7c95SuBTSZwSl7biyKcEOAv+frx1FPiBt+cmkAR9iCXANMNHMupCGbVaKaQdh+lE50HmshRY/swJLHsAarDHPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2kaSknJYI8h69D6xkvqTMYAxjsIkJXQioFo6fvea0E=;
 b=GIE+/xf1ZpMdEjbq4FuFS5H3XtrR+fmFm/fdN0AmqqjmR6mT2RnlYVLHeDXECEzg60OTfCtP6sWveQSjENbedP5DMCJ32K62sMOHtQ5khKpQrQ8tuRfouOOCVa5KFu26Y2NqLqdbfdyL/JV+NQMoOm+yCmxj5CMsvaBviJ9HEFBsJtYpFKogONxHOQgK00aGYgWia3PA+bnoVW5UZecue/VAPUi+0HkdLVIFV5YsG5czswmEiRRFQSWP6k5JmHeSq4q2HbzGTyhZOcYj8CILaEaK3J7xJlPS9aIS/qt8J1RA9nQoivg4JDe1WztRYOHID07oQd+crooxVe5pv9foEQ==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 AM9PR02MB7139.eurprd02.prod.outlook.com (2603:10a6:20b:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:18:33 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 22:18:33 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Bart Van Assche
	<bvanassche@acm.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAEgFwCAAL/4QA==
Date: Thu, 6 Mar 2025 22:18:32 +0000
Message-ID:
 <DB7PR02MB36269DCE8C78D8E5DB7C7AC6E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306100828.GD16878@noisy.programming.kicks-ass.net>
In-Reply-To: <20250306100828.GD16878@noisy.programming.kicks-ass.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|AM9PR02MB7139:EE_
x-ms-office365-filtering-correlation-id: dc2f4881-9e77-436a-25ea-08dd5cfcd4ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LSW8lCxmTnA0pcEcbdUhG6WxYkhBlopGxOH5qmpQDRtPEZ/x0/urIbe3xpJV?=
 =?us-ascii?Q?hZIfdEfjgUtIgAashKMESxD3eLliYHM1fwCljtq6PhXZrb+neVEn2TefsR86?=
 =?us-ascii?Q?NdzhfC7fV7ncNgfpqJXyuqcaX3h/YSg3QXHVKsfwKBqfr2OoOaDcYDML/x9i?=
 =?us-ascii?Q?j0q76jsRbdtmG68DPh40f1jaBwlwzetwdlT0WWlRqMHQ3kmbrqchCxuC6YHd?=
 =?us-ascii?Q?TqDxLCErnV3bC+/ZSaUW8CZn098BnibS1JuRKl2JD87F8VVRDLvihCst08BO?=
 =?us-ascii?Q?G/+CeN4YobrMJ/nmDJn58t3SRFMmVdn7yEaDyBo7Kyp2DWMtYcw2XIFUfwb0?=
 =?us-ascii?Q?y1wzODhw/KBFwEWEhVdcLJGTt8J4M6kgroUlwM6loppPThr1+y3XdcKCZTzg?=
 =?us-ascii?Q?9KW5Bx3SkUhLBYs5UoyQExtvYT2BDwBx14VgZLKdYU4lGJO5yIMmTKbTmcT8?=
 =?us-ascii?Q?rSwZo6sOa4lMk0ZhpBi+2Z5V3XwgThfBaB4EnmxnlBe+arRliDq2aBe2pAId?=
 =?us-ascii?Q?fl1N5wjEJBNdkJMkHC+6KcMQypLObTVebkKBLZrj2ok0S/2keMvT8aZlbxex?=
 =?us-ascii?Q?fjO6PH2kRKQlyyBv5u65suV9S7YAZ9R7ZvAHvyVDeirSm4I3qQlYFSYxVuw0?=
 =?us-ascii?Q?yCh8i2E87TL1EMTx98ArMcEtSpPhHZGMuO23L7FFRiKeljfp5fdHVr7Be36D?=
 =?us-ascii?Q?vzROBzZW9b4lwzMi3LPb1FWtHzBrfrHHq8MsGIcsirJrA0pVFf7cW97+j9+f?=
 =?us-ascii?Q?Kq5KQpqxC8190iWz2K0olCXJn21yognsxt0eH5QZxfXC7oajSR3WEc2NyN4n?=
 =?us-ascii?Q?IJmZPvhC8m81IT3lPDNko3jdYs69u8wDOsVzNB5vdFQOAnRBDlLmiCoCA0hG?=
 =?us-ascii?Q?N/9kKCovZXUDqS4Bo4pPxQ5GLw8cSKH9xYRSklOw5T/7f1LquFI/wQK9/Utl?=
 =?us-ascii?Q?67T22g2JuD61uwjzcjYgbXA9K8E8WZOBg7g0KttU8rAYEeAzyavFG4WSKR/T?=
 =?us-ascii?Q?jnACB8iSMQDRN/UZlA5Lj0UViFaY4EOuaeOzaiujAeYkjdzNs/tcmeWoo3Ag?=
 =?us-ascii?Q?ZAaeSvL0jMg+w6Ea9NKTOSg2iIwbjoAL5Sb4MbqPh4rHuAIB3id4kTLe04XP?=
 =?us-ascii?Q?wvSr4RxptN//mdUKIipVUHuHXNlpKV/AoFRMWGpbviL7IKGl4aPLUQqi9w7P?=
 =?us-ascii?Q?b0xu4az4aLdipWpGOGsrvdJ0rSIfl6qYGMhC3xs1VFKRmmuGcXqgtAJjJtug?=
 =?us-ascii?Q?hBYi6tMKaoAZju5j8qjtyCwvAaB2WAdClA+uEdbl36yIW4r0/PWzZkqmMF73?=
 =?us-ascii?Q?K5TkPAcqmVpvhvCjb1c8QehtpSv2VuZc6UTUfTHdBT+oOiIbZh0gaKW/7yc9?=
 =?us-ascii?Q?bXjLAXYa4mw0NNLYj/5LSCkJgBbhiIhw8XPyuHon5/bElFLt5g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PMK9o9kvpy7vzAgApxrFi0MZTr/ZRB7QehMQIYwg+UupvkTuSqXvOEc1qukm?=
 =?us-ascii?Q?4qJKWsqephUQ/lwTSWw8NYd504BBUd8XTb/DPmGIMVk62PJblqNKJxSCkts0?=
 =?us-ascii?Q?Do+VVG12UtGFktaPZ5D6Gkrv3ycRekou+CALUUtvtAMl0hGWKy0r5XGjGVv8?=
 =?us-ascii?Q?ZSqooW4H4QZyLtAsbYbcPshlyO3EjJy+dNahN4as/uC/umWbTg0PcuAcAEyN?=
 =?us-ascii?Q?qw+1BwdlR8hPaZESZwl/R+PSMWLL2+nZwaK79dMz4nkXF4xkzezvvf8BaEGU?=
 =?us-ascii?Q?1JPjkHi4gYvXtlcBZOBr2b423+oqWG3VpZEJHJGIu1Q5efabhjGRu1Y5KXY7?=
 =?us-ascii?Q?nDmR6gUk7EbOzmt10J3/uKuzRqnwQnzpJfpnuu65rkbzTih6nQbfm3yjmkzL?=
 =?us-ascii?Q?9yZ51B1ZEVBQcVRuwS+NJQtx0ZQkhvKVH4tyaCgg+MZWQSGMnfQvLZcN4iPz?=
 =?us-ascii?Q?IYvQGBb0WEuXGaSvmaccofMyMkhRVCN2eh/uiQlsggxGuYv9O1o1SadRuOva?=
 =?us-ascii?Q?Q4zAGOlwcyATTSk1aeTACiPOTpZIGy9F+pCLhVMzkb8wmZItis/e8LTMpo1/?=
 =?us-ascii?Q?wsT7hBTv5B4vr1CS5BvViuo9uCruUiYmM6bqbjJWk+QZ4elO5D3AgtT0sNSq?=
 =?us-ascii?Q?RyuwzaZPnDIkbvwot9JHrdrYurw5LxIkycrtfOuuIIkoRRM7BzeiXG7h0eqV?=
 =?us-ascii?Q?OV0Ug8jKKlT/Vmr8GepSRWrmClLx1xG3dtZF6uKyYDsGPlAs2XQ1GJsrmY06?=
 =?us-ascii?Q?1/1xWuRd7xD6R1UWImrVKqkKjZzeVUvk0u5cpGKwkhTpN8Dn3NDS4tmh70Dk?=
 =?us-ascii?Q?QQZl0F86UqOwv/91xbp6oY0IOAnhhkWEXS5g0c9Og/ds/gHT7GshqEpHbCvq?=
 =?us-ascii?Q?FTRZFTCvnISVFmWvNKp7fL7mNJgYfL3wEFlDywvQGBV0yAkx6evB+equoqHP?=
 =?us-ascii?Q?voNQkcxf9LzoRvnI3rb/tB3Bbnwv+x3H6rlZyssTlSHznTRBRXgREkE+CrlY?=
 =?us-ascii?Q?2qkm3oAzqw/O24SGwgxox3ho7eZZ7QUc2bljTeeUVnjZXVRfRqZrMjxbacEt?=
 =?us-ascii?Q?wGUyG2UzqZEheVUAplkqwsgL8m7v/twZyKbVTWGZ+TTgvrPkxiJVKUe+uasn?=
 =?us-ascii?Q?cCvkyDqxLEl6VJtSN7x7kdfZKPOTDq5yjOkWI8KrkJ5RR4Yz4NP3CuLA25ZF?=
 =?us-ascii?Q?WwlRInY09ZdNTM4NhogzSZhA2nUOrAD7IqnFQF7TJ5AxllK+2ahjy/l3L2lZ?=
 =?us-ascii?Q?OYCUxccCVKmwb0Dvz2mxZsyaC7oHRy6YFO9lJ0LD3BsrTjhqyhSg/YLFXsvV?=
 =?us-ascii?Q?JFUkCVXq1CmwT6itVXI33oyzW2S4P+hhfLYKIbGQuuSyv7s6nfw3/vRypB7f?=
 =?us-ascii?Q?9PJD9xtakDtybZowSKXY7RYlS5ewjl922xQQOprq5BseuokLB4WZU1JLzQ7c?=
 =?us-ascii?Q?oLH60skRTLyhIvCKOm4f+35UJ0w3koV3TTSCX8I+nEBYxzdlVs0ZQfbk50Mv?=
 =?us-ascii?Q?3S9jISvUTFauiF099cYjwBw34vrGjf2ZZHymvW7aE7djgl9R4fMGNqTEx8tJ?=
 =?us-ascii?Q?tldCaLNt1VF63t8NkmxVzYfz5maRcRprOE5OvCG8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2f4881-9e77-436a-25ea-08dd5cfcd4ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 22:18:33.0043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ip3iDLfht41Mw+RrcgPDq2s10B/EyD4T9Vnhjmgfx0mQQC6ShlFdmXXBss9gDsVqZA1d9TEYY4TBI8gt/vz2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7139

> From: Peter Zijlstra <peterz@infradead.org>
> On Wed, Mar 05, 2025 at 11:54:14PM +0000, Puchert, Aaron wrote:
> > > 3. Ability to refer to locks in returned reference/pointer. For examp=
le:
> > >     struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
> > >     struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1,
> > > return->somelock); // locked if non-NULL
> > > I expect this also requires basic alias analysis to work so that
> > > assigning the returned pointer to a function-local variable and then
> > > later use in an unlock function works as expected.
> >
> > We had a discussion about this, maybe I can find it later. The idea
> > was to introduce a builtin for the return value. A rough outline:
> > * Introduce the builtin to the parser, say __builtin_return_value().
> > This shouldn't be hard.
> > * Add handling to Sema: we can only accept the builtin in attributes
> > on functions. The return type is the return type of the function.
> > * In the caller we might not need alias analysis: there are no
> > variables that alias. We already produce S-expressions for some return
> > values from functions, and then handle a DeclStmt with initializer. (I
> > introduced that for some C++ patterns in
> > https://reviews.llvm.org/D129755.)
> > * In the function itself we need to substitute the return expression
> > for the builtin before checking the exit set. (I assume this restricts
> > the possible attributes to acquire-type attributes.)
> >
> > We can also discuss this in more detail if you want to pick it up. It
> > might be quite a bit of work, but it should fit nicely into the
> > existing framework.
>=20
> Yes, as far as I can follow, that should work nicely.
>=20
> The thing I tried to work around yesterday, making clang ICE, was
> something like this function:
>=20
> struct rq *__task_rq_lock(struct task_struct *p)
>         __must_hold(p->pi_lock)
>         __acquires(_Return->__lock)
> {
>         struct rq *rq;
>=20
>         lockdep_assert_held(&p->pi_lock);
>=20
>         for (;;) {
>                 rq =3D task_rq(p);
>                 raw_spin_rq_lock(rq);
>                 if (likely(rq =3D=3D task_rq(p) && !task_on_rq_migrating(=
p)))
>                         return rq;
>=20
>                 raw_spin_rq_unlock(rq);
>=20
>                 while (unlikely(task_on_rq_migrating(p)))
>                         cpu_relax();
>         }
> }

This should fit well. We take the return expression "rq", plug it in for _R=
eturn in the attribute expression and get "rq->__lock". Then we compare thi=
s against the actual lockset, which should contain the same expression from=
 the call "raw_spin_rq_lock(rq)".

> Users would typically look like:
>=20
> try_to_wake_up(p, state)
> {
>         struct rq *rq;
>=20
>         scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
>                 if (!ttwu_state_match(p, state))
>                         break;
>=20
>                 rq =3D __task_rq_lock(p);
>                 // go enqueue task
>                 raw_spin_rq_unlock(rq);
>         }
> }

Can the return value be used as an initializer by moving the declaration in=
to the scoped_guard block? Or do you have a style guide that wants all decl=
arations at the beginning of a block?

We track capabilities as symbolic expressions, so something like "rq->__loc=
k" in this case. If there is an assignment to "rq", that changes the meanin=
g of the symbolic expression. The object referred to by the expression is t=
hen no longer reachable. Currently we don't look at assignments at all when=
 it comes to tracking capabilities. We don't even warn, it's simply documen=
ted as not being supported. We only look at initializers, as in alias analy=
sis. Having a separate variable being initialized with the return value giv=
es us a unique name for the return value, which is good when we're working =
with symbolic expressions.

If there are cases where assignment is really needed, we can also check to =
which extent we can rewrite expressions or warn when the objects they point=
 to become unreachable. (In the example that would be the case if someone a=
ssigned to "rq" again after the call to "__task_rq_lock ".)
