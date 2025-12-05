Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A331448D5;
	Fri,  5 Dec 2025 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901336; cv=fail; b=DeNt6M69JKph7FkzNjj6zX5lYohXAL+t9W66Ek1hHbWxWAZ3JpRhjkSDjgY/47/N54jKkQHw4w8gfFBisS6QTwet0N2v2DlfdtiVe4/0v7rRseR1V2nX8kYorUTWXB7wg1YmzFcO9xqbDN5sjHkKCfrg2oY9kq3yL501bNKoS7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901336; c=relaxed/simple;
	bh=qcHt9AHfQSWDPARsgbDULvBi8+IB6nFPuPZk2AVhVG8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c24QZqbccnOxUH2nBBB1+Do5Dk8WCYpKPCxxgOfQvickS8YuRuS7kYy9AQ3swJQuf9OTe672rV8542pTmdF/Y9mWPbhlI7DIGUFZk6tU6l46FNUovclI2bA0KeW3UQ5aqoA4PqIJBB4eO92fXauTO8BJxbhF5eYYACyZ1tf6VaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPfzqFlP; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPfzqFlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764901335; x=1796437335;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qcHt9AHfQSWDPARsgbDULvBi8+IB6nFPuPZk2AVhVG8=;
  b=OPfzqFlPOb29Q+T+/PQUtk+kx4cy5vGkZIOtL2Q2lvL45TZJvkyVS1jK
   WgctK0+91RVT66HF0P2D/9pv3YTdJWGspfBtjZkd/reDVvHkXHDYcEcn6
   UXFTEWTkwVkK4nAe3wlPNzRA/IK1SbHbSktVJ0Ed7o5dj8KpO2yzB40YB
   ayihjTl2QDitYJf2RfsGI9uIeqqdOYrrEmSXfgclue0N6MKjEciz6dTUn
   d3E7/yWlNerTKLSYFqpbQqXkbmSbFavBFnqWjA0IPz+14xZJsZ+fO8GDa
   XZyL3I5+zicxkoUBpmZurBjyO+++JQKDzO2ARFja4/GU/b+FadxRnmUgc
   w==;
X-CSE-ConnectionGUID: hCYcYsCRQj2Aod81zweLJQ==
X-CSE-MsgGUID: BXHbmFcoSru5dAJTrfp7dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84340928"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="84340928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:22:15 -0800
X-CSE-ConnectionGUID: MpDnYTeeSZuVTeG7Pg0Xkw==
X-CSE-MsgGUID: q9ZxghAOQZuf7WAXuJVyBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="199586737"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:22:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 18:22:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 18:22:13 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 18:22:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNLn42NHAH+Wipg1pt/OsqiwMvZClDWLHPRAxFnKJfwKRhoVqyui7/7FVw7jb4jNk6z+o+RH224qQsGNkjpDTqDzdHUk107agAgbnPyYhPEFG3HMeEmpqvg9vPpe/jCJDNcLv5DD71E41l5izbswDLNsMRzz0duWj5EMTsWtKA6aTdZUjzJZfLj36uBznRSGCFTj/mqpAM+vYAg0wCwELmtM6CJcVgFi/K3TA1xwEiJTnXg6smKhriguEgXnE0/Nsn0jnr0rPT+QaUlZblcnCnfFz2YON4qH3+r66YHGrdsBpQCzEqMyiC8U73/echKPU86rFXsbl5j8B3SgWc3bZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiKUiko5RZ5g57r7W5kmaqyryrQ9/JikLQGvRve/HFE=;
 b=xJmdSUltpf0pjM2eLmyrJVaqj3s5yvLARO8y/YfAOqTOuf49g+BjVG1XxYGTzqFWw9dEgwS2sHOjSFSJRlCGuPtY7Yv6CQ0ZSnV8DI8OWDhurQ0QZZdYYNbKH8cE0T0ZGYEV1xZtt03vKFkAqoART7unGlYmRYsQg5hEBGHE8qI06QliYkwynvAtRix1/9KXSPDz7eLb9YuOihO3I2Be74412bCljRDkuaKv3bcS5fJz/on1mT2G+0B3peerbLpePoH2eg3LHtvcu3rhXL1HFpUa0KpzSGoVxy3Va+COCV/NhgT/bdU7ColuMPXHe8/7D7V4dSlI2NFLafoGzk2gyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 02:22:12 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 02:22:12 +0000
