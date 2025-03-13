Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158718DB0B;
	Thu, 13 Mar 2025 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741907192; cv=fail; b=nZrggbwNAe4LhTIKxFlmm84iAFdnUMgz0pAxNCDxFYzDectDu1dgESKcOivTqyWQKerYmZpTw7IeH1Ic6OTrgxt0uY8CT5CmhDL2nGQKU87a8o2lOAwSfVOaQBHBXT//I+eDB78xQtgFXDlK8YhJWfQ94aTfdTLt2EghunWpvZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741907192; c=relaxed/simple;
	bh=yGtHHm0f5wqackHlu68AWDPp8YzNju1Tfp1EzY1S80Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qIzqcEeBPHgDvIwVqDkB2lxqXtpZdhTD8IJvMqNul3GPhy+FxbJ5x+6jK2jNZPbdHGBwSTUrwssF6MGZ3xFTGKk7yEQfzXcwTbmXgQlLn0JhA0N+3TK+YvK3zwNXa4WbqMrCgRWsnU/VCwj7fK1xJ84QChGj6BczQjWZ4JaVmu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhw2CAKL; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhw2CAKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741907190; x=1773443190;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yGtHHm0f5wqackHlu68AWDPp8YzNju1Tfp1EzY1S80Q=;
  b=bhw2CAKLxAqShhUssF0+Wt6p/A8F+GLKbyu+PY8KH69zm1Mp+B6og4YG
   0BwxELe+tBFD0Rkhc9wV6ZL0s+g+uGA3asZJusKVNpr4ohL9ORGHuRv+N
   aCU3ZDYlcUN8xfdyxxI2wWlBuAiwf2CfBbRVoe4qvB9IB7Ly76kxWBfnh
   5lNtCi3LYYNsqzkO9LmDEpSzHNPP4HaO6VNffeeL23QALvQco4f50XLIt
   EZPMA8lD5xctOeF4mzb7CxHXP92BujA/IqXXcSRBj9GL9NUy9GnHWooen
   6WlxRnzpE2BWTeuIVBtlCf0jsKxIRrdu8gonCusI8r28d8xDdOhifJS+Q
   g==;
X-CSE-ConnectionGUID: HdolDl96RquNAtLDSIgf1w==
X-CSE-MsgGUID: 5qTZUmrzSIe0SK8JwkjbXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43223933"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="43223933"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 16:06:29 -0700
X-CSE-ConnectionGUID: dOQzx0S/R6+JNHdPZFyxwQ==
X-CSE-MsgGUID: gP9y37dlTySaIImclmtRWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="126166917"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Mar 2025 16:06:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 16:06:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 16:06:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 16:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RA7YbSOm8iQOcetp36lu/etMOHsWE349wlLwiqL25AmJTKLm0gc9tTsytj18FDh9d/Yq/ihNWZIsVlhTCmUKC2VdDPTitfHssYQMtv9C+ok/8R3VPkaPEo2lG/HxLK7gabemo67BVCoEHUWQ52qCd3bE70g6T/CACY0163YF6g6Kr57UMl76VpEnB4PbD+/Q2niFUsQbo5BYi1V+MwY0xH8nglmdfMQdJ0Z4620ADEKmAk+JGaLtkyxvmkK7kzHVfttwUeWvLemfFIq2ErI9jb/QXEgnkgkQhCNiEbAfvYBex5HJQUlnas63fDbdQVI3gwzK7DZiPfCupSmlSyLcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Wwpwj0n1EZrEsdSvpBX8cWV4IcsQT7mWMcyy4S1uPg=;
 b=eev/Cq8H+yiHBj7aufpES0plkpULG/FJ+U/+ZXnFzEFHVyVUA6pI+ctwooCHZT/U3LmQYQ5AskzU9E/QvMsRcFTU+vft3q2ErcCTYzLWCFjVfWBX98UHfzffPGPSLlvzd77hwmDAdIG+H2D9ED9gl50wK/EcbwokqerPt4fu213KXTUgkYEO+9HgDCIXVknCdCPeUjRJimV1hfV35ngCHIBW7YUdx9fxjCK/+qjn/ZfhQzFQLODA2JPyUXH11z1yNwE7Mlj+Llqelxwx7yJuEVNcP4EeQLN515KL0NgOrAXikgWYensavfsrbtXYU4jU79fPSf5eAn1afeJkYvxdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 23:06:10 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 23:06:10 +0000
