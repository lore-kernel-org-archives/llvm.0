Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0473E0741;
	Thu, 14 May 2026 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767649; cv=fail; b=k4PNWx0GDxFFxuXzWRDOcZHmXz0405aKmd9FqS3t+fBgnzbjACP3C440VM+79KXQhrYJRzkI9AC9tuSs3vSb4QfkeN04R8ztyr8F1q9xDeU++snfRHbz/vOnlBWul4/V9J5mv5Vv1wUShCr/OrGG4mEQb+9iRRcItdn06lESI8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767649; c=relaxed/simple;
	bh=bJk/ZOY365QfwAWNpInHUO2qV5msGDzmYFaA0yhUfss=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VFi8oqKuPSWhHXvP8RI1T1uV//PFJQayNxyNDQy7kU81Kx4DJI/XKxSR69mxvwCsP3M5BZKMALmhRUc+gre0FsDVXeDqmgmXGZjYg9WKRlfSG+4UGZz74sqsCDj82CJtFxHOv5Zsj6GQdvZlK0IJkuw3hef+v0E7RoWxOQjdI48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZxurffy; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZxurffy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778767647; x=1810303647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJk/ZOY365QfwAWNpInHUO2qV5msGDzmYFaA0yhUfss=;
  b=aZxurffy9e4I3jXNCcA+ibWfbm0EL9HUM8hegXXNf1tRfLhAK3atkgEF
   gTBtws01x1KEf1S9fehQkFFh6yePrPKI+b2pvsqgPem7Pv/ejVw5d2Iva
   kyz0/3L3s8gULMBy9a5XY/oeJ0XGTAgKQoH2dMRdRIEuwLXSRh+C27YBp
   FT1cVmjbdK6nHFL4+QiRntyL5pleYSA0fUu4S64Q7PieVvZ0cVaGdwOb3
   4UtTN3PWXfI9ZEX5tv6E3GFcdQZVNaHgdjKwNDD776I5EbV6ycyXNVZ5z
   bDsDBUX8KAoGhnq2t0mH0OagBS1qYxQvh9lLWXgKG6fEjEn9f2YJBymBO
   g==;
X-CSE-ConnectionGUID: 6/he1zi4QBa79rFfxW1fdQ==
X-CSE-MsgGUID: l8zBQ51cRHWYI/DVh4QfwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82277703"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="82277703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:07:26 -0700
X-CSE-ConnectionGUID: PVqoEpNLTuWRIRImtf5WPw==
X-CSE-MsgGUID: B9nmO/8lTkOH8ecKex6uRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="268742338"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:07:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:07:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 07:07:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiRzSwWiP23mCyJNmHcO1lwL19Bfga3dxiItqh4nFBwVECDvmO7MT7dzR3vGVFWCWjhJkzTY5qMCn5J+lp6OQH82DLv+qk2T8Uy0ckYkFbb5oEprjWYfvoW1L68jWiGwFpePHFqoptlL8j5pLvbnjfuyrLTfFwg1Ql0qaknME3VxUPLUpzZr9K+/wkMyhtXVp8Vdc9/3uD/fYdQBvCvxmsVHbtNd88JBYYs7NN6qZFRXzwtipf9ojFUnZ2T3r53fIk+kEkgur3xZxTLZ7G8rxQ0KRsX8RHXRa8Dr1mID28S4GnPnbX5oosFvAh6FpJrPSLqXQIlDfOQPNGX7654U9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvtyYE2FikZ53l3CyEFSIiZEdvY2LNZe0QErJQKPnLk=;
 b=SoGEl/vInjxz6bCK03kBgnunZB77L8ig9IC99YgWdSLrwnGng2+H8pSFzmuJ2FbvMx+yZQHLQRlGreG4Rfn2dUTbXYFX7lDWRedEykWrJH6r2ulmxL+x2r3GvDCGUvyfk6e120rH/CVi++Avrzj6v+mlNTOm5Y9vFL+rZD5KyhdoHPC4ZtqOlG32aH7okn4TvYl0yyWpLuZm1AC+q9H9xHK/ApO5keN01W5QBCFAz1LiTOfNuishlmGPwPfBOzTtpSU/7a1YAyFyvaSYb4r5pMFwR4iT223E0xy9rUC7ODLskCOK6oQVqYBaGo6O0vTX1IcK5CMyXEHaSCocYBVafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:07:16 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:07:16 +0000
