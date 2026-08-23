Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6460236920D;
	Sun, 23 Aug 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485498; cv=fail; b=LQUT08ZOfmbV8R9Z4mvt1apEOu/PYKUjHEdaaInVbO/4NVPb28l0iVmsPiiuXBOAzHAimRPsRTwKOpauD0lm2wPryaV9cLqEzJ8lhpIVFl/Tkzq1NVmfezzsDHTN8uZPNvFsQ0JbsEQrBrCooYBR5oGpQi70LSrIKmv+4FibBjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485498; c=relaxed/simple;
	bh=9eC0IqKtOlPMkAosKpA8ANZ3k8IzNGCGTqIzZhru3Xg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WrYW9nvbzNhr2NdfBoGTaXBOcnxvCDPsX3IIdZPxtg+bSve12Ed3DD+zbbrHKfR+wVuuMSVt+71qtbBDke4kVt5+Oyw+6iL9RXoLmEdQ1KuP0PWfdlAKwD41L0Wx9aT++BCQLFeDgzXTHo2jCFjUKe+5U/Ugkt9y6IbxNHDs160=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clCL3X5d; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clCL3X5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485497; x=1819021497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9eC0IqKtOlPMkAosKpA8ANZ3k8IzNGCGTqIzZhru3Xg=;
  b=clCL3X5dRZIUrF/K99Vsc47/8VrpcsBc6cH3tief2X9opahRQ3pUlnhc
   27FGEFdVmLzr7rG7HXZb2B1donvDELvBsitvwCZdGhUa4lqIaeaPkbmX7
   Zp+M5ErXatIRwKJvMEPUYizdm2Pevu4mXR3KpDSh07kn9KFVhdMnmoK/L
   tFEDC6Z6mgTZrTIDvcAQS1+4jiKJ7CXDbVuqr2bEauEEqEllAuR2INwxw
   QwD4Lgn38M5ls/X/G//DsbuMjrjwUGOdDVV49/WCwOteqVGD7eVsCHN1k
   6hTkYitDfOHxO6a+bD+oL1256oGCCI8kBsx9dPw6xdj9PAk7vKWRVwMhq
   A==;
X-CSE-ConnectionGUID: WA1O+cemRje9yzMtyyJDqw==
X-CSE-MsgGUID: YOVquV+WRZarZ23y5bMhpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88017734"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88017734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:44:57 -0700
X-CSE-ConnectionGUID: Zp85u6szSxqXePwe0uryjg==
X-CSE-MsgGUID: /s0T9ncXTx+sHfEYt/Awlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264130010"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:44:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:44:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:44:56 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZeodpoxJuDw35k+g1lB14EI83V+/TYFvJ8U5+uwuRwYCvlGzc4oBciGb+cSnK0/6Dv67gVoatR4rqjFsV16RsSLqd5gDHebk2FQLvd/8Ynp8kLHKrXtjk/i3XHV09a5AGLUXHv9lISq7wHGqSBqh0w028dm5GAdfySmvKuEtz7kjcOzikQUt9dHCCHd4nHeo1N9PoAexxEb2mZhwn0ruqEe0LUM9khoCIgfodE8HXzl2PVtjI1/V0othGvB4n2NrdlkDqmhSNTjfQHDa1R76j37XoEviTrIrMOydBeNU+18n0PB5DpOqWILz36aZJa5niT5ldB9gjlNOTkGoSGDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y43OCgVZt9AY/KVOiMz8AxUedvct/Ohngbc5XD5uLd4=;
 b=nWNxRQQ1HKJFuYrQTXRXj6gwl5PEkzzCOGsRLAYI+2QK0zzdfHFjKjkoaO6V909ohS7T7SWkt2+0NWB1PUv3GwyTuHBnulOb4xAHiA7jlEyuFDcrzLdHLkRk6nnxhpfOMkM3fLdY6F/r6I0Tos9gLe9JbxGbx+G2531OSsgwGQsV0mCECyKbfwYrNKvph8NMx/mWOK7fk/w4wTrn7OX3B7VmvjcMfp5rBVSwegCbPyUhd8ybFfjbpdsDjvSSos0SWoQ660S5MOyoT4+EmnBKtIwmKXG2G8l2JzTzgO3gz6p3xu30Y69BoMVs3NG9YPIK1kK7iVcuuak/kK15qfM8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 11:44:53 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:44:53 +0000
