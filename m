Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C57462;
	Wed, 22 Jan 2025 01:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737510138; cv=fail; b=ubVCGH5AgdQBTJHWY6/UyTzScuB1w7J9Sx0XDBrI+7Wu/xW6wa87nfEoPgPa9CsiMJOG6yQ1HP26x1Fw83Hu46V6PmRQYOEpxe7OJ9VE2wLw4iTmC9frh5RTmAb6ADAHdLsMHtWoKd1s6HDGUo5yVwY4LPFIk2Bx3kVG4dEYKk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737510138; c=relaxed/simple;
	bh=PyQG4Zn9lBBTRpyHTGzm2MNPPmSGuNcDi6dQu+cfNDU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=h0bJxE3nr15cHV8Il2PUUNgosEVug8whcVvRVZdXFLn8Be0NPkm7LRz+U3er+jcjThWhutAsQy8olz0WrR6LqLrAnvY6pJ5ug8PQdV9lddJ2Cx5EswYhZ6/cbCkKAtCvO+3IrfNen0dcmYsWhU+5WIBJuXyc8bj1m+2qb/0CpCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TR/irnSn; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TR/irnSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDJkLyemiIFxRXWNeQWNvAwV/GekF4SRrsllmGwJmHIIswJLVWGlxDI+vQ139um8goUfF7h22/HNIcAjWkRDCnTe4Ph0gM47yV1vfXLN4pBjHjRp8nkQK1m+a3BO7rMWhdVf3Ym3IIEglLl1CjaO9Uyme2kBsy/JHOQ2N0hQ8Hl0PkafVEoVbZ/fqetE/52xsQEtshRSsvpVGS/M9VhvbxTZRGj+7Q7vlKxytyyVECMR052j3sSp9+WhgsnAnbD4kHs1UFpZthEA7gEH6kMLAkGYEaYrETj6nzRZlgjp19X8d+ayd6bvbnaNBBQrQk94FBG1ZBASVKv2+sneOsFvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyQG4Zn9lBBTRpyHTGzm2MNPPmSGuNcDi6dQu+cfNDU=;
 b=pfNGk+oPjwT8L4QfCRi01SqcAvodxeCUz/Dx+akOJmNB5WxbKg4y/J6A5OD2FRmiZTwuslrgyW+uGxZFfNrFvLlmS44Wh1ty1SfiIjKu2sAb3XgrQoDemqzLxFC+ztYf/yLpV8Dk7ol1LtQk7ZTIWsEZAIG9dU2VJ7pOW7bK3GVJRH4FQNrGG/mJgC5Qd7oEjY9Hb7OvVVb7IUfzzQrF2+4fwpiVi65oGzJxSppNHfISeYzZF+7TxwGV6wPXisqN1jyJrOEVGK1xNgapuk+QN7a5/2Ayd6ZYkFzNRrergPF64R44AQpSkFabwzsQRtcXxB2LyswwfkU+prCEpcpRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyQG4Zn9lBBTRpyHTGzm2MNPPmSGuNcDi6dQu+cfNDU=;
 b=TR/irnSnZIBKTma/eKr7fuwHSPhRaVUfeOmwkKkXpd9qAbj1lcsWSoVepTKUdmBVBBql+MfKImtXZYckFMhOMse8mbtYDDz+rPl00YSQqCMAi35trawVKA8VWPfiGU98Sst6ZLH2kiNTFxTFBaeBuidgmp5P96opRYQLj5RHzUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7074.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 01:42:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 01:42:12 +0000
