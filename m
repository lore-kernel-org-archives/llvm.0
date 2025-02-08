Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1A22E009;
	Sat,  8 Feb 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032086; cv=fail; b=fSMEt6DarsKeadgrIjBKCynhSedKf9SJlpPcjhUUwtOGcUcp+YYIbX/4lzVutX/+agJfO1vS3wX1BNW5I2z2Q6q4MM2zhi0Hq8ycwbM/JcIdbt1U63SB/Rva0kxh83PPTLL91fuA9y1HZyY/8OHV1rVDvE1QUh+24cWvM8LvMlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032086; c=relaxed/simple;
	bh=wUucghh98dVL36Wprb+FzVeIgHvgisv26IUfQ5T/Wak=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=u2pLC5Bu3wy1mvfQBGE9uco/HIMn4t8M9FrIoupnDXCvPFu18Nojl6vxi0N9AvlwgzvrH/exTQnIGFlaNDxHUz4jterD+7TsjpZtoTPi5cKbcxey2FkU+YavgUdqquIW3kHUKzXGxab7ancqwnWnHs6dSeFmo/UAChM/V5yzXU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW1ANuD/; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW1ANuD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739032086; x=1770568086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUucghh98dVL36Wprb+FzVeIgHvgisv26IUfQ5T/Wak=;
  b=bW1ANuD/LHK1geV6RYArt8XDEziogmNIDE2vXmF28ysinZnAEpp8Kkcu
   hrPa2X1rIuvnax230vE3plTMliEfLWkffkxAly83pgcgEzUfYai/pMUEW
   9yFEUyj/zlJ5x1P9SjKAlw+NbitvRlHIV8a8l82eNj1Bi8114THFzAUzG
   2myaVnJJqqeSikREqp/GORuphH7vJNf3TXYYo5RERDcP3lefIq01Q0Tmb
   AD0LGzibpnHpZXmj3OnMMeVGOysnLXt1JLWNEliAvZRNllX7VNmFfykPb
   SeUAmApxxrGAC99sISRHr/yG1/WsHhAzW1mA2fghobUWcqRUDmy11Kd7H
   Q==;
X-CSE-ConnectionGUID: dUGUgRmETPyWmmYNAn6aDw==
X-CSE-MsgGUID: FPfZe1K8Rrux1LRZu2/QKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51048676"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="51048676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:28:05 -0800
X-CSE-ConnectionGUID: lC01EAhVRAKyNWTsC0nEXQ==
X-CSE-MsgGUID: Rrf/QhAxS+eE0A8WPPaELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135033284"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Feb 2025 08:28:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 8 Feb 2025 08:28:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 8 Feb 2025 08:28:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 8 Feb 2025 08:28:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFi7cdG3AiIZ94Ih5JcVp4x26ehSI0hFMV4w6y+F9G9QMAiPyAxtY2ZpRT/kYn98XOkJo0cH72dYOEjXxE7eh1bDn+P6MlHVlJ4rWnyOFaDJh9QJ0yCmu53Dee+2G897J/Nl0B+oFqjLK+VHy7lFSb2qSX/ymFcwq5kXlIScxURGRKedQGWcG2GYGwLaZij9IGkTrWRYNR6k+D8YZIG7ARvGHYOAhl00Q6vMppoA7k5LY3G+8bBC95AydNgmOfqNNssSX4k/5rfE8I5D7hKj+VJXrW9nZDNO3IjdITSRPLbIMERhzj0DGapoymhlMXDgtYNL8hgs1x5FHdnIrTGXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0MZ+7ZuYG5LxZQRvfDTDL7AJG53vfz+TK88RWpR0Rc=;
 b=HmfcsDMCzwIHg/iciW3rxDMS77HNOhBq7UTccM8clUgj8nmYVjQnHdUPSXeOxGzTp0MQnJqmy7634IyZBzF5L7A2TgjyBD3s2I98xOKWhfSZsPz11YWXnyCyrwN8dVvlHuDAwCYbmPxCiVX4+bl6nOG4By607x2gKtpT1ttY9ZUouKN6FKNdzf9CP4j9vrBsuguL70RxPVP4IC7hxAgDf7liBLd0tabkLvf7d5goLSB7CLnaX/1DZLknxNqvK3SfxIy7eja7zK9w4sCmUWN7ikilNYSa3YVyUmS61//eXlbHBhW6wi0TcMeoOfJMtdJCg2zW6vn9narx3QKkPloyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 16:27:55 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 16:27:55 +0000
