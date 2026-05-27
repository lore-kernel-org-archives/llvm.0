Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5730C179;
	Wed, 27 May 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887846; cv=fail; b=BBPDDL0+np1S1CHbiJP1Wr51yiLZynmJqpUQQA6m0YcBSkkVDrRR80UFR9GIKsdJ5bV6nYlFGMhAS81OmtI4CD9KeP38q5t+w2F26i50h9p0mumOTCiDE83P4AGC6bQtmeYCycQfCQvKoHF9NDgaG/muP3w9PntAxUnjfP6B4Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887846; c=relaxed/simple;
	bh=3+RoDZBItOIaV6+jizvsHMWTr05A5J9FheLPzemeFU0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pPT2UD7WsybTuf3nInSCMMK83oMm/d4hxpVrb4mKKAMvPnGUMu/BmhPLd6P27MNWqGbO4Z0LjEezYwSENM23M0Y+ZvY4hkvyhi9k8e5mQ+wgl7/oJQM5Ynkyljr6XAkSH5qdDHTllT1/9wv1YX7PYk96uU2sfW2BqV9QzYv/1sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqlhzwor; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqlhzwor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779887844; x=1811423844;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3+RoDZBItOIaV6+jizvsHMWTr05A5J9FheLPzemeFU0=;
  b=iqlhzworg/7xX5H3vty7DkuOb7/+dToEFKZV7qxkLwS6RezRBjgNbtMf
   DJ7jRv01aomK12Fa0QbgRjVrqnhr9wneksVybjvJhds3r8hMEZnnEQRHE
   1ApP9iKS5oOiAftIq84lj0zrazFGkim+YEdzgpt0iX+D3TltAuTZNCehV
   f+P2dVfzzllr4YB2Cl3wnZImPORyR+9s+iEOOQJ+QsERCA6iDR3Y908tu
   QYMie1CWhN39IdHE7VW5XicoZoUOc3iHaWi+NuD+K1n+CkWVvwAxquoqO
   4o/dEZIHdzgHZeP669Wx/GmDXnovij73+9AR3Xx2zMm5FwQ90Xas2xfDB
   g==;
X-CSE-ConnectionGUID: 3iThaVXUTmuDauc64oXwpQ==
X-CSE-MsgGUID: bYZiXlsyTIG4lPCqn6ll7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80903783"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80903783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:17:23 -0700
X-CSE-ConnectionGUID: Y6aC0PK5T5SSWeUMI4tPFw==
X-CSE-MsgGUID: c0Hg5HBjTFiibyO7nMAA5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241388697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:17:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:17:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 06:17:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXmIK+AkXvu6Pw4o6wepG35m17vAYcQGnSc3IWqiW5oxZYuOLrUR6qEn7fwx3E60mStijiwq1yYTlyMdB0vwB3mWSCcHLoIMzfdMDtGgpxGcjqYnkb99s4xOK/40hPUk5RRj4Rma14LFiPT1K6y4SgH3dpePCWKi3v4ZJEIFfvtMDcXuvhF4L++xBZh5xCVjgqKjWIau7bAulWm77u0uyPOxz6kIKkoXdYO+uzv+jOyapHMeG2luTMFtewVIrNbIE85qswbR00G+4QDi4L1EFYTifiOw70tsZlrBHy8c9K1y71jnY9CvuAjt7vYEeJuBC0L+bDpvlehZO9gqRYd7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur8xpko0qI5EfYDr9oPfZIJyXHU8vk8bgJ25sKS0zQE=;
 b=hewyYkATbWvhJGDus49qhOhPqsEKueKKQ7tIPio5/0vieN02wLpHudz18QbW/M3voxRBn+guVNeHZKqAkHeqxd5KaSr4ZkOFJZTetkACBxbymB0JSMhDBoYcuoFzV0qq1MH1IatGoPMI2lJe0SX4SFdEh2PMU2HjPneXNnDINg+sUeduqjo1veFm5/ovr5LMm+fYlQxgg4k10/3eKyUg2ChLcYpTrkJQTK53zk2fUkTgdHqPvBks5zQK6ZLbJPwXhgy5x7vNV/rsEsHOPbmfgGGnRO3cDDUt5TpAdxxf8DA9m7VcgWAlWZhpKzS3+ZIetIe6cWG6sL2NP2FuV2z+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by CH3PR11MB8703.namprd11.prod.outlook.com (2603:10b6:610:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:17:18 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:17:18 +0000
Date: Wed, 27 May 2026 21:17:09 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 5302/7547] fs/open.c:152:1: error: unknown
 warning group '-Wattribute-alias', ignored
Message-ID: <ahbu1bxuu3wt842q@rli9-mobl>
References: <202605220247.dQAHslyv-lkp@intel.com>
 <20260523005204.GA520407@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260523005204.GA520407@ax162>
