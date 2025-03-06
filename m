Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2076.outbound.protection.outlook.com [40.107.103.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36617259C9F
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741302867; cv=fail; b=CjRcPUhvtXOH/iCTOYyf1cW10fhcVpzoHn4FKdu/l6McheNs7gKU46hWtmIdbA3ETEUIucwZYMORVxcYnvMP8i/jFpfZoPoFSdvTRx2Z6OxXxqQ9yzjYmXIzNyjo4l33c5Hao52P0k1+zEcQ9uAd8+oGM+2YaW2ztaAfkP01ndk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741302867; c=relaxed/simple;
	bh=Nv0d7SCsM8jq5Qn2gD5AiDbcPYn3GEB2nKKeAdz6mBo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oSSOabYVsBVq2kBoiTjy6z2E/3m1TCjnohbbJagA5/IGVvSnILuEKIK08xj7cFLvM6opS3cxnjMVwDd3vavDF9rT9B208Z18udWmHD0NgEXl72HcjsoWdSCoNyBgda3Dk6iCx6wGb4+QURhbbYdJpWSx67SZvGe490nGT0vDYcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=RFQiHYVb; arc=fail smtp.client-ip=40.107.103.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="RFQiHYVb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX82nqwJiPE/qqbRAupgChYvwNCS29OnvM/grXVCCe8Mx9ZVdacc6y8V0r7VVT9VwKCqFHF4piiSu1N49ZP+TEltH/cdrqgfxAv/4m59oIdepBHNNa4KcKGRco/PZVpAZvZu0+U4lxP7Cp9OpNidEydMyhsFHBBJc+u5J9NfWUd0Wgp6RcFgYffecMD9Gzsp98hD9m4BeuQJVa6GTvozQ+mEsJflm5wIiyaanRxRTDqmlBOIdQ8ukVR2uJFNrWhwyYISKsAhM29HFckHl8Q0LLz7UFA27ptlQGLrXD16Z2ADSLMPfEQTv92tmaF9cZDSJWZ6RxZeEBgK/YD48ywS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxHph4XHYr63ySqdh+P2Q2hdoUorZe30Nu7Bax2W/HQ=;
 b=JAymsWbKa6XB1PnyQwBbiVMihLWPR8vN+nm8WDdlOdS2P7+MU8s9bHCbPOscXZFtwg005AUMOzKacZ490T+g0GkfFP13x51lESjNCuDZBSg1XA+rpfafjX9cGAUxVTNvQh+ELa0YKsIPoo0VTh9ajv6flx7d0hcSUmyplYfTT3EofjOdqr/Egs/ETctbkM3WV15iflVz7BcQ4G3Q5v/qbWkXLvudn84JFO4ozOOhWtunes6evpN5zUDUidCg6PSB4f7VmhR+SeRFVr6DArzCK5QjJbyWGD7A93H2r2CZUa/KivYc89GFB/jPKRF0AJtY9qiyGtlj+5GvOv/OyfS4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxHph4XHYr63ySqdh+P2Q2hdoUorZe30Nu7Bax2W/HQ=;
 b=RFQiHYVb+MEhjbrX0aIrQ2agzOSuvMACwuzn4NborLrk9igA6ja6pNiV51p/j4hwmniF6bLdfDbnazo6piBpMa6uh7BCQG7cOZY9+/wX6G/jmdW84FNz2yv0kAZwI10+8vclXKH8bmEILJ1MGN0FEtjQd6vtEIRjDaNa/D1gN4RLB5a6iLF9I0ozVFR5aYinFvVYh/35IXwH9+6eF5FEN2yRYbo9xatFhJp0CPxwkhHs6yD0Nn8tH4s91LeWVBt1iubl7k2efnlDNal442RoTU4I0HBgBtunqB+tHwKC5DyodGO+HugI6ZwhDY25NT1hE0syvEx4LOp9dCGV12n/1Q==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 DU0PR02MB9658.eurprd02.prod.outlook.com (2603:10a6:10:421::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Thu, 6 Mar 2025 23:14:22 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 23:14:21 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Bart Van Assche
	<bvanassche@acm.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAEoTgCAAMQK0A==
Date: Thu, 6 Mar 2025 23:14:21 +0000
Message-ID:
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
In-Reply-To: <20250306103752.GE16878@noisy.programming.kicks-ass.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|DU0PR02MB9658:EE_
x-ms-office365-filtering-correlation-id: e48d1420-1b43-4dd6-c105-08dd5d04a0f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tQcYx/+HLswbja8guuS7TVN6tAP+GyJ/xfphzy1Lk99nsFULqHAIR+WWNFKx?=
 =?us-ascii?Q?ZYWxTsA7axlqAu3SAgYbzSmRQcTbV+sMhWhI/POKJWWPiAy9r+hHkZgRfs5v?=
 =?us-ascii?Q?4/a5Arl9DQ6NGuv0ZUaNeqbAOBvU781vaNmqcCykm0Fx8Wgylh6NQrdXMONx?=
 =?us-ascii?Q?w2tcjoMXRwNeqfP22z419nw1OSRXxnXvAm6W3hrXHWMhNKcPeDU/zyC4Egcp?=
 =?us-ascii?Q?Go2qenghBZ3OZTWu6P39EbB2Q0YnCS5LOfNb6ZfgjoYwjGhg0zDfW2LQsQ1h?=
 =?us-ascii?Q?GhVFNSWAufkp2BS3TiJw0zhCm7ENaTjx2yLWHfj+LmCBQNex3GG6wXOyHpkZ?=
 =?us-ascii?Q?LcRj2QUWfd6kwXo1U3CjV+nrFE13LQTBgOTvaI3YePNhVnqWykQRg0+Mbyc+?=
 =?us-ascii?Q?nCtp/1t2Nk1+J5e0HTIb0T58OXPeZ5Coh+hUjbs6RTERIJAFH6oUVsBIKpgc?=
 =?us-ascii?Q?k5dunRHx31/DRhY5Rtbqhs1+8C/NOSYzjBN5SERPWQCCL+f0FxcLjUH0Npp/?=
 =?us-ascii?Q?Y121fmy76v83AnSoGL2nSfOy2TbEnHVB7t/7FSmOGvi2ZldY9bL6kmYVlpzK?=
 =?us-ascii?Q?Aq4Q9vqtD6ZKI3lHedpE+6qN67wL19vCwNkefyHj4Hl5Y7QcYy18rliTOonW?=
 =?us-ascii?Q?ea+ILiJRIcCf++QPqc6aXSQe0iUh2uDtYneiyfWMueAjXMYdEFKExvvhZvmp?=
 =?us-ascii?Q?0apvJh75zIjml88SfLBIYKmsw88EIYIEWSkfJmXIUYgtQIL4Wf66i3FleA8Y?=
 =?us-ascii?Q?K8ZdwUJB4r92v8pHfOjMs+98UKvaoDFefq2/oVCWqHta+X9ofQoua4YtjSFk?=
 =?us-ascii?Q?zHXftWWVucj5L6LhavuZgwfTJ0Wab/fBtEuLXM7Egjtedk+Xnve5s9ld+vNu?=
 =?us-ascii?Q?KJeHzfFzOSEPTHeQrQhQ7L2fJjRAc8T7kIYefrvXrTAAawjyS1Oc38CowXpc?=
 =?us-ascii?Q?Qqpl5MVWtKlbx6HYZIK1lNluDAhO79TU+9PPRHQl1LBw7XZ3eRus0K/Eka7v?=
 =?us-ascii?Q?gWbYAg8UqKiDvmZa5iXQQmTuylM64JvzvAgnnDHtdnr38HcnfAGOLRM29jKY?=
 =?us-ascii?Q?L+h+07++5NNp8PEureJxWFpvj7TFyFJFLqm2tNM5J0sfMitEJXwakmSjCumF?=
 =?us-ascii?Q?FsaAsSkrMaJ4Yey3lpbJusTfZdwt9Wpeh670hucLdLxInY01Rn3QK6MWw3lx?=
 =?us-ascii?Q?ROI/qNCWGJzXjuFRQlHg/GPamEH2MgqHf2CwFQgZ+kXxSbhu8xxnN7MQoDaz?=
 =?us-ascii?Q?GcrtVi+vNSDp3+xFipaiMMnSql4cC0HPjrozUVIELt6eeB/H1R9+7atTtUxT?=
 =?us-ascii?Q?mjprPtTboTxAz0Xsm2ttKN8BzBa4QZBSn11FkhE1UsroZj2LUGrFo6Lqq1Pu?=
 =?us-ascii?Q?KN3V4tB37GtalXbseVLZskggLbyPJDRUzVeijcW+Ra9pMXl5fU44fsZlMWyr?=
 =?us-ascii?Q?k+O2oNJ92a9NUYVPrckhMCDjFK5blZAU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6+CEtnbTRpPuz6Mq0D21HRnGnpb+3kwuVrrAeNZopyl5yDc59rTSKcfGqzpj?=
 =?us-ascii?Q?P9rDI06FMr0b/Tw8OIplB850BDJf8dGu11p/lL5B0sWMqc/0mMrJGOEmTwj1?=
 =?us-ascii?Q?QWXrOvDDBu1+061u4wRUE/+w6v+LxY3qUBRgMmu83bHrnhZ02LrLV94fabTP?=
 =?us-ascii?Q?4khsmvgQsYvZGLlWSsC0mk/6XAj7+U/00zmrL7qyYldI17AhNv/jJBxOvp8y?=
 =?us-ascii?Q?K97iSlERZprMeqLry1K4BMST6RU2WQwQbRHc6EOWF+2aTQ7GHZOqTqBRRV4l?=
 =?us-ascii?Q?BRYgN8jL4VpWiGiNYo4YfmrwaxOObvvdP36yjqnYPWxDDUA5W/z7FUSQwuwY?=
 =?us-ascii?Q?RiexyeSBc1qIBPD7jaqyBVdGEDcOadJ3A0DHDe8jzff5O70yvV3ddyZPD05m?=
 =?us-ascii?Q?TOjKLOIbopyAn3j6Xcg5OXX83d3+hd5zU8sO8WSVyUtwi4E6orUdy2ROW0LU?=
 =?us-ascii?Q?n+4GEnoZ9wVsmbCMbPlBLFastbD4c63RNEQ7lr5eh/wCRIOHynbhS59iqa92?=
 =?us-ascii?Q?T36/gt5g/ikOcUsU0fhdVjvYP0cnFQGxe0zZOWjNBkV1Ykv+irIZsIGsDhWI?=
 =?us-ascii?Q?acV2R+kf86uo2q9othf7L/nzWamhYiHT2LiOuUoG+FgI12AR6qpWkeDopY30?=
 =?us-ascii?Q?BxARobP3K5TPiK8ipv0mCdhnLnolVP40MfiCLHolCg9ErhcP927F2GqS6mze?=
 =?us-ascii?Q?AnYUIEnDUmk+ic1DDfBDcLUwDZUHr2KEAl5e4aO4llneqfgXXMXyQSxNNZzt?=
 =?us-ascii?Q?2KFI4pWP0MszeEnzQd7WdqWaRAZCqPsMdGibAC5Cf0qDxl9gmZz7kPmJ9dLV?=
 =?us-ascii?Q?/ohyeyAeoStSnop/0d5OzsOxjipkJOtJXwSZj8uNPZT/s4DM/OnTKQ2ai8te?=
 =?us-ascii?Q?DOdY+z5k1E3CdtWY46XDfbr2NZwe7/L3GEtbq2V9HuR0z9Q0a4vnsVQIO3xk?=
 =?us-ascii?Q?KdL1Mcsin4cYgN0zAJ7QZooymui3E3ElcDwkOYuWSOFQaSSXuLEOvbRVQW5Z?=
 =?us-ascii?Q?QbAW+Wh5n5ZlFydvF0pEC8FF2nHy98WPJSa08vZLSsuo8FIelVwAEzbvpv7K?=
 =?us-ascii?Q?jpUxb1nW4vfy4n/y5t7Dbz01aScpgNmp5m/A1a/auPey2hE9gwtFJ7uL3xd9?=
 =?us-ascii?Q?5wt2z5RwkJnv18S/ZRD9rSZGDwjuLmK90yJbyWJsZN+plStLN12/B9rf2Joh?=
 =?us-ascii?Q?sBWOia7e02x58r8cSvqOyBROqekNNmOdI722fsrDBhvbWZVahTGQt8xgBA/9?=
 =?us-ascii?Q?GuGF9Iqa2hdmSm9PnmRQeg/UYLkC/scQ69XcV9TU9CksE+njgvoMGz6q3B47?=
 =?us-ascii?Q?0bjHhdm61pSljy2Yikkmdzdc8STyzr4v0ra7xI2N1hK3Uh9UJOQkgO5OxSAg?=
 =?us-ascii?Q?XGPN+xXtLNvRH559azHHRXl46jB1WVBB0pYuEi+OvtFBw8afi8vE8cZHLUN1?=
 =?us-ascii?Q?DM8AfCC5I9gNe4cccTHNVrls/VyEUp4L+4VkPQ9mTd5DLZhZXfu5XMYIPa8w?=
 =?us-ascii?Q?CKFei+l6YumXmxFqqJ3g6muO0ofTDwScLdL4x1ZPiQJiSdhfGOWlKe56yc/5?=
 =?us-ascii?Q?dx3dq/rImA555XbgeYLB5b8wAhiP5UCmfh0bhUn/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e48d1420-1b43-4dd6-c105-08dd5d04a0f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 23:14:21.7674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xY3GvLLRkhvdesGRA3v4nWpuhJ3nwwbfeTt0eSXEmBLb7sL/pgk2Zmm4MDW9QZF4RRirGGyLghyMkLTetMEDJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9658

> From: Peter Zijlstra <peterz@infradead.org>
> On Wed, Mar 05, 2025 at 11:54:14PM +0000, Puchert, Aaron wrote:
> > It would be interesting to see some patterns. One "trick" that I have
> > played with is to move the conditional locking into the capability
> > itself: it is then unconditionally acquired or released, but the
> > underlying mutex is only acquired or released based on some global
> > state or member. Something like this:
> >
> > struct __attribute__((capability("mutex"))) conditional_mutex
> > {
> >       struct mutex mu;
> >       bool active;
> > }
> >
> > void acquire_conditional_mutex(struct conditional_mutex* cmu)
> >       __attribute__((acquire_capability(cmu)))
> > {
> >       if (cmu->active)
> >               acquire_mutex(&cmu->mu);
> > }
> >
> > However, I realize that might be a difficult proposal for the kernel co=
mmunity.
>=20
> Version of this that came up were:
>=20
> static __always_inline u32
> bpf_prog_run_array_uprobe(const struct bpf_prog_array *array,
>                           const void *ctx, bpf_prog_run_fn run_prog)
> {
>         const struct bpf_prog_array_item *item;
>         const struct bpf_prog *prog;
>         struct bpf_run_ctx *old_run_ctx;
>         struct bpf_trace_run_ctx run_ctx;
>         u32 ret =3D 1;
>=20
>         might_fault();
>         RCU_LOCKDEP_WARN(!rcu_read_lock_trace_held(), "no rcu lock held")=
;
>=20
>         if (unlikely(!array))
>                 return ret;
>=20
>         migrate_disable();
>=20
>         run_ctx.is_uprobe =3D true;
>=20
>         old_run_ctx =3D bpf_set_run_ctx(&run_ctx.run_ctx);
>         item =3D &array->items[0];
>         while ((prog =3D READ_ONCE(item->prog))) {
>                 if (!prog->sleepable)
>                         rcu_read_lock();
>=20
>                 run_ctx.bpf_cookie =3D item->bpf_cookie;
>                 ret &=3D run_prog(prog, ctx);
>                 item++;
>=20
>                 if (!prog->sleepable)
>                         rcu_read_unlock();
>         }
>         bpf_reset_run_ctx(old_run_ctx);
>         migrate_enable();
>         return ret;
> }
>=20
> and
>=20
> static void ath9k_hif_usb_firmware_fail(struct hif_device_usb *hif_dev)
> {
>         struct device *dev =3D &hif_dev->udev->dev;
>         struct device *parent =3D dev->parent;
>=20
>         complete_all(&hif_dev->fw_done);
>=20
>         if (parent)
>                 device_lock(parent);
>=20
>         device_release_driver(dev);
>=20
>         if (parent)
>                 device_unlock(parent);
> }

So it boils down to

if (expr)
	acquire(mutex);
do_something();
if (expr)
	release(mutex);

If the "do_something()" block is rather short, as in the second example, it=
 might also be an alternative to write:

         if (parent) {
                 device_lock(parent);
                 device_release_driver(dev);
                 device_unlock(parent);
         } else {
                 device_release_driver(dev);
         }

In any event, since the lock is only conditionally held, the block cannot r=
equire the mutex. So we can't be trying to satisfy "guarded_by" or "require=
s" attributes. We're just trying to avoid warnings about conditionally held=
 capabilities. So at this point you might also be using "no_thread_safety_a=
nalysis". That's what we have typically done when we had this pattern.

> And I think we can expect a fair amount of resistance from maintainers
> if we're going to go around rewriting their -- perfectly fine code,
> thank you very much -- to please a static analyzer :/

I think there are some good arguments outside of the static analyzer. The p=
attern repeats the "if (expr)", and especially if "expr" is a bit more comp=
lex, this can be a source of errors:

                 if (!prog->sleepable)
                         rcu_read_lock();
=20
                 // ...
=20
                 if (prog->sleepable)
                         rcu_read_unlock();

This might slip through in a review, and could easily happen by copy-and-pa=
ste. (Of course you'll notice when testing this.) If you build some kind of=
 conditional scope, it might look like this:

        scoped_conditional_guard (<rcu lock>, !prog->sleepable) {
                // ...
        }

Another aspect is that even if the condition is symbolically the same, its =
value might change between locking and unlocking. If you write the conditio=
n once and evaluate it once, you can exclude both sources of errors.

> One of the more common patterns that I've talked about with Marco is
> where modification requires two locks, while access requires either
> lock.
>=20
> The current __guarded_by() annotation cannot express this.
>=20
> One possible way would be to construct a fake / 0-size capability
> structure and have each of these locks acquire it in 'shared' mode (but
> then you run into the recursion thing) and have a special annotation
> that upgrades it to exclusive.
>=20
> [...]
>=20
> I would much rather write something like:
>=20
> struct task_struct {
>         raw_spinlock_t pi_lock;
>=20
>         cpumask_t       cpus_allowed __guarded_by(pi_lock, rq->__lock);
> }

There were ideas to support arbitrary Boolean expressions, but they wouldn'=
t have allowed different expressions for read and write. So this would have=
 been both too broad and not broad enough for your use case.

Your idea on the other hand sounds pretty reasonable to me. We already supp=
ort multiple arguments in many other attributes, so it seems like a consist=
ent extension. And semantically it makes sense to me as well: if a writer i=
s required to hold all capabilities, then a reader should be fine if they h=
old any one. I'll have to think a bit more about whether this is always the=
 right thing to do, but if it is, we have an easy way out.

> And now I realize this case is doubly annoying because (rq) isn't
> something that is in lexical scope at this point :-( These are the
> locking rules though, and it is vexing not being able to express things
> like this.

If it's not in scope, how do we know we have the right thing? Is task_struc=
t always contained in some larger object that also has "rq", and never outs=
ide of that?

The language doesn't really prevent you from having a lonely task_struct, a=
nd then it wouldn't be clear what we're referring to.

A way out might be to consider the task_struct field in the larger object a=
s guarded_by, and find a way to exclude the contained mutex. We could also =
introduce some kind of guarded_by_member(lock, member) to be added in the l=
arger object. This would say that "lock" guards only the "member" subfield =
of the field. However, both would only apply if we're accessing the member =
through the parent. If you hand the task_struct by itself to some function =
and let that access cpus_allowed, we don't know what you're talking about.

But maybe you can explain a bit how the objects are coupled before I specul=
ate too much into this.

Aaron