Date: Fri, 14 Mar 2025 07:06:02 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH V8 2/6] perf: attach/detach PMU specific data
Message-ID: <Z9Nk2mFCxTEFx74C@rli9-mobl>
References: <20250312182525.4078433-2-kan.liang@linux.intel.com>
 <202503130756.2j1ZuGT4-lkp@intel.com>
 <20250313150902.GA2418865@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250313150902.GA2418865@ax162>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: f9730e58-1da0-4b0b-e696-08dd6283a4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vq0Fxu4PCd9ZflyGwI8xjgIlIz8aq7HEwXUP7/JK/n3IG3073F2hzFKqVbPS?=
 =?us-ascii?Q?g57s6DZeptQWlbqiucssKZKBGhLx/+NCtrPXkk7U72fO/Zcsya/aXx6Xshv+?=
 =?us-ascii?Q?T3NngtQePqZ6OV8P4LS/BcDeGynxCoLEAP44wiykWzM1pXiQqjZLSlDOKBwq?=
 =?us-ascii?Q?P5M3kKKa2oa0+bbuzcwvP8WCDPrkk092vIWgbUaFiCAXI3oAIovbuL7IxaaQ?=
 =?us-ascii?Q?nsnIRCyk/zwwjXBqBtsoNIj29Ac92WTs6+J2yhA4/Qo5kZL9z3yQQtI0IbcL?=
 =?us-ascii?Q?M9CpOI3EP9uQYc2FrdBrFs0wKxGygDYYfc+EPI1KZdgzzlFwUPBSjzhBYYYJ?=
 =?us-ascii?Q?zlK6tTXVxuOJqfmBiOubq9rNxXE8ojfQDAT173vJzllFJum5Yb38JvAehmc0?=
 =?us-ascii?Q?OsebBoIUK/oIQh9BsGRUN+qbxj8GOxpwxJ4H/6Ld2221hWtxCHa8g0+QJDo5?=
 =?us-ascii?Q?fCWfcnD5ba+GH+B86WgzHSL2JZ2ayvEcGKNIAIGe8c87vlwmMa4OAmRh2m6F?=
 =?us-ascii?Q?kZZ0Dr8RX6l5YVfQDgpm+ch9pKFwFkhbqoGIk+7kTOg9PEuMzPZwCwdzN/Q0?=
 =?us-ascii?Q?lG33WB6rjO/q4WpSOM1spBtQK8bqz8rLYP2/42tC3857RTnjMStc6sGS3nPR?=
 =?us-ascii?Q?+tULWqODcUA1ObRyKsQNTtrh3/D3yBn6ncdLhfFydkftIPx1+IwpcZYVr5Jq?=
 =?us-ascii?Q?lYnayyLCeXN0TFTRw8a4qI5lyLvpL8gnZuWK6hxKAaZ9r2JF16BaUwJmdHoe?=
 =?us-ascii?Q?D+PUp4Kxyh9ZQ0gPuTRNr0ua6eMBlEpyr/uTUDguBbdC2v1SjHsUCeM0fak+?=
 =?us-ascii?Q?AMhcxIS6EPAHIXu+psO9Tqm8esGoyzlZrubogcZK76ayEnsFIiMBtPN/F7qK?=
 =?us-ascii?Q?iDoXq8pzACAqZsC5JBMMJ9PXx42i+1D1sfSDJ+Igj1T010uiLvvzJxYJcxRt?=
 =?us-ascii?Q?Q86MsMPvn/45EauQoCUMfLpKyC5v1LIcyqbSJ4MkrWBPLccDIAIuC/PqoxZ8?=
 =?us-ascii?Q?VHnTnyhYWeg32hs7itwZOV+XQpBJK5DcVUj8v3/a7/ZEcXmoq9nFTcoBmzGJ?=
 =?us-ascii?Q?tI/D8FZ7BHqcERX20aKDw+gMj/yqaTlX6SG4elzpzTAnNqSULaZyWsMtWc/L?=
 =?us-ascii?Q?MatWmKxEC1AfwcPO26jVpLvTtrnstTJ3maLCz2gNKHkNtLN/GnBNehU14C7c?=
 =?us-ascii?Q?+admaWOXUvw0GOj/0KaRVaKQNy+6Jhj/ggqoefgNtaPkxFC6r2FKXzuCh8wB?=
 =?us-ascii?Q?pjc40bt7Say13ucpUdG2SWscpPKJLUMlObm9eirF8otZtmcDRXntWx7HAy1b?=
 =?us-ascii?Q?cMd/kZ0LpU8gVKT/lHTGAhOsdLWcs3UWCO3duCMGU4Nc6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?db4B7c+k0dlIm0f++tOVuBmFhRB1ZsGrAQE6fFaReldL8Rpg1K4QwgyChQvb?=
 =?us-ascii?Q?eUn17HzrVjRp3sC+lin+pSHbEd6uZdx1/QA5hKjOiSbUxwERBEEOrkffAGQZ?=
 =?us-ascii?Q?x2Zlu6dZ80pwXhyvLcmChL22qtmoHKQALfGPwQ1adThTyAOeGMLoNU7LCIms?=
 =?us-ascii?Q?YQETkidEV1AVsSVHMmktUafXLougmSzuJl1tnbw8yHU2Rk6hwiUxFnYYyrAa?=
 =?us-ascii?Q?JIRV04sSWsCa62c4/UlYvgIZ/2MPX7/z2IneZNN0af5RRjWKxf3nTCoJMyOB?=
 =?us-ascii?Q?ocHTE+aemItdmqyW/OLR40Fmdph182g5+szqkQfVi/+yS9R6PfEeIOubbvEQ?=
 =?us-ascii?Q?n6ypBSKg7GC0u+kEQ+AcWBHlC1NUhMN1nYUnkODHJ4CsiLwsdMdKISvIDI8p?=
 =?us-ascii?Q?YxGjj3V/3n4iO8NQtyrNNPY36Ie2eCiqdLVOwnMkYHRI+JnFcvViDndpTni5?=
 =?us-ascii?Q?Tz1Fjvv0OJqCxpXn9C+AfdpMgz/oMT0B845CTS9iYpcNWiIJxjrUsdp3aLbu?=
 =?us-ascii?Q?tzITAf6KzEe7CrhLh8zzw4r8u1hAaSv6GieQzpE2hpoV2TyEUt2pKMsTza3R?=
 =?us-ascii?Q?oMRpFhZCicOvW2106cLIt9sej7BUMi+Lr/HYtb6HIdTprIai/QEKMnPsx/6C?=
 =?us-ascii?Q?d9dzhBHGYB3z/7EkaKC2RH6/yyqcHsgMDpnoVts29ossZuSIfXyHxbse/0pF?=
 =?us-ascii?Q?AR9CqsgR1ObYQ6gJkwciYHjTlkn+bpYKyJER/SlmD3EoWfT8dg5nxBQUVbgk?=
 =?us-ascii?Q?LvcUf2fIW/UJ1E6osvGOf32Nxb1j3sQqe7qRAKTRtn7w45m+767eU0ZuAe4r?=
 =?us-ascii?Q?gWkDXM5Dv/xHAa2sbv4KZQcRufXSpy1SVtPYHAY7e/Go6zZMrWMGI7Tb7SsV?=
 =?us-ascii?Q?TefO/+3s5JeljJFHSVTE++geimXSUoaMSrBUT+7/HI6RfrbWa4tMFvtuvxvX?=
 =?us-ascii?Q?L5T5e9yTl0RVG7WhOzq0nXiDXNw53GgKZMFBQLicOKw64oh6jUHWjioyNKCU?=
 =?us-ascii?Q?pCSml3m1o/zWFTGEHJ6U33SDgcNt31vIUgSuuSQp5pbgI8cskgLALKxvk5aX?=
 =?us-ascii?Q?csAtY0jDzfNOLI5SY7bvz9s++Sk1mqQUPLoFGP86gj7iJk0uuLRpWVMbgr6J?=
 =?us-ascii?Q?E+nIjv/7E5xdV4ZGW7PmPHCWakwmMemDt4lYPb6uG5fJLMDyejGa9Bp5kaO2?=
 =?us-ascii?Q?Zj/jx1KkAQd6l/Pym0XWdT+p66qIE/QKUt4cUhCBERNxjBC9kRCpPBYB79Fw?=
 =?us-ascii?Q?HOrp6g8ooxNYoj7MTSmdmBXMrdat5vPdeqVcDUqww9Csq3OOVjH1PtXJEaqD?=
 =?us-ascii?Q?M7Rsv5OpmL7TdIQi3vMV6RiWlbUs8UWQdyuLxTY6oXkz32Q/D/AxRix/7aKG?=
 =?us-ascii?Q?Jfi8FjSNZjrwrB7Hux62+JaWnKivHWDX7J0RW23bVTlGwL8f1BjndhAZJTg7?=
 =?us-ascii?Q?VYtyAg7NCO0NQAUVO9HTEePckq90rRB+QTT9gfMk8xcXJI5X/hhFZ7TJywjv?=
 =?us-ascii?Q?nwb1Ph81FSWRln9HoDbX2xCAsC0KUjFqT21AyHMJJWAWJS6LqUYswE8/ZKDh?=
 =?us-ascii?Q?qqdhDiqRrHoFolPUlGruWjGSJxEg3nYtexX6tjE5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9730e58-1da0-4b0b-e696-08dd6283a4e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 23:06:10.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TRnxHTpCQ2ImtvWrQZJzDVy5lKcSxKMl6zm+GBXuXHnkN4mBDN2B0LPBpo2EB0ZtR3aR18pk4AAJqwfM0JlMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
