Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3681E;
	Sun, 22 Jun 2025 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750600684; cv=fail; b=T3z2B65Jk1t/MjtFBlmtrD216Q41b/W+iKGT/lu+ykAjMMdnjroK+O7mREc2rkaZES9OkRd3uPfn3URUxfXO6EWp35VBX5KX3YNvw17qsoRaSPG/32np0NWXWW95znexTgIAylJj6JzfQg4KOB40jzErzo+PZRjBak3ON5+gsco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750600684; c=relaxed/simple;
	bh=JsGWSum5/6DTgg2C/JtMLRCkdxxGwEw5N7Ne7dqV5A8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VIe0X+M+gj1h3DmTz2OhzzyIgfKyODmIXbmwDCQEghoy3yJjj7x+HvZeD8jqjts/02+rh0F0ilrCkATWHfgUgIc/hWBxrUoJuh3G1Xu7hX7pJ5LZvuUcXUYLZlvRf5cr1XNXd5derUO6+kMXPvPIJjg9cNlMw2VpkTRON3og0vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnfRok1V; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnfRok1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750600682; x=1782136682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JsGWSum5/6DTgg2C/JtMLRCkdxxGwEw5N7Ne7dqV5A8=;
  b=CnfRok1VpC2ocC6j+x1+cHprVv202iAhlgmv8tWAbYmQuMgx2iOymKeL
   68WGSP0qXvkl1Fq7T3AxjUHefoec4ugif/udug/J1eQTx0UllGC+/SQqp
   6lYBJ/XLlhOz5tpls6dURcfKsKqgFDEarAizs2gxWhnOh+A1THqxPsEZy
   vMUSmst4Cz2hdLnxnTM59uH9lbIjzoxoBLUjZYFQN2MLfE2oWGb9jwps9
   pC9fKs1ChPJO1U0kNQ+xAUTs5uJhPTa6HY+TjdI7sfWWTWcWqGw9zK6Dk
   OQCcQSjZ4SYSf5Ak3G1xJ87jCWfgZhwiPQxsKV5cTG/KKnapQqqMHjdSB
   w==;
X-CSE-ConnectionGUID: 4r+iDPrRQ8W+H3VkABehNQ==
X-CSE-MsgGUID: Jrl2C3jBRHWBkcIXwk2l9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52888187"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52888187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 06:58:01 -0700
X-CSE-ConnectionGUID: M/UqH6hMTfSTXdSO2V2Flg==
X-CSE-MsgGUID: HhfPeGsqQl64A+huOPgckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="151641300"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 06:58:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 06:58:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 06:58:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 06:58:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKJ4W+TkG2T+QSTov2FkS/eA75Bdo4F7DKjoANaMQhgMhjaLroCCfYAloPlN0COCMQvkNp+SHepu3aEZK6SltD9OpM8MRt+2X/Gx2NfkK85rrJWxQdqN9fwAwZqsCIXB5d6Vak5R2b92Cej4/4mQFG9KSX8mmEfgmxDqgv+B58uzz+Mustess/cG2gGt/s3sOg1GIIb37qEQb/m7bbF97RmAO1ieLQ85wgLAZYwgNiBzZUiBcM3wCdAxkTqs+98aJoOdKMZSE76ytuBcVdXplafWrIIn2nXTu7JLRtHbzNcZS8Sx3OHqKg14n2W2R8gi/ENvBvr1gS4SlCmFnHw/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIlc1OLqR7OoNwCBuRcw8FXyUByGMYve7CCuu9BT98U=;
 b=OokLd770rGLm0jrYx5uHH9sGZ3Ljd+4sSLiYYPNF8HG8Hed7vuzfaoZEwc8CN4X+zZyI0/wZ4lK7Wwv2n3j/4h1/8ueyYfoag7/2R+YYh0l24i3K0WGJOUAYZKny1+cSo+ht4h3IKydEONf1tEJbWktOQqk2NjqblARIOcsIO5cOxGynl2aeQTg3tYj1Q724q46twyrV6tf3m1Tqbg2MQSWrkU2YtDHwk097x4qU15/IPlrzwzPcyo1gyRmyxwgyFojl9JnEQo4QFANCyxriSmxnhSsvqb0aMEqtYndAoJtM7nsEBkLEWTFyXrEaZLUz68gDHQ1Lz9li90jy5SKOew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13)
 by DM4PR11MB8160.namprd11.prod.outlook.com (2603:10b6:8:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Sun, 22 Jun
 2025 13:57:30 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::1820:e56:f78c:5cca]) by PH0PR11MB7445.namprd11.prod.outlook.com
 ([fe80::1820:e56:f78c:5cca%7]) with mapi id 15.20.8857.022; Sun, 22 Jun 2025
 13:57:29 +0000