Date: Sun, 23 Aug 2026 19:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Alex Deucher
	<alexander.deucher@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:ualink 119/183] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1508 expecting prototype for
 amdgpu_npa_vm_unmap_range(). Prototype was for
 amdgpu_ualink_npa_vm_unmap_range() instead
Message-ID: <202608231508.UL0l4d1j-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:d10:32::17) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: a9aaa7f6-4e0b-496b-26ad-08df010bf25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: hr6IzGKqOPHslZa0+AwOMgSEIS5Qc0G1Rul5H21zITlASDQnQ1DQqGX+tgot0QPUDG/AEpBajO4UVV1FSEjPv4JMVXQe6e9Jfza7GROJiwP9VoQSUzBVWFf8VqJbnysZgcCmHX/sHUjNQuysRBbsZZWgtlM1BaMWGw+YfgR2ql4AFopVsWnx9XJtzXSBEZntj/3WZq6WBJr2KhmKtlaidT+uXJMQBl0BJh8ITFOW/A1HLTt/Jga9sQvfwqx9oKmGOeu8Z2hptSKyZP/tcXJn2PnSNH6cvURH0cianjVFkRZE2ab/nsKnY7GNvq2PqxNYhk0H+a6hSdr2i8tqVoy4pc8nEpCOKhmD9f+RUthKBVx3NfRWMafqMaGMQyHjOP6UJlBmDSCIEJU8H0jH9gl/4QPCBPeUM3Qtli+ijJgw2iOPm9ypVTvm9ZwhN/nG9fagcGRSnB/lcfBjlC1g5jwDPvDGuyAMOwsE8gY0tLNuo9f9m97OmkTeRUPMxtGiTy01ntjjDjZUh6MUnj3cvDsGIpbY0T7hfxFGeeryUOrh1bJRHeV2sP2FixWcBJNPHHydJqPXJhq/mvDb4slVr+o7uzoCVDphvBKM5B3AIUz8cCrQkHkEN1Bvg95jIDDbSfxK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PUbok4LCvcx6syWHly2SFQazJfNMHd+Keny6kQ8CCV8/MXZBpfURSZgLf9ve?=
 =?us-ascii?Q?zGogA/RwfvivVWFVtVNwYTNvpg97ddigCLo/Izy1Akcpdv5pn6NuHQclQCpp?=
 =?us-ascii?Q?Q/7I232p/G3tFVKhk8gyaYSwxTMOSUqEbCVUopHWUVopnffsGtXYPddh/mM8?=
 =?us-ascii?Q?W4nZHa6EYxI572Mi8Y4hBrrITFAtsEge3iMC5zenlJ0Sg6MkGvyc7tXzURSb?=
 =?us-ascii?Q?5kMqvJhj9UBcXHEseXR1tS2tkqRQLyAm1Zjn6v/cXrfECgZftuxvw/vI3t1h?=
 =?us-ascii?Q?k4CEiaPSixhpZV7KALcMorQsDaV6fyptxEDDWmYKrGTf9hYANvc991wphSU9?=
 =?us-ascii?Q?vBLKk2c2Ims55V+7fqaxgeMG9bghmLckEdrTLqvnYsvx6F2az1ZFhZPgYzY3?=
 =?us-ascii?Q?8+CuFrAh96uoWAUP7l4bet/LhIIi7yHSi6ruLgWnXATvwqPGSf/3ra+VFRZb?=
 =?us-ascii?Q?/mh9r8XHrxJqH/IFWLeohSjFM0O6ivNmJzF8VZVAsqUCr/7Je2r1rrk7J/Fs?=
 =?us-ascii?Q?iJI9Nr1nzlWzgHruczeygnuSNmH0n6tuGlBrox65M57aWcRcvspKnQgreLYF?=
 =?us-ascii?Q?SmCVu9FGoeasqZ6ihYOR9cbQh21gXTJWNB+TOqi/EhitO2PMNLbyVAtl0zBM?=
 =?us-ascii?Q?j/SAlN2ysYCq0w5NUL2Yq/4jXmJ+M+4j9uunGiOaAm4nP1NKg7kevAvpRNSQ?=
 =?us-ascii?Q?vSq0So90c7N+H20tBV658jBW2gw4DDOyY3mS3ajC/MRWVGzgwQOt/NQ+GKO9?=
 =?us-ascii?Q?VHApu/sT8gKCU/lbQkNjlrWd9dN1vNIpFP95Kl7hzFscVUTfZj89a9tvlqni?=
 =?us-ascii?Q?dPxstw52TuvyNeMdTOCh62dGMWdgiCY/7OPT3hu80QlJdnqIZja+07uvmZwg?=
 =?us-ascii?Q?QtUPDtdkPFTLUPurcRZEaY++ltmHfRuwpQP0bKW8m0fj+8k4ze6vnMZ0Dsvq?=
 =?us-ascii?Q?DtumCCEQ7UxGWvLveVCMt4SgWjAN2mw31TiAtKTAAeJ9aUCzcISxncjqkomp?=
 =?us-ascii?Q?7XVgW9v88UYZFAO/abe+EOolCY7me5CmE72sS+rtcDVLdi7Ng+PevkqFzbGF?=
 =?us-ascii?Q?ez9+5LFoPzfEX20Vu6nivuBadYfNvkxopieBWhEKTFezYg4kkwFbEj9XQlph?=
 =?us-ascii?Q?2X/Z7fuCYKmESCGMl56xWnzCVr1VcLU6dsJ2T0qRR7KhVnSeOeODLXWrTyNz?=
 =?us-ascii?Q?YO4pjaY/0Ua3m2HG1+orXeFi/Nwa5cBPSsDuJmJNEnMrd0aM+ttGg5s8sRvm?=
 =?us-ascii?Q?ECC50vuh8/Q9c+n7MRam6T0hQ/YozgNtWYMXYLFTlxho5vhhz1TvwrbzArCh?=
 =?us-ascii?Q?vYJRTOz19BWsbrZRc/iNLddtLnhc4MdHmjmv5MydYTEiCQ0QE4jeAVwUaAFu?=
 =?us-ascii?Q?vUWZXX7ZiIMbweKlfxBhOVcXoMAPHqtRr9cnJx9fDrq581nsLfNdxwi6cJ8o?=
 =?us-ascii?Q?6qqqfyCS34hWnMIE5y3u6GlQmsFcgDXX3SBPoN9DAfjYWP+kp9arYqVBwC5S?=
 =?us-ascii?Q?l7gya44kgiGFf9nRAau8JEDPLLWCPqHH6AWjGYaZIynKuuAOGrKDEVPSOYZN?=
 =?us-ascii?Q?uLPc9d56xNDaQLfMENaaGwJWKNwNLao0PZ9XKATrQfEg8aa9w/d/JcENsmL7?=
 =?us-ascii?Q?SmbG2RWYtOUD786TgO8smOJbZh91VNIHBf8dSskxgV2+UBfoe9Y/qvLbeGAy?=
 =?us-ascii?Q?2Q8hPJ1MrpdetDwPEpsoBc2QB7O0+s2xY0B6Nepx8MipJbgo8NF4TcvYnFdt?=
 =?us-ascii?Q?UdsdS7R6ng=3D=3D?=
