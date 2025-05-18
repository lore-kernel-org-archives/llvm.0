Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16871F507;
	Sun, 18 May 2025 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747535136; cv=fail; b=TlhD+02uH0WwyvajBz1Jq/CY+gI9egYigDVxIjmFsS2tShB5d91YG8HT1RBpicjzxeE+DLuSeibJMqmuXZqGvBpOIge4KtRAQMKUsA/S8LXDdVoPNVHImlUMv6jiXdUoRjDKpAUvl/AQMy9qlkEZMTdaONdnXmP3egAnhTv++0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747535136; c=relaxed/simple;
	bh=H4g2U94NxZvpCjN8kQiQIW6l4LCnjW/E2bODfXM8Xe4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=A1+xc2opAIP2dfCman+l3pjGSXHWE15FSWa0PiJICxx85SD89n5NfWfI3Xq6DufNgk1Y5QTCVVx7NlPKs0hjZGOosb2PeE3kARvh8L6Oz7PDgnkdeH9csRpfieYgTZQWCb5WL+eh8yfCW4y6kXO7k0GZSwlBCnP1QDuq4XIU3gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uyra/Su0; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uyra/Su0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747535134; x=1779071134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4g2U94NxZvpCjN8kQiQIW6l4LCnjW/E2bODfXM8Xe4=;
  b=Uyra/Su0OosI/BSz30GaUXEu+IaTtimVYniccCQoHXAb0EbfWfujVAqX
   Fg451ct7pZO7pm+ja17UByQ+MwTvkMWmE0oJv3SQxbof94XeZHeor9oEW
   6eAbnLYkk3QvqOC8N0u4OXVMQ8xc7nYU1L6b8ESdAmx8YcmfZjn2iN4s5
   pjIjdMIkBv6i2J8CphvEF9IvPL3cFMQ29TOhDAqsEO/vgHVR84JUclQKC
   kCq26Mg7jCzHQjwinR7gn/cRjlCmXG1ly29pE7/4aMT0zwlvkfplUibaI
   rwtfQvMJ47GoTfdxL36EkGb26kwI370BzrwVUKmt742UUgd5+6UppvA8H
   Q==;
X-CSE-ConnectionGUID: 6i50IelsTB6CpsvEz86Nog==
X-CSE-MsgGUID: xrZsY3EATKObA6EQzNS6cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="67019267"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="67019267"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:25:33 -0700
X-CSE-ConnectionGUID: kMg1OZNbTIO7+cjtvnKiww==
X-CSE-MsgGUID: H89UA1wYTte84NYO9UjTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139088886"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:25:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 17 May 2025 19:25:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 17 May 2025 19:25:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 17 May 2025 19:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6q+7GIfac9PKpTwoO0KSsqknmzhdltSGQpXctC8SrM+E6eO8RBB3tMk/tTP7dSQiB05Y/ockrZwnUJDKWbJp6hDnvhbTgoo8Ug56Rb6yszWEXI+qO0tgJQzOfGBtyuZw7jII0IdfHT3WDWlfHP+tRPsbzsEQn4pJ45m0nDmF7JT1h2UMtrViPfKsr4GVGN22vhjwm5I1yCZ46yCQQQpN7lw89KAJUtQLw7VE4DnnwRmcmHChk1qs6/mhOW7m/wKJmMi49kyu6ejHHzcjVGq0BV6uFjQKPqlikfiVIfnD2Q5ubKnJ4MT0Ws3U0WwprDzJQEyYJns75kWr9b5pgyWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wF4Y4Osb4K4/dXDIhtx6rlmjZliTPHnrSobZE94+F8=;
 b=YEarLTCjbfm6WbEnwQB+y5yjR8xhDcDtHg+Dg0dokSaT8LZyl8aYw+Xnb7K1FLPUJSnpZhoX7Hy0NAtsVdABGvlyKcvpw1YjPW7T2sogdLgYkmbPOd9A6ntjhHdFfjh8KojgMCxIpWiv/7J7Xnr3iu62Vyg/1Hyi6r0gCO4OdSrPDASON2EQZVTG5QGMIDDQiOzHPGlOe7vUrrJ04iYHYkc4KEiwIGt95biAlO9TTpzSqoNrhP66eOVRfRXU94HLvFUUoH6czHpljUBkJ00came5+9TVqZS8axB4d86hCw6Kn0Z4LeVe2OBnWFUa7YU4VBLWs/xPS8dkvdtwaMQwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Sun, 18 May
 2025 02:25:30 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 02:25:29 +0000