Date: Sun, 9 Feb 2025 00:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [bvanassche:thread-safety 36/36]
 drivers/fpga/tests/fpga-bridge-test.c:89:2: warning: releasing mutex
 'ctx->bridge->mutex' that was not held
Message-ID: <Z6eGA3fcam9bFDJu@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bae1393-82ff-47ab-6997-08dd485d8adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wmJpzDZzSEMINr1bpZ+vmlT9HEe/eDMzytgN1UHMIP9ziea8RWZurMTzAxd6?=
 =?us-ascii?Q?kMNCfp80NBYVFd5X4hOZLgYhjdA3eQnlOOkHM3lj9CO6gx7CUab/liuLOOH5?=
 =?us-ascii?Q?IZbp+N1qMZ2sSVIOeNVFVllVfrrTyloNsF/tksXLSn+kxeAo4BDYPIj7fwYp?=
 =?us-ascii?Q?WJcs4XlhESpwMjrP6DN/Mi5xNoNm5E5iz+VTd1lmY+jymsUVK7cJGQlGUvfw?=
 =?us-ascii?Q?7KNM5rJXSrxBdXApEvSEsYd7/JqAQZ+aO0WzpHtEg7Kp6fWWHHem+VtLzwNC?=
 =?us-ascii?Q?LkLfPdz8oDW2HejSjpznu6ff1PvIAWSHBhy0TEKW+G9AoKVPwc+4iuVZYxs4?=
 =?us-ascii?Q?8Uqs9RZI2HLZyKKZkkzaRGmAn77r8g6szMocx7Rl2qmh6/5vmqCfPYTwHtAu?=
 =?us-ascii?Q?CBqI4397+/RkK6OFmhv3gGHGzM4V2xZlDoFRxi/vCQv9az+JIE1h48zHuyPI?=
 =?us-ascii?Q?KJ1m+MrOqIlH7l2LedmBsmfKstJjSj1F0pUo9F61wOeRJrdmnb1X97Bmxvue?=
 =?us-ascii?Q?eQ5ZUg70X01ond/8G4Guv8w+br5uah5WZJEURKlwwARBmFgyWiiJApgFZlK2?=
 =?us-ascii?Q?4IkiHs6xQgJDBAM2tFTWZ20qgoygdtl94lsdebLLCnvvtp/6knO7wxORnBZB?=
 =?us-ascii?Q?YK7hprMFWWMmZRL5eADbXzRg6RBCxDUlyaBDkpFf3MfF2joXdK0achp3hJdQ?=
 =?us-ascii?Q?5sZldH4lGy02x4AIKGFMInhX+0mdH7s++SLafScNcxJoVLrutM3RYMpSuSfY?=
 =?us-ascii?Q?uVe1oS368nU3lpy/Pb7M8CqJjkAdCs83pr0B+UrEmJtaNcIl86qXiu3AK/UA?=
 =?us-ascii?Q?8lCKpoaqdhYojX+8JxlZ1LhXQRUcMySx/8oV+ZIS9RzLx+smzJyl9QvwA+I5?=
 =?us-ascii?Q?TUkKobb2f691tfn6Gk+67riL3Sh2HW/lZC2WZHlOejnYqnwcHvpCpvV4rAHn?=
 =?us-ascii?Q?R1g8r9TWFclPnDfYXuzV1sg4hak9jOcAq+Wew2OKanj4K2Gfzsng8Tlbbvr5?=
 =?us-ascii?Q?SG3JoWwVEwlyRWPGmxpbPgH9r2i33WJ3gb5bT4CneiGR4IOXZfVJiVZSWmeq?=
 =?us-ascii?Q?g57XJSDr/sF6pZxmBjfp0Li2h5tAdDn/dP8plwizWwewAEsEuZ1GGZLvZw6P?=
 =?us-ascii?Q?UW/OjHpQlH8ydta4EsB2ruPnsl2p0IkW7rSlt4MHtVbuuU0KYp1rGA6+dJ5q?=
 =?us-ascii?Q?0uZqABX+reBDj22Rdx9Dd/H5WpL4Ohj0FRPLRPt0lDqVsAvfdKeP/6TjG1Pp?=
 =?us-ascii?Q?syUKeybryaPi03cT00RvawhQUkHv5uZ5wJn1dJ3n9fwStIdrrcdZjpEmusAB?=
 =?us-ascii?Q?oh5dkIOayS8Rwi6i/sluiLtDPCGg65P17+JEyuvdSgkwDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZeqRRjgyxbzBTnirS5Ozffx+DZoIeILEDONYqdXICAQtTQdDdX6F7CDFExY?=
 =?us-ascii?Q?MRApkcbsCC18ADFFOGij02D8HkogEomqxFVn2w2iEb4wRZpsOa3fkjCyhxM9?=
 =?us-ascii?Q?tR7dj+hE9jbs5gZfDyOne48RzUGYry4wxU/WzUsYR0IUiDmLinJwfewXme/J?=
 =?us-ascii?Q?9uyBV0Tu3W5DedhHLa8QQ3J6lNDKqnH8wtK85lDNewV+X8BmG5qcKRU1BKHk?=
 =?us-ascii?Q?G6q+u+PHaPfxARpQn7WFEG/TBSH0wESt4BJ8vjNTMDSfY0OEH6kgGUp1LtX0?=
 =?us-ascii?Q?ftXtOBf2Kl8rIdUP9b8Y7LlJ3aRO0IHY/DATN4PcUbOyag0LoR2KbHwIxJRo?=
 =?us-ascii?Q?+O9UFuloOXbNfteb1QJ3jY+9Kxb7oov96CDSt7hxaoPuUmMC2VNrq5tggCZ+?=
 =?us-ascii?Q?ZhCAVAtnjOl5JmbVk/q4+xzaTW2rtdzGdbaKvJLDHT6xn8nT5wQaLpAD2Vpg?=
 =?us-ascii?Q?5drVMv6HJb+7lQJclv31z/O4rCflpBmnb8IQZKvC9fQ/3QgwxhmPzuSGkiFN?=
 =?us-ascii?Q?Rknpj+hT2eBeejJX398xmF23lEpv6Q59MWyadIReVDvVpq5ZDlF3T+ksCQKp?=
 =?us-ascii?Q?9lS8WJVcgGmJYt5uh6JCPmGLfGHWKfave231FSgPklcX5707b1EEib1aJLLd?=
 =?us-ascii?Q?b0TJuTy1OOu0m2luezEPATtb+fStsCBePdy12hjOuDYBHgxYXXRidUyyuw2a?=
 =?us-ascii?Q?qmiI6ZQG568piAHwrmbYbMZQEdSmzwh1jCu/GWpKMEKuscQjomZA8ftBsENI?=
 =?us-ascii?Q?27EZtVuNCKCwwnzIWc50lFx9wOBltkennPNv+K/zMsYb7skrK2mHU6x00cwi?=
 =?us-ascii?Q?OXR8kU6e4w+8x/b71Wy0CCuMkJzjzr1uUrMjHBu+SrWATV3vnN+NtLm5Bdft?=
 =?us-ascii?Q?wC6QtGRjK8igzDaYmVo/tMua+IBoaoXZ+uYTtYGfTTKplWuQa6HbEGhiHuZA?=
 =?us-ascii?Q?uZoOZC8YySJzLjUfwcuipLC8KOvllTZdyVxyQIk11xceQEqeKpE2heVY5c9u?=
 =?us-ascii?Q?QhWADw3/T1YSdKuj3/fu4+m5sBGJV9dpzeRVqP4iSpvIHgBizV5jS/Sx07du?=
 =?us-ascii?Q?+wi0eu66lgV9pqEMx/H+kcZmJgLnCMPxnNuO2crW+To2CDpaxYIH5FQJ7BrN?=
 =?us-ascii?Q?79IlRi8X1S5de1QWnAaOpsfQbn3vtUgWf7EYQIRs6sKV95+QTPCm8XA4yVdZ?=
 =?us-ascii?Q?35dtLoYP2KWsd3KE5G2V8/oaOzOfzVh5jkoodYo7sBqGQpRnWmWPpeqkomGX?=
 =?us-ascii?Q?mXA7TD7O16LrVqoC9x3au5Aukip9Xc92AOix5i2+oApyfIGEW7w1VS5Vtztg?=
 =?us-ascii?Q?og0s2xF5A3/kH+oUXlCYq2RSabfDPFtp6CSQsHE2fDwgQrimjitYIxDJ3f29?=
 =?us-ascii?Q?/Hf0FrIWwoU420dQGq6DvYp8h+mwH6umOYEFLV7CcbMW2csYPbOgHWiNx/R6?=
 =?us-ascii?Q?uurbxxwCpWmjIa0QUZCOz2L3Mjfkvh0xw55/tCAxAJD20KdoZF+iu+YGkr8d?=
 =?us-ascii?Q?qkEBYPbZ258StmGnCCRTEb2eJYBp2uVz4ibdENXUD24EwQpqRlg80H66KJZt?=
 =?us-ascii?Q?E9+fo9RpSxVakD5kt+Bf7D9UAgvwi4ccO0AKDMfRmOsxahkf26V1I44yxe9l?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bae1393-82ff-47ab-6997-08dd485d8adb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 16:27:55.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kJ0pbyg5fKeL/PceYBDQ+uMVstsKq+E2VVC/sMIynbzqS4ob+iU19ECITqYgApOS0Pr+BSkUOiKAzUT54fXEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
