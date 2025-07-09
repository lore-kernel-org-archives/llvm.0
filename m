Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81E211185;
	Wed,  9 Jul 2025 01:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023933; cv=fail; b=VQ5GgfGTgGrM6tycvGI3qJ92eUnBsaO/DW62j0BLwcbnoa23Q+4RzpV8WYERoMRCimTwIsdaSlCWzALNxE1HlArQmDWfLnHPDRK3o1SfWViIoIxqVqKoD/yhfAhHXX+DBnodqbX2bL8VCTJ9xUcmHjoUoNXYlMd/bR19+r51jMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023933; c=relaxed/simple;
	bh=LABaxfD2T3hSyGze3BQp6ik/dIekflu2Y3Cb8as4WSY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CWFq6o5h9TImTNTvoboRr7yggUoQE8k77Oh1u+ybdWvKLkwOjY5Lh4R+c/rHY702OpeVrDp4BKmRPFrtBAj9nvXNnFZPJGSS+b1dGyyoXootGB2sdJwbD+kW6mwMIX/BG6WkzCORBpGX9EkWu+E1u4U2fxFIOddC4/b3oegHHGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoMvbX1J; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoMvbX1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752023931; x=1783559931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LABaxfD2T3hSyGze3BQp6ik/dIekflu2Y3Cb8as4WSY=;
  b=CoMvbX1JlVgYAFG8ilDPa4AR0q9RRzKaa86quSWOJ2NVCVcWnaP2k0gs
   S/1wOizWuhOKZKE6qFx64gU9qJ/WKybaimwvLZuov2IEfw/ys8nPntlVf
   BzbvD8OmGCBb/CSDaxUST2AMbRpCDqc3u8Y9UJavMeaTOYdJi5PHyLyWn
   JeNmHhIAOyoaeE5mImrWTQar8BqD/F51qX0Aaxaaq6nbP/ULs3a24tJF1
   FjYPx4p/vIBmTsiCdOkmqrlEedwi0dIsH4hHMzpUqcyilyGrSHsrA//Uz
   7V7eYr4S4lfsL6nuvuqsiSWYUJELMTR7JLSDVwoO8+QbYr5nywEjcq6oF
   w==;
X-CSE-ConnectionGUID: QhaEoJ8ZSkWR9I7b88RuZQ==
X-CSE-MsgGUID: +i9EXg9+QKqt0pwAcHrODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58041935"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="58041935"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:18:50 -0700
X-CSE-ConnectionGUID: 7KaEqt88QjuBz36/sRdgug==
X-CSE-MsgGUID: G9/WMQSKTV69KY6tXohyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="155372552"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:18:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:18:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:18:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZM3m05IqSKiKiEakiZJHD5ofKIoPKsVMYZydb43Ti8uMJfetgh5Xx78ZD6VZL8Mj0da/1o60NdehEmL9a0fjcq8dfaaVxsmnwkIW5+neYVpRwaSJT8nUJukBXJgk/fjMmJJAgnuEyWQTf/sOl7bt7f34JxmLkmccEIIGnB7cBwItQ+aABndfgtn+i2kxQnQNl8GBCZm1lK/VOic39K2bHUWNeoGm1v2sMlzJtQOGrD9ywUmLzOjobW5p7jMrL1lXkOBsRU3s51GHj5kMwyS0YbIa0eprXcAT0Ym/xM5W5KiPzt0OrgVfiYSPvBiUFAQsnl7jQt+E8/QJbmnt4MOgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov8+J0GWBAHnrH4TdLRaTj0mMjJ5ANj037PHIqK1CTM=;
 b=D3lz9MEfuYjuaGorexQmXQEkM5F0aSaNaWlfieYHtTXAe7xCtLpCoNOrOo+9GUw38wMbw+1Ez4Zrzjhl/fbIzLPOT5dcN6mvBDIFpAE/1sD0nBXEBeRga01pJZz2YTRIqsvmEEm5BhHOw3LOJph61XaihMQop64KT2E9CwBEnFlQ17v1jfQwMOWa9rT9g8LtqzN8OQiCwrYNE9xhIrSL9fm4IJTbeu85zQNIJ89FY1EosLMIVMTsLf4HpCX6tvj4x0vfN+r7cRmQzOShoQWroD/sK4jWZGpEvLs3f6GfMWwbQx2VA96+/FeoJYyHH1MtiAjpRZ989Atnw7JsBlQXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 01:18:40 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:18:40 +0000
Date: Wed, 9 Jul 2025 09:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Jeff Kirsher
	<jeff.kirsher@gmail.com>, Martin KaFai Lau <martin.lau@kernel.org>
Subject: [jkirsher-net-queue:master 4/4] kernel/bpf/verifier.c:20957:1:
 warning: unused label 'patch_insn_buf'