Message-ID: <875xm7k4jw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [morimoto:sound-cleanup-2025-01-16-2 7/23] sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this goto statement to its label
In-Reply-To: <20250122012933.GA1058871@ax162>
References: <202501171455.ZDrGYjE5-lkp@intel.com>
	<878qr3k5lo.wl-kuninori.morimoto.gx@renesas.com>
	<20250122012933.GA1058871@ax162>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jan 2025 01:42:11 +0000
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 506fbcd9-e37d-4f50-a8cf-08dd3a85fdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1PpY3MDWoVaK1aEF8Rp9/mQeCeJKqf+C5ahATDVWvO/ZLGpzLiHjSb2A3Ywn?=
 =?us-ascii?Q?bCcbk/gXJkYoA3J8WD2G4jPtvmeBpbkPGzQecras4VfhDd9K7J8iBScGP9KI?=
 =?us-ascii?Q?QLxitU5x5/EE7aLs31cIJ9BkFArR/LmV5LV2lpA20I8nJut8m5BGhPQ/QHT2?=
 =?us-ascii?Q?6dvej2bQFSRRPE9ErGp7SHok2sAHs+0vdLgi6Z7Jrti6GFtxsCfd3nopw/Jm?=
 =?us-ascii?Q?cGmYP71KNMmMocQzG9DMnyoKY+/sM6rmwnG3axoCkXKZt1TdnFWqYCd7XrRI?=
 =?us-ascii?Q?W4i6n5ku0ZGDmy6OrEOPeSTKckPljs2KmjNtsn3MZ161DwuaNHuV1E+ovpCE?=
 =?us-ascii?Q?fJ1mUx56qyK7iyJ/DXO0dNnxtNq4Z7NGOBNI8Tyh+gX7K1uZOWCsS5pv1mpF?=
 =?us-ascii?Q?IVzpr/ZX9oYghZXXi9hUGZTxGwk1I+vcPcP9fw9PzZ0c2r4XY3JmPrDtUFBT?=
 =?us-ascii?Q?ZTcPhZFoP1zl6Jsz7595ZriJVKedwW6OrndOGvTaad22hUOmwM8amx3MfQJ6?=
 =?us-ascii?Q?jAUN+i3UiNUyRfc/51LMcJlHrz9PCt493ry5A83blosA05HR8R3Op+ZziAxu?=
 =?us-ascii?Q?TAuAigFnEDBiqGyYJYx4dd/dpdc1a8bwflKN0jSQQOl8FLzajVNXmoglgKEb?=
 =?us-ascii?Q?QCVWkFUwwKQeTQeolGc7f7aENSCQXV+GKQsuWatr9HfDTLSZH0HwQ5jKeYc8?=
 =?us-ascii?Q?OAhp85lNzb3NIav7CxKINphUr5mm8mxWMPznB7E6P2N3bcnwZuRp8sCnd/b2?=
 =?us-ascii?Q?rLfKoyludW/pHdL4R0lZo8XJLUnz50VZyKznwhfMEFf4ASnW8OJfAEUxqzj9?=
 =?us-ascii?Q?3tfNJOH5e4fLyX2BDdGgN5v2ZChKMAVpNOt9y8/m2svb8eQaXbR946eAQFo1?=
 =?us-ascii?Q?f/zxU6BvasQr3hUuIHtUc1kQVGOwoiRl0KbFcDz18bXxARfhTuYpVDyEf82d?=
 =?us-ascii?Q?MIhDhBVF4niyrQSwGaGsCVpMJrQcj70yk/VDaI6xvrk5aN+5cVk9Oz4hEQ1X?=
 =?us-ascii?Q?EPetT7oonJqh61G8KQZZWWT96GGHNHNX3FjmkNwOCNV7URmB5wU4pjO2IzKn?=
 =?us-ascii?Q?LPSdTIviQAD5VTAtvQBC/lyY2SYrT2fqMFXE5uuINo/tWj6PtBn6v1vTysWZ?=
 =?us-ascii?Q?f1K+23bbR6EpTgSZK9yiK9mGECDuiEoS6AGnMhrhBXDyEH8C9lubpRsnwTW+?=
 =?us-ascii?Q?Km1vH2v5hyyftKE6zM2zwpDn4lkQcrYpkZixTQ9DouLqYkbBcj9QrNeLbmdD?=
 =?us-ascii?Q?dSr2TEtLdI5mScAhQAnfzQOPaIJdBiRxXFNmqixLgrgakG1ccBODsKp5u8qa?=
 =?us-ascii?Q?sDn57e7yH4STbS9OFp/nwA8ffb9PNAdKv2VlV7sTnnBx1mlgTWa5gXKaLUgS?=
 =?us-ascii?Q?H4kS+biyjRM6sbVxp9XNKiBtv59lUMf1ZuLezRrwK7TPApYu6wFFvuwUlxCd?=
 =?us-ascii?Q?sRxHbL+dSaqpGsu8Wh4M6mv5WLjH6era?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LK6ReenobPMwaRuV+RQqBBcgcsKTR8vc8XCrEQWo/nXD9MSwFrdqDuzOs/0h?=
 =?us-ascii?Q?WY2baUVtxqSLrzmcdhrwc7Qdge4z8C0yg5CgmuT9D9fJJffSpd7fO8Po8Vi/?=
 =?us-ascii?Q?Wq6v3DByluwixYANoqYvUJEvGgsUFvSCssdLzNCGzL4noorngTYmWDsnAYV6?=
 =?us-ascii?Q?XA3H3I++aOu8L6tpg6sD21T/v2c7Hkg8nERnYkOGB6Momutq6xUO8F/kBpV4?=
 =?us-ascii?Q?VBEh5+2MmfkfODFSE/G8d/mTFacQEbauikF5FMeZ+ZnhKc3y1l8V4TLRn2md?=
 =?us-ascii?Q?zkuCOQiYbS32lKtKGi+Gz+UbDr4ldqrgmHbDz1t5Fw/tJpPTD3ic/Gv6plUv?=
 =?us-ascii?Q?NvYVIiKSekdyXbDeBlllD0JA6rs8CDN5LJhONj/yqmLZ6sJwd7r1y2ItH0xl?=
 =?us-ascii?Q?bkd1L21lOUZBw/2RNHC+Zc+C9XX3luim1+L53ZibofuKmhRLv4MOvy9Q/HSb?=
 =?us-ascii?Q?HBGHkcjIWs5OBEFkspEn6+NEacuRG/6+Xd+JtqOg2qV4mFP0V+wwI+KahQ9v?=
 =?us-ascii?Q?n/ZiFUc5V3utqlOUco1D1Mr758Oc4Kx6W9PC3mVa41o458U4vfSVVlJROO2u?=
 =?us-ascii?Q?ESce4YyTC2Ib8WReoE0Nq71dKQsgV9sMhaDe42JWl9VRPHpVZN6AwppsKl6l?=
 =?us-ascii?Q?1wis2sBVed3+qECVQZoXZi9/tIHAvxvfFq1ltAW4isAondcRT95SoOwfDLJg?=
 =?us-ascii?Q?ku6P0PRzvUTZbHqLNXXAuSOJ29H8W34IrdLElhjjvPklAgeU1UqdOD0H9zf6?=
 =?us-ascii?Q?3hFErTZSIZM1+hpat+bTO0q0TX6eWdSgyA/q2BjNSGayC1wc0yZlT5+VXF0u?=
 =?us-ascii?Q?EzaLfrY77ilo/n+W0ozPnQeM7sUlfH67Ab2PmSWMsAD7zEXXE1iknaNYWpop?=
 =?us-ascii?Q?2fx0Z2m24fhncIZDGBPwIi7W32FsOuyDutKrkrCbGGR818EHGsRmyefQ2Rmx?=
 =?us-ascii?Q?JvxKmLoVZMYUdOn3vsjZeaS/oytj0v9GEULQulMjfoUSwzIdYKLBSVhUtzGw?=
 =?us-ascii?Q?qm3khW1AIv0Om+oRklC6yQGkvcGVsz8j8v4DwUHCs3azASK/l58ztxcN8XrU?=
 =?us-ascii?Q?KTXxvXTgqUyGZUaEWmu/he1Nn5mcBs7A5uKJItCT9NOkCutFrQca3KR8b1gp?=
 =?us-ascii?Q?+AFu6M/XFrEfE0WhRK8YOzqeFT56ZTYhy2W3swZ0r+nw8BEtRFaexGqIlK2T?=
 =?us-ascii?Q?njwmBpocB569wIZAF7E8Q18gmqUIoSNzg/ryrpvCMWIg94VbQMp3JAoEZUN5?=
 =?us-ascii?Q?3VPejvndOYRgaHPEpwy187AmdPf3tNLYnF9Q5FRcoIoyWdKdIhvDJLIQfAvs?=
 =?us-ascii?Q?ULq5pVebY3ZIK0wT0fF5ZbJyhty6/n0VZ4Cf4CQhEupmCQCKJQNa0ksLaxnB?=
 =?us-ascii?Q?p1LhfBnLe86xKPVL5RDfV42YKGMM67NXfLb1NXLlO9Vk17aHQF4aqiZOfHrQ?=
 =?us-ascii?Q?49BTJzBba2On13M55T90pJGOInbElfZiVQKax5Ax+YtuVuPSNc2Gt+DYxIwM?=
 =?us-ascii?Q?KIvd4SNaR0DeYzJlIvDAJgY5X/oqZ951tg4s9HMrutiwxa7DR969r89QRK6m?=
 =?us-ascii?Q?LD8b3bg9o0n91IV34P+2ZrWytcH1X/f8fG83VBnE1yp3JVvw4OaWEaQXdTuR?=
 =?us-ascii?Q?ADZIEYHwdAWgH2FPbG+OFng=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506fbcd9-e37d-4f50-a8cf-08dd3a85fdd9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 01:42:12.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETKovx3/J0Sf5U5ExZJ/P7jigu/6y1HiRG4SIy7nx2uHRHs5B/H/Wsu3hGniiUhLmGBx6Bb0ozIt5nhM/ogTM1JAsdcJj4Anm481nf6xc1huWbYcrOoV2avFazLOD7rV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7074


Hi Nathan

> Not a part of the kernel test robot team but I help maintain the clang
> build support so I hope I can help.
(snip)
> Odd, this check has been around in clang for some time, I can reproduce
> it with clang-14 using the configuration that the test robot used.

Thank you for helping me !

It was just my environment issue.
I could reproduce it.

Best regards
---
Kuninori Morimoto
