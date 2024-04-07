Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DEB1876;
	Sun,  7 Apr 2024 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712475946; cv=fail; b=iK3jVIf7BQ0fa2M6ll3c19kyQQ+VJLMyC7ZeCRMxKNpNTlnbLtEUiIftCoFXL/NjbYRZf7CIhhBNG3wFqv++bRO1eDM7l9ImebFuiD+k84MrKwtTC9coF+gcuQ+TrM67xloL0hL2suWkH5RRYPB3sqGky7gILNmp69lqFtL8O3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712475946; c=relaxed/simple;
	bh=L2NX8RVti6CbaOhdh7W4AM0hmynILq75ttiX1M5zAqg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PQ/B5gJ/9Q7SjsPONo9281+Q8R5PBZbt7kgExgHg8Q7Vyu6LC80kMr7X5ZnVz6HjfxmXT2zoLs491GkA/LvCNO2d7Oqz9J6y7VwjJHgXxzun/Q0wd/a78dFYC/daHA/Ui5tBbZnbt2Qo0j/01JRDWaV8PfEPCOJz+CH9Yc2vQ7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E37O1fP/; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E37O1fP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712475944; x=1744011944;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=L2NX8RVti6CbaOhdh7W4AM0hmynILq75ttiX1M5zAqg=;
  b=E37O1fP/1yyRmvaXLc/c+KmoAt1JRh6ilcY18bpdggY6nEPY9vRzHCF4
   kbBs2xLAa1CUi6mfJjQp1D6lb4w06GUsf1BBBWXhvVaJITph9U6uYF2Xb
   BgOuODX6wbk51vs3xD8Hk9h2/9/pPiSRCJGP/fJAoPXNFJrWFVqXFM2QN
   /k9XqP/8LHokxheMkT3zwFfadAxPDrrQTQhXgQMtExlauas1jjS1uIs9z
   qqNXVHsDTllZagHyz6Z3Ed+mw/JHvLjiSpyY0Kw6iKy0LzPxa2fRNWxeA
   HhE8J0rG1SkJZBBJrX+4wnwrJ0Jzyra4T2Sma7nnp0BB7JRaOV6cFEbtq
   A==;
X-CSE-ConnectionGUID: zd844jppT1GiQJfmIeqYoA==
X-CSE-MsgGUID: 5Rk29ogNQkOMaxTr99xkBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="30251928"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="30251928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 00:45:43 -0700
X-CSE-ConnectionGUID: RAJPWUmKTfuHGnX0ogM8Lg==
X-CSE-MsgGUID: UZv1pl06QUipqum6Nx1TAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="24068701"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Apr 2024 00:45:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Apr 2024 00:45:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Apr 2024 00:45:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Apr 2024 00:45:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 00:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+6QDtnqtwT0rjzPrVbb/FJOdIKYYXcgC8kCeqzTvKzukMxnILia+1KSkd4aJrwvH82QYkv5QMkgZmSItYpVzYifhrYdrXjnP3N/jAH54L5ohnQ3ix+5wyACuL5MAR1Hwu43EigQExhdXMqvty5EdfErc7rsgELEcze4KX0VtjK3v/JgfwUO79PWoiWQbFDZ/FKwSpkm05aszDcDJrjisuFBGt3D6ec6vBe+SwyCVJL6jUy0GYHYQddtdrTDmlZ/pl49n5oH3mhU9DaWZuvlw2R/Qyc4o0udgQ6d94i4wcwJHDPIthMno4IjHwpEUqQwakZ1G7nTOl5Pvdf+e5qGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwBd3xA5nPVBhqOMbvVWWjX8dXmymPwkbVGwJqDJqy0=;
 b=DmNZxFLdLfcdfqb2jD+ILano8t1BniWJkPvEhwzC0YMqpAyLU8MHOdQZuQeo/j79P49FPMGbYp8BKyBFi64Zq9X7VKqsr5YpHBm+/zN9BdvnlcSGFxMMs+W7bE1YQKeFmfPRVvMI4YpqvBn64I9gWlLLTo4AJ+SOrO5G3yJx1/0o76Nvi9gpCU/TyJQJx9KW88nw904HWcXy4g2lp8K5GRFMzi79FPs0i4ECeDU6UAbx/3jf0vEF1G8eotTcgNFEU7RdkQwiwSwKsIkzuWfDFQlE3h90w07JNKmUeA283Njc1SmSseHgCME3/2/MeGxKig9zC2o1EXVtgyDOv8aiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Sun, 7 Apr
 2024 07:45:40 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.019; Sun, 7 Apr 2024
 07:45:40 +0000
