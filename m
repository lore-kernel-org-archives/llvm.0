Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3348CEC2
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 00:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219797; cv=fail; b=cQ6qbJ8ZfyrjyZoG5stpGEHM9Xc14iCnP99lHzCk3doDsh1ol722J5PGt4O01sMqmqZaUh1p/hUpAlFQEzUxwpa95aApZdTpGswyVbyA2USiSTJsmRVZ7+mfZS8qCK7Ss1Vzb1PBfbXT9xvw8BkYevvl3Il2zdoM1xPnGV4Pf1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219797; c=relaxed/simple;
	bh=Ce54sC4499Q4S4A4LIYv9dMv34/OySCktP9cjkFcqJU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nq1TO5MVLhcbRBkNB3bsy5yp3uiZyhKDz0It2BD2g//1V3dePfIxnVQq7Nx+xjwmU5rrpIMcOjPVRYpzeOwM2kJUijfjL9n11vN30T9GogZ0LoE9o4LrPH3W33y7QaffGVcS6fd8Fql5rb3c/EHm/Tuvklp23NAKhVhPyoMns8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=dfVkYJ/B; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="dfVkYJ/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOm6E5eeTChvvbPq9TWH1EDxChS50+7IWksJSws3f0S+9MIFzO2H+ZHCYoWcWEgpigOuwrEpiNWnnKDLzuUb9Vr/fbZHA1rRpZnUtK1NO8rr0/LLJ2P4jcvEP634SzdmF5+4x61Hxw5JZ8UBXCBbac3hTyjgYem7zPeKdMv4xRqVg7I4f3Ho6smY/eZDLAeAe5KtcOs+hiUJ/rt+dIQ6CJGtxLC9MQVmlXmZncI345BJA+xsfAUfIAwdcGm4i2Tvy/ysvmjAxt/xrGdnfc+i8l1m7LjEse+ydv4Iak4jpNVlJILSI5KWeQcpITwOVF6MPcMJ+w0YzbnWqHQ+e3zKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc+/6hIlLuZ4P7qF4mx3D+YAtHaBwIuQq6XSlAeBwOE=;
 b=K8an5dgtn5IS8RYHrZxP+q61T8+5+zq42jFZJzOBxCIkXulsqi06hFOLLDaPcX3ChYmxmJY1o+wxKNh7K1trVCV3LX3AUhRAxrBiQpOa+eGkIOE8oAGtSuKdH/o595zjBJdPJt8Bkjj4wWvhRzt5nutKRfHe54F9VBEGhUAa/WneAuGYX4OIplqa44cbZ9a0OVMxe/n8YtTKU6DKDxpHIYRTkl1SmFabCI2AYnR2ZLsCPCiDMtBYIsL4VggXRLNaj5bO0WOAttFpU1tjYOacnLhsLWVhGgwkLKfDhFxcAmlKSsRYmRryFipzZl9EwUU3UJxABpih6vuSXn/0FlxKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc+/6hIlLuZ4P7qF4mx3D+YAtHaBwIuQq6XSlAeBwOE=;
 b=dfVkYJ/BPIFlMPKiDb6YRuzgJruRcOMEj03jhDsYkN77hgTxHg+Sxp8d0O6gnHZ27wrb0kw7owFovCoXxDMS2vJKhShK7Tp+NdmnpHEAOZ7nB8hEgBPBmrTVjUcTRzpCOfqAkLrAojJcOi24E8TEOkOY+wT5ETxcOtG/O+xT8PTqK79lJJZQ/LkCnzn1H37eMTxrYO4Hpiv5/VIn8TKRJTG/88iNVeFSl5YpUJ+E88ffoNTs4gPzLpD4y5VwIXKP/OUERIFkcvTuEMvFHekOVVM+Y10EnJmAhXxSK9j3jtBP8a46mtwZgoxe7MF6xlleFwyiR27Uy7ssiYDqA0OhzQ==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 AS8PR02MB9792.eurprd02.prod.outlook.com (2603:10a6:20b:61b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Wed, 5 Mar 2025 23:54:58 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 23:54:20 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>
CC: "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Bart Van Assche <bvanassche@acm.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mg
Date: Wed, 5 Mar 2025 23:54:14 +0000
Message-ID:
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
In-Reply-To:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|AS8PR02MB9792:EE_
x-ms-office365-filtering-correlation-id: a65f0037-d7fb-4666-60cb-08dd5c4108a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NXoOFLci7NyuOI2UZ++sUqDqSwWwS6QFli+VZsKJua7da6hI94Wgy5q046Xc?=
 =?us-ascii?Q?Jzlyiont17MC8KSjyQJoIYYx8zEScL6iPW9GcrNqe03k8V1SW03KSjT6ieQ0?=
 =?us-ascii?Q?IDAaAr3MtBX0jhRruruuT5pyTL/186azrj0Oq3m8IGBkPaIEBphsF4qzH46O?=
 =?us-ascii?Q?gwy4W4F65rumAmV4wsuxpQsnqiguxgSVMEk4Gd6brbhhaG8d1VyOg14jCxPi?=
 =?us-ascii?Q?ZHp2CMJhfnIFGbm17+V67QsCFMqmmrh19aMIzjRRu6O2FT7Wmpi00fjylXn4?=
 =?us-ascii?Q?7Q2e8VOvdOSdmsmqY5OdAEBIkoj8Ihhq65znfbtF/3UzbCdv3febNChRPMQ5?=
 =?us-ascii?Q?j3X1qYgkq2w58E+3/UyASJ9+eAbvSyLITNnBD8QMARXQZ+hG+tJ3awyIt/MH?=
 =?us-ascii?Q?wPCVMFnKsB+XGZVKnG5G8kPg08zJay+rxNxvNngJH7gGryyuFw8QHguG6z0U?=
 =?us-ascii?Q?ywoR2P45FMbIi8XHdGdsEQPlp3bRNHQ616DwpNpeoGubSAEJUd0dBEOv6oP6?=
 =?us-ascii?Q?mydBSVgkjlSL0FNS1IeHnOcuHSqf+gLW4hs/R/x9vpCcx8eDH1BEDB86oe/A?=
 =?us-ascii?Q?jil1MtYr/7mRiu3iAKb3IXCv8ZKlUGcECzAQekTWyJ08FAufl2og2RxpkkIO?=
 =?us-ascii?Q?cSVzHHUCH9eiCyPY1hqYb6ixhQrFz45svqWSjsl7p70Z8Je2BXVEgqFRjevh?=
 =?us-ascii?Q?bnxuOhrK5vXhbjKXi1VaZmFwoShv30BBk4jvDR4+tUfvx1t5ax7mvbmgyGnI?=
 =?us-ascii?Q?6/RXWZhjIx1Fx7ZCd89hD5eAREcjXKy7McoyyRfOi2T5PrlnvU5aCKDfqxwh?=
 =?us-ascii?Q?ystx5lUBhoxPERpIt9hRi0AccH6IBVtDX+zamaP47saVtmWh5VL2X2YGhcuZ?=
 =?us-ascii?Q?X8Yg53Sd+AQtb9R1JMsDPeWv4ULCIVOS0kTpLodD4q5HpNPwKRQE2TLifRxt?=
 =?us-ascii?Q?midCuv2qvCASKL9vTPR4KbVv09vuDoEMlpr/mzSA6yIAbs46dUyPGRk6yaH9?=
 =?us-ascii?Q?ZKeouCZ7NGx9SCq3+7Bli4lOQbudDwC2EvJTmRfeq6hY45/Fq9IXSkpwjimU?=
 =?us-ascii?Q?y9CGfQ3bE3L87dfG2o1BhoDISNzsnHSi9V92KKPcc5rM9ci9LUe4PI5X54q1?=
 =?us-ascii?Q?ufLbpaN62tVYsPdULDm6BHTXLE6g9wyu5HCyYuhQwdkGPIsU94Ml93TVE9iF?=
 =?us-ascii?Q?sBpCbclCDf1joYxHDa29EMFnRYEuZ/iKBBszXjOzBpViZK6X1ujBUX0XpJuN?=
 =?us-ascii?Q?2fI68zO612Gwc0r0QOSxu3L4VSz5VaMXz8y8d06lm6Epg9zYGCloPXWJG73Q?=
 =?us-ascii?Q?v2k7KRMuW0FCgSGYuaMw2P9AaZ8ZIGKd0HdkNDsvUF0AHI0zl9QV0KYm7OQx?=
 =?us-ascii?Q?b87nTQUXGr8lWph579WjqtpNX3Ju?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vHrn3r6mJqedPeLYsku6/KJU50irD6I+mLT6ucWWATtZwCmeOdTmULc4evdy?=
 =?us-ascii?Q?P51plc8HSYeN7PEOXo27YxQTTNQ+tQ17tXdyaXXZnnRZkHZHibkoMiMY9LrD?=
 =?us-ascii?Q?8C0uw7Z+4NCeb8Q4wIgKKjETGigcuvevq/mYRTX6xO1UZFgvJllk3Ft3P860?=
 =?us-ascii?Q?QvcPZGUe9FBQbbvOFQW8BwjbL5ESd6BhQcWH/k7czSVUH3ncyBV6OWRKHuzl?=
 =?us-ascii?Q?uWUnMqDXAmnyB/kWxvGggjOj7QSibrYvKV3U/BGJ9wWphSVkdgzgEkPPMm+y?=
 =?us-ascii?Q?xcTl3I72ReRqHpNf0Pcs786k+HWqFfzP+lT/UozQLsMNdr1rM6amEN6PoTps?=
 =?us-ascii?Q?tygIDJ3b/FzbVbUd4FEWzXMEyaLfKGBWr8nWCsJBdQT4CGLgBwclPHZq0JVD?=
 =?us-ascii?Q?PW88ry73/OhUoSA5l9/8N/aovJTaMSesR9Aqvf6OWywD2uAyK6miJ0kGnW1P?=
 =?us-ascii?Q?ZNNYaTUxzTgusTbmy53+M0JKSXC2C9aOcUVt/hrACOvsgV0XjnJn0Vedbm9b?=
 =?us-ascii?Q?RrwKqsB21/Z+RWrhKwlqG4/zVpFPKFbuK3+5S0IaevBa3k909OE1Uxje0uBQ?=
 =?us-ascii?Q?5vulwYveQGvJQQIYxTcJuKBdyARUI8s0FphG2RwcABcXuqnMEOVDfDGQQ0sh?=
 =?us-ascii?Q?fnQ9AcM/rmoCBbgfZsEb+s68obbc0QhJODHEpinxaC8o1l4Z6iDY52ww8bix?=
 =?us-ascii?Q?GhqShZscA9/ZSYk3RN89KSRmrW6kgGDisFiLNMBjb29xWjXKB3l0CAvExgY2?=
 =?us-ascii?Q?epnhHiMHSRJcJO48W9TqFMekn/P8of1hKxaOcqHf4RSZ3+uSnLEKbEnMmIOK?=
 =?us-ascii?Q?URV52JNoeS4OttLQRHZ+ke+skYzmiuRuZW4unPGXezPMM0WLiKvIu4Hh8eQA?=
 =?us-ascii?Q?rxoQNtsnW7UfBkeLSlMCfRFKMIwjUPQt5w35pXU8lHnKXWCp90JSsasGfUQE?=
 =?us-ascii?Q?FBZMiKARmsZvsUnebwPDhTRSvLxjGTcFnemX3q0nGrmAV9awMIvIMqYC7MbR?=
 =?us-ascii?Q?AnPvv5Td5OUJnqwSNTMWqGJfONlQG4V6yT6kgiL00cXJIhOGnrmRved7+w9L?=
 =?us-ascii?Q?sSyP0nnL5swDiWdg9KkO173skmISiEQlL2TzCqUMLWRkgw6Ayu0igeK/Xdcx?=
 =?us-ascii?Q?A5LDVwQgrmlf6H//J6rr2mnPupJWAgGkHEDIrVT9lmsFIxdycNE0Uyg5fpJo?=
 =?us-ascii?Q?DU2HUdgJgnmDFMTk8BmaxLQzEM0VptT03YD6cuypaqevHPjZ9zKeyc23NXiX?=
 =?us-ascii?Q?I2TRDTlxgUsQ/x9vwBVHjTzM2Feh+6oSmI3bnRLRtCBSHMpMMQcog3Q+udNC?=
 =?us-ascii?Q?n8nn1sK+uBVpoK8jWEDQUBl+rHUfPVrv/s+L/Dmpvwe/ygpyB5eovUpcR7SU?=
 =?us-ascii?Q?byWXsBohhA/dPvDSVYtSUzKQ7vwdCwBCJF7QRz6ckJIHIcqgVODHEFa2djVj?=
 =?us-ascii?Q?dR9ccopuRTQthwwweezmdNsHmNlTzgnCtertQKEgX6iYH3x1lfFxzp5jOy4E?=
 =?us-ascii?Q?Y0A/rlv6MRuqB/ugVVTVt3Ps9Plc1oev1vgjHjBwD6k1HH/CqoXSWuyHwKL9?=
 =?us-ascii?Q?68GZqWi7Ql81T0exc9oH5jgRv9lO7nrktgs6LVZd?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a65f0037-d7fb-4666-60cb-08dd5c4108a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 23:54:14.3578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wrf/vJPV7VnjfLJz5GZSdT/s9mfaKTpoG3/Wx/VBAtkd9Q4YvNYU9UKhDWWSoVJOJAwwAs3+oAJERy8R4phFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9792

From: Marco Elver <elver@google.com>
> Hi Aaron ^ 2,
>=20
> [+Cc a bunch of folks that were involved in discussions.]
>=20
> After sending v2 of the -Wthread-safety / Capability Analysis patches
> for the Linux kernel [1], a number of concrete improvements to
> -Wthread-safety will be required sooner or later. It is unclear if
> they are blockers to the Linux kernel's adoption because the feature
> is currently designed as "opt-in per subsystem", but it's clear the
> current state of things is not ideal.
>=20
> [1] https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com=
/

First of all, in addition to the documentation at https://clang.llvm.org/do=
cs/ThreadSafetyAnalysis.html that you're already aware of, I can also recom=
mend the paper by some of the original authors at https://static.googleuser=
content.com/media/research.google.com/en/us/pubs/archive/42958.pdf.

> Peter Zijlstra's feedback:
> https://lore.kernel.org/all/20250305112041.GA16878@noisy.programming.kick=
s-ass.net/
> -- much of which led to the below requests. Peter also managed to
> crash Clang, but that's probably unrelated to -Wthread-safety
> directly: https://github.com/llvm/llvm-project/issues/129873

Technically a parser issue and not in the analysis itself. But to my knowle=
dge expressions in attributes were originally introduced for the analysis, =
so in some sense it is related.

> More straightforward requests:
>=20
> 1. Re-entrant acquires: rcu_read_lock(), preempt_disable(), etc. are
> all re-entrant locks. My proposal is to introduce an attribute that
> can be added to "ACQUIRE(..)" annotated functions to indicate they are
> re-entrant. Release-count needs to then match acquire-count to fully
> release a capability.

We initially thought that this might be a problem for us as well, because w=
e also use re-entrant locks. However, until now, it hasn't been an issue an=
d I'm almost convinced that it never will be.

In essence, the analysis derives the set of statically known-to-be-held cap=
abilities at every point in the program text. What does this mean? If you r=
un the program, and stop it at any (time) point, you get the actual set of =
capabilities held at this point. However, a function might be called from d=
ifferent places, and depending on the caller, different capabilities might =
be held at the same point in the program text. The set that we compute does=
 not and cannot contain all those capabilities, but only those that are hel=
d regardless of where execution comes from. So we generally don't know abou=
t capabilities held by callers, unless there is an annotation on the functi=
on, which is then checked at the call site.

Re-entrant locks are thus not necessarily an impediment: if one function ac=
quires a lock and calls another function that also acquires it, the analysi=
s won't complain. It analyzes functions in isolation. You'll only get a war=
ning if you acquire a lock twice in one function without releasing it in be=
tween, or if the function is annotated as requiring the lock and acquires i=
t again. However, in both cases the second acquisition can always be droppe=
d. You can argue that this isn't a deadlock and hence not a bug, but the ac=
quisition is unnecessary because the lock is already known to be held.

In theory I could construct cases where there are still problems: maybe we'=
re locking twice because we're calling another function that unlocks once, =
but we still want the lock to be held afterwards. However, I've never seen =
this. In our code, re-entrant locks are only used because the caller might =
already hold the lock for some reason. The sophisticated patterns that I co=
uld think of never appeared. If this is different in the kernel, I'd be cur=
ious how it looks like.

> 2. Basic alias analysis, e.g. when storing a pointer to a lock in a
> function-local variable. [Complaint in:
> https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.o=
rg/
> -- quote: "Fix the analyzer instead."]

We already do this analysis for C++ references, and we might extend it to p=
ointers, but with one restriction: an important aspect of references that w=
e're relying on is that they're essentially immutable pointers, i.e. "T&" s=
emantically behaves like "T* const". This makes references behave like SSA =
values, meaning we can just symbolically substitute the initializer. If we =
can ask the user to mimic references by making the local variable "const", =
we can apply the same logic. (I know that using "const" is a bit tricky in =
C, e.g. "T**" doesn't implicitly convert to "const T* const*" as it does in=
 C++. However, I would hope that you can always add top-level "const".)

With "non-const" pointers we're unfortunately opening a can of worms:

struct S { int a, b; };

void f(struct S *s)
{
	int *val =3D &s->a;

	while (...) {
		do_something(val);
		val =3D &s->b;
	};
}

The analysis walks the control-flow graph (CFG), and it wants to walk it on=
ly once. (We handle back edges by checking that the set of capabilities mat=
ches the set that we previously computed.) Here we have val =3D=3D &s->a wh=
en we encounter the call to do_something. But then we see a new assignment =
and a back edge, so our assumption was wrong!

I don't think we want to make multiple rounds over the CFG. We're not tryin=
g to do symbolic execution. There are performance implications, reliability=
 implications, and depending on how far we want to go, we might even run in=
to the halting problem.

So if we can restrict this to "T* const", I don't see an issue with it, and=
 it should arise naturally from the existing alias analysis for references.

Perhaps we can emit notes on -Wthread-safety-precise that suggest using "co=
nst" pointers or references in case we suspect alias analysis has fallen sh=
ort.

> 3. Ability to refer to locks in returned reference/pointer. For example:
>     struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
>     struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1,
> return->somelock); // locked if non-NULL
> I expect this also requires basic alias analysis to work so that
> assigning the returned pointer to a function-local variable and then
> later use in an unlock function works as expected.