X-OriginatorOrg: intel.com

On Thu, Mar 13, 2025 at 04:09:02PM +0100, Nathan Chancellor wrote:
> Hi Intel folks,
> 
> On Thu, Mar 13, 2025 at 07:46:26AM +0800, kernel test robot wrote:
> ...
> > url:    https://github.com/intel-lab-lkp/linux/commits/kan-liang-linux-intel-com/perf-attach-detach-PMU-specific-data/20250313-022851
> > base:   tip/perf/core
> > patch link:    https://lore.kernel.org/r/20250312182525.4078433-2-kan.liang%40linux.intel.com
> > patch subject: [PATCH V8 2/6] perf: attach/detach PMU specific data
> > config: csky-randconfig-002-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130756.2j1ZuGT4-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130756.2j1ZuGT4-lkp@intel.com/reproduce)
> 
> I am noticing a number of recent reports that are being sent to our
> mailing list (llvm@lists.linux.dev) when the compiler is not clang, is
> something wrong with your filtering? Here are a number of examples:

Sorry, there's a bug introduced in the bot but not noticed, I will fix it asap.

> 
> https://lore.kernel.org/202503130708.AmtUDVfq-lkp@intel.com/
> https://lore.kernel.org/202503131646.3EOj6ycs-lkp@intel.com/
> https://lore.kernel.org/202503131715.Fb6CfjhT-lkp@intel.com/
> https://lore.kernel.org/202503132205.Ajz52k8I-lkp@intel.com/
> https://lore.kernel.org/202503132205.Vf8imlWS-lkp@intel.com/
> https://lore.kernel.org/202503132256.f6p359iT-lkp@intel.com/
> 
> Cheers,
> Nathan
> 