Date: Sun, 7 Apr 2024 15:39:01 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Barry Song <21cnbao@gmail.com>
CC: <lkp@intel.com>, <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<v-songbaohua@oppo.com>
Subject: Re: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:16:
 error: fields must have a constant size: 'variable length array in
 structure' extension will never be supported
Message-ID: <ZhJNlSSPNyQLG6iZ@yujie-X299>
References: <20240406224038.5412-1-21cnbao@gmail.com>
 <20240407042247.201412-1-21cnbao@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240407042247.201412-1-21cnbao@gmail.com>
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA1PR11MB6736:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSXDGA1m4Pn9tRtmCK00rUDJQVoQWNv0gZV2HvzDVRV5re/W66NPVLPo9nwFuScj5RZhzwrmoBhEVU+0pM34v72j46i1ypbb4hJiUnNYJCq3AjIlRztaVz1RtW9U9tgGe9eI1L0aUOb9ALO10/vryLjYKuwBz4h3NP68ms+w3hmRJtTvKSCZ20UkMFA6J9svSkEZhtxN+LJhCyb86yGUsIOiC3JQTtr6RHffbYDRXHdJINMRHimn0k+aSWSHjKb6Wy4jUBn8qL23r64mtvQSlq2BY0z+5mjwPV8taLhTFfW9Mnx8kDQIzF3xKGjqHj+iXSrxeUhrkCSDHwlnTel5NwmBjI15H4cxh2McHA6RDHY7fed71jn0C7Dr5UN76kNLLhHJQkIYsXkih9xkU5gT874QFcPY3HfuA4hCa7wERyco802qdlipir1B12wYyseIYdg9AWQfk9SW4yUrUxgxaEY/Fg77DFYykM35tbImaXQ5mDqqsZBH9OADLtSGDRV/37+op65mPXKRUCEiOKFOat1VNbrtDBixdYysDkYNVrLCNnB0zDIMaYfWBlSGcGQgT8IRtW5Aa0GGiR4RNFSlE189zPuwkhsNhR6yRFBipNhng3IChXZaXcsK20SAEj0s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6XbmzvkBfZK82PM/AwzIksPHtQpbbsK4PkislPjuSPJzY0FiLfeWacG8dal?=
 =?us-ascii?Q?vra0o1aDDf5l15lzp3sarSr9FcElrwWy4mG1UMHT5QMUCtBMdR06iGuKntLV?=
 =?us-ascii?Q?nyLIt7vhQ0qn2eY8QC15Gg6kaC/Bbx4awRVmbDEEq8rqIKaP3jGk51vLOVIE?=
 =?us-ascii?Q?1TlkPDI8Fo3rd31S+HKH97vTP7nq+NCnsfjjMrM9Lxnm6yjQBI3LYhRw+y5o?=
 =?us-ascii?Q?2OmQcuVnms9eUGUi8FBY2s2xfDox3J+Qmbs4foDmSKv0ybMjRNFB8+Bpn31X?=
 =?us-ascii?Q?1z5c9RbLoq0gGv+2MiZg3SnJut5zO7xQDmzL0Ww64Q4nSfIxlBaoFDidNaoM?=
 =?us-ascii?Q?K2oFW54TvtRR0Y8yMQS+ln/cVNAEB3ONV6UoYTcLNhH8v/tTM5bPcWTdM/4q?=
 =?us-ascii?Q?vz914vftAzeY2oPBOf373oY2RNVXibfdb9xNifGRptnkVwldaC4AuaZAjb6Q?=
 =?us-ascii?Q?ChtALOYrDqXBMDYUIomuglikgCNv4lUt9v/vn6Kp4uTaWwqe1+bvi1yAy/NP?=
 =?us-ascii?Q?wIZ7h15EGHe+iMTtPfpYQbg36ygcm0/KBrod2Dft9LTFrnJBs0d7AEIJp+AO?=
 =?us-ascii?Q?muaBVN83a53pfG993yOCtO9qe81o5Xf1o84i5gtxETFUB97YwfQBgGPtHoBb?=
 =?us-ascii?Q?ai2EAY+8IDQlCE5dbrEqAqTl9uLKRRV47Wr9ZC6V5cGmdmzcPUN+DhZTbugj?=
 =?us-ascii?Q?bm6a0NHntmc/EmXVXPDyd5Wc/PmFtv9ETAL7KTo5XHBsUp1Bp01/rXHauJM6?=
 =?us-ascii?Q?g83wvYiC9pL4QpTPEohkgO8fY5kzQoIpmvpLoKI6iDrO/5uXBFPIds0dTSzy?=
 =?us-ascii?Q?L71/yyVS9X7FoVxTZDv6wcY76mcpoimSrjwLk5qejfbHhM9yqgSMVWtCl2+8?=
 =?us-ascii?Q?LT7s849RoNuGBcvWpN9g8x8cNxQjVJ+3A8h2n33oFQWipFxxf1S03D6L2uMx?=
 =?us-ascii?Q?aq7pTop0cj9YMqMpyOfVhDQ0DE6z7KF3HFvYQlObMKDl2YMjlslQ/5w6QyKf?=
 =?us-ascii?Q?SZ5UZT3CJRJv7fmPGcZ4iZ1mLT2+uAwDyeWV/yvGI5sVCVVniz/VzPlXWDA7?=
 =?us-ascii?Q?GZk/LO41Z1WprQU1ds3LqQ8NfeMzsdww4PdGGcJcKRxkIome88NlJBCS3AQk?=
 =?us-ascii?Q?8qN8Oqg5qZzl0TVtZ8nxdCHvBCt08CyzQ+5vgFkgkf7JASM/VqtafH7sDZae?=
 =?us-ascii?Q?BWc/mByHdOXN8RHa4CQ7EgvxcbTE1aTpB81sykuNSgmufykcfX4rBXaOfOfV?=
 =?us-ascii?Q?kzkkiKUT7yKPY4S9VcQlDmE0qY21iNb7dn/A9oGMsFhOK8uIoLFI4Og4vMfM?=
 =?us-ascii?Q?d8YJs+e1Bash00hkIIGZI8cBGopRFq4ArEnxkT5vV0e8AjGVkDUYX5W59tWL?=
 =?us-ascii?Q?H2/g3AX9d828UF8x1OUX6FYJQ8iWzSjuykXREhGkp/oeeUJDkU7BT5Qt1lRS?=
 =?us-ascii?Q?qzputLxHGXKQhzV8pQVR67M+i8BY8ZnpkY8XiTHFmK/jwx2khNUKVrMpfxj3?=
 =?us-ascii?Q?qMAP7L+E1yfc8xUA8hga8cyQA4oKMgGh5bpczfTSLpBnW/y4+Ag96QBEoh7m?=
 =?us-ascii?Q?vA8Zw3FtNK2TuIXMef1tSiScXNRmf1LrM6ADi6fI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a4fcbf-6c7a-417f-5679-08dc56d6b878
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2024 07:45:40.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WEJHx80s03i+YRbanxTO46xQHwncTIRG3QxN0jgIZC0+DkyhqYpQYzE3yFoeSTfFBtMob5dwR/1DNsDJYOUDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-OriginatorOrg: intel.com

