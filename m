Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D72F999F;
	Thu,  4 Dec 2025 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764827891; cv=fail; b=GypWd0FO8yRmXQdzGM089qf3S/aCayPx0/fUIfQwu5BaaWKSWw++geeivzRJ56IxNnWQDasbMo3nUcV6vIGPoaqWQFIcKjZcj9djE2xmzsTlQL1xb8XMAkVj2WCZMMlp+DZb7JUQJ4HG1xffKcwoz6aYfBRCK6KRZF8XBxFwOKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764827891; c=relaxed/simple;
	bh=EBTeMVpy2joej+lKMws6dY4AX+pUSph9WEA959KSusw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o0BY3kO1ET/u5GONcbSKxzOC1g4jCmmkyfihMaQdkUcAV2Op/fsMeRZkiRsIXK3FRtGo81ofrwOZdCYP8+F3TIOpdVtFo02aY2CY/lZNMIYQEa5Yj/IhHsaIsXO5zTkiOecAAQ04CNhRWAR/x3V6PyikPp4oooAqSsJFlFDGfBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp1trrJ4; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp1trrJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764827890; x=1796363890;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EBTeMVpy2joej+lKMws6dY4AX+pUSph9WEA959KSusw=;
  b=Fp1trrJ4Tn3Z+mNECFc8+qC19pHgMSCRILsg0gy/ZhF1YHFKAkSzu2S3
   Z4nZzKApJ0PuZ9URItiCJ5xWA49tNXuO+TL7AX+Lh8RwvrGCRu2YsDbay
   PRSuy6XPLQ2Z5VbcNCKQq74IyB2mV1Lb2SovRTMM1oG+MtYgTvqWMrDMR
   N7ekh/dlTWUjKjr6fgbNrLFARzC9WoWKfyZTD8NSezPX5LFbh98z77fz1
   Rc9KoelxQ3IymBzw6IU59gAWbiU+Kx+R01Ad0tsFvdmFvxADr7GbrI+1v
   5G1ozUiyWmLZilkrfGZJNjZjIFkloJx0jFtFmA+9Zcs0vjE3s0dhYlOlM
   A==;
X-CSE-ConnectionGUID: lGmXjWTHRLa9oe29c0qtbQ==
X-CSE-MsgGUID: Yl5Obw/qS72V13HGE4qqmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70690927"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="70690927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 21:58:07 -0800
X-CSE-ConnectionGUID: c4at5ZUYSp2Ra4KMPEajqg==
X-CSE-MsgGUID: JLw4/+YXSS2KWD6V9NcwNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="194713293"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 21:58:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 21:58:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 21:58:06 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 21:58:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leQYBziP9gMKbzursjrFRseuN6nQiLv3rDyrB8sEBYcqYbJZ2ctWZHOIJEayuN3qE4xW94xdNjPl1haJEh6XMDh/bW52PDo0JYplItoCecXv6Jk09A1iSLSIbNs4MnV0VeCq9oW7dpjX+jGlNzZ2N2FuTezNQUQZ1TwjG+asM4mGrn9r21XSC0ZamWJsRM8XgVofjVXveUxgfeTmaw9B6Rpf2Wq/Rb/tJH3mfZgmEjCVejaAYm8Kf+Ck7R+Y1cM9Ypvbk1XsZsgeDsJuFD27dC8ZHSTmnUdwfAqJAAM0Xstpghx+tT942gGN+6SB+oib5ofSPY/zBiPUZIZm8yZZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1z6lIKm40TxR8avILIJuTLzxAGU5RNeAkBa0+E/xR8=;
 b=fl7ttL+6wcDevzdgR9X/h2jkAmnrQ8wq2c4yis+aWrXMqEzK8Y+DuaCZ4Cp0aVmQftZ2xTFvKZcOgMBWGx3xo0cwonqsWHNC49h7P0HuehiQp5uTswoqLGUMc8lN9sFR0SAlh4DCakqy7JhhdP3l3864vKVEv2FjKk2U9Xjkknsb/Q2sEhzrK68lCz+TlIk8UGj04o4EhkiAMnnRi9tFRozPj1AHxnwXJvribdz3HB1srGAymhl7R9n2/kE7jk5jAr3He3SaY7TVOLYrg//0BTw7saLHQOYGDsnQaJlDlPtc/159flCfzj87/ENQ7uR3bBT/OXi0OwuPqK9z9/jeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA4PR11MB9108.namprd11.prod.outlook.com (2603:10b6:208:567::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 05:58:04 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 05:57:58 +0000
