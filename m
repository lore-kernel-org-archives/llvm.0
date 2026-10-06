Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268022931C0;
	Tue,  6 Oct 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288281; cv=fail; b=C/aQDtFi9ONLbZ31TZLA/+ucUlRs4A4Mxqatf8up62/eGJzjN2JEuhSn2Vgv9bwLikSwxYuDvZ2E8iStsPxRPPQC3IoDi76B2UYIOIRBUoPuJrZWV7+/tdK8s7vSH/NXmVhO1C0WTcYGwd8mzR9RE1744rboDlixdXd3kcg/6Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288281; c=relaxed/simple;
	bh=L0Oe9TzpKHiXy1ZXXYanvaPcjxj/InDmDeRlULF3Uic=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=V+6XcdI+P//iPZEEylWNCgGIbSGEjlynxhBaB+D6WXw9zW6BMGvJhVYaGPWVxKTtKnRpomDrSK8DolEv4fIMtYokWSyDgxkHD1ju5I7tn3iLdiPtT7DpufO7mEnt+W9ILOCL26hWzuIUGq6v0tb+I8LFln04tvmhUPckdeIk9A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ki0chHvq; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ki0chHvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288279; x=1822824279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0Oe9TzpKHiXy1ZXXYanvaPcjxj/InDmDeRlULF3Uic=;
  b=Ki0chHvqkj0K0pXQ6ttCGdJ+GH2JYfC7ahK9jzXEgvxS+VonSJzXwCMq
   ZrtERkUl0qWN//QQmGbea07Cirwz4Ioe/7R8txP0KY7h0DDY5JX2G0iTW
   0BdKWR4ibRhaM7hEl3Sqcz9vnhbWwLDK1Dp47itGz5BsBEDDYAW7cMlmO
   Xk27aj7hyNgO02H5vs9WxdtupHoPliuK0BmDVegnLQx0WudehUSr1qqGz
   xwjOMko7ZQ5OUu6gPxUK1LXG0r6mSJ6WflAId5T9vuZq7et4oyBa6wMVg
   K53AIIRZorrz0b24oquZ+gdaUGLuKQoQGtnnIMLlXKdtX50jcyOT4XyDn
   w==;
X-CSE-ConnectionGUID: Mk8Ls9fKRsWKgSqKOQtC5w==
X-CSE-MsgGUID: bFvv3IfOSROE+qJ3NfmKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102496184"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102496184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:04:39 -0700
X-CSE-ConnectionGUID: uKxbLGyaR/qRMOOd9tBYpg==
X-CSE-MsgGUID: y+xmosscQeSLOoMVDj4mqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285037951"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:04:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:04:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:04:38 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDiuU6umcUNJbzsWhAhjVebc1YL69HfLT1gWVMG/U+i3QX/AIJZcuphUIcJyE16rukMgmyLON02+asHQC4DwPKLZ5pMHw7DuuyC2M1xBOOqU3Gcmg7JWk9Vk3Ia1CUQPnR3tvjOLsJaWmUygvYbJM4yHcdcfNJ6k2jQ4WqbYz3NPbn2YcMs9GB6uQq0npKG+AaBPXQwgSSyocbIq+3RKdkn0B6SFYpvLteKUK82bgymLRyWrax0lQeF+wYN9hvLXOT4ojSIVhnRAWaQNt0xcS0Ko4yUOzmUW+G4Z4rupG+g8XH8BB1xCAKVrf2GlbAJa6VRJMiIaPS9zrmUQ7n1e4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsRsNpgUlQaYwoHfIsYByzDCvQxDNTr3M0jLMfNY6cE=;
 b=b7ooQIms6F2Y0rSIssp0hy9nf0CVyzZIghasFd5FInNLrVbnyvYcUdRUh6dhZWVHSvJAlGsGHo4c+OUucS38HTTR5nKCw23MOnIWK0fcUT9wS2pQ/HXQd7UtvpQGjxlXOYNn6QpztndajHJi1/1UULHofCjptGMsqbV2bp/lo5aDv6OQkYeiX770kGfMR0iXBstWaWT76l7vmcXOLEfAT0yqoUgixXiuCqo+klbgVHdjHwCp4qgI4uo38BTbRvVnUySie7uoa0pqsGIR5w5Z6wN2skLMKnRThbeRArirPu6DMNeRTj35UT8s8YoEeEsjn/ATdRFr7RfeCfPp+NYFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 12:04:34 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:04:34 +0000
Date: Tue, 6 Oct 2026 20:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, "Ben
 Horgan" <ben.horgan@arm.com>, Gavin Shan <gshan@redhat.com>
Subject: drivers/resctrl/mpam_internal.h:166:7: warning: ignoring return
 value of function declared with 'warn_unused_result' attribute
