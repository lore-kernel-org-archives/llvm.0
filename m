Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA526E71E;
	Sun, 23 Aug 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491425; cv=fail; b=oabQFoG5mb0bDJJnbfcgn0k4szXhSetGylTjgEgRtcI/2MF/wOW2C5hWILwOYjDWeeCNPtJDbJzMso70J/Yp2dJYbPSRh41avHFbczUBI0ZIlt/Hdtrn3gHt+2zCg64OVOlcPDXbbsTfuvxxTgbrzk2F/sVtWuFu994fYUZlxkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491425; c=relaxed/simple;
	bh=buWeOnDAjAbcot4xR0dhWSyqZXplZoESgZ3Vtl6z50c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EzklSeChaBOyYDlrbwIuF5I5Ixf/X7WdTYSLeeUWtOUlMYGdnrLyAjeqsWJLQLv9n+f5iJSi16dAoK6z+FV0+eBhCedcY8EXFgOpXQdDxkrmRBEff+E6hsE+nL0ypdo1D1cRIYChrEy8DXhbYRnOpq31na1cfn1Ghtdi/GUptpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkOeHvYd; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkOeHvYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491423; x=1819027423;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=buWeOnDAjAbcot4xR0dhWSyqZXplZoESgZ3Vtl6z50c=;
  b=KkOeHvYd9ZiUEwx2PAVwMZzUbg1ADntLRNkTVgtHMIaBYILyUOqyHJeo
   g0dMcd/tkZMUBs1QsIwkVqxaatSKn/O7iRtA8fqXicgOAvunqow0cyAQg
   GKm1GmHQlT56ZlG06ctP+cxxkjt6sx4wVOEIo253xgLnZSB9ESWkS5EIa
   kAcMkGBeGGzSLQKyoNwM5sH6Iw3uj6rzFYxsAwDW5HNrbeteu0GpwZ6/Y
   mB118YFHu0AXH+1Hw611bpw/JjWHAACaPaRP181ZEFBRoFOUa2O3Nn9rd
   Y9iAprH0wlanxGjmpRmh8k+pdPq81A9lvx+YN/xCmxNQm+p1YuGFjHhuL
   g==;
X-CSE-ConnectionGUID: 0Nf+OLkkS3SaDBQfqDt+Ow==
X-CSE-MsgGUID: +n7YreyXQKCib0hVVXIG9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88021295"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88021295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:23:43 -0700
X-CSE-ConnectionGUID: CcAjTjA9RrqKKaR3mbnjjA==
X-CSE-MsgGUID: Qk9kpoXUSsixD2i5dI4Jzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266246370"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:23:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:23:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:23:42 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ef0+B6zz3fN3tJX3hbWZcLQY4bRPl6F2yVYGpWQSle2F8YC6dPZm3Va6fBgxVPsUzsIRv+c/pokOd/lkK94YDO4OAvCn4OOoGWIdi54HoJH7uqz2ImP3LLmUdOU0TLDEoYZG/ph9veGYdyXtn3WgauwT28a+vNPIfCBicppX08DCJ2HkoNjEABCv26yLwhrfD2/9M/2Bpi90LXPtIjmMEOFrYnSZAvkiNv8FYPotWZmQ25SJeA5Ulvb3q0LBIRttCwijU5reTvQiKIc9GnwzqseeoN4/OEdX/6z2szzdRQb8f4S592O9ylELbOf/qO943Pc84RETicJ3qaSNgMDwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P750k92FDOPEiLyfEYlVAZYh/4kBDhf7cRJUBSouW3Q=;
 b=oZ2UBrrm/WUiFoO65V9uDDGLqYwzm2c2SIsgHQw4JoaViwify8B64qd+dgPIHziRW9AOVVErxo0NSMqgGO4J+6spg+XbE78v9Q+7tWMVL/WHmRtY1uq2H2Gf3pFrHEs+jT8XfOEXSEs2mhZTO31GlED+4UL7/YJtqgPKpqaAavDHHwPfw1MnZMBYtlH6oftRr6iTv3kBlwMwhOFXRXj24/QO4Jnbsx5OTRDuuKpgDEHSbowUaHUP7qZezWt9mdKMkp39K80wJTP2tOKCsSUrjSAK7qFT6dL267L5ewRQuBtpNsM7ExC0hor4R3QCj14gEzVZTsJqWWb4LCkQkPjQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 13:23:40 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:23:39 +0000
Date: Sun, 23 Aug 2026 21:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Iliopoulos <ailiop@suse.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory
 Management List" <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kernel/profile: remove setup_profiling_timer
