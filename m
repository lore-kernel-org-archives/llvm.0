Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1013B787;
	Mon,  3 Feb 2025 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575464; cv=fail; b=qGjMBu4D3dAJPiUyK03ujfGcfjfWIa54KrxWUqLlcnUlnR2jNRjsWi3+YrsOfNDJX8y1PAgOgrJO1lKxfBFCfsO7bL+5qUA8R/mkGMNRg5ozWzZKfaey1eTVPq3OYEMMoNiyLvLwaH/i6lVdoDuLZKW4iwh55JLSQavTnbUnPVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575464; c=relaxed/simple;
	bh=IKwYT/F+lrRRFWobhBGcLSumLdcnM4LnLCR6VRS1WZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qvbSrYRpYowKNUY/0S9Px8RMuZ9ofvW3gVJocDxaizdajmUViRs/AnLnP3NxUkUgWyj5BzcvvLIYJzt5+o5gF0JJuCbGLtyskqgMdz6VTrj0Ygn++FE7qz2FtGXRJnT7Gg/kuC3ATglS1ghd3jTak0DwKBEhcO2HHedRKajzb/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ksCwS3ZX; arc=fail smtp.client-ip=40.107.100.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ksCwS3ZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcE+aMMSemNQLpUKxYcDwrgXhtCHDTW84cNBqdtiOefupIclSPkVPSEyVAF9CBUbb562DcMDfiVGnBqSTzYeECc9QfKzRQvFwf/Fb08PSGGI/qg9d4zxEElkGTTWXEPS0JkeymOyuhTY9MUMWSoRssYfXYv1gLt3GuBIWB9cYK17PNew9Ueepc2bh2HGqQbONUUkGEfULcR6utOEvaThy+ZxhM9lRItLsCMLEPj7FS5fFTsBA561KRIuGguptSpJjboZXEVBFhm4Kwgg29VGxUxSQbgEWXkcRU3zKQM4z9Uki9Od6Bkx1x3tk8fnvIWaolNcoiUsvKpzKC8QxK/04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EZlA0mMlbT4SbFVpvET5fwlPXjac+E7WHcCwznhNs0=;
 b=oUnIV+5da85mT50QVYgJNF5pZOiXdJt6KwjnCj9trLGZsILt/+BaUANyw/Fn842S3mvTpk3XYlG3O1uQyE+4iq4OyX8lQgM9a+KIYZtyY/R/xFVjwUJNtANilIzhQuTfC2ps1NUSDmrWCg1IEg0PEuFvNfL3szLp3jDvDqbhBmcifjdLTs3cmX83z2/T3sO/MbLLHincqkhQrtGSHj9zWN9XMyqvmVgP7d712VlcZHQ1WpWM6GLUAOblkyS1MCh23znSziHVGzXEQb5ym0Wa2rZPTSuiggqJ/mHonXL9GDqUybedwWHmLYTGMEw01oiMCcRlMKkenB7TJuCiSDWhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EZlA0mMlbT4SbFVpvET5fwlPXjac+E7WHcCwznhNs0=;
 b=ksCwS3ZXJTuRxZSRVGmSUgDfATzE4oPgVrUoQRpmN2gSzvnQ24C0/pXwWxWY98gD5V3Xxia2mdzBaDgOutrGGis+cOHXKem/Z8rkuLUes4kPfYPsrQDHb34DmOUJiBOlzSddHr1wdw6bhQ19l2AX9TMLfhsRvLvG4/0YoSj0jpprUe/lYxB18HvtInStT4Ee5VuSQNhAeGESKicmmPWnvixtu0TWjPCcpsuzCe2HVee27wAkC47UemDSgquVZzX+qc5f/TIdnAXnbtoZbu5pRaiRdT5Tw+eY+3MjGfNE5WT5AA0/boIm5mpZPnW7cLFJTB1MlZSXp+97gMDyelwqdg==
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 09:37:37 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%5]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 09:37:37 +0000
From: "Sheetal ." <sheetal@nvidia.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>
Subject: RE: [broonie-ci:fileaMnh6H 1/9]
 sound/soc/tegra/tegra_isomgr_bw.c:44:37: warning: variable 'pcm_id' is
 uninitialized when used here
Thread-Topic: [broonie-ci:fileaMnh6H 1/9]
 sound/soc/tegra/tegra_isomgr_bw.c:44:37: warning: variable 'pcm_id' is
 uninitialized when used here
Thread-Index: AQHbdfZ2+txG8Gz2m0CbfEzNk/ObTrM1UhGw
Date: Mon, 3 Feb 2025 09:37:37 +0000
Message-ID:
 <BL3PR12MB647381B755EC4AA0B08C7FC8CAF52@BL3PR12MB6473.namprd12.prod.outlook.com>