Message-ID: <asTjyaQL1T8ffomz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::20) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 28108cb1-2223-404a-b4ad-08df23a1fc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|10067099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: OWfA612eqWGiGslicx66i8wPRiYRZwb2ezEXfJwlz2H3AJhDRSZO58J5y7DyM5r4Q8TTux1oCipiyHFip8FAT/uN1o5T2E9obZwdpb3tuZSZDfrT/o5PJS1C3TrQM/m0NwIWQKi6Vftg7uj6HDUyJuv9TawFCJCzGBhJhjHJZrPhM9nIxu/qPYYv5n7B9dba5oUsu0GzjjP2ch54J4VwiHoBtP6yNt5Z18b7nhwMIIM4tX1MY7WfneivfAX0l0AaYRoRmQCqgt5X40SZ/b+8DWIFl4wu6wYo+QvosuE1zTubGi8bOD86IUjNkH2keJ1RQYNMLPJtDwEHqZMsdx7k886ea7TiDBVl1jc+JOdmBo6k9Q0n3/fqmdIeTLw0mNgpx/k6O9tSV25BSVerFWZYsmTJAMfvAzqzOsJAFuakSUiWESu8orFj3+ohiE4Mo3AlvwPp9l8TOoT44r5Ektk6VgBoDxyOKLCzjd7jN2m8vXeiFSi8WrmOG5RL90sVM7xVO9pu3/hKGG+bTbp/qBTuAUMg2pt2ZzvTDXWUz5RBC3KLpwkb+aln9HYznNwisY/ZrejQ6KdFpqwf6juZIwJR3YIzB/XFbafdBmpR46Y8HVIk7Z8jBLlIXmZ6vxPgRW8a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JW8F1P6rQ3nKrwn7WpPObXYyDpi2uwtsTKea18PMZzxhDtK9DtVPSlLYKErf?=
 =?us-ascii?Q?qONe3SWdt/z3UsqqjbRMeJxtZHktQnSnLgjYlhOi0eBOMIjZ0z+Gf1h5qk2d?=
 =?us-ascii?Q?v+NwSipixZ3Q5dJXgwMqfwOKrlLPr+0moTZ5BL7328lX2F4yJqNRsjCbMiXx?=
 =?us-ascii?Q?3kIVyvV9HaKqaqi4r2/uy32Uan52+6L7QbDE2grGuEEKiJTyGNQtdowtXMj3?=
 =?us-ascii?Q?kA7hecqzXbOTQnDvHj7d1ryMubVTzGLec01bWEPsMd6Ada6Q4WDRG82PmBNx?=
 =?us-ascii?Q?7prqhAM/FkIWt5egDNQs+5pXLUJzEGssHOPQDDizBL0Uu1pJhQ/rep47JRTJ?=
 =?us-ascii?Q?X8G3mLD2YmMnFvUZdwt8M2Rc1z4kHIykbt4ZobkzgJjid792v2MA5h+HPsce?=
 =?us-ascii?Q?ZYDVOJxQA7LugeSixBE1B2nNrCp3IHHpf0LjKZwTs6niPEAiM89e+bOzmLbi?=
 =?us-ascii?Q?IuCpzvzT2rNc5pHHk+o5kAgoiHhUXm8BDFm8V92lzBW0nvDiXLLn0ewQk6hE?=
 =?us-ascii?Q?P3z34lTtZ93xeAP1C/wgbdaKyWFQI7XmxgVoIeyIzqVhQ9NBWcyrCd0niNsI?=
 =?us-ascii?Q?e6Rm4RsCTMNETvOOY7UOOoFJaI8SdnHkbbK2AEULhrIgby1v1KtgoYg2ZOv6?=
 =?us-ascii?Q?+xBr4mUGSXE0CIKICgs8x5rOsnnJTsSImaKZQCsGMdZ4L9xC9/it2bk1YKoa?=
 =?us-ascii?Q?qO23u3x2Z7pYeb9z5i2gF9Uvk7avzapwam1IwZh956cEsuwuc5TvcxX7xzak?=
 =?us-ascii?Q?vGfRjllrGqYfXi8hlAjfNx0+F6QZsTj6mY/yMttbwZrWi0A13qmrWgH24O/X?=
 =?us-ascii?Q?OxKYEuPW6+fKUrSdTiJ5zg/bQyeUTlzT68KBOC5+QrYdWHbwcDoJaCKjQiHY?=
 =?us-ascii?Q?x6X5GDlmDeJLJ9IHGfhZRKAOoZyGqcj5L6DA1qdlgCAIeRIezZeT81fc7Xba?=
 =?us-ascii?Q?5Z+W5WKPXg4xnj2yDdTe4hT5Dl34tG0Um/m8ku/bo9ZfgAFRfYXTJ54oi+eo?=
 =?us-ascii?Q?tFnQf4D2BCFMGrrRng3BSTIqoh5Xx+4fkrAPtsMCmMpqbWtKqcfHry0QR/34?=
 =?us-ascii?Q?vNQnM/ACknpkSg3IjjPt1y9dPZQAzR9wj8neTcQYYQtPZdrkPbwMBJ51c27o?=
 =?us-ascii?Q?ldQOHN5nnnBjdaJuCtrg55G17ta6n5gpw+vZw1VqVJ9CJHRK6fHYdnQJFYVW?=
 =?us-ascii?Q?nxUfhewtZFwMpBPvIfKA9SlGl/B5oYILgBSADH7lbgyrUsx8CX7qwvB5YYoN?=
 =?us-ascii?Q?4l6P4cGUZqmUA9NKkG3jR35IXqSbhqu2Mv4U5rwXrZXw9vLeRFAstlRSd3Mv?=
 =?us-ascii?Q?wf9m2T5AsCj2ak06AGP1qfQ+rI64QDe5mPlchRDsQ6LSago6JwGOP3aFlNJ/?=
 =?us-ascii?Q?CzjbzzZFgiFzuml5aiHHxrujfdq7Wa/RlCRx9/1OWoPmnTfGAwQzQ8JYCL6p?=
 =?us-ascii?Q?CeE4apz83c7suxIyllTElSD0ZibgxA5JzLgBRleWANZzps7M4u9hGF/Myi34?=
 =?us-ascii?Q?xQshrLPUaEKVeFUUaHSJRyB8vb0dATPQouFWfDuGq/xDKzwm4KYuzZcxlpmQ?=
 =?us-ascii?Q?pAbEewuEO3cIk59lRSZ+kQLpYQP28LedqTUzroP6je4qYBzilCwbuTrwfdU5?=
 =?us-ascii?Q?+68ElGKHZArYabxB0AAgwBGe/BBoisrHOYcCybqsP5bDQ0AvhrC2ZGnVaw0/?=
 =?us-ascii?Q?5KfGf9JGYUaWAWoxwKNC5Q+Z2iB3KTmPorWuaOUG1aG+ebjLTA4r/5H8k9Z9?=
 =?us-ascii?Q?0EyWdvz0jw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 1F7xfrUc/WgWNT91m5w5h8vhYr/HLFtSqxh5O6W+tXAB3jgE3zy4da15Qpe6oVPnRx8+Z43WeZphmtEu39qQqM9dRhJrQXiq9Gfo06Y+TRPr8dhMOr6zf9iLAWTu1dMbAMw4/mVlvhNNokfhq6FS5y4JX0HS9uQgUFKo3dgPGMlphz8gQBaOaEHlxM26Zr3hDzH6URL7vtnvke1Z6y0QZU2eGINPeW6vsEy3b3QzXphjHWjAe1o8jKXMbi15AzG+Epfc00MbLaF0toOis9OUT3Qf/7xy5raEFRDpOpYRHU70Pns/jNDXfCKX1yYEvTCOGlOgVpKGq5tVX/6IKMhAzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28108cb1-2223-404a-b4ad-08df23a1fc7e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:04:34.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pktQyhgvy+QEcOroulh2Nly8HR+ac/QkuzAh8WWTIE+739iCQlk7+WiNjznvG+FJl2wGE5WdU6G6Sh2etYIdjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/arm_mpam-let-low-level-MSC-accessors-return-an-error/20261001-173426