Hi Barry,

On Sun, Apr 07, 2024 at 04:22:47PM +1200, Barry Song wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> >> head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
> >> commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
> >> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/config)
> >> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/reproduce)
> >> 
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202404061754.n8jmZ6s3-lkp@intel.com/
> >> 
> >> All error/warnings (new ones prefixed by >>):
> >> 
> >>    In file included from arch/powerpc/kernel/asm-offsets.c:19:
> >>    In file included from include/linux/mman.h:5:
> >>    In file included from include/linux/mm.h:1115:
> >>>> include/linux/huge_mm.h:274:22: warning: variable length array used [-Wvla]
> >>      274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
> >          |                             ^~~~~~~~~~~~~
> > 
> > This is amazing. powerpc's PMD_ORDER isn't const. I will
> > move to alloc_percpu instead of using a static array.
> 
> As replied in another thread, can you please test the below patch?
> this is v2 combining the fix and the fix of the fix.

This v2 patch fixes the errors/warnings reported in both this thread
and thread [1].

[1] https://lore.kernel.org/all/202404061627.ungVloow-lkp@intel.com/

Tested-by: Yujie Liu <yujie.liu@intel.com>
 
> From 6f8604a51ff3333be467e2a681a1f1e8a5d41c48 Mon Sep 17 00:00:00 2001
> From: Barry Song <v-songbaohua@oppo.com>
> Date: Sun, 7 Apr 2024 12:23:35 +1200
> Subject: [PATCH v2] mm: fix powerpc build issue
> 
> On powerpc, PMD_ORDER is not a constant variable. We should transition
> to using alloc_percpu instead of a static percpu array.
> 
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  include/linux/huge_mm.h |  9 ++++-----
>  mm/huge_memory.c        | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index c5d33017a4dd..0717063dc5e7 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -271,16 +271,15 @@ enum mthp_stat_item {
>  };
>  
>  struct mthp_stat {
> -	unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
> +	unsigned long stats[0][__MTHP_STAT_COUNT];
>  };
>  
> -DECLARE_PER_CPU(struct mthp_stat, mthp_stats);
> +extern struct mthp_stat __percpu *mthp_stats;
>  
>  static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>  {
> -	if (unlikely(order > PMD_ORDER))
> -		return;
> -	this_cpu_inc(mthp_stats.stats[order][item]);
> +	if (likely(order <= PMD_ORDER))
> +		raw_cpu_ptr(mthp_stats)->stats[order][item]++;
>  }
>  
>  #define transparent_hugepage_use_zero_page()				\
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 5b875f0fc923..7a72760dc1ce 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -526,7 +526,7 @@ static const struct kobj_type thpsize_ktype = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> -DEFINE_PER_CPU(struct mthp_stat, mthp_stats) = {{{0}}};
> +struct mthp_stat __percpu *mthp_stats;
>  
>  static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
>  {
> @@ -534,7 +534,7 @@ static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
>  	int cpu;
>  
>  	for_each_online_cpu(cpu) {
> -		struct mthp_stat *this = &per_cpu(mthp_stats, cpu);
> +		struct mthp_stat *this = per_cpu_ptr(mthp_stats, cpu);
>  
>  		sum += this->stats[order][item];
>  	}
> @@ -636,6 +636,13 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>  		goto remove_hp_group;
>  	}
>  
> +	mthp_stats = __alloc_percpu((PMD_ORDER + 1) * sizeof(mthp_stats->stats[0]),
> +			sizeof(unsigned long));
> +	if (!mthp_stats) {
> +		err = -ENOMEM;
> +		goto remove_hp_group;
> +	}
> +
>  	orders = THP_ORDERS_ALL_ANON;
>  	order = highest_order(orders);
>  	while (orders) {
> @@ -673,6 +680,7 @@ static void __init hugepage_exit_sysfs(struct kobject *hugepage_kobj)
>  	sysfs_remove_group(hugepage_kobj, &khugepaged_attr_group);
>  	sysfs_remove_group(hugepage_kobj, &hugepage_attr_group);
>  	kobject_put(hugepage_kobj);
> +	free_percpu(mthp_stats);
>  }
>  #else
>  static inline int hugepage_init_sysfs(struct kobject **hugepage_kobj)
> -- 
> 2.34.1
> 
> 
> 
