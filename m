Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AE3D45D5;
	Sun, 23 Aug 2026 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488171; cv=fail; b=SW8urZ40CIYvO2UuGUD8cr8CCRdyKMinaL/37OKdDEShNWQKq+ufazYYN6croICFkS7YaDSBVHxKqLcWN2iYlt3z6YnVc1MMnsVhdc3EQkdKmk/EGNCSm2+veMvkrsiAq8Gh4SSg5KW1/a4Mn7eaLNWlxugDnCs9tlLKXQikb0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488171; c=relaxed/simple;
	bh=Vs4dolncFU5+fTD9pSJsdkzrqJhruNDtcxHbZwOeqxY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r6WT5slHManJOO5VLGGB/PQoIHWrn7oMs8g7sXhXh4vHDcrBb5nvDdCxiQst2zwWI3PktjJZnwEVdpNPFDMOr5A+RbvlMy88uhqpWSf/NJ4sbB+fQabd/xENPrIqE95OPWBw5pYNDn21gkAOkbPGHXUU5PwHslKcBenDIZQjK74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS+dAX6K; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS+dAX6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488169; x=1819024169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vs4dolncFU5+fTD9pSJsdkzrqJhruNDtcxHbZwOeqxY=;
  b=SS+dAX6KbOHssN8/h53s/hz1DT35c1UHpDxW6D8nII33bhJHmke3z+DO
   hNJ0xy/mUFBdor/VkihG+lCdzkmDP0Sn4WsEA1lxj+c4PjDVkSD7yrGjL
   vXzMpLODUwoUdh7x+eTGmxxK/+udTc/+fFl4VxIWm3UwdjCSyKMpvJ7wG
   wMkOZGibwyu/qde/H4YmCkxo1yRgx3gxcYJwoUIcLabarjK/Dp4Pefk1A
   ffgxdJk6hgm/1crRFXhDEOSId1tejDqYDFnCBGFl1AouBA6l+ZkOFMm+D
   APiwzMr4wKXC6wnsHYO81TJoLimirzlfO5UIB9T5ymgBsl2Tp5emqHFD5
   A==;
X-CSE-ConnectionGUID: d6DVcvhrSfyPQ/C3kKybSQ==
X-CSE-MsgGUID: hoQX/rSzR6SMcx5FwQPckg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="91831418"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="91831418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:29:25 -0700
X-CSE-ConnectionGUID: Q8n9sCu0Spy337QKU5vSfg==
X-CSE-MsgGUID: UVhT2O+pR1yxJ6USPxj7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="265460609"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:29:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:29:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:29:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr3ePAo3cvSunRd0qYUSKFCoGcQdT1hCRwscsWsVBBW6WEcQc3SWbs/6gDXhqCUEMjCbvD0SfpdiFI0GiWYO9ATO3CUHw7SES2X5WzkuOyxbjkTJXhB+ack2KnBsYUe99IqQRYO9fgaPSWhzmmdxryHQOtc49pi8bhguQw3TAowYi1vP/Exh+C2WUMZTviDK2L5zNA5wVD9F/fXJ4CpWl8iKuqxm2Kp8ah7Kr3783zNUTf7jG61p9oGsZYOK10voD3EEvm3PpT8biDhG7580TV9ebpSrDR1juVbnZkQuFdhu9EdABR+qrGFjcIpWJrCScQl3k/xXxfU7OTWWlNrTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfzmnvnaMqpG5clHrRoUmroFGaeEE+bxvUgJ9PUuAss=;
 b=rWrQ/yq2KtmeCfNntGCCMc/Xz1/d0YHCarYnW8ato+EdnoLBx/8lcBmDArMzH8D3astj1crVLOBGJ/sfBSQBq9qmOzTlHl+wIJFYV9LPDZJWZ6Cl335nMm3X63eFdKm4Rdkpmsfx3MvUSN8q2dVCX0wNKdmQ+FDJJ6J1VfYFdBPFSYltdQQXjS1ZRKwKS52wiqwiqEhNpGCrwX5T6a95hDVN6ReJpPXi1pKGXpsXeIdAJdObo8bzBH/6A3j/9OmMF/c8xOAVda3TFFt8vAMz5WrCHfBdYEIjA6Wjs5TD425upcE3IR/bDwnScA/Rka5m6BoCxxH13zeyXQkFONu6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:29:13 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:29:13 +0000
