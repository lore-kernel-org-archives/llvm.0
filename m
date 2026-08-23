Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCB49364A;
	Sun, 23 Aug 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491333; cv=fail; b=b932ayzHR4/H+1mmiyqTiC3GeEB0s61ibGy45Jlr7htnVDLgSEGAgtrO07+TdQ7Hb7H59QlOPltT5dpvFpbNDj7/Fzm0GuDoa+uhDoA85PdXzxcV/G0lkcmrBIKGO//M5rPZSGOQ832AzhNqJU5uPIfXeuLI6Da3z8tOSljIaDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491333; c=relaxed/simple;
	bh=ZEfoDr4U9lB4zgyMqCHC2y5UEl3UqV2Ty2WbWbhFzL4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iSVY1E9ohr61ntIuDpgjSkzDtQ8OlX60pfSs/aLsjVkoS9Si4VXIb33y+Zv0YT129ISf+VOGBy2BC08B/e2x0dakVIHWAz40r7BACOrTR4zCO6opF0vFLk9/l+9TljdGaXuDp2P+77tuiYXubHb5I8Y9nwkK/FFylm8VdLDnt5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2xGn1eh; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2xGn1eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491332; x=1819027332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEfoDr4U9lB4zgyMqCHC2y5UEl3UqV2Ty2WbWbhFzL4=;
  b=d2xGn1eh0No3wSq4ytXb4Kv3eE8onSBjdlI18x+UAdh7Ljr86jQ2YP6W
   mPnIKrjycksrIwMhKYc4E9JBwdGznpw/jEVp777Yu2x7VXoMn7tQfBF2x
   DGQyd+0P2TcdFBbSuLNoGi7dIyRw/KKu58D7mLCDK10DAPboG2ZDE7B7v
   t2HOx0sl/9l8tem9AlLOXq5yikX3VY0Ra3flu5YPcJub8lJJB75OtXtgu
   YGvqZ2+exJ79U0XmBL8Id7ZvTJPoTNRkeeSmbRye6lEPZ4vVOyGOdXY24
   VJjhKraA5MaVJ4qk+HO2PrX/AAIqQDXShNKv2ZFHNOtD25hdZN17oSMGa
   g==;
X-CSE-ConnectionGUID: QSSeEJBLTPKaP0m20642OQ==
X-CSE-MsgGUID: MT5tf39iRE2BY94V/CS8sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="91833097"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="91833097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:22:11 -0700
X-CSE-ConnectionGUID: 3yfAD561QPewpuJAqj/bRw==
X-CSE-MsgGUID: rHBA9PD4Qo6fbwRWY6QSNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263065998"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:22:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:22:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:22:10 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDlphPNOYPUDnhhzLuXqTZ+OT5J2CRtY+nLtpnFD+gZ/5bpptQUewoFWKkwHrmtYnrLmnD0cr8g/dBO9Ei/d6A369310ECO5+Uztdy519gvhhNjgztOT0ga8EGDyCBoSxqCQV56YHrBjdssDNfiFVNnSkvFj7MRuYlhYHkBHa8sxuyEy5og3qnl1jVz8CxSBB/HDzrdpONb9QoT3wcRC9WgCMX6jNnDHGgdJ7IL++uBeSS8sIB6vXaHY1HcwCFPOuFvCeua6PyFS/mb8c1zqigplxXV6V3rj6uJM9EvXkAK/b0L6koz1R7bGt/XL5yeeoEIT9D/zHd7gUuR0tjujbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyMuX95MY3EGhb9QLF/y5Kh2g8zsNqclnCOtBl3cLNU=;
 b=eheGrI65QN7PTc/oM3lfqH1gioE0a1wlpSQujMezWGO49yUKhW0t3sh3u85TPMsThedZyX38fzNvajRHajxNHfZKuyPzbfJagPSc2S8SRMwCZTWw+U6fLzKhgQCrPtK4E2CqTVwEJZq+nGf/pLiVqaNUvn+1sOCRvA7IqCFxgexaoSZK9EwBoWGp07i9gwiOaIqNEACzHopnJ83TDbWPDinj5A1ZHal3Z2PrXH5j8J3ctRGqJiwSwcNjoXVQiGmXu0QabOre3hmPKqzzeBy3/UeSHIPYTX9fmsXC0op2jF2pcF5N9mmyoGYfs/xaDW0ZFDnd7q+sLgnhjKKvuNmGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 23 Aug
 2026 13:22:02 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:22:02 +0000
