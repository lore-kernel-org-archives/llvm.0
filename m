Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF020E334;
	Sat, 11 Apr 2026 00:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867724; cv=fail; b=j1DKRp9Q22vILvcVOKyaWFKfl/plJobEm5+MxrC8cBoKfbFyR2xeinhFafsMx0xtpLhB+uB1YRdmMXGAs3HPsHy4DVTlH156YIp9aDWrGTjfWtxZC59Z+EMRh8L50v/59vpTGf4KtaizaAT2Mbd5kfosJkM0M4FUJB1ytRl6V/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867724; c=relaxed/simple;
	bh=/WXim8KKS1r7MPoRvxmAHCwgKYQOnLTV043azX65WgE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZlF5SZ8maTGVA/1d//4fADuwxFCq7gQRxoKc94M6GaQgQDHKdByRQ5cEv3rpdGh6AmFg0JDl2sYm7dI1gT30yl+9yKiMXBZrQc40S6RCTU3CGnLfp5wgj6PLGP8IcUdGlE+u7q6HW7RDP1/cF5n31K/Lvh9Qxn19HBTdCutXXg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WW3gdS9C; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WW3gdS9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775867723; x=1807403723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WXim8KKS1r7MPoRvxmAHCwgKYQOnLTV043azX65WgE=;
  b=WW3gdS9CzLF7GOidKrtfcXsEW8LC1Lzuqg6qbko4vsUt+YidLHA/K4I4
   LzYBRfKv716j372wU8bNIQhaBG60mkbSTnIqRNO4HP94pVEZY/iBPVsFE
   lEgqCf3DcuBftvPexmF8CYdmT5DYKLjBdOBkOXd/tXpe51EjMDxLolOtY
   P2CqB86fUDbfYscMrmbZcwbZ2risMCZN2l0EjaVtg5EBorHwFDMy5K4Sx
   5eri2fVeyIVC/CdSPzmaVNlIKagn0ll3wQX3ZfdoFF9oSUVxVNpDDZkEt
   07cczHRJNXQQUTXtmjUToDQU2EFLhDZoQDKvr93EIb5ggIdxsO3ey3tox
   w==;
X-CSE-ConnectionGUID: 85kKVZglQiiojuOb8CCa4w==
X-CSE-MsgGUID: BtOLnKS/Qe2uyLDwiUJX5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76964048"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76964048"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:35:22 -0700
X-CSE-ConnectionGUID: TxmjcNwKQ6q8N4BB7euKlA==
X-CSE-MsgGUID: LHIVTvQfSfinDrWrzy/vzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259711134"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:35:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 17:35:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 17:35:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 17:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa3og+xd9vn99GyFPFv0PMBMKL3+lnL4Cy06Xy0RecR78IXlAw7dlFfi0Xhv78IRkIoV90xiH5Lc7MyE/PxT7lkjHWPUK29bGilGq/pXwbhpIblw0+X0X7NdsglCh1wyvRp3yucBXc9nMiblQqY4vT0LkrIzhRwmKLe45ThNkVOoX7+MYsQlljM/5gQIx/nq3vDEta/jbzaYPp+Xd5VqPkWyf5+qkL2HdDdgBFX1zXhPOdcl9/A3Uuc7yrta50USp2nDh/sH3bAOC8BGRxl2iyh40VPK8EuzyMMxAF9AXNYs9YorzZmGkRCdyqWshOWd+9FDmldawd/Vi5bFF6E9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn5E0AqXStnJyi0QD1hYV7TUeA61ZJ1CbvdW4IsQPPw=;
 b=DCNB9BXx+0Wan402uo+emsxxSyEth2b0vOMXVMHsHgFu1mrLJmuKdg6HLkTooVgq7c+vjDM9g7u9zr1PBd314rszqvFBfd2HG0bwVwtYI9lc/MmWqXpeJ5SOKycqvOyFPUzDYFnZIff1xldSxb8QtKx6i48i7AqPTnJA+bkfiJdriRymj/29/0SA9pAG21nt3AdXo28BRGfVaEs1fHNPwTquI+dqwJBcuCekSWFg3illUBCsL/Vdbrnycm9uxNUe3CAuLPlGkAzajuzobmjquy3s0qTPX/nWEB6BmzWAjuHB96+TJKk4B++GwtoCEE3GpStg7Hum/633VR5nG1IsYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 11 Apr
 2026 00:35:13 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 00:35:13 +0000
