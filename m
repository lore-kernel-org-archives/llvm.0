Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909A4400;
	Thu,  3 Jul 2025 01:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506756; cv=fail; b=KeILQyhwkpBPfwq+BimV8w0fBgJ+CaZ0j2FlsTAqzUDb8n3PXrZxuUXXvsZwa+qo3twCLORJFT84sKo3tW+JonHVZbB08nOSSYQv5BMD+EzIb5oHzI53ncUWxeYxnnw3tfch7vhUC49tFYG+r7G+EoMpWPs1CcHAPkcuTVhxzc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506756; c=relaxed/simple;
	bh=Svlnth4yYHczHXTyyCvzK68pl/quCdns2Y8oRXCjXfM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CJObA9g8uC9K5QKmLwANezAhKohuQ96lv/d1VuGU0Ghwnkx+L5plieBH2ovFWQiX0ZtbsaWVTycY0Zu5jwMo6gj8dkQwT3Q5lXdopMWJcPXlZ0/LmPIOZn6Glv5yQkq8ZhV+AyPdOrJMPqavCU/eFRDri1FMMvZiB+0r+D4WOas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTNiAVbu; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTNiAVbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751506755; x=1783042755;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Svlnth4yYHczHXTyyCvzK68pl/quCdns2Y8oRXCjXfM=;
  b=JTNiAVbu5eEa6U5oLVTyGdl1cGA8uVRtbQdty7XiEaqn9zue5VXNfAiZ
   YuTFbLK9p3sibKN2YYqyOR9wsa+iYUCD/pogl03H2WiLH/0fuwoxyerQl
   EDUVb36KohH4oVBDWK2+KmuE/vikZDjikgCRSZT3vXzsn12jfsMdmjkuS
   TC2EzGeBArchIKrRD6GoxuJFfs1wisk3VJ44hffE+nRhAmzXxfgjkD/yU
   pHswGialXZQPYjTMeXLRPLuXoyIWtGIiYrk8ght4mb6xQzvuejKSoJT5d
   LxStFUuw2ua686pEcXqf/oAg6KPIRMA+QYc9NeYuUuZgL9M6mg8i+282S
   A==;
X-CSE-ConnectionGUID: exYwJG2NTH600c+Vuacc0g==
X-CSE-MsgGUID: 1vBHXnbFSbKWwu3YzQBlSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64516539"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64516539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 18:39:14 -0700
X-CSE-ConnectionGUID: 497bHnrxTHyBFU1okY00BA==
X-CSE-MsgGUID: HO22w49RSt+WC0tkTbuFZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158516139"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 18:39:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 18:38:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 18:38:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 18:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uevlISFJVxh0Byz2E1taaUetzuUD0ISxm1AaUen6hOnWOP66cYnGoLLIdOYhIM0yZ9KsIw0nyOcu60BspcgROI8s+cFYG6QkcKlAhfD7tNRFK30LRikeuAcTy1E37nh1m6ZLeno1ro0TNHS2kAylubTIof/lu5So7TPgG930qWPmlO0npI6MWofuvtsBfJeG0fQwH9osoy5Jnzt+kTvnmo/JG68lt72NGN2Pm8jwrlTCAEGTskDFrD4roJXgmGCNKJGV2Y7aJu2NVGV8pv9H3Cf3Nj/H78hlsurNYiq5cKhJGoFTYdzWVb3fIoyPYYlAs4tnH66ygnkjTMHeXbB76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtkPs6vu9MT/HpWJtSqNssVV76WzGuI9BUA116ySqn4=;
 b=lAVke3Fxnsafhs+ECqfzIoK8w3jqgbtC5NaMhSBy7wloFUgKz+l/LkUKVInfu4MGzks7R/IrBcgz7eYbqKVUKe2SypxQhNakaBnvctvQSKJ40tlXoXAbHdH1jbGrrAnoA3Rd2ysFE7RmoVOE0jb3JolKMdMOiYzIHKr61Mss1HrB2cYYX1BH7EXEtZgh4PXC3SDs/87MzPWGBo663PcOkkWaF/m8L6LPY33KmL5wq06IOXYT642sqj50JYCwlJ0tDiSTHNQF65+5JArkP3DvoStuHEZn95dMvq76PhSHS3rNCACGTJjtb4sbrzVmuS68VbDT6tB613cjnkN+IXhnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 01:38:47 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 01:38:46 +0000