Message-ID: <aG3DadX7juesXskm@rli9-mobl>
Content-Type: multipart/mixed; boundary="kZT1+G/Ncmg6dbbs"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6573b6d9-3df6-4e2c-b845-08ddbe8689b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uiA1q90RXWYTqleRQmSNaz7Qs+PdpVuXXh7zaaM1Dp3n1/QusU+2gfSeOAFh?=
 =?us-ascii?Q?rzieF0mnexxv4AeDCB3bxTzu/LIigMoJYpwsW4ZZnEGbx6eqcOJwQHWqmAGS?=
 =?us-ascii?Q?qFJXhcegSEPW+QlMLcaTeK5Et3BXxR2Refk0Md5cIjz8JH4nh1AOb3mcjFDD?=
 =?us-ascii?Q?qgJc3MCnr7ZypC5kvyDhaXshWyrP8lc3L6YzTIH5QSsvHJyvxs1pH+ooUxqx?=
 =?us-ascii?Q?hiuAVTX85Rjm9np073xlAfdwGcjaV70DAhCHsC+a5ofUYzPDtoj7Fxg54BHD?=
 =?us-ascii?Q?gxvrVomZJiPvhqoehvJ4QjUsFxu/hzXb91G86+B4RCsuBWWFGdLYP5Dy4r6Z?=
 =?us-ascii?Q?Cm4IvZBrXU90W6mxXx6bjnas4m+4KTheMUwWah87f4BeUGGunm4qx6OBFecB?=
 =?us-ascii?Q?Chme6PUd6S8jx/KP+kVRKo3D6WW38xCNTKMDH7JE3M5gSps84N2v8B73JsQq?=
 =?us-ascii?Q?KtYOt5WCC6jkXUICVpukrvvV+3M8bynDjDTZD81lqDRt/3sWGvaLDHPKeC4v?=
 =?us-ascii?Q?qUnZJ0xA9H8ilwyyvHnGrYxKXwXd7pfoydVQoncxTkf2wRTQLcMAPnGJulnO?=
 =?us-ascii?Q?P/O/z3cMt9XCZzufz/LrYEMbz99MyWxIhtNMmPZ9BY43USnMde6qdCLWEk7T?=
 =?us-ascii?Q?kw9uzpDyMmEl/bKhHULrHRQAfMLpfixhbtbkd39O36k0fIqcPV6U1WYmShcs?=
 =?us-ascii?Q?gZJodhLlo4qaL/svalrcS+P/DPhWNuaOCeqf2wRLYv65U6/57NjvVFT+6Zhs?=
 =?us-ascii?Q?Xje+Bd5qlfeiMiWYqONHbtMvggzgQnrn8xtUyxbNDKs7wsFmiGS49fn2qtQH?=
 =?us-ascii?Q?wGCfVBajR6UaAAV1aUKY+8uxMRfL3my3X3hwUtWZ3g7IxbWhSXTJqnNi212o?=
 =?us-ascii?Q?JOwoFd7Sz2fWufkmNi0Tc72pjDcwUiUaq3JxXMW+zQLzZ7VY+RaFRzlkAflr?=
 =?us-ascii?Q?0NgACyJuihouERYtrmO0/oRXA/QJ8NgQEfC21cRQIh/tpi7wDUqos3QH8UzZ?=
 =?us-ascii?Q?A5s3wHilGWetzu5q7JATxZ/nkoQ9Exu8NJPaXsxgFPOEdVw3WlU3iXaJ7Byw?=
 =?us-ascii?Q?FJT7Oc7Mdw0+MayOa9UdOpXHsuP4oDVHBE9xnOXBYFG13HpQOe4Qv7GZQ+Tk?=
 =?us-ascii?Q?WBGGSIoVJ67ppi3hILqsBSMweNTZyD+YlmXC5IJJkxTLw4mmmXmM75GVNBXp?=
 =?us-ascii?Q?zMdAXheT5yIHbiEb3a29bgakhhdhO4tt4asQdJJBhGghQHjE51dU9tOcLliE?=
 =?us-ascii?Q?qVWj/76Fee/bLubIVqoxs5xjAjkgjen7CdZ9hCftG9JcTIlGCWXOz/LPRdOd?=
 =?us-ascii?Q?kL1/DDtUsMovAwV5fpNJ842HYYGlRwip+kiXWNws8OArZdmzzQzjPZlN4OOM?=
 =?us-ascii?Q?0F4yEZzDZ9xlCvMeggBzAqrK7bCe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ndgE2Q4ywZ+o4mBFNMB/fX1kDCo0d4rK81r7ggM05cJI920moxUqJwSqgL5k?=
 =?us-ascii?Q?pSUlOFCmMifkp2+XeHXJKtDBSrfGKA/sWZ8JEVBJ3mkUCaho9EYBWZqrbpKh?=
 =?us-ascii?Q?AmKUpHvJVP0m47flJgh/ShRMnO/LxetTIfkYX/hxILEP6DoP+w0oJk5Cu1rT?=
 =?us-ascii?Q?of21+ZQIy2H9uD5Bsg8uJ3XhbW3r/2h7IBgUJR8zItjqnBnu3+mNZcK1nR//?=
 =?us-ascii?Q?x27uBae0ohsbW1iBysBFkOY/jE+pRg3XEnfnEg+/1Owd9z0Pjj7A1ZgXbVEd?=
 =?us-ascii?Q?AkeyRKQxHSBgzOvSD3yUu3gJSzihTt+6icLZjcVJDxJSlUq6Ai7kfMMaZIRk?=
 =?us-ascii?Q?YYIlrTDEsYHIpXzFbJWtVBVWtQzrncCL0WV6EckfaKt+ZWm+Z3RNWONneQsE?=
 =?us-ascii?Q?pqy/01oc2+fBcirI9rS0R089yZ3DG8SMK1s8jFNxtGcae8Ymah5PWLm5hj6S?=
 =?us-ascii?Q?OY65fOdzWP60KqhUh/CUim0bjPkEaRENhOFtWjxHirSQMtaT7QKmyl3yF2WR?=
 =?us-ascii?Q?4JVfOFORbicZVg+Q/xy9sKKm6ZSObjWYoB0YBEFxgF2LwSZVMTaGgYEWqIfX?=
 =?us-ascii?Q?cybCvN9QDtEN/81nGBwNPPhLw3x+JNt4x+YHPA5anmyX8IBbeuOFRfA0lu0a?=
 =?us-ascii?Q?+TxDHZKZmdstzs8bNnjmXjz6u/tKZqGgJ19ceo9BPUSOPZWeT4u6+uZZl63w?=
 =?us-ascii?Q?dtLnM/kR50syrhF11ZiO9+bY60kpbPoD6YhmS755AufEH9drpZ8qkTFL8M4C?=
 =?us-ascii?Q?bbBALONmKBwqffItaiIvH42ei8vDORiupaNalM527QwxI08GHvBExjnIRnRB?=
 =?us-ascii?Q?hiJF1NEjDYmma+pqZiAb1oo9fyRe+9M/Idtem+VHuXWnGYBTdfXkTUzwPOcq?=
 =?us-ascii?Q?EKZGB+85Tryqosd7CFp36NXO6xS0LFZUvkYE9SV1YHPtlR4wjelujQQtwhnD?=
 =?us-ascii?Q?mXE6AcaUvmmhmjHSrYbMs4Mioj1U4KFMVp8OoEaxLi7AvgCMJk/gp36d4IG/?=
 =?us-ascii?Q?7YXJK5h054sqr/JbcGtAGHSjVvCBBUvB+4UpxK5QqAYMAE8nhgf1qSiY0heh?=
 =?us-ascii?Q?mS2OgiXBI5fC6/9JF+8287WMMYxl2tXXnQ1pe9p1l+CA5zGHfdfEdNxhi8ja?=
 =?us-ascii?Q?5Y8YjbKWC+EmRUMinr41GmJvoxqbqrGwlqd2rY+eRqq4jbacfiCTmC+Iicxt?=
 =?us-ascii?Q?qv2xWA60a1wltOA67egtQss6wvDCjSXaYv6CezDksopAcR1dvYMcHiDmrtyU?=
 =?us-ascii?Q?3GLDgRwN3iRpNf3uFNPPrbMx/p3avorNONnqEVF4bwA5CEq0Ope5qI7s5wla?=
 =?us-ascii?Q?nRRiVoL6iDlIioiNQ7N9xyHbhuQj9b8+sB87+ZojbVL3SevClkXPJZ0OouPz?=
 =?us-ascii?Q?a7My/JcF2bf/xhY4cYtSzBnRzWDoNeYHihZgHXNE2DTCS6uPuOIv6Xy2IoAH?=
 =?us-ascii?Q?eTO7/JH7bHOXzWrRWy8ywdKbfbEfP5/6j5xXKQe7KQbkk9zwE6kR6WTIkp5f?=
 =?us-ascii?Q?s7Nolo2+XJsXoByY88A27CgXx03h/nPaNU17+8UCYY8EvXf9cNG4t1FeKPuT?=
 =?us-ascii?Q?fOvnJdMoHsw2R8GsJt6I7oTBk4DXcR5g2p27g3i9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6573b6d9-3df6-4e2c-b845-08ddbe8689b2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:18:40.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vskRhhAZSNbogvzjOp5OS29f7MooAOuvPmeFlPHmOH3DbRlEPCZvobvz0Ts7wIjedOAshO9zAT1agKTMugPfRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-OriginatorOrg: intel.com