Date: Sat, 11 Apr 2026 08:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [bvanassche:thread-safety 89/94] drivers/block/sunvdc.c:1124:2:
 warning: releasing spinlock 'port->vio.lock' that was not held
Message-ID: <admXOReMNLaR6Va3@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a1931b-e39e-45f6-3dca-08de976231da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: JNzD7N0r4QKYLXQxVkhnipWU/Z2XZpEPiys2NpZx2fj+hFXVObei6GEle9ymaJz8rATNBb+ffQ+GnQMMHVL1x4BWNcK+nJmcnOfmsRIbh6NsMvH2dmEw5hWHZvUGaouNKAwidzHzyDhiSpwSmUZgYZHgpnJRYTqfMS74w8wS/ayRJX5wDHUf6e+zeH848a9ZdsucP+6k45OKOlVHQqpeacrEST8dL0aCrY8CnaPr6ciUWamCmNicVMPL0raTmh0+OExF9TYSh2iT0Tzn/zrHkV0x06lt3CYGZ6UZ7O7NILozWb8uNIVmv64rOTXaK34l/Utz6THPrIXTem9SGAbdGb1YQIJ6Y5RZ4l+/mlRaouWy5QIZdpP6+zJkR+0KKYhH86oCj0+V6bbnSlHRB0WmAfw21a/F+8LWmRUFr40sKWcEnNcGUxV4b0ouzZfcCis+W7yFxMYuG+q4QxFhQvL5sDvISOQb9xSzMa2+zjz9aA+VOn3xyBb6xSLiz+bAMZk2KUE5JqCSlpkGt9RSUtU9wbf5aPvE1cv9ZvdAy1872z5ROsKTBite52c24zqiyz2Npf5NkIQSKNiUqcZF3B0ABsqyzM225xwylpR0wk0MvslqMEFnX3h+fd/9WvyMqOFlDlYbfkHpGBrarMEljdyvs4ZsBRZBcwVc0ghLVE5cOz85s7SNPhoEFHhxQice2De9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K0iDRrKGpRe/WOmvZ0ESW8cjw2hXcRpHrHm1Qb72XUIBSolwts43NdEvE+oI?=
 =?us-ascii?Q?Jgz+fLCqeURVpucAgan0UW9EseWnVfKEApDWgA4NMNiH3XM6jnAkVFAgNz/7?=
 =?us-ascii?Q?B8NQF5HbhATcfJ5i+djJP42pt6XJPjXVBtj4unw9Fr9oG3Ag7gY6mpa5VWaW?=
 =?us-ascii?Q?E7jQRPQMaIdCsEB9s4J+v2obhSaixZ8OYYpb+5t4BO4IT3Ua5/TSw289Q9TG?=
 =?us-ascii?Q?uAXJlHVZlWlUOgICOBODhS4h0MQYJPHdA5Qq4V1oN2Lvq92Syx09Ga0BWp4I?=
 =?us-ascii?Q?rvwLLJPsnNwV0ik+U6p94pbMjPfXKZYpnOWY8c6WsZjXWTrGw9dkQ/3uWm/v?=
 =?us-ascii?Q?O1kw6vV/3v6fb8P6ezwylHRp0Ki6UXKsDIS6xggv8Mw7N40ZLgu6hWcHLuBO?=
 =?us-ascii?Q?Q4J9ks6IpY/RNXcwh55fBlCt7PS4LTRrzq5Isiyt+YQml452sgWlak1RudNr?=
 =?us-ascii?Q?XLOWJ+8Fz2vonIXO6AGl7rg8BHlUhEVSdZqiCpmjvdSYvLCXZU2BVTOViqhB?=
 =?us-ascii?Q?4DCrW+cra4NGyG1P3j8Wes2dcbVq1/Y12epKJ9xMtgCf9iA4T8G4vPWsPNTQ?=
 =?us-ascii?Q?osgulBfJ8bjnTyLCLxytYJJzqXG6k1udqleqdNTj+yPv0C8MVSNrCC3Jbk40?=
 =?us-ascii?Q?TaB+aIy7hQyQ0NtbBMakENIrHBaeJjx1FrgQq4YZC6U9m6E6E5G8vIuxsyNp?=
 =?us-ascii?Q?cFQyonEsrmyuR2vxqfxIEC0xP1AA523MtqTxoQSB0hXjwMrjwRc7m0cOoH8Q?=
 =?us-ascii?Q?H42WfN5mFO+MnruUqkDaXTGcCSpXQbLG+rGHPUb1ujhmd6Os2kv0cFvvQ+cK?=
 =?us-ascii?Q?eWtjZQGVpeLMLVOoQ5GPjI9aC8fxi6bvfJYH8TPjnt5aZ4KpRIrU3jtAjv9o?=
 =?us-ascii?Q?1N4xLvuspE9Vgvd4AtkFiAwEaxSqjr/5f1+UsCjBpVg3FSkSsRA/eTB8QdYs?=
 =?us-ascii?Q?A+y/cpHIQ1ZbJJlIaGLZB12oZ99abOOnsd1BKTiI3wWZ+//16X/KHnLiXjPc?=
 =?us-ascii?Q?/T1hnWvozq4dWZx3ctoRs2ZrFLgyv+Y8l9xw6MWEJSYElfhoU/Q9qcoNLSBp?=
 =?us-ascii?Q?0ITJLTp8+cnN7bD4QW8k4vpDMNR1sLOdeKIQ1fiwp2wxbHrkJAo8RPJ/x6PH?=
 =?us-ascii?Q?LkteONpAiypbL+SklStu3ApYdpiteFjRlqalsXfcHrIj3gyLAL9kTtXny8j2?=
 =?us-ascii?Q?Z4hj3vv2IDyuNqajvmuDaio30jDXRRwAybL4wj8gePaaYiYy92y8cPn420Yo?=
 =?us-ascii?Q?Y9CxhmnpTHJHFDXl5PsTOWbqFYHCFTiwGVJwUXD0Jsy7bDxsAmyXI9nmykrj?=
 =?us-ascii?Q?OXT0sHsEHrOtMIjtFuozXyf7vmGj07qycBXx3hrrwjrOd3SPQCImEVv0fK2j?=
 =?us-ascii?Q?YIETsyfFWHV6CDjO7xmhboSgs7hYUJSJ+Zus4QN7KoDYLICNtoAawIfzizsH?=
 =?us-ascii?Q?5hyMJRe8ufOgWsA0pr982h7C2vbh8GFfxG/ReGnBhFezDGyiQBi/hA6IL86L?=
 =?us-ascii?Q?QvbIYdTnx1CiGXwO+7YwHw8HvJ/DdgzsaujkmzBK+YKuvSc4blJeRu3ftOLn?=
 =?us-ascii?Q?zc7/X5pax6svkCW7OivHIjt/5G8nzSNmVubZrnDnXc+E9B93r9+6xyLI6W/Z?=
 =?us-ascii?Q?AfkSSp8GoJW9WWMiL9edoyxeOACg4hyJlYHIuIS1FFRj336zTrtW2Sezcv5R?=
 =?us-ascii?Q?hzxGfYgib4Lc2S57iKTMxPS6CrrMwm1rETukVx8FnQMuk7kVlA0q9VaVosjE?=
 =?us-ascii?Q?O+ULUjLRAg=3D=3D?=
