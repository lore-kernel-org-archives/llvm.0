Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2CB224AE6;
	Tue, 26 Aug 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191047; cv=fail; b=Gicyv3Yo4DmUn/mbFIbYmVVIY6TJECXEU9aeOoMd5+I1wKIejZP6hrpAI6oorb0yMuDirfiAE5w5LYtsE7rn0edMWvuMlf7/7T59SE9N5dRgTfQDa6GjLxyY3iNhwCy9NdKGx3jxSLkBvCxTRcUm65oG+df0X/rS4AJkjKlZltM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191047; c=relaxed/simple;
	bh=yM0oHQnUeL2s/BNKwJ4z/oAHe3AIFttDjMtGzTnkH4w=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XwhAE0oIz3OsbzBHpCV5SkKQXZwLvE891x50H9k/8HoMpFjthZblYT9K/sqCu4HzKn0p5bvAfwczp7CoPzePw7exHdIDOUVmaDkLAxh8Hx+gaSZ6bLaC5jMiVvo8OEEH69kmqOvFXt58/87+qzW6+bYtHT5IrwiEXJX+rK6U2ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTjEA6Sn; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTjEA6Sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756191042; x=1787727042;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yM0oHQnUeL2s/BNKwJ4z/oAHe3AIFttDjMtGzTnkH4w=;
  b=QTjEA6SnLw20TNiqgKV90x//i3A4p8CURHA4z25E4ZhHxsCX/TyRIkiz
   jPCHlVATZ4zi0akBgdMyY3mK19F0xnVa/MHNrKst3g2wLq+eLBR5H5FvX
   fh6KFihU1aoWuu7C2RcNCdNlIJM4lDIBYk76NZUTEFg5eiw/YVONcPuCZ
   oYoQGF1LR2xjZbJYw53OYPwIP65Fj7LKR7p/NmuS04KzU63xuXhVtFBcw
   evWqJIkiGJAqe0HLmELHzsHPSjVf8DgGdCaLBsoJUuMGY5sumiWJynHwV
   D7QWNifbFzPlVkdK0JHI5dwgCV3pV6axWtny6qbTBxBEf/SqsLjVCI23g
   g==;
X-CSE-ConnectionGUID: 6FK2rabxRemcCAPJ5S7tqQ==
X-CSE-MsgGUID: NkV+sg/GRb2oQ7SYn7Ub1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69127880"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69127880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 23:50:39 -0700
X-CSE-ConnectionGUID: WmB9Vq1AReeRp7EzHRPPeg==
X-CSE-MsgGUID: QZOEL+v7QH+K1hNvO7AHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169101099"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 23:50:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 23:50:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 23:50:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.82)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 23:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgVSs4IdmVTn5fIqsOFvj5ByFrikXnw61Ke5Geg2qPGg78WjlyN12SUuu65PwXiYqkWT8Kodp8PA57e8kOCosIU/xdDjWvo76dE/MF73WcyfBdrvmUaENzJO6zcspApI6qpaGZ7+qoXy9jLLdL2fU5aDBhcvKj9CDagmvsmqylJb26GgwMfjlsbk11omz8zBh4VOAwizTgiaW00gHuFgMUrBQstQEOtoDYpbVS8XrvewCtCMdAKnCjewTnsImsRDIBIJBV4F7jZPAGhaKivkXqeXQDRvY9HC6TlW/OdNkNj+KXlmv2hWvXYOo+oVvBCHEfKIYQHSxAxyK5xZDi9r7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd4vvIq+yjMlmCE3KOh23CIT3cQOBcozrDrsa54IcpQ=;
 b=bGhlBPKJqYsBJA3NEgSdCzj9NwuE0LhGtdJ5x+DZ+V5RDAASKHTXQ+JOa6VfX1cXhAlVfwvqNqTpoxGho42TbT6Zw0xepohI6xoGVmnsjiewTzBfzH4JtZ/KVIjfXqyZMMXJtQJF+7Tr/cHdkG2nvKM1zDsGnK4QG/2O+4jc/L+ERy1bHcsboRK8Y+P72MvOwyapoYp2MtYXPN8yiqz7bdDWN36HwmSqzgK7nQhR/S0c1JUwqJCuiqyMm8KRKp2c4Vg1dzx0LEQa4ihAsBTzAv/T8pmoiM+A21o5PotzNdNVKDqOXYGAtBIQSe68WzyzuX17BoQSxNp8hogETxkbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9)
 by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:50:36 +0000
