Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7626E71E;
	Sun, 23 Aug 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491363; cv=fail; b=F0UaFhFmeKbIUMvRSHVd8WIGQJDu2VRi20soZcCpTZS0uJNMvRKTYp/oLgM5VseDY6azdRy/9Zn9ZR4pc91oPI5zEk9wt50eWhKFaga9GQka5XnrZBTAXJOqrScHGXtBQnp/I7A/PVXo1x6iNvMYGMOA0UAqxrZJfI9ygMhp1A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491363; c=relaxed/simple;
	bh=arS+06xKUlJd6W9JDoxJYVQK2CuJdbf32D5F1z4ELfU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ft5J7lGBHbRhYG10Nq2qYuDVIF7L+cmajmZlzus/RBsF3wXvmJT17B53tbxnoSu/ry+8BxtpYzEyJg+ZJDUjxbKxElJ6gRZ+VWoI8j7JkJ2BH8mPwcGZUnYb/nmRi8SZQtgE8sSa4stou0HgK9kHkGfv7KGLGUvTlx1nNuRkBWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1FndWUG; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1FndWUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491362; x=1819027362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=arS+06xKUlJd6W9JDoxJYVQK2CuJdbf32D5F1z4ELfU=;
  b=M1FndWUGPWGU9GUdOfa0Aqo8tbq9aEwKIpc0r2ceLxE+MxYqSD1cKWIW
   C9G3l7jp/R21NAYhT6zoNayFA3kYosh+/sFnx8QeeVxjesUBKHY0MJZeS
   Rfc4up4IZwwfaOhmxqtAxK+XLqQUHhhc3+1sOuHg+tKOzZwJ8IKhFARlo
   2fK3/1zSTRr7LEqT88/7Mas2dBTzqosh9+7GRMFPUsMxu4gfAsvgRvRSa
   HgWfN9e3LTJPngtuM3/N9rgjIn+9kfhSz2hCigesdpZLC5ed0OJ0C1mIz
   lrK91dnc3x8ya/3OFd0C8iMFVdBhNZbwt4qQ2vDxl7mgXzKc/jifNhqjK
   Q==;
X-CSE-ConnectionGUID: zx928dM4SSSjaWuPSofJ0g==
X-CSE-MsgGUID: oEYopeb7R56v9H8FfQTiRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="99122045"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="99122045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:22:41 -0700
X-CSE-ConnectionGUID: Jzr+flRXR6iIVpJ4FxOC3Q==
X-CSE-MsgGUID: rIi3XNMRS8OVMX7bjsEDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="270974766"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:22:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:22:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:22:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxf0HgPNimLPURAlO4bFBrjHeLnDBNmj+WSm5MnwFRyb9zFv1iM4zJkGPoA1f5M3P7kosQdBt2cEwwpD+NZcUpP8sGUBhYQ80t8ZE17BArxMguFB5gsKJ4rx6O/LCJWftT1jvJI8Tx1qIOYuHl0GpajjI8eFn/I1UhxM1gM23ZcoFwWLuaxrhNVz27Bz2KpQYhtZIap/xLf5PkvfQuBJs8rva1v+pgPaKXJNe3eBrzO2opBWHG401bZVKb+ytLntMrzKhB5JPdyl1KSLHgnMa5aKFqIovEKCUJuuD3AepQ3tHYLUcjc9sYaIqTXP53/Os8NnjmJIrmZHWaVoo0Z/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3K9ZWOmkNxmkXy37NpIXVVGwxfOi8wguXYXlhmBcyU=;
 b=GHK63pjRyN2hAFHzCpXasZRryUgYviWRBzCUfyUAoyws6q0uKTPTwxScF+LbW2OXeJKKXfK+Z7rZDWV7AayvP7vf9Y8R4pNYnG5unzuUkD1/rtq2BTROWp1tCrA0b+VasFxwvHMqubc+4YgVZpQkvCDC5v8QDBgLLpz/N2FE6PRdfIMwfLGzLBsqBNyB3IK4BVPAqdZxJXBK/OEq0vBUgKP7HVSMUSwvwAP/4nCvWFC76+OsZzuhWX0fA9n5tMapr8cc56pPrJzpfNmJecCcVq5pQVWJMdRAUJGMKZi51RjwcRsuWb/FxLQLEIY5lt00nPSr0wPO0jyYppiua80YpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 23 Aug
 2026 13:22:38 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:22:38 +0000
