Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9CD18EB0;
	Mon, 22 Sep 2025 00:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758500262; cv=fail; b=qq8UtNevYYvbRd9+2jZUgdJKcjbi4C73BGF76lDWxbfeAX8pT+LqJWj5vq4ekK1BO9moqZJRDby3NaGE6HRiQfQxbOQeZgF1DsZoD1BhPJyNMvwqgXBQKI0TVKcuBTukBoGHn4BtgJKtQzNV4D14K3xoE9mBX3inK48YNb6yUJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758500262; c=relaxed/simple;
	bh=uG7yDkqJg3July6LafQG78VqQ9X1e3HhzwNth6hX7D0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sHsI99W9h3668PMWG1e5mTjA3YLCCXzm3SIovnv10Utfo5mE9fyVlaewI3Zzhj9Jva2UUfTP6XiJRs6pOANIWEd1sx4o0Ra+NBEtpM9ZQ+Q0VDA6x1vYBxUeKSGJ+aapJauAdXHdJ601iwcPQ1i+uRl0A4+U+iE8wIUu7vOneZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMUk4Gce; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMUk4Gce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758500260; x=1790036260;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uG7yDkqJg3July6LafQG78VqQ9X1e3HhzwNth6hX7D0=;
  b=VMUk4GceO4EAN0jct+gD1lgNIXIExTt5O3yKPhCNW1cfbNitzyHIZIMi
   zx4ed7CsSJDHzXo/8LDuUPZNOciH/3/G5Ymy5sPSwgPk2sHYOIiHQib4T
   57uhm9Ei9ZV/vQCkCbl/F0Wkldc0SOYV/c5xqHpymniAOSvNxk/5o2LS8
   u3nUxoyoizng8nzDSUkTuom/J/Sczzmlp8dk5kaWn6uouKXApBBQOOq1A
   MGDjOv7F9+i63ZuSKH5nF2TDvZSq4Et8qrHBiM+Za7SX3hTLuGieFxLCv
   QqZxHSm8cyyVfZdmR0vZVQu45aYj3dKXZ6e9xLpKiFzy7uOZXYNqDpeWf
   w==;
X-CSE-ConnectionGUID: 10sGK6r3Q/2rS+zE5Mo08A==
X-CSE-MsgGUID: v3uS+1QySZi7KTzfqJj/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59798948"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="59798948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 17:17:39 -0700
X-CSE-ConnectionGUID: vrPdp5M5Q1yEnMLd1k2M1g==
X-CSE-MsgGUID: 8qs/bp3OQmyCOH5szd1/Eg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 17:17:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 17:17:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 17:17:38 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 17:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd9K5ODRQoW2fHfxmdpU9PHKgFlPRYquilzmd5NZHTHijTX5j/ow4CMmczJJ+7gSswCfy50Cjr7llXob3Lb2/k2Mgw4mnUuKa6eqtEW3L/SNnnQ2fqQc62khjlFg2vMhJAZdRnC4Zb29JMuNwzlmjIZp/tdaLcWNJBUeFX/RpeOY48Ei/aHyb2jojaPItZwmCaSfwyQ3yinZM2IgByD4cEyHw2nFLKG/2IdHbyKf7Mjs+XDg1CTOWI2Aztifc5K94EdP3fnOOR4hk0auEZsITQbmXFQHJMcAbTD3BMv1NCCRDySqNL+mBlXupQqIBcKLJtMrac/giO5+t6JQCLFaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv+z4JPIKT1Jjdr+5DcWbkWyCXXyG7IJpyRKj2nOmts=;
 b=opOEndgGhWX1NWhNVDlVHfGVXrd1EGQoOH4FthGIRqSZtabzFcd1oxfl7nlAVXrxBAnz2DWh7BAlsU+pAaMJMYWRm6xPokmrRn6pw3UZAsk0/wIYqP+kxhlHVf6lNUaChYq2WCCiGFvBfE7NuC46SNxqMOWRHvS4IJ0300ZiWFFKty/egmIA8qE7bgzqam9TZatsvV5DLVbgTb48DNa+E7xMKTPZOY5NbEU9c6Dhg7efSfeWINSX+zQul6u5NL0DncYC9/CtnFaJSKxOTVyQtuorpPLP814yUIX8ATnaHr9T2HUZk8bFHHcT4bwE6RDhtkGBhVK0SfMyonQLfsQ52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 00:17:35 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 00:17:35 +0000
