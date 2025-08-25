Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013083.outbound.protection.outlook.com [52.103.7.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D80502BE;
	Mon, 25 Aug 2025 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141620; cv=fail; b=rV1DAjhsw/JxSqXTv8aRypePKQwXcBWg8TOE6Si/if0hb1CkPsnvhstzd/oRh9xBk9b7i5ruh8/iJWc2ftb7pL57J6M2ztKpckbVRQOKeEg8UvGQkCX0vwUV0zS4cKBwSpmEzRbEqGPuEsSLEUO09wVEZ7G7I+oG4dOgfm0cEiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141620; c=relaxed/simple;
	bh=JZ+FbXNsHmFAOrQ/3yIu8LzhXJCFj6FgeDkFp6W91ts=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a7kJI+MU2fReQk9GiTZziXJvKhYiH9YjlkBqvZHnuZs0rmdK4y8+dsUHdQNqW4/BXIYeugEkp5uLvk68XB/7D7rvxUAcZ6jzOF4u4q7361u6qH4HK20WhGgAwxwNf7KslTU3jTHSh7wDpbvJR1qwQML7e9D8aIlmKdjLQE+3/o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FIDyDBak; arc=fail smtp.client-ip=52.103.7.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FIDyDBak"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlWIFlW4GNo+lGmbOE1199VRu1C/5wt+JEaQn42mrU15Z4g1VxZiW29V6w8hxASSedoy6ZJLY806JQ48tENU6BUBsDiLCeCSBXexnreYGh8WeiTHmOEKEIcpMnLvxm3yvvZsz519W/gvjPgz+mrRkCRXSTCyj8JrEHGBtX6hC+GuOZVgZgytsFlaRWDploIivvzJAGeJgd75CkQ5aSlmRt+3BrOZVm9VRgKcsskDpku4uY0JXTSgmMMguSGNfNl5/ehdlgQdY9a6eKsmmcSo9zTVNfphm8r+lb9fbZI2MBcwIAOEjMCUxktzxl4xJLRIpaEydvL4EOzQouCNGvsLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E0BwqdPSEvjkHPDONyRXaa10TrUdc99XLEMTOP0zUo=;
 b=E6qPV/sRCLv4ZQlyxuJi2/MopazmuhJJHagaX1c263cG+KhHourwYCSRknXdglMB/GQ57+yNRMvVQT3m9f7umuQZV2iYFSYZYuHIOUAaRaXLRMz6U6WuiFy4rleaqeuz2Ba15AGuQK3GcpSJPq7sOgj4aVZ0hLZCLkF5o9jRat6W+In7sOZ43jy8oT7RA14ATCQyGe8lg0g7W/5jqIsjf8P4kuhcjNAW0o2n3e4TBqt2viCI9jZ76y7zoVBGjoQK7d3ELJsKevIBU7g7ygYHjjVnS1gAkegUUWpAni7N99Q+t3FD+mE7GL9BsjquIaWUMjrmuOtGYMoeAPDwwXAhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E0BwqdPSEvjkHPDONyRXaa10TrUdc99XLEMTOP0zUo=;
 b=FIDyDBak85PShem9V6AfzahxsjbWNbfkHa40vKjKNd3tNuUva+59fRUkQXHp1+q+ZaeCE8Q5NPa9AHsZItWa65EwwOzZVOTClmV9e4VZF7vnGgIStMOcRP7m0krRaMr7AuGUAqg+tlJG/QHbsvMFpp3FoERWQ/nBrvCfAunVqaD3m7IuozDlAT6TdDFuSh9Ow2cwHPe5O8BiqUmNfwghsBHwokg9b8H6Cfnfi0sx4lFe52YmgClP/WAimYBb7E249rNeBBMihSdBHuO83l6hNwPua0fO3U9htf2vK11FVSG4VIP+XiuUonlwfTkTZ5BfVP55Tu06fVy6ok+SwMjUHg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH7PR02MB8956.namprd02.prod.outlook.com (2603:10b6:510:1f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 17:06:53 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 17:06:53 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Naman Jain <namjain@linux.microsoft.com>, kernel test robot
	<lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Wei Liu
	<wei.liu@kernel.org>, Roman Kisel <romank@linux.microsoft.com>, Saurabh
 Sengar <ssengar@linux.microsoft.com>, Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: RE: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
Thread-Topic: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
Thread-Index: AQHcFMD9XUgbyyXLLkqy+t/2zrFzXLRyE8yAgAGE/rA=
Date: Mon, 25 Aug 2025 17:06:53 +0000
Message-ID:
 <SN6PR02MB415787F0ABF1E5BA8157E0C3D43EA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <202508240828.pVaUV45D-lkp@intel.com>
 <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
In-Reply-To: <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH7PR02MB8956:EE_
x-ms-office365-filtering-correlation-id: e0fedc45-7268-454d-30d7-08dde3f9ca3b
x-microsoft-antispam:
 BCL:0;ARA:14566002|13091999003|8060799015|8062599012|461199028|19110799012|31061999003|15080799012|34005399003|3412199025|4302099013|40105399003|51005399003|440099028|10035399007|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WpmLc01QiiIPOD78HY7Sfx8THPmUukHB4mDtUWXnlmK4HO5x3OFqpL5Rg2qy?=
 =?us-ascii?Q?zwFlSJFKHZNdN/bNRdfnodBEGHnz+oiJGp3dwZ+v4ieGFA5Dq7o3EZU5VmoG?=
 =?us-ascii?Q?Z3XPI72YSXOOsXgBQ5yL8yiVx4C50TD0YY/vtam6htATUKthuXRtRtidnyps?=
 =?us-ascii?Q?wPK8uyDA0Bfb0AGypuj3vI03Ldo25k/qxF1rV1hA0ypLnpPEqySjiZUUlWqq?=
 =?us-ascii?Q?lBCX5cSpbXVqh8PB6DkVm/Gyqn+mv4TDUf4QVmF+0Qhpu7jeNhI7BnirLsVh?=
 =?us-ascii?Q?rR2LKNlY7KDWztp2pEm+orRq3aMNUfF0SA7nvwEZcuDayevWiOBfF0nt2Xiw?=
 =?us-ascii?Q?ofe42xIXRpiMxmFsx/q/r5J6vm4kjHk3n3qYZ2OUKfxnBhReOZkQnkhTo93Y?=
 =?us-ascii?Q?ZJN7AH896sq/qDxMaTImg7jPc7LA/pT28+EFcH0BzfDF+tWXtcJJbN62t9JV?=
 =?us-ascii?Q?P62mr3Nm890FaMM/cb6os0U1f/LmNSoPQ7P8TeU+UC3+7SA4GAEQeWGCfA7X?=
 =?us-ascii?Q?dx2ThgWKgvdJuaTOtM1CCAPi9SFcF1MWwvO5CzZgoNfiG3BPQCA9Ihe12eDh?=
 =?us-ascii?Q?1vWQ74O36PuxbcOM8eriBmSFdWs0LE1m33yLXaXzHHR80mtcwbnLD3jPqGDd?=
 =?us-ascii?Q?hPa7gcEOIXrfS+ZEKbg9fZdV92Yl+/8ueY50xXitaHLAgp9QPJAd+r7GvGK2?=
 =?us-ascii?Q?CqVeopmtX/rINLk1MNX9l5X843zj+gVX1Hevhs2fpS+NxYLZzd7EzitOeXvi?=
 =?us-ascii?Q?hQdlKx1DDmch7BZSRZSa2G9vFIYT66K/rIR9ylmoNwCDvImDQoXhsMYRLGb/?=
 =?us-ascii?Q?5Zid6tjaBhF3jvjkd81Wmg6iz8CoDbNGB+TwCnI7XD+kl8iK8dklwsMFef3l?=
 =?us-ascii?Q?IHNrvfMolQeI9xEmxoTkAoNxU2oAXn+8p5y7A3ymfaQ+B39ihx9gvchvSb/n?=
 =?us-ascii?Q?WvG7ITUSdhmvDZRiKHKaL1HHV68+oxHzVMjwS5lxoUvXIyCi0f2kwcTX/lOx?=
 =?us-ascii?Q?E0oXtsSPzMoClF774jAx/1EdW72whriRPPRxuwvbSMXwd1XSjtN7TOxdBlfZ?=
 =?us-ascii?Q?R2g8uvTn208dAbRA373wE154sO/R/pbD6pTTeevwWPZsQB+MArjU/VrqCKk9?=
 =?us-ascii?Q?j/bMOhZzZnY1i/xkAPwbuMfILkhUuCDZyOW8Vv/zNSXPSCcoZ6nSpCqpYDM5?=
 =?us-ascii?Q?2smqzjKfSjNGWA6Pe0n739pqDbNz5ClfbjFcFPYXfhkum8a5h7hCZVVE9r91?=
 =?us-ascii?Q?z/kRK9Z/5Ow9F4GRMJNQzfSo26a9ZVXl56/7Ix8TYqHcDY1OOUN53qJXkuEy?=
 =?us-ascii?Q?LZXsqbdgsLvmsDmEB0xWtapP?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XLhHpNonIn3DxWvIXWwsRj+jA0em/PA6m0xY6FwYcbZFnN+DHYpDzoVZzpy1?=
 =?us-ascii?Q?ZjkW2nMS+mQD5V9M729OgB/81RehewlilQYKu98gWcmJEifCPbfvOkC/RTHq?=
 =?us-ascii?Q?y1031r9Ybyi5rbMTXYYDSHyyvYJ/OSVdmwrZNKnKtCtIXxVY5I0Lb6TIZXfH?=
 =?us-ascii?Q?B8v918gWcjwRY3fOVeDWPkl7HKKwpJLOOVXZqm5024WyGrfhi/FY7mHx+Sto?=
 =?us-ascii?Q?hhu1+Q7Q+mMON2WkW5JovP9wKOe0H3Y91MGXgDSwrzYwtpomCIpeeGrdYKpY?=
 =?us-ascii?Q?MloxScI6CAWcPxbEE55gh6wvO4Pp+d0ND8WMQdNzwxKIX86VX4WSlIkC7xgz?=
 =?us-ascii?Q?vOa4VEsguryZfnEmoUX3vYUNNBBPqM8HerzcgFN31MH55w+rxw1OtXglBNJH?=
 =?us-ascii?Q?3h9/MaPcFgaKSzykT9tfB/YK4qCXXUjJysLy/0grIdEsaJPHK2hDHVDSHFVX?=
 =?us-ascii?Q?JyGeT6/rAGrnnVjvpqxk9VoVcjMwo2Ss2xPxIm/Txc5RSRk63WB95tL2DYgU?=
 =?us-ascii?Q?Z3+RB+hOgTt0zTRqpkvvu6smHLXf3dlHFNKwv2g2W9NYeMqyh50fZnVfgHyJ?=
 =?us-ascii?Q?ztYUbuCh1E37Qgc6ik6Kirq86yQgJIuY6uIEWShismIEXKZU5O89l/dXYHOk?=
 =?us-ascii?Q?bjW44DZ1S3b/4Rtx3VtDE8WW7CakTlol7MIJFl4BdsECVqMwGFbd80n6lBPp?=
 =?us-ascii?Q?J9KEt2L85a2z54pkQzBlMtj222wMQwIXf1Q2L3AuBrYWdmS5bkakLwRVVm1z?=
 =?us-ascii?Q?Tsi5I66TUXjxOfE8ewIegH36J0O74xPEkfp9KBHPD09K53F+uq2OgbDy6Zwk?=
 =?us-ascii?Q?pbJmCkItAeztQLSfCvmQQT1DHLuyLXM9ctfr2hyBaiONem/GHYOjDutGjzcE?=
 =?us-ascii?Q?JZr7FxDA3r+tlNWc5CHzUAs45c6EBFsghEdxfcdCQGmYRRFt16tCV/3M/LSA?=
 =?us-ascii?Q?GxBdtdQAmllntkexNGr+9O6A2SzmmTxZj71JCtMtZE3pR4ro/R+6hp8j8ENi?=
 =?us-ascii?Q?h8VnD/0xN2xpWOrhY0I9c3WiIAiXi43QcartjD6OVGzmUlg8pYdHW8qlKMaA?=
 =?us-ascii?Q?/dvgRclhX4CwP0EoS6AFMwTmCZbY9oAJWDDmhJhrwinbkO/ObR1YVsctEIEJ?=
 =?us-ascii?Q?qJj0dFBMQztYmswAgXekNxBOFBLYwWpXfDe2DBRKAKdo7zw1T047H25wstMU?=
 =?us-ascii?Q?sH3ln3l+dZfzunAY/h7Jra6eK+/N+gVKpes+Dv9AWgE9BkgcUC9Ak6315rM?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fedc45-7268-454d-30d7-08dde3f9ca3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 17:06:53.5267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB8956

From: Naman Jain <namjain@linux.microsoft.com> Sent: Sunday, August 24, 202=
5 10:44 AM
>=20
> On 8/24/2025 12:02 PM, kernel test robot wrote:
> > tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> > head:   0f4c93f7eb861acab537dbe94441817a270537bf
> > commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: h=
v: Introduce mshv_vtl driver
> > config: i386-buildonly-randconfig-2003-20250824 (https://download.01.or=
g/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> error: <unknown>:0:0: ran out of registers during register allocation=
 in function 'hv_call_get_vp_registers'
> >>> error: <unknown>:0:0: ran out of registers during register allocation=
 in function 'hv_call_set_vp_registers'
> >>> error: <unknown>:0:0: ran out of registers during register allocation=
 in function 'hv_call_get_partition_property'
> >     3 errors generated.
> >

The other thing that's curious here is that these three functions are in
drivers/hv/mshv_common.c, which is only built on x64 and when
CONFIG_MSHV_ROOT or CONFIG_MSHV_VTL is set. None of these conditions=20
are true for the supplied config file, so why is mshv_common.c being compil=
ed?

Michael

>=20
> +Nathan
>=20
> I can see a bunch of similar warnings previously reported, in different
> functions, but could not find a fix for it, or if this
> is a blocking error:
>=20
> https://lore.kernel.org/all/?q=3Ds%3A%22ran+out+of+registers+during+regis=
ter+allocation%22
>=20
> These all are reported on below 32 bit config, compiled with LLVM:
> i386-buildonly-randconfig-*
>=20
> Found previous comment from Nathan Chancellor, here, which seems to be
> related to this error: https://lore.kernel.org/all/20250507022649.GA19842=
17@ax162/
>=20
> """
> This configuration has CONFIG_MATOM=3Dy, which does not really work well
> with clang for this reason and some others that have come up in the
> past. Given it is likely that nobody will care enough to fix this on the
> LLVM side (since it is 32-bit), we should probably just block using
> MATOM with CC_IS_CLANG, which Arnd and I had talked about at the last
> ClangBuiltLinux meeting.
> """
>=20
> This gives me an impression that we can safely ignore these errors from
> kernel test bot.
> Requesting Nathan to please correct me if I am wrong.
>=20
> Regards,
> Naman