Date: Sun, 23 Aug 2026 21:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:noreturn 25/25] vmlinux.o: warning: objtool:
 init_pvh_bootparams+0xe5: mem_map_via_hcall() is missing __noreturn in .c/.h
Message-ID: <202608231127.7OCESDqA-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0024.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::13) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: ed370c5b-b6aa-47e0-0bd0-08df011999da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: PuPpY8w/0V0gyTu+1K0/8gYLph51LaMoLBxaEL2w+AKQ4cihJC6Sy/ty9B/Y9AhujLHXM2ydjTZxS5KyjhGNuCvY1Pr2P7k/WrvF+lp7X2RtrBF//hNUWgiv9ZKm1eYPmXSHiLxCvkmgpiIKXG/OYDdEMjLADuJSGeFn4NhxgCkdXmvmfXOr24OsDVNxlK0B8SAjqToW060fubq2PVhMtvW6kFXgAUYP65L7HwPOlFtXXFjuCBzLDSAiFC/CX+vC9NbVvjT+Fx4n53fEmNQGr4525foFHZRZj3sRy4YRjNtx4uxca7j7Tjxhb2ggoDAMQoYWaeAAqaoCwDi7QbLa3jiUc3TMaBPk1Upijl49X3sy9VnBG6/yojOeUVppc4Ej7ImvC+THpZlpycvI6LgYICO9MjFRsjXrnH0izxoPLOaIBW6JGFm74Sb5aNIGI76CTIN2BFXX3qOftFW24xvO40Cgmy2/8/QCle/6QObZHOrgy7iY27CvZbrxLPqwk8kZ1cnPXDufYXcrVaJePnDINtDUxGSlzi6vDTI6Av7N9Vc8UenAsMLOG+ZwEoFQwXt1APHbXKQGNZZ8y/T+t6atz4zKPIMtSW2B5J15pWjYjGUiXTykk2SiravcuEfEZ2AspQYE9KU9FTYy87/DAr1kD1VuQQbuCChn2EI6XqobPhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qSkdwsCZyTGYgtc2Adnz4dCjatrU7HGrCVS2MkTU5VtjBgEbs9kOexYM7gRD?=
 =?us-ascii?Q?hunnLuFD4qPTKLh4F7slLcQEVTriNQp3sxVMh7kUIqs0CPHohtNOuTwkVOjf?=
 =?us-ascii?Q?2Sd4sVIJSiekDKyA3GhdA2V2tq9C1wMf2FXbFL88jNkq/48kLOQHZub3vHCV?=
 =?us-ascii?Q?GAhZ6yH3oYsIJJA/lB142Dy1ZuzjgcytfgbYplg0sVtovMzpQm+KtIexh9MO?=
 =?us-ascii?Q?+eQMvOTH3wOgKTEIeav82C4/tGkqa6H863T0nWM12Iev56907vGW4wGVuLas?=
 =?us-ascii?Q?YTvZgZzloTC9B3Kc0nIeZElHzRy/dl+jlR4X9+xl6sgWCFyBR9vhxmnobMlY?=
 =?us-ascii?Q?+AVyYri9RVOulS2R1cgbjpzoc/jkQYscD08MlkAkSKraaiMP6IfJPvF0MWhl?=
 =?us-ascii?Q?sZ2smBXKAFAyWJj2/eCXjwL9Tkq3whX+5Hfb+8erdzV551hv5MP48Oosmxcl?=
 =?us-ascii?Q?VRl0NxY+OYP+/LG0Pjm8c6l9xDVyGVNh+kD9ocRmDZ2BN4pFXk6T2HbfHYiH?=
 =?us-ascii?Q?sDUYBHe+FB/hbOF4FlZ/MSp9v/OZIMWiaL0nYGismAmdIuQnCjcpm+lBmbra?=
 =?us-ascii?Q?5RG0Iiik2nOlbEGAXVEoMw1IzW2j/mpo5kxOwDrhk2TZ1/VH1bHZR+Enqe7a?=
 =?us-ascii?Q?k19QzbrIByQPD+I43VAJ1B+dIeV2U/hBCz6TQr1lNYUDNsPlTrN0BN1HpbCm?=
 =?us-ascii?Q?/qkbWpeCkofMUp7wzsyDFLJB3vWO4tFMH2sgULPc+r6SM8keMCRE8JBP7oy2?=
 =?us-ascii?Q?zSliNQ98Tebj68IXQpCpfIAE3odeBJwquDU8bbTug6pHn8tA8NB4hiYLZqif?=
 =?us-ascii?Q?yirX+4uvUbsCljT/Akwn6RE6sQR0OgKqo5H4s7c1EP1onYFXb6VHma6aFoEe?=
 =?us-ascii?Q?+Iy5FVnz7BBvbx2lZkeVaatFtLvV/4BJ0csrWEN5+f76BYgvSwvPmTcSmU1H?=
 =?us-ascii?Q?JbVS4Tpv+4h0G8MvM01ywgWgW3b+iJDrgdYcKyNH4gLDV1+pdhI2LUCltipe?=
 =?us-ascii?Q?Rr/iBp5sAMehUdnzC+EB9okBId4mPrdQHfZ2DPgJP4hqNQT32Ai/+WXkMYPA?=
 =?us-ascii?Q?gZu4FN54+OWiIQ5s8CiieASwnYHuRQIiyq3ZyaXXjkElq+ktwX4DKi3kJ2FR?=
 =?us-ascii?Q?nKLjCrVGEBYHxl0Hy72EXL0vaf6EYWw1ex7xhPCuHIjbpOHeuPfKBp51fbTU?=
 =?us-ascii?Q?eO9gX/DSoliExrKjSRykahyXbeBBQxZYoZ/yZ97V2nUkT+lavCGpV/eecPO6?=
 =?us-ascii?Q?L8ZI+0MEa4uJajRWDxmCVscuWKzVFHhQCtLpRtafqut/oIlmcov8qj/P45++?=
 =?us-ascii?Q?MyY+7RPzU9yzR5e9Sqrj/iDZ93v+q6ONqc+ciLG7HL1m088oRgT07lK5kzf5?=
 =?us-ascii?Q?Y/K/yLTw3+0UJ43bx3YUP7DVJout9GAuWprbmvnP1PrQrOGdq3pk7M9m5JXt?=
 =?us-ascii?Q?yWfWQBdCcWkKkSopjUOwImMMoc4p3FBsgSsf6+r8z5c/teANrQmvCpE47LCy?=
 =?us-ascii?Q?EBfYk85VSp7o0VOofGvCEV14X1L/dKbWWCLdxDoxP0xVpDkJt0TpSP9ssBcH?=
 =?us-ascii?Q?3s43086jzaF0XlfxfI/2f2I/aihzDCDl152qnW73LW/ywz3ndvq7Hq1uC6Ms?=
 =?us-ascii?Q?oOtDWxVygjs0iQFCFv3R2amC6Vg7viP/1/U4D5ga+2paoQr3NQIlyz0Zms7c?=
 =?us-ascii?Q?pO4scuZVBQnkblH9AnfdICm8bRcIEYcsfLuyLBW6ZbHivCOqlFHHjztQDwo0?=
 =?us-ascii?Q?otsEBJw/TA=3D=3D?=