Date: Thu, 3 Jul 2025 09:38:37 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, Dmitry Baryshkov <lumag@kernel.org>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Stephen Boyd
	<swboyd@chromium.org>
Subject: Re: [linux-next:master 3022/4739] drivers/gpu/drm/msm/msm.o:
 warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section
 .text.msm_dp_ctrl_on_stream
Message-ID: <aGXfHf7dwomigqi1@rli9-mobl>
References: <202506251051.7rmus46j-lkp@intel.com>
 <20250702213716.GA2103156@ax162>
 <20250702214459.GC2103156@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702214459.GC2103156@ax162>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffa764e-32e4-428c-5265-08ddb9d25a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bjyHh/1fk5tmhN+gDgTXWr8KLql5mrc+bcSjfXta6HDbFKUMDhL8vu0Sqh6M?=
 =?us-ascii?Q?OQBOsq06i67Hj66Tvcfp5MNY6MciFi74WPklBfGGmQsyeqZ0R5frJK3B3CBE?=
 =?us-ascii?Q?kvHkWzbeMgcI6nwryZ5+QWXroMvOKYrRdJP1ZHYRDQUBo8IeF/owAncwWrbi?=
 =?us-ascii?Q?L2b5MOKWFyUxFafYTEU0g00VZggv0f9F48PVl5SvbhUGsdmPTXLe0dgc+IAW?=
 =?us-ascii?Q?0D9HF6sDpmkpZ0h1e2WkOg8Zd3gQpFyQCgxU6PLK2EiCDY1uKEMpG3hMy2D0?=
 =?us-ascii?Q?Z+wbY79Gx08qRszaPbFWfzCbfWxe3KPG+525Uha8r7w3xz67snRpsOW8LhT3?=
 =?us-ascii?Q?OqcpHuXoK+FANAo8I7bwKfaiFWkYX368LGwiDf1ULjyUFbubvQN+2HwEKqy6?=
 =?us-ascii?Q?LR1ATsSChs8D2RNRyQOlPCG4eB92hDYtgLPEtVoL6zGFA0wtCEIC5gDWs8oV?=
 =?us-ascii?Q?plzicQ/PLnl9hTVNmK51xOXIDlrvdaUWnSYVtmpuJAsKk7z+qjeRQOFIgyqk?=
 =?us-ascii?Q?w/Ng4aOIk7lbIs2JbPhl1StEa//dKZ5ucQon+UuqkzhN+wDMiJSRHQ0Tf6YM?=
 =?us-ascii?Q?gmGosmg4Hyhz7zpNAP6DAdVIhqjT5vYT2cnfF1HrHJkTAOOD1E/ro2VDj+8S?=
 =?us-ascii?Q?t+GgB3zLMpRjcLJsFJOexjzZ/y8iVfTu4SA/Q8JigYL0In/stVHfO5EOV43O?=
 =?us-ascii?Q?0PMHLVmCPYQGcY0v2h10kzYiCjVzGAmtVZvn4lT3W7fP5Yw2KjnxsEtZLy27?=
 =?us-ascii?Q?8MfF+25HDdjswxOuC2X3CwBK4EWFmGIN0lIIl/EIZCi6K/32lYXSCgwBw2zN?=
 =?us-ascii?Q?jA+XFeOm8KOlRHjeJXp//8MIlcQpL/a7pRhlx9SiTyVmMQ5DDc6rn1Gz2di9?=
 =?us-ascii?Q?vK/DiIlvpicYHDzSdhmOxwZmHoKIsjM13EARrZx2PPqklpUdsQkVahCmqHzf?=
 =?us-ascii?Q?BD5tEWzMi2cZNqkH4o1edW3uyCfbL2jfaFR4GP/KKnqn/eHCpPgQELCd0ELI?=
 =?us-ascii?Q?AYqF1LZ5mp7cfvJFdSsadL9v9kUXQGpqYzgbBinaqO8eUivpkTCz0ITmrONN?=
 =?us-ascii?Q?6gpM70kljHO47Ldb8Vv+AUEjmmKBbXOpPdzLyv63v/cFHC022XYkUG5jorgg?=
 =?us-ascii?Q?updaOdxdfiQAR2VXwWQaJP6ViiAU2LHj3EfGGF26CQr3q8YEVr4U5VQJXfvb?=
 =?us-ascii?Q?E5GWRo9EtJJV+UxU2wOTxpc2VMUey/UMJNxnGgywaAcKKmVxaT1k8vj/hGHC?=
 =?us-ascii?Q?px07n+i3flPoyj1o3sYz2QYXpRJ6PoDUDbofcKU7MiB1AE7/JdrAl/v8esCc?=
 =?us-ascii?Q?m43AqxCno3hMIx6ht9h50fBUSfJlTE5LBTBcEC0milDWsMVgOwh+i2y2tlkG?=
 =?us-ascii?Q?O6JghK7BCSzYZFFE1pUZToUjIZJm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WKQ7yZSXlir1b1a3WC1lOXZdzE1erVrCdMYzNMnZp4da6Nh4418OESb57+Ce?=
 =?us-ascii?Q?DgQnH8oxdnOft7E/vItrkomnKyM0knjjcFFl266Qbvy4fSXjpA1igHF63UcG?=
 =?us-ascii?Q?U7dwdqk8y5Rq4GbHbANyLMegua/KdCFCBMGE5DQyreEi4b9golhH+hvo3hOp?=
 =?us-ascii?Q?YdsxJsTeHBrqfmdurMppyvuihQAvZnd2CiTpTQOTbliouPLIovNtyXxvwavr?=
 =?us-ascii?Q?QnDKcv1X3cJFde2fzYi3AlBr6zX7sMmNywDcwOAAbg7lGqMALln0Ozu8NC1P?=
 =?us-ascii?Q?81V+rM3YK5KaM6h/sLwsMLSk++ASGi+fGBLpIm0WHCKpZTkS/C7otayoa77d?=
 =?us-ascii?Q?UDd2eCcW7/2cG78OR87BJS4lZBGn2jhL8vE3yuKi9Mgnp5xZfCNRfQJlvakr?=
 =?us-ascii?Q?ih8VEMkHfKDI1hzXP86vjTu66b5JUMQhhPIk4Er9bLP0T+oSVicjmKVqi1D0?=
 =?us-ascii?Q?qdQg6p4UOxVge9ps0IcluATp7ki4S94WpQj9km6CW1c4kYnsWTsYPEBL8kbI?=
 =?us-ascii?Q?YfOVPbqM5jR+1VTEyBvudaZ52TyVWx97o53sDkAARtMCfB7g7TKXHnmXGwCJ?=
 =?us-ascii?Q?DnAn2syMarV1sL19wAE+2lP2DidcxH5hQVaE3fzwlBbqNImPJuJnQcwJhiqs?=
 =?us-ascii?Q?8Yg/K7tLmazKg7AoBNubfRSb5H0uAkLHpZX1AVZyYBWxZhhpVhRUN0MoNQZH?=
 =?us-ascii?Q?/U0kuKMI+eIxTuSceyqdQun0H5Vg+RCT+gP1eXUHj8DDUJITmRSq+uP1BdU4?=
 =?us-ascii?Q?y6Tbz0kidvFJ+4kJuPqBeeRoIAFIlyI7n/x8ST18akLXdZ63ZbQuiGfshEwt?=
 =?us-ascii?Q?oH9JDizv3hQyWh1+sNv8F1Udax3omqWLzMdi1swC9YMVx8gdVc776CHNqsbx?=
 =?us-ascii?Q?//2EX9/xFmnyHUq7rC5+zYMNNsJ/7KOxTNs4KWEg0oC3WLOahZgLxjjIV5Ys?=
 =?us-ascii?Q?SI8BOXrXUwF+GuO+yJIwvgOpGhMGOglHo06XqMa+sziEzhnWruCZ8t5bjEEX?=
 =?us-ascii?Q?VvSYQ5kWICZgEgo7uJQcbsLze9gphtL5AOVid44uQe3qT8D/QqbgOHzH9oEu?=
 =?us-ascii?Q?opg+c7mvjgbh+q+g41+CFDXYbRBxbobkKwjGKSlyYHYOekHDRvcoGDadL0zI?=
 =?us-ascii?Q?0TK58gESZ4JG1qwSPxEPv2gAI+nlb6YU2dggYDx7oava4ztD98LP+iOqygu9?=
 =?us-ascii?Q?VTRGSu9jmOora2C7B9zNgiqFNVLTwfDvQxjKe95S3Ho/uwT0Yjus1xx3WeQV?=
 =?us-ascii?Q?aGvDlsgHBCzdgeD4nVK8tfY2VQFhg2M1pq+qlw/KQWd2zI6Hl18nHgX0wjjy?=
 =?us-ascii?Q?oXHfG+UZHk7dPAHA69LhzpH8hdnVbjE1ZZay43gRqXlYGfTaA2ptVBGj+3mz?=
 =?us-ascii?Q?YP+SmKC7L/tM8AedQvkO5QYyYdXmTX19jmV+WDkpq5SKqn3ucH4R3vmOWsL9?=
 =?us-ascii?Q?MwYCO/emxXaGNmmEET7bBhHNZNxqChCSWTaYs3Q7UD+ScMP9BJQkNYa7d0g5?=
 =?us-ascii?Q?LeaNrUw77663liLm/cYgJ8oWroJMQ7BbMT2W+eJCECbXjR0jjelc7/P/aMfI?=
 =?us-ascii?Q?UD0rBK5HQ36WNegHuh5q/J+G0iMw1ErFdG14VdCh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffa764e-32e4-428c-5265-08ddb9d25a49
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 01:38:46.8697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SWJxLr9YnLA4QpC2YW90oMW92/iySfDv4NHc8/hanWkgS00N71AZ+PDePyjzllR6Mg+zhEHFSwLPy2xgVMKDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
X-OriginatorOrg: intel.com

