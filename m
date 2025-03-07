Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012067.outbound.protection.outlook.com [52.101.71.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3AB19DF66
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383975; cv=fail; b=bVaCfoIf1OLoGEndNFY3khoueU52KzUlm8+YpU6MGqn2mJmCIsO/56MpI+C3Z3aSmZXvcHlL8sQ9BXYyRmIjtmSsAiHhiLvZ4Ofap/1ofIHRfWfXVDYi9UWoYgvilUsqe3Mvc7ubL8nRCP4xq658nxxR/qTzITHadu99yw/XLJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383975; c=relaxed/simple;
	bh=8aE+xCBqiWlKwpL7qQKUtDWa5TNIrHWpPtjLKN5nDjY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GIMmon/LPtLG4s6vhFWC3D5xlWLmMU6q1eeKQyPNUJO2svJZRBdUuNLhtah8ysMyQsFaHmvvrTB3g/spOUgnRo+IzYYQ3aF+9Kp3LS68n8FCtVJP5syWhhIoJo3g45n88haMiWfL+e6/EqAEgQqXtgO8IIXD/4GQRXS+sERnNxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=hJk578yg; arc=fail smtp.client-ip=52.101.71.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="hJk578yg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kgfk7L+e93cdM5tulLAMfhreFfuyN9eV+7wY8k/QQmdL4k5lCNfU4nds0c189RYKNSCEWCgnN8g1bBAdM8SvV53AensS56G5PopUZ8n7vb1JdEJfVqi9fGThFh/QLS7ls+UMa1KmidcWZleUQdUibNC8mtF/6LJAwGQ8ZCRZDYLshTQerK6ogv4NnrTOmsvtSZuAW64x6wZEedcoifpO1ky+hV7qHrUhQK1L7qhybca5ncQK708TkQlbwkJsxPcZIBf7Qf2iWFdMwMPJtWuu6YulVz4c5iIeFkzijQSN+AHM+JWr0/3rtAe+/3Vs/Ath9U8wUYapuEYPcCAAyz7vQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkfSsvUR5mJ8zAEt1CbdSf0wl6qdy4b+ThPOwZnF9yM=;
 b=oeMmtHP0Cj3YrT69RUtcnG+qnHO/ZtqlXRlwzwXwqMFvuaug6Wrb5YRgYh7AOv9osUSXbzg18VzD/q2IswPwwgbf2T5TOKkgKZGNTjITsfhhA/wDsA/WVN6k7fDjBxkvzYxIin8idIgIF2Q+M3y0LJut13DTc7//a92BLAo8nUFCwLzY8LSZeLHSYYVVVcQUqj5nWYmC3kNGe76qh5eK6t0epacuEcSPL/KQkC8/uZoegGHBLt2XAOVDoiMTGqNDOWOHJUz5JsI2R5xaDM2Y2VQko1yBkmWpCyScDd/OA48ch/K7B5ydW0UNvHp++uTYudp1mtLUsM+GK9IEGisKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkfSsvUR5mJ8zAEt1CbdSf0wl6qdy4b+ThPOwZnF9yM=;
 b=hJk578ygz04dCq9S4KT6xTfbA+BIm920Cl3AUH22x6GGjwMM/tPDtc1H4S/M3fN2rYVCNjHA1h6wgnw+Dtft94r+4l7d+AWBaoTgeZar0QfTCKM8uuqLUcVr3hTVP7drKRgGPVbF6gWgkZQJlQhBMum5+nk/rgL+8bpPSa8QvNMI1FVNdkNBKTGzcLUf0Cg2bYUqnZswKDv/Oj0+/m+gUgr7WVXmeIMM3MomIsOTTyMWDw/BvJCtNBhV+l1mDlGm+WhM8Hs7swi65e8Oco/z9Z3dYQbShzLHTZx9P8vLIsBclE7W2lwjR8XLMsYv7TeQ3hZsv9YiCsufDvynzk8fQg==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 DU5PR02MB10777.eurprd02.prod.outlook.com (2603:10a6:10:529::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 21:46:10 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 21:46:09 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Bart Van Assche
	<bvanassche@acm.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAEaVQCAAkGOQA==
Date: Fri, 7 Mar 2025 21:46:08 +0000
Message-ID:
 <DB7PR02MB3626EF9507C286A0E507AEF4E7D52@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306094752.GC16878@noisy.programming.kicks-ass.net>
In-Reply-To: <20250306094752.GC16878@noisy.programming.kicks-ass.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|DU5PR02MB10777:EE_
x-ms-office365-filtering-correlation-id: baf09e89-127f-4e4a-619d-08dd5dc178b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RW3xfq2cjDQ+zUe7ehBWmEU+8ZV+3694yP24ROYHeywaHPIsWZP3iaCxAUxz?=
 =?us-ascii?Q?UoChpAgXhjd6EZ8nLxphO8y040cqrExOiDSYKV/vixeKysyLTNRihjXqIsEl?=
 =?us-ascii?Q?cMMdbZZ8cnxpQgwP0vN9CDHwwkxA0nSwtsIp4j/0j7DaQOK75teSJl82/Iuz?=
 =?us-ascii?Q?N5Syn57oM6nkfHyK15uYr2zu9wNZlb5fZkNweShZlk1LdBZxTPDEHHS9yrV1?=
 =?us-ascii?Q?CK8ZZYUkBMcXMsGuZDtuB6lhPQBk8000LOE1qwRt9EhOFHqMqGqn9hh+fe5p?=
 =?us-ascii?Q?24x4c4AbTIVEaQx5l2CG2f+pRL59RLI1HPKn1yMPjsKZQGtp0HjLPNolvTWi?=
 =?us-ascii?Q?FB8kbxrfvp9iuQIkaPBGlB/shy7QF1poJcMVCbhK15OVwYBbIjT8eq6fpFBu?=
 =?us-ascii?Q?6iSM6nsCxfrTPD/7ArGE+kS7CAIP2z7fcaax6CRQx1AHLAyg46D+aPODjypT?=
 =?us-ascii?Q?FKWVxx42jxj7zXoNIChqr7oPp0cG3E1y5OuHH41fMpYHOYGM+unwchadCNpI?=
 =?us-ascii?Q?vznK1ziPbZ+PepUWX8tAKhrwh9xxyW784kBhwOMMD6jnnaEkXB1jpd/nIrGl?=
 =?us-ascii?Q?MUgQ6GpJydYs3xZT8NuGuBKfB4y9KRP1XyqC3M2hS6EdLpTIuD3gtyIz2xNY?=
 =?us-ascii?Q?qEHa/lizqfxGuALAPmSGgj3HKFMu3UCEaNqdR0vOAtL4s3jxjHYH6yf3X+VB?=
 =?us-ascii?Q?6tCI+N7e/dGc0EPY6Xqe8hEhPVXQcNmVdpEnf90ggaCrX9PXnDLRL4yhX7Fv?=
 =?us-ascii?Q?TldkrAHCvWtnyGLuBfPpZCsyLasAqoctFOlu0A/Dt9ZCyXBqS8CRVZqyvVo0?=
 =?us-ascii?Q?D333T482wsSQKagh4tktCR2l8yEDPpfJKrssXtCyug2nzBx98/+2MlrVuL8T?=
 =?us-ascii?Q?Yg+YYOpnBtHn34+84s/6HuWHDw2AnrGBQU+Z2mbZa+vAfaR7Tc/MTaSYa0hN?=
 =?us-ascii?Q?Rwzske8bgJZlYsq8IgdRHG4Zmm+ueVverrOLEdGwg8dG/na5CW0N/coGI6hx?=
 =?us-ascii?Q?q2MBJXuLVOkMyGoydNUNGY/VY+3v6ezLXOMYM3J9Efo0irwITF+sRyAoqQxN?=
 =?us-ascii?Q?VJpqSbUKaa9rsr6QhwV2sXWmO9hADw2sH/65niLoS9c5Piq4TGhpFnrOAZZx?=
 =?us-ascii?Q?9TQBeAn35sqdMgf24fNedjNAp5ngSjZgHkKNlJZbey8jhpvJVeu3NDkLm7pE?=
 =?us-ascii?Q?4jtplEtuUc1LGYrEITBX6+Mrha+/rZrfaYTYJmWuw6UhSxkcuQs2dxHDg3Pi?=
 =?us-ascii?Q?MlItS40zxiUYjGorkEwfV+x39BB7FKuv05YEfT3IHXsOasb86JQr9U9b+n4M?=
 =?us-ascii?Q?A+BtiSFhCGAHIlZ/MKIyBMjWux67oiqv+q+fId2FQUs7oD1lsN6LN55+7NUj?=
 =?us-ascii?Q?q4t1y08lcTipx5yzIYeRyO2eY9FZOZ5uvpxMwt5KJGuFpQKLVTwKIaINZn33?=
 =?us-ascii?Q?hRxFY0G+Ittuub7OBK5rGiqWvK3kMUtT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QJAWohNvRMEFnxXkSaGod8aUKdVJGrM1K3Aw5XFzVy+oe7aJo68e6cVG0py8?=
 =?us-ascii?Q?QAfng34LQXCGrg4tZmt+7xVwRS7n6xpEOdKkJomQLG/cG762r0hRNGDwMj3M?=
 =?us-ascii?Q?0v8//ZGhjEgQX9chNEyfgj9wyowq0NV84y4msoRqpDRd3Uu+SPHmOjN7w8rF?=
 =?us-ascii?Q?/ENQB47OEcrOfFhodqztoCCA03zzg7ndhGAHpJ5F4943eZazQv+CZPfOF/6J?=
 =?us-ascii?Q?+Jpx5gfLbxjxPPQao8KUsejnCj8pW8UIW32eN5NrkqdHNVbJYZyT46R+yBfJ?=
 =?us-ascii?Q?c5CVRD2yn0MHvmpF8rrbd33qE8Ces2AXpsyBodvF8jHWQ2IWBFVozFmiNmzE?=
 =?us-ascii?Q?nx5TMd1HBjXePOd8QdZdVCtmcFtcQFV4/5r9pq9kfC6G3/BlC2TnHVuYNNI9?=
 =?us-ascii?Q?UCz3rXTmk59azCFBdee4TM7fr+NOJGi/muGYgXlQkRoj/lifrO8OSKSMPQw3?=
 =?us-ascii?Q?Vj0zfkP4d9+BIJj08UfX7GBvYOltSfJokGsUnwMaVHnvPNGaZeInHgnjiGMq?=
 =?us-ascii?Q?/kE6ooRytgAugYfdJU9PP4zgVKXJDOUkGRc2Fq1T3Af+9e1UE4eAweEBNSq2?=
 =?us-ascii?Q?knmJbjk+Wkcxk7OWehZmHcr8HMFE9PQm+Zir/cllh+sVuphrDQwdyuGa5hHB?=
 =?us-ascii?Q?zNDGZcAlZDAQvOXdT9Ei0pdLK9o88gfXYcfLIG3H9J+JzOLONFNJE7XRzGMu?=
 =?us-ascii?Q?xEHUkjKs/g4kkHUCw/HB4FiJ/sU6D3gqwyGn6B1/gx5VL1WXjxfcB+WWmSv9?=
 =?us-ascii?Q?iPPK96+8ymH6moUeaTMJgi14e6SZxsitaSLxvMUHFMQgBBHAnkJi4uSjb2Q+?=
 =?us-ascii?Q?27H5Cjq7eNXyn952LYG8qdE5tqZyTT8nhRg3+4wci22zyfemgJPU6duMnmU6?=
 =?us-ascii?Q?NZwGD4aJcNyEg2jzlqxM9pPbUuff14Usow+YBeoFJNssJk1mJ4CnwdZ0YFd+?=
 =?us-ascii?Q?UqGoZfB5SyVzvhE9Wt9X7Y1ZMb/HzHMXnXZEB0SFQxhkwnq3SJK83rd0RM3z?=
 =?us-ascii?Q?Aj6l528/XvwDP21eNsWbHat0rZi5y9CiBFu9lMlkE+CzWmKKhtFKY3Y5UK7C?=
 =?us-ascii?Q?RLuV0Rmu8pADpib5aorAx3OD5zt2fFcbU73iaWmOgJvj2SfYO8Qnjh8g7c0Q?=
 =?us-ascii?Q?XzVyPAfQ0XTLddz6wr2fT9grMsMjfc+i71k0qvMHkBedtXswKj7RBcoEGFyv?=
 =?us-ascii?Q?xDkcdq9i/JXNpRdkyYKiQrCYMWQIev6fe5fvJPxymbN5ZgwFaZCzJh5nR7oW?=
 =?us-ascii?Q?dw2sQJiIhHpdTzbUyFPk9IDc4eR1oP/TUluWOgbj4EWp3MTMn+75RtjNhu2a?=
 =?us-ascii?Q?pIf/6lcLRt7GJssAhLdnTFoqeAsv8npKp00yjOh8HZQYNWmQnMgv2WkEK7fz?=
 =?us-ascii?Q?gkHn1LYnF3Mw9mfHQFffxLKsLNeCQpfwsLr5HqKkx53Sb9p3wKJBeAewCj2o?=
 =?us-ascii?Q?trmU33sSgr/AEmlVs6OZuaGwxcaTthSFY/SqNWoSN+npx6ju75W3H9akvqfV?=
 =?us-ascii?Q?HBcEAzo9HzWQxyR9RCBEuaObcQFGJ5Wg2E/5rIUe52UrOqLwJS4K4ORFawei?=
 =?us-ascii?Q?vEe9f6l8SWbXrZY2sP4xgH3r5deYQYDITcr97DHn?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: baf09e89-127f-4e4a-619d-08dd5dc178b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 21:46:09.1554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iF8Qa/IKcbiDg6hBakoM0WTatJCZfmeNacTcoslCXM5h8UQbXHU/72hgl5UyNkW8/tIfQ3PpzJiHSTd+y9JEHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10777

> From: Peter Zijlstra <peterz@infradead.org>
> So one of the most important use cases from my perspective is the
> interaction with __attribute__((cleanup())), which we use to build
> scope based guards in C.
>=20
> And most of that might be fine with using 'T * const', but the support
> for conditional locks explicitly needs to set the pointer NULL when the
> acquire fails.
>=20
> We have a macro used like:
>=20
> DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
>=20
> Which expands to:
>=20
> static inline void class_mutex_destructor(struct mutex **p)
> {
> 	struct mutex *_T =3D *p;
> 	if (_T) { mutex_unlock(_T); }
> }
>=20
> static inline struct mutex * class_mutex_constructor(struct mutex *_T)
> {
> 	struct mutex * t =3D ({ mutex_lock(_T); _T; });
> 	return t;
> }
>=20
> This is then typically used like:
>=20
> 	scoped_guard (mutex, &my_lock) {
> 		...
> 	}
>=20
> Which in turn expands to:
>=20
> 	for (struct mutex *scope
> __attribute__((cleanup(class_mutex_destructor))) =3D
> 	     class_mutex_constructor(&my_lock); scope; ({ goto _label; }))
> 		if (0) {
> _label:
> 			break;
> 		} else {
>=20
> 		...
> 	}
>=20
> And here I can probably make the guard() thing add const like:
>=20
> 		struct mutex * const __UNIQUE_ID_guard_123
> 			__attribute__((cleanup(class_mutex_destructor) =3D
> 				class_mutex_constructor(&my_lock);

Yes, and the scope variable is hidden to the macro user, so it cannot be ac=
cessed anyway. So in that case we should also be fine.

> But note that _constructor() is still laundering this through a
> non-const version,

That's not an issue. Remember that we analyze function bodies in isolation.=
 In the worst case we just put a "no_thread_safety_analysis" attribute on t=
he constructor.

One problem though is that the constructor symbolically locks my_lock, whil=
e the destructor symbolically unlocks __UNIQUE_ID_guard_123. We need to be =
able to figure out that they're the same thing. I see three possibilities, =
without having tried any of them:

1. Annotate the constructor with __attribute__((return_capability(_T))).
2. Create an alias before we call the constructor, so that constructor and =
destructor get the same argument. But this wouldn't work for try_acquire: t=
he alias couldn't be const.
3. We model the cleanup-annotated variable like a C++ scoped lock.

We model C++ scoped locks as objects that "manage" a fixed set of capabilit=
ies. In the example above, __UNIQUE_ID_guard_123 would be a scoped lock tha=
t manages my_lock. We have an attribute to indicate scope types. We could u=
se that here by wrapping the pointer in an annotated struct:

struct __attribute__((scoped_capability)) mutex_scope {
	struct mutex * /*const? */ t;
};

Or we say that every variable is a scoped lock, if it has type "pointer to =
a capability-annotated type" and a cleanup attribute. But it could be an is=
sue if being a scoped lock is no longer a type property. Or that we'll scoo=
p up too much this way. We'll have to see.

> and while the above could have:
>
> 	struct mutex * t const =3D ...
>=20
> That no longer works for the case of:
>=20
> DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
>=20
> which expands to have a constructor like:
>=20
> static inline struct mutex * class_mutex_try_constructor(struct mutex *_T=
)
> {
> 	struct mutex * t =3D ({ void *_t =3D _T; if (_T && !(mutex_trylock(_T)))=
 _t =3D
> NULL; _t; });
> 	return t;
> }
>=20
> Notably that NULL assignment on lock failure is not happy with having
> that const on.

Same as above: what's important is the "const" where it's being used. If we=
 have to put "no_thread_safety_analysis" on this one function, we don't los=
e much. You'll likely not even need that, because we don't attempt to analy=
ze functions annotated with try-acquire attributes (try_acquire_capability =
and try_acquire_shared_capability). (Basically, we bail out on mutex implem=
entation internals, which we recognize based on certain attributes.)

However, with try-acquire the wrapping might be counterproductive. We want =
the return value to be ("contextually" in C++) convertible to bool. Pointer=
s are convertible to bool, but structs are not. So it seems like we need to=
 "guess" scoped locks. Or we put an annotation on the constructor.

> Note that this combination of trylock and scoped_guard() results in not
> taking the for-loop on failure. Eg:
>=20
> 	scoped_guard (mutex_trylock, &my_lock) {
> 		print("ponies\n");
> 	}
>=20
> Will in fact only print 'ponies' when it got the lock.

This should in principle be supported. Once you branch on the return value =
of a try-acquire-annotated function, we introduce the capability in the cor=
rect branch. Because the destructor is unconditionally executed though, we =
likely need to model this as scoped capability, otherwise we get complaints=
 that we release a lock that we don't hold. Although we could also add spec=
ial treatment for cleanup function calls.

> static inline void class_mutex_destructor(struct mutex * const *p)
> 	__releases(*p) __no_capability_analysis
> {
> 	struct mutex *_T =3D *p;
> 	if (_T) { mutex_unlock(_T); }
> }
>=20
> static inline struct mutex * class_mutex_constructor(struct mutex *_T)
> 	__acquires(_T) __no_capability_analysis
> {
> 	struct mutex * t =3D ({ mutex_lock(_T); _T; });
> 	return t;
> }
>=20
> static inline struct mutex * class_mutex_try_constructor(struct mutex *_T=
)
> 	__const_acquires(nonnull, _T) __no_capability_analysis
> {
> 	struct mutex * t =3D ({ void *_t =3D _T; if (_T && !(mutex_trylock(_T)))=
 _t =3D
> NULL; _t; });
> 	return t;
> }

That looks reasonable, assuming that __const_acquires is your macro for try=
_acquire_capability.

> the: struct mutex * const in the for() construct might just be enough.
>=20
>=20
> Would this be sufficient consty for it to untangle this web?

I think so. The cleanup function is going to be called on &__UNIQUE_ID_guar=
d_123, and the annotation says we release *&__UNIQUE_ID_guard_123 =3D __UNI=
QUE_ID_guard_123. Then we check the type: is it a reference or const pointe=
r? It is, so we look up the initializer in a map. We substitute that and ge=
t class_mutex_constructor(&my_lock). There are two ways of looking through =
the call: __attribute__((return_capability(...))) or the scoped locks idea.=
 We don't look into the constructor, so it can do whatever it wants.

Aaron
