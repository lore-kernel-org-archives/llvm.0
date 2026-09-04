Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16546490BEE;
	Fri,  4 Sep 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524534; cv=fail; b=tFTKOycIjE9757Lyq3d83bgN8ewDNmje25QZa5KsvUl0Z+Q+So77Z4wvR4KOpfN8WFGxwjKcJnIQOE62PxBDvyXc7sWOSDybM4QfkeWf8p+FmfvMHVYgiUjCtcBx0pHfsJaXRBo0U1KiTa3xpXzYW7Gd7OOYnnZgVZvIHuK7aDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524534; c=relaxed/simple;
	bh=JDJ11QziRIyi97+1q3DM3vf8PVGwNsECy9IvJ2EmJpg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ulX2AilUmy/QhpNQdEsvlZZU0FfH4eczkOeh9alifzCuZCWPNwrmuvmLeZdP3o9mJPQ3SfwjTaJrp2ev/M/9pEhjmTpbFVkYgJ4EQpoPIgnTtbTRIOh1gfRQTjfrrQA14hTXWM/oo+0W1QPM0HzJu99lqUzezhtVOUJj2LUT6N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsTFsWc0; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsTFsWc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788524530; x=1820060530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDJ11QziRIyi97+1q3DM3vf8PVGwNsECy9IvJ2EmJpg=;
  b=PsTFsWc0m9x1W9AZPisZ0EOD7d5U5ysYby3tNwduA2QA66dc8N66jXBq
   P11wQaUV+m+iIkoBSY8SPyA7xupJTOd363mB2XkD6TiE8qda0mx1a3j/K
   mCrd3ztRQKQWZ9+rWv14HiK5nsPytw7PEhjO9qR8yMf611B2MgUw4yHYH
   vcYLhjEeAVye5HZwJFXYt7tFZ9igKWS5kzJUvV4U6alk814QDaUC/fii6
   HdZbM63nTtumwlnRcCianJpBKV3XbGKMCPn/I0FRgw0R03iJGHDjf1Y6L
   ZqB0cZ0FOQM8VtgG6Apjx7+O8f/w3qthef7runq0zvNdzzcGA4wAC8zpB
   w==;