References: <202502031243.4biWFdNQ-lkp@intel.com>
In-Reply-To: <202502031243.4biWFdNQ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6473:EE_|SJ0PR12MB6831:EE_
x-ms-office365-filtering-correlation-id: c0cf4326-9757-43ad-d2bc-08dd44366569
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QQL1D0LjiS+CNl/Plv6dmDpmjpGyvghzYWr+YmoLW7Iwk8fXXulEmhBYkCFk?=
 =?us-ascii?Q?+Az1qE6Zfl1WUIlrHCi/gBLl1WGKxZ1Owd0SiBd2slL+wVnQk5ODNNjBmW/+?=
 =?us-ascii?Q?wlvhquchgbmskcfhrRf2OsZdHMTrZH5tLLqhfYl4US3ir/3sscVrZe8oagUu?=
 =?us-ascii?Q?//RoUVCGvvMPK8jDDGZdEKzjIzTueMhaunQIaZ882zCRB3rzzz7mNftnwThg?=
 =?us-ascii?Q?xxprSqaxhMDU8kTp/yI4LElzZfe0q/VR8nMY8BnOEot5QXlIYYDpk8VU4SG2?=
 =?us-ascii?Q?JbJAYm2U32IAoi8oSiGkwv+BcjuO3tpHXjO0eVkytiGKTGvuNl8PTDpkjRoo?=
 =?us-ascii?Q?WgXqvZRx/3pRt61K1KaeSv0Y5GxCYmsz632/ykyYkDU+Tr5ivsLxjk52O/xG?=
 =?us-ascii?Q?WajLvp0kAz0BqVU7C3acdZWIvztZoONJa87fmrFKDz0LFk0osDeJ2lVYpZrG?=
 =?us-ascii?Q?s01d7qH/3utCnwHp7L24uE7+ExbbMlIHwOjWg4BGn1vXid+fOBb9ZefW0toh?=
 =?us-ascii?Q?Jl9pEq6XssezAh0s4qVaKKv+G+PI8WKAgDUmyTekPL656U1vsmSp/SPpIWMN?=
 =?us-ascii?Q?mg99QVj3qDKdXMW7kyg5dIvinSzHYKQKlp7dOkIR4LEgdTDTGgrWePE8zg4G?=
 =?us-ascii?Q?g5/Cq75XnJuXggFageITiM0J50OXrNMIodBStfq+t3jWMbz5/liDMowRJjwY?=
 =?us-ascii?Q?EeegIiQZ/z4SqrJ8AfzOupOih3K3R0Yxqk6gErWmlJ2pJ4JtsGKkJjJn+Vxl?=
 =?us-ascii?Q?nYTmyYPoTWwa8lSVbilxGvtRGPNrlaTqEW8gjE8WJi+7PKevqj48WqyyvjKX?=
 =?us-ascii?Q?pmTMoXgk7uC1+pn5FJaz5I3Jp6YXsuUFWdMYU0MVOn2Mz9QDwgSp6KRuJn6R?=
 =?us-ascii?Q?RHdecnIWNz24/WPU5VRPlygfQ1QUV5AuaKAqEJKXSfGeHjukOHEWh2LJmlMy?=
 =?us-ascii?Q?a85Cys4d2l6nbrKRP2/0NAQgJPNWh+tU/3502hUstWBDtIHwRk8mG5Pc2xEP?=
 =?us-ascii?Q?fFaw/tNXQe4zqlKrxEECFNpvuJsqHbwz0rgNI0cSIsW0+OB3krZENW+lhEDP?=
 =?us-ascii?Q?6VsMlR6UqdijBPQJbT4hOfMT57jZMFsXfl8o7tZTpDhNoNgtuOklMEEZ4sOU?=
 =?us-ascii?Q?c/2/d1iqedYlLIK3C8FWvTk5cJBuq6aU4NcWR0aR5q2+2yXvgkQ6n66r3io3?=
 =?us-ascii?Q?bnHwyoUIGgMyWHfKSqyr1+Cpbakxfj2iqALHcoXG78XrN1J4ZLmxlAtQRty2?=
 =?us-ascii?Q?rnZVwwoho0tYIQuB5clfLTXfSXZUyH6zCDXMNaqLFRM9xwH5PJeQQQD35fKx?=
 =?us-ascii?Q?YVo8qJlSzm0sydheHnLEQ0wISRY2JeIMLOHt6ESSHeXj4nn+bSuLYY8Xz5VR?=
 =?us-ascii?Q?y1na9C0ncKWkPYmfeVWF94cWoSFdSAdfXPAEjOkBUNJFENjRdg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/5FGa+F80pay19odUJ1xrv0iSiWjXD0OIr1D5PKF1WUpJ6O+w9nqONyW6wOv?=
 =?us-ascii?Q?ruYgA6/2QmUuPTSW1ahmpEzckOWWo6THTIktSo7HoAitbWsO4PFC4XR1C/aZ?=
 =?us-ascii?Q?ttbrDbDuCAS3WSMIrgLnF2fD5z9ZHk/8Kij4BB35sVKJtR+uUNBR+0F57LGk?=
 =?us-ascii?Q?QvkG7nSbbv4EICdRGSbVbzrcdzRoKPFQbiHBn5x1+1WySGNDh2EkLCL+D+de?=
 =?us-ascii?Q?Bc5HonT3Ds9Fj2hwS/9xULSVM6nWcRppOc9znSVrAKuZP1v3DuaNK6j1lDR0?=
 =?us-ascii?Q?D53oT7so3uNpARNzIuU/qn65dqY28L0vKf5ADTPdVaG/Tc/3ovRxY6aiJf2i?=
 =?us-ascii?Q?jkQwUzfDzq1ajPu4k2CEXyYQ/hRrj/79sonQ24ls0v6J5BZRkDdUeUUGJM6q?=
 =?us-ascii?Q?NxoRsKU66wVH7j2V8AD9AqO/zcEJD+t0i8ZE7yR5F/TLdQudQK+SFLRkJ336?=
 =?us-ascii?Q?6N6Im/h/qnFaTkbuotXnJuwx5KTfwqZkY7g87WV4FvH9rsGUjG5u9nO15dIw?=
 =?us-ascii?Q?pHg2dP0vyvN/t5XUc8dIOq4eatzdMRIZL76ueLI7XuBG5OGqjDrQGXYlsOEc?=
 =?us-ascii?Q?Gkbtlfk7OltWEvb4iKwE/4V5m9zjf+HJ+5oEFjvLolwvOtp/fradTkO1zGvk?=
 =?us-ascii?Q?abnhtvlXsUDXDRIttL8Ar4fadS/nemRbaVTu7XVBKlnNU+pnGcFN51ib4GHK?=
 =?us-ascii?Q?mlnJveo2uvYT8ZmM4+szm/9JU06mc6o0xWbqmWaLqGJtFaGZ3iRVDaef70lu?=
 =?us-ascii?Q?QynEe8gtB5JGb5jZY2ywa3Vo+QI8+O5F6ok8jBUI/ZIUy/gDmzOQFI1/ghDI?=
 =?us-ascii?Q?7nLxQ4D/9M2vwMnsrusvgW8hDEJdxp9AiMGn88txnhLUDrdmlgUFr5qeo/Av?=
 =?us-ascii?Q?pKaEYISeGGo7gRJz/hTcdDMavmAc6l4C/AG9mAB5HnjSNZ3E9d7yJS7q9pW7?=
 =?us-ascii?Q?J5x441jKzDXdvsMcgrHYD0EVI5kZ9zeVIC7RkTT1plIV9bcQmTGvUteqw11M?=
 =?us-ascii?Q?kLBfEnwLcDpnYwMElAXyXH8ki7JF+ulSr3pUQfXfZoCblXLgZqbHkKp8mDn+?=
 =?us-ascii?Q?z7GYgNrNLzbwK2hUvYISSGtkmAxM4dbCUCgvRsjugBooZjrRe8c9DVCYJBb7?=
 =?us-ascii?Q?FVmfpwLOoer3YyXAzCrP6pnqaW+YWS3uBxGCyEb4TiT3q+Ert0x1VDICyVjc?=
 =?us-ascii?Q?NpEeOqacURI7x2qTiaM9rAuLhcVoJ6S7gJGkXMhmgDE+yXQoSKLVveZOaC2i?=
 =?us-ascii?Q?bgN5EYKn99tEPGmpriiTMKUrJ81L/XZOTE4Z58PzFi8H1qzRnpFi8xYeEfNb?=
 =?us-ascii?Q?8nmX3LOTEQSI47YzfdoYviUXvGL6QoGrqaNGAc3gNWNZi5UzNJmt9g5Jjxqw?=
 =?us-ascii?Q?c22B46q+3iJ7A1jdiYuwILzHEQwcABB0D1Hck/32nsZENUhyFieFwt5iqCm0?=
 =?us-ascii?Q?fCvwALLg9+EYlUuEEQHdHzb5maXJajXn7nc+FcPY8rbwNcz/NPg9pso/3oI8?=
 =?us-ascii?Q?c1zJFE94/uKFLgpcC0T1TOGvUo2eIe/7+f3GAClXDemJfc9ZnQkzizecgUMl?=
 =?us-ascii?Q?SKHbxc42PPQVs6QrTzQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cf4326-9757-43ad-d2bc-08dd44366569
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 09:37:37.6772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEWqmoj1d2wpiYXzfufR6Vig6j6JUh/Zfe7pede5rMVRTPYUg6Sto5RG/R0JPwYZ924wiDcFvyv9jmZeqpnM5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831