Received: from SJ0PR11MB5680.namprd11.prod.outlook.com
 ([fe80::7c8f:9ea5:5982:1a5b]) by SJ0PR11MB5680.namprd11.prod.outlook.com
 ([fe80::7c8f:9ea5:5982:1a5b%6]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:50:35 +0000
Date: Tue, 26 Aug 2025 14:50:26 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Naman Jain <namjain@linux.microsoft.com>, kernel test robot
	<lkp@intel.com>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	"Wei Liu" <wei.liu@kernel.org>, Roman Kisel <romank@linux.microsoft.com>,
	"Saurabh Sengar" <ssengar@linux.microsoft.com>, Alok Tiwari
	<alok.a.tiwari@oracle.com>, Nuno Das Neves
	<nunodasneves@linux.microsoft.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
Message-ID: <aK1ZMtGoLnHccaus@rli9-mobl>
References: <202508240828.pVaUV45D-lkp@intel.com>
 <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
 <20250825170051.GB2719297@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250825170051.GB2719297@ax162>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5680:EE_|DM3PPF6C1A2BDF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb6a40e-9abf-4f64-9df1-08dde46cdbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X8hahmtErDag/C07BGw3UM7R4wK6rh+VcDsReeSeNcLkCNxHMseMT28jQWvW?=
 =?us-ascii?Q?qk6z9KLLkiqSvkzDtJgRAtQfvCxnaHkWpboSp6yOWlQDulH6jP0431xNQENx?=
 =?us-ascii?Q?nkqI6uGsgubsZh5o31ZvSFMVN9JxzEbRtkis25EZEYaOqVDF+zhi3tTOOT9Z?=
 =?us-ascii?Q?iKoOrag3aWw+NLYKfFyanF4DhEv6mwislO6Jy9ZlWPT0O0KdJ2ZXGtA+TMws?=
 =?us-ascii?Q?An3QE7WhK5HTluTIDSKta42Hos1dP2eQELOunMUHT8jgm8PiFa5fH5gqwoD4?=
 =?us-ascii?Q?c8Jg7oFYxWLkmOE2fn4uRV7aAlCQ7DEGfaS+PyYc9wBu1Hmvijy5SwcnPd5l?=
 =?us-ascii?Q?LUiX1av/AX58nuOoSnTxPI0U9xKokJgRGxNYkcPKf21UaBFKB2DPd4T6MEFJ?=
 =?us-ascii?Q?ZdiGRmn1EE5uIloF/jR+NEn5kYtEaI7icFuP9A+3YvnpupQpU/l7xUaLbFpd?=
 =?us-ascii?Q?c2+2VxeBdhuTrr2z9Sgw7X/9twuJ3DhjIMdyEt+zaiLJKExWzdCd/dboeQGc?=
 =?us-ascii?Q?mGYJBPcp1YyYmGpNSDZxEXiY+mUdejO8pVPmm7zEep2qzZsuWP8rOG+0W3r/?=
 =?us-ascii?Q?D6BKu9wGMoF3LF2a/Vg2HEAJR8X3d93kV7I/H0oSepzg6CaklUK7BG6hwTlS?=
 =?us-ascii?Q?1CG/2glR6rMSLbdaa8orcjuBBTBtWw5EGWRCSoy+jn68B6/AlozURYdIDw7v?=
 =?us-ascii?Q?NAoesW5TBr2vdpIXlWS3n9CJ795dKQAPGE7965jtpYDBjQ8cD2PR0k3iRGWI?=
 =?us-ascii?Q?IjGjTK2rifLTnWcBMWpc9DSD0J4eMBYe+yzsyBhgilK1Ssy5UsrVXAeXbWsH?=
 =?us-ascii?Q?pDyos6PLsATItOuAKnaJKc9tjGan4tOaaGHvFhleHz4Q1lPGUFXmLy06cfHm?=
 =?us-ascii?Q?lrsVlGc4+XQJGgWfzkTSBYpH0yFdfQVgZrrkjphi2aAdBKTUyyjzmElNZD8+?=
 =?us-ascii?Q?smFoZW8A6mAIe+XY4L5p6OOJr2Vc9eLuF6uLxtLrVGCBktRHm10kphvMDQim?=
 =?us-ascii?Q?tXYs/wxwP5G6k5j0zouZWftSY32B3NDT4lOqDDvtIgwnuVr6pByAGp/85toH?=
 =?us-ascii?Q?WjcC/2FjfJTkh4EpnpYlfd1K67CSfwGYujWqfl3+y6xXDFxW5yENg+C+9tV0?=
 =?us-ascii?Q?0sRxqfOMf0AVqlIxQlqIc/ujDCR8Jv052ANnXLQ68gImTfwaP7yN7p82wjDa?=
 =?us-ascii?Q?Uiul3fVDp5L9W5cUryUFMYGCvRV79aNwLzTL07ffeGdcsFu9Gi97Uv8BwGA5?=
 =?us-ascii?Q?X/rKsC1yrVIqyHWfmBPhEbTqR2NuHlRp1V9LthJoOIjJ+LjLc3S5YWBYSdat?=
 =?us-ascii?Q?nrQIwn23eWclDyVLBSZ5w1z9/M2gT+8DVMih6fKUx3pRlEe4RzQxq1flxj1W?=
 =?us-ascii?Q?D5UW+RZed4EwpKlqeG3tPHi8e0Xx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5680.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLImpxuMTRDbrcnghjcpoMwzAYe4nP9wfjlxTZ4ZS8aruIEgmGzXCdR7IKw1?=
 =?us-ascii?Q?kfgynvGxQWIqxpNeN0It5aUMGVf71KOWhtxV7Zhu3DitBoWMdPHMA8bzTWjc?=
 =?us-ascii?Q?x6pUSBXVJmhlt8Da5OqYtRRV1O7D/sP9HJe/6caTxSj3B+PpAkjvSXdSmGme?=
 =?us-ascii?Q?EKhQm53B4KkiFA5Anvhx6RyKw/a/A6alTyySMZz3oCjNWH0AMbnFlqqjZFTJ?=
 =?us-ascii?Q?A5QjmbgKCyQ3ijQYhuLx7M7dYBOD+LqCYIm/vQug7CbLKdh0upAc/GtbmUXr?=
 =?us-ascii?Q?q64oJ/5krCxOSPlUG2vUOINdc3jPG19GXI7ACXwEVpTJqu4llOFMGbGRoIhB?=
 =?us-ascii?Q?TmFGOmEbuxgIKOp9NH7gmGWJFKB+Ul2Y3Zzqdoj+G0qxmuT4cWPm9CoqFZiC?=
 =?us-ascii?Q?DCEavXL+JIHpmeRM8i+7C2329vaIMB8xmbr1233F2NMBq6YLLf3J8hSIRLkE?=
 =?us-ascii?Q?9LSNRYL6GSK8C05ldTOc2ayG8jArSPJNlGZlAU6mtMJRhiEddOP644MRWLnw?=
 =?us-ascii?Q?kubBwli+YPgnEZXTpzBAMpfoo9iV1c9QET8DrB6c1FkDl4vkWihCYIQDgjWj?=
 =?us-ascii?Q?rSIRo4fWPFBDiDPIfcHsRrgSznqN2CuZOdyGRWNC6dHnNxWMrpVMH5qTaK89?=
 =?us-ascii?Q?Tg8s3Sww888IcPl2tF1+/3Aho3tIJJNy1y/pDwQWHK0KiRkKZRSmqD2lzT17?=
 =?us-ascii?Q?3pAUgwxZOznN9DjLeggX0+oLenqe22RpZite7mf3nsc2AbiscEUcs9V4wyJL?=
 =?us-ascii?Q?YkRqep7g6nB7l43qdjeoBqxIDV91/G5Dm5C9CqBp911VB9b6NOtrsgdSyDdW?=
 =?us-ascii?Q?9+AZerNyrM0QPcrHydfdEHugi+Wd4DPAIUXojS1dPTHyoPfOd7SjhIgECf5o?=
 =?us-ascii?Q?Z3wU8TekG5y0Ms4Z0BdOqg/tO6TGnSWguBxdiX4aKCT9LqhPhnDUCNgjTRlt?=
 =?us-ascii?Q?jnz3QkeSG1Lbhd00B8mx8NstdD0cNeyesyQ/eVhsw6NpSbJAj5EmMHx0bVJg?=
 =?us-ascii?Q?rBarKJ+IPuKhLNfqmt7LvU5HVru8glLz8OyH+N1pgNIy9GUbhOUIl8ft7A1b?=
 =?us-ascii?Q?fU89E/CCE9uqy6yVAQd3j1gFI6tEQ3L3d47K/MDn7ysH8dUonJo0tx/VUXmF?=
 =?us-ascii?Q?qyV/gmH/mvUutAeGtBEQMdlvI3iwXFGzQlfACcircvR6GZklaT+ST59sB2CP?=
 =?us-ascii?Q?OZicUEc2rLB/WIAAc254b+2rOSQu6BJfZ3uFdzJEqZebcukpFjnRmz0XDGfF?=
 =?us-ascii?Q?iq0lWuZ1+1p480gFK9ouVsCP1m9LPt9w4mo3aB/oAdfbvMBA+oZsl5NcZmZl?=
 =?us-ascii?Q?xSg2QgthZSPLhd7RH/VVBoIrsOw/j2FXG2VNqLcHpaqLdERLjq37YZemtdnV?=
 =?us-ascii?Q?4G0/MGz+fQKIX2jmBI/xuSwytzaQzIhLKv7iWizmOaVcxjwE0EwqxpTJ3au9?=
 =?us-ascii?Q?riSJM1YKClsLLW9GKeNogqhx9xDF+q0xHFuhDZgmIusfYF45pcpXL1W5NRRw?=
 =?us-ascii?Q?p/N8rLdhKNfmSKM2c8mzpnQiVRuIHqyKeArx1GH/HRuM8fVpV6m2ojvRu9Ap?=
 =?us-ascii?Q?BDmnR5gnyiqfOqf8dfOqOThDXMFSqKKdX/tUI3r8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb6a40e-9abf-4f64-9df1-08dde46cdbcc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5680.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:50:35.4784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STXBo+r6ILI5QrSAyWOAiW/xQTYlzw/V8XlA+Zna4viFhxHKxpCs4Y3mmAX0YVTE0g8RSU0CnHm42ETpIieQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
X-OriginatorOrg: intel.com

On Mon, Aug 25, 2025 at 10:00:51AM -0700, Nathan Chancellor wrote:
> Hi Naman,
> 
> On Sun, Aug 24, 2025 at 11:13:51PM +0530, Naman Jain wrote:
> > 
> > 
> > On 8/24/2025 12:02 PM, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   0f4c93f7eb861acab537dbe94441817a270537bf
> > > commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: hv: Introduce mshv_vtl driver
> > > config: i386-buildonly-randconfig-2003-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
> > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > > > error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_vp_registers'
> > > > > error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_set_vp_registers'
> > > > > error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_partition_property'
> > >     3 errors generated.
> > > 
> > 
> > +Nathan
> > 
> > I can see a bunch of similar warnings previously reported, in different
> > functions, but could not find a fix for it, or if this
> > is a blocking error:
> > 
> > https://lore.kernel.org/all/?q=s%3A%22ran+out+of+registers+during+register+allocation%22
> > 
> > These all are reported on below 32 bit config, compiled with LLVM:
> > i386-buildonly-randconfig-*
> > 
> > Found previous comment from Nathan Chancellor, here, which seems to be
> > related to this error:
> > https://lore.kernel.org/all/20250507022649.GA1984217@ax162/
> > 
> > """
> > This configuration has CONFIG_MATOM=y, which does not really work well
> > with clang for this reason and some others that have come up in the
> > past. Given it is likely that nobody will care enough to fix this on the
> > LLVM side (since it is 32-bit), we should probably just block using
> > MATOM with CC_IS_CLANG, which Arnd and I had talked about at the last
> > ClangBuiltLinux meeting.
> > """
> > 
> > This gives me an impression that we can safely ignore these errors from
> > kernel test bot.
> > Requesting Nathan to please correct me if I am wrong.
> 
> Yes, this is all correct. I will try to pursue an actual kernel side fix
> for this in Kconfig but I think the Intel folks can also start ignoring
> these reports for ARCH=i386 and CONFIG_MATOM so that they do not get
> sent to other kernel developers for random changes.

Got it, thanks Nathan, we will ignore these issues to avoid further reports.

> 
> Cheers,
> Nathan
> 