X-CSE-ConnectionGUID: QiXhoDOGQFy0b2eZPbke3w==
X-CSE-MsgGUID: jujxdNvpQeu59j5LhcNLAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100542199"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100542199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 05:22:09 -0700
X-CSE-ConnectionGUID: /SMFpURoTka4DyaFQt2lhQ==
X-CSE-MsgGUID: FPWlXn0TQnO82aAWaD3fEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294909066"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 05:22:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:22:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 05:22:09 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:21:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l82CR0TiR6rrEGDOXV8xDTuDn6+MIK6rIwBht8JKj2hR829Q7xPBFCFkTuHutvULhYQQTn+zDA9+FqFNhw6rkCRe22f9NbixxuyAHuVyhk7hapazl2ZJDoRSFQtKcmA+l/4YjHKaDel3RyB71dxiuivoS4iiTdVGbu8pK1+WjbUBykL/39Q83R4eYNJ0oGJceoiPpNlkKsaz1Za7tstssd6pCONIAXUCwbBlGXSyBq4SMaTrGNl1f4oh2M4to4t8INr3NDp4jd6j39Rb81dWO+3oDlaZqMe7Ne73TTpldp21Z46MoU50Sfd0/IdstBKuirHkUKP2QihjAfg+rJs1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6BRYVgGylpmwMIPPBvaxO6hCKGm54oCpJu/hRLveLs=;
 b=FNkzy2feNNJDZ9noPDPhvlpbo7D/pbFDFjUIZF6suKzJI/rcSd9bdcu9QBgsmBkG7naPA59LJ5NYvxkt3Pjn7y+464FX2Yfw220g7hnZF/nZKuEL9j5NXobxGg1rbog6BPEHt4PzH6zgy4aeks8UW7kwdooKNsB+1h94S1cW8KuXXsehc5LamnnzGVjvV86RPLkiseicPCwVLQdR/5COeK0rdn3QOkHx7zEhNA7JIPoor2LpQwgcID1oRBcF1rAqJ5o3W7KaiRBexlKjGLpBANX1VcKKYnuQVjVxxCCGDl/mKZImadkJiIw8oMTHshrjpiNue/C7bg9h/Z/xZ0eH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CO1PR11MB5187.namprd11.prod.outlook.com
 (2603:10b6:303:94::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:21:26 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:21:26 +0000
Date: Fri, 4 Sep 2026 20:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Timothy Day <timday@thelustrecollective.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Jan Kara
	<jack@suse.cz>
Subject: [linux-next:master 2657/3131] fs/ext2/super.c:1149:3: warning:
 calling function 'ext2_rsv_window_add' requires holding spinlock
 'EXT2_SB(sb).s_rsv_window_lock' exclusively
Message-ID: <apq3wKISniv/4ZLy@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH8PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::12) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 7045a90f-5a2d-48cd-292a-08df0a7f0a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|3023799007|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: ExA0EBW1/1s9UTybTKXICw01uvqc6EK6BM0IwJHfnvOkiNhmJ6pv8IEoZ37Sw2PDsyaDsTpppiaV4X22Q8+TkGSyVNR1jn6aGHSDHRw8Qh7WPwUe58RwrBhPZ6BZrpytt22lBhs27QzvSlRsswW7rM+klV+JGMUbpVykI4eYuZV0/tFb2ai4cMN1+E+pRDeNTY9VspCju+nQriqvK3SEmfWh2DWuI618kOpbAa2C/0o8DY8dRK5UsgroxQQaL1UddyZ2TDG0Q2UgtxdA1GWOXAsYARSdmMIqlrxNUnXrQZrb0cdT/aCMVEzRnho+QzoQvSwW7sQ6KkTODbD3S23L91qrxfm80/eirxUh9/Q3L5MS2yUENec+eiNQCycm/SeyXnKTsP9cvxhYvXsujV0rgf1odE529R1nJnLxtGkX20ELzO0WtZ7V6WfS6qHX7QsI4m+KEiLt81a111kdYMvquQfDlqt9xeVUBhk8mcb7AZ8l/nyooAtLtyH9MkjxLhTi3XAqQBdUALBgUTHUNci6JCOyfPEAPLol6kWu4lVB4Wc2nKRaCw7gl9OC3+jzRnjNvj8161OKjGkDSOQ4lLmjH+8stNXTH4OvxShbFttvwf0sp4Nt6Bk8JEw+hp465ly8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eF+LbFwBiLZheUOyRgTrEtCTAq57oRgJuATzoWmcjPlmZBNT7suq3FUHAJ7A?=
 =?us-ascii?Q?UvGHFSPjB9ZvmiUAgOAnM4u4X/kHj8HuNhNxCjrADAdq8gPpjcsv9butlDfd?=
 =?us-ascii?Q?yqmjSXurTz+d3NJJGL82FOw+7qCZOYFepfPGSszF2pjlCpoV/HT9X11ze+H2?=
 =?us-ascii?Q?S5YzgzaHX6SRyGcfrBW2A37aQ7LcfZKeqoimqOFuzNzLJzMptCxGxRn8pSmb?=
 =?us-ascii?Q?iux4KOcYP7m1aWud8nKa8pL7dvQ4cl80T09IOoqEimXyjG7ny5yzZOOGlFp4?=
 =?us-ascii?Q?aveCE8M3Qziq09Xiuj64csqVS+gdXv/J6FDb5EdCoWGAQ4gekvyuS1WJ9PEH?=
 =?us-ascii?Q?LTSFgAI9KkBXJJEDhWNWOE7+o6HxGbOdvtbo4ms1glKlLFaHfLsGA8DsHCon?=
 =?us-ascii?Q?y3LYEwqOo9vXpYIxc2jKMS8GhwCgSyHLA/657MzfIAm0fwsfMwWpCylowC7G?=
 =?us-ascii?Q?UWEoHDiGuuRatrmXxLoKBGqPkXRuADMi9U6x6+4v/j4Ix//FqrU9JDXP/FOC?=
 =?us-ascii?Q?n2O4EmQdXG16Nc4eMvA59H3IA8LxP5N8DT7Jb/DTIFwRkkj0REjJAa/fARZk?=
 =?us-ascii?Q?OvP+Mjuev2dy0xCqHCSf2qe/SsZ8wrfqm+3kvskGOIY9hi/HiENW04qTutGc?=
 =?us-ascii?Q?K86HVdayS/uefnq9NJNKXQJw6/Nq3ltrwnltYkN6R3MqtbELfhLgbKznHfRQ?=
 =?us-ascii?Q?tR2NngKY7CuVQAphMpyYg9eAvJO6RxnXRPC7VqhZzj5KtpmnLNbI8Jehb7vb?=
 =?us-ascii?Q?Mof8But52sGc1X6xPl/KgfnqDJSoDFDC+spDRJvf8e4ud6gX7tbWHCN8ERL4?=
 =?us-ascii?Q?MlFrEQ/bZR2W6b11A0NdUE5DkF32WKsfHUHYJhFSVBL3l6lP7b+fVB8UBR0n?=
 =?us-ascii?Q?MwDIJW6u+ZrFGihKsUKI+fThOnVWFb2EHs+RS/DjpA24rPBbg/2hwgQ6RCUt?=
 =?us-ascii?Q?6tKzeI7jJUtRksQT8VSSY+MypUuKZFYl0xe8LFxLA/Sup0o3BiN9bg6eV/7g?=
 =?us-ascii?Q?Wqrfl2wWaGzONiYXIGENS02dhYg+I1NBHSS1KT8lJP7QxAqzm/JPzInmy+yl?=
 =?us-ascii?Q?o9PePkJDwWOYs1GTn2aBSY2X4Ds6r5NYubYK8pknSNhIEdiS9o16BJVZyhEc?=
 =?us-ascii?Q?w39JHrJHW+JFStEeHV96Um0FuHkUOh7kG40/b56ldXVPWNHCGHwV0cAcdwY/?=
 =?us-ascii?Q?s2DF0wWldoUP2atLzryuc49l4KKNOYtLdLaV2xLM9Nf+W4DqzjnWfd4K/o03?=
 =?us-ascii?Q?Ld19Ll8gVSGO7+XZ5gdiZ5+RoyO1owonE1HULfuZIwAB13fbNMABfC5AbWsh?=
 =?us-ascii?Q?pP6X9fNqPHLrR4VtsOjKEbozbjY9iZSkmtJiOoWJCy6AlclRHh4UKB8nrZuL?=
 =?us-ascii?Q?I2+XnqGJw8THqvkwbyFRqfTs8z1FlN4StpyxEYMnVV4VcN/WQW0zHGoOJoTM?=
 =?us-ascii?Q?/qZIhBN3td50fdmhGmxwz4P1uFZFd/RlzLbmz9RHEm0d46cpPWj0kcSN36gm?=
 =?us-ascii?Q?3jM1sGSyWiXp/rjMPRWhXOu8yZBcAdJ2guiTj396n9sXbpORzOjqmGaBl1am?=
 =?us-ascii?Q?hqj894I73pSv8A30aUaOhonWSszfYngFNsmoawWzm8ZvzyTMat+JfuG/Hctl?=
 =?us-ascii?Q?QZXEMsi58ElCiaTBLvAFBX/guiBb4iPKkrqruamkeTBoJ7YLoYOfzHVXf3jG?=
 =?us-ascii?Q?bPE+YJqCBhTbaUvmJ7UbzM3cirsEXMaQbDpYCEss/dh6AKqj3avvCOQMhxn2?=
 =?us-ascii?Q?JLPd7rzK5g=3D=3D?=