Message-ID: <202608231532.dENn2OSP-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260821091744.91496-1-ailiop@suse.com>
X-ClientProxiedBy: KU0P306CA0080.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::16) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|CO1PR11MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1c01ac-6b12-4875-28ba-08df0119bea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QAn7n54xw22G6PyN2GCVf5kJPE9IBpKebpdpQh5UnIuk+82tTUdnxsvhj1hs2g1QME0PdqOnY6gvtCRRmQ3KU0D8885n8IynWezpfhsXMCB3xK7Qi4FOZHABpI0jmZFYQp4OngLO8FFg+5Xkdsr7Y8ZYyl2eGWrIHV751WRH+SVhtDTdfaGVaHsQgTBvS+3qv2a/GLQCAptRj3mLcyY3y8MfwVNw0lDb+MAJiymd3lmfaCLFoanPzTIJQlY+kOEnlXtQxjUyCUvRhsdWBdwvfx9oMgkNHIWchMIW2Q1XgK3JhmUauRHn1/ac6uaNwqt254F4xG47VjOScBh2Lk/eVHUD2CTuUtZkl6LcBe8G3wuMPNZXA+cxAT557gG5japLvMo+N4hNbpWKYjjgaXUTnhKOZ7XrZG7sdmstWshKNM1dvUpOYhLTJs8hSLiLJcJWpyvSW31XLyEHAWNw/Zw1LYBti8+YM7RPotLnsDrYa2ygminOU/gzmcWtYLM7KYp9uOww0T7shO6JU7pFjO9zYjiUuLUK3P3ogaM9HbwyVi82hmejV1q2jhDISDASJ/VEdhV+2wkaxCqNSWgU13NFEPgflRYUv6BxxpeQHvPB5j97pmxY6sxC7ySBSkCLlAYT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPWtysDvARmFcdEhSrUGlmNapBJ9TK77dryGMlKsDpIQcrZum4oroFgnwNQT?=
 =?us-ascii?Q?ZjEzC9iej7hfwqYdxM+dHyMgetWH9CbnLldk4EeMlg3UpSYuLKd9AeXgVhs+?=
 =?us-ascii?Q?tGmJaD0YH8JLD/650tDaBDCHFd5TgZUCOvDpUQhwfIgpEWt5PhxJd8bZZSyz?=
 =?us-ascii?Q?+DUjN9yq+pHW3rfgUtm/ugrNyEzz2p0Pl3WSrCyi07s0uklNzYFjbSdrPwTt?=
 =?us-ascii?Q?ss5b9MWzFsMyVimnP9gMeCMPH8/BWJebvihHMf2gOtiGioq/zNec8OFs7+km?=
 =?us-ascii?Q?wEZcPD5kX4WYZKHfliOyEu9w/r9gLeXKD5pDAR9wk4IBH+KSTV+LEBQDyAJN?=
 =?us-ascii?Q?xkrbBWStti1jBx8+IDtvr/Z+g5cIulL2WVH84IsEREajqvnGtEMH/9ONwSm3?=
 =?us-ascii?Q?sfsa39Q6EgF8T+j7w4K/Zu8oUyuZZ5l+Y8U34HXZgUyAVCH1P7wqxpqxtCLX?=
 =?us-ascii?Q?4n2s4nRZ5MQuAY+/v6YEM+iu10JrsFd/coV4dsj8wjXLMDi9W7apSfV9szjr?=
 =?us-ascii?Q?yOhm5nGMcAevqxOswVRghGvsE58a9ZVkXRjGAvNMxQPOZ0wMmVIuIg54E6Gc?=
 =?us-ascii?Q?YcPaFkQmAf5R0IAstM3Q6Hqt2u70nn29A3MgasYeM6Ii2wfK1Pi7fDZsUxU6?=
 =?us-ascii?Q?x2kNH4bTEDT5wnq4lb0tJ/JYIIdKdnEQIQ8V6ijdY3RLe4Pdb+s6IUK+NvP7?=
 =?us-ascii?Q?1CWX+dTCgOeSG7d5nrLQcrTlHSbJ9Q4NTSct3unskimIwToPYQfsJNr5m9/q?=
 =?us-ascii?Q?BEYYkdH6LYW8og8XBJx8bBSSM2FckdTsjqc6yuYIT0pQZM6XNYjfC0uJAg1s?=
 =?us-ascii?Q?HuDYGFAnEUetxnjyG2poUA66HxAkHos084QSl5Mz2TBqyxbspjjgOov5RmRm?=
 =?us-ascii?Q?gTXbQ9TYjmrCPoDPCJW4+N/RQLl5fKfHEiqwmLqTEUdkfx0DHECz4ewDymZ+?=
 =?us-ascii?Q?gON/QiA6eMU7GGhMbOJCYNQSt/Vzw+Mx8BcT+soFrMKlgF1GULMciPi8t+K9?=
 =?us-ascii?Q?dSffi1K6D2WFM8DPxK6LayGwSs9BcZOqAm8InkS208Z/mPmQ48xi9hIgIrRn?=
 =?us-ascii?Q?vM9+paSDoJesyTXGi7UWkgmJMYRrt8j9P+cc59uGTDrRlP8YMiNopErNMr1J?=
 =?us-ascii?Q?bVQos9u7DX+Jot+7El78XCKrtgP+f8P5HcqYlA20SI6kKQRK/+KSrg0zz/BV?=
 =?us-ascii?Q?NIkTsRsTtgcFHbfLDa3Mep1HLY1UCx4W3ldkbGCCdn4OoRn8fKNtvVi+Sh5x?=
 =?us-ascii?Q?oh4ioEEaL1mBNrLohvUZWJg6R39/G8YcYDkdvnfO7wxo4aiKscG8zOGPvhl1?=
 =?us-ascii?Q?mmyFjpiqgaavpAm41B+/4KaYAUjVYzK/oWf738kL9YxDtdSF7xPb8jACjBPO?=
 =?us-ascii?Q?+rfnhkmP8WXYmvyEhtz9inUsOtx1DOxk57KYpsdrAVS7SD9OAeaBCey+Uoqy?=
 =?us-ascii?Q?ZN6VnZakOlSJBKnFbEY7ePyEchNMlADUPnOUOHFUrirl/K1vpjeCIgRTqypo?=
 =?us-ascii?Q?I1EKQ3icX3FdGSJzyjSj2PLvtnTLpk5L284r8rKh1oqeUQg7FAfo8GTwq7JK?=
 =?us-ascii?Q?KZ0mgQ45C4Ol+FOGnOdooQ9REOjz1OibnU2JhzLzCGDmnTA8mvFszhximSP+?=
 =?us-ascii?Q?C10yLjii0Q3aoyKBbeZAZZGEz/QHX6ltNi6/z0PeaAbunC4FtwqMeqa3YI12?=
 =?us-ascii?Q?Y5og/Nkx4ZxjrSNCwyKt590o0b5logNgiedEBd2G9YWBtU1m8XmQ6pOmklYh?=
 =?us-ascii?Q?XKsmbWqNuA=3D=3D?=
