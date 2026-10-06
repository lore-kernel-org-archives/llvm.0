Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C63E63A2;
	Tue,  6 Oct 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288475; cv=fail; b=CgihxhbzvS5vyG5WQxX27Y1yR6r6k726Fclt2k/pDwIFICqFKnB1PxLDboKl3gTTMMyhDEBjcFEl4h+F/UeVhSc5ZMcskRjCpnzK/qF9XmK7EP40TJDzFO+qpSKjN/0KCE9nma6Nnj12HrR7Uln2s7YVVkAcfHWNnWRUeOJP71g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288475; c=relaxed/simple;
	bh=WjtvUdEmAjvXXZIwuEn0r78iEb5lcxRvHNuk6BqTzpY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OcdSTZzTtwjCVVM4qnumWDcTIOSZUiFv43m7pgQdHCsYKzqyrvb8P6emIps+FiXokQL07a+D2nN645aT8IpEN4vg6MZ/bMR/aDeGnwvtG8p2CqfQGxPm6JA8W+2ue6P7RbXkhLZZXDaRjvakLQ7Y9Lr+Gu6gYXfh+MSL0THN0Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqWHsMqZ; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqWHsMqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288474; x=1822824474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjtvUdEmAjvXXZIwuEn0r78iEb5lcxRvHNuk6BqTzpY=;
  b=KqWHsMqZaJ4JEm/jzsJP2txMcQ1FEIxIIU/SdRMix3/2eot9TSljg+BZ
   vdWobf13O3NWxTfwSJaHxh4CVHk9E732OJOiYGhjgGVvBn4uPgYNbeENi
   OI+tJRXMcfuK6/mw97yakRd3BkllDOshuOweaIiJtcDQExhWgdLB3virs
   HUEZ8qaWRStsu2VJXlJSmfmtTrCVJj5a072eLXY67iPo/f93zn5Kz6doU
   LNWNRm/GkYLrPa0l05uw3F9zGUgDgsEbSJfbQqkDZL2FaoPVGJYBf4jmu
   TVF6iqhqy3nHnsR/vSV9WsUCU5189mxX+sw666uwJfpwhUXsmmOs5J/Kj
   g==;
X-CSE-ConnectionGUID: xC/lWMEnSnCK1kPnsXteLw==
X-CSE-MsgGUID: hXoitAOsRMK6i64izRVAWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="123824"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="123824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:07:52 -0700
X-CSE-ConnectionGUID: ge233zomQCWbWT3aCSC4fw==
X-CSE-MsgGUID: 9wx1jvGhQ1qWtt4rerMqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="275788826"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:07:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:07:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:07:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMKHJ05T9EXCEgne2bp54U5GdnJskOqA4JDwaG7B+glmzd4VbrZjQspXGl3zZSeUxS+PqkfXz0Q9nsuoqbm3RwHFs4s6W0ncOgWkcfS79BKJX7CWvQrGU3hPoZYewD3H0Iq7udwNuSiFfWAFnDM11H64Qv5JPw4ST9lrEnLc3STaa9CyD86G4EE68L/IZONF7/6IJos1ziu36ivyN08XIVo/0tWkJ/0ve0xP1Xe3ZPy+2KUspHHelFd2gc58y44sLknEUEutaElJIJKYxrggvu5bNjryj1lM1Zs5fyYQg/QRqQQ6WsAtzLOlzdppj7jYL8INKqueeBs/6KyNcnJfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6jfaemSAWtRI6kXJqAU4c7A9nU97giAqrIvF6M929Q=;
 b=ptcj0kNJg6WW/cDV+XtDqwtdBrNTEKuGOC8UzavK4KC+LrYTeHVsJAAMM0vA39KJh/zAkSF78HvP1JSzd08VTk2YAwLU8M6YM6tz/lA3tcgyTQB1+/xzxYIhRWB6lNhXAFldG9ExyqLxOyZKmcjB5pkKBZnbXlcCGfYGVBX89fhyO5ZinpZyPbVwM9vPhK0/I3hPpsBPKF4tTepiR+wEBMxYTHvGqSfbMFDfxgPcXyRfXnmxpg5vt+vfYmK4b+5tYBIVpRrP6kQkw/LtWGMU2WoNJmXCfodc/LkRi3zqM5CPBNpT3ZRUgA7pyrsYhqelS+EQ6tOG5TuVK19w1jAMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 12:05:48 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:05:48 +0000
Date: Tue, 6 Oct 2026 20:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>
Subject: include/linux/mm_inline.h:149:2: error: call to
 '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON
 failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
