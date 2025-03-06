Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4627C868
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 23:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741303462; cv=fail; b=ge4Na8L2TMeNHh8p2N3Ru8nujrsNJ0J5Vlc2x6WRUyklnEn8lJKxvz5luj4iFohhEYH70BhZbfQ92dWMqPsxj0WF2amg4qUjdRoCOzP4xDRWQeg+KsFh5jtSoNy4JTyJQ8IYYvK3R1j32EC5yMhIYixIUp6oV4Q61WQ1PlUTu94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741303462; c=relaxed/simple;
	bh=NloHZXk92GmfQLs/sg3W60Crbs0Zg9Atc84n+u9rNtY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t3g65fOPjpGwyjk5neWChynOuouMvN4/wGfVtCRZyzIaflUkQKKNySEOwQwLuZrkjeCg+5uVIEeNptMzxzpK1J+4l2pZ0jKaQGgGJObYbDvjmCYBQErcE8AzZ6b0MAgHAj7jMs7vLgJRrXnkXO0FsuwhdoqZ+f0WUUL91A3kdC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=b4E00wLQ; arc=fail smtp.client-ip=40.107.247.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="b4E00wLQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4WqsbJ6TClPzFNZzT/6xUqqwYvX8K+lacx9znvelz7rhw3KcQLYFwGPmvEgDiYAXpZ5YHi8+dQvHinP7c5MAT8PZ4lBI6P2IxidSC6D4NvSCiQ7J5yAz/1yoDlyaRfQVgkw7Xf3hvVXrWeAVI9aMDn520qkNp4eG3ceIi6gJUmm+aP6NNoO3nzTt7YYpO7qm+EVxaDSsps+grLGyO0Pwv4e5ez8o1SDWig50HM9pzxEfgUVI1Eo+bFvpPnzuQGZM8iCWTD1ZI3pevmRnpmRBHJjuJu6usoQb0YsXnf+d9UMxhWCytWr5Pc7VemJSghH94jS4tvkKiHMWk3QKw7dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZg5PCuAg1vSv67ALDTl2UYqdSIGZQLKqck9u32nxhg=;
 b=oeVz/W+hMLB/r0dhPYvwKGqwUefmqNVv7625tqBC3Kq0Zn4R9RR1IPN5N10xuVyZ2UmZPMzfaA4XrgbcRTPvCLy5Lf+Y3ekHS6b4oatxaiwSFQAqJNu2P7RNlVrSvdzyVpU43VsEPVrPTCGPA2EO0Avcahhje7deiJWbC9aHr2JN5/GgwItnf9yoZQUlUdcAUn9ySsMl89tfwy0Dbcnd3l1iypd9NyaIPhiFlnTpJAv3ok2WJwPTIjLMFM/104t3pJHEhoXh96s+cNYRZUMzhpAP+GR1lH1PeIDDPyKJgkyj2+y/xafl7RSFnUKeAgYG1LVP9uBOgezxJtA+7g/MdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZg5PCuAg1vSv67ALDTl2UYqdSIGZQLKqck9u32nxhg=;
 b=b4E00wLQL+0jiavKSJNj/i6jLNQvgLhAHfkqTvLIqkmhLgFos9QaaPTsj6DoREw68gIAEQ7knO69JQZuxBwrHLQjAXf4T5hLsj20F/WnS7l7c9O7nAp6kq64hKd+eXt0k8sIaDTM6u6yv1FIdBSy1j+NE/pAmn/U8PtEYVOfqKc5iNlQF08FXcn5yy8EJ12Uz25EZBX9pt0AymmRBiCCyfK+W1TmT5euEPGAIUPgMRj7Zzk9dngAaJFH6KkxTTNo+7BrVXXSowsK04h4qIycU8aOOZCDGAL9fydwW1NLkr4XbTFWjXt7yRX9bf5TV7MfGX7cfaEV/9Bqjlxi6CgpoA==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 DU0PR02MB9658.eurprd02.prod.outlook.com (2603:10a6:10:421::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Thu, 6 Mar 2025 23:24:18 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 23:24:17 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Bart Van Assche <bvanassche@acm.org>, Boqun Feng
	<boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAGWK4CAAGY9gA==
Date: Thu, 6 Mar 2025 23:24:17 +0000
Message-ID:
 <DB7PR02MB36260D226AF2863E6F404B79E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <119f37e4-bbcb-403a-9f63-5b9001233c0a@paulmck-laptop>
In-Reply-To: <119f37e4-bbcb-403a-9f63-5b9001233c0a@paulmck-laptop>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|DU0PR02MB9658:EE_
x-ms-office365-filtering-correlation-id: dfe3df90-81dd-4aa5-b102-08dd5d06043e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lRbJ27RrbAKOFcmAtE8CYiaL5b9mBW6EVM5H4JE/PZ9gPZecxs9c+Iid3H13?=
 =?us-ascii?Q?EP8SFc+OPSeC5N2WDTDeXjn2MIvcTNsu/943XxDvXy8JikTqz0VJF2Lhm+Tx?=
 =?us-ascii?Q?9jHWsKqGcmUSf30PcmHvpYLkr+Qd7qZuYdpwOUxLbOmA21XjTDD53bn3bhWU?=
 =?us-ascii?Q?Z/09cgBe1gTrfe6q/MDXDfzzjah2bm+vPqz+qMTT+fVK4b8m0ntUiu2WrmhA?=
 =?us-ascii?Q?x7zpGUvJlOlRmGm9yluOFDOPPNRJvqKkhcVjJTImLhxIXcJztss0QnlqJaHg?=
 =?us-ascii?Q?PCXHMbliLV7M3CpZu9cXQyCrJ5dYpWcceSZrfTY7gpbWmYhTPCH/DLXE6C/2?=
 =?us-ascii?Q?0LRrDPmF8R1b1Yi9mK/EUMa1se8FEJCWsvKjS3CwD6foORP0r8TbM+A/iWIC?=
 =?us-ascii?Q?yMxgruUFLd/l6+g1+YIOr+242QtwCW8ht4MUXVmQc+Ockww9C8XD4mOhlepK?=
 =?us-ascii?Q?0et/jMuFtJcRWTyvImv64+jD0DyT/f7kPq9bR7PmfV+pWNPSZQHDtksdXZ44?=
 =?us-ascii?Q?chHwxiZpoyJAqSkkPUl8wBPKLbFSmpW/G/RyMaf8xpMeHGqL5QoZyky15Kcw?=
 =?us-ascii?Q?CFxBegpyc8VB+TwYKKSbq+5ybVvEqF/EkDYXy1CuLBH1defa4zf+WfnOuUTx?=
 =?us-ascii?Q?L1w0dNtGjyVoZvn+59pn1lqMPFFlsbfaFNx8GQd9yF3ytnnU1iQ/EvUvFj4q?=
 =?us-ascii?Q?D8n+aKjOchFQWndv84JfsOgeJhv3gmJLE5KnUJP0mP9ef5hYRiSm3RhQGS46?=
 =?us-ascii?Q?C5G+b+F56W2+U5jlvU8Yx7y8fLWEOVMEahOCiPxvxtPAaTtvh15Hf4EnbODz?=
 =?us-ascii?Q?41E43r5keUZWLdLEQe7XXserVLDkgZUJYcVCMzKMdFqrvGz4C/XfK/FRPvNM?=
 =?us-ascii?Q?kkX4bEiXZp9AYFQB/2M0+BC0CyA7rnVt6aSVrDUF4hFsred4R3ItnmdLdZwc?=
 =?us-ascii?Q?krobYUZylzr0r2dLsZmTt69y6XVDNunMBR5vvwo3Jq2Mge8TKo8aYEqtgHvn?=
 =?us-ascii?Q?isXePj1RvjlTmqJxCckSbn4Vh4fklUU9xszP9gVYbE/aGaKDmsTs/wEaWCO0?=
 =?us-ascii?Q?HbtqIKku4ism4xbM5n3xnHao+R18F0QpEQhJjFewPal1N9NMQmGnsl57fJ+H?=
 =?us-ascii?Q?qaXq68VOzwCXZhY6HvCrh1v2YdmwLtj9uQZl8djEWXFhM7StLFYLsmSQtzHz?=
 =?us-ascii?Q?l54isq6WgImgFpYL2tm/vuDEXTkE89uLmZGiqVVxLUNMPKzSVJ6EuLZQfrkF?=
 =?us-ascii?Q?KTbbkWLCe3RKsBVzOzw2gkmP8Tz67IizbTCAGr725bFzW6+Q4hwg3eJzWBBC?=
 =?us-ascii?Q?khD++4WMBMFtjHOnwcuRHGXrO0ANcBi3Fpkt0PqtAtdMxJt1U2vDINjVH7e/?=
 =?us-ascii?Q?2lcv3RRq9GAuPKlwsEM0bMYk39SYt6CC97OFHaEoxQgc4MWFVvm9vyh6uFWO?=
 =?us-ascii?Q?NC8cg8wI3tzsKPW85u8VPSKbxRC/OqpZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ak0r2T5T4+W/hE/6pEDK9/KSxwbKdhjSEJmWZSrOeP2i3akWbrdmQlRbvVe4?=
 =?us-ascii?Q?QTlCLUDL4GoaJ3ZmfIbf1xaCZdd5qKj5doy+lVvQonafWfx29azbP/XxLDLR?=
 =?us-ascii?Q?Jek01/4HJ6oAIMY6qtkNcJz1I4YXp2KOiAWTdD4aWboIYMltRC61WJCe8OKr?=
 =?us-ascii?Q?9f5+6IsxAWFIFtM7OqP5TmGRGyPc+O2taz8lTlm+KhzI8OAJnXmSo14Wi51U?=
 =?us-ascii?Q?fmNx114x5BSHhzvTbjkgwt31F6jaDf5L3irX3XHu9ssVysNxp8gHATwCkdiy?=
 =?us-ascii?Q?ID3oMQgsrkMed4MCQWqmjrt5yBysfwfK+p9vKEdsOVUwDgWAAoRT8awd/tg+?=
 =?us-ascii?Q?uMQi+3R3wHkPU68s8XG3cNeCC76zRiyDbClCd5ozRTCMER335UlswgfCezzY?=
 =?us-ascii?Q?fQIlXxvPSmnlq/EVLazMDsvFlBaLIFfymWtvHz4ge5zn8grhw39sO2wegAa2?=
 =?us-ascii?Q?1Clz6o8GEntxvWXloa3pqjrOWFXgfEKWKE2Wt+bTDPgHPN/5xfGlgl2wdicA?=
 =?us-ascii?Q?D9E3W5hoqAa9yLqxCuxHx/t2ExDYVSMsPiJoXfQBR0wQ6N5DsElYKTCKCtrw?=
 =?us-ascii?Q?EPplHzICgcA80qRRiRZTkHcItGIWQ00FrkM6WcGREa6bRXlupRzy1gFBOMrI?=
 =?us-ascii?Q?499jn4nckL2En9ka0Wjs4NdmuNdtCsA0WZXWi9nJJn9RLL326LarvHUg7YyM?=
 =?us-ascii?Q?tUjLVfYIsKIC3Q+0oNo8VqK9oqLAlfOMzTzF0cgydHh8voyzdGKjVFTMFdSl?=
 =?us-ascii?Q?CM6ms6q0cTT3bVoJXalkop4BQO8Ga9Mbl9HUQjOaAStFEFR0uG9VvAZhlMLp?=
 =?us-ascii?Q?MWH7Ix8QcbnHzSvatogbicvPoy4KnDxAxR4F4UjeHLSEJiEI1QjryQM7kOEZ?=
 =?us-ascii?Q?OltN9QTR7w7SCw0OI0uqr/Rjfr6UXMx6ALlkZRksQwK7BEFwipcz8+BsH0j7?=
 =?us-ascii?Q?vpRxYa7PDlpFMT1ZhPauCND6F3e5Tf/fnWy9neuN1WAP7pLxiu/FWLB2MtW4?=
 =?us-ascii?Q?meY4mV81btqDrYgzKnL8gXhIu+bJWwRkqSMb3pi0jbCtgcOW5sqjKkOJa0ZK?=
 =?us-ascii?Q?fooQAsGXPSuJPO9lQ1mL/uQOJLxgsX2+brwW0IBpcpoHaBrUQHErikgOqJac?=
 =?us-ascii?Q?SgscVAiMRdE7lMPSWPONECJex6jlSqE54+/jt1XgDWUNx0cS7tCVRr3bFG20?=
 =?us-ascii?Q?eMZbLpBezEkhANa8IyhuxWZysKucs82Dcrgi0g+5d50/HMx9xiwwKfIMULBh?=
 =?us-ascii?Q?HuJJQAbpsHJTKuVOYdwcmd4ulpa9Vvw/jZmw12fS8LnXJ0NFdmGs6Dp7SByZ?=
 =?us-ascii?Q?iBQ1LBfVdP7dJPaEnInrqt8H7P42d5J/4MnEbWxHJHR5SMf8nkZhQr9ESIiZ?=
 =?us-ascii?Q?pLPNk2U4LvC06Sie9vEPZXu3+DlwYR22ZrdWse8X2AIaz6xcjpAgqzpkQS+S?=
 =?us-ascii?Q?8+E1oEl4ub6bKX/h0FraZURj0SPMbzLWvwSJzFMGXmCGzI4n/hvm0mon4Bk6?=
 =?us-ascii?Q?sDgQlZ7616sjlbBQ5lnBZiL7OHLQxOayW9nI8goTfq2axtQIMywAAtAUcXUQ?=
 =?us-ascii?Q?yMj8OSYId1HEtnM2JG3YjC0hlVhjV1YJeTW65enY?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe3df90-81dd-4aa5-b102-08dd5d06043e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 23:24:17.8644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qVkXte6PtaHFyLYoFDcDuq5SC4DqUv8y1t7XIhD/4y1OSJf11zLBoWFZFiIAt0ilBq91orntCcT7VNlPEC0CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9658

> From: Paul E. McKenney <paulmck@kernel.org>
> On Wed, Mar 05, 2025 at 11:54:14PM +0000, Puchert, Aaron wrote:
> > Re-entrant locks are thus not necessarily an impediment: if one functio=
n
> acquires a lock and calls another function that also acquires it, the ana=
lysis won't
> complain. It analyzes functions in isolation. You'll only get a warning i=
f you acquire
> a lock twice in one function without releasing it in between, or if the f=
unction is
> annotated as requiring the lock and acquires it again. However, in both c=
ases the
> second acquisition can always be dropped. You can argue that this isn't a=
 deadlock
> and hence not a bug, but the acquisition is unnecessary because the lock =
is
> already known to be held.
> >
> > In theory I could construct cases where there are still problems: maybe=
 we're
> locking twice because we're calling another function that unlocks once, b=
ut we
> still want the lock to be held afterwards. However, I've never seen this.=
 In our
> code, re-entrant locks are only used because the caller might already hol=
d the
> lock for some reason. The sophisticated patterns that I could think of ne=
ver
> appeared. If this is different in the kernel, I'd be curious how it looks=
 like.
>=20
> We do have macros that acquire locks and enter RCU read-side critical
> sections.  Also, depending on exactly where the analysis is done, static
> inline functions might cause this to happen.
>=20
> These can easily result in a function with nested calls to (for example)
> rcu_read_lock().

Macros would be a problem, functions not. As long as the function doesn't h=
ave __attribute__((locks_excluded(...))), which would be pointless with re-=
entrant mutexes, we don't know when checking the caller that the callee acq=
uires the lock a second time. Similarly, in the function itself we don't kn=
ow where we're called from, so we don't know that the caller already holds =
the mutex (in some cases). We only know when we have an __attribute__((requ=
ires_capability(...))), but then it would be pointless to acquire in the fu=
nction.

Aaron