We had a discussion about this, maybe I can find it later. The idea was to =
introduce a builtin for the return value. A rough outline:
* Introduce the builtin to the parser, say __builtin_return_value(). This s=
houldn't be hard.
* Add handling to Sema: we can only accept the builtin in attributes on fun=
ctions. The return type is the return type of the function.
* In the caller we might not need alias analysis: there are no variables th=
at alias. We already produce S-expressions for some return values from func=
tions, and then handle a DeclStmt with initializer. (I introduced that for =
some C++ patterns in https://reviews.llvm.org/D129755.)
* In the function itself we need to substitute the return expression for th=
e builtin before checking the exit set. (I assume this restricts the possib=
le attributes to acquire-type attributes.)

We can also discuss this in more detail if you want to pick it up. It might=
 be quite a bit of work, but it should fit nicely into the existing framewo=
rk.

> More complex requests:
>=20
> 4. The ability to deal with conditional locking with return values
> that are not just true/non-zero and false/zero. A concrete case here
> is that a lot of functions return error codes, and if the error code
> is < 0, no lock is taken. If the error code is >=3D 0, the lock is
> taken. [ Source:
> https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.o=
rg/
> ]

Not an issue in principle, but it could get ugly. The current notation does=
n't seem to leave room for something like that. How do we extend it? I don'=
t have a good idea here. I guess it would also be nice to have more than on=
e example to base this on.

> 5. Better control-flow handling. Basic understanding of conditional
> locking, which is explicitly ruled out in:
> https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#conditional-locks
> - however, if there's some way to even get basic support, would vastly
> improve things for the kernel.

The paper goes into some detail why this is tricky with the current design.=
 We don't want to explore execution paths, because that obviously results i=
n a combinatorial explosion. The Clang static analyzer deals with that by l=
imiting exploration, but that makes it fuzzy and of course slow. As a warni=
ng flag we're part of the compiler itself, and the recommended practice is =
-Werror=3Dthread-safety, so both of these are highly problematic. We want t=
he analysis to be predictable and fast.

It would be interesting to see some patterns. One "trick" that I have playe=
d with is to move the conditional locking into the capability itself: it is=
 then unconditionally acquired or released, but the underlying mutex is onl=
y acquired or released based on some global state or member. Something like=
 this:

struct __attribute__((capability("mutex"))) conditional_mutex
{
	struct mutex mu;
	bool active;
}

void acquire_conditional_mutex(struct conditional_mutex* cmu)
	__attribute__((acquire_capability(cmu)))
{
	if (cmu->active)
		acquire_mutex(&cmu->mu);
}

However, I realize that might be a difficult proposal for the kernel commun=
ity.

> Some of these are more complex than others, and any hints how we might
> go about this are appreciated. I'm happy to try and implement some of
> them, but if you find that you already know exactly how you'd like an
> implementation to look like, rough drafts that we can take over and
> polish would be very very helpful, too!
>=20
> In general, the Linux kernel has some of the most complex
> synchronization patterns with numerous synchronization primitives.
> Getting this to work for a good chunk of the more complex
> synchronization code in the kernel will be quite the achievement if we
> get there. :-)

Examples are always welcome!

Aaron
