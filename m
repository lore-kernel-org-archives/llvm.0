Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1566B19006F
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 23:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741388599; cv=fail; b=XqnVbxUdoS0w7eoU5FY+4a5AaF/2pZAhSM8ESlm7G7/FJbYpTrfi0xg80sU+fZc3e5tzXWE1IJXOeRsR9LTxuROHsbnFWkgE5cFISJjyrjy9ytoDsEqSUs4xxNynlKq06NO2VmSc0jnnec7TKJyacMd8iQSeEo22hjx8y9TBNnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741388599; c=relaxed/simple;
	bh=Ku5O6I5b4x0352DrhR5XEcHbjuGfPyHWR2+1A0SupdY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u0Qq5HlSyLg4C7hFDOx1/e5BSp7D75cLx2lMWcGCTlxIfUwJ+/FQmCbfbV4w78cs2a8OibuPmBV8rp/XsS7+zf6zxAW3h3BVfdYZnYi5mqyqB1yXOVG8Mnrf8AHbMG72FtJ9LrZ+Gx4bBj6T6oHGPpkjyg6I5havqkYlqS3IGJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=VfTPBxcJ; arc=fail smtp.client-ip=40.107.22.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="VfTPBxcJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT592FS3YKohfVblTPxOdHgGDWsChxFBvq91m1DTXD8Ia703bmxmCxUF0NEj243HrDP8HmZchXds0HdV996U28i76relAG5xwcrMmpFMkYRkW9esvDKzbP/gDvoGqA/TJUdHni0te7OsHl42dw7QD8oUS8gpCKF4LOI4EgS52q5sc6KAEUejPoyAVA+JRnMp4Evb9foB4zrU3GZJAcAWAQjKuDbLkaiMikJ0KsyArofiwBzH2Me9RDgruwp9IHy5Il/bwbXaj5bc394SqRj2+84QR9WX82/IODLnZ4RU2KFT/Ys2ztpflb5dawqN+Mw1OqrkM0uj3ULkJe8T55vx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APGd5Xq6NMb/Oz6RlL/d+6XYFTNE/FMhjEa0rhuAubQ=;
 b=Ii1M7Qk5ULr6vpAB0mcC9pyNcNpTdifBjS0u4+YSC3sFoq5K8kbEJjV5d/ckg5rMy3V2+LDLuK3ELg5QoM1wAcG+aXlXsixR11G423hm1h1/rLvy39p6JaPh1Dtc2f+o3gdTYoGKgIFltxKjgOJuzua3QTRDqOkZ9XeeyniGhG8PkMbVJ2BoE04n6y1nMQTaNJuBuoTpuieqx4VY6t4cqtT3lP/kvu/g1ZEiOCHkanvsIcL5zcOFn7MIRAwIzb2NADOpkeZmw5wOeBzI/YoD2oMfkl+AlNn4PUMd9HNZ22Jb6eWjARsbZ00KWY9BP+Jm3bvkVYnO6HCaxHYFtAWRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APGd5Xq6NMb/Oz6RlL/d+6XYFTNE/FMhjEa0rhuAubQ=;
 b=VfTPBxcJFV2lc0YxNhl6gFHG83LjI/lvAXSmak7CwOls+VsBOFt024tf/VLZdQ94eXJdwzo7HCV8823vYkcqu/DWz30JKfhbwhOGUiLLmBJoNSh77j/WMjy5CIp3prLWDr4XDVLx0p8ciiQB9wOlhQy+PlH3HJMwCJTd7cfz8gfi/6H4LOF2OyvpORDEP0fZmXLKTOdPjXVvdVY3amg0bRayaiSvs/fWPcxVuz+KPcVEbrYjs43wSmO4si4V3KaUUptFQ12LnnxBVsi8L1UFObfKXl0yiSL7Yn1uZWr7BB3GCH2uNHrWXuIAF/Yl02GK3EeGcu32ch1FiQ0n/bQPwQ==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 DU5PR02MB10552.eurprd02.prod.outlook.com (2603:10a6:10:51e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 23:03:10 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 23:03:10 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Bart Van Assche
	<bvanassche@acm.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAEoTgCAAMQK0IAAsLsAgADddtA=
Date: Fri, 7 Mar 2025 23:03:10 +0000
Message-ID:
 <DB7PR02MB3626FEB17656A39F393AA3B6E7D52@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
In-Reply-To: <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|DU5PR02MB10552:EE_
x-ms-office365-filtering-correlation-id: 58e65d46-48d2-49cc-5af3-08dd5dcc3b30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jG149T8Ni7P1Y83Uo5jqRlFc1dkXzFpt4/LTaySO2/tY018rUr9vECZLnw9K?=
 =?us-ascii?Q?zrXiF6GPzxIK9m8vN2ikjTo60YcNRNYrGTWrZBZ58usToKeB1/XunxBe12o9?=
 =?us-ascii?Q?eLDGKPFiuttFu+Ifo84wYen7ej9MkK7F60qLB3fCSfntsuvGOFsJhZSLOccm?=
 =?us-ascii?Q?JrNFsyfl7xD69+BhObu0umjY+fqNxH81oEktMLZAxBY5jTI6Zqunm3m+aY1k?=
 =?us-ascii?Q?P8M5eFKe0sSeomHAffH7MMbkRMbHqpZ8dDnwJihfX+LIAaJCscWG9CjhKFIy?=
 =?us-ascii?Q?vXAoiWXm+4kg9TWtepx3PsABI0caRJrFxeq9Cyfw3cbww02uNbhumx++lZ5m?=
 =?us-ascii?Q?nKeLX2+b5jAXvlinu7aumO0FIPSUWg+YoZoLd2ewtWAM0w/FkdEIB7QRk9vz?=
 =?us-ascii?Q?GNgwRPoNfGMISXcdQfC2iES4zlEvbEcJEY8hrg5hSc1p/5aO6qXDA5jGutUS?=
 =?us-ascii?Q?2lqR7EImuZtAHTvPh03p043/HEHgFenHVyTBif1xSpeq2f1Yg/cpqmbAQ7Ci?=
 =?us-ascii?Q?wFkkrGVL5NBbM3rg3MCjS7seZYL1sIvVwv4BxresJnInBZ3lbOB/BaKH5J/0?=
 =?us-ascii?Q?TzgwrSv0UKt53tZzDu1G9wZ1Akm6pcM9+xma1QlJo5Oy9lwCHPqb27dWJE8I?=
 =?us-ascii?Q?G2sGRysq9tscnx9sEDdZca2hFSecR4m36Iok/78B7heRw8316AEcalnIiQrQ?=
 =?us-ascii?Q?8434+PJ6qE8Tu2f12XRWt/Gl3NwaxmcS7ydQJu0K9ypg4hG7upHmraL3du7u?=
 =?us-ascii?Q?B/O3Ughb6lYckEtWhNbKqFqj+M2BiFd7FPp+IlPhegy89068s4DPoMvPuhLL?=
 =?us-ascii?Q?LQo1FDlZY4YY+w9jDpmvDyuYmjx2Zkke5642AJsxDtsNBSlBFr+cwdH4/7WX?=
 =?us-ascii?Q?BzuR91tP8IjV3LjrCVYzy9HgFNQgNJyTwch8tFO0HHfygrgnk91JsqbUABTY?=
 =?us-ascii?Q?jNjQjekrFC0pupAOeObipQui2jQxpQ8EXKAXtmMzvUZMtsJ0sJunKD/7T2hY?=
 =?us-ascii?Q?PEmm5pxArVXGMWRgpT4eQKcqiuf63dvEA+pyB34AlutK/JA07x8KmbSDywDc?=
 =?us-ascii?Q?QSR50PQrclcdmNBbWTEWgb8gdA+/TLT5k4IBPJbVecTUeo3ayN75ddszK1X/?=
 =?us-ascii?Q?erXheEQR33zFLRTL0sBUZlUkDrVk7RdsBeo/pV3nfXhYhQElMeU7fhG7LgaN?=
 =?us-ascii?Q?URc3ytrSwwdyVJCsLz3A6dgT9Qk9iGxEwtJkXOhWc9phgF1VshRTZsoWG2Zj?=
 =?us-ascii?Q?+KBJ8f4id4Ph+0ZR3lfAQvHBBm8AUcR0gPA055uSCwen+jmNrVDp37CCNdiC?=
 =?us-ascii?Q?47y0fDcXMqvvOYQ8HsZJ6CyDPeBQSl99HIN6ruZB+Me7+xDA/RvWdNH+IJzb?=
 =?us-ascii?Q?G3lekljI3WkrbTDi9P5PwxQ9Qg/UHSIuX2JfDCUs8upRAO+E7L4UKIRf5XGv?=
 =?us-ascii?Q?OmFqA68mhTq7710OogKdSOhtiqvFQBGr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sAPocJMKCztJXhhckRUhvNgg8maVmtmIshePgkoJZhIsirKjGJCUAyWR/P1J?=
 =?us-ascii?Q?8OYgCzH+cpGG/PMtJ+YkErQIfsKeH75EdTnfFcdDS7T3i0BTXyZSQgaLfp4A?=
 =?us-ascii?Q?i2JLQq8iI74OH07h1IRrWSNdbARc4JBZIxwyfafjprr0HHkbJyi3WZTcw/YO?=
 =?us-ascii?Q?tXwWIv/qjxVbv3BHY4teGzT1Yy6eaSTOcQtgrbdRouc7vGXNBLw7tMsEWQL/?=
 =?us-ascii?Q?qpgmDwR7zyMmDUdyvX2TeH+l9Ra2sYCbOVoucjM98+TpW3a/WQpNbySRvZ3f?=
 =?us-ascii?Q?9KHWOy73D2RvtbrW2+vbCs7VcxPzq67q5VKrf38uUP4Cr5OF3y77YT/OpUnN?=
 =?us-ascii?Q?OM9nfvHC8PRPDAOi4UL7rQQ6970PxhnmpcFHcnPGC404PdVW5g1hZg4HgVK3?=
 =?us-ascii?Q?JS+DTC/xjlGFcmcesTftJQPCN20jiItPnX4yYTDID4UXQMLOlPG/S7zH0b6B?=
 =?us-ascii?Q?tMMfSnyUrM2H0lQTb0OUXhtbIQNHv4s10QIW/N2smo7Yu0v9EicUIdATxvyK?=
 =?us-ascii?Q?aEloCdgX3kQJLyKMQVP/GiFeWkAebaKciFblFqELu2FAB5M8Kb8aspL8KQ7T?=
 =?us-ascii?Q?vL67jGo5sgffsfkl7vNNXHxYd2C1aZKTgcNvUR9BtSE5yq9xg99VO4K2LoQX?=
 =?us-ascii?Q?PYDeT3diVJa5nC4agACfZa7xklSGMfg75rYRd0D8kcHxzotiwdm79xuDmoD/?=
 =?us-ascii?Q?EYtv6BnT4sslGBohMChKH18fJjDkh79HlP1B97lIBNn2KyCF/+hBAlb6N+Pc?=
 =?us-ascii?Q?IXA46K6YexzZleKhx4xqOBteBEMEJ3pVg3VnNTvuc69rgEI9OjjUH/bLN+x/?=
 =?us-ascii?Q?k4aPFjbBviFoXxc4Phr97QxZyee8OnJZr8XU2UoXreLdKKxYQHp3wgN6BFqw?=
 =?us-ascii?Q?avBjde/ktuFqJrryOF3jo1oTlEzKeBq4eCVu3vpMNXVAqaCr+pn4DPKaMRtx?=
 =?us-ascii?Q?tcNU9movC0kWAUBrXQz0364J3M35HF/fmoTdYc40Q68pE68nNrzhnWrEUmkV?=
 =?us-ascii?Q?uMSBxS3SP2xaaXvcSuwBxmEepornXqSgkc/L+CAQjSq4UEYBkBLWKBdLgDrb?=
 =?us-ascii?Q?3Yoe+o0vSu4AeYtYQlEyr5h2+7Q90Bk/1MgoEr5ZCseE4UAOZCsjHuS8s67A?=
 =?us-ascii?Q?8qkf60iWosLxVCQm50/6i7zdJzm8KhOwA9NUJFgpT24kgXQ8QaS27C1xJ/ej?=
 =?us-ascii?Q?ZQFfppVGiSFr8BtmTydsAD17ZzE4hELeEOs1b1J8j0Ew4I9OeusIqh0v0xls?=
 =?us-ascii?Q?h+6a/TwulLRP/6hswh8nMPWazbW+YRwyMjOMnhu6+3tdVqsCk6cl0Cj0a2cp?=
 =?us-ascii?Q?XzSZgsTJUSfYrkX/minVihuW2bG9CCayZm2qS4/aMCy/kIIjG8l2NvLpQzMZ?=
 =?us-ascii?Q?KyV8AxHEsWdA+Q0IhqjVpVYtXGMd9qUpo5IY/bZZKZDm3K1XQfZXfCkHf1fQ?=
 =?us-ascii?Q?giulhg4d9fAdJR75uMeCyaOXV8v0dQOylSCqNbxQoZqY/Ozs92d1JNPG6y7b?=
 =?us-ascii?Q?mNueTH7sxsa4TK7VAbLb4xk2BQ/3jsVaWwiVEZE0yB5KoMQPvucQoJJOVHdY?=
 =?us-ascii?Q?Uu9JLkBHRqyrETU5zpWKZTpgey5N/40wVG1TXv+y?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e65d46-48d2-49cc-5af3-08dd5dcc3b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 23:03:10.3604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omU9B+GLEbhGMpwOdhWeJmWeqbgjpySxc3q89P1c9KlgBmiooA0zSt3vRm9E5ZYsaQzTPbxF42KL2MFw+bVFwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10552

> From: Peter Zijlstra <peterz@infradead.org>
> Right, that would work if you then also introduce __guarded_shared_by()
> to express the requirements for access, it then becomes:
>=20
> 	cpumask_t	cpus_allowed __guarded_by(pi_lock && rq->__lock)
> 				     __guarded_shared_by(pi_lock || rq->__lock);
>=20
> Which is a little more verbose over all, but entirely more flexible.

Would be interesting to see if you have patterns that require this addition=
al flexibility. So perhaps we should wait with implementing something until=
 we've seen a bit more.

> > Your idea on the other hand sounds pretty reasonable to me. We already
> > support multiple arguments in many other attributes, so it seems like
> > a consistent extension. And semantically it makes sense to me as well:
> > if a writer is required to hold all capabilities, then a reader should
> > be fine if they hold any one. I'll have to think a bit more about
> > whether this is always the right thing to do, but if it is, we have an
> > easy way out.
>=20
> If not all required locks are exclusive it comes apart.
>=20
> Say, it needs a shared capability to satisfy existence (refcount, rcu,
> whatever) and an object internal lock to serialize state.

Currently we categorize accesses into reads and writes, and reads need shar=
ed capabilities while writes need exclusive capabilities. (Reads are "lvalu=
e-to-rvalue conversions" in C++ or "lvalue conversions" in C, writes are as=
signments and a bit more.) Am I reading this correct that you have operatio=
ns (read or write?) that need a shared capability and an exclusive capabili=
ty? Although you can put whatever requirements you want on functions:

void f() __requires(m1) __requires_shared(m2);

One concept that we have though is separate capabilities for a pointer and =
pointee:

int *p __guarded_by(m1) __pt_guarded_by(m2);

p; // shared m1
*p; // shared m1 & m2
p =3D &x; // exclusive m1
*p =3D 5; // shared m1, exclusive m2

// With alias analysis:
int* const copy =3D p; // shared m1
*copy; // shared m2

> Right, so we have a per-cpu struct rq, and a task has a member
> indicating which cpu it currently belongs to.
>=20
> struct rq {
> 	raw_spinlock_t __lock;
> };
>=20
> DEFINE_PER_CPU(struct rq, runqueues);
>=20
> #define cpu_rq(cpu)	(&per_cpu(runqueues, (cpu)))
>=20
> /*
>  * And I suppose we can imagine runqueues to simply be an array
>  * and per_cpu() to index into said array. Although the reality is that
>  * it is much more like thread-local-storage in userspace.
>  */
>=20
> struct task_struct {
> 	raw_spinlock_t pi_lock;
> 	int cpu;
> }
>=20
> int task_cpu(struct task_struct *p)
> {
> 	return p->cpu;
> }
>=20
> #define task_rq(p) cpu_rq(task_cpu(p))

Ok, so then we can refer to the member: where you wanted to write rq->__loc=
k, we write cpu_rq(cpu)->__lock.

However, I suppose the macros go quite deep and then we can come across a s=
tatement expression (or worse).

Another issue is aliasing. Maybe the caller has obtained the runqueue in a =
different way, and then it's not clear that it equals cpu_rq(cpu).

> One thing we could do is add a struct rq pointer -- duplicating the cpu
> member state, like:
>=20
> struct task_struct {
> 	raw_spinlock_t pik;
> 	int cpu;
> 	struct rq *rq;
> };

I don't think we need this. You can write expressions of some complexity, i=
ncluding opaque function calls. (Just avoid statement expressions.) They're=
 compared symbolically, which in the case of function calls implies they're=
 pure. To play a bit with your example:

                rq =3D task_rq(p);
                raw_spin_rq_lock(rq);
                p->cpus_allowed =3D 0; // let's pretend it's an integer.

The second line acquires rq.__lock, which expands to cpu_rq(task_cpu(p)).__=
lock once we have alias analysis. For the write to cpus_allowed we need an =
exclusive lock on cpu_rq(p->cpu)->__lock by substitution. Suppose we make t=
ask_cpu a macro and cpu_rq a function (for sake of exposition). Then our ex=
isting lock is cpu_rq(p->cpu)->__lock and matches what we need. If we want =
to leave task_cpu a function, an __attribute__((return_capability)) might w=
ork there. (It's not a capability, but I think we only use the attribute fo=
r substitution and don't check the type.)

It might need some playing around what needs to be transparent to the analy=
sis and what better stay opaque.

Aaron
