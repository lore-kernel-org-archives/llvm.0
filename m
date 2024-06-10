Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2064.outbound.protection.outlook.com [40.107.114.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44452230F;
	Mon, 10 Jun 2024 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718047915; cv=fail; b=tkma74Oqkx/QSBTeVfFYC2sg/yB2TXXH18ONNU/glX0eEqCgHpI0KIsqK2G4VP3G7bVucX149hmI/eBUAFe9/dEFFb19b93OknIWo1wSvAI98W85jZn/tuitY2iM40RC79CqbtxY43WTKfZ/RkHvaPN4I/IvyvGUYj4TEjAsJTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718047915; c=relaxed/simple;
	bh=Mh6+tj4NKXSMqMZGDwMbB5itRF2Z+d+xThnqOFWnjCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kNmmSosUZygtC8cNpnBnDb6llkUNY0tlmHk+LbCV0wNZamU7W6M2RKVpWS/SkEQaVDG9G8kk3VgkLpPKGOZrP5zNZTVs5bRreCWg0d6mr/nKEjkZ9bLyqoifAc/9jWLI8DYV1fbjpbHgZON00Kvq0S3Zj0iOe397yj892ToAhmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p04tNU4D; arc=fail smtp.client-ip=40.107.114.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p04tNU4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIGsBjy4ciaH5urFuFl0+HEFCX20MnqxoWly9kBo5ATBzKuqYI8sxr6+S87BBOc6AIqfTUAU+z3/+1HuV0aoPR5TXRumlHF8AjJS05xpRSyViQM72KmB0r4faPVgrPmA/i8eCTFhFDa0GhhI81fFBNkEtuDloKpEFDxZKe3PJf3AFNBGXBQ+jk3AQdeDl+kBqH5OpK8eV6iYpHWkRdwKjssOECx/5BVhSlXfDk2AVegivZVbycp0m7tFsWzVLV/03UaVqRT2Kht321GNbuE4bClrYepD7FTvqZBhZhreBWgD7CldoTjkTq5TBoWsRh1xeH8qXDY5MZBmSksBEgdR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5ct3fax7T210pXQ1jVSoLwNUk7qowVRpZ3AQBIsSvY=;
 b=VoN1lB4xaq0ywJvrmg/vk99VmZnFG+JM0NyFxGiu3yt8CFJ8Arx3Ot6RF+rSOiab2RYDYArQOda3aBqQO9MJbun/M9WpqdDdLi6to9aA5+SS/r8Eu7RtC+iivulrjSleMUjoLU1GkWiBIL74WTFrptacj5kGJ1pOxcI7sQ6xzJ8NRocgh5TlUEjOUIt2msHFUUtGG9rjuLI97IOeT8r5i5xnGn/KEnA6h54xOb29QkaUNKvOsLKyhwhxEIOZZN83O/oDCJQiIIWp0kO7NVnXPUy5MHmnJbadpSwRsikQ++fFe8qOXBNIGbTWT8xoAFtaXr4+GkFMQdOrq6Bq6ViBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5ct3fax7T210pXQ1jVSoLwNUk7qowVRpZ3AQBIsSvY=;
 b=p04tNU4DvaxRwesUczpKGliUWm4SQZvudcqcO2oun72spFEiZZYP9VSXcUO9shrCXQEHJENOMAf8hf+H3y8iE789jMPjfg8Eptnpb5E85bt6p9VYIzMnOJW55VOPFkxPnKo6NMyk3R7NqPdu2UnwLJDkhpFRScwbm4DJpd7O4ww=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8246.jpnprd01.prod.outlook.com (2603:1096:400:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:31:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:31:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH RFC v2 3/4] phy: renesas: phy-rcar-gen3-usb2: Control
 VBUSEN selection
Thread-Topic: [PATCH RFC v2 3/4] phy: renesas: phy-rcar-gen3-usb2: Control
 VBUSEN selection
Thread-Index: AQHauM8sOhtcMDvs+E67SUo+2rbSqLHBTwsAgAAX1qA=
Date: Mon, 10 Jun 2024 19:31:46 +0000
Message-ID:
 <TY3PR01MB113465C5088CB389AAE17715886C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240607113745.73934-4-biju.das.jz@bp.renesas.com>
 <202406110117.mk5UR3VZ-lkp@intel.com>
In-Reply-To: <202406110117.mk5UR3VZ-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8246:EE_
x-ms-office365-filtering-correlation-id: 7738c905-3327-4300-e983-08dc8983f7af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bIsU94z7tGU4Y9eH8Ui7wntB4KGaB/lEB5DNNYE4WC9RoWYSjw1XoBNh0VgA?=
 =?us-ascii?Q?8BWGxrAITEgDiKQ3mm3Mh4rR1Imq4vEk/amxeZ3ndp4WQCGwHa+f5Xr+fI06?=
 =?us-ascii?Q?nhT0vMquN4h0uc3WPLj5W/tvYS4uAWRKXcAD8akjWDLnH3jNjjPc/4YI6+eI?=
 =?us-ascii?Q?xoCf1R1fFf5tofopqzCEfouuq4ZxSfKjyPcO58+/wUMK3GQtkCR8YTbaHqMA?=
 =?us-ascii?Q?FQ+iwrOtZeg8l3BOmqyWuXRyxUxbtQ7zbg6utrj6i/pgESjzGsuoO1M0UMsh?=
 =?us-ascii?Q?3H6pBKehBxGf4MncMrIN+4UJ85VsIF2Fk0UL9nb0vrx3jS5exDXfCgH1wfTh?=
 =?us-ascii?Q?XWJmRNTHpu9gqBeVIJIpGA/5G0wvDXeURf+DBGvSzUvA981arBw2dtx7Ggxg?=
 =?us-ascii?Q?QZB7eKp/JsbhVVzF/XPJckWB8AKx5DrA5hKW+JPHufbiw+7Gr9OLx88f4MMH?=
 =?us-ascii?Q?5XUqWkAkodqzEGCMRaAXCRs5DIcbjKiAdSHw3hH+tC+VxfrZ8iAynhdCsyKJ?=
 =?us-ascii?Q?OQX3ZLnluFSJTpELUSRUvXbzjijummbY1m3eg0CpvH3iomW80ZwnuMKaGpgh?=
 =?us-ascii?Q?9lxn8VTjNjQ2sGOIBxT4Mo6hHgEdvPSoO2b5phFJnQVoH4eZYpePB9vOQobB?=
 =?us-ascii?Q?LxQgJUDSH5RWc/YICrZ3a/4iY4AOeCu6ZZGZZm05a9q7ENDJi2TqwqqnXBPs?=
 =?us-ascii?Q?nsr4CPW4T7fZOsQnBCjAXUQKsjCogAGBQVn8H7/gE4JbtjYUDe3JNVNh9+jG?=
 =?us-ascii?Q?Ac6+por9kM5Vxehc++YMO1vazoQHzsgJ8GRBw5bovbVcwDUWB/lnRE+INzVQ?=
 =?us-ascii?Q?dL7ELyEHyKqf7UiK999BPiMg5cX/V6Uuu2Pan66ou3HvZdfKZzSItfkzXNnj?=
 =?us-ascii?Q?0RdtKzrPErK5Ey48H/730Ck433RW6aIiSTWcdqspRCggtKe3hfv4pXplKzbC?=
 =?us-ascii?Q?cftBV+ibkeoRew/LrnjjzakxiyhyYjiwyCRBrN/LlfbHgAivilxxhqn2s2h3?=
 =?us-ascii?Q?VyAzGe+yOeF877wJPC3eVy0be3qvb9i/aMNzd38XY+yjiRekenIPn289HX9w?=
 =?us-ascii?Q?14qFuACZ32G5sg6G30ea2ACQkxuQo8lQpTJMbmAFoSue3ek5dBnUtyU69iR1?=
 =?us-ascii?Q?Xo9Sbjgpz/KtqTctmE2Pr4rhs1Z0rCDx46EQuGH/QeiO8lcRXFD/n2RIWrPL?=
 =?us-ascii?Q?Q3IM331823bT0yeHGPgnqSNfgwsG1UBHqNE4cn8pl+2/7ll+qtqpQR8fcc+/?=
 =?us-ascii?Q?kBrGGHkIMSTjLqppIgQbwBl/DM2Jlxwf+sV0yM91K3fHX2nI0dychi50DX2x?=
 =?us-ascii?Q?IKffOdP3yAul+1o29vzLmRK3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IwZ/fTNMCXOkCz4fKqQ5Z+HKhlLEGpj11Liz3CTpRqi9DfCRqLMJLNvQ9fYM?=
 =?us-ascii?Q?BXSdQ2+I8SFyHBxAS1e7EUhWT2tSkC9/J+Iz9kEN64Fdl3YW7omMKjMYndqA?=
 =?us-ascii?Q?KwA4E5OczueSlYfiL9A/voQCtaJVO90mHwGYdn34sp+lXvXs1FWy0cbyC/lK?=
 =?us-ascii?Q?hGehAzSIAnIR0UPOFD9+9wQrpMbFzt/ESzvSZeu/Z77aHLWqEyO2zmsHI/G/?=
 =?us-ascii?Q?OiDXPKzavjsq0eIH4q1KvVC7NrF5cVyfbO0ksHUJthZB50KDOTpEpG/HNjhG?=
 =?us-ascii?Q?wyUFNwmz9ee4mjXqNZ2whaBJlF+XsJYGZZhCTJbh/bjNycteKeT59eluYhet?=
 =?us-ascii?Q?wIshYYqDtps14L0eGZ4U0ymdDuyEemCJVWpxnuTuoJ/lA8ruUD1bOlqmgK8R?=
 =?us-ascii?Q?To/HpvrzfAF6QJRm5kxriSTrU39Xd4INkai99ZTdX/2VWLp/G/U9+cw9wSeE?=
 =?us-ascii?Q?9ZudQ1L5va4L/87Qnu8dyV+9ewaY6sHM/w0ejJcc1frrJd7iKsqGzrjcissP?=
 =?us-ascii?Q?zOdTSkg3J6X+JoyX7NjSqHKQ2u3dFTEZf1rGLqfvToxhZduJHk2wqRqqLz+O?=
 =?us-ascii?Q?HIMaQW0LkCUhOQW8k2fFHq9IjfG21bZlJcxW1hJED9KsWHE3G6N55mbSApRe?=
 =?us-ascii?Q?vXvW6z43ZUqxrEls5ThdG2+ajqfWeZ7y8eVlRSfKsu1I+2DR/kS2yNN9+dWJ?=
 =?us-ascii?Q?jDwKZsBFl5ZshRBWbgJ6SUoA7WqEkJqNwlKnmUwSn7MV/yQHPR3B0KZpbDpy?=
 =?us-ascii?Q?QBueLg1GnqgyVHTIhnkE2WLxPwp18VOw0u/k7oTerbmeiVIxzbDuE4p5A/9D?=
 =?us-ascii?Q?xrv4O8lBdwvJp7+ebq0Iv0AgBJG2bOD/+2jQY6NopEKhiS6qUFiP6mQZCUve?=
 =?us-ascii?Q?W7q1j5SR6DFbBStg4kZWvlK295HFt87AV9xnxM6+dPA+JnlXoWqmmqCT5Ahn?=
 =?us-ascii?Q?R/k8dlqfZ0fm70XmWW1IClzotWuR04kFDZ2ox5ut9Fdwq7pssT8Ax3mojSzf?=
 =?us-ascii?Q?8pgEafv/YQiS+gXYZobG+RyP1NwOZ8BBBrtAE4k+HVXWecoZ06MEbIhnQQLO?=
 =?us-ascii?Q?gL1TD0MsKCv836NQwxjlTWbDQWYWXWAJhCiQqzatSUBaX/rZJ765DGbxDlZy?=
 =?us-ascii?Q?vMa7Cg5aQiZkFWlfZ6DX57OI09wZgtYyZSZYbSmWY45UY3lHCJPDpahkc3I3?=
 =?us-ascii?Q?ZnHsq/+4qgDx9E8zygO5FGGEQq3zh03SlKbgGRupM6ZeHQ6kKh1qZKOUfWvp?=
 =?us-ascii?Q?wBG1t+7cRnNfms/ztWN970S9XoFsFFWS1/VhIa+cE6KHP1epSwr/QmTr7v/M?=
 =?us-ascii?Q?SgqSFp7QlRGzVmu1V2H6Kadla3qxiRZqWh7R0jFaZSpwF5gHyaEYdIvW/5l5?=
 =?us-ascii?Q?EM/NuX7CQuchrn/rpKB87ziFBi+Xx31NQ5z8SpJIcmoIi4b2fP3GuMeOHRIG?=
 =?us-ascii?Q?vVRVg5tlAX3j6SCr7YEhUQey6gM1aKgaWeISjvQ0TjCWoLEcFXE2dcTWfSI7?=
 =?us-ascii?Q?gXd9w9NnSZJTPKuhQ4zyfRexN+ZpP73d/PHABsn8jfumAcoJtJ64nw/mMF8T?=
 =?us-ascii?Q?RgKlhC4Lc3iLK1EpX5542+/3Zar0DBEvRaM7PoxLr5xquWhv976CmuaKYYT6?=
 =?us-ascii?Q?dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7738c905-3327-4300-e983-08dc8983f7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 19:31:46.8643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qezJ5W8wrCpCxYvW/wp3FH9fo2LVLJRSokbYNO2BxNUL0SoO6AUMiEEdtbwx8sEZYv7vERFXr4TM02pBvMhBXobEq9b96NcV3in7aBdSdlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8246


Hi All,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Monday, June 10, 2024 7:02 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev
> Subject: Re: [PATCH RFC v2 3/4] phy: renesas: phy-rcar-gen3-usb2: Control=
 VBUSEN selection
>=20
> Hi Biju,
>=20
> [This is a private test report for your RFC patch.] kernel test robot not=
iced the following build
> errors:
>=20
> [auto build test ERROR on broonie-regulator/for-next] [also build test ER=
ROR on geert-renesas-
> devel/next linus/master pza/reset/next v6.10-rc3 next-20240607] [If your =
patch is applied to the
> wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-
> scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/reset-ren=
esas-Instantiate-USB-VBUS-
> regulator-device/20240607-234023
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator=
.git for-next
> patch link:    https://lore.kernel.org/r/20240607113745.73934-4-biju.das.=
jz%40bp.renesas.com
> patch subject: [PATCH RFC v2 3/4] phy: renesas: phy-rcar-gen3-usb2: Contr=
ol VBUSEN selection
> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240=
611/202406110117.mk5UR3VZ-
> lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project
> d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240611/202406110117.mk5UR3VZ-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202406110117.mk5UR3VZ-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/fbtft/f=
btft.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-bootrom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-spilib.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-light.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-log.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-loopback.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-power-supply.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-raw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-vibrator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-audio-manager.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-gbphy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-pwm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-sdio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-uart.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-usb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfi=
sh/goldfish_pipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome=
/cros_kunit_proto_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmd=
q-mailbox.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_performance.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_powersave.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_userspace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_d=
dr_perf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/marvell_cn=
10k_ddr_pmu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/=
arm_cspmu_module.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/=
nvidia_cspmu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/=
ampere_cspmu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/cxl_pmu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel=
_th/intel_th_msu_sink.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-app=
le-efuses.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brc=
m_nvram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-b=
oot-env.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mm-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mq-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mn-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mp-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra19=
4-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/ifcvf/ifcv=
f.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdim=
m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_pmem.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_btt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/of_pmem.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_virti=
o.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brc=
m_u-boot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tpl=
ink_safeloader.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_u=
til.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_c=
mdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_fu=
ncs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-=
controller.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-=
arb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_mf624.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_r=
src.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_so=
cket.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-c=
pro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_cha=
r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic=
-adc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-=
ams.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfif=
o_buf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
hub.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
aspeed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
ast-cf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-g=
pio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-qua=
ddec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-d=
ma.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-m=
xs-pcm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-=
qcom-sdw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-=
fb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mboch=
s.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/config=
fs_sample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestrea=
m-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-examp=
le.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-e=
xample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-ex=
ample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject=
-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-ex=
ample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_=
example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretpro=
be_example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemle=
ak-test.o
> >> ERROR: modpost: "regulator_get_regmap" [drivers/phy/renesas/phy-rcar-g=
en3-usb2.ko] undefined!

The error is due to missing +EXPORT_SYMBOL_GPL(regulator_get_regmap); when =
the driver is
build as module.

Currently only one driver is the using this API.

Should I send a patch for fixing this issue?? Please let me know

Cheers,
Biju