X-Exchange-RoutingPolicyChecked: hFstkjeS/3KazBmbBm6YFd/4YS+PP5/JhXzdbzPB+2EVupHkirMjVpsRP/m7VxnrPrDmiV6P3siIHL2GUmoWVy+ZRKaBQwVUcW5B+O4533zAT3egpTYxu5F2A9SiauWQDoQxn3h21weqIyomaMflQIEk8pruJFImTkKQNcV1Y6EPHJ3CCAcsfuDXdlZH1G6K2thUf8ItRUmhDFsOj/SWzbE2gYJyLktbhwDm0nxQ7FjbnwE9b6dUoJ0vLAnklucmuZmvctcnDzzfV2coQj+EuL03eG7uPwvgwoQJ/COyPDsUFDz8YPiOyo6ry+iDXIvt0eHs0unAVtK7soWMTJaicQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7045a90f-5a2d-48cd-292a-08df0a7f0a1e
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:21:26.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8xbm0Tn+OjVzqfl+GkZxpF/TaRUQZAbyaFwf5rMhjb1TyuGR5F0uF98qboCzvjZvukwEHkVq8603jzg0/erJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
commit: a3cf61f60051ca8874f012fa8569fa971fbfbee0 [2657/3131] ext2: enable context analysis support for ext2 filesystem
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031718.nHHkJ5KA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ed1626b9d0eaf7c406f44da5fb595ad94559f54b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031718.nHHkJ5KA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609031718.nHHkJ5KA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext2/super.c:1149:3: warning: calling function 'ext2_rsv_window_add' requires holding spinlock 'EXT2_SB(sb).s_rsv_window_lock' exclusively [-Wthread-safety-precise]
    1149 |                 ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
         |                 ^
   fs/ext2/super.c:1149:3: note: found near match '_res->s_rsv_window_lock'
   1 warning generated.


vim +1149 fs/ext2/super.c