Date: Mon, 22 Sep 2025 08:17:27 +0800
From: Philip Li <philip.li@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: kernel test robot <lkp@intel.com>, Wolfram Sang
	<wsa-dev@sang-engineering.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Frank Li
	<Frank.Li@nxp.com>
Subject: Re: drivers/i3c/internals.h:54:9: error: passing 'const void *' to
 parameter of type 'void *' discards qualifiers
Message-ID: <aNCVl06r95XVn80G@rli9-mobl>
References: <202509212320.yCuqvnVn-lkp@intel.com>
 <202509212148052be5ea9d@mail.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202509212148052be5ea9d@mail.local>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cff78c6-5bd2-4867-d3ff-08ddf96d6e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JtlF9ay/uOGbN8uMqLjkYxB54T2MBGVcGoqPuVGSJCUvG/8tMKf1vRU2liAP?=
 =?us-ascii?Q?UdNzJAPh8WfB7AtSl0rGyYgDG+R9xMWDIYY7ekaJX9hy1KccHxcij6xdxOHn?=
 =?us-ascii?Q?kb9sybHhxYOkfGHe5QJEjvFclD3jRSCX6x8NzRvxr1BmC1sBUZ8mWVhk5PWk?=
 =?us-ascii?Q?kczaSZ+hXH587NLOT8uNgLTm5gRNQVfn4dcHnvPdRMFJnvxIBxGyCS2CtntZ?=
 =?us-ascii?Q?igynJKLFCGWnOEGliLx0soue+yNMlhmUkW9kUOnFXBoxteXLLAuV80CtyHtW?=
 =?us-ascii?Q?AG21Y/224w3jI9n9Q4muDy2qsBvPIY0CSrAHhccGfgyrSqR/Sep8k/Ou8HXH?=
 =?us-ascii?Q?ReEm+BB60TD1DQ4sW2qxsiC+zxRTcvHUm582oWlkCXaLi3GAe1z8TvWYIGB8?=
 =?us-ascii?Q?ExcRnrCiEzJF+CeSrJzkXVMpWXHq++KRmpSvhENIcg/rQ3dAvpTn871HHQtS?=
 =?us-ascii?Q?EeAz/PRTjMda3X082AFfBKkFfoXQp9xVXzLHPxw+atE/ccoQCuEWiQXyhuJZ?=
 =?us-ascii?Q?34aeCrt5mD3U0gsR9IFrDkxD/hqfIbm2cHDOY+N08Kb98m8ApznIxCGaGvCz?=
 =?us-ascii?Q?BdGKnphY6re7uwEu8KeKaxQadtg6tu3v26NdusL9GRXryMpS4ON5+agsXK6V?=
 =?us-ascii?Q?JrG6QblmlJtah3GF/zKLbkgvo1ldGhqOAM04DVL70eCGzlx/Q+IsNDIrBF5a?=
 =?us-ascii?Q?oixa+wfTRhAyLoU+ufrNOiYU0KJXJ0JecQn0cFWi1HsIkd/pSFRr232QzUnH?=
 =?us-ascii?Q?Ja4Lw7yXMLeieOxLPhQLdFWwl7qtik6Ury+CIQqRBZFHslVuyyjSDx5ptA1s?=
 =?us-ascii?Q?vaKbgQj0MhG+SKYeleHOMqiUdmIrd8h8WO15RkOD4+fJysIrT78u0swXSrJv?=
 =?us-ascii?Q?t74x2CQxkryj4ZkcwtfX8qZsTHYGZwSCSQ91SFAlLgVpSkw0EHWQGyGvNOh2?=
 =?us-ascii?Q?ZOtAqcMlNxdEdPiQwuToASMM8a41e1+cfRyNB7qXmuP1ce5VqmX1MulbuaVt?=
 =?us-ascii?Q?r2cDN5UUzYGsuUtafPpR1EeQ/csC/LuoIYcl1Rc3IvdKfBFd6QFRriEg0HaG?=
 =?us-ascii?Q?8+f9VPfvMXQWbF1HgA4L1nn57W8UthU3+uAS8+XZL5Vy4gRe2lK+M9chwDDO?=
 =?us-ascii?Q?lhsXmg44lF3CRrEJ5xOPXjUw5s1AYqPDN2c0dWkqHb8s05xEDIFMw8M0RhGe?=
 =?us-ascii?Q?ZByT8Xu+PB/SyRi9YbanYlF1shpBSDjG3pfT8/GWmxVVUfCP4R/T5pFzD6iT?=
 =?us-ascii?Q?1IX8b6TNnnxqbxouS0oX60rk3l/P3Wo/1HwTiUdnwcZHM0Nfvz7+FCXZPHPL?=
 =?us-ascii?Q?/ObWe4q3MO+TmK3KqDirNHfBqySdvKMCqcJ2u/fe7I/UblQj8hLIin3Kt5p1?=
 =?us-ascii?Q?Gosn4XwlkY/2b3mvSdA+sgUHcN8K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IwJ1luxNxlM+crIdpZPGOfqFlGPcUbqTKB0TgvtZU1bE9meSku3r/I585IhQ?=
 =?us-ascii?Q?nODWk5AXz5ZpAJdDyeW8fbWXm7EhpL1SY5hj5hQZHnkYgAk4ljWOaDXz3tPM?=
 =?us-ascii?Q?OFm0N6yJhq/8XMFmokoHs7xEGmdq9E0Bpc9ZiouZmf6Eu1owP/T2NEfFN7Wr?=
 =?us-ascii?Q?kEt2gRffgjr5ElEl/CB08+55lAmDf2CxvjAVN3mZ9RL18wOPYyZu4IYbUjqr?=
 =?us-ascii?Q?7z2c3paQOjLSSp7ngRAzodgKYx/p7mRcC2hKHC5kISEaVnhHJR3GDPo+I72W?=
 =?us-ascii?Q?EX0om97mkUvKIoiLq4Q0gwDoXAqf4Q9BMhy4STnGtYMJR1uFYFVZREnWp/rr?=
 =?us-ascii?Q?qGQECVGjmMznGaGbxGN2oytGaK+1V71pyaOXCPyheHWAmJX0qshgfAuIhXjn?=
 =?us-ascii?Q?HNg9KCas/vDGi5wdoO6U8UdM75HKHaYH8LjKrPkjnQvTP2LBgAhoF35tPlH8?=
 =?us-ascii?Q?OLr8Lp+BAjlq3HZk8ElDyHk/OBWY8omClql1Ho2hFAiqt+Alzhz+zuZZrC9f?=
 =?us-ascii?Q?g7OVmM4wIh1aVFHZUEl/uX6p4UQ2rwQAGEaMZMh26n9yRsugaNQLne6+KaOV?=
 =?us-ascii?Q?dYf/KbDldRTW3/+bFpq0dA9seclfh1KjVapXdUw1owyfy4AQC7Ae3bnbPdP1?=
 =?us-ascii?Q?2dXEV7iPV4RC97ledFI8/KV1Gb35POxtMx7YRglanVGGwrAhLB3XVywm9bH4?=
 =?us-ascii?Q?IAcppKsQntb97ArK2Liqa+mfWBcTBMHGaitohvHjb7dpJ9JcwjeFw4pIUkAJ?=
 =?us-ascii?Q?8hWRY0B9qnzXloHLXh3fYY2cs41e7KAJuYQkUanewelK3ev/REvqdZ2RvWow?=
 =?us-ascii?Q?OsfaKVMtTq/pn4Pn2VRwoM2nSyjT2TZxTwWXOhMY8jQzjbuPgvs34wMMm/iV?=
 =?us-ascii?Q?YFoLoCg/HItJ59ROevRFWJ94jWHLLdrWRda9vsPzDLziLuUJQoT9JOnsaeoD?=
 =?us-ascii?Q?j8R7gYlGQ9JE1kcIjBsNq1lZKoUHtZc7DxzhlLsLiRZHxoAQgk7h0TUeZ0iW?=
 =?us-ascii?Q?gVr4ANFRnPyN595Ai5V/VGcVRevZJvQ0NJ65HEQDXy/NVsf+6wYv7GfGvJqm?=
 =?us-ascii?Q?DdQwqHfKUviYhSOHZe/niOzhMDW/9OOND+jn5UPa+7FK/Nrx0OxH9gBvvZ1L?=
 =?us-ascii?Q?ZWJwSDbTMYKwm9UQDLZkYwI9Bg0qjwmgLFnHriJ3LAXwwWUeXXxJ/75lgYXa?=
 =?us-ascii?Q?cloY+BJ43S3bMlZZFtPGm54NCklnz9+Boi+OtCNbJ72Zn3H3JfU4P5xQjLEj?=
 =?us-ascii?Q?AJWEV7NpfAz/KUWjQGRWgf5Z3pIf1jqBRWQ3ilw49UUNpxOxwxqWo3017ZG5?=
 =?us-ascii?Q?609Hgg/vWbYLAoYihAOqq/GG69Ij6fiJCplvqm1aUfCLDhHsgYlwCXSWwqdM?=
 =?us-ascii?Q?8yztGRG8lnFWIhMuyicqo8TLJNtRMRXW6ap3Ow9MFnBEg6OKn0X1XRofRafH?=
 =?us-ascii?Q?KaDWu4WuLxdBi0AEzHfQ6ZRX1g+jtNIVTMewiZm2EsO4GB/Q3TrrSWOWX39V?=
 =?us-ascii?Q?IvHCH7HQcKKi5yEfW2rdgmo+l/MKMSMEsa2K4MvO40nR4GzWkwfxDLx3oi5U?=
 =?us-ascii?Q?iRJEDUYLuei7Sz6CvwDXJeREE6ClHHiudHUq1Lya?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cff78c6-5bd2-4867-d3ff-08ddf96d6e2e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 00:17:35.5209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJXgUMxAg9HivwA+JsMEZ2VTNHwf9VrAiVEHjd69SnM+kTndZEIRQLdWkD6lPc6BNInC1QOpqGdd0ZWOpRveQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-OriginatorOrg: intel.com