Date: Sun, 23 Aug 2026 21:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Alex Deucher
	<alexander.deucher@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:ualink 118/183] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1512 bad line:
Message-ID: <202608231124.qI5Xcnp6-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0080.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::17) To SA2PR11MB5212.namprd11.prod.outlook.com
 (2603:10b6:806:114::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f154cc-415e-4bd3-b9df-08df0119846a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: vFOnzGAYHl8NkO64ydjWiRVdZSku6FCDgYigk0XXD+6bQABgkTigeqmrutFMuinXJ8/rqWD868fI+d7LnMp6Avo14s8Bsgu5xbvIK8UJ4dv2Y9EHX3ImgrbctcnLV5Pj4alp7GGXGP3XZXuzxFfWGRAT3JEG1+XYMl6F3/OXQ878D2AFjZ6vEMikmk3BaoLyyQy+wu/FqEQrX8Thl64Ah/RnCVkAw0N8f+GUWJqX6ZxPD7mYA/XKnvHukkYt1fW5qz00mNC79TFgX8dCbiSQQjqPgZGy5pmLsPH+DOnEALC5A+WfZhASt7cifeTVVrmgnQtMoqjXM/mE1nyK8lApBMCAsI/SBwIdruYkEuTbnntufTSuC9fSKBAXrSCWC0F87+WZ0h8Bo1is4FaCPi8NvW9MDF4NYaBnYZpVYbaNSnyvxpCZrpQ0zVlFD8eZSfjkzt/KNOwTyG2CkP68bW9ez6HeE9nIN9+9m72MhED3btLH60gDu7jWmpBJkRk5fe0rC+htNilgn9MNm62SB62ll+fiNf3U9mxnSlQN/zd8UJditxe/Z+ok2RXUBcTT6vS3ReVJv5ssf0tlt/GPXWrR6JqzFhQtuetUhhaTrwMQI5y2MO/wIEfzyI9xbGjkD1UT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/XmlsNpEfc/qj1A8KnAh7IxIMxQDIOkhPH7sXOyl4h1pxsYy1qsH2uzMeJTt?=
 =?us-ascii?Q?H4Ti+5Dt6C4cK76kBdPELgP0rsksjfCpnWiOW2N+bI0tD7p7lKD4XT/5dO4x?=
 =?us-ascii?Q?KQoGSieKYgL3XGGcOKKOvTM0zBTHzf5SA1RB5xy3qeQLEKpROmUL6prpnuCa?=
 =?us-ascii?Q?tCVaz0V8ADmd2zE2lZOM/iE2h4snHkwdggdYg4Jx3BUU/7tShkm9Hhs0C7YV?=
 =?us-ascii?Q?4td5Fyyk61SlCkyoRxOrHjKzhMJwyQtmx16/cOt0faLGw/vNihfGduU2FONo?=
 =?us-ascii?Q?1lVX341KYndtjgWi0dSAOQAXzuFlPCbeOmXCf6gp1ryZaQSvB6ORoUma9kqC?=
 =?us-ascii?Q?vTq0VgEpfxx0SW8uBI3Rii03wfNjlXkm1Y2lDDJruIpJrQ7L7smbBUG2JeuL?=
 =?us-ascii?Q?jkp7SzzF1o1GqqYXE+t4PaFx5zd10PQQLpzBCdHLrkRwHjA5qzd7zaLIYnb1?=
 =?us-ascii?Q?zsXBPnFQQAQx0T3DFEQQstl0SnKSpIvadTMUSwRSXocmpCyvPUgcw2sGjF6V?=
 =?us-ascii?Q?KImS4sxe2uIwp2JBHYwc1Sb2Vwg3xLon7JiHgL6Uz/ckMnt5l2EdwspFCzZi?=
 =?us-ascii?Q?abypHyrcIJSYAB91sNY+o1j1vjN9HEHn3t9dRLJEqzW90f+lwcucRPJcHTnc?=
 =?us-ascii?Q?z6nIgfWE5pSXsVMSPEw+tGLkMJ2kd2t+0wJk7CmQsSaR20/bEdFn9XNWeKK/?=
 =?us-ascii?Q?x0Bf7U4yv7dcYgluLPRMlRTATWlLII7luTmvEl7sZ8qkMwX582u0unusZVz4?=
 =?us-ascii?Q?uCOeqGYdLHyAjzRQhd9P7IZWzqAMNec3Y6/xCtghXDf0YBVVBcj/UXblknBq?=
 =?us-ascii?Q?oMPQ4MBYFX7Jo2WnFrOAc5N54Q2LlwS1UQDWpZZpZQVVAPLS3EScYzemis6W?=
 =?us-ascii?Q?ZNZt0hXylp4zJBVZ6bdz04Y7mARsYBlyLaFFcxweSPmP76Vt/h4fv541axM9?=
 =?us-ascii?Q?qYB/edw4njHT5pk2jUonRyNXic6TIsDLuXNfPA23zoRjFLmwKkzDU1zxY4ay?=
 =?us-ascii?Q?cBbedT1RhpEbIc63KyFgwm/VCGKH2bCrFhmzA4Pc0sMLF2P/59jxSoP+auPE?=
 =?us-ascii?Q?delipDr4UV4wl4uU6+i1vVRJw+ZS2S0rlN4TLQfIDcOjfqZntC72LWhsKEQi?=
 =?us-ascii?Q?TehDwO//kJ49GdPxhDdPtvZlnMHK/hIkjUJyvIbBC1s49o5iIFl9WlKUp6sA?=
 =?us-ascii?Q?UFKN4e+JVqJmvujG+aVYLA9WPnNB5NMVMsOu6Xtm4a3UZ/wCx9A1i7QNdoAy?=
 =?us-ascii?Q?rrNcQlBBb/CyEJiG0xWrROApw3osAYbkPWWPtmMDBmqGR1+uj7libjl3yLJ9?=
 =?us-ascii?Q?/epFOJB5PoL3ZaZhVL2QQ9+a5X5bF2bbfsScKbbULqJpu1RCfydK7EI8RDRi?=
 =?us-ascii?Q?mrvNxMVhYSNFEM6OVQfFrGJReru+18xDe0GPKt3XRRnNFIr1cWOy0Cckb0d2?=
 =?us-ascii?Q?jnPwp5pijLDaYcCPvPGauFE5VYxFdXhtJw8669Zkha4jeop/LFZ5kQMXGApN?=
 =?us-ascii?Q?+utexiDsvKs7OTuGOTrnMBLwJI4WFv+Ue29QCEoC3qZwd6wgmWRkcZV+acc1?=
 =?us-ascii?Q?2vT3B/7KvBB5NhsXdwZZ90KoU3g/nNEYqzNEfktS2nWCQQcRmRB1Knc4HEo8?=
 =?us-ascii?Q?xbhHXh6+8pVa4AdW62vnuCFFgP2KCUjpP9pyJfBrTyxE1AWjp1khALqkfFJb?=
 =?us-ascii?Q?Jf00XWSRCLhZ75ls/yoS/aGe7x4zimwXYKX1A5WsDQzP21HFXbnyfhdbFInp?=
 =?us-ascii?Q?6Y6oiFogUw=3D=3D?=
X-Exchange-RoutingPolicyChecked: XyoNn98aSf8G6GXbkPwqKbCou6PNO2SKGEq+M29AC/NvHZar57CRXKVcsPDZGvwPpZQNk/9DC5ANkweKzYYSvTgV1MDWqvrqTvWvcHStp5YyKfaijJgzQrIx0EgfkOQIhYONDlb9ssAru1a2c1C6SuasGSQizW3VRrusAC4ihfSdYDhke8k4TubLDkRG2RxWNgkIQEzODqMjLDx17aTCosNdlcNYRuM4WNKMg2zbLWcO7KUoF0MWbx2oOyq6krq9XmVwvZBP2dGj/biPluyT3AOHFhKb9K0f854hMFdsNGlpAul3m/R6k/GU6wIR1WRE4etowD3G0zFRNbDzC5a0HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f154cc-415e-4bd3-b9df-08df0119846a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5212.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:22:02.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFyiZ8EjWhiw8rFPxobjQbWS3qS+Yru+NKFxyIbeOhtYHoHXxi4kLbRM9qyePtFv3+1ds5p5bfX575uzYPo44w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: eb1f02af69f48e481c6aa0bd0eb7dfc89d91ac37 [118/183] drm/amdgpu: Add UALink NPA address computation for ring buffers
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260823/202608231124.qI5Xcnp6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231124.qI5Xcnp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231124.qI5Xcnp6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1512 bad line: 
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1519 expecting prototype for amdgpu_ualink_gart_npa_addr(). Prototype was for AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