Date: Sun, 23 Aug 2026 20:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [peterz-queue:sched/hackery 6/7] kernel/sched/fair.c:13490:4:
 warning: releasing raw_spinlock 'rq_lockp(this_rq)' that was not held
Message-ID: <202608222234.4uKB0FCs-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::11) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: df95592a-6ef6-4cad-40d9-08df0112239f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|3023799007|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: pQ4srKUSiF2HlhH4T0Fup6yaFIlQSS+TXKSAqsjXGYY9PJNxpo8alOCnzK5BL7RoHYiL8+/1pbGGL0Z1X0aKlMa2F215B17noVa2J9qEH8EnGBMpKXf3NyE9cvf8rTumP7sOUI5F0uQw2bR+Z/wyjFfYG8NdxLy0zbflL9ieJ3EgalNWbUo1LqHG6yOgpcsr9fSbio95ZEVaQuDDRKS0/EifHjviFZya/u13kC7TtdSuObadCo2VxUy6MXIHo8rmHVFdiEwXP56YkIUhKsW0jaP2STrJ2zJTKvgBNfHsq3OeDGBnsuZwtRwMwMkTCiub0g/TUCmHrvHdhgrX7dqfJv1i0qnWzI3ld8fjQaK0wYoACqqTPma/iXwBASK9RAXiDix+ymQfBqhJgjyaIpreyr5Q72/NV9uoAcv7ExSv9ZhDczPbzLKiVbMqu/my5/N1FD81TzgjTVWJZfx6cz7351Q9rwlJap3TaCNiKiWDcHvFQG3TjUAPGvGNlpAs1tkx56NnR5qYMtWlquiJquiynXRcZyz4R23i9gRaWq+Ij7150QHHFKRuhji+eRl6kSRZaS59AZexIt5fV4R3sSUbUAFEutgRsVwuOkobzQoB2Kx4bu4L5PkkIeh2NcH8c2plqMi8N+mx8XXoztrN9f9RoafSPW01ZW0S9H3MOYEP3d0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rG8M9NVKa/QyohFnvC91g6WtV/Dd8y1hKRmgTd9wf9WaYjKjsYI1dVmj6hfC?=
 =?us-ascii?Q?48LcOK14NN+34kvQ7PlzMQu3bcaub84+UabQ7LzjTHXt4hRE60NAUl0uDYC2?=
 =?us-ascii?Q?Gg4jGTo9W9sGaxktZl1qgTeMTVAGZNDNbrOQupoTBxSpVZqOVE5aNY588303?=
 =?us-ascii?Q?7xqJy6y+WhZqtX9eosUUrdHruZ0zMm32AMsj6q23gi0L7RMVJKlz/mMakEYA?=
 =?us-ascii?Q?MxmFSf2K7KJypkDoppO9cibMY/ZxaVFj2bfbokZH/IOxOUFuCW/Q8xSPgk9M?=
 =?us-ascii?Q?IDfQK5VEH4tkfM+KA1KOFq7N/ioFG5uRdKLR15ANOnM64LdMo+BPXCKzap9a?=
 =?us-ascii?Q?ylFk9FbyF2jBuz65ZU2LdPSfgs8GFkxwL3+Bgp2N9HPE88+co+j+1cUUZKK4?=
 =?us-ascii?Q?0jGpasjuJ7RIhnKa+eDT/IdYZJr3ciskfFaZMdbYaETl+V2gF2AQCQ/cLgxk?=
 =?us-ascii?Q?QUwSsJlDSwUpTKdaVQrDkE4tEIy+gjeVKv4FqJum+LC7pfEIcsy+ytpa32H9?=
 =?us-ascii?Q?GA1s+wSLdJMl6bDkoWBICOwAXC3lPJaOlDy/R3kFGeWLOKCieK81PKQPomLQ?=
 =?us-ascii?Q?nxzjhzTgzdFHYPcmywKXDHr7CAtCell+6VFUbS7g3rPvT4pbz9ym6vqfVrhY?=
 =?us-ascii?Q?0P/FpLtEfZmC+PSdrztzShcMlQsMaKWrojqnF+9GWrwDDETCvC6HDX/iPyKF?=
 =?us-ascii?Q?hlLRQKe0PyrXJKf8dleWjdHowSVqP+MJTGCgvP7oBhNZXPwUDkXiPKWg37Ee?=
 =?us-ascii?Q?cJnU75WQWo/SweCu7ZkAkcndVTMnTYUbpsNUKnJFtfHUUzSj32yV6O9gla2u?=
 =?us-ascii?Q?6Nh9KkTT0o7P3HN/vlDikwDWKm9gVSAu3WzhFUpDGwoKYw1upYHThF936ixV?=
 =?us-ascii?Q?TCGbXbfRC2K4r/gYKJ6geM+ItQioLuj33EcPxSlXeEchgaNH3pXtI4Msu7/v?=
 =?us-ascii?Q?ERWN54stb/xAxmkkch2Vxg5JpwwGGPCTCpTaL3gGA1pbpBuTmLh0vFNTcKQF?=
 =?us-ascii?Q?2C3Hz33tE1CZjNDNEXbiKDcmzJVcg0KtjppU0dIhzocN0XavzEWtCtwiRg2U?=
 =?us-ascii?Q?3k4L7ng2Dkesyexa89Vbmq5MzmSUbVxheT4UBLrqXoXT7X/bCos4mweY1MaN?=
 =?us-ascii?Q?VZtirLCwikfLA27rd+9h0I6swvPxgwxb/Zg2MJguL29KPQYw5xYDNoL7mJuE?=
 =?us-ascii?Q?vF6otKOh/g2xmY0LMgfW0MXSd9JiTMrImqoss8YTY95ZsTW+OTYZxsrTseso?=
 =?us-ascii?Q?z+ylcyGxyjT2WMQfhgfvG3Bc1PWYyZAAMIJDJJNo10k7a7rWfc4TUhdpsGVr?=
 =?us-ascii?Q?nhePh42YuozIWU3SE1sr8gEKizaZUd6MMGImFcxd8Opy4+KcB9Xn+EmyUdsV?=
 =?us-ascii?Q?4vCQzGzpIWZIOhGxG8kzUnH4hIaO09d1e2+CFYKOGKMn9Uuhm0BRsRcSHYgU?=
 =?us-ascii?Q?VFdh8zDgwr/JSfEoCJBAj00WAQMzhe+Tm4vMK+3x2UxsleNw7JkqdEV/jk3r?=
 =?us-ascii?Q?o/FGc1A3zbpjMR/DivWMBEAow8lERj6iJ6QTsSU4/WHbImtnpGkkUe9POF5N?=
 =?us-ascii?Q?A3mkbcgt0JUizlQK35fCA6g32vMcBbjzFmUC0g6opjQKjMqUt1lTuni11U5P?=
 =?us-ascii?Q?k5ca83rmW7FyR3Hp3fux0ZaCIJHIPeNmJfME5M3pZZkFwS/r32zQl3lSQfjN?=
 =?us-ascii?Q?mV0PbU25f2qMDSFIOZ+j1/FOQLO4o9o8l7rxNRWzAeRAfX13MnOzkSZ5efWY?=
 =?us-ascii?Q?lwabmr8f/w=3D=3D?=