Date: Sun, 18 May 2025 10:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rolf Eike Beer <eb@emlix.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Joerg Roedel
	<jroedel@suse.de>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: [iommu:core 48/49] ERROR: modpost: "arm_smmu_make_bypass_ste"
 [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
Message-ID: <aClFEHZVgV2etESx@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: a52d0f1b-33d5-4607-da03-08dd95b341cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xNRrfFuB8jukVmC7SdIe+i9DvcO8guJlWvoZHEUMnp+sDQc71pH5/hezWSaG?=
 =?us-ascii?Q?aZg1EHAp39EQvOlTf8ugyWSiI+zdl0SR0EiUJ1JstNVmTx0LWadDjlfSMTlb?=
 =?us-ascii?Q?zWW8VUASCh6hXA0/4IHU/8FgwtSm3DtfjaDEZCntTbVl86PAuxTJeNqxMYn+?=
 =?us-ascii?Q?lAPjUlQUnS/DvdyKVcKtoGpUUIaaoqse3RYK7h5JgefjqNTd+uGmlYnUOaks?=
 =?us-ascii?Q?l2wS93jC308tomh6R2nL7Io3qB85H3DjKQfC4pWhUU71viTU6hqYfx7ZfOkg?=
 =?us-ascii?Q?rPepWf9S5eVO56qiMAM5FE8lVEI56EtrE1/J2yOXtIUyfs9wHkqnBXyse9rV?=
 =?us-ascii?Q?1avnwqlz1IOJcrjR3Y2O0P+yKBm4Gtm9RwZIAOR3faTffr6FoWJn4I9u5TUW?=
 =?us-ascii?Q?uwwT9jukKt/oxAQjhEnB9Cf08puy/177OpYp+pFU8JaQqq5AtqfGBSc2KNU1?=
 =?us-ascii?Q?UzfEPBZI1RRyR83vXFIBxy/SQxyNDMSO9fxS07b/g6o4jVbQ++Nzf/5xpi+r?=
 =?us-ascii?Q?pKvJOgHZ+oMNGp4NaTC1fdWkL/WRYG9ZL/6HoSO9J/hGne8jDoRnewCr2+GX?=
 =?us-ascii?Q?ro2FATmlH2yYyYVPthUco3y02c/4a43v+mfgoy3Br9kusFr5tJ05dbss/9cI?=
 =?us-ascii?Q?oe31Sfq4DKSZYyLTtLfGZgApvrSNTeV8B0vLfsxQRj63YCJDIsJ4v5sU4fkP?=
 =?us-ascii?Q?QwZUQ0FlV37Ie2Cws7p/JZRLwCBJXR+Kldhrm1xVdbOj3oJw8TvnDUzmF1VX?=
 =?us-ascii?Q?0fqV2R++P6SzwdRptEpQQAWcKiyWQNrQ2dWr5d9M/b5p0BoVRlyoZFzvg32X?=
 =?us-ascii?Q?odYZlfzY/ZKIyhF6gcbwgWG1IPqrN87d5spNUh+3Cu3ui9+LYJS6LsNNsEPV?=
 =?us-ascii?Q?e0cn7XTpwKpW3LMdLvjexhnCfbfLwy63sQYb3KcRQXGQ4l4xj/vaBsX1a+xN?=
 =?us-ascii?Q?TCLKQOrP1BTMbhJC0JbLfQy1ydAJCQKW3co50vnIy6STVnabWTWMbNnYLGAN?=
 =?us-ascii?Q?puFFjVifOCTnoZCi831z8/RWBGUFhkWuYPnnq+SkacYpFH42smqWb2ON3ZEE?=
 =?us-ascii?Q?ptaalSMZKyAQQYYVkvPjQtCFauJZSJhdRuXUCv5Rhy/0abLOFdz8UPCPNyKY?=
 =?us-ascii?Q?/8ClJgDGoTjUFJfrpE/ZpSv4ESJoags7eu6AvurGWwx1Szh8p5VV40qOD8Dc?=
 =?us-ascii?Q?472I9zFEa1Yzrlzai5GdN6Z2/mdutFacZDmM5HjF+toqUT6XRvS2lpAIlvSK?=
 =?us-ascii?Q?McOTpWxS4KO1g63yRQzfebpijyArmLTS2zxp/dOqq8Qcu5ZFKJuGKopNQaiY?=
 =?us-ascii?Q?0ZJDpzNoj4YrGbQ5Q543cqqFBbA50ChsF6RhAonSR4r1N5oGX2IueWrHDTt4?=
 =?us-ascii?Q?6VJx3h3jCH8PYxCCGNDmd7Np96Fl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LX2tXrBjIEsSW9Ser4ARVzu79oESzzzC7AsTn1zvjQjW6BAy2VG6BUt2KloH?=
 =?us-ascii?Q?ARu2m3rseLEGJI+VPJl/obLnSlGpqqQumSZpm2ce8xLhX+Du4tdYQBhjob29?=
 =?us-ascii?Q?U2iaiL/5uV8kSdF0NCHTbRVPYhgX0tloNYDTk7jyEOLQczFN7CjrO0WkkmKk?=
 =?us-ascii?Q?Ndpq5pTN3cZ1GubjycM+QtmXls64lbV9IJko5ydaHEkjHyIQj2loQ+CL9MTG?=
 =?us-ascii?Q?6z1qaMER9c0GA8YbtZiisDYV98UeTVv52MZTc/iluakhyoaAW8uyGCuIOC1z?=
 =?us-ascii?Q?s7jOm7iEL4R+R1MiV9091KzA7rNKG5012HY92hv4I4uh6fEmUm0I0UsXrqRt?=
 =?us-ascii?Q?lQetj207NSk3lDOTfd143j7PgLYIDQxolPijfDpqHQzCbPo0N2xDou+JbzSF?=
 =?us-ascii?Q?FDNLpfrh/MBO7Cp7paT7DFranxUsTCqnoEeA6hLE/bFGvOOSNEyHJkR4A6Ln?=
 =?us-ascii?Q?tzKbTmdNdD1bCHrAQJbs59XdTVdsUxP3oZNvm4wFyq9L53IigO4YPKGylyq0?=
 =?us-ascii?Q?oJRDtcweVIr0SkpmqgZiK01QtutX6PCmiWL2tHeRJUiqDSYf0DCC35SNqKRQ?=
 =?us-ascii?Q?cVR45L8n5pu5nsKnwEyvZT1GupJ7XCULfNov2T82bWdXk/+uuo9wLMnJSx3/?=
 =?us-ascii?Q?Fe1Hx4sskoO3LVbL71DsoiHWNtPTlNfWQltAPnaXUkSqTj8yqxGu2xYsQd0N?=
 =?us-ascii?Q?3i63AcGwh2ucjfh6RytLiJ8Kdw2HK7Nu4FE9j45PbKbS0jL2jK7AMbSIGlOW?=
 =?us-ascii?Q?xuZqqy1nK5GUiu2aRRfNUyO/4NETrz3ou/+76qyF4DpHi9pf/A2ydPvH9OXM?=
 =?us-ascii?Q?XuYbQRMku6vNpUHJhkDVt5g5idrAvZQF301//KMUS9elQV8mEl14uTIykfBc?=
 =?us-ascii?Q?h8lxpUeXedGqVqpN8aec5JXcwtw/YZG5bigtTIhbtZ7SyXxX3VLq5HWqYLqL?=
 =?us-ascii?Q?7CiOheo1rrdD9ahQJdB2vsepRDDPGA5Sig8shvjtbVpgDq8iSQMFqDRyP50f?=
 =?us-ascii?Q?4KQjklqmPh5YoLeo/Lzt8Dw6webBNDYrXv0dLdvW82ay7uV9oaZ3jemL41LN?=
 =?us-ascii?Q?VQLfcZJLQBASG6kzDllUkGI3J7hNIKfPK+jiOD0kTnacxQlsviEQe8l0tSuE?=
 =?us-ascii?Q?3+geGaRD4RLDFGQiE1Azgua5o44wVBNcuTFQyRKLETvJEqQDdH5ThLQrXpUd?=
 =?us-ascii?Q?1zLuaq0yNxyxqGhftumSjGYY3rXKzSLi9U+bZCSMkzDYL/H2gB4U3pb7n+wR?=
 =?us-ascii?Q?o4c8JRulw45tQ0Bzbr4HXciJ0kRa7pDNykO8sgY+iCwfWaXasmIo/A553Nxl?=
 =?us-ascii?Q?R6ndWvEW03MO+PlmcjPV0688SJlwHOFm1VbNSiNzw/CuMd4X4egkf/BScX/c?=
 =?us-ascii?Q?OLjkPGZhKjqZXryFqqDeAihITYnkZUptBJICiPkxY+/YMxD/fKgMyIEZbi8C?=
 =?us-ascii?Q?/LddzVX+/Rl+WzScY80wp6e2pBW6KTFX0ANvI8dnbrmyrfmjvdaGegUqAJJW?=
 =?us-ascii?Q?+8aRCjDWvbPIJJdfT/r/M0CBCtHfp69OuBkJvIYBI9TBQ6ZbyIQRts65FOkp?=
 =?us-ascii?Q?XGsdrNtuiRNSuJR8Jc80Z835GZnuudw2+Nz0xGya?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52d0f1b-33d5-4607-da03-08dd95b341cd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 02:25:29.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdOWvZGkyC6968Ni+6nvZ3lLukZ6y9sXkKiHTvatQhhW25qLtLpXX9pWJ/dh9/mIlWQA8WckLJJeWFQLrPPnUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   5e2ff240b31a37226260587e33707efc3c41e451
commit: e436576b0231542f6f233279f0972989232575a8 [48/49] iommu: make inclusion of arm/arm-smmu-v3 directory conditional
:::::: branch date: 30 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180231.YmCBcToL-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180231.YmCBcToL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505180231.YmCBcToL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "arm_smmu_make_bypass_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_abort_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_cdtable_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_s2_domain_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_s1_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_sva_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_write_entry" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_get_ste_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_get_cd_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