Date: Fri, 5 Dec 2025 10:22:02 +0800
From: Philip Li <philip.li@intel.com>
To: Oliver Sang <oliver.sang@intel.com>
CC: Andreas Hindborg <a.hindborg@kernel.org>, Daniel Gomez
	<da.gomez@kernel.org>, kernel test robot <lkp@intel.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Benno Lossin
	<lossin@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <aTJBys7oughZ1xjg@rli9-mobl>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <aTJBFhiv+4AB/EzA@xsang-OptiPlex-9020>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTJBFhiv+4AB/EzA@xsang-OptiPlex-9020>
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 7744b79f-3070-4eb0-db52-08de33a51908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fNY3oZxnM7EBECcoSPGBAR6VAfuJFnWsvRJJzZMkvF1hfckRA9yZFOGsVGz9?=
 =?us-ascii?Q?hFw7/Rqbp0ml361v6XbcF0tRwlDda2ugV3tJ8qlWGIuBSu1AT9pfP+tmPP+v?=
 =?us-ascii?Q?hWEHqayhcVDwdhcwSmQk64UwVreGn80wEW5sEooRgVcA0M9Rb1Isl/ID80Fk?=
 =?us-ascii?Q?s/VRquOpzRIhIkkiehIp/9dRYM8rrHQfXil722G5xAa0AlsQabmfNzuRnN8b?=
 =?us-ascii?Q?HYCGULcctDPWno16K+rou6QPHhbxv4qvgg5u+2jQB2HiKpbiFWh2/QwvmJdL?=
 =?us-ascii?Q?UCrGh9YVMCL6MpfwxAe5PJ/mAs68it/u7ReeZ9+5nE6X6/XKvHxAhsYSrwBW?=
 =?us-ascii?Q?ZtefB5SDFjxLsGMkbesE6m7HO1NW0yXgp5tyTXSFrJEa7GbyIduxoNF4Mw4M?=
 =?us-ascii?Q?Gj9ha47qi4rRylLyLTWfyuwQFuJX7QkZyWBsbk2Zt6PhdolHLGY7ceVDPQGU?=
 =?us-ascii?Q?coFv8njpqXvCZQEJmKICm+cn8QkVXGGihl2KY0O5b5XacEKEnjyAXJBJ8C1s?=
 =?us-ascii?Q?xAIixmdVoPEI2AAMqpY6RG191fIXH+liwb+ay1t8XE0Suzj2SjndaWAj6eiP?=
 =?us-ascii?Q?7W+CL1jjajgjJcXoD771d1hJANqgudluie6ZOHhI2SY1Nr7+854gtJVnfzGs?=
 =?us-ascii?Q?bLQLIq31btGF75N1O13wI2ZmMJak7ofp9o1m1gr326Y2teqSIbESSbCF5th/?=
 =?us-ascii?Q?/LMqf5rUSWQ/vIwOdwyodI6nr0+iAM9ksF1XK2z4WH9Hu4paUHEXoL7Bdaf2?=
 =?us-ascii?Q?ZokrVc89Lh182TBfKEluemm5b+p/OcOwlFKqCfwLd0tHDKpT3iPpfbGVCH2T?=
 =?us-ascii?Q?LwMon04RW3jrb6IML4QJSFPe6+ptOr5dG5SQus0j1o3yxNkL/gDFkMVOIctb?=
 =?us-ascii?Q?roXuXzN2VuQYQ54BtWQBX5NRmuqvwEF93mu6ReddZNTpTiVlQJD27NEB6stF?=
 =?us-ascii?Q?PuJE+FUYhNlYKA9mrk61PcWqI39JYQzz0/DjzZjrZmGlnBDIh3UBRjinelkn?=
 =?us-ascii?Q?HAbF+JkwinN006KBYorMTLP6cX/T/24i/ppkmPHKF3DSoPfi1kPrGCLVQ+BZ?=
 =?us-ascii?Q?9SZvgQgPhdVHgTtkh1QqNmfHDeYvh5jvi63JsDTkZJ5F01lyIr80IhWB9tqH?=
 =?us-ascii?Q?Qz8cPJ7EzrkhzZ/5m1MO7xvKrfCaN8OjfPwB8KLsoXM2ImH8DOtN9z7a7lkv?=
 =?us-ascii?Q?BJI4QUezr31mw7+dhBuKxZve1v5JpeEngCa4H+PyXqwgChS7uMPMGsFrDQkM?=
 =?us-ascii?Q?QKzjPF9sjN9iA0cmbbn47decxLrvnFJCorlUGoVy5Q7xhFPAMMeQu442yE/Z?=
 =?us-ascii?Q?NYiYYbA0cELlI8ndpSkYAmlKPaUBgV+QqC1SpqEtnoLFrT9okOzKQHrgSZZF?=
 =?us-ascii?Q?toIKRVUnviltxM16H/n8tvRGRzS3VxqMn67kJPjK7V427+trJKf1muONmEtB?=
 =?us-ascii?Q?C1Rd3WcjtaTDjqy0u6hQ6H/smGjjC9QU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WFJG4+Yf3QmB/yjmXUPJIu6IoKCFvkCDNLfjc5iS313UDV2Q77lE/JQgG8MY?=
 =?us-ascii?Q?DZOjBoGDMGQ6DDpXCTk2NyexVxNrjVG69Cp/kpq0dzG9sTILIIRBiv83X1Zk?=
 =?us-ascii?Q?pCbu6zWDQ4jQjIClcfFbwtKvrlqjzGhfNLeJleuXjTvgfvNV1VMyllOTr8UW?=
 =?us-ascii?Q?V+34XbjEtVvcu3KqVDWw3nJ7j0iEK+CHxs7P92C13ODQfpzuVn1dKiSzQX5w?=
 =?us-ascii?Q?/6tgxp/vmEosfHd8MT/fpUbNkdNp+GFroYaqEAhm0X9fMBKsZIvgn9dH2nYY?=
 =?us-ascii?Q?OUg8JQ/B4MP1WjyuliJY6eSQz4sAKtPRt4mupAHHLqqfocte//s9krg9TypM?=
 =?us-ascii?Q?eK4mFWhCakPQTpY2qBzGUk5ac4v47g0FSa5j2HZIfFfoLDBhcnRR/SA5plZ5?=
 =?us-ascii?Q?vD5YaBk99X0+u/cUI/MSgbHNSU5xyNWcOHzdSsyXiMe38LOR8IJYyGCjcyA+?=
 =?us-ascii?Q?edHmsHPAJRj4mfLdjfzhKnbzD8jR5/9V0ljWtleJb0fiy6tLtrHZT3QBDr/B?=
 =?us-ascii?Q?OdTuLbQuMK+pKfD8rCyc/LVxdz8f16WRxy2XMBWMiCw0rqmmf3C6gr6zm5Tt?=
 =?us-ascii?Q?15F3u/SgqjnjpH/5V8NTW1X/E2L1SdVhIyVwq/swD77x3beS74FfD1E/QA9V?=
 =?us-ascii?Q?oFJlO6ulMwlS10BEY4A5mPA0ppTp48yuUTxoKp4bBOMEP/IrS9bjsjsvX8jQ?=
 =?us-ascii?Q?wCRklkSbhvq6zucDbQnBWtUaNhs+N23V01YKfQSHRJ0v97ZfOnISIde6K553?=
 =?us-ascii?Q?4/23mV+wazvZBw1/Tf/fp3TjmyGj7Xzbu1X9cTwqOk2GJJpcLrryb+iawAct?=
 =?us-ascii?Q?guIaBNZbwt7KqqQMdILkEX2yJKGFrVhb69WDzz3GJW+O/AkkYoDKYPoTiXjI?=
 =?us-ascii?Q?/4OtLO8vICFkN6y08s9NOPDVuexal+MTjrdlFzgdzIqZmrJHDmOkXo9RLHWD?=
 =?us-ascii?Q?zg6PygQ2+Nu+xrnPHIggLkvE8RrEIAUDZnggM90NP8+IPm01lomwBtmbP5BX?=
 =?us-ascii?Q?ScWngXP8/5KdcJhbO8hwFn/VdacLglQnT/MtjxzvQLvpuaTPZgX3oO719sOf?=
 =?us-ascii?Q?/l/eD+KW/XzaX17aKQPlBGOIzmMcekhGQDIllCtqkeIt1dnc/llVUkNIgprE?=
 =?us-ascii?Q?IywtVSOFwSvFPsn8ZRDvL+fobjUDRkhh6+WdvKK6fGW5POyhmABaXNzBzgDU?=
 =?us-ascii?Q?4A14PHwRef3oSNZH7+SokLxJnf4xUXiAojvBErlsHptYgOVIfleR8EYPEIyC?=
 =?us-ascii?Q?hFzgkEkhyxllPNi4fqNJCWIPz0yAt+kljMSiIsVN4SZfr8Ayr5g8s+E6EJvh?=
 =?us-ascii?Q?US7LXZDlI5YyvnwsWAb9ACPck8h6sBFJoDxk4XEPuNHgADIN/MpQtWm3LTtG?=
 =?us-ascii?Q?ELrnzsTrsIrqJkUPixxGUlVYDqs9YcU3/7HK7+KbPPJ0u6ZOPFaZ23KLrwEm?=
 =?us-ascii?Q?byubNsmappgMiPi8+lc1/88JEStQP0Fx4euyB6Ejbuwlz9hxk95/PfMTmrFE?=
 =?us-ascii?Q?dYts4EZ4mub130XgehU9xnS0OLfILY9ytSTrzwF7AVv1bv3zKe2Pdnnc8w5D?=
 =?us-ascii?Q?SM43GDAkI9EbO9rJQGgDLYTY0x2THySO+kRI4iTE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7744b79f-3070-4eb0-db52-08de33a51908
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 02:22:11.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXa0Hn+gTZk9//y7HQFFzXqvGCf5RwMeLuC1XtLyzWMi3gQ9tJ5k1zhhfBrcHV0AuNyg7ZXoCG/YYlEVRjoa+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
X-OriginatorOrg: intel.com