On Wed, Jul 02, 2025 at 02:44:59PM -0700, Nathan Chancellor wrote:
> + Dmitry's @kernel.org address, should these reports use .mailmap from
> mainline to ensure they get sent to up to date addresses?

Thanks Nathan, I will update the bot to use the correct address from the latest
.mailmap.

> 
> On Wed, Jul 02, 2025 at 02:37:16PM -0700, Nathan Chancellor wrote:
> > On Wed, Jun 25, 2025 at 10:16:55AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   2ae2aaafb21454f4781c30734959cf223ab486ef
> > > commit: 8583a655f2c2bb442e2a2668680f419aa4c511d1 [3022/4739] drm/msm/dp: move/inline ctrl register functions
> > > config: x86_64-buildonly-randconfig-005-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/config)
> > > compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202506251051.7rmus46j-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> > 
> > This appears to be a case similar to [1] and [2], where clang has been
> > able to figure out that there will be a divide by zero in the else
> > branch of msm_dp_ctrl_config_msa(). Should pixel_div be adjusted to 1 or
> > should the divide by zero be avoided by returning early? I believe Bill
> > is still looking into trying to make this less distructive in LLVM but
> > it should still probably be fixed for LLVM 20, which is already
> > released.
> > 
> > [1]: https://lore.kernel.org/CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com/
> > [2]: https://lore.kernel.org/20250609213505.GA1634981@ax162/
> > 
> > Cheers,
> > Nathan
> > 
> 