Message-ID: <asTkEze6vnpRAy7f@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 06020474-61a5-49a3-5022-08df23a22866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|10067099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: AElk4h5ZqKFJgkgpg0CuVLBLREvrd+3VZVqSZHDdV1eYS4V6TYnMjWjQGTppe2j6TsMvdceV9RyLNqUM+7VbvT22lCMPYih6nxcaFaRoYlj+/ZqBeeHDT4Qkm+GYhQ1Myygi2SSDePk4OKVNGdsTYFPr5Y5tXCp/QfkgsKU6Cu6HasaQgKkzpeuCdMkgYPtcsw2bHGBpBi/9hENzYeVsENkOO06omcTE39X8Wh4WJ9fmfemNGnFZtOpfaRdHKE1YarNwrdmMwmXx3NPDwttHpmf2AVHCYyyCyBsTQc9PTnwTeTIpq5fdacVYZx8fRpnzBBCRJJ03p0VSoFEpyksWJ1FwMSWha9FF60F9bXknwz6itEBfSXmxA5CM6qEg/o3WIdsZ50DLywfRV/z6SxhbUvZGUhg+aQMhH6Oi7qw67LZWXpQFpMARx6Rddsf1vgDEgHE2EcKwiJ8DJ94Nk37wZViA5jCQwz22wHyFo1+M0ZU0+OfXaSVjFcLPVxyeDh0f6OXn6FsDLtlKCAyqIuaypZYVpL3Mk3ctuvCZMJImCmg7b6NfFRoRHyd+WeTzvY/G/zzhW2F9HtAHMsDubLh4KI5qwblzHAEF8jp7Lsbmrc4/wtn9U52t0/Ei0A1b7hVD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQkloxK8uOuRe9cZsgRTQeGq3Ks0IlrTbmBTWSWcRmby18aGHuJEd6lnh2fA?=
 =?us-ascii?Q?jrYqB3HmELSVKYnqTcU8GOB3obmDqI5UCtznfGdKj1RtWpfZLcYuqrLwC885?=
 =?us-ascii?Q?tt0Hnkbvd0BJReGOdKgUdZkUjad4FNvCpB721Qi4GbRFFA6G4B1umR6b2AGC?=
 =?us-ascii?Q?4KCmugHaNvklLy7YPxsmHVhQHvNJzbFw9D7qFICcsm7JzqJuEzINXNTMKyUJ?=
 =?us-ascii?Q?VcU296a/FL2sO14mVKRlYVRXGCMclzhUFORmwJQ8iIFU83AGoDWplXGFsgUo?=
 =?us-ascii?Q?Cwk79An4UPIAmWahqGhB4OBj6JSj0u/P+QKulSoxUqh7I7t01FBWlN7IeNQw?=
 =?us-ascii?Q?0Vv34F0MqrjKfP0rSTZoX44ohD0H9nfTIWBsd6nXptiY5qMJgjnRmNAbPM+W?=
 =?us-ascii?Q?Pw1DvifDDpLIuQ7UGbnbqRKVimPLhRehlWycoormZUDGYeoNKGXbtac8+1f8?=
 =?us-ascii?Q?adS/P+uNtn5B790MBup2TWP0P9WyBe2EsXg38863uA4FHfWruaqB+Mv+oo0Y?=
 =?us-ascii?Q?0tmI1r5VKjMcNwWj5anK+M/UKYndqRWevq7fISx8R5NZJrKL6+cgQc5X+zea?=
 =?us-ascii?Q?MlB8pgftU4nYL8rANGI0bUnQUeMaDM2GM1YVPMGjJs3nv2wXQ6Uq8/Wedh9T?=
 =?us-ascii?Q?L36QMIRY0H3qcumIkb2IfIdasVwrjcSOVbO0AZO1oCFngQJ1tFe8o1RCYouP?=
 =?us-ascii?Q?jcT3otoiEDI4Q+Wfs+X0J5uYBu4q3L8/GaXclxwHvroVNZcg/8msMXYgGStb?=
 =?us-ascii?Q?xXnlIFzqi14jyXa1vpeIIYGxXDpnwrO1HKQeZkNzI8h8Ph4VnE6AX84N410O?=
 =?us-ascii?Q?xNIPmT8aPE7yEtu2tzlWd2DTJ8aJJLUNUhqzcukykcB8r/wBBxk4f8N7JNIr?=
 =?us-ascii?Q?ILRbBOY3atdPAI03a9CPo5V9/2C+z/Q3q1YZuO/Azq9pFGL9s3nLh1Uzf3Gi?=
 =?us-ascii?Q?f44wW4LmmJFMkuhH4jZRdnjuES/ye5ykJoWk7KZHZuw6FxMN2b24gw30TpcX?=
 =?us-ascii?Q?UGjLS4oV0L8a6SnhBDgE1VbMOGR7JhJuyouZwVfIHVOc9JO7pIW1UBb4J/s9?=
 =?us-ascii?Q?mcBun8pB/voNUlM2xoKQKaZm5EwAsYcyRV2PFKwKYsXIuhYdNd6jZIwccW8G?=
 =?us-ascii?Q?avw4r72ZeJvaZBCczRoeM2Au5WyAyp/NmugfoZPadzEa/LlZ9XzKViT8qsOi?=
 =?us-ascii?Q?01FO6lcnXreMfR5pfijjKgeH+XZz/amUAk3iKNsOJD9k1t10DtRxqBA3wzAP?=
 =?us-ascii?Q?7DRRR0N/PsQTEOHfJ1KGs6MGX6AXqwfUSW+DBpFMIPfvh6xbNDFpl+VUD4Lq?=
 =?us-ascii?Q?Eus4DQSVJ41lkrHjFoP5PXqYAz0v+VHQhMchQ0PN9rgQWHl7+5U2Ir3Ap+nO?=
 =?us-ascii?Q?uPkz5Bjs5KTDe8X7AxBDRncYdwcruTk5Wy2Xvd8O5t3U6yaICErxmXjviS/3?=
 =?us-ascii?Q?wLXZnffOp7eQAgbQdodL+xZxCWVSqM9wXI69PO3OZ57tAmk7gT37BoSSSohL?=
 =?us-ascii?Q?Vfw4ioPsN9JS0LjpEvRjiIDEfngbJNR1VoY4MHC89rP//8Pi1CGFerpo+EcO?=
 =?us-ascii?Q?EajE92EabCxM9Js8Zb4CvY6CuPMIAQLuI0VIFkmC/BURMlFCh/agPHxXTdAH?=
 =?us-ascii?Q?8sxFxkzN/iZMhzDn34CO/3Ipf5IKq7eVAgjGvTLE1xJlRNqwezq85aRA3qRP?=
 =?us-ascii?Q?5Ky7cOQIcxBkTvro3o/8Nlbfg1FnkRlJt1qMkyH1K4pUlbf5LiUytZRbUGsL?=
 =?us-ascii?Q?s9DFR4fbuA=3D=3D?=