X-Exchange-RoutingPolicyChecked: FkzHKH1RNNx/O7NkcXx+hpj6EARTMS657Tdwf8b2qdRkoV6d9V9p8pj3KhyN+zAXi6f1uOHJfbMj7h+HoHigo49cSJMVTf5LTAvZ5JiHQER8GI9jDaubaXLWt1xeehFEsh9oxnTTa/FFDqG1UyC3eqgf+M7VuB263Tg4EsyqtRM+XenXpL/sXgFvt0e9A/gsMojjQWGAk1MTWRVHj8Yyp0VCJs7AOiyrqJH5Rsvvz8ApXR0gOh6b1Weic7BO4EMHmIrzAkgM7aEIl3o8NCyM0WK3+pyb0mmWEr10Vet723lLs7XJTkhn24rFESXfrr++Xs4RxOVw0e0dIn5Gv2Lb0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a1931b-e39e-45f6-3dca-08de976231da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 00:35:13.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCiAxSEE3x4p4ZfggLB0agN6fdQPB2jkX/IUIlfLeYc/NMAian40rQYt2VMSI6eSyWsveOF7gMFz13iqoQInEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
X-OriginatorOrg: intel.com

tree:   https://github.com/bvanassche/linux thread-safety
head:   c7cad077ed44c1b494c41ee8f1b368e4f0f61c59
commit: 5266915d6dffa5b63bd017892258762fcde34657 [89/94] block: Enable lock context analysis for all block drivers
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260410/202604102249.9uYKbva4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102249.9uYKbva4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604102249.9uYKbva4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/sunvdc.c:1124:2: warning: releasing spinlock 'port->vio.lock' that was not held [-Wthread-safety-analysis]
    1124 |         spin_unlock_irq(&port->vio.lock);
         |         ^
