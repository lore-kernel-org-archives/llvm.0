Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D221FF2A;
	Sun, 23 Aug 2026 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487393; cv=fail; b=sIGOImkM+aI4D2VDRP2TQonVJOewstPEKgbyOVRNdQYmo9VJOtS2T3ydKBxYpSVtGomCmvV6o4Eba63ULoQHLEoTHfQgw7eKHKv/CG4Di75kpjcTQ7PXMp4Ht8dXz5Hl7Hf578+CbWq+hT0cu7MzI3M5aPg/+bXYv5+NmTCNZBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487393; c=relaxed/simple;
	bh=2phTJmNDlaxMv4m0Mr1wwuQfGB60/XgQ3r251WZHV9o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jdGWg0C6+Xcjz2a97pCpZjq+ejUTd0Li/cbaCJ94D34JdlOQ5tFXCzDYaSL7hVxhxHtMJ8WKzwBj+jVCbVmMmBbngySAPXCynK6wi8+EREW5+2w6x6q6CL83JN9k8FglWwpjUXkFk42mu5LXnZmJAnnw6SWVYi/Tn2ZoJ6oI3lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwnTbE9t; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwnTbE9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487392; x=1819023392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2phTJmNDlaxMv4m0Mr1wwuQfGB60/XgQ3r251WZHV9o=;
  b=gwnTbE9tIMla3eGpnLCM1QQTEWxn7MEiJSZH58eO503BXjhZlG5aUCiv
   X2NRrigNigAgVfARW4zyg/vS2EMopgxlBzOMX+4Gb2A80DLVO7/Rxlo7A
   bb+DxjZ6iawRulBARzYd4MLnmZl2rbxWvUzr0QAqmA8Osto3/o+7pB48O
   oCt6okQ4fDoU0KXJqL2NDkuvvxiC+EF4dBKZCCa2SWj9x2UQFD7GgMSA5
   N6rfHyd/PJpxLSeUnhu09oB0so4xEhFOdWDqgtA1oEA3kY78lefI35/a9
   spsS6585P2fUATW8yB3dwebotbGb7LpccLIuinBa94hvFZGnqovbwR/rX
   g==;
X-CSE-ConnectionGUID: xHRVoVMBSRiYAWKuLi+saA==
X-CSE-MsgGUID: f8QTtT+2RtKRmxWpHFuHyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88089099"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88089099"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:16:31 -0700
X-CSE-ConnectionGUID: XQaFeKxMR+qisItzFcuvqg==
X-CSE-MsgGUID: vC1lllxKQjOw4J3i9/rGtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264991879"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:16:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:16:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7EyLyDZHb4IyJfUqxUY6u+eROFE5c4BtD/WLd8gs2/GQJ86YF5+WclBlLAfhaC47j6KLNxieqGsB3Dn7icm4KbtTpGs7eJllljow9joUPfQ/HQ6qoOqJdaVKL/qWpivcMAE5fdIjFH2a6RPdGzc6H3hbTiymZKnCBl1qZEM1moNLX3tRPfVAdmf+Em7PH7c7AzPYA8GMtApvYQaxPcWjk+OycJTpOKE7+OsLYE8G64nEJHguB5f0+ns2a54D4z5Ano4D/NUzCHYysb0SQd+PkC2F0jHeB590HxOmbh38qPDPTciPiJJYjRCPVoRaJx1WcVJbW6xO59yQ33FW/AfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpL+xqgJMkhmPtQyL9cbTsjPpJeYxF5aDawPlD0GHgY=;
 b=A9XkykqurMODw1iy7UUf2jNNQK/+x9ASGIDHXPqUB6HnkafyWW7+adXuefSkbWOXoURfDwHP4d3jEFp2fnEIunrO8KQ/BGe1K15Sr/oyxayhrtXZ3Q3oQOEejD0n4Ks7cgq9tbM3o8Zf/MhQfAX+n81CbGxWlMuJKHNd5xp/4epm73YB25tzejBhoejpoLO0RDQuT7dPzj0A9eGRPuC+6YVYkx/xXLKOj7KJT6se8HWqCMnahPuUAjiNMzbgkNqBWYKhiI18Duze3/caDpuhvwGwmAvQt2N1iKv23jNu7biBhm+SJL7rJcUwSsxrrhQJ6UobsJipcmxNIdmd9P3+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:16:28 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:16:28 +0000
