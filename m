Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57838DDAB;
	Fri,  3 Jan 2025 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735864711; cv=fail; b=HYAirl6x6Yr8u3yJ7gdEaX9Wah13v2uKTOc0flfcFHG5lNumtG26zij8owH2ECUqwhlPL0jLr0roSMPL0v8xz+MDxqIrxNuV4Gt/ZU8Ze2sH3EdkojK4WEVQp7COxatEnRpfysAWK8L450MULMVXdeKzffqEX+vFtCfM62ZiRJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735864711; c=relaxed/simple;
	bh=jJsKaEfWl1FxwQ+lNBY5aPxMyyE792sRbaa5vJmS+Rk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NtWJwqspKnmBD5WIznuvZpwuomkKJ4/yjAzdCKz86D+COuVsIhzWqOh4qfOHHMJUPO2RGUn110cKkyRTjYlwvFDQ+xI7iUOIY2PXv+MCh48B7sTSu6kukyQqHoxZCKBoZDNk5B8i7IVNl2vsPLNLzLG6qLr/I38g4PuCjXOGSgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh8SNwik; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh8SNwik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735864709; x=1767400709;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jJsKaEfWl1FxwQ+lNBY5aPxMyyE792sRbaa5vJmS+Rk=;
  b=Rh8SNwiksgmeifVi5Kn4RGX/9Z8sVUoeRvo2reUHBxnYdPt8m2RLKZxl
   yLdnh6SC0LIDwdIiAKNpFkW11AwBFpDzFeLFTIT9JGsgRAuTAQ9fnqqjZ
   VzCWy3n8u+0ft2MgwxatORCewKQEQXJ9VZ8cOD1+O6nC86It6hUeT78oa
   dgRh1wf2AVSPYdWjGhwddyt5IkqOiu6rQCGevhUi4auLVnKBnlkPHlfeg
   NedaJWo5Ixdo0nHnarCyiljcmBBEu0v/662RYSTaGH1HFXWWgPzZA1gFR
   u2V0nKzKmIIJNMfPYZVM3gdrQvQ15RjkxdyFAX7++GEzzx48PRcpXIRrD
   g==;
