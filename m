Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C91710F1;
	Tue, 31 Dec 2024 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735635486; cv=fail; b=t5NXTMYLfn/qZf8Z11MUbW0k1gCHCjwqakYP6JvWgdaFLlgiU888YQ/BNV0CDICVoY70XlQZYM0gl4BMRXKP2tFA+H5+7NRzz4Yd4xH9HXm0NZm+ShmmLPbomllf+fg+l0CZY1c0cvIrrBXFdUUARRD0pOANcVRVBhAX1WOJRes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735635486; c=relaxed/simple;
	bh=EArPBVYOZevnqERrHrBA1hZvj0h6f9n2aSrFZNsqQ1Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bss2wBAn3iFHA1qJcpzkh6qsex8XmJifkuUIvGR53SLclBvZn9ezVrfuqyp8Ph6Eb1ubclB8rbMuuKpEviHPKZhi2Ff43Yd8oSBCm4U0M5JPvjhexr9N9cIvaN/irFThlC5TwPW9X7pee58BDRzxwTyK2XMmVoXThqtvCX3Ul4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgY5Xk+n; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgY5Xk+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735635485; x=1767171485;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EArPBVYOZevnqERrHrBA1hZvj0h6f9n2aSrFZNsqQ1Q=;
  b=QgY5Xk+n7tM+P5QeMJyl3A7+R+sl6kmkcagCgBLQyq9dKsmlan1qYdyr
   mPlzL4BJyXQ5+BZ3jkBT8p80ycmBqUv6V0MiNQLPqBdxGsDOv2JlBU5tv
   SN6qhzhvMNNrGf9KjCa5iiMwSGxfsscgKl+i7YguU1Rl/pdShhWfvKn31
   10T3QEuSrT8i/1XfnHPQiJ1RVOFjX6PiO7yD3GkLJJCT1jd2Yfe2+u6kk
   8WP7tJ8ki7og4l4D181kz5cLq9d23hQYfiOQT0sMZqY0q+IRfVO5ohLZc
   EhnQ0Il3/55Ioy8X6qG/h0cnUYHxDDw4vMdzMEG+rLJi+FELnkNkH4oW+
   w==;
X-CSE-ConnectionGUID: AD/69nF5SCaXmucv1r+Crg==
X-CSE-MsgGUID: 9ZW7wn1dTZ2hptq9o0XgxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35799306"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35799306"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 00:57:59 -0800
X-CSE-ConnectionGUID: gJ8OVMwDQiOEOCrBz8+HCQ==
X-CSE-MsgGUID: 5ZKTMMFVSNenDffCBOoYOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="100870248"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Dec 2024 00:57:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 31 Dec 2024 00:57:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 31 Dec 2024 00:57:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 31 Dec 2024 00:57:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDOtD2xbsG795py4GM1cWGcXOuxJLSrjvS2vvzlXvyABeyV0IWyullFI86vtbEXKHuy5FinLU6B72rfdv1BpKAUeZ6pedvdPU+BxAY6pDwd5B1V+7fuxuBxbTK60JYTbDR7ZygyTHYlyIjrdJaRnA8utOTwqLhjNvwOdMwHhweOrCBLMhHWRclM8i6xT3lVotKP2lX39eqlE75KglPaIC92hnghmIGoLxIl8AA+PWoMAN4k/5ZHHd5DZjNPOWHczb8QcsJkXUc+7n7e3sVh6oiTrHVLi6aHM1M/cTxMcubefuyMVE6DguIHJm0wIjfzzhmxtc/jQmDNnqIA0MH0ZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNddJv2m5wlKBw67itHEtABgwfwweYWy/bncjyHz2dI=;
 b=LjC+1af4nSUNkbM2GrZQNC0tGFY4rR7NuYqpdfkb1Bhmk5nAsXwYwT0JB1YZs62EqxbO9tPiaof5TPYQ5KFQHAS+inhgDUwE8D/ps00WhIZYrdvTTHWJbEMh0+jVrURnJVH6u3m1XIQTx82HRcjW9JiJgWdF0V17uRxux2wDxf+B/P2U/0/3VYO/Tsj+kYxedAZNAqKwq7PoV+0dHe0JYxupzxuSMj5AIvp77gJ3B7F1Vrptb1BrQnUh4VQ833weZC++UM4hXf7e1J2Ti37q1hKdoVmg0KnOiNiPphxnzdWVi6jRqRh59/aV2fT7ZGWL8OCVm7poM7WZtEfxgEziGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 08:57:46 +0000