--kZT1+G/Ncmg6dbbs
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   db494b13c593e578fed58a6e41f4c9df619180d8
commit: db494b13c593e578fed58a6e41f4c9df619180d8 [4/4] bpf: Add support for certain atomics in bpf_arena to x86 JIT
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: hexagon-randconfig-002-20250708 (attached as .config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507090023.F3b8lVbm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c:6415:7: error: call to undeclared function 'bpf_jit_supports_private_stack'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6415 |         if (!bpf_jit_supports_private_stack())
         |              ^
   kernel/bpf/verifier.c:7747:8: error: call to undeclared function 'check_load_mem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7747 |         err = check_load_mem(env, insn, true, false, false, "atomic_load");
         |               ^
   kernel/bpf/verifier.c:7766:8: error: call to undeclared function 'check_store_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7766 |         err = check_store_reg(env, insn, true);
         |               ^
   kernel/bpf/verifier.c:7780:12: error: conflicting types for 'check_atomic'
    7780 | static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
         |            ^
   kernel/bpf/verifier.c:7650:12: note: previous definition is here
    7650 | static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_insn *insn)
         |            ^
   kernel/bpf/verifier.c:7793:10: error: call to undeclared function 'check_atomic_rmw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7793 |                 return check_atomic_rmw(env, insn);
         |                        ^
   kernel/bpf/verifier.c:19477:10: error: call to undeclared function 'check_load_mem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    19477 |                         err = check_load_mem(env, insn, false, is_ldsx, true,
          |                               ^
   kernel/bpf/verifier.c:19483:33: error: too few arguments to function call, expected 3, have 2
    19483 |                                 err = check_atomic(env, insn);
          |                                       ~~~~~~~~~~~~          ^
   kernel/bpf/verifier.c:7650:12: note: 'check_atomic' declared here
    7650 | static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_insn *insn)
         |            ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:19495:10: error: call to undeclared function 'check_store_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    19495 |                         err = check_store_reg(env, insn, false);
          |                               ^
   kernel/bpf/verifier.c:20735:6: warning: unused variable 'epilogue_idx' [-Wunused-variable]
    20735 |         int epilogue_idx = 0;
          |             ^~~~~~~~~~~~