On Fri, Dec 05, 2025 at 10:19:02AM +0800, Oliver Sang wrote:
> hi, Andreas Hindborg,
> 
> On Thu, Dec 04, 2025 at 12:47:05PM +0100, Andreas Hindborg wrote:
> > Hi Oliver,
> > 
> > >
> > > we used 0.72.0 when saw the issues. now we upgraded to 0.72.1 as you used, now
> > > issue disappears.
> > 
> > Thanks for confirming!
> > 
> > While we could see from the config that you were using bindgen 0.72.0,
> > it was not clear to us where you get this bindgen from. Obtaining
> > bindgen does not seem to be part of the reproducer instructions (or
> > maybe I am not looking in the right place?).
> 
> right, for rust, we don't supply instructions how to setup rust env for now.
> sorry for inconvenience.
> 
> > 
> > If I understand correctly, this issue manifested only when building
> > bindgen 0.72.0 with clang-22-git. Building this was next on our list in
> > trying to reproduce, but getting to that conclusion took a while.
> > 
> > Anyway, I want to ask if you can include directions for obtaining or
> > building bindgen in your reproducer instructions?
> 
> hi, Philip, can we do this?

yes, let me add this earlier next week to provide extra instructions
for rust build.

> 
> > 
> > Best regards,
> > Andreas Hindborg
> > 