X-OriginatorOrg: intel.com

tree:   https://github.com/bvanassche/linux thread-safety
head:   ce14c650535d31959070629f347cb214f6e51d3d
commit: ce14c650535d31959070629f347cb214f6e51d3d [36/36] scripts/Makefile.clang: Unconditionally enable thread-safety checking
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: hexagon-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071055.yME9ASTo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project ee3bccab34f57387bdf33853cdd5f214fef349a2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071055.yME9ASTo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502071055.yME9ASTo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/tests/fpga-bridge-test.c:89:2: warning: releasing mutex 'ctx->bridge->mutex' that was not held [-Wthread-safety-analysis]
      89 |         fpga_bridge_put(ctx->bridge);
         |         ^
   1 warning generated.
--
>> drivers/fpga/tests/fpga-mgr-test.c:224:2: warning: releasing mutex 'ctx->mgr->ref_mutex' that was not held [-Wthread-safety-analysis]
     224 |         fpga_mgr_unlock(ctx->mgr);
         |         ^
   1 warning generated.


vim +89 drivers/fpga/tests/fpga-bridge-test.c

9e6823481e5f6f Marco Pagani 2023-07-18  77  
9e6823481e5f6f Marco Pagani 2023-07-18  78  static void fpga_bridge_test_get(struct kunit *test)
9e6823481e5f6f Marco Pagani 2023-07-18  79  {
9e6823481e5f6f Marco Pagani 2023-07-18  80  	struct bridge_ctx *ctx = test->priv;
9e6823481e5f6f Marco Pagani 2023-07-18  81  	struct fpga_bridge *bridge;
9e6823481e5f6f Marco Pagani 2023-07-18  82  
4d2bc3f7dea4d1 Marco Pagani 2024-03-29  83  	bridge = fpga_bridge_get(ctx->dev, NULL);
9e6823481e5f6f Marco Pagani 2023-07-18  84  	KUNIT_EXPECT_PTR_EQ(test, bridge, ctx->bridge);
9e6823481e5f6f Marco Pagani 2023-07-18  85  
4d2bc3f7dea4d1 Marco Pagani 2024-03-29  86  	bridge = fpga_bridge_get(ctx->dev, NULL);
9e6823481e5f6f Marco Pagani 2023-07-18  87  	KUNIT_EXPECT_EQ(test, PTR_ERR(bridge), -EBUSY);
9e6823481e5f6f Marco Pagani 2023-07-18  88  
9e6823481e5f6f Marco Pagani 2023-07-18 @89  	fpga_bridge_put(ctx->bridge);
9e6823481e5f6f Marco Pagani 2023-07-18  90  }
9e6823481e5f6f Marco Pagani 2023-07-18  91  

:::::: The code at line 89 was first introduced by commit
:::::: 9e6823481e5f6f2d4f4b43b6f3b00ace21b83f25 fpga: add an initial KUnit suite for the FPGA Bridge

:::::: TO: Marco Pagani <marpagan@redhat.com>
:::::: CC: Xu Yilun <yilun.xu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