>> kernel/bpf/verifier.c:20957:1: warning: unused label 'patch_insn_buf' [-Wunused-label]
    20957 | patch_insn_buf:
          | ^~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21667:25: error: call to undeclared function 'bpf_arch_uaddress_limit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    21667 |                         u64 uaddress_limit = bpf_arch_uaddress_limit();
          |                                              ^
   kernel/bpf/verifier.c:21765:33: error: call to undeclared function 'bpf_jit_supports_timed_may_goto'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    21765 |                 if (is_may_goto_insn(insn) && bpf_jit_supports_timed_may_goto()) {
          |                                               ^
   kernel/bpf/verifier.c:22349:15: error: call to undeclared function 'bpf_jit_supports_timed_may_goto'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    22349 |                 int delta = bpf_jit_supports_timed_may_goto() ? 2 : 1;
          |                             ^
   kernel/bpf/verifier.c:22936:42: error: call to undeclared function 'bpf_jit_supports_private_stack'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    22936 |         if (prog->aux->priv_stack_requested && !bpf_jit_supports_private_stack()) {
          |                                                 ^
   2 warnings and 12 errors generated.
--
>> kernel/bpf/core.c:3119:13: warning: no previous prototype for function 'bpf_jit_supports_private_stack' [-Wmissing-prototypes]
    3119 | bool __weak bpf_jit_supports_private_stack(void)
         |             ^
   kernel/bpf/core.c:3119:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3119 | bool __weak bpf_jit_supports_private_stack(void)
         | ^
         | static 
>> kernel/bpf/core.c:3128:13: warning: no previous prototype for function 'bpf_jit_supports_timed_may_goto' [-Wmissing-prototypes]
    3128 | bool __weak bpf_jit_supports_timed_may_goto(void)
         |             ^
   kernel/bpf/core.c:3128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3128 | bool __weak bpf_jit_supports_timed_may_goto(void)
         | ^
         | static 
   2 warnings generated.


vim +/patch_insn_buf +20957 kernel/bpf/verifier.c

a4b1d3c1ddf6cb4 Jiong Wang              2019-05-24  20716  
c64b7983288e636 Joe Stringer            2018-10-02  20717  /* convert load instructions that access fields of a context type into a
c64b7983288e636 Joe Stringer            2018-10-02  20718   * sequence of instructions that access fields of the underlying structure:
c64b7983288e636 Joe Stringer            2018-10-02  20719   *     struct __sk_buff    -> struct sk_buff
c64b7983288e636 Joe Stringer            2018-10-02  20720   *     struct bpf_sock_ops -> struct sock
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20721   */
58e2af8b3a6b587 Jakub Kicinski          2016-09-21  20722  static int convert_ctx_accesses(struct bpf_verifier_env *env)
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20723  {
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20724  	struct bpf_subprog_info *subprogs = env->subprog_info;
00176a34d9e27ab Jakub Kicinski          2017-10-16  20725  	const struct bpf_verifier_ops *ops = env->ops;
d519594ee2445d7 Amery Hung              2025-02-25  20726  	int i, cnt, size, ctx_field_size, ret, delta = 0, epilogue_cnt = 0;
3df126f35f88dc7 Jakub Kicinski          2016-09-21  20727  	const int insn_cnt = env->prog->len;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20728  	struct bpf_insn *epilogue_buf = env->epilogue_buf;
6f606ffd6dd7583 Martin KaFai Lau        2024-08-29  20729  	struct bpf_insn *insn_buf = env->insn_buf;
6f606ffd6dd7583 Martin KaFai Lau        2024-08-29  20730  	struct bpf_insn *insn;
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20731  	u32 target_size, size_default, off;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20732  	struct bpf_prog *new_prog;
d691f9e8d4405c3 Alexei Starovoitov      2015-06-04  20733  	enum bpf_access_type type;
f96da09473b52c0 Daniel Borkmann         2017-07-02  20734  	bool is_narrower_load;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20735  	int epilogue_idx = 0;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20736  
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20737  	if (ops->gen_epilogue) {
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20738  		epilogue_cnt = ops->gen_epilogue(epilogue_buf, env->prog,
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20739  						 -(subprogs[0].stack_depth + 8));
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20740  		if (epilogue_cnt >= INSN_BUF_SIZE) {
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20741  			verbose(env, "bpf verifier is misconfigured\n");
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20742  			return -EINVAL;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20743  		} else if (epilogue_cnt) {
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20744  			/* Save the ARG_PTR_TO_CTX for the epilogue to use */
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20745  			cnt = 0;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20746  			subprogs[0].stack_depth += 8;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20747  			insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_FP, BPF_REG_1,
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20748  						      -subprogs[0].stack_depth);
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20749  			insn_buf[cnt++] = env->prog->insnsi[0];
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20750  			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20751  			if (!new_prog)
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20752  				return -ENOMEM;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20753  			env->prog = new_prog;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20754  			delta += cnt - 1;
d519594ee2445d7 Amery Hung              2025-02-25  20755  
d519594ee2445d7 Amery Hung              2025-02-25  20756  			ret = add_kfunc_in_insns(env, epilogue_buf, epilogue_cnt - 1);
d519594ee2445d7 Amery Hung              2025-02-25  20757  			if (ret < 0)
d519594ee2445d7 Amery Hung              2025-02-25  20758  				return ret;
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20759  		}
169c31761c8d7f6 Martin KaFai Lau        2024-08-29  20760  	}
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20761  
b09928b976280d6 Daniel Borkmann         2018-10-24  20762  	if (ops->gen_prologue || env->seen_direct_write) {
b09928b976280d6 Daniel Borkmann         2018-10-24  20763  		if (!ops->gen_prologue) {
b09928b976280d6 Daniel Borkmann         2018-10-24  20764  			verbose(env, "bpf verifier is misconfigured\n");
b09928b976280d6 Daniel Borkmann         2018-10-24  20765  			return -EINVAL;
b09928b976280d6 Daniel Borkmann         2018-10-24  20766  		}
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20767  		cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20768  					env->prog);
6f606ffd6dd7583 Martin KaFai Lau        2024-08-29  20769  		if (cnt >= INSN_BUF_SIZE) {
61bd5218eef349f Jakub Kicinski          2017-10-09  20770  			verbose(env, "bpf verifier is misconfigured\n");
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20771  			return -EINVAL;
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20772  		} else if (cnt) {
8041902dae5299c Alexei Starovoitov      2017-03-15  20773  			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20774  			if (!new_prog)
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20775  				return -ENOMEM;
8041902dae5299c Alexei Starovoitov      2017-03-15  20776  
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20777  			env->prog = new_prog;
3df126f35f88dc7 Jakub Kicinski          2016-09-21  20778  			delta += cnt - 1;
d519594ee2445d7 Amery Hung              2025-02-25  20779  
d519594ee2445d7 Amery Hung              2025-02-25  20780  			ret = add_kfunc_in_insns(env, insn_buf, cnt - 1);
d519594ee2445d7 Amery Hung              2025-02-25  20781  			if (ret < 0)
d519594ee2445d7 Amery Hung              2025-02-25  20782  				return ret;
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20783  		}
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20784  	}
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20785  
d5c47719f244388 Martin KaFai Lau        2024-08-29  20786  	if (delta)
d5c47719f244388 Martin KaFai Lau        2024-08-29  20787  		WARN_ON(adjust_jmp_off(env->prog, 0, delta));
d5c47719f244388 Martin KaFai Lau        2024-08-29  20788  
9d03ebc71a027ca Stanislav Fomichev      2023-01-19  20789  	if (bpf_prog_is_offloaded(env->prog->aux))
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20790  		return 0;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20791  
3df126f35f88dc7 Jakub Kicinski          2016-09-21  20792  	insn = env->prog->insnsi + delta;
36bbef52c7eb646 Daniel Borkmann         2016-09-20  20793  
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20794  	for (i = 0; i < insn_cnt; i++, insn++) {
c64b7983288e636 Joe Stringer            2018-10-02  20795  		bpf_convert_ctx_access_t convert_ctx_access;
1f1e864b65554e3 Yonghong Song           2023-07-27  20796  		u8 mode;
c64b7983288e636 Joe Stringer            2018-10-02  20797  
62c7989b24dbd34 Daniel Borkmann         2017-01-12  20798  		if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
62c7989b24dbd34 Daniel Borkmann         2017-01-12  20799  		    insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
62c7989b24dbd34 Daniel Borkmann         2017-01-12  20800  		    insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
1f9a1ea821ff253 Yonghong Song           2023-07-27  20801  		    insn->code == (BPF_LDX | BPF_MEM | BPF_DW) ||
1f9a1ea821ff253 Yonghong Song           2023-07-27  20802  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_B) ||
1f9a1ea821ff253 Yonghong Song           2023-07-27  20803  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_H) ||
1f9a1ea821ff253 Yonghong Song           2023-07-27  20804  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_W)) {
d691f9e8d4405c3 Alexei Starovoitov      2015-06-04  20805  			type = BPF_READ;
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20806  		} else if (insn->code == (BPF_STX | BPF_MEM | BPF_B) ||
62c7989b24dbd34 Daniel Borkmann         2017-01-12  20807  			   insn->code == (BPF_STX | BPF_MEM | BPF_H) ||
62c7989b24dbd34 Daniel Borkmann         2017-01-12  20808  			   insn->code == (BPF_STX | BPF_MEM | BPF_W) ||
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20809  			   insn->code == (BPF_STX | BPF_MEM | BPF_DW) ||
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20810  			   insn->code == (BPF_ST | BPF_MEM | BPF_B) ||
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20811  			   insn->code == (BPF_ST | BPF_MEM | BPF_H) ||
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20812  			   insn->code == (BPF_ST | BPF_MEM | BPF_W) ||
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20813  			   insn->code == (BPF_ST | BPF_MEM | BPF_DW)) {
d691f9e8d4405c3 Alexei Starovoitov      2015-06-04  20814  			type = BPF_WRITE;
db494b13c593e57 Alexei Starovoitov      2024-04-05  20815  		} else if ((insn->code == (BPF_STX | BPF_ATOMIC | BPF_W) ||
d503a04f8bc0c75 Alexei Starovoitov      2024-04-05  20816  			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_DW)) &&
d503a04f8bc0c75 Alexei Starovoitov      2024-04-05  20817  			   env->insn_aux_data[i + delta].ptr_type == PTR_TO_ARENA) {
d503a04f8bc0c75 Alexei Starovoitov      2024-04-05  20818  			insn->code = BPF_STX | BPF_PROBE_ATOMIC | BPF_SIZE(insn->code);
d503a04f8bc0c75 Alexei Starovoitov      2024-04-05  20819  			env->prog->aux->num_exentries++;
d503a04f8bc0c75 Alexei Starovoitov      2024-04-05  20820  			continue;
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20821  		} else {
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20822  			continue;
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20823  		}
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20824  
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20825  		if (type == BPF_WRITE &&
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20826  		    env->insn_aux_data[i + delta].sanitize_stack_spill) {
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20827  			struct bpf_insn patch[] = {
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20828  				*insn,
2039f26f3aca5b0 Daniel Borkmann         2021-07-13  20829  				BPF_ST_NOSPEC(),
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20830  			};
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20831  
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20832  			cnt = ARRAY_SIZE(patch);
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20833  			new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20834  			if (!new_prog)
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20835  				return -ENOMEM;
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20836  
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20837  			delta    += cnt - 1;
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20838  			env->prog = new_prog;
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20839  			insn      = new_prog->insnsi + i + delta;
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20840  			continue;
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20841  		}
af86ca4e3088fe5 Alexei Starovoitov      2018-05-15  20842  
6efe152d4061a83 Kumar Kartikeya Dwivedi 2022-04-25  20843  		switch ((int)env->insn_aux_data[i + delta].ptr_type) {
c64b7983288e636 Joe Stringer            2018-10-02  20844  		case PTR_TO_CTX:
c64b7983288e636 Joe Stringer            2018-10-02  20845  			if (!ops->convert_ctx_access)
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20846  				continue;
c64b7983288e636 Joe Stringer            2018-10-02  20847  			convert_ctx_access = ops->convert_ctx_access;
c64b7983288e636 Joe Stringer            2018-10-02  20848  			break;
c64b7983288e636 Joe Stringer            2018-10-02  20849  		case PTR_TO_SOCKET:
46f8bc92758c625 Martin KaFai Lau        2019-02-09  20850  		case PTR_TO_SOCK_COMMON:
c64b7983288e636 Joe Stringer            2018-10-02  20851  			convert_ctx_access = bpf_sock_convert_ctx_access;
c64b7983288e636 Joe Stringer            2018-10-02  20852  			break;
655a51e536c09d1 Martin KaFai Lau        2019-02-09  20853  		case PTR_TO_TCP_SOCK:
655a51e536c09d1 Martin KaFai Lau        2019-02-09  20854  			convert_ctx_access = bpf_tcp_sock_convert_ctx_access;
655a51e536c09d1 Martin KaFai Lau        2019-02-09  20855  			break;
fada7fdc83c0bf8 Jonathan Lemon          2019-06-06  20856  		case PTR_TO_XDP_SOCK:
fada7fdc83c0bf8 Jonathan Lemon          2019-06-06  20857  			convert_ctx_access = bpf_xdp_sock_convert_ctx_access;
fada7fdc83c0bf8 Jonathan Lemon          2019-06-06  20858  			break;
2a02759ef5f8a34 Alexei Starovoitov      2019-10-15  20859  		case PTR_TO_BTF_ID:
6efe152d4061a83 Kumar Kartikeya Dwivedi 2022-04-25  20860  		case PTR_TO_BTF_ID | PTR_UNTRUSTED:
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20861  		/* PTR_TO_BTF_ID | MEM_ALLOC always has a valid lifetime, unlike
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20862  		 * PTR_TO_BTF_ID, and an active ref_obj_id, but the same cannot
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20863  		 * be said once it is marked PTR_UNTRUSTED, hence we must handle
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20864  		 * any faults for loads into such types. BPF_WRITE is disallowed
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20865  		 * for this case.
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20866  		 */
282de143ead96a5 Kumar Kartikeya Dwivedi 2022-11-18  20867  		case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
27ae7997a66174c Martin KaFai Lau        2020-01-08  20868  			if (type == BPF_READ) {
1f9a1ea821ff253 Yonghong Song           2023-07-27  20869  				if (BPF_MODE(insn->code) == BPF_MEM)
27ae7997a66174c Martin KaFai Lau        2020-01-08  20870  					insn->code = BPF_LDX | BPF_PROBE_MEM |
27ae7997a66174c Martin KaFai Lau        2020-01-08  20871  						     BPF_SIZE((insn)->code);
1f9a1ea821ff253 Yonghong Song           2023-07-27  20872  				else
1f9a1ea821ff253 Yonghong Song           2023-07-27  20873  					insn->code = BPF_LDX | BPF_PROBE_MEMSX |
1f9a1ea821ff253 Yonghong Song           2023-07-27  20874  						     BPF_SIZE((insn)->code);
27ae7997a66174c Martin KaFai Lau        2020-01-08  20875  				env->prog->aux->num_exentries++;
2a02759ef5f8a34 Alexei Starovoitov      2019-10-15  20876  			}
2a02759ef5f8a34 Alexei Starovoitov      2019-10-15  20877  			continue;
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20878  		case PTR_TO_ARENA:
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20879  			if (BPF_MODE(insn->code) == BPF_MEMSX) {
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20880  				verbose(env, "sign extending loads from arena are not supported yet\n");
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20881  				return -EOPNOTSUPP;
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20882  			}
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20883  			insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_SIZE(insn->code);
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20884  			env->prog->aux->num_exentries++;
6082b6c328b5486 Alexei Starovoitov      2024-03-07  20885  			continue;
c64b7983288e636 Joe Stringer            2018-10-02  20886  		default:
c64b7983288e636 Joe Stringer            2018-10-02  20887  			continue;
c64b7983288e636 Joe Stringer            2018-10-02  20888  		}
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20889  
31fd85816dbe3a7 Yonghong Song           2017-06-13  20890  		ctx_field_size = env->insn_aux_data[i + delta].ctx_field_size;
f96da09473b52c0 Daniel Borkmann         2017-07-02  20891  		size = BPF_LDST_BYTES(insn);
1f1e864b65554e3 Yonghong Song           2023-07-27  20892  		mode = BPF_MODE(insn->code);
31fd85816dbe3a7 Yonghong Song           2017-06-13  20893  
31fd85816dbe3a7 Yonghong Song           2017-06-13  20894  		/* If the read access is a narrower load of the field,
31fd85816dbe3a7 Yonghong Song           2017-06-13  20895  		 * convert to a 4/8-byte load, to minimum program type specific
31fd85816dbe3a7 Yonghong Song           2017-06-13  20896  		 * convert_ctx_access changes. If conversion is successful,
31fd85816dbe3a7 Yonghong Song           2017-06-13  20897  		 * we will apply proper mask to the result.
31fd85816dbe3a7 Yonghong Song           2017-06-13  20898  		 */
f96da09473b52c0 Daniel Borkmann         2017-07-02  20899  		is_narrower_load = size < ctx_field_size;
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20900  		size_default = bpf_ctx_off_adjust_machine(ctx_field_size);
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20901  		off = insn->off;
31fd85816dbe3a7 Yonghong Song           2017-06-13  20902  		if (is_narrower_load) {
f96da09473b52c0 Daniel Borkmann         2017-07-02  20903  			u8 size_code;
31fd85816dbe3a7 Yonghong Song           2017-06-13  20904  
f96da09473b52c0 Daniel Borkmann         2017-07-02  20905  			if (type == BPF_WRITE) {
61bd5218eef349f Jakub Kicinski          2017-10-09  20906  				verbose(env, "bpf verifier narrow ctx access misconfigured\n");
f96da09473b52c0 Daniel Borkmann         2017-07-02  20907  				return -EINVAL;
f96da09473b52c0 Daniel Borkmann         2017-07-02  20908  			}
f96da09473b52c0 Daniel Borkmann         2017-07-02  20909  
f96da09473b52c0 Daniel Borkmann         2017-07-02  20910  			size_code = BPF_H;
31fd85816dbe3a7 Yonghong Song           2017-06-13  20911  			if (ctx_field_size == 4)
31fd85816dbe3a7 Yonghong Song           2017-06-13  20912  				size_code = BPF_W;
31fd85816dbe3a7 Yonghong Song           2017-06-13  20913  			else if (ctx_field_size == 8)
31fd85816dbe3a7 Yonghong Song           2017-06-13  20914  				size_code = BPF_DW;
f96da09473b52c0 Daniel Borkmann         2017-07-02  20915  
bc23105ca0abdee Daniel Borkmann         2018-06-02  20916  			insn->off = off & ~(size_default - 1);
31fd85816dbe3a7 Yonghong Song           2017-06-13  20917  			insn->code = BPF_LDX | BPF_MEM | size_code;
31fd85816dbe3a7 Yonghong Song           2017-06-13  20918  		}
f96da09473b52c0 Daniel Borkmann         2017-07-02  20919  
f96da09473b52c0 Daniel Borkmann         2017-07-02  20920  		target_size = 0;
c64b7983288e636 Joe Stringer            2018-10-02  20921  		cnt = convert_ctx_access(type, insn, insn_buf, env->prog,
f96da09473b52c0 Daniel Borkmann         2017-07-02  20922  					 &target_size);
6f606ffd6dd7583 Martin KaFai Lau        2024-08-29  20923  		if (cnt == 0 || cnt >= INSN_BUF_SIZE ||
f96da09473b52c0 Daniel Borkmann         2017-07-02  20924  		    (ctx_field_size && !target_size)) {
61bd5218eef349f Jakub Kicinski          2017-10-09  20925  			verbose(env, "bpf verifier is misconfigured\n");
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20926  			return -EINVAL;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20927  		}
f96da09473b52c0 Daniel Borkmann         2017-07-02  20928  
f96da09473b52c0 Daniel Borkmann         2017-07-02  20929  		if (is_narrower_load && size < target_size) {
d895a0f16fadb26 Ilya Leoshkevich        2019-08-16  20930  			u8 shift = bpf_ctx_narrow_access_offset(
d895a0f16fadb26 Ilya Leoshkevich        2019-08-16  20931  				off, size, size_default) * 8;
6f606ffd6dd7583 Martin KaFai Lau        2024-08-29  20932  			if (shift && cnt + 1 >= INSN_BUF_SIZE) {
d7af7e497f0308b Andrey Ignatov          2021-08-20  20933  				verbose(env, "bpf verifier narrow ctx load misconfigured\n");
d7af7e497f0308b Andrey Ignatov          2021-08-20  20934  				return -EINVAL;
d7af7e497f0308b Andrey Ignatov          2021-08-20  20935  			}
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20936  			if (ctx_field_size <= 4) {
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20937  				if (shift)
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20938  					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_RSH,
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20939  									insn->dst_reg,
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20940  									shift);
31fd85816dbe3a7 Yonghong Song           2017-06-13  20941  				insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
31fd85816dbe3a7 Yonghong Song           2017-06-13  20942  								(1 << size * 8) - 1);
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20943  			} else {
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20944  				if (shift)
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20945  					insn_buf[cnt++] = BPF_ALU64_IMM(BPF_RSH,
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20946  									insn->dst_reg,
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20947  									shift);
0613d8ca9ab382c Will Deacon             2023-05-18  20948  				insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
e2f7fc0ac6957ca Krzesimir Nowak         2019-05-08  20949  								(1ULL << size * 8) - 1);
31fd85816dbe3a7 Yonghong Song           2017-06-13  20950  			}
46f53a65d2de3e1 Andrey Ignatov          2018-11-10  20951  		}
1f1e864b65554e3 Yonghong Song           2023-07-27  20952  		if (mode == BPF_MEMSX)
1f1e864b65554e3 Yonghong Song           2023-07-27  20953  			insn_buf[cnt++] = BPF_RAW_INSN(BPF_ALU64 | BPF_MOV | BPF_X,
1f1e864b65554e3 Yonghong Song           2023-07-27  20954  						       insn->dst_reg, insn->dst_reg,
1f1e864b65554e3 Yonghong Song           2023-07-27  20955  						       size * 8, 0);
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20956  
169c31761c8d7f6 Martin KaFai Lau        2024-08-29 @20957  patch_insn_buf:
8041902dae5299c Alexei Starovoitov      2017-03-15  20958  		new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20959  		if (!new_prog)
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20960  			return -ENOMEM;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20961  
3df126f35f88dc7 Jakub Kicinski          2016-09-21  20962  		delta += cnt - 1;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20963  
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20964  		/* keep walking new program and skip insns we just inserted */
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20965  		env->prog = new_prog;
3df126f35f88dc7 Jakub Kicinski          2016-09-21  20966  		insn      = new_prog->insnsi + i + delta;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20967  	}
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20968  
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20969  	return 0;
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20970  }
9bac3d6d548e5cc Alexei Starovoitov      2015-03-13  20971  

:::::: The code at line 20957 was first introduced by commit
:::::: 169c31761c8d7f606f3ee628829c27998626c4f0 bpf: Add gen_epilogue to bpf_verifier_ops

:::::: TO: Martin KaFai Lau <martin.lau@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--kZT1+G/Ncmg6dbbs
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
kLsCAA==

--kZT1+G/Ncmg6dbbs
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # clang-21 might not be officially released. Try a lower version if installation fails.
        # https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git/commit/?id=db494b13c593e578fed58a6e41f4c9df619180d8
        git remote add jkirsher-net-queue https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git
        git fetch --no-tags jkirsher-net-queue master
        git checkout db494b13c593e578fed58a6e41f4c9df619180d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-21 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-21 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

--kZT1+G/Ncmg6dbbs--