Received: from BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f]) by BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f%2]) with mapi id 15.20.8293.020; Tue, 31 Dec 2024
 08:57:46 +0000
Date: Tue, 31 Dec 2024 16:57:36 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Alice Ryhl <aliceryhl@google.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Steven
 Rostedt (Google)" <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: error[E0425]: cannot find value
 `__tracepoint_rust_sample_loaded` in crate `$crate::bindings`
Message-ID: <Z3OyANq7fAkCs+Qi@rli9-mobl>
References: <202412311507.14xdiaIX-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412311507.14xdiaIX-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5420:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee610de-e735-4db5-2830-08dd297931bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MoDUtIr8XxJHzA73XX89fquAQO3d/s9VbzU0uh9ENYrJ5JpcDOvSzA/pBpuy?=
 =?us-ascii?Q?BcOt8E9AuykIWTTDX3rl9kbtB5iQIWgS1iwITOkN+6Kqgxr+RVyYB09LItK1?=
 =?us-ascii?Q?g8EyG12djZZ5ElwX+bQnK79hmmeo9KhwryTpfOJo7fqIhbi9KJ4DirPpC6tS?=
 =?us-ascii?Q?fzha4tUnfMYkBYewHEchUy9ICmHKxLMWBFp+6lKADslm6g9koTktSYRH+G9u?=
 =?us-ascii?Q?wL6Js6svmw6BcyaHJmsgPRrQKXUC8vOZlbVX+5yWzcMgbO0ZVjUNcircnqYE?=
 =?us-ascii?Q?vHNzofYtjFp12qoT+zbQtehFTpUJpvZv0CHbtWdi6YCtu7b9ud2ASuwsiwAD?=
 =?us-ascii?Q?ROFaAokTYSvs8p7jYC128OXxhJNVMap1fFL9ZWTvIOD/K09p7sepmE26bZJ0?=
 =?us-ascii?Q?fTEDdV1ysFvpMYh7roAzwFff4IPqJoFpbsxm9gX0M7SUUcqdEuN9uM8tDZwn?=
 =?us-ascii?Q?1HsoaTumUs6QMArqNihH1cMuvYXCkRy8A1fX30Nr1hocQeIQhHsv6GdugZ/W?=
 =?us-ascii?Q?FGKuAbsqaXyMQmz0p/tadAVBQAaAwCaM3sUQk4kpy55TxVNAFuQ923WrIzMg?=
 =?us-ascii?Q?1/t9v/jelApfviLhzH0xZHGhAOP1CKvWZ2zTeJClZoEYnOhqPzMsFMPhgYR6?=
 =?us-ascii?Q?TONu/0KMpdo+GrVYvlE7rrBGSVyOLsdoVByfRTmPY3iD92K/PJhilBbDApUL?=
 =?us-ascii?Q?5HGmN2M9RbFfDroVDwF+ckPRDlC1h54ZM9BywdxfVXRTUha6SFHXpHGdOfzJ?=
 =?us-ascii?Q?Y/omdlDbcvVkrLgxCRFY5UB/B8ePOz0jFUg8gJOP3jkvcxJaOSb26V4DNrP9?=
 =?us-ascii?Q?CgnDFMN5xL8eLfh19QAcggjc9PURn96yWzP/t+gNOg75D2QkUqg7rbR5rpmV?=
 =?us-ascii?Q?KyAnDXdk+OHwQtrlMep5FlQttbI1F1YSgFRvDGzEvrEVoJ8vwz4gIOvk1pqr?=
 =?us-ascii?Q?yB0/lMhaW+mUSGkU+BKDQjj7ZMyGLCoeaFi8iLqhJSk9e0wSQSbBbe4r7F67?=
 =?us-ascii?Q?Fja/OfkSa/x2DT/6IvyMv2RAgLNxA/8TtLLDfF9jk4PizxoOkzQRsUTFuFsq?=
 =?us-ascii?Q?/SeF01cV7OFk517iu7gvO58/fGwUuFNu/Zb+YOImEJgnbEpCWa1qBVM4BQG3?=
 =?us-ascii?Q?9uGjsuM60qNY+Ms6ymS886NJEfGESRJT7covhdmKqBj62d7eYdfJNYdE1p0E?=
 =?us-ascii?Q?fFnDgxLKdqtT2keRVoO6m9NXmJwY/QrF37jsEBuGsWnbb2WO/30t1EPxA8F4?=
 =?us-ascii?Q?fLXH9y4Dft1SwXwauSHQKqgQeKTgQsx9gzUIXYsPKihNy3GImr8RHZzCT31n?=
 =?us-ascii?Q?4tCPl91cUkAwXrMb+vYoWZLOLxrKL79Zj8VQ0Fwv6sh2zA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQXOFG5iYTtbWCMbUDELUx+Y3KO/PRn4QOI3TeFaHYYU+qA7AEOosHuGXWmN?=
 =?us-ascii?Q?CTQr6z/N6Lw6RHY+ITW3yxYcIa6KweW8xx3aAuGIAU8Fpi6UtDSNAaLfTM5n?=
 =?us-ascii?Q?unir+aXcqtvTIjeN3o2nPuGAYU576sTra7CuCNiPxeW+p4A58A4u5Jce5eYb?=
 =?us-ascii?Q?pn2re4eysBJDVr9Z8Wdoz/wCA5xgohU1+uPvudk1mpTi8jVdDlhPy8oqsDYB?=
 =?us-ascii?Q?39/eN9dMtQ4mAeZSwtWksENVUXJ9dgRlDt0HBDfKzlRrCaHpkALxMush8dX0?=
 =?us-ascii?Q?zmssVzABzwopAFUPuXdv8AP2eeIsEAUc3ZdGhS9Mdv699gfmh7w9P1FxeStH?=
 =?us-ascii?Q?3sBuyS2WY+QmPVU/LYLJCbnC+Kgtrn8P20bTAolTI4EEOoWmr5bEWCqgxnXg?=
 =?us-ascii?Q?kBFXIeoi0sM2KDC4SijzoexL86qUrTqCFqeKtMmCezBBrBOE+Z/+RNuuUiUt?=
 =?us-ascii?Q?ASb6JbvahO12Lbt4NQfNebn91V34RxG2YOlTWiGFegdkMhI9UEXeSMeGnQoL?=
 =?us-ascii?Q?J5FPmsO6mRXEKO/9IAjP9RWW3pcKA5ijZ+U4D2LjPwXdTykILu4MIF4Z4S17?=
 =?us-ascii?Q?menpBIZKYYdnCylMa+QlBtuv7kxo7EiKT3/kjLlUphW0ESrJcsnyaMLdGBwG?=
 =?us-ascii?Q?Xpe3PugVCciwZauRRz/P+P0z9jNDFDNL7IirjCK0XgTf176i2UaJBjlO1pOd?=
 =?us-ascii?Q?E2IRplFzBZXsDBH64aTyhIriDxUStu/3pcOWKM1uAOo0/TloT7WPbkoP7Csl?=
 =?us-ascii?Q?MrvwCqVaTv2/IjcQR5tlkV4dc5jNE1dYuwXXL19ES6QqsrjLjgwhdKW6uw+I?=
 =?us-ascii?Q?wUbTi7110VoFE+AjjbiFvZUl7zhtnDHpDMAx/98gHzneIojy8MWGdHWYbKzf?=
 =?us-ascii?Q?niE53O/UXgJxUoKaRDHmnp5g0bReH8h51weW0ubDBqRfP3zAJOc4ARx32siU?=
 =?us-ascii?Q?GUBWu5jbHj32OEbz1Zek+zQ3QY+mTDtPGzzOUeY3jXp45UaHfVsBvCM9C7UQ?=
 =?us-ascii?Q?DkuGRJ68nX7AHOrm4XLA+uLezAsIZAGFntB7JCPLDau7DCsyeb5uIwFFivmv?=
 =?us-ascii?Q?LEghGW651a00FHNmw2qc4wqFWjJArox0NK4cQWrFDUT5aTuMo9PCQ7Jhb+pr?=
 =?us-ascii?Q?uAUdZkerp4cek4AYYr0nHtS7wv5MSW8ykGnz+eddMEs0a447Vi+vd6U67513?=
 =?us-ascii?Q?4SNKVC4PF4L1al1ippT5C81seKXffoIwbv721mIkWXm/VuaQnSn1T8AcM0FC?=
 =?us-ascii?Q?av9F9nY7w3//psml0utZiR9HmBzSXxM49PPSee0rYBMeSwdqZzZY6RxuCxda?=
 =?us-ascii?Q?rTBBkeYTZWX+2gomOGtnktPpk1RReVACa5szpvJpBUBu6KPpiauMembwjxFv?=
 =?us-ascii?Q?7ajLBp44iE74ho006MklgRAjHncqdBblxeyY4SWWAbWWTN4/dEUOsyZyrdTY?=
 =?us-ascii?Q?Dn+ECj+t0BgVUyYSsHdfXAkiqsQRTmvZnM0k1PnXgFlakWr+WpQMfyBynDgB?=
 =?us-ascii?Q?zGyTQLB/4nXPWcJf15MjKaDvijV9x9oBOq69pIroSzkLe3AIpIfxWcj9Q9CZ?=
 =?us-ascii?Q?e/1CtQq3ouV4Movxy9+p0IewQeEJpU/cCtDpU1Vg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee610de-e735-4db5-2830-08dd297931bd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:57:46.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33dLGAGRwPx3OzoQ9jaPidbq+d/QP9QGQSPW8DUtVya7HG2AMaMuhcpsYRbbFsBnfyekw5hfzs1Xak/tE8LijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