Date: Thu, 14 May 2026 22:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: vmlinux.o: error: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_...
Message-ID: <agXXCWxV+a0YMO+e@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: a33d3537-2a44-40c4-6b8f-08deb1c21a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|4133799003|11063799003;
X-Microsoft-Antispam-Message-Info: o5EYYW2QjB+BuADRjuOy+rISEbYNDyxjxU7RXQD12T+LKhrPZ8c0UzGdaGEiNtuhRL4B2DPfuxP0xkVGrBwMIssvIKYZSNTrFT+Er6b2IQSL8wwa+pDGWVgN17GTnNg6MAeE7ECdzGwsr8BrlW9X1qqV3RyRFEUbc+GnhI9D2qKrCAcnIFBqLHBBOe5AQt3VyXOhigIABk+OGikxTMPpIHRWcXXOpqruUWKtKXYj25MkGMKulK0ANB9kM70P1g6JkojMtZ6vxbxaxNkkkDGcrp2yQekeO2E29uY8AE+bbh1Epa/Hzsab67kbfNNcWrcGSPkfm0K3b6FAy5ltXKQY2bY36O0WkBB63sQylWCxBMLat8hJ9Hm5QOJEYtkwmUNj73mgLP+uWzufgvcyyrHJ16pTu/hJtklrLS2si2WIKb07y2dl74kgCKPangiLXL4lfwhxkQgyfXM9ndRbJx5P+FramGzf4plyv1iuwsgnBZcYmtR2RrfZFjRNi5yKS7P0Ayiy9tyGo/UPiICvUuumqNyW2OYeuAo9pHZgUuq10auALw+Pt+b4WM5T9n9XWYxaFL22D71gK1s4EjCIejk4EhUJJrxHrA7no8Vbtc4QrnjYVbMwkGVJv2ElF57tsFgzHs9XHyqI0RQJv2wBYsUxdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(4133799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?npxk7eJTci2RJ6scrCWy1+pfKfgbBA3ExevaGoMonI0zxHdbTp94uucqBtbE?=
 =?us-ascii?Q?DS19gL1oET7y6lkYgeg9OuDab/EQxoauRGz7yUVncNTZJcLPHdwUHBVcyPz+?=
 =?us-ascii?Q?pXYvUXLEeOu7v7MBQjPkBRv7kKtRqCLUVABMgRcELJJfMmUKF5LwUZQJPX1G?=
 =?us-ascii?Q?2c7+KiPwQqB6c0Go3AQNqnnbO929AZZ7Ws4aYs+9lPc7EppeEbFB1RO7YYQb?=
 =?us-ascii?Q?AzGYvH6fzsLxcvYBQEGRHmkM+NQjYfKUU4aZN9JSWZnHd399WQuTTr3q5Ehs?=
 =?us-ascii?Q?IxPAZuRvA1jKbVf85ityWcD3aZyhcD9TginGx0/4CxRpSpENQnB98CtekAHG?=
 =?us-ascii?Q?s3zRV1d8YaptuI+c6MMKI+7JQdejOuOsvX/pGEy4E/JbM8PjL/uD0Pd2BQqW?=
 =?us-ascii?Q?qRemYefNfJicJ+D4ffgRTmiR6snZUZ57nJaiItdVj+cTm1JG0NQzsEjo1BD3?=
 =?us-ascii?Q?kECFicmVTol/XRVHzJOAJG5ZHMHjbi5WEwzZYPRz3gfHD90o73BSt/PUoYuY?=
 =?us-ascii?Q?C898R9R9JlZ3ARZoLvCwNC3f6jT9b+hmai3tsPTM5d2LLGGa3dIs96BbE1YG?=
 =?us-ascii?Q?eeR2Ub39hfhf0V9RlFLyWSc9PjGiCjmo2Bxyomi74G9sX/cjhdFraBh8C/rh?=
 =?us-ascii?Q?eVcH2Y60XaEhUn8D1KAe38vfK6bAnh8bwn14aRH59BP89phinsNT5yC+68Xd?=
 =?us-ascii?Q?lalEF9c9n5N/hn9Uz6EV8fYB+oXYViA5dZcK/zv7XR5gIDpuiWZglqDo1hSQ?=
 =?us-ascii?Q?NiB6Isitu54t8vBCyRYducX7cKgVomvsqRTfntoTyxw7IY+O5dOrwdz9Orzi?=
 =?us-ascii?Q?zeaJejKO6KYjuh9Vwdd+slQl21saDm1wS/d6A5EXVmELD6foA99F38BbCM01?=
 =?us-ascii?Q?WqmaN2zxFIXPH2bPQaRx7b+zeOd5DcsYEFL4ZFxxwKCxMlga+BPPrHqqDs0/?=
 =?us-ascii?Q?wUab005ds8/qiozr1zBjEYsdkEybfe1GTRHSe5drBEwbEFfRXcpejDJT5vR9?=
 =?us-ascii?Q?5Zu1zyZCby9BEsoqhcohzg4+QAs5ONN7njtMj+LsdC4eBJaYa9+fXdlnwZSa?=
 =?us-ascii?Q?wW8kXH9eQ8/VEHP7b2+9tVDgduyDUiCus0fwUDsrRWaXHFhhjHJ4J04N858S?=
 =?us-ascii?Q?ys6TIbxdTXwyQ+UB6sfvPmzbAZqeuyMGZA4zLavRqJIq6i4NP8OrlE5Z4U/Y?=
 =?us-ascii?Q?+aS8ZcossgRk/yhWmhCXGCQ2KhE78cOd+Tpwz9hrG2hMYM6rwbTEgtMGPSDk?=
 =?us-ascii?Q?2hNyp6QFGX4Qi5aJK8epwQv9EYg+CqF8mf0psUstWBBdNJGFSnQvPhAr8g4d?=
 =?us-ascii?Q?qU9RP1dAM3BR6gnwc7r6nqqm0erVw7vyh4sDQR3vF05lLpYLM1t0mFJoLgRT?=
 =?us-ascii?Q?1edOHOTqNl2P+oJFMRO3tiqoLh8Mp+/JOnQdr0cGC04F8BgI+Alr7aGQ3FQg?=
 =?us-ascii?Q?D8uY/w+IRXOmJA/pcU/bLLZ2Y4Kxez8wp4bwnUMOI2CIsLUOpfBCLU0i7oLO?=
 =?us-ascii?Q?GfoRkBY2XFjSEHvWKSADOyMNU4rgUjfcNhtEyCN8U5jscUBz7S7JzgkXzbMg?=
 =?us-ascii?Q?8g5WX3d5DffcUwkd3njMKJmw5QxEw5YWpJCKQdhhd875ayanEcA4PH1n5zxv?=
 =?us-ascii?Q?YGwnZbPeDjMur2mty5nU+obIjcg5azqu6XeYQHEZbes/Fjd6bdG/TKxf3YeI?=
 =?us-ascii?Q?+9lCRuTEP9XoVT2SYqsp1HokuAGHbtlT2TCeOy6fU4H80tDTAIo8vbob0qTp?=
 =?us-ascii?Q?YRUAckYjAw=3D=3D?=
X-Exchange-RoutingPolicyChecked: ti7TyPIzP6qEb+YPcsZl0YpHlNUc035Ux55Zm4qdWINBe+vXPVWEIM8GWuUUz8RvswfRx/KhGPdnQF++FuD5BsJBafkV1QoDKi1E86w3XL1t0XKyCiO+bNPrj55srx08pIPyaVYgZ9RvC/PK7ZFJ5Ty/iDg8taJkOswKJKqFHk84IU1Y+tnF6vzBfD6Ja25ahWX54ykA9U+zqLhKbSKlhmLo/YTWiJzV7rQeN32LeS/LpF+0j3pvHVqyM+Ctv4b1Q1VLDPKi1e2iOh8SBYIKQCdzuKk8QFS4wAUgijCrn8FUs6czmw24bY6gE/31nRvXTKPzKH8WZgJqlVoHPJ7uRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a33d3537-2a44-40c4-6b8f-08deb1c21a41
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:07:15.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1SkRZs7RxctqE/gAVzDb/rKXQ/1/Oue7ctpT5hTcWXY9xe9BijiMF1NaSCUl7cL7eeE/GZVz9g0G+wMemIgvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: 2058f6d1660edc4a9bda9bee627792b352121b10 objtool: Refactor prefix symbol creation code
config: x86_64-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260513/202605131123.XNjFovyZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131123.XNjFovyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2058f6d1660e ("objtool: Refactor prefix symbol creation code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605131123.XNjFovyZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: .altinstr_replacement+0x162a: redundant UACCESS disable
   vmlinux.o: error: objtool: _RINvMs3_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs57PXBekmiam_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6OpaqueNtNtCsfd3uB5I4hpp_8bindings12bindings_raw5mutexE8ffi_initNCNCNvMs0_B8_INtB8_4LockB15_B3Z_E3new0s_0E0B6b_B4x_EEB2G_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: error: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: error: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10ModuleDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_0B27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