X-ClientProxiedBy: TP0P295CA0054.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::18) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|CH3PR11MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e21b83-b165-4743-070d-08debbf24691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: wUcvZmMy/hkw2PnH5WZKyb73uE53SI/SU0OvnA/DqHnVHijkBcWqC3kyNheIaa9VfPVPRMaeDLRc6t1h1/Kphri4Hj8S2gQcfp7DtB4SkUafbA7dczFBP7SbpDVCeRcX7miTre4j8LaPSS8uIj7LwHTUMe9nwf8TUf2tblDXA8/ZW8IdivvVyeUrOod56X6WSAH8gZ9pmWPTTXutDV1G22ccQvI58AobIyBqpVTCMCnEEcC8MYoiqNtIIjVcwZykOcuDSdD0QDED4KBuApkOW03ufTk4iCB2ZtiiKQeyqSD0lacHGjHVcna9RNKyIZuoJeAq0uoGwc1R8NFg3NkBYzLNPyaCShv5q+BaIx1ghB/lL6gg1aY4EiHbtcr7BGQlorfy6Uwo41Vrhlhj68FU9m69N7l9i3akjproJrQrVEJMp+G3F0IjHpoH4iL/edP7VeeXsqYnoKsX9V2r1aKI2KdvyFnFnq5uSFGWhLjD5D16e1m9cNEaSPItaCFEAAN4z2nbM5KrRfWMJ8B9shs5fOwSpmOu2aSKKoLPYLIFeB7ZcT2YMRoAkocwDnxxjop6SAEsnDYerJfxpv2LlcaWqMHtL6UnloUDsbVaQ0HrHNS4S/SrKMl2H/CkL6dXIHkRX00abOE/8wjnkM1J+KpZ0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xegWYHRZa7YOhzNLwXxAFLoPRh4nH0IB43vrzc6geoJaww4K3Jt3kVYAXt/f?=
 =?us-ascii?Q?A9mnsfo0301hC6uvPK7maqFIVWvbm+RVm3zmH0vkEjd2ZtEw+10+QiQBjKRj?=
 =?us-ascii?Q?IUmNZQbDqmf4teuU0WUz0XrYPBJKW7hPKZGiMrofOuaPsB9gQDJ/d5XdUhug?=
 =?us-ascii?Q?5Qh104wpsa0OMVbfeg/gUh5cG7IazW2jQq2EyC9sYo3hOKfwTf/m8JBRMumo?=
 =?us-ascii?Q?IeG3WjOz7vvUzxf/rW08JbP1Ha+3VZBYVoAhIPCvcF+e4g+wbNidzhagUQFY?=
 =?us-ascii?Q?YsgnqpWI5LybER7UZLmvNRb75eXE6twU3KC7w30Vf1kT559Mo6mSYues0d5V?=
 =?us-ascii?Q?D2H2gIs89CmXcc/PI/qL3MWD5dS7tluvG5kkJw7zy++4TqTkqX4uJxYNwr3s?=
 =?us-ascii?Q?9Vc5tH9iLeGSDxfDob1ugHlnRHOiGENccRGe4z8LpzRCNx/d7LKf5A5eX9Jt?=
 =?us-ascii?Q?2JFYa3HpW7pmUlYgFVq8KPySf2nJjD6zpYW5yVUpsy9ObNyZx5Yu1d34GzB9?=
 =?us-ascii?Q?ZJFtQWsGKzlY7lXCojtw2OCHfSDdSFTpLyAd35FubXXb5dJTjc8Cw5zBpyoK?=
 =?us-ascii?Q?JeO4mT7Weh62bHuPqS2nH6V4BMzw0Vh4ySzngsr3VSTJGu3Q57LssIEZhmN5?=
 =?us-ascii?Q?syMzuWVsNchDcg8iZj9yUzxJW2K/sfiU7cYw/7mNx7i8ULbTzbNVSGstMtFH?=
 =?us-ascii?Q?oxJEAI1hzIpXf88hf8OwEhdvfVhiw3EVjmcuoMTwtW/yDwL1USjUidePnkhN?=
 =?us-ascii?Q?ipi+SD2A3USmW/3CLmO1udOE/GTo8HMVUJHecW9Lbp/OyrN9Tz+pzQ50rjUB?=
 =?us-ascii?Q?RvMcju+CbIKNB1u93T8M611Le2MTPqlst7HhcH6ifM3DLEeRfAoX7nI7Eh46?=
 =?us-ascii?Q?QdoZFLxoi6yUCeuiM/v1HTnkyH063OvYsrTBr3SYyAfvP2hyD+ziMDtjdYyw?=
 =?us-ascii?Q?IdGacRZOyL8uxKOQTjATe98H4jPjmkavjJ83u7HRCy1r/+QPM865M7zMEjFe?=
 =?us-ascii?Q?nCreJqIyguC4sNy/XyoYnhEaQK+IsSYfUjQaOt7mZW78BsLnmR5awcsexEvR?=
 =?us-ascii?Q?jkUDufj8iy9Mhq1140ygx1xvF5TPYKXyFQCg6Eg0pCOlrzs+hAwrOTFw91hd?=
 =?us-ascii?Q?dF2LjyYsH7Vmu5nJAM5O0iD5WZfuS5uom+BRVlm304VzdVmtt4mWOtxdR3y1?=
 =?us-ascii?Q?Cat5EVLoOpJ4Pfbi8H3ycsbtxkdXyvF0dhUApDaog+i0w33tbCMFzb4XZEqq?=
 =?us-ascii?Q?ej73JVrTPoTuf1Rv6YsMYe8HTfs8tok5pLUfEwssCbWx8QVyrULFitEvXdqW?=
 =?us-ascii?Q?OO6b17qnW/8AVARFDXW4DdsSsLE2YKH4y4JKT2jrTH6vXZ+UEW4oNB6l/kJ/?=
 =?us-ascii?Q?ic1JyJ3TCSIzsj1z2Gj5skUf4Whz0mi+d6R3+ImAARB32pUWeL7b0yJ3LVYS?=
 =?us-ascii?Q?xR9EUeSHtQIsoIf5DjMBPK6jPczx+ooNPQZlVjeKFjxzkzAuf3kNfTBsxJlJ?=
 =?us-ascii?Q?bv8fJuopD7gTHwE4GvqBE4xFox6ONDUv/ly2LI7rXWLWPmxXwLv2necT+jFu?=
 =?us-ascii?Q?eygqzyGdYfcp2JInogFAbwdPmLwPFPUWUACgvNQuEx019TYyZA3MvekiHDIP?=
 =?us-ascii?Q?46S/X+ATwqXFQQERXe6ENu8mNudgMqBwz+kssCmjFuan7JhsnPViMy5AnzYV?=
 =?us-ascii?Q?kwJJoaWLxQYtImyteNd/GEYxh7SZ1hUvh/es7Og2cCJq49GIZTVi78AoO97f?=
 =?us-ascii?Q?1erQqFBGwA=3D=3D?=