head:   17dd5fecde831cbffa974ca04c37ea7370652673
commit: a7acc3c42586b611e6886e6c157acae728ed4374 arm_mpam: propagate MSC access errors for hw_probe functions
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610050742.agvnBvHF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050742.agvnBvHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610050742.agvnBvHF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/resctrl/mpam_devices.c:30:
>> drivers/resctrl/mpam_internal.h:166:7: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     166 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:401:41: note: expanded from macro 'DEFINE_GUARD'
     401 |         DEFINE_CLASS(_name, _type, _unlock, ({ _lock; _T; }), _type _T); \
         |                                                ^~~~~
   include/linux/cleanup.h:287:13: note: expanded from macro 'DEFINE_CLASS'
     287 | { _type t = _init; return t; }
         |             ^~~~~
   1 warning generated.


vim +/warn_unused_result +166 drivers/resctrl/mpam_internal.h

d02beb06ca2a62 James Morse    2025-11-19  164  
a7acc3c42586b6 Andre Przywara 2026-10-01  165  DEFINE_GUARD(mon_sel, struct mpam_msc *,
a7acc3c42586b6 Andre Przywara 2026-10-01 @166  	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
a7acc3c42586b6 Andre Przywara 2026-10-01  167  DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
a7acc3c42586b6 Andre Przywara 2026-10-01  168  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