Thanks for pointing this, will fix it in the patch next version.

Regards,
Sheetal

-----Original Message-----
From: kernel test robot <lkp@intel.com>=20
Sent: 03 February 2025 10:15
To: Sheetal . <sheetal@nvidia.com>
Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; Mark Brown <brooni=
e@kernel.org>
Subject: [broonie-ci:fileaMnh6H 1/9] sound/soc/tegra/tegra_isomgr_bw.c:44:3=
7: warning: variable 'pcm_id' is uninitialized when used here

External email: Use caution opening links or attachments


tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file=
aMnh6H
head:   500aea53057a952d584cbe1fa461c7adaaa9f655
commit: 0ecef4e6d1d8e542df8eab71d4aa782bb8ae84e9 [1/9] ASoC: tegra: Add int=
erconnect support
config: arm-randconfig-001-20250203 (https://download.01.org/0day-ci/archiv=
e/20250203/202502031243.4biWFdNQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250203/202502031243.4biWFdNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes:=20
| https://lore.kernel.org/oe-kbuild-all/202502031243.4biWFdNQ-lkp@intel.
| com/

All warnings (new ones prefixed by >>):

>> sound/soc/tegra/tegra_isomgr_bw.c:44:37: warning: variable 'pcm_id'=20
>> is uninitialized when used here [-Wuninitialized]
      44 |         if ((adma_isomgr->bw_per_dev[type][pcm_id] && is_running=
) ||
         |                                            ^~~~~~
   sound/soc/tegra/tegra_isomgr_bw.c:25:53: note: initialize the variable '=
pcm_id' to silence this warning
      25 |         u32 type =3D substream->stream, bandwidth =3D 0, pcm_id;
         |                                                            ^
         |                                                             =3D =
0
   1 warning generated.


vim +/pcm_id +44 sound/soc/tegra/tegra_isomgr_bw.c

    16
    17  int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
    18                              struct snd_soc_dai *dai, bool is_runnin=
g)
    19  {
    20          struct device *dev =3D dai->dev;
    21          struct tegra_admaif *admaif =3D snd_soc_dai_get_drvdata(dai=
);
    22          struct tegra_adma_isomgr *adma_isomgr =3D admaif->adma_isom=
gr;
    23          struct snd_pcm_runtime *runtime =3D substream->runtime;
    24          struct snd_pcm *pcm =3D substream->pcm;
    25          u32 type =3D substream->stream, bandwidth =3D 0, pcm_id;
    26          int sample_bytes;
    27
    28          if (!adma_isomgr)
    29                  return 0;
    30
    31          if (!runtime || !pcm)
    32                  return -EINVAL;
    33
    34          if (pcm->device >=3D adma_isomgr->max_pcm_device) {
    35                  dev_err(dev, "%s: PCM device number %d is greater t=
han %d\n", __func__,
    36                          pcm->device, adma_isomgr->max_pcm_device);
    37                  return -EINVAL;
    38          }
    39
    40          /*
    41           * No action if  stream is running and bandwidth is already=
 set or
    42           * stream is not running and bandwidth is already reset
    43           */
  > 44          if ((adma_isomgr->bw_per_dev[type][pcm_id] && is_running) |=
|
    45              (!adma_isomgr->bw_per_dev[type][pcm_id] && !is_running)=
)
    46                  return 0;
    47
    48          if (is_running) {
    49                  sample_bytes =3D snd_pcm_format_width(runtime->form=
at) / 8;
    50                  if (sample_bytes < 0)
    51                          return sample_bytes;
    52
    53                  /* KB/s kilo bytes per sec */
    54                  bandwidth =3D runtime->channels * (runtime->rate / =
1000) *
    55                                  sample_bytes;
    56          }
    57
    58          mutex_lock(&adma_isomgr->mutex);
    59
    60          if (is_running) {
    61                  if (bandwidth + adma_isomgr->current_bandwidth > ad=
ma_isomgr->max_bw)
    62                          bandwidth =3D adma_isomgr->max_bw - adma_is=
omgr->current_bandwidth;
    63
    64                  adma_isomgr->current_bandwidth +=3D bandwidth;
    65          } else {
    66                  adma_isomgr->current_bandwidth -=3D adma_isomgr->bw=
_per_dev[type][pcm_id];
    67          }
    68
    69          mutex_unlock(&adma_isomgr->mutex);
    70
    71          adma_isomgr->bw_per_dev[type][pcm_id] =3D bandwidth;
    72
    73          dev_dbg(dev, "Setting up bandwidth to %d KBps\n", adma_isom=
gr->current_bandwidth);
    74
    75          return icc_set_bw(adma_isomgr->icc_path_handle,
    76                            adma_isomgr->current_bandwidth, adma_isom=
gr->max_bw);
    77  }
    78  EXPORT_SYMBOL(tegra_isomgr_adma_setbw);
    79

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