X-Exchange-RoutingPolicyChecked: o5486XsmRwxgtEZpuSt8VbEAuHjXyrj0+Y0/R1Mz5cR1JKuKFElxoMv8i8c6gLiqJqlCvNOExaTbEGDMAP6j3weoeRI9ST0RxBkRlvdPRC7OWBXlJaXfFr8dnY4BrjZuD4ftOzxPWk9NIzVZ0rcAhgGyaZjZUlaP3718WpxFJ2BP5m2EuwFQHu4MZ0JtTozXERzuygsY/5WwzbxbAcDDuH2yQlTntrs90BcF1S/JhziGgjv0cIG/SAegX8K3G9eWJSFzK634L18ymgvVcvKnbY77F/iGv4AMKwx4G48WJUgZSBpWw8M2coi+v0EPi+wVM4+aMIdvb8FUPN2IMv2ISA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06020474-61a5-49a3-5022-08df23a22866
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:05:48.2127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/EpKQe1i7h4+Xc+OVxLEZhNLojvW6QhZeQV6eQ6A3Oacl6oA9tYqS4pV2Yq38xNNMny7vU0co1SppVO2hX6jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: 1a4c8c8874fb1ac601f32faba8141125425b6f1e mm/mglru: frequency guided workingset promotion (MGLRU-FG)
config: sparc64-randconfig-1001-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041334.CMzP5M1B-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041334.CMzP5M1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041334.CMzP5M1B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'inc_min_seq'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'inc_max_seq'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'sort_folio'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'scan_folios'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'isolate_folios'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'evict_folios'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
--
   In file included from mm/workingset.c:9:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'lru_gen_eviction'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'workingset_eviction'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   In file included from mm/workingset.c:9:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'lru_gen_refault'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'workingset_refault'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   2 errors generated.


vim +149 include/linux/mm_inline.h

ac35a490237446b Yu Zhao     2022-09-18  146  
1a4c8c8874fb1ac Kairui Song 2026-10-03  147  static inline int lru_tier_from_refs(unsigned int refs)
ac35a490237446b Yu Zhao     2022-09-18  148  {
1a4c8c8874fb1ac Kairui Song 2026-10-03 @149  	BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
1a4c8c8874fb1ac Kairui Song 2026-10-03  150  	VM_WARN_ON_ONCE(refs > LRU_REFS_MAX);
1a4c8c8874fb1ac Kairui Song 2026-10-03  151  	if (refs < LRU_REFS_WORKINGSET)
1a4c8c8874fb1ac Kairui Song 2026-10-03  152  		return 0;
1a4c8c8874fb1ac Kairui Song 2026-10-03  153  	return fls(refs - 1);
ac35a490237446b Yu Zhao     2022-09-18  154  }
ac35a490237446b Yu Zhao     2022-09-18  155  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