X-CSE-ConnectionGUID: azOC34+LQsW7uZG7neZByw==
X-CSE-MsgGUID: lE7LLN56SFWIT+mvsiLDHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="23705897"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23705897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:38:19 -0800
X-CSE-ConnectionGUID: 13Iom6QIS5audgQZteLqxw==
X-CSE-MsgGUID: QChH1EAMR4Ogd5vtqAmdIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102165537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 16:38:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 16:38:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 16:38:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 16:38:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGGLAiLrOigjRfniBva0tdvd50chxym0rhSL3ELpd0XF38WidnvjPB8JfqpPw6GqqsIRGFG8Ps1FN18EK5nPIp+k7jhX6tpzm2KvLo8UK7meAVsMwUBJZeJ3bJW4YtZyxd1Buum9sbbrI2dBJr2fDrMch6d1Hn9+nZ/G6My1O72SAtwcoywgR9aqdexgoiB4i7TkoWVjIXVHfHrtXC7c9Q8k/FAEWJxLBVk2g7kCEtxyPY8UsqL5CPU04oS9o2G8uTGQkWQjDlycJY+tTm5oAQBsvO9qx0NrA3GgwfA85DM1OtYBGjrWpOYOMysoEI+lV7tEMqh4N36gAFgj+cV53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq/HNA1h8UiUip+xGanUm3uzNsvUlDvlJyvBfX7Y4/M=;
 b=NGjNm8kv85JG6ouNF2Fk4MGL8nOtcOeYP+BZMEe+kJURyCBXJrjUjZZOtsmZyPhBQASznBGHGW7g8Jf5lklBTDHrTkuGkeAi7kHYYbU9MItvs8rFNaX3NMiy7SBdvpxXJBy1Agtw0fPY6bRgulIaID5jtuA439ibBYe1a9zPqlMOq4XLYyCpdjrMZ3vHzJ4N9onhWROhLNjKzC5MoJzACDmZc5u8l4teay/e3ELTjUZNY/v8R7fY7v5k7UxqctY0xpXiXfmpnpKRJewFYYnZJhWHa8SBiLOarW3QadeRIyKksXgm/XwmlcKKqNuiOP36dadWSpIS9HJSgXZt7Nnaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH0PR11MB5316.namprd11.prod.outlook.com (2603:10b6:610:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 00:37:38 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 00:37:38 +0000
Date: Fri, 3 Jan 2025 08:37:30 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: drivers/gpu/drm/sti/sti_plane.h:32:28: error: bitwise operation
 between different enumeration types ('enum sti_plane_type' and 'enum
 sti_plane_id_of_type')
Message-ID: <Z3cxSmk2OJYdyp41@rli9-mobl>
References: <202501030713.36t97VZZ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501030713.36t97VZZ-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH0PR11MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 78129b33-f4ac-408a-bc8e-08dd2b8ed330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P0udn57B3voYhKzk9HKpV8QVuXf/2OwTWOcKqfH4y+e/94rw7ajkPfrDPb7q?=
 =?us-ascii?Q?eBrq3p7A7fy9hv0E5YzBfBs/qpdNICtkupaiidueDl4lWXxs+4wzwI3EAx1S?=
 =?us-ascii?Q?za1CJT2fycm+cWqBhM4z3WKtjKPn2qvr2eNo4qliYcDwIma3LyhTmySYgmPt?=
 =?us-ascii?Q?MTmyYsLr3vDdBV6b4v7rBD4WzQKhoqrGkmDNObKnXbvQmeYXDZSLIFCVBO4Z?=
 =?us-ascii?Q?iSLXuQOi6TaLBiWGC7R+hKUGljson3nfLhQdSlECyX4qCEaHCe+aNq1KLVLL?=
 =?us-ascii?Q?ZJngJHU2PZY4aov1pgtf/wuTQ8QBqnLEM2V0RpeXVjtvmuoTUNTbRyNMJja8?=
 =?us-ascii?Q?1QfR/gxZL9W6jakI10jHAMfQesPp5eoVkUik7LQHpo58BFxgRXKdiykzNsll?=
 =?us-ascii?Q?ji/cxLaKftqhvHntDLWWjd6BDckOzj8Jx/JguA1ATrMKnIkLn08aYIHO/6Df?=
 =?us-ascii?Q?xMqq8l7YXwQdR0pVhLmshxjVeiZoUtBQttf/jZ7NwWz0VJHJwqdho9aVJ6nR?=
 =?us-ascii?Q?mixa9gWy++R9xOU5q+9wO8ZUd2pazRX5bMLS8PxBjC+r6MLqVDP6Q/r7qhao?=
 =?us-ascii?Q?EdWN5jnUPWABqfGnovkBj/5P5zQOB0gpDGTPR4N8zswO810QC6v3nvwtFPeC?=
 =?us-ascii?Q?Pr8UAKNjhKnOe6sNiHvnRsmolf+MvDz2sfQYFf7SfKX7JyVSHdK0pOP9y9Wb?=
 =?us-ascii?Q?Yp45hpGdHM17Dnnoczf+8gqfkP1QkA9f37X+xDOVXmlfPLnX0Z/jmDjuxjp9?=
 =?us-ascii?Q?lVe4Rt9SWHviUgOmZmQuXbvViog5UxKFfK1O7suGT2lcd/NbSYf6Uhigd6SE?=
 =?us-ascii?Q?ItVpick/LFYMnh0R+mRbtwvXmxUgjY1+D2QexEOxCMXXK3wMGOfpbQUhkfOo?=
 =?us-ascii?Q?5rUsG+sq3d6GlkBlj8yvRVUUbl7N31/BJWxsU9mIH18Xi8vRjZALf0jXcVvF?=
 =?us-ascii?Q?EVDatS93E/4rswSKVRR23e8K+Flp8CD5wO6NoDpusgv4WbSkcBu+fA3VbETA?=
 =?us-ascii?Q?dqRiRvbCwNEj9zNTw4+mRa9QqxxXgCo7kKG5NR6tZp2R0wBPTvXQptzthYJp?=
 =?us-ascii?Q?EYZCiW5nJerd21/s1CqVHLWf2QToqwpeQPnq2iUioDaV0vJCdbtomv0ET1YK?=
 =?us-ascii?Q?vC6wESeGtIPT4Dx2316m0U26SbxZRa1N3y6tk6V2sGI1COGrqf02IqaKTYt9?=
 =?us-ascii?Q?zacVrgHVSEUOcT1+pYQKCbG7YoBaxDMMg0n19POamIKcWIDL9ui/ldLlMPJo?=
 =?us-ascii?Q?HvP8JRIweo0Haq4L3TScy6npVCp63b58KZ8uC4XSNSnIHmBFBbQo4+PfwYh6?=
 =?us-ascii?Q?e10Yh+hiTIXjZPQN1Ck0GsDcWybexUsn7hkkWi2tdv2r1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4LZXR1NhVdTbWJLaE8t3E8uyr+jrGETcD68yOV/IVaymo0gXnGvNDGa3Ut44?=
 =?us-ascii?Q?e3EJntlanCLivw8XoMqcI5FhxCtn6+BggJiYLVwg92D8Xpz8BV8gwOdkirLq?=
 =?us-ascii?Q?oNSvswLHUDSWIPxTXnjeNmUomT1YkeJnwjKg8LPi1pTxKR/Tr965v/vmJ3q9?=
 =?us-ascii?Q?AtPtv8zWndHN5PQ4oQKNowt4eTa4kqn308ley1fhQY/c8/6ySK6O8YmvqFMA?=
 =?us-ascii?Q?a01eLrBqeqaU9otz+G9mtlq7C8S3X7Glwvk1w6iWkWfUGkL1wEbUvndd1zKp?=
 =?us-ascii?Q?6nSwH3obodlhxjya7FVyWsyMR1SWUgkvMm9bH+qEvJj3T0H2m/nPHpfoGajz?=
 =?us-ascii?Q?Ppn9f4ZHIv40sYTnjgMYGZzdXkE59w0JupjgNtsBwkho0TChlBHMEZ3wcCrY?=
 =?us-ascii?Q?r+yLQwHMQCAwyQCgIO9XjyF0/isYUgbqGpz8x44UbSiyE/cZ5+8dwCIdCVsW?=
 =?us-ascii?Q?LYbxvOhUfLcyzpZQ3/LOCpn5imU8pmWODP+dxhKGTHbn2wEgYaWlSB1UUTUV?=
 =?us-ascii?Q?yG1RkZYUdOb2YHaySrPfKts23ImxkXaItBa93v7L7eI4OKLEMFrO+WVtCV7i?=
 =?us-ascii?Q?EpB+sGMYV9CwrCzFmto4uEvMUcaLdRz02aw9CPu6RPyNLm862fd+QtDhoLvC?=
 =?us-ascii?Q?v944sJGBD4pAsPLpBqxyx2O13L9hXJuyBfoBB5ByX4w85iMm/iyPBae6ks4Y?=
 =?us-ascii?Q?VRxXHu0Jd31rbDp4dAVs7l9KRzRJGKLUovxJYGnlq7BkxMHgPfR3GfxTYDeD?=
 =?us-ascii?Q?ZE9zfRylFUKkv10S8aWMMr7GJLbW8T95Y6jcYhJYpDkF2c4zvR1aNFIhRXmt?=
 =?us-ascii?Q?bl8ShOFd9g2GhGefXDrxw5x6tAv4C1UQHZs9I9Gr6lb81h3zvTOy7pvrRiE7?=
 =?us-ascii?Q?7PhRWROGs5f+QCi+b4K18fzXljZtDRpV+4CEAbQwypDfhVZxnT1VJViTWMXS?=
 =?us-ascii?Q?Fr+v4ldKn1yj9e9lBBVKkcQVx+4CmBUQy0xT6kHySMahePEXb2D16qmgCFMA?=
 =?us-ascii?Q?Xn2HBkNeFBarwM5MBwlEQsDhuhc/z8T1ulu/plp5QDVGUY1wDYjXsZQx1bjK?=
 =?us-ascii?Q?IaL+bCgRkovJCZAXe+Sxk32ab0sYuHJnNO2KAOJd9NseFbR0coIxbnCFxCqw?=
 =?us-ascii?Q?279MxIpxprjQAmTcbuPLD7BmFUkFxvkGPk3QitVuDvqsI7sVAuDDSp+GIVpj?=
 =?us-ascii?Q?GRpt18+cj6+BuZLwuiTjhk/JBfBi8zdJZuq1joOIKivrys7kicCBrTZLbmKJ?=
 =?us-ascii?Q?UFazgkdU8TVTrRxb6TIzuxT+N97R1RwwueInc/lgSssQC1nAtu9Hciy0u35q?=
 =?us-ascii?Q?tw8r9pWhTZp3+v9NctSV0eJoZsgXPDM7iEjH32fjMsLhamrsHcj8WL+v0FMr?=
 =?us-ascii?Q?oIr8/O8yainPfNMs5Jj5EsPzcHdQn4QPpiGoQqqbXSxhw6otD5iv0Y9n5nPy?=
 =?us-ascii?Q?um+QjcSLB3zx+b3lylLzd5r+6tnzJPmC0JpnKSEWAMuumehWjEiCqeACcfg1?=
 =?us-ascii?Q?T3YBDalL1HTiaFQCNo1rU5/oEdqnvyPDJTRtQHeTB55fE+FnH3T/ybZ2Mogp?=
 =?us-ascii?Q?yvBwLBzf9mYbPsB/BdOZgkmM+mf71dOsiB4q0rWc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78129b33-f4ac-408a-bc8e-08dd2b8ed330
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 00:37:38.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcGX21QZY/ybtdCUWzIXX4N6DLY9u2YpfxNPr0DR8UO79BTOQrE7J3gDZrt4m7gradvb2XT5pmXZmqkK07I2Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5316
X-OriginatorOrg: intel.com

On Fri, Jan 03, 2025 at 07:37:52AM +0800, kernel test robot wrote:
> Hi Ville,
> 
> FYI, the error/warning still remains.

Sorry, kindly ignore this report that the commit is not the initial cause of the issue.

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a drm/sti: Allow build with COMPILE_TEST=y
> date:   7 months ago
> config: hexagon-randconfig-002-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030713.36t97VZZ-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030713.36t97VZZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501030713.36t97VZZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/gpu/drm/sti/sti_compositor.c:10:
>    In file included from include/linux/io.h:14:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:548:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from drivers/gpu/drm/sti/sti_compositor.c:10:
>    In file included from include/linux/io.h:14:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:574:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from drivers/gpu/drm/sti/sti_compositor.c:10:
>    In file included from include/linux/io.h:14:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:585:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    In file included from drivers/gpu/drm/sti/sti_compositor.c:18:
>    In file included from include/drm/drm_vblank.h:32:
>    In file included from include/drm/drm_file.h:39:
>    In file included from include/drm/drm_prime.h:37:
>    In file included from include/linux/scatterlist.h:8:
>    In file included from include/linux/mm.h:2253:
>    include/linux/vmstat.h:514:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from drivers/gpu/drm/sti/sti_compositor.c:20:
>    In file included from drivers/gpu/drm/sti/sti_compositor.h:15:
>    In file included from drivers/gpu/drm/sti/sti_mixer.h:17:
> >> drivers/gpu/drm/sti/sti_plane.h:32:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       32 |         STI_GDP_0       = STI_GDP | STI_ID_0,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:33:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       33 |         STI_GDP_1       = STI_GDP | STI_ID_1,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:34:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       34 |         STI_GDP_2       = STI_GDP | STI_ID_2,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:35:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       35 |         STI_GDP_3       = STI_GDP | STI_ID_3,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:36:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       36 |         STI_HQVDP_0     = STI_VDP | STI_ID_0,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    12 errors generated.
> --
>    In file included from drivers/gpu/drm/sti/sti_plane.c:14:
>    In file included from include/drm/drm_gem_dma_helper.h:5:
>    In file included from include/drm/drm_file.h:39:
>    In file included from include/drm/drm_prime.h:37:
>    In file included from include/linux/scatterlist.h:8:
>    In file included from include/linux/mm.h:2253:
>    include/linux/vmstat.h:514:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from drivers/gpu/drm/sti/sti_plane.c:14:
>    In file included from include/drm/drm_gem_dma_helper.h:5:
>    In file included from include/drm/drm_file.h:39:
>    In file included from include/drm/drm_prime.h:37:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:548:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from drivers/gpu/drm/sti/sti_plane.c:14:
>    In file included from include/drm/drm_gem_dma_helper.h:5:
>    In file included from include/drm/drm_file.h:39:
>    In file included from include/drm/drm_prime.h:37:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:574:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from drivers/gpu/drm/sti/sti_plane.c:14:
>    In file included from include/drm/drm_gem_dma_helper.h:5:
>    In file included from include/drm/drm_file.h:39:
>    In file included from include/drm/drm_prime.h:37:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:585:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    In file included from drivers/gpu/drm/sti/sti_plane.c:16:
>    In file included from drivers/gpu/drm/sti/sti_compositor.h:15:
>    In file included from drivers/gpu/drm/sti/sti_mixer.h:17:
> >> drivers/gpu/drm/sti/sti_plane.h:32:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       32 |         STI_GDP_0       = STI_GDP | STI_ID_0,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:33:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       33 |         STI_GDP_1       = STI_GDP | STI_ID_1,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:34:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       34 |         STI_GDP_2       = STI_GDP | STI_ID_2,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:35:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       35 |         STI_GDP_3       = STI_GDP | STI_ID_3,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    drivers/gpu/drm/sti/sti_plane.h:36:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
>       36 |         STI_HQVDP_0     = STI_VDP | STI_ID_0,
>          |                           ~~~~~~~ ^ ~~~~~~~~
>    12 errors generated.
> 
> 
> vim +32 drivers/gpu/drm/sti/sti_plane.h
> 
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  30  
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  31  enum sti_plane_desc {
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31 @32  	STI_GDP_0       = STI_GDP | STI_ID_0,
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  33  	STI_GDP_1       = STI_GDP | STI_ID_1,
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  34  	STI_GDP_2       = STI_GDP | STI_ID_2,
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  35  	STI_GDP_3       = STI_GDP | STI_ID_3,
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  36  	STI_HQVDP_0     = STI_VDP | STI_ID_0,
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  37  	STI_CURSOR      = STI_CUR,
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  38  	STI_BACK        = STI_BCK
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  39  };
> 871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  40  
> 
> :::::: The code at line 32 was first introduced by commit
> :::::: 871bcdfea68560991bd650406e47a801ab9d635d drm/sti: code clean up
> 
> :::::: TO: Vincent Abriou <vincent.abriou@st.com>
> :::::: CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