X-Exchange-RoutingPolicyChecked: h2sXutG7370XJVkEBlXQ7Uh0sCh7gi03AbkVo9PIRB3PaEFsXJvfb/AeIayM7VsLJHYQ3YdzazW9dYI+HyUQUFK/a1HbOeuFbcAPUuyfxjkvKhXiIAg5eZgtn7tw9rfrCFEeJjaY6zP1pdp1jCcVsndjFqFYORJj+e/iHTIJ8/QYxySqGfvM2Tt1C7ha2bAyDOOgXYCQZpjf6iLZZlC+lxe5GlUFiHQQE9Xw7mxK6hbTH8fJZ6LjjBBjhPMEWh/c8c4sedJJrt7cm0BOBvFJilbq5J+onbexTQ3o8nUE9iUI6d996Up6QZ0m8inO5ZmWQCwWVKy5l9gGWm+pQ+nA8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e21b83-b165-4743-070d-08debbf24691
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:17:18.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6rUlz9vXf2N2K0LItX2KHyw5m6039+JXX6SM4Q9cdWdSg3rsvFlDNGgbxOm9IeqFlgOABkLFwEtsOvUOEZdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8703
X-OriginatorOrg: intel.com

On Fri, May 22, 2026 at 05:52:04PM -0700, Nathan Chancellor wrote:
> On Fri, May 22, 2026 at 02:18:49AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   550604d6c9b9efc8d068aff94dc301694a7afdee
> > commit: bc5ffe737f56ee2734597069ed71f48830549483 [5302/7547] Disable -Wattribute-alias for clang-23 and newer
> > config: arm-defconfig (https://download.01.org/0day-ci/archive/20260522/202605220247.dQAHslyv-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220247.dQAHslyv-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605220247.dQAHslyv-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> fs/open.c:152:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
> >      152 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
> >          | ^
> >    include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
> >      226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
> >          |                                    ^
> >    include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
> >      236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
> >          |         ^
> >    include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
> >      250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
> >          |         ^
> >    note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
> >      135 | #define __diag_clang_23(s)      __diag(s)
> >          |                                 ^
> >    include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
> >      132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
> >          |                                 ^
> >    <scratch space>:223:27: note: expanded from here
> >      223 |  clang diagnostic ignored "-Wattribute-alias"
> >          |                           ^
> 
> Please update your clang-23, this will be avoided with a newer version
> from main that has the change that adds -Wattribute-alias.

Thanks Nathan, we will upgrade the clang version asap to avoid this false report.

> 
> -- 
> Cheers,
> Nathan
> 