Date: Sun, 22 Jun 2025 21:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [arnd-playground:to_build 44/57]
 drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:435:12: warning:
 stack frame size (1080) exceeds limit (1024) in
 'ipsec_fs_roce_rx_mpv_create'
Message-ID: <aFgLhC/UFuEm16CC@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7445:EE_|DM4PR11MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: a2dc0fda-f800-48fc-0318-08ddb19495b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p+QDbub1uvxtVL51PI1qo5PTxqU05LoYaVTbH4DAByaxIgmUPNbKL64HsGZM?=
 =?us-ascii?Q?IJNseMOtn47OqRm9z9NRRxNsuVE5hpxL/heVb9LqC+wIjAPx7+2NeIAHHszU?=
 =?us-ascii?Q?gzpJwGrI9UH359hcENx0nkg3Z12qinU4nl872HDoYK3YQjETCAzeMArdZcDi?=
 =?us-ascii?Q?p8wG3rxZ0wEx/2oGkRa0hwuIhYhupxWW7HEOxESozAaWyo77NU4gsw9lu9zE?=
 =?us-ascii?Q?JNL8cqiGFsqGf7erHbtbEkyY4DaXmMjCJfGlqK3vj5v6SZysHnNt0RoN3gpx?=
 =?us-ascii?Q?Uf6IqViElRbVsNuVJIiJl6Dkju73yklRJ8yjUpIT0WslddkoE5D3viOwAfck?=
 =?us-ascii?Q?3/6CaGWmmcgl0znRWqhoW+M+w1UH2vVZZecEjJp19RZlgkhhkpM/V9937EDQ?=
 =?us-ascii?Q?S+UE6n/4BNVjoasGx+b2LSd2VJOW730wLykm8PDR7i3rAFriOzK7kOXA0Aoq?=
 =?us-ascii?Q?TVWaIiedMqaAuFS0DaTaso81oKgIHCJfUK7iijUOAID8WjN8eQYJyq19sxSk?=
 =?us-ascii?Q?na+qgLr/PfovZB7I/YTbTV+CRjWg0nxJ4v3kwc+G44dZVqbvHVxL7Hh6WuNh?=
 =?us-ascii?Q?ej9z4dJhgxoGFTUjqGzaOmhpnk81kX3hhfYhK7nhdP/6/LTzfbWzJXwxmPBM?=
 =?us-ascii?Q?nsrotUsawo/CyWFw9NUrKs1o06+pJjClHN7M36aKYEI9xrmq1dSfZ6E4Z7n1?=
 =?us-ascii?Q?JTjTT2rJOp5PF60EJYSEgm2uqk3ucswtovMXIQxoQLZqM1lo63XPJE+0h6UR?=
 =?us-ascii?Q?nXpGK917WOZlPQGbqaZcVTDTCaOzAZZI9T4HAVYcQATtXetian68lYi5QNY6?=
 =?us-ascii?Q?lPlB7CEkQuGhOGQT0agXmeDScltqPWson0wcoYhf6tHUhpG28OreDU+ptmfo?=
 =?us-ascii?Q?2ld/I7+xYOyqtWFWWL0ifOmwujLc29u61oW+HPYKPWfVQ6Oa4oJDZQ6pohwQ?=
 =?us-ascii?Q?QZxocnGXtw8UwyAvctRhB2cSyUxHT3B2APQDjVqYGiFnme9NakSsTrPIp+uz?=
 =?us-ascii?Q?Mu0iSAfjdvjz1vS6MILr8CNRN9er1oLLD+o3b7elQ+JH56WU54Qm15SUH3vE?=
 =?us-ascii?Q?p2ciq7iQEWfzpH4Uh6ZQeoE/4NwEoFNBdDfOEJwd+gixQI4oD7Q/49CHC0Yv?=
 =?us-ascii?Q?wMACW7hg2Q/KBXARvElBENkxiXNCOjL2Kr4oj8UISPJRpeR2TyUpWAQafbEE?=
 =?us-ascii?Q?CRu8cF4qxD/7i8cEY2ElVF42ArCGfsXDFW4bQVH/SxZcyYLrMjXWfAUTUov4?=
 =?us-ascii?Q?5a8KN899DFHRikkCIJYPPTclJDUt06R1n7srSleN66/1dRXzN2OVHLqhFbJy?=
 =?us-ascii?Q?KLbouLZvMvXL9Ct03GX9eeYSjq/fi7G7g10ZIAAAPZk58qmTynkkH9gRRfo+?=
 =?us-ascii?Q?4ch9CPhTnOZzaVQHc3xK7Jahfw9r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7445.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oc5LdY+ckNLuoepih4ghs1ytbVYvWtWcFaA9jjwgrok/qFfVm6QJ4ul2c8sW?=
 =?us-ascii?Q?OJhAQoYwrxEInyrKhJtelgMBaxiDY1K7SZRN1NGh25RbZADEln9+ghOoZ3nM?=
 =?us-ascii?Q?APQGle31r4wJZPusqxSXXZsH5tyiJha/f5LEPZ48n+dDJSai2Gs9gvkDoT8x?=
 =?us-ascii?Q?c9y9H4sWZtxTVfB3WCmitY09yr1wMi7lxUWH4XjrOqIUv2GxmFlomT2j90dL?=
 =?us-ascii?Q?eCDBCBwEMzPOJq+B1kQIngwGq+SrTwH3K1h9e+Q2hWuXPnbOfTy8Nw4CujU0?=
 =?us-ascii?Q?CNFlWGd6m7zKkjEUrPbOZc3+brhkub3rhiDmcxHRfz2awollNRTysbu3172r?=
 =?us-ascii?Q?O0Rtcgo+rDGcpGRGXDCGByQOK8A8HlMrwurhG7iA0T8Qr8qY4gZnWTlxMwn9?=
 =?us-ascii?Q?al1DaKr+crMq5mgIcjLhxpX9CORoEqNv5ykhoPjqpg/dexpqJYfvMNwFzSqG?=
 =?us-ascii?Q?rHoo51B3ApASdTKvR3tVn0mP2u7YwRNUMdl/HuUOvxRl+9ZIYPy2+4c5tw5W?=
 =?us-ascii?Q?u+uU6gFNIQ2cWedP79ojyGSP/SQ/2KEOorWqu8I57/LzXTBXY9mf2aeqeIRg?=
 =?us-ascii?Q?p53BORfDK7Xwz2wRWWoHoQEBQ/5X+sOHMuWwmyNG8dRBsKxpEu4g9EZOvITU?=
 =?us-ascii?Q?daOp0LIWO2BIaAc3uNsr56fJ3CdHrHhQD7DGl9BmaCHzoX0RSh/1xGQtA93l?=
 =?us-ascii?Q?ehUvYMwwL/TJ9ZVAJMoLyujamy36m5YMtBcG0aVJ4IQI6MFfZtFRE4bxulbZ?=
 =?us-ascii?Q?ZUvzD/hk0Wv2RDq1/2DaquwTjoyN5qAMEmISdApQm8OTPrZzwSGVeyFublZh?=
 =?us-ascii?Q?1Az6POVCCIoXFVf/t5jL2yeICCuKEzv0ECjSmfcvph455Qn4og3N0Rn7Zofd?=
 =?us-ascii?Q?j4nQs7MRk/3i3iqZXrj6CPyfyLx/hy0rTeQ/OQe9+WG9VvLGN/mYelYZDRKu?=
 =?us-ascii?Q?oTVXSAKNnMCHpzp1VtKkD+e8VF3ef3s8pKhMb/JhP4Bdn9V4NVQMLgV2QGXS?=
 =?us-ascii?Q?/JJWsyhrZuqimskGJFkEF9KgC0D7qYCdpg54NyqEOCFSEph6kg8kpRffgpwK?=
 =?us-ascii?Q?eTGtrTRws5xJaLK88ki0rlYXBpKF6F3ZHnCv9ib0yRoxFBCdirHXtWob8K6C?=
 =?us-ascii?Q?zHUiFbv5JHiO1ufxh9ob6nHra+Bu04glEJzdXQECge1lo4g6gId838Rmt1Oe?=
 =?us-ascii?Q?qqVu33c58WMS1OLudnRFImdC22LzRBJpBfBaKN9e5+D8ux4ykvmqQUHtruCD?=
 =?us-ascii?Q?WClUda+s5IhBE1MHBiHWYbm+fRuDhZF+9Eji99/5z96sy86fPXiVvsLab3Mh?=
 =?us-ascii?Q?SjfOBWHD8L33iHzcNelRDiJd9ffg/TwCfzwIBRRHpI2p+FBtiOGDA8OxTlQU?=
 =?us-ascii?Q?VaYdVmfnlVfxnvm+mky8uxioZlieGT51v2kSkd/bz2KMLHYmLNKh3Cxjcm5B?=
 =?us-ascii?Q?OU5DB6k+N+MdXP8ESLVeO/YkIN4wAuvbJ8XzH7boUAz8WbQe3TCr5cpIqktk?=
 =?us-ascii?Q?C4QFBtk71xilfbWpgLEXchAxCD+d3HllBgyyu+eqDEtGi1LWK7ltTvPtIxFF?=
 =?us-ascii?Q?xKZ8nc/tzpFvstNdCpP44w2gfPDBJwZVyrGlyCCQkdtdkilYD/+OSQkgWOd0?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dc0fda-f800-48fc-0318-08ddb19495b5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2025 13:56:28.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxnOznKDOYS+UnstBovL/B9pcJZJkJk6gh5DiZXIdCl8xV6bdAuT1vFG30a5yQO0oOSFai3Yj2HREX/RhL24nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8160
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   45965d80ee21635e7f04e6d7fd6caa929820b219
commit: 276c406d6c7bd470813f8fc95affe88be9632beb [44/57] Kbuild: reduce per-function stack usage in kasan/kmsan
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250622/202506221717.XWeMwsJt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221717.XWeMwsJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506221717.XWeMwsJt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:4:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/fs_core.h:37:
   In file included from include/linux/mlx5/fs.h:36:
   In file included from include/linux/mlx5/driver.h:38:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:435:12: warning: stack frame size (1080) exceeds limit (1024) in 'ipsec_fs_roce_rx_mpv_create' [-Wframe-larger-than]
     435 | static int ipsec_fs_roce_rx_mpv_create(struct mlx5_core_dev *mdev,
         |            ^
   2 warnings generated.


vim +/ipsec_fs_roce_rx_mpv_create +435 drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c

f2f0231cfe8905 Patrisious Haddad 2023-09-21  434  
f2f0231cfe8905 Patrisious Haddad 2023-09-21 @435  static int ipsec_fs_roce_rx_mpv_create(struct mlx5_core_dev *mdev,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  436  				       struct mlx5_ipsec_fs *ipsec_roce,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  437  				       struct mlx5_flow_namespace *ns,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  438  				       u32 family, u32 level, u32 prio)
f2f0231cfe8905 Patrisious Haddad 2023-09-21  439  {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  440  	struct mlx5_flow_namespace *roce_ns, *nic_ns;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  441  	struct mlx5_flow_table_attr ft_attr = {};
f2f0231cfe8905 Patrisious Haddad 2023-09-21  442  	struct mlx5_devcom_comp_dev *tmp = NULL;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  443  	struct mlx5_ipsec_rx_roce *roce;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  444  	struct mlx5_flow_table next_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  445  	struct mlx5_flow_table *ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  446  	struct mlx5_flow_group *g;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  447  	struct mlx5e_priv *peer_priv;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  448  	int ix = 0;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  449  	u32 *in;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  450  	int err;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  451  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  452  	roce = (family == AF_INET) ? &ipsec_roce->ipv4_rx :
f2f0231cfe8905 Patrisious Haddad 2023-09-21  453  				     &ipsec_roce->ipv6_rx;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  454  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  455  	if (!mlx5_devcom_for_each_peer_begin(*ipsec_roce->devcom))
f2f0231cfe8905 Patrisious Haddad 2023-09-21  456  		return -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  457  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  458  	peer_priv = mlx5_devcom_get_next_peer_data(*ipsec_roce->devcom, &tmp);
607e1df7bd47fe Patrisious Haddad 2024-08-15  459  	if (!peer_priv || !peer_priv->ipsec) {
607e1df7bd47fe Patrisious Haddad 2024-08-15  460  		mlx5_core_err(mdev, "IPsec not supported on master device\n");
f2f0231cfe8905 Patrisious Haddad 2023-09-21  461  		err = -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  462  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  463  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  464  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  465  	roce_ns = mlx5_get_flow_namespace(peer_priv->mdev, MLX5_FLOW_NAMESPACE_RDMA_RX_IPSEC);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  466  	if (!roce_ns) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  467  		err = -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  468  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  469  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  470  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  471  	nic_ns = mlx5_get_flow_namespace(peer_priv->mdev, MLX5_FLOW_NAMESPACE_KERNEL);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  472  	if (!nic_ns) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  473  		err = -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  474  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  475  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  476  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  477  	in = kvzalloc(MLX5_ST_SZ_BYTES(create_flow_group_in), GFP_KERNEL);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  478  	if (!in) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  479  		err = -ENOMEM;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  480  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  481  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  482  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  483  	ft_attr.level = (family == AF_INET) ? MLX5_IPSEC_RX_IPV4_FT_LEVEL :
f2f0231cfe8905 Patrisious Haddad 2023-09-21  484  					      MLX5_IPSEC_RX_IPV6_FT_LEVEL;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  485  	ft_attr.max_fte = 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  486  	ft = mlx5_create_flow_table(roce_ns, &ft_attr);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  487  	if (IS_ERR(ft)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  488  		err = PTR_ERR(ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  489  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx ft at rdma master err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  490  		goto free_in;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  491  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  492  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  493  	roce->ft_rdma = ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  494  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  495  	ft_attr.max_fte = 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  496  	ft_attr.prio = prio;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  497  	ft_attr.level = level + 2;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  498  	ft = mlx5_create_flow_table(nic_ns, &ft_attr);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  499  	if (IS_ERR(ft)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  500  		err = PTR_ERR(ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  501  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx ft at NIC master err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  502  		goto destroy_ft_rdma;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  503  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  504  	roce->nic_master_ft = ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  505  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  506  	MLX5_SET_CFG(in, start_flow_index, ix);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  507  	ix += 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  508  	MLX5_SET_CFG(in, end_flow_index, ix - 1);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  509  	g = mlx5_create_flow_group(roce->nic_master_ft, in);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  510  	if (IS_ERR(g)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  511  		err = PTR_ERR(g);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  512  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx group aliased err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  513  		goto destroy_nic_master_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  514  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  515  	roce->nic_master_group = g;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  516  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  517  	err = ipsec_fs_create_aliased_ft(peer_priv->mdev, mdev, roce->nic_master_ft,
82f9378c443c20 Patrisious Haddad 2023-09-21  518  					 &roce->alias_id, roce->key, false);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  519  	if (err) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  520  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx alias FT err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  521  		goto destroy_group;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  522  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  523  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  524  	next_ft.id = roce->alias_id;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  525  	ft_attr.max_fte = 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  526  	ft_attr.prio = prio;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  527  	ft_attr.level = roce->ft->level + 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  528  	ft_attr.flags = MLX5_FLOW_TABLE_UNMANAGED;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  529  	ft_attr.next_ft = &next_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  530  	ft = mlx5_create_flow_table(ns, &ft_attr);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  531  	if (IS_ERR(ft)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  532  		err = PTR_ERR(ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  533  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx ft at NIC slave err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  534  		goto destroy_alias;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  535  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  536  	roce->goto_alias_ft = ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  537  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  538  	kvfree(in);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  539  	mlx5_devcom_for_each_peer_end(*ipsec_roce->devcom);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  540  	return 0;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  541  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  542  destroy_alias:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  543  	mlx5_cmd_alias_obj_destroy(mdev, roce->alias_id,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  544  				   MLX5_GENERAL_OBJECT_TYPES_FLOW_TABLE_ALIAS);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  545  destroy_group:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  546  	mlx5_destroy_flow_group(roce->nic_master_group);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  547  destroy_nic_master_ft:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  548  	mlx5_destroy_flow_table(roce->nic_master_ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  549  destroy_ft_rdma:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  550  	mlx5_destroy_flow_table(roce->ft_rdma);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  551  free_in:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  552  	kvfree(in);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  553  release_peer:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  554  	mlx5_devcom_for_each_peer_end(*ipsec_roce->devcom);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  555  	return err;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  556  }
f2f0231cfe8905 Patrisious Haddad 2023-09-21  557  

:::::: The code at line 435 was first introduced by commit
:::::: f2f0231cfe8905af217e5bf1a08bfb8e4d3b74fb net/mlx5: Configure IPsec steering for ingress RoCEv2 MPV traffic

:::::: TO: Patrisious Haddad <phaddad@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