X-Exchange-RoutingPolicyChecked: lEuqpUjsXGi4bZfUZ+MEntuviWMiLy21gEwvw/spV/CxdjmHu02Oi9N9XsdWByFP0nhyFTBMpnT652leEiVPXgry/b4RwJ5BOWIN1RILLIi3yBjJvoMoivaahIXpsznzGQ/3KB5Og2pMlcrszgvfDSYluvgYQQjrb+7PAbU1GNAVVvXWPBdasGi78VOFqF64jsdLYpfoGeJNGWQ1dEcyt7RiB6RREi4BYK8/eghS/t0a4McTMH7pTMRMeDHEf8gQWadHX8rLiw3/w5L5WJ7zJZ/gx5ETR42f9vRhRHYtYAfPe3iNX8QN7/P/xmWoc7tC5KJVs/ntFJcaeDv+v020EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: df95592a-6ef6-4cad-40d9-08df0112239f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:29:13.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A51JbcWQ4qrGymscJA41nVgWm8Q4PeA/+7amkWqfCI8W8bZRidgVet9qTX1l/NFcqyN/argasAGhXRlYPrVfVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hackery
head:   312c23a8d476a8f31cad58181b12950e9662a45c
commit: 65c5833b169f85988d1f1f48726c3554a92c7884 [6/7] sched/fair: Push sched_balance_newidle() unlock down
config: arm-randconfig-004-20260822 (https://download.01.org/0day-ci/archive/20260822/202608222234.4uKB0FCs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608222234.4uKB0FCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608222234.4uKB0FCs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:13490:4: warning: releasing raw_spinlock 'rq_lockp(this_rq)' that was not held [-Wthread-safety-analysis]
    13490 |                         raw_spin_rq_unlock(this_rq);
          |                         ^
   kernel/sched/fair.c:13624:3: warning: releasing raw_spinlock 'rq_lockp(this_rq)' that was not held [-Wthread-safety-analysis]
    13624 |                 raw_spin_rq_unlock(this_rq);
          |                 ^
>> kernel/sched/fair.c:13725:9: warning: raw_spinlock 'rq_lockp(this_rq)' is not held on every path through here [-Wthread-safety-analysis]
    13725 |         return ld_moved;
          |                ^
   kernel/sched/fair.c:13723:3: note: raw_spinlock acquired here
    13723 |                 raw_spin_rq_lock(this_rq);
          |                 ^
   3 warnings generated.


vim +13490 kernel/sched/fair.c

 13411	
 13412	/*
 13413	 * Check this_cpu to ensure it is balanced within domain. Attempt to move
 13414	 * tasks if there is an imbalance.
 13415	 */
 13416	static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 13417				struct sched_domain *sd, enum cpu_idle_type idle,
 13418				int *continue_balancing)
 13419	{
 13420		bool lock_rq = false, unlock_rq = idle == CPU_NEWLY_IDLE;
 13421		int ld_moved, cur_ld_moved, active_balance = 0;
 13422		struct sched_domain *sd_parent = sd->parent;
 13423		struct sched_group *group;
 13424		struct rq *busiest;
 13425		struct rq_flags rf;
 13426		struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
 13427		struct lb_env env = {
 13428			.sd		= sd,
 13429			.dst_cpu	= this_cpu,
 13430			.dst_rq		= this_rq,
 13431			.dst_grpmask    = group_balance_mask(sd->groups),
 13432			.idle		= idle,
 13433			.loop_break	= SCHED_NR_MIGRATE_BREAK,
 13434			.cpus		= cpus,
 13435			.fbq_type	= all,
 13436			.tasks		= LIST_HEAD_INIT(env.tasks),
 13437		};
 13438		bool need_unlock = false;
 13439	
 13440		cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 13441	
 13442		schedstat_inc(sd->lb_count[idle]);
 13443	
 13444	redo:
 13445		if (!should_we_balance(&env)) {
 13446			*continue_balancing = 0;
 13447			goto out_balanced;
 13448		}
 13449	
 13450		if (!need_unlock && (sd->flags & SD_SERIALIZE)) {
 13451			int zero = 0;
 13452			if (!atomic_try_cmpxchg_acquire(&sched_balance_running, &zero, 1))
 13453				goto out_balanced;
 13454	
 13455			need_unlock = true;
 13456		}
 13457	
 13458		group = sched_balance_find_src_group(&env);
 13459		if (!group) {
 13460			schedstat_inc(sd->lb_nobusyg[idle]);
 13461			goto out_balanced;
 13462		}
 13463	
 13464		busiest = sched_balance_find_src_rq(&env, group);
 13465		if (!busiest) {
 13466			schedstat_inc(sd->lb_nobusyq[idle]);
 13467			goto out_balanced;
 13468		}
 13469	
 13470		WARN_ON_ONCE(busiest == env.dst_rq);
 13471	
 13472		update_lb_imbalance_stat(&env, sd, idle);
 13473	
 13474		env.src_cpu = busiest->cpu;
 13475		env.src_rq = busiest;
 13476	
 13477		ld_moved = 0;
 13478		/* Clear this flag as soon as we find a pullable task */
 13479		env.flags |= LBF_ALL_PINNED;
 13480		if (busiest->nr_running > 1) {
 13481			/*
 13482			 * Attempt to move tasks. If sched_balance_find_src_group has found
 13483			 * an imbalance but busiest->nr_running <= 1, the group is
 13484			 * still unbalanced. ld_moved simply stays zero, so it is
 13485			 * correctly treated as an imbalance.
 13486			 */
 13487			env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
 13488	
 13489			if (unlock_rq) {
 13490				raw_spin_rq_unlock(this_rq);
 13491				unlock_rq = false;
 13492				lock_rq = true;
 13493			}
 13494	
 13495	more_balance:
 13496			rq_lock_irqsave(busiest, &rf);
 13497			update_rq_clock(busiest);
 13498	
 13499			/*
 13500			 * cur_ld_moved - load moved in current iteration
 13501			 * ld_moved     - cumulative load moved across iterations
 13502			 */
 13503			cur_ld_moved = detach_tasks(&env);
 13504	
 13505			/*
 13506			 * We've detached some tasks from busiest_rq. Every
 13507			 * task is masked "TASK_ON_RQ_MIGRATING", so we can safely
 13508			 * unlock busiest->lock, and we are able to be sure
 13509			 * that nobody can manipulate the tasks in parallel.
 13510			 * See task_rq_lock() family for the details.
 13511			 */
 13512	
 13513			rq_unlock(busiest, &rf);
 13514	
 13515			if (cur_ld_moved) {
 13516				attach_tasks(&env);
 13517				ld_moved += cur_ld_moved;
 13518			}
 13519	
 13520			local_irq_restore(rf.flags);
 13521	
 13522			if (env.flags & LBF_NEED_BREAK) {
 13523				env.flags &= ~LBF_NEED_BREAK;
 13524				goto more_balance;
 13525			}
 13526	
 13527			/*
 13528			 * Revisit (affine) tasks on src_cpu that couldn't be moved to
 13529			 * us and move them to an alternate dst_cpu in our sched_group
 13530			 * where they can run. The upper limit on how many times we
 13531			 * iterate on same src_cpu is dependent on number of CPUs in our
 13532			 * sched_group.
 13533			 *
 13534			 * This changes load balance semantics a bit on who can move
 13535			 * load to a given_cpu. In addition to the given_cpu itself
 13536			 * (or a ilb_cpu acting on its behalf where given_cpu is
 13537			 * nohz-idle), we now have balance_cpu in a position to move
 13538			 * load to given_cpu. In rare situations, this may cause
 13539			 * conflicts (balance_cpu and given_cpu/ilb_cpu deciding
 13540			 * _independently_ and at _same_ time to move some load to
 13541			 * given_cpu) causing excess load to be moved to given_cpu.
 13542			 * This however should not happen so much in practice and
 13543			 * moreover subsequent load balance cycles should correct the
 13544			 * excess load moved.
 13545			 */
 13546			if ((env.flags & LBF_DST_PINNED) && env.imbalance > 0) {
 13547	
 13548				/* Prevent to re-select dst_cpu via env's CPUs */
 13549				__cpumask_clear_cpu(env.dst_cpu, env.cpus);
 13550	
 13551				env.dst_rq	 = cpu_rq(env.new_dst_cpu);
 13552				env.dst_cpu	 = env.new_dst_cpu;
 13553				env.flags	&= ~LBF_DST_PINNED;
 13554				env.loop	 = 0;
 13555				env.loop_break	 = SCHED_NR_MIGRATE_BREAK;
 13556	
 13557				/*
 13558				 * Go back to "more_balance" rather than "redo" since we
 13559				 * need to continue with same src_cpu.
 13560				 */
 13561				goto more_balance;
 13562			}
 13563	
 13564			/*
 13565			 * We failed to reach balance because of affinity.
 13566			 */
 13567			if (sd_parent) {
 13568				int *group_imbalance = &sd_parent->groups->sgc->imbalance;
 13569	
 13570				if ((env.flags & LBF_SOME_PINNED) && env.imbalance > 0)
 13571					*group_imbalance = 1;
 13572			}
 13573	
 13574			/* All tasks on this runqueue were pinned by CPU affinity */
 13575			if (unlikely(env.flags & LBF_ALL_PINNED)) {
 13576				__cpumask_clear_cpu(cpu_of(busiest), cpus);
 13577				/*
 13578				 * Attempting to continue load balancing at the current
 13579				 * sched_domain level only makes sense if there are
 13580				 * active CPUs remaining as possible busiest CPUs to
 13581				 * pull load from which are not contained within the
 13582				 * destination group that is receiving any migrated
 13583				 * load.
 13584				 */
 13585				if (!cpumask_subset(cpus, env.dst_grpmask)) {
 13586					env.loop = 0;
 13587					env.loop_break = SCHED_NR_MIGRATE_BREAK;
 13588					goto redo;
 13589				}
 13590				goto out_all_pinned;
 13591			}
 13592		}
 13593	
 13594		if (ld_moved) {
 13595			sd->nr_balance_failed = 0;
 13596			goto out_unbalanced;
 13597		}
 13598	
 13599		schedstat_inc(sd->lb_failed[idle]);
 13600		/*
 13601		 * Increment the failure counter only on periodic balance.
 13602		 * We do not want newidle balance, which can be very
 13603		 * frequent, pollute the failure counter causing
 13604		 * excessive cache_hot migrations and active balances.
 13605		 *
 13606		 * Similarly for migration_misfit which is not related to
 13607		 * load/util migration, don't pollute nr_balance_failed.
 13608		 *
 13609		 * The same for cache aware scheduling's allowance for
 13610		 * load imbalance. If regular load balance does not
 13611		 * migrate task due to LLC locality, it is a expected
 13612		 * behavior and don't pollute nr_balance_failed.
 13613		 * See can_migrate_task().
 13614		 */
 13615		if (idle != CPU_NEWLY_IDLE &&
 13616		    env.migration_type != migrate_misfit &&
 13617		    !(env.flags & LBF_LLC_PINNED))
 13618			sd->nr_balance_failed++;
 13619	
 13620		if (!need_active_balance(&env))
 13621			goto out_unbalanced;
 13622	
 13623		if (unlock_rq) {
 13624			raw_spin_rq_unlock(this_rq);
 13625			unlock_rq = false;
 13626			lock_rq = true;
 13627		}
 13628	
 13629		scoped_guard (raw_spin_rq_lock_irqsave, busiest) {
 13630			/*
 13631			 * Don't kick the active_load_balance_cpu_stop,
 13632			 * if the curr task on busiest CPU can't be
 13633			 * moved to this_cpu:
 13634			 */
 13635			if (!cpumask_test_cpu(this_cpu, busiest->curr->cpus_ptr))
 13636				goto out_one_pinned;
 13637	
 13638			/* Record that we found at least one task that could run on this_cpu */
 13639			env.flags &= ~LBF_ALL_PINNED;
 13640	
 13641			/*
 13642			 * ->active_balance synchronizes accesses to
 13643			 * ->active_balance_work.  Once set, it's cleared
 13644			 * only after active load balance is finished.
 13645			 */
 13646			if (busiest->active_balance)
 13647				goto out_unbalanced;
 13648	
 13649			/*
 13650			 * @busiest dropped its rq_lock in the middle of
 13651			 * scheduling out its ->curr task (->on_rq := 0), no
 13652			 * need to forcefully punt it away with active balance.
 13653			 */
 13654			if (!busiest->curr->on_rq)
 13655				goto out_unbalanced;
 13656	
 13657			busiest->active_balance = 1;
 13658			busiest->push_cpu = this_cpu;
 13659			active_balance = 1;
 13660			preempt_disable();
 13661		}
 13662		if (active_balance) {
 13663			stop_one_cpu_nowait(cpu_of(busiest),
 13664					    active_load_balance_cpu_stop, busiest,
 13665					    &busiest->active_balance_work);
 13666		}
 13667		preempt_enable();
 13668	
 13669	out_unbalanced:
 13670		/* We were unbalanced, so reset the balancing interval */
 13671		sd->balance_interval = sd->min_interval;
 13672		goto out;
 13673	
 13674	out_balanced:
 13675		/*
 13676		 * We reach balance although we may have faced some affinity
 13677		 * constraints. Clear the imbalance flag only if other tasks got
 13678		 * a chance to move and fix the imbalance.
 13679		 */
 13680		if (sd_parent && !(env.flags & LBF_ALL_PINNED)) {
 13681			int *group_imbalance = &sd_parent->groups->sgc->imbalance;
 13682	
 13683			if (*group_imbalance)
 13684				*group_imbalance = 0;
 13685		}
 13686	
 13687	out_all_pinned:
 13688		/*
 13689		 * We reach balance because all tasks are pinned at this level so
 13690		 * we can't migrate them. Let the imbalance flag set so parent level
 13691		 * can try to migrate them.
 13692		 */
 13693		schedstat_inc(sd->lb_balanced[idle]);
 13694	
 13695		sd->nr_balance_failed = 0;
 13696	
 13697	out_one_pinned:
 13698		ld_moved = 0;
 13699	
 13700		/*
 13701		 * sched_balance_newidle() disregards balance intervals, so we could
 13702		 * repeatedly reach this code, which would lead to balance_interval
 13703		 * skyrocketing in a short amount of time. Skip the balance_interval
 13704		 * increase logic to avoid that.
 13705		 *
 13706		 * Similarly misfit migration which is not necessarily an indication of
 13707		 * the system being busy and requires lb to backoff to let it settle
 13708		 * down.
 13709		 */
 13710		if (env.idle == CPU_NEWLY_IDLE ||
 13711		    env.migration_type == migrate_misfit)
 13712			goto out;
 13713	
 13714		/* tune up the balancing interval */
 13715		if ((env.flags & LBF_ALL_PINNED &&
 13716		     sd->balance_interval < MAX_PINNED_INTERVAL) ||
 13717		    sd->balance_interval < sd->max_interval)
 13718			sd->balance_interval *= 2;
 13719	out:
 13720		if (need_unlock)
 13721			atomic_set_release(&sched_balance_running, 0);
 13722		if (lock_rq)
 13723			raw_spin_rq_lock(this_rq);
 13724	
 13725		return ld_moved;
 13726	}
 13727	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