X-Exchange-RoutingPolicyChecked: bzTynT2g68QlOT3fDaViMpg90Whrw07oAcUpQPbMPH5omwOPZ6U5rmYlAzMY4SZrD9gYMhtlbeFe/0ocrDP0FmAwWFfDzRh4SQNJ5VW8O05TOsvMItqw1ZJ6b0igcQ/4HWxUWL0dlZeKDsbV5WP82Nbmw3NnAldC6P8dSEYq2LCf9+7JnNM8TzYhnaGiLwyDwWKutNWqyHdz4kCKMXiV+eYuJFuGvGp2+3NeArNjeLpnUQSz2YyuX0V1Bm51qMGJwAGZ6jVr7npcbjBR9oAXOg4rJxZTXhZinn3Fqm0CUxbCU8qu2cKGLUovdN/TTJ8GAYpd0pGtj/QEehVzg6ycYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9aaa7f6-4e0b-496b-26ad-08df010bf25c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:44:53.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aZYBv8aCgGTqyBmZKfCz8h8BPTi5N/n7/21SWIZ1Z4h+FPQU37Swh140Rv1VgK/QWvjt7SNarsMgmhtVskMcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: a99387aaf204a69b6f88f80c858cc17a0943b0d6 [119/183] drm/amdgpu: Add UALink NPA VM mapping for ring buffers
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260823/202608231508.UL0l4d1j-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231508.UL0l4d1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231508.UL0l4d1j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1508 expecting prototype for amdgpu_npa_vm_unmap_range(). Prototype was for amdgpu_ualink_npa_vm_unmap_range() instead
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1598 bad line: 
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1605 expecting prototype for amdgpu_ualink_gart_npa_addr(). Prototype was for AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