Date: Sun, 23 Aug 2026 20:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Alex Deucher
	<alexander.deucher@amd.com>
Subject: [agd5f:ualink 4/183] Warning:
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not
 described in 'jpeg_v5_0_2_start_sriov'
Message-ID: <202608230500.7OeeEOui-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: d659df93-68ed-429f-822e-08df01105be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: J5CCSiCNd75xmDb3u8Wu59iEtGfUBkf7s46HikabAVPLeRCtJqTJFJpUouUUVudMrt2n61U32DHV1MAWgUkpGurinLB4N5bjoCPlibnnU4NEZYjrMZOQvFLIqdVem+9LnRc4kTBTD9f4Hm72mJVydIOEjruliSjpj24ej5byPnPey7XSHrA/PQ/vcMpyQTWNf6ppvRjecLex317OK2ZiA7QvCaeJZrr5/O/uOfEu1uMl9fR826eC6Tpc7SOtngR6uVMenHRVzDZRPKDF/E8ihnHZuV8br0lEYIV3l4fPt36DK5EmD77HTUQHnqMh+3t4ftRv+tWEG24piA2JyYfD4tdq+1FdiM+EICBPegcSB0kp8mkSFwHbw5CI2irRMnizsL0w9HAsFu6dmBIJP2qyaIcJBD0A5xWTiOPIBuOg8ptiaqoPvoaftLGvzEyXyYglLVcStOoSzl20krQa/vqNkvl3TQmFBzmbFAu3wPX/OgmFmXJzHxQq1nbHu89kzcmxUU5TxgSzeGzqyd3bbf3DGUIhixdAguzSWjZz4zZyrV6bp4pgNsVQjhUOj1LjxekuR+TtIP4cCtGAGjMny/H08bv1ve5Z7YreB4EPXZtH6VHpkFokM97A3CJuCzHzN4M/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9PdefrxZbCo1doGzh+pyXIfKPrXEBSH0QgUpMTr0F/l9pYK4xvYhKcecGby?=
 =?us-ascii?Q?tlxjXJraVqjSU2CiToPctpDHIYtB8g/LawFmvObXhZ2z2VJaREoGYjeNXqNT?=
 =?us-ascii?Q?vDHiBg1tw97wjPT/1fG/oaeYE3VSg8aJgPmQ98OMGE5ZV+BYNs3k1cVhUYS0?=
 =?us-ascii?Q?W3qFEkBP7g1zthdGsUVXH5N7IY5yi59CKddlR+BeGMOYFNFLAY+SrsvHwad9?=
 =?us-ascii?Q?r9schatJPQwkj6Q1dzK0qwzLZ6m+PYEJiW3SjG1blof1D54gZ+wel/cA1Sx3?=
 =?us-ascii?Q?8SinEgbot00VHbnoZvUK0fRBOCCATM6BjH1DrQ9gefm2jvpiyjyDpgTqbB73?=
 =?us-ascii?Q?awF+buZsKS3N9DeqOl/c44iRrCEEghVRbkwtctlgql43R9NXLcLeXpMGM6TB?=
 =?us-ascii?Q?CAx1CbwdLIgoZfVO68xt56QA1k1mnsMuEeaSgmHTWheut7Z4EW0g9SLr69Hx?=
 =?us-ascii?Q?IV2sD2CJZiseBZrLZ8N4qeqJ/DXzcLjw7xjgdEW1VWBTZTjgNxiCK5WpOgfc?=
 =?us-ascii?Q?NmRfeYh2S82tRuBy0LT4A6NCbEi4rJKagdszF4WsdBZSE3xVTvIohAZScuoS?=
 =?us-ascii?Q?0lOQBuAyfzNsF1d78q8qXIfMbpwv1n4FVSqMtZgpQNmOxLWHeHsMHL7V6cEN?=
 =?us-ascii?Q?TgXSkMwuHjsXTMgmX5imVcepLCFOhAdjFL/7FM4BoWIBLzqxcQXUCAdq5cmM?=
 =?us-ascii?Q?+AtdWr2x3wCm/0NIT0FvV9nsCSzEs9O1nAvLhIseloVg64/d+FcjMunevPgA?=
 =?us-ascii?Q?C+c1gi45dCJoI+vSmQ40ggtLf3RFvO9AojQQkW3osyxHWKWXxdw2khh3KbSP?=
 =?us-ascii?Q?6aed9fiZTEaOwfLJ4fl0/23HR/Xccksn3IjitRzW7c/dAX5pEvcrZx8/fz/g?=
 =?us-ascii?Q?DGh8YUk1GVbqLzvzcEfjkgKk1fk5SSon7q5tETVn+zQd34+uo6i5+bdIJKBG?=
 =?us-ascii?Q?GIKOiFYZBntoDpP9iD6jGJkAornqOD3ETKWOsxAkeQR/BEMKuJHC5EyaR2RB?=
 =?us-ascii?Q?1UQJupELFrpimq0mIqt2ArRKBJYXOi9mQjcZA33cXcoHe/5iqdFQFITjq6JX?=
 =?us-ascii?Q?IFTrjkzfY1E7MJ5APUJIp6vBZ5PDnLVy/Fti0R8LhNbm23L8QpgyLScBXdV+?=
 =?us-ascii?Q?xm8t0ekskbPGRxvHMjbQMmnPi6Uamyb6bg6s5NWfuuMtjfGOCJuMjphcQmVV?=
 =?us-ascii?Q?GoEq06nzNN/Ro/QQa0jKQvsqVqbBDhJl6qMhjHhpuLlfKfN5sP88wJULDzqb?=
 =?us-ascii?Q?QlccosVhOTIyrNTMVhITXGgTOkXP9xUPJ6EDkDCC+bHDuxzQyMFCaYHbZnXm?=
 =?us-ascii?Q?Me03+U1p0MYupTW8comDoV7b3bdXoa9AK7Q0bocZee8v7Eyosfz0VO5/Ylg6?=
 =?us-ascii?Q?R9RWpBex1J9N1KmDCt1RRhohCDd9Ip2FsGMI+fCJyDpdsM4rX0+Rf6zI1V4T?=
 =?us-ascii?Q?wgdcr+xq03Ne1qRBs4e4ZgLIqfbOlWcWXQ4tM81kiyoAmjKNz5U5OHfQHwty?=
 =?us-ascii?Q?fQwXnaDYLqqheOoPS7picUGTMUx8eC+/TGM11aNINBC9apcKLHwx2O8XT5C3?=
 =?us-ascii?Q?Hn0i/xqwE5Gd+6SB1N+D13Hwf+AR0KOIjmf5OeCcXWPgHHQ6vLvBMmc3Osd9?=
 =?us-ascii?Q?snohiJk/MnVT3Qb8eQfMl5pKrpbregwIOsTsp9f1VAOXXqYTQnDp9olY99IM?=
 =?us-ascii?Q?/vfS712preiC6WU3H3k65moAI7e7S8iqdQv+5wvLVuu4I4YxbK7c5bDbsbcj?=
 =?us-ascii?Q?Ds7YNv/1wA=3D=3D?=
