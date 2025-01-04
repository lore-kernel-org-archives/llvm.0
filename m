Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77924136A;
	Sat,  4 Jan 2025 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735960676; cv=fail; b=BWP/rPWOdb/FT9M3YabH2OeJ90dU1Kh28IL8G/+hTbdX7GxhBEcKQsOrtGoflBmhVYl5v8vR48/py+yMHQV8tKxOmF1OFjCgVY/sr8vPFHKMzV1n50RiCWdycg4dJV5YKVZ1BT0ArxkR9LsggF0RxV/lX46MPLVReEpGe/i3rH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735960676; c=relaxed/simple;
	bh=0wkvxtwxxmHWQ3PDZLdjG+zW7oJuD1VAPcXrPXLIjvc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B4M4bFSIantvMFQ2QUtyKhDI82xcppcAXxb+5JMgTD/mOBx2taN7BJEUVBp0UQKmS6oX7LJ29ZX9zRqJTBSE+y1OUPJowU4K1kcuy2x6HF3GBh+pQEXeckaXdqHPyA8E3G5CEoplwUVaPomtRPrseUFJFXAEhGr6f+OemWG9yzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeeP9BTB; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeeP9BTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735960675; x=1767496675;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0wkvxtwxxmHWQ3PDZLdjG+zW7oJuD1VAPcXrPXLIjvc=;
  b=WeeP9BTBQwywNe475JxsbBgSwFo6ItdAxER007HxjuVrrvm19Sa9rtSh
   UX0m9bYBicd09K7IjihMFip32SbIdYX9/WgkSkaQFx3J8dMzZOTCbvBRn
   INLE+WeckRuvpjhZEkgH+0oQyz8ADBqPN+mgF4wZJI/X8Z0NNtWZIG9jh
   6d++xktQ5jMxgKL5MvhknZ/KaTXn07DS+BT30L9Ddb0Scg5FnhhtjYORy
   qMTBwiLp+Pk5vYuj75JscejXbtee14EkSaXRy0AKucphFSDtNIwkNscxv
   Os63grd0rvmmDo479KGp/4XKDj7fkNC6ijcxOkkgZbyTCQcWkCwUnRe/p
   g==;
X-CSE-ConnectionGUID: t9r/spjQSByc3L9i58NMRA==
X-CSE-MsgGUID: sTv5lS2WRkGAnXkgblHLOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47557244"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="47557244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 19:17:54 -0800
X-CSE-ConnectionGUID: cV67wFHkQMmSJYOwlFxDEg==
X-CSE-MsgGUID: x3xb9gEHQi+i/hlhkBECAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106563782"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jan 2025 19:17:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 19:17:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 19:17:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 19:17:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvon4jC9LfGnc5LdUSPqrztvXSFwKyxLfuG3Rr+B8k5jDh0KRjcBjghZDcdrpR4Iah46xFPoigav//UUucaLQSBLHZeBCn9FtA4AkfEeNFdcHS1zOgNFq3Yj+SIaG5Gj8jQ3W7pornTaqdLhr3A6pWZGEA9NNaqN2F/YdEbC2Qbs/P++KXC669skXs9g8IPIDR52uvwyWz0khQSzw9w1BLwmFZ61+BfNKTtclIHqRFp9VF70gVw8uXzzEZFQHlJ6R1gmm2chIWScmj5OAK0+9G/thIpHcGz5aoo0eP1oDwrPxBdVOYbjgB7PZDmrnq5ZffehMa3YZLFb+6RQ/YvdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/qgnttrZZtcl+vPqr812YzvK9f42N1ZSD+sGHuoz8g=;
 b=GqMDfvd+zwJZK6KTmkgN4d1nCzKuInIxew8jaNgCuD0LCxRR4mMmJKELxXXzChAsr1cO1sreevU3Ejdw0z7ZABFJMECb5z6NihYdvrSk2PXTSTJLvDJt+xzz9ooPLGiHcdrQZedB0fpOhhQDlcUB9HB57pEK1gVThXsL99pVG9/Mm8NYiGC/CrhPPL5Y+qLATGZMPdox12EL6flXNz0TOyPS34TDunUuXgFp6flUQgrDJYYIBUoFaYypqNnvvAWjMfGteTxYM0db2XQfli9LCGrh19+CoggKEatqkCdUOdmKCrMVLErlpnsXEDKUPErGK1+QbvCX9HXdu+mqoJuAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sat, 4 Jan
 2025 03:17:20 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.013; Sat, 4 Jan 2025
 03:17:19 +0000
Date: Sat, 4 Jan 2025 11:17:10 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Nathan Chancellor <nathan@kernel.org>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Kees Cook
	<kees@kernel.org>