X-Exchange-RoutingPolicyChecked: nAk2Cj3WTo5GAhwaW7qrKPiqvbreuI93WAvzELhJlX7ihnSx1pZnGB81IRBa7FaKcAi89iP3/GowvHdWT0A58jB8Tidx1hi1vFYg1iSA3Bg29SDmyOPFTWGNIRkgzgG76iUvmeWpVEA5Hg8NQxzM3MMqft3UdlZ+r/mapMCWOJ+Z7gRTWBDXlg4jhPuu9eOfp5tiTnB70bjAjpAXMKhS0ogQK/xLW40RKHq3SWGEThUCLKR+v6EVRVh+A1tu9/pUTap8N5SdblmsiWh922yZSEFB+hc39U4WcyHPdM6/tjlpms+7/W4ToAu3eauPuDWuocczeImOBFQ7PgN2xJ/kRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed370c5b-b6aa-47e0-0bd0-08df011999da
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:22:37.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nU4czBQpXwz2U0RuP5SVORtJX/aQBFjIAqzM37VIY0b4Lyh2xCQjuvKk5W2LpR3Fg9DkoEGFm73aOriYanOIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git noreturn
head:   209a478bed181eddde654870739e58f30fc7605d
commit: 209a478bed181eddde654870739e58f30fc7605d [25/25] objtool: Annotate all module-exported noreturns
config: x86_64-randconfig-014-20260823 (https://download.01.org/0day-ci/archive/20260823/202608231127.7OCESDqA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231127.7OCESDqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231127.7OCESDqA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: init_pvh_bootparams+0xe5: mem_map_via_hcall() is missing __noreturn in .c/.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