X-Exchange-RoutingPolicyChecked: jX3OYwoJxagtUYWVBJ2QGsUlh6CJF0UcG2zIhQZxg4NIZKxA6y1Wyuz1xNf9fDDzbBQMLd28w+zCbhnZR2hNEvqy0AkFQ/ydsKV2MYBDJcbVeC1xUmufai0yXJseDACMcICmz/FECmE4X5Bqp21mLknRRXvEDj2Uxh2s5tnW/TjcjpHFVTL+dufN1gEJEf82iGO30bC1Yx6x4Od+nzdopZnXs4T308hGLFE53Yrb/wIcM4RtzDCg9tJsFsmidwU7Fix9y/fSKR0kW81ngbuwljNQLEWUvxjjTeht0UH7nfZNz6AFk/11GAvMYx6JH3nNlSH21xskfN8TJpigon5VSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d659df93-68ed-429f-822e-08df01105be8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:16:28.5771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYhK90M9D4y+uRnsaTaTzOrMaxkbzn46k8TBpac9gFfXSULCoxfCEulO40dCleNg9LjYCl34wDXopHMfu+1ATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: 7b9bb0dcd5a2d9647520b1275fd1051ab0f82d57 [4/183] drm/amdgpu: Add JPEG v5.0.2 SRIOV code path
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260823/202608230500.7OeeEOui-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230500.7OeeEOui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230500.7OeeEOui-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not described in 'jpeg_v5_0_2_start_sriov'
>> Warning: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not described in 'jpeg_v5_0_2_start_sriov'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