eab61d3260d76b Eric Sandeen      2025-02-23   866  
eab61d3260d76b Eric Sandeen      2025-02-23   867  static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds    2005-04-16   868  {
eab61d3260d76b Eric Sandeen      2025-02-23   869  	struct ext2_fs_context *ctx = fc->fs_private;
eab61d3260d76b Eric Sandeen      2025-02-23   870  	int silent = fc->sb_flags & SB_SILENT;
^1da177e4c3f41 Linus Torvalds    2005-04-16   871  	struct buffer_head * bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16   872  	struct ext2_sb_info * sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   873  	struct ext2_super_block * es;
^1da177e4c3f41 Linus Torvalds    2005-04-16   874  	struct inode *root;
^1da177e4c3f41 Linus Torvalds    2005-04-16   875  	unsigned long block;
eab61d3260d76b Eric Sandeen      2025-02-23   876  	unsigned long sb_block = ctx->s_sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   877  	unsigned long logic_sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   878  	unsigned long offset = 0;
d09099051057bb Chengguang Xu     2018-02-26   879  	long ret = -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16   880  	int blocksize = BLOCK_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16   881  	int db_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16   882  	int i, j;
^1da177e4c3f41 Linus Torvalds    2005-04-16   883  	__le32 features;
833f4077bf7c2d Peter Zijlstra    2007-10-16   884  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16   885  
bf4afc53b77aea Linus Torvalds    2026-02-21   886  	sbi = kzalloc_obj(*sbi);
^1da177e4c3f41 Linus Torvalds    2005-04-16   887  	if (!sbi)
cea845cdef4f50 Christoph Hellwig 2021-11-29   888  		return -ENOMEM;
18a82eb9f980b5 Pekka J Enberg    2009-01-07   889  
18a82eb9f980b5 Pekka J Enberg    2009-01-07   890  	sbi->s_blockgroup_lock =
bf4afc53b77aea Linus Torvalds    2026-02-21   891  		kzalloc_obj(struct blockgroup_lock);
18a82eb9f980b5 Pekka J Enberg    2009-01-07   892  	if (!sbi->s_blockgroup_lock) {
18a82eb9f980b5 Pekka J Enberg    2009-01-07   893  		kfree(sbi);
cea845cdef4f50 Christoph Hellwig 2021-11-29   894  		return -ENOMEM;
18a82eb9f980b5 Pekka J Enberg    2009-01-07   895  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   896  	sb->s_fs_info = sbi;
93d44cb275f3eb Miklos Szeredi    2007-10-16   897  	sbi->s_sb_block = sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   898  
023051c2d0f1d7 Timothy Day       2026-08-11   899  	guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
d09099051057bb Chengguang Xu     2018-02-26   900  	ret = -EINVAL;
c15271f4e74cd6 Jan Blunck        2010-04-14   901  
^1da177e4c3f41 Linus Torvalds    2005-04-16   902  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   903  	 * See what the current blocksize for the device is, and
^1da177e4c3f41 Linus Torvalds    2005-04-16   904  	 * use that as the blocksize.  Otherwise (or if the blocksize
^1da177e4c3f41 Linus Torvalds    2005-04-16   905  	 * is smaller than the default) use the default.
^1da177e4c3f41 Linus Torvalds    2005-04-16   906  	 * This is important for devices that have a hardware
^1da177e4c3f41 Linus Torvalds    2005-04-16   907  	 * sectorsize that is larger than the default.
^1da177e4c3f41 Linus Torvalds    2005-04-16   908  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   909  	blocksize = sb_min_blocksize(sb, BLOCK_SIZE);
^1da177e4c3f41 Linus Torvalds    2005-04-16   910  	if (!blocksize) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   911  		ext2_msg(sb, KERN_ERR, "error: unable to set blocksize");
^1da177e4c3f41 Linus Torvalds    2005-04-16   912  		goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   913  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   914  
^1da177e4c3f41 Linus Torvalds    2005-04-16   915  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   916  	 * If the superblock doesn't start on a hardware sector boundary,
^1da177e4c3f41 Linus Torvalds    2005-04-16   917  	 * calculate the offset.  
^1da177e4c3f41 Linus Torvalds    2005-04-16   918  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   919  	if (blocksize != BLOCK_SIZE) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   920  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   921  		offset = (sb_block*BLOCK_SIZE) % blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   922  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16   923  		logic_sb_block = sb_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16   924  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   925  
^1da177e4c3f41 Linus Torvalds    2005-04-16   926  	if (!(bh = sb_bread(sb, logic_sb_block))) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   927  		ext2_msg(sb, KERN_ERR, "error: unable to read superblock");
^1da177e4c3f41 Linus Torvalds    2005-04-16   928  		goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   929  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   930  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   931  	 * Note: s_es must be initialized as soon as possible because
^1da177e4c3f41 Linus Torvalds    2005-04-16   932  	 *       some ext2 macro-instructions depend on its value
^1da177e4c3f41 Linus Torvalds    2005-04-16   933  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   934  	es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
^1da177e4c3f41 Linus Torvalds    2005-04-16   935  	sbi->s_es = es;
^1da177e4c3f41 Linus Torvalds    2005-04-16   936  	sb->s_magic = le16_to_cpu(es->s_magic);
^1da177e4c3f41 Linus Torvalds    2005-04-16   937  
^1da177e4c3f41 Linus Torvalds    2005-04-16   938  	if (sb->s_magic != EXT2_SUPER_MAGIC)
^1da177e4c3f41 Linus Torvalds    2005-04-16   939  		goto cantfind_ext2;
^1da177e4c3f41 Linus Torvalds    2005-04-16   940  
eab61d3260d76b Eric Sandeen      2025-02-23   941  	ext2_set_options(fc, sbi);
088519572ca8bd Jan Kara          2017-10-09   942  
1751e8a6cb935e Linus Torvalds    2017-11-27   943  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
38fa0e8e4a3b93 Chengguang Xu     2019-05-20   944  		(test_opt(sb, POSIX_ACL) ? SB_POSIXACL : 0);
46b15caa7cb19b Tejun Heo         2015-06-16   945  	sb->s_iflags |= SB_I_CGROUPWB;
^1da177e4c3f41 Linus Torvalds    2005-04-16   946  
^1da177e4c3f41 Linus Torvalds    2005-04-16   947  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV &&
^1da177e4c3f41 Linus Torvalds    2005-04-16   948  	    (EXT2_HAS_COMPAT_FEATURE(sb, ~0U) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16   949  	     EXT2_HAS_RO_COMPAT_FEATURE(sb, ~0U) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16   950  	     EXT2_HAS_INCOMPAT_FEATURE(sb, ~0U)))
2314b07cb47ef7 Oleksij Rempel    2009-11-19   951  		ext2_msg(sb, KERN_WARNING,
2314b07cb47ef7 Oleksij Rempel    2009-11-19   952  			"warning: feature flags set on rev 0 fs, "
2314b07cb47ef7 Oleksij Rempel    2009-11-19   953  			"running e2fsck is recommended");
^1da177e4c3f41 Linus Torvalds    2005-04-16   954  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   955  	 * Check feature flags regardless of the revision level, since we
^1da177e4c3f41 Linus Torvalds    2005-04-16   956  	 * previously didn't change the revision level when setting the flags,
^1da177e4c3f41 Linus Torvalds    2005-04-16   957  	 * so there is a chance incompat flags are set on a rev 0 filesystem.
^1da177e4c3f41 Linus Torvalds    2005-04-16   958  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   959  	features = EXT2_HAS_INCOMPAT_FEATURE(sb, ~EXT2_FEATURE_INCOMPAT_SUPP);
^1da177e4c3f41 Linus Torvalds    2005-04-16   960  	if (features) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   961  		ext2_msg(sb, KERN_ERR,	"error: couldn't mount because of "
2314b07cb47ef7 Oleksij Rempel    2009-11-19   962  		       "unsupported optional features (%x)",
2314b07cb47ef7 Oleksij Rempel    2009-11-19   963  			le32_to_cpu(features));
^1da177e4c3f41 Linus Torvalds    2005-04-16   964  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16   965  	}
bc98a42c1f7d0f David Howells     2017-07-17   966  	if (!sb_rdonly(sb) && (features = EXT2_HAS_RO_COMPAT_FEATURE(sb, ~EXT2_FEATURE_RO_COMPAT_SUPP))){
2314b07cb47ef7 Oleksij Rempel    2009-11-19   967  		ext2_msg(sb, KERN_ERR, "error: couldn't mount RDWR because of "
2314b07cb47ef7 Oleksij Rempel    2009-11-19   968  		       "unsupported optional features (%x)",
2314b07cb47ef7 Oleksij Rempel    2009-11-19   969  		       le32_to_cpu(features));
^1da177e4c3f41 Linus Torvalds    2005-04-16   970  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16   971  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   972  
62aeb94433fcec Jan Kara          2023-03-01   973  	if (le32_to_cpu(es->s_log_block_size) >
62aeb94433fcec Jan Kara          2023-03-01   974  	    (EXT2_MAX_BLOCK_LOG_SIZE - BLOCK_SIZE_BITS)) {
62aeb94433fcec Jan Kara          2023-03-01   975  		ext2_msg(sb, KERN_ERR,
62aeb94433fcec Jan Kara          2023-03-01   976  			 "Invalid log block size: %u",
62aeb94433fcec Jan Kara          2023-03-01   977  			 le32_to_cpu(es->s_log_block_size));
62aeb94433fcec Jan Kara          2023-03-01   978  		goto failed_mount;
62aeb94433fcec Jan Kara          2023-03-01   979  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   980  	blocksize = BLOCK_SIZE << le32_to_cpu(sbi->s_es->s_log_block_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16   981  
^1da177e4c3f41 Linus Torvalds    2005-04-16   982  	/* If the blocksize doesn't match, re-read the thing.. */
^1da177e4c3f41 Linus Torvalds    2005-04-16   983  	if (sb->s_blocksize != blocksize) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   984  		brelse(bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16   985  
^1da177e4c3f41 Linus Torvalds    2005-04-16   986  		if (!sb_set_blocksize(sb, blocksize)) {
4e299c1d9113b5 Robin Dong        2011-05-05   987  			ext2_msg(sb, KERN_ERR,
4e299c1d9113b5 Robin Dong        2011-05-05   988  				"error: bad blocksize %d", blocksize);
^1da177e4c3f41 Linus Torvalds    2005-04-16   989  			goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   990  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16   991  
^1da177e4c3f41 Linus Torvalds    2005-04-16   992  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   993  		offset = (sb_block*BLOCK_SIZE) % blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16   994  		bh = sb_bread(sb, logic_sb_block);
^1da177e4c3f41 Linus Torvalds    2005-04-16   995  		if(!bh) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19   996  			ext2_msg(sb, KERN_ERR, "error: couldn't read"
2314b07cb47ef7 Oleksij Rempel    2009-11-19   997  				"superblock on 2nd try");
^1da177e4c3f41 Linus Torvalds    2005-04-16   998  			goto failed_sbi;
^1da177e4c3f41 Linus Torvalds    2005-04-16   999  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1000  		es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1001  		sbi->s_es = es;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1002  		if (es->s_magic != cpu_to_le16(EXT2_SUPER_MAGIC)) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1003  			ext2_msg(sb, KERN_ERR, "error: magic mismatch");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1004  			goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1005  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1006  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1007  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1008  	sb->s_maxbytes = ext2_max_size(sb->s_blocksize_bits);
8de52778798fe3 Al Viro           2012-02-06  1009  	sb->s_max_links = EXT2_LINK_MAX;
22b139691f9eb8 Deepa Dinamani    2019-07-30  1010  	sb->s_time_min = S32_MIN;
22b139691f9eb8 Deepa Dinamani    2019-07-30  1011  	sb->s_time_max = S32_MAX;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1012  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1013  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1014  		sbi->s_inode_size = EXT2_GOOD_OLD_INODE_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1015  		sbi->s_first_ino = EXT2_GOOD_OLD_FIRST_INO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1016  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1017  		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1018  		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1019  		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
d8ea6cf8999100 vignesh babu      2007-10-16  1020  		    !is_power_of_2(sbi->s_inode_size) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  1021  		    (sbi->s_inode_size > blocksize)) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1022  			ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1023  				"error: unsupported inode size: %d",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1024  				sbi->s_inode_size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1025  			goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1026  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1027  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1028  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1029  	sbi->s_blocks_per_group = le32_to_cpu(es->s_blocks_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1030  	sbi->s_inodes_per_group = le32_to_cpu(es->s_inodes_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1031  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1032  	sbi->s_inodes_per_block = sb->s_blocksize / EXT2_INODE_SIZE(sb);
607eb266aea9dd Andries Brouwer   2006-08-27  1033  	if (sbi->s_inodes_per_block == 0 || sbi->s_inodes_per_group == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1034  		goto cantfind_ext2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1035  	sbi->s_itb_per_group = sbi->s_inodes_per_group /
^1da177e4c3f41 Linus Torvalds    2005-04-16  1036  					sbi->s_inodes_per_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1037  	sbi->s_desc_per_block = sb->s_blocksize /
^1da177e4c3f41 Linus Torvalds    2005-04-16  1038  					sizeof (struct ext2_group_desc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1039  	sbi->s_sbh = bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1040  	sbi->s_mount_state = le16_to_cpu(es->s_state);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1041  	sbi->s_addr_per_block_bits =
f0d1b0b30d250a David Howells     2006-12-08  1042  		ilog2 (EXT2_ADDR_PER_BLOCK(sb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1043  	sbi->s_desc_per_block_bits =
f0d1b0b30d250a David Howells     2006-12-08  1044  		ilog2 (EXT2_DESC_PER_BLOCK(sb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1045  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1046  	if (sb->s_magic != EXT2_SUPER_MAGIC)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1047  		goto cantfind_ext2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1048  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1049  	if (sb->s_blocksize != bh->b_size) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1050  		if (!silent)
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1051  			ext2_msg(sb, KERN_ERR, "error: unsupported blocksize");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1052  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1053  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1054  
404615d7f1dcd4 Jan Kara          2023-06-13  1055  	if (es->s_log_frag_size != es->s_log_block_size) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1056  		ext2_msg(sb, KERN_ERR,
404615d7f1dcd4 Jan Kara          2023-06-13  1057  			"error: fragsize log %u != blocksize log %u",
404615d7f1dcd4 Jan Kara          2023-06-13  1058  			le32_to_cpu(es->s_log_frag_size), sb->s_blocksize_bits);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1059  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1060  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1061  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1062  	if (sbi->s_blocks_per_group > sb->s_blocksize * 8) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1063  		ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1064  			"error: #blocks per group too big: %lu",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1065  			sbi->s_blocks_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1066  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1067  	}
d766f2d1e3e3bd Jan Kara          2022-09-14  1068  	/* At least inode table, bitmaps, and sb have to fit in one group */
d766f2d1e3e3bd Jan Kara          2022-09-14  1069  	if (sbi->s_blocks_per_group <= sbi->s_itb_per_group + 3) {
d766f2d1e3e3bd Jan Kara          2022-09-14  1070  		ext2_msg(sb, KERN_ERR,
d766f2d1e3e3bd Jan Kara          2022-09-14  1071  			"error: #blocks per group smaller than metadata size: %lu <= %lu",
d766f2d1e3e3bd Jan Kara          2022-09-14  1072  			sbi->s_blocks_per_group, sbi->s_inodes_per_group + 3);
d766f2d1e3e3bd Jan Kara          2022-09-14  1073  		goto failed_mount;
d766f2d1e3e3bd Jan Kara          2022-09-14  1074  	}
fa78f336937240 Jan Kara          2022-07-26  1075  	if (sbi->s_inodes_per_group < sbi->s_inodes_per_block ||
fa78f336937240 Jan Kara          2022-07-26  1076  	    sbi->s_inodes_per_group > sb->s_blocksize * 8) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1077  		ext2_msg(sb, KERN_ERR,
fa78f336937240 Jan Kara          2022-07-26  1078  			"error: invalid #inodes per group: %lu",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1079  			sbi->s_inodes_per_group);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1080  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1081  	}
d766f2d1e3e3bd Jan Kara          2022-09-14  1082  	if (sb_bdev_nr_blocks(sb) < le32_to_cpu(es->s_blocks_count)) {
d766f2d1e3e3bd Jan Kara          2022-09-14  1083  		ext2_msg(sb, KERN_ERR,
d766f2d1e3e3bd Jan Kara          2022-09-14  1084  			 "bad geometry: block count %u exceeds size of device (%u blocks)",
d766f2d1e3e3bd Jan Kara          2022-09-14  1085  			 le32_to_cpu(es->s_blocks_count),
d766f2d1e3e3bd Jan Kara          2022-09-14  1086  			 (unsigned)sb_bdev_nr_blocks(sb));
d766f2d1e3e3bd Jan Kara          2022-09-14  1087  		goto failed_mount;
d766f2d1e3e3bd Jan Kara          2022-09-14  1088  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1089  
41f04d852e3595 Eric Sandeen      2006-09-27  1090  	sbi->s_groups_count = ((le32_to_cpu(es->s_blocks_count) -
41f04d852e3595 Eric Sandeen      2006-09-27  1091  				le32_to_cpu(es->s_first_data_block) - 1)
41f04d852e3595 Eric Sandeen      2006-09-27  1092  					/ EXT2_BLOCKS_PER_GROUP(sb)) + 1;
fa78f336937240 Jan Kara          2022-07-26  1093  	if ((u64)sbi->s_groups_count * sbi->s_inodes_per_group !=
fa78f336937240 Jan Kara          2022-07-26  1094  	    le32_to_cpu(es->s_inodes_count)) {
fa78f336937240 Jan Kara          2022-07-26  1095  		ext2_msg(sb, KERN_ERR, "error: invalid #inodes: %u vs computed %llu",
fa78f336937240 Jan Kara          2022-07-26  1096  			 le32_to_cpu(es->s_inodes_count),
fa78f336937240 Jan Kara          2022-07-26  1097  			 (u64)sbi->s_groups_count * sbi->s_inodes_per_group);
fa78f336937240 Jan Kara          2022-07-26  1098  		goto failed_mount;
fa78f336937240 Jan Kara          2022-07-26  1099  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1100  	db_count = (sbi->s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
^1da177e4c3f41 Linus Torvalds    2005-04-16  1101  		   EXT2_DESC_PER_BLOCK(sb);
32a92f8c893269 Linus Torvalds    2026-02-21  1102  	sbi->s_group_desc = kvmalloc_objs(struct buffer_head *, db_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1103  	if (sbi->s_group_desc == NULL) {
6a03e6a8dcf573 Chengguang Xu     2019-01-01  1104  		ret = -ENOMEM;
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1105  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1106  		goto failed_mount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1107  	}
18a82eb9f980b5 Pekka J Enberg    2009-01-07  1108  	bgl_lock_init(sbi->s_blockgroup_lock);
dd00cc486ab1c1 Yoann Padioleau   2007-07-19  1109  	sbi->s_debts = kcalloc(sbi->s_groups_count, sizeof(*sbi->s_debts), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  	if (!sbi->s_debts) {
6a03e6a8dcf573 Chengguang Xu     2019-01-01  1111  		ret = -ENOMEM;
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1112  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  		goto failed_mount_group_desc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1115  	for (i = 0; i < db_count; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1116  		block = descriptor_loc(sb, logic_sb_block, i);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1117  		sbi->s_group_desc[i] = sb_bread(sb, block);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1118  		if (!sbi->s_group_desc[i]) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1119  			for (j = 0; j < i; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1120  				brelse (sbi->s_group_desc[j]);
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1121  			ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1122  				"error: unable to read group descriptors");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1123  			goto failed_mount_group_desc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1124  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1125  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1126  	if (!ext2_check_descriptors (sb)) {
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1127  		ext2_msg(sb, KERN_ERR, "group descriptors corrupted");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1128  		goto failed_mount2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1129  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1130  	sbi->s_gdb_count = db_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1131  	spin_lock_init(&sbi->s_next_gen_lock);
e76ed86ee88f68 Timothy Day       2026-08-11  1132  	scoped_guard(spinlock, &sbi->s_next_gen_lock)
e76ed86ee88f68 Timothy Day       2026-08-11  1133  		sbi->s_next_generation = get_random_u32();
0216bfcffe424a Mingming Cao      2006-06-23  1134  
e312c97ea253f0 Liu xuzhi         2021-03-18  1135  	/* per filesystem reservation list head & lock */
a686cd898bd999 Martin J. Bligh   2007-10-16  1136  	spin_lock_init(&sbi->s_rsv_window_lock);
2e918ca509ae57 Timothy Day       2026-08-11  1137  	scoped_guard(spinlock, &sbi->s_rsv_window_lock) {
a686cd898bd999 Martin J. Bligh   2007-10-16  1138  		sbi->s_rsv_window_root = RB_ROOT;
a686cd898bd999 Martin J. Bligh   2007-10-16  1139  		/*
a686cd898bd999 Martin J. Bligh   2007-10-16  1140  		 * Add a single, static dummy reservation to the start of the
a686cd898bd999 Martin J. Bligh   2007-10-16  1141  		 * reservation window list --- it gives us a placeholder for
a686cd898bd999 Martin J. Bligh   2007-10-16  1142  		 * append-at-start-of-list which makes the allocation logic
a686cd898bd999 Martin J. Bligh   2007-10-16  1143  		 * _much_ simpler.
a686cd898bd999 Martin J. Bligh   2007-10-16  1144  		 */
a686cd898bd999 Martin J. Bligh   2007-10-16  1145  		sbi->s_rsv_window_head.rsv_start = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
a686cd898bd999 Martin J. Bligh   2007-10-16  1146  		sbi->s_rsv_window_head.rsv_end = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
a686cd898bd999 Martin J. Bligh   2007-10-16  1147  		sbi->s_rsv_window_head.rsv_alloc_hit = 0;
a686cd898bd999 Martin J. Bligh   2007-10-16  1148  		sbi->s_rsv_window_head.rsv_goal_size = 0;
a686cd898bd999 Martin J. Bligh   2007-10-16 @1149  		ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
2e918ca509ae57 Timothy Day       2026-08-11  1150  	}
a686cd898bd999 Martin J. Bligh   2007-10-16  1151  
833f4077bf7c2d Peter Zijlstra    2007-10-16  1152  	err = percpu_counter_init(&sbi->s_freeblocks_counter,
908c7f1949cb7c Tejun Heo         2014-09-08  1153  				ext2_count_free_blocks(sb), GFP_KERNEL);
833f4077bf7c2d Peter Zijlstra    2007-10-16  1154  	if (!err) {
833f4077bf7c2d Peter Zijlstra    2007-10-16  1155  		err = percpu_counter_init(&sbi->s_freeinodes_counter,
908c7f1949cb7c Tejun Heo         2014-09-08  1156  				ext2_count_free_inodes(sb), GFP_KERNEL);
833f4077bf7c2d Peter Zijlstra    2007-10-16  1157  	}
833f4077bf7c2d Peter Zijlstra    2007-10-16  1158  	if (!err) {
833f4077bf7c2d Peter Zijlstra    2007-10-16  1159  		err = percpu_counter_init(&sbi->s_dirs_counter,
908c7f1949cb7c Tejun Heo         2014-09-08  1160  				ext2_count_dirs(sb), GFP_KERNEL);
833f4077bf7c2d Peter Zijlstra    2007-10-16  1161  	}
833f4077bf7c2d Peter Zijlstra    2007-10-16  1162  	if (err) {
34e92542da9643 Chengguang Xu     2019-11-29  1163  		ret = err;
2314b07cb47ef7 Oleksij Rempel    2009-11-19  1164  		ext2_msg(sb, KERN_ERR, "error: insufficient memory");
833f4077bf7c2d Peter Zijlstra    2007-10-16  1165  		goto failed_mount3;
833f4077bf7c2d Peter Zijlstra    2007-10-16  1166  	}
be0726d33cb8f4 Jan Kara          2016-02-22  1167  

:::::: The code at line 1149 was first introduced by commit
:::::: a686cd898bd999fd026a51e90fb0a3410d258ddb ext2 reservations

:::::: TO: Martin J. Bligh <mbligh@mbligh.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