Subject: Re: ld.lld: error: unknown argument '-dp'
Message-ID: <Z3ioNvUExma6HP3K@rli9-mobl>
References: <202501040821.p93bghd8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501040821.p93bghd8-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 88343ef3-74d1-49f5-f58a-08dd2c6e4c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/yTIfb/0e2kL8jYYb6jkU1amo1TD5/NJ4hPOsddbc2GeLBnQZhAQVmxKj9gL?=
 =?us-ascii?Q?9CYTaJxpEHkLTkZxqN8srNRCpNuDjaU8N7Ia/QOmqLp682Hw9LnP154k7Pt1?=
 =?us-ascii?Q?D5FZuEOsDQdnvAo1zAH6SGTUtjz1LfElyGN+BhOPuQByb8qd5U/LWVsB+Vyl?=
 =?us-ascii?Q?gEhza5BguRET/txQvsyx5zkaS9gLCehEtn+CTUvVBlSwacAuYliovB/2GGN3?=
 =?us-ascii?Q?ti7uw9pBvTxeRXwIBfEifSbHZLqJuUhNW2EOJEamw0Fy8e7momjGPl0A8kF+?=
 =?us-ascii?Q?EW7JD3KL9+vvncNixRjdKrZ2iQsPLw1RVjbUPewATM/OI0C8k82YP61wQfq/?=
 =?us-ascii?Q?dqcIQkeCdNjd/75RR4jF+W7MVFJTkpgf4EC9Gfo+xgOMsinsV4pJJNmagRUE?=
 =?us-ascii?Q?23MLdSGILUFfPDLnfmIw1mqPayubLJPVHKfmizwAqzz4/eje8DXRJ72lnKvl?=
 =?us-ascii?Q?3S8FXdFvxKurvvfrDyc2dEJ7JvOOxuM8lsZIEO6xEkU44c5vnLiqwkNAGIUJ?=
 =?us-ascii?Q?ftNv8NPDkMKvEVYw4XPPYlICtAJeNLLXamIyxCMafFTxVUhxBbCcJZr2dXKx?=
 =?us-ascii?Q?YAnUQS9d4BAKnqaNraXMx1Ero5jLr9tkzqcKfLqO64PE6lcSZ0OWQNfpSob+?=
 =?us-ascii?Q?gOYf/7DqD+idR0PUa86MMl6p3lW8Me449EN8S9wXunD2Kl+LQRPchN/s5omj?=
 =?us-ascii?Q?lVWaC1Wb5HmSPzXS0Ma6m9G4ZcZjNRETJgAGEI+AIXi/11DI4ooXlGF369LG?=
 =?us-ascii?Q?GfSWgpcd659buPijzvbg6tpK02Vwl+cPq6enhZaegbJ+CgQWx7qmcMsxKYoV?=
 =?us-ascii?Q?4BDG77xzTN18I5/18C2iFSR6MoveSrR5dYbLjXxSts/OJGqNjBmimo6W+RCl?=
 =?us-ascii?Q?Q2Irt8EMKsDdfA39r/KQHV+0LeALvAdeufHqlhC+vM80ck796ZVXNY45JIQt?=
 =?us-ascii?Q?f6uuzayWT3ClwT52vTuKomjHiyBu4mLL4Lh4UvXdQwjY2uunDYl+tFjbkQwm?=
 =?us-ascii?Q?U+EOhSTxtgOurjpW/A532ICrf4b3droSkm91UCGLmmXgqqCnodLY2rHWkYcB?=
 =?us-ascii?Q?Y5tziluosqJrMEI2MomN1jyoy9BPobMEdbIMCRMMpNgyNTSTHigilxYGTj3U?=
 =?us-ascii?Q?0DalADKznFfWL5K1DuxOcKXbH4tmg81cAa57Ayfb677hnTst/F52wUwLp+F8?=
 =?us-ascii?Q?jQP5b0g940eaBZWOr4yuiivxWjZoPfbptPCBgeFAo36SlCVeqyG5Z9yFzjJk?=
 =?us-ascii?Q?sjl1xWQGiAvMQOmRVda9lMZVVK9fqr9X/O8uuw4gPDWHBzx6i9jMIWh3897H?=
 =?us-ascii?Q?TWAg9xJMdz96TDlUMjfazc0aYaXt/oxSTPS2HzUOYaLLkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aAUwTGMLxGAInobKyiIwy3hDnAsz0w9viniRyDmv/DtC0desZUdXB6ZsSVjQ?=
 =?us-ascii?Q?cmXd7JWXbgD9DuRXoeHYUm/rB4lUnSx2DfVtjL2X8AO0U3wVgFS1g2187Ito?=
 =?us-ascii?Q?P7w5l6eOfeybieXBgmtTLqjVUlUkeN4FIq0wBZmvqRxd8JoWPAM3bm/UH1qO?=
 =?us-ascii?Q?Y0IswssyWYfrVUTkRJNHLL4uXqiMevEDrwUePtfPhFiASjOmErrZj+Zv08la?=
 =?us-ascii?Q?9yzP9GP4fB6lfRR76O+jkhdpGme2TSeVO2KqGvFoHNYXiUOIiSa8MPP33i+V?=
 =?us-ascii?Q?Gwp00Any8AUxHKSugLI/wV6kZh/frdnW9Nl94HJ67LN6hnLhl3NyL00F1Pfw?=
 =?us-ascii?Q?tMePJRPuPZfoTDDr0mjpM7bdObiXlmVULYKe9vR/zYHyYnEI+d7lCxWKRaBh?=
 =?us-ascii?Q?5ySSZuE1vkQJSXVfqS37v7+sFaMZ3EhcKBd8mHYCW2MV3U90UBSqPkk77x0+?=
 =?us-ascii?Q?fZLPajdwbwVBe9XmT0ySlbFxlJHWFHHdxdCyb1ehhqv2/pTCv97Veb4POGht?=
 =?us-ascii?Q?t+MMYdLAGE7U8jVCqbxFQ5dKOT0ly3YKqupXDWfLvgzkmYjGKBoeGbT74MBN?=
 =?us-ascii?Q?eQVVwL+DuXSjIvshMbH7iPSvEIdjbyuqLKoxvjP1yeNjnDrREp7jjgARDVb6?=
 =?us-ascii?Q?/gNnTgRGYqcMPR7g+lIwncBUXAAl/SZw6lrjQeVRIat4Z74hNUZj1EE2Ki74?=
 =?us-ascii?Q?m4y9vy42U7HhSbXvIDSn9cZh1qlA6FTBeuos7Zyk4W8DyuT0+u01YxIlbahp?=
 =?us-ascii?Q?eI+226vAASf+4eb6dG9yhU//n0t3oAf1fGU/hOlAwms7vo82rPE+Q/s9UROx?=
 =?us-ascii?Q?RsLjSI4NmzeLPJkjtlGMPkcbl5aq0u3D72vlawsZrapm1JO2baPLHVfYcuW4?=
 =?us-ascii?Q?2G9NXC74tmsqO1wX23hMiwXLY9NPF5HTrJZcfK75zkveQeVxdtCvDc9T1e3a?=
 =?us-ascii?Q?EPrDQc94sjKtAEMp5U0WfB1GdzS7BvJqeRa+aCOMrZ+jmKkS/CaAdTQuojGs?=
 =?us-ascii?Q?sTU4vW1lwYVBKW472tpq5AEqM2cgYFYM5uGCZ8y8HUjyJH9IEw/cSVBoOL3O?=
 =?us-ascii?Q?Y/l1DvwdDTOBL7Buvg3u5ANWIaoRm6/mczF1yqSm35VlhAMJL4XjIUpfA0WC?=
 =?us-ascii?Q?6syxf2ZcEPbPIzOcWknP21mx82XBw3sDqVB6phfEucC1eWbU2pqIinGHWoKM?=
 =?us-ascii?Q?ST4zRW/cjlgmZjqRWoEGs7RfFr8OhovOmtaChZSOcxDXvMU1WPTHvHif4Pdo?=
 =?us-ascii?Q?Gt29DfLu7QcUbfXYWNZsZH+vbn1nPHDuZkNHvmppq7Hz5k8Ruk8aqodMC21y?=
 =?us-ascii?Q?oJOMGr6GdgZZzye3HZr6dlZ9wbiaaffKTQSRCPGcJiJBmM3ydwi8QLisAdmN?=
 =?us-ascii?Q?ySL4kh/g1xT7mhzM4yjakni2c34YipcIqHWbvOna7vrkx1wpiUUS8DSt1Hgk?=
 =?us-ascii?Q?H2rjil/O55iyne/tWU9JD1UCf3M1D9z3uOfUy5M1UmTEu7uwhDQZEqH3+BKf?=
 =?us-ascii?Q?iSLTYP1hiKAlNttweZI+nWqXWlHfJyKlQcjP3wbv4hWq+Arg3DD3saGMwDCp?=
 =?us-ascii?Q?pjX+sG01z9Lh1fBD2UZWkdryD89c+3xm2Cct/04v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88343ef3-74d1-49f5-f58a-08dd2c6e4c37
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 03:17:19.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZOqbER0hpa/ayIs7GHjwD2OAJPocoqSwWxd/P6awOpUmKi1KIrRbM7Z3TVqXiIa2VnmcbVLKlOfPuhq9hsqdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
X-OriginatorOrg: intel.com

On Sat, Jan 04, 2025 at 09:01:35AM +0800, kernel test robot wrote:
> Hi Nathan,
> 
> FYI, the error/warning still remains.

Sorry, kindly ignore this report that the commit is not the actual cause of
the issue.

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> commit: dd3a7ee91e0ce0b03d22e974a79e8247cc99959b hardening: Adjust dependencies in selection of MODVERSIONS
> date:   3 months ago
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250104/202501040821.p93bghd8-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ed572f2003275da8e06a634b4d6658b7921e8334)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040821.p93bghd8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501040821.p93bghd8-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: unknown argument '-dp'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