On Sun, Sep 21, 2025 at 11:48:05PM +0200, Alexandre Belloni wrote:
> Hello,
> 
> On 21/09/2025 23:54:32+0800, kernel test robot wrote:
> > Hi Wolfram,
> > 
> > FYI, the error/warning still remains.
> > 
> 
> As replied multiple times, the error is in the sparc64 code, not i3c.

Sorry about this, the bot will be configured to ignore this issue to
avoid further reports.

> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
> > commit: 3b661ca549b9e5bb11d0bc97ada6110aac3282d2 i3c: add missing include to internal header
> > date:   8 weeks ago
> > config: sparc64-randconfig-001-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212320.yCuqvnVn-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212320.yCuqvnVn-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509212320.yCuqvnVn-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from drivers/i3c/master.c:21:
> > >> drivers/i3c/internals.h:54:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >       54 |         readsl(addr, buf, nbytes / 4);
> >          |                ^~~~
> >    arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
> >      265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
> >          |                                         ^
> >    1 error generated.
> > 
> > 
> > vim +54 drivers/i3c/internals.h
> > 
> > 733b439375b494 Jorge Marques 2025-06-24  44  
> > 733b439375b494 Jorge Marques 2025-06-24  45  /**
> > 733b439375b494 Jorge Marques 2025-06-24  46   * i3c_readl_fifo - Read data buffer from 32bit FIFO
> > 733b439375b494 Jorge Marques 2025-06-24  47   * @addr: FIFO Address to read from
> > 733b439375b494 Jorge Marques 2025-06-24  48   * @buf: Pointer to the buffer to store read bytes
> > 733b439375b494 Jorge Marques 2025-06-24  49   * @nbytes: Number of bytes to read
> > 733b439375b494 Jorge Marques 2025-06-24  50   */
> > 733b439375b494 Jorge Marques 2025-06-24  51  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> > 733b439375b494 Jorge Marques 2025-06-24  52  				  int nbytes)
> > 733b439375b494 Jorge Marques 2025-06-24  53  {
> > 733b439375b494 Jorge Marques 2025-06-24 @54  	readsl(addr, buf, nbytes / 4);
> > 733b439375b494 Jorge Marques 2025-06-24  55  	if (nbytes & 3) {
> > 733b439375b494 Jorge Marques 2025-06-24  56  		u32 tmp;
> > 733b439375b494 Jorge Marques 2025-06-24  57  
> > 733b439375b494 Jorge Marques 2025-06-24  58  		tmp = readl(addr);
> > 733b439375b494 Jorge Marques 2025-06-24  59  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> > 733b439375b494 Jorge Marques 2025-06-24  60  	}
> > 733b439375b494 Jorge Marques 2025-06-24  61  }
> > 733b439375b494 Jorge Marques 2025-06-24  62  
> > 
> > :::::: The code at line 54 was first introduced by commit
> > :::::: 733b439375b494e8a6950ab47d18a4b615b73cb3 i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
> > 
> > :::::: TO: Jorge Marques <jorge.marques@analog.com>
> > :::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