X-Exchange-RoutingPolicyChecked: xQK1Bmc/gh+D2pt2IpkjYt24UxPG0B+a8ATP+Jc2hGHuwz/TeDs+7iKL/m6ZHCTctWdWUn5JXbQVw7Ikjpbe2WxEHUWInTQDhfhtZKgJyHZv4jjmYWjgAAkfvQ3HdN3NZ3JL9i0DpcQkK3K4vYWCXklETjXvOT4PCmShpeDa5ulddHSAsVtK/xBCIEcGvx4eK8dWDuTMpwSt4N2CUFn4Fr1Djf/Oj+/CZT7potnmxUjnIINh3blSoEYrAGHyesv1Jhgxqu1r1cIh7NZR7JieCEhcua1M6dIbqk1kJrh5/gX7+bfXC3jiIUYaedKRsAxaqNfBWzAUS/dT3C8eBljRzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1c01ac-6b12-4875-28ba-08df0119bea1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:23:39.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnXvlPyh/47TjI2tInvfxKlFZZSRmvlUqCSiukMVnxmMI/lUh8ApCOQ6uo6hDhlQdKbpg9odnyQeRJLbLaw7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
X-OriginatorOrg: intel.com

Hi Anthony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Iliopoulos/kernel-profile-remove-setup_profiling_timer/20260821-111744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260821091744.91496-1-ailiop%40suse.com
patch subject: [PATCH] kernel/profile: remove setup_profiling_timer
config: loongarch-randconfig-001-20260823 (https://download.01.org/0day-ci/archive/20260823/202608231532.dENn2OSP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231532.dENn2OSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231532.dENn2OSP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/smp.c:720:5: warning: no previous prototype for function 'setup_profiling_timer' [-Wmissing-prototypes]
     720 | int setup_profiling_timer(unsigned int multiplier)
         |     ^
   arch/loongarch/kernel/smp.c:720:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     720 | int setup_profiling_timer(unsigned int multiplier)
         | ^
         | static 
   1 warning generated.


vim +/setup_profiling_timer +720 arch/loongarch/kernel/smp.c

46859ac8af52ae Huacai Chen 2022-05-31  718  
c718a0bad75cce Bibo Mao    2023-09-20  719  #ifdef CONFIG_PROFILING
46859ac8af52ae Huacai Chen 2022-05-31 @720  int setup_profiling_timer(unsigned int multiplier)
46859ac8af52ae Huacai Chen 2022-05-31  721  {
46859ac8af52ae Huacai Chen 2022-05-31  722  	return 0;
46859ac8af52ae Huacai Chen 2022-05-31  723  }
c718a0bad75cce Bibo Mao    2023-09-20  724  #endif
46859ac8af52ae Huacai Chen 2022-05-31  725  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