>> drivers/block/sunvdc.c:1133:1: warning: spinlock 'port->vio.lock' is still held at the end of function [-Wthread-safety-analysis]
    1133 | }
         | ^
   drivers/block/sunvdc.c:1129:2: note: spinlock acquired here
    1129 |         spin_lock_irq(&port->vio.lock);
         |         ^
   2 warnings generated.


vim +1124 drivers/block/sunvdc.c

76e74bbe0a38c6 Dwight Engen      2014-12-11  1113  
76e74bbe0a38c6 Dwight Engen      2014-12-11  1114  static void vdc_queue_drain(struct vdc_port *port)
76e74bbe0a38c6 Dwight Engen      2014-12-11  1115  {
fa182a1fa97dff Jens Axboe        2018-10-15  1116  	struct request_queue *q = port->disk->queue;
1e1a9cecfab3f2 Christoph Hellwig 2025-01-31  1117  	unsigned int memflags;
fa182a1fa97dff Jens Axboe        2018-10-15  1118  
fa182a1fa97dff Jens Axboe        2018-10-15  1119  	/*
fa182a1fa97dff Jens Axboe        2018-10-15  1120  	 * Mark the queue as draining, then freeze/quiesce to ensure
fa182a1fa97dff Jens Axboe        2018-10-15  1121  	 * that all existing requests are seen in ->queue_rq() and killed
fa182a1fa97dff Jens Axboe        2018-10-15  1122  	 */
fa182a1fa97dff Jens Axboe        2018-10-15  1123  	port->drain = 1;
fa182a1fa97dff Jens Axboe        2018-10-15 @1124  	spin_unlock_irq(&port->vio.lock);
76e74bbe0a38c6 Dwight Engen      2014-12-11  1125  
1e1a9cecfab3f2 Christoph Hellwig 2025-01-31  1126  	memflags = blk_mq_freeze_queue(q);
fa182a1fa97dff Jens Axboe        2018-10-15  1127  	blk_mq_quiesce_queue(q);
fa182a1fa97dff Jens Axboe        2018-10-15  1128  
fa182a1fa97dff Jens Axboe        2018-10-15  1129  	spin_lock_irq(&port->vio.lock);
fa182a1fa97dff Jens Axboe        2018-10-15  1130  	port->drain = 0;
64b48ec36dbed5 Stephen Rothwell  2025-02-03  1131  	blk_mq_unquiesce_queue(q);
64b48ec36dbed5 Stephen Rothwell  2025-02-03  1132  	blk_mq_unfreeze_queue(q, memflags);
76e74bbe0a38c6 Dwight Engen      2014-12-11 @1133  }
76e74bbe0a38c6 Dwight Engen      2014-12-11  1134  

:::::: The code at line 1124 was first introduced by commit
:::::: fa182a1fa97dff56cda742f22d17d666420cd27f sunvdc: convert to blk-mq

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