X-OriginatorOrg: intel.com

On Tue, Dec 31, 2024 at 03:15:47PM +0800, kernel test robot wrote:
> Hi Alice,
> 
> FYI, the error/warning still remains.

Kindly ignore this report, which had already been discussed in [1]

[1] https://lore.kernel.org/oe-kbuild-all/CAH5fLggEzmerC6Qg1fjuc_wiy21BJQGGYdZSZA+KV=oP6q9iJg@mail.gmail.com/ 

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
> commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4 rust: samples: add tracepoint to Rust sample
> date:   8 weeks ago
> config: x86_64-buildonly-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241231/202412311507.14xdiaIX-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311507.14xdiaIX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412311507.14xdiaIX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0425]: cannot find value `__tracepoint_rust_sample_loaded` in crate `$crate::bindings`
>    --> samples/rust/rust_print.rs:87:5
>    |
>    87 | /     kernel::declare_trace! {
>    88 | |         /// # Safety
>    89 | |         ///
>    90 | |         /// Always safe to call.
>    91 | |         unsafe fn rust_sample_loaded(magic: c_int);
>    92 | |     }
>    | |_____^ not found in `$crate::bindings`
>    |
>    = note: this error originates in the macro `kernel::declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
> --
> >> error[E0425]: cannot find function `rust_do_trace_rust_sample_loaded` in crate `$crate::bindings`
>    --> samples/rust/rust_print.rs:87:5
>    |
>    87 | /     kernel::declare_trace! {
>    88 | |         /// # Safety
>    89 | |         ///
>    90 | |         /// Always safe to call.
>    91 | |         unsafe fn rust_sample_loaded(magic: c_int);
>    92 | |     }
>    | |_____^ not found in `$crate::bindings`
>    |
>    = note: this error originates in the macro `kernel::declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