Date: Thu, 4 Dec 2025 13:57:48 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Daniel Gomez <da.gomez@kernel.org>
CC: kernel test robot <lkp@intel.com>, Andreas Hindborg
	<a.hindborg@kernel.org>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Benno Lossin <lossin@kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
X-ClientProxiedBy: KL1PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA4PR11MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b634ca-1680-4ca1-1ebc-08de32fa13c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+pImDgY+hmqE3DrT6JFfMl5hVhWNqwVJlrKskqUyxJ+eSkosTJTmb/OGBFTe?=
 =?us-ascii?Q?2IEX1QVeGvEmgCiPINz7HMuX0uYoD1AMsvfrNM4C/1sWDPYwN6SXXdSLhVzp?=
 =?us-ascii?Q?Xyjs2bBrQxwZE4LE+oxXwnfd1SpwdyWXs4fTzdNfX2Ul3ld80ZGOzXfNFIzp?=
 =?us-ascii?Q?eO9Mtpu8hcYP7e/lv0cNlJzEINJmktkHctx7jMj430haTkH1dbgNQyvL2EUS?=
 =?us-ascii?Q?EsHJ+QkgYQS6tRUYaMdRBl7rfqLdQTB0hndLKhPTwUPCa5GWXpN5afVH1ulI?=
 =?us-ascii?Q?CzckeER9BVeX08YR81xT/+UWd016FBMhtR5IB5TwOQRlxLCUf2OQvcRCtNye?=
 =?us-ascii?Q?ZyrAtDlJeSxBwVMfCqopaQBDOX8b+QO1QF1khWRx3akCDFHJC7/oD2NkeMEf?=
 =?us-ascii?Q?z7bqwW0cQxSSLqO+w2a4vUXodI55Ls86b1pdoyMczXGKo1/xKycE+Fa667Xs?=
 =?us-ascii?Q?br8vTlhj7LkZelHgqJ4LH2XuxQYUCJR+VfpkXp27Y7kdz9KENHN9QbFGMw4A?=
 =?us-ascii?Q?zXt/r1Ar3vIzQlBRKiVm/M0+qQo9eh7+eZPsdXwecsNg0y6LcKZkpPztuy4q?=
 =?us-ascii?Q?78WtgwDhgM5GuyMAybRdb1VmHTUf+vhl8XskFE8TJdde9G8Vf2o9kXCTfdaB?=
 =?us-ascii?Q?PJVcYFjEZmpCsrgUUdsvd+SQaNd8kHBOKT6KVzPxB9HPXFuneOy5tDdzImlV?=
 =?us-ascii?Q?1GqRNpTb1eWs72TCjRTKk7Cz17TZzRM5+We8JScc8lTFW2VVFpF58o5vTHmp?=
 =?us-ascii?Q?Ows7ywlE3Ht7r7hGhRKHli77JRgaPJjgKx1TyI3S66Jmt5e38wqAmppvBQWx?=
 =?us-ascii?Q?wrSCQ1U65LN2oJe7y7X+I2qdbBl/5KsveNdyV3S2GwkZuImfFtHto3JHs7fd?=
 =?us-ascii?Q?DYAdXAPQ6eNAD0dGP8qiRBSdRApvY/sELDAohdPFh5YjV9vQGMkM6s0++FuY?=
 =?us-ascii?Q?hASneE2/vihLBig3Cu8kKhx32Tu0Pjl+hCixvReSnQ051Dam3ofEyT5VFXHu?=
 =?us-ascii?Q?vBVm8dyI2HegVpm+fjtWoSykU9HMhubdqcvpTctRIUr/SvcvDZr0/rCeBhwC?=
 =?us-ascii?Q?NYRH8/waneXXaqMaZZmApo4X620ewNmqaH3k7fElmF3g3R5CXf8Fj8UOG8fv?=
 =?us-ascii?Q?d8ZtJOq51aIDBhyvpjajkxSf0dOB/8XhGXxnM8syYLruVKxppaU505SmDtdE?=
 =?us-ascii?Q?J7HK5BS0llh+ZiLFkA3GD6wrgxYxZm5Jd7GLnFITq+pACssNWgshJteuzF/z?=
 =?us-ascii?Q?D5oJFcWZ0c1s6MxHidcOzUqF2DnqNTdxG09YvZd6ODlyTon2z9JigyXnU5MN?=
 =?us-ascii?Q?JlENB/7MNYS72Ale0C2v+X+YdS3q+1VSNTG6ET/epHH1h+9YVs/Z46PnQBaO?=
 =?us-ascii?Q?5i4uFFzp4E390Vjqh5DSc3s7LzillhVF+ije1ZZK3lKEEKpcygo6+xFB7kcg?=
 =?us-ascii?Q?M87zOuJtW4icdZRUjzwNADgsqwTb9pf4JesrUWD8XBR0dVHNwOx8DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zdEPZ8DXj49qWw5V0RxMNYRmhc2bPsV6w972gK7z0FweKaa1n2v6mnIgciCw?=
 =?us-ascii?Q?5VtIs55LlNiRqWicpNMMNGuTkK/Wt8OtoHrfs2aMpNwfQ55FJHK1PDW1D94Y?=
 =?us-ascii?Q?4J1xt0jhbhyGIFC7RRvIVYMU6Duj8Ve1GuUu0AYltVk171zFwKrOu4Ehp/Iw?=
 =?us-ascii?Q?eksA1U3HyiR3+QNlz4cWlUdjS4yt80fI4tvnHZwzix/vR7FeXCWdlC+auL63?=
 =?us-ascii?Q?v85QZQ/c3YNrS/WCm1PslBt7GLIoaqhy75WX6YZf7p8PCNcE/v4nXA6FOW1U?=
 =?us-ascii?Q?y1X/panr18nTlJe/XEvybbM0VXN/gcRneCckWWzjONnrYIziqIibRnYn4Dsk?=
 =?us-ascii?Q?nhNW5JqLRMyJDVj2CO4ZK51P1MWtR7dg/Eaz6tLbPScbZ1Pc+bkEPSTvzaqp?=
 =?us-ascii?Q?zS2Z3s9ZQpi+gWxiAJGmbwtVMxXKhdDwP9KQZOYhRkYJtPa2j+8nSwhE8Arw?=
 =?us-ascii?Q?c5DopBsUnPfYQkMDqtHFhecBd6atsHSxdR14FVIDiv9U0HHrSn7b2BX6kOFm?=
 =?us-ascii?Q?pQ3VFLj+fvTRo/M3V9GSu58SeEhVq7FgGdR7LD7kAgsLaLkt8OClSTNSMPU2?=
 =?us-ascii?Q?4Dx+yWXdgQ9RdliWqBw4h+J/PE7lQROrLMS5/lSAy9yWkrT4QSuWfeR+uUpu?=
 =?us-ascii?Q?0dChcjt+PQcSRZfPFguFjRHkmEPaLm2akAoZaXt1Vmkfh7hoUqeISU7m8w46?=
 =?us-ascii?Q?keLiAVJDqY2is3O4v36PUDfFhMFMeiFjxEWoDDciRNih72auIyftZtnixRlF?=
 =?us-ascii?Q?3kLESopJKMO41lCxHjyBbftCR8HUqOjOAMdWYl85p3RT+sFZNJQN6mUIriU3?=
 =?us-ascii?Q?oNumcbuFcLdr7TOmK6IBAjONWTD3D9Ud5Kdhz3uooMCqAHaPKrIUkKVQzFlh?=
 =?us-ascii?Q?Lbsbnc+S2g1BxHFxnRxhwJEeCG/qF9B7n1zQpcCT9Ru+zHDarobHPaoh9itU?=
 =?us-ascii?Q?nF9D44SIEX+J4cWq75/Z8//g1S7UvxS5mncKg+Kz5TYXpSUV3nGjoxftHXS6?=
 =?us-ascii?Q?i2MCK0gYFCEXnmLrErbBAWc6W6BtJnrEhTaQuGHmdCH2davLqfQcka9tlBHX?=
 =?us-ascii?Q?pC5dZF9i2g/MyGmdp9pK8c49hS/N+QA/L+rfLBQvjRe/SDWrWaJArDnXgmQ6?=
 =?us-ascii?Q?NngQ8TvixJxa5+pMfpkKHKY+rK00KCwjh2e5E75XR2mnOefYp4IobVLhAvaV?=
 =?us-ascii?Q?SsT/R3bV9KKPUYZNUWy8cJuIYZwdENW4Wdnu7h+Flt2NtMy9otMLXLkYrgQ4?=
 =?us-ascii?Q?zAUb0o4u5PAd3MBh0eb1JpcJWNsxpEWCAOdCP6X5jd2ATtOgQx/HZedxplnW?=
 =?us-ascii?Q?8hIn+Zhwpqiyj3X6A+P3b5+hPTus8JmxAz7unXgmzwq9iHu/2fguRBriu/iQ?=
 =?us-ascii?Q?BU8+g3XtlH8mPhG7NI3KT7Zy08eSpKkeZzUEWpcIU00CLzSDoWzLe2a9TJDW?=
 =?us-ascii?Q?3DP+UB5/P1U4nC2F29XqocUTqwsJT6tf4GjaBCM28zKDpUE+ItyagE6cSmfW?=
 =?us-ascii?Q?9CkRbUK1x9bsH0l9MBSm1aeO4SKLbwuZeqLL+DooqbZD2RDwnhvpWgWUflPL?=
 =?us-ascii?Q?98rxHvnKePW2zSltnu/wbSqaIzkihy2iVrOE9/PbYwIrgaad8Zqa9hfCdSn0?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b634ca-1680-4ca1-1ebc-08de32fa13c0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 05:57:58.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8auaAYQcMiqEdNhsdPtN1jnByNYoYybhcsA+W453VAXTc7lxgXeQkTSgY7vOt5PWeTfk2vdjI0QlxMAW33wbUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9108
X-OriginatorOrg: intel.com

hi, Daniel Gomez,

On Tue, Dec 02, 2025 at 10:02:02PM +0100, Daniel Gomez wrote:
> 
> 
> On 01/12/2025 21.20, kernel test robot wrote:
> > Hi Andreas,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> > commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4752/13171] rust: introduce module_param module
> > config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512020454.Tf36WHw5-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_param`
> >    --> rust/kernel/module_param.rs:78:46
> >    |
> >    78 |         let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
> >    |                                              ^^^^^^^^^^^^^^^^ unknown field
> >    |
> >    = note: available field is: `_address`
> > 
> 
> I can't replicate this issue either.
> 
> I've added these patches to fix other unrelated build issues, so, I'm not sure
> how 0day ended up skipping them? Perhaps it uses head 95cb2fd6c? + bisect?
> 
> a74b6c0e53a6d um: Don't rename vmap to kernel_vmap
> f74cf399e02e2 rust: debugfs: Replace the usage of Rust native atomics 
> 013f912eb5fa7 rust: sync: atomic: Implement Debug for Atomic<Debug> 
> 14e9a18b07ec4 rust: sync: atomic: Make Atomic*Ops pub(crate)
> 
> My testing branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=20251202-0day-test-0b08fc292842-with-fixes
> 
> FWIW, this is what I've tried:
> 
> rustc --version --verbose
> rustc 1.88.0 (6b00bc388 2025-06-23)
> binary: rustc
> commit-hash: 6b00bc3880198600130e1cf62b8f8a93494488cc
> commit-date: 2025-06-23
> host: x86_64-unknown-linux-gnu
> release: 1.88.0
> LLVM version: 20.1.5
> 
> bindgen --version --verbose
> bindgen 0.72.1

sorry for false positive. we confirmed this is an issue caused by a bug in
bindgen - https://github.com/rust-lang/rust-bindgen/issues/3264

we used 0.72.0 when saw the issues. now we upgraded to 0.72.1 as you used, now
issue disappears.


> Clang: Debian clang version 21.1.5 (1)
> 
> rm -rfv build_dir/
> mkdir -p build_dir/
> wget https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config -O build_dir/.config
> 
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 rustavailable
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 prepare
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 -j$(nproc)
> 
> grep -i "bindgen\|rustc\|llv\|clang" build_dir/.config
> CONFIG_CC_VERSION_TEXT="ClangBuiltLinux clang version 22.0.0git (https://github.com/llvm/llvm-project.git e19fa930ca838715028c00c234874d1db4f93154)"
> CONFIG_CC_IS_CLANG=y
> CONFIG_CLANG_VERSION=220000
> CONFIG_AS_IS_LLVM=y
> CONFIG_RUSTC_VERSION=108800
> CONFIG_RUSTC_LLVM_VERSION=200105
> CONFIG_RUSTC_HAS_COERCE_POINTEE=y
> CONFIG_RUSTC_HAS_SPAN_FILE=y
> CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES=y
> CONFIG_RUSTC_VERSION_TEXT="rustc 1.88.0 (6b00bc388 2025-06-23)"
> CONFIG_BINDGEN_VERSION_TEXT="bindgen 0.72.1"
> CONFIG_RUSTC_SUPPORTS_ARM64=y
> CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS=y
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
> CONFIG_HAS_LTO_CLANG=y
> # CONFIG_LTO_CLANG_THIN is not set
> CONFIG_HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC=y
> 
> Build succeeds without issues (warnings, yes).
> 
