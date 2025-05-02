Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7485B235066;
	Fri,  2 May 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179802; cv=fail; b=Ih1q0M9EaGH/1po+IHHMAfDb4YaE7hHohRFuKYdNpP/sb0Eph9UdWk6aa4PassgDDtS7ocGDxEJr4u1E+FLV9YohVT2ss8cez8+AzCllTYT8MHx//asnPcwdyAOkqo7rNuoKyHdy3mdAccHswsPPaIdmNDHhp8zyWgoLvxEMtmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179802; c=relaxed/simple;
	bh=Uvmb2HV9Ztim0PKC2Kiavthn+Yz+Y4MDysyAwld7h+w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tBkC4BFBSMLHRn9k2zeX16jcwaGGCriioulfHlBYdzXNC4eiGQfK4a9ediJ8zDqSsVmXnl3rJFCGFVwD7f+aicRQ8JnZdxFb6qnOud8cpPrYDX4MxzU9BsAVqZuT2cnP0Lj+tAewLNcxF8g7BmYavqAHP9eG6vBl+zlB7kJahAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PndnnP6L; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PndnnP6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746179801; x=1777715801;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=Uvmb2HV9Ztim0PKC2Kiavthn+Yz+Y4MDysyAwld7h+w=;
  b=PndnnP6L1Yr0bT0JGgi4bQkVikxw8WCaUIyRSGkMMEJnhwrL9zlsBLnR
   DpCyKeC1g7SHsDhKownPftA2+LGKtaQvId8lcUZ/cen0F80IL+KiKjQff
   Vk4oIQXAYdIqYv14N29hTx5eoZr7K46YGfAythQqsAafAOGY9oTQetpLe
   Dh0/K+D6XJQytVKmkcpqw68Xy5dCPNV68nzsB/p+V+MrATCcL0jxV/Fdf
   m0E/3OHEZgZ9lqzX2cmB9itUfjBquegOF55FymPUzpRAOnQy2dGLIhVY1
   7D7omZihwE/0aqrYGw4EMKrmvmbzVmyiFkX/8nX4dJTB0u5oAMOp42ITh
   w==;
X-CSE-ConnectionGUID: YE1HcoITTc6KbeQfdLEEaA==
X-CSE-MsgGUID: h4tjpbLGTXe6xwWj4r7BkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51672676"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51672676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:56:34 -0700
X-CSE-ConnectionGUID: vlPClkaHTYy4+GQbztk+YA==
X-CSE-MsgGUID: PO2V0gUnRI+17Cz/+mDMjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134560798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:56:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 02:56:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 02:56:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 02:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU+wr2m0JfA2CmNimYAkHMe2pD8u+x5oEh8xadVLnYFWZs5j1RL1ebhU4sRij4Soj2FzlWGKvhI7x4GiwdP4rwBPimda6XaicBJk5/EC2WeoTcXNlfZTRQJ2ph3L0bhb5/8/4Dth8M/tYJAUTKhyv8N9Ee2RgoDeXDs8e/zQK1VvEtiMEe6bcTrzB0WZ1rFj13/IHQnYzIV789QivsclYLq4xy+p8kHtKgKtbhhmhzNDITbFLmf87Baoxs2fZ0Zhl5euuE7HxlK7wun5eoFzocU1hoE91iTWEUghXcBnSDH+gETEmxbUQo4M2X27YUh5xMEVjsRJZkZPmvakGNDywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/thz23HGcAbvM+p44cCKy7Ba+yeflyujkHs3lbp9lU=;
 b=nPhrx2MPQeWugm+z9Nh3btzzf6LBEWI+dMPB928vhPozYji1fZrTgV4V30EFp7f3A9EUNzhVLuUJTkMiktQw4LNBFnWMr9rN3GOXZx8Btgq7TPTFtuyQ0DjijXcDcRtNgOl9/5Cj9DjhcWji52YwgH1GkikOegSbWG4eUF39uc2zHPU9BsRT1yo3wqZhQJNd/qymKBiC+5EPB8BgO77T9bEVsBk4pdVwC57oX8QMSZ7julMyMbfuZL0zT3OicXf9OCDh8mgxsxHKPkexDrikL0R5cntKTnt06/ydUl5gxQDy2Wt5GbB/s1W7x+HH+h1pfZv5TCjKq/A3sqjo6xiTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 09:56:26 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 09:56:26 +0000
Date: Fri, 2 May 2025 17:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce
 CONFIG_NO_AUTO_INLINE
Message-ID: <aBSWwzjCtNsM1RKU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a688300-b1aa-4fbc-7a6d-08dd895f9a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G1nRT6mCI04wtYeUCUQvMziCou0T4nD9f581zWQiGlkIqegRghjK9muqdOlx?=
 =?us-ascii?Q?bjH9eLiVUxFc3Z+dqFt6VJ2QTNKzjR+ARzNANO4XPrrIm8zVPtmXTh+1rB4a?=
 =?us-ascii?Q?aRrSLzruKa85md4bb3VbVE551UWhXVxxXXbqH2CAXR3mOTWNaK20REaEKBMr?=
 =?us-ascii?Q?aPyMdQIgfoHrqfyi9YpHYzsi5Fu1w+B1t2YIotDfwaK1nzMUqdJBNrCCMNOx?=
 =?us-ascii?Q?K1QV8/D1uR6Rzix4y2/9AtlVMe9bEnCDLLbILg5ceuR/9dHLfQWe8sryCdiJ?=
 =?us-ascii?Q?KINRQqFWD/ZEue9DzjdtilYGPhTy0r04iaZVEhd9dcUFHH0tl5rHCJab2bCK?=
 =?us-ascii?Q?F5EpfU9hNf/l+oSPuTJGOTcydtZFxJqCKxYA04UE22+9A7XeZL+deXV3IAyu?=
 =?us-ascii?Q?3rkEVzPpA8f4rKj73HnzCcr/elrpvSZFURyLE0HJqrUm//7OWqc0n8zZUoYa?=
 =?us-ascii?Q?uf8TRukafjrenxqFo00e8UOBSqpYqBftGcpgsgMGi8tT7CCIGb3+bkL8G2uc?=
 =?us-ascii?Q?23cIoBDVil1TgS/vPL1NNuD4LXt4zH7Z5nlnidfnoXP8B2mKFXFqyCJjtqud?=
 =?us-ascii?Q?7eb29TceHSSbd5Q/zAuXjV/YFQnFL35ceq/BOMSDiNXSmse4f1uq4wqW5CdB?=
 =?us-ascii?Q?puYN3zLeuQ35Q0+wGzsxp1vqcrjUAKp5iDQhF05IlZyhDkGKHLgAdqUaK01V?=
 =?us-ascii?Q?Ss0z3GxFr11FAGyvBUJibO56piLUIiftjxwT1qhHL/5O404u0f/LEdg7dRzu?=
 =?us-ascii?Q?1lX5q27PjxsS9CKFK9wrnUGYPEqJGXxvAewrgsz+Od7HC0WsG8H/9nnRGJbO?=
 =?us-ascii?Q?ov18efAkmPDmcMO1cNfVZpUdmc7VD+gMp6oPEbTFJocbdjfDYkePMmp/Ofg1?=
 =?us-ascii?Q?YQoq889E1tvr9z7XbRazUvFkXFCUczsSD/8c0/zdhgSwc5DvA0SwEnG4KdU3?=
 =?us-ascii?Q?t2jL2PZd3ZheK5h8mvEPlDEGNwlV7pI5utq0yksXwNErXhAbAlTfJ/PpygKT?=
 =?us-ascii?Q?9sYPrNFfsjLwQM1CZDQn6slNpoPJ7MKin3bYLhxAc3luZs/1Xje4498DitOY?=
 =?us-ascii?Q?AwKLCj+6BDqBzkXgJg2qMs0izrg5OXxOIyG9bY8i7rGGaibcC713Z+tfoGZh?=
 =?us-ascii?Q?Qo+dXneZutsKY0aKIUgq68+57W/Tjg1ECj9kCzKC3ky1wOhfJxN9IWrv6hV4?=
 =?us-ascii?Q?3mMOy7TbH78oAxFSGaqROecKehSHz4cE0eZHdC0ochdzQ/k+mvVuPyFToUhq?=
 =?us-ascii?Q?yiUaiQRUSdp67dOvU0pZCKkuME7lxRfUO90xggg+JVjUTZHg1hEEEg1YJIyO?=
 =?us-ascii?Q?RpPSFGmeIij87YaKgtzHUJ48A0WHsCnMSmDwzAy4pi0V3HFyQbTL/ZRAA2hX?=
 =?us-ascii?Q?lLiEHaeczC84KeoeDRcEVzdakp/m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mc76kOxxKtRIBlj6EjKFTPqA0KORvy3uXsycYTtu0KRIfcmKAVAKQCQEbyjl?=
 =?us-ascii?Q?WqHjbuZrkir/lEMREOkKXGyZ3ReShxpsCgl1lu/hiSDF7btH4XUhHCNBDlnx?=
 =?us-ascii?Q?ibT43fzyeIe4O06Bl9BLs/x+zw0reTV7Q4tH9ZDMDTDisfuEHB51qk6/DUSq?=
 =?us-ascii?Q?KbVqM5LyF4+z5YUzSeGE1Kcaz8diEG6D8Swx8XCY4b1fR9HeMmNrkYCAAyxv?=
 =?us-ascii?Q?oN+F0JgjmwAIIMRxRzD6tld5v3Vn8+35zHlxFWMevbkKjR9ouctNqRXYc+Ri?=
 =?us-ascii?Q?MNbspgYLEb+9ZroGVRRdtMsX+GPIH4xCLEGrClLFCVFEX1lO7lyENtJhkO12?=
 =?us-ascii?Q?8aNkBHiUoBF+0BN9B6lxf3sKWVYayNcOtUbeHI8JfYt3/Ax9q6GZZ/U47X+6?=
 =?us-ascii?Q?SGJ6DXFTGi1mG0aP1uJV6uhzzOc0eG5u4jIlYnop0KBNd6VdbHAGbsAFuZfA?=
 =?us-ascii?Q?xLuOae1gVMs7f4Z8L22qgHAXTDK+B4uac0KZLnPftCxWyIkaOsZ4Xy4W5QJG?=
 =?us-ascii?Q?ku5Nqh/UI57nkzv9TMg05cZm1jbzktpcw4r2/ESrQk8bDcd0fV/NalUM/GFN?=
 =?us-ascii?Q?xd7bRiLdTvAwBMB/OBT4d8beQXcUJdLKA0bUk4iJrSCd4VnGz8F57IeEpp3A?=
 =?us-ascii?Q?6nnZaWp9x/4Ht4QTO8u9h+EvgRvaraX5lff0O3KC9JN8s/0QEsW1dgD/kK+q?=
 =?us-ascii?Q?Ny9ggNo3+F3kYEP0KXQLFfVciVEF8N2PYiYtwAtBo6+tQPuOs7MCo3V7HgwQ?=
 =?us-ascii?Q?du5+KOIrsoLTVNDZB92KpctWmWU78VTvEWTW1GfWrg9nuL3ZW0XJTn31atYF?=
 =?us-ascii?Q?U6gxCTBlm5gxItlEJOokN7JT1jFNiLdjiV1GX7EJlXG2+ibgwtRwIxhSVV8B?=
 =?us-ascii?Q?Q2LYh9z4iiX4Ovl3P1T9DKNcA254hHY9HhII4QT22kF+v8fDR8PG3zwgiD03?=
 =?us-ascii?Q?1WxOexKXJMeJb1V51nTegGZBTvTlt/kEpf8cLnPqDMtHnpa/re5/lyI8IXUV?=
 =?us-ascii?Q?3s5UEePCEHKmDD64eE7Vhbr8Kej7mGMhqGU4rZiuPt5q8oCGUujsw9inbcAt?=
 =?us-ascii?Q?B8Px0+VrLW80CUJzGMtJxTudbm0afU4/4yygkC2aTEJo+ML1DsKmoRMa+DLL?=
 =?us-ascii?Q?DJZMzxKbXnwicfKDkhL7XWsangBgqO8WqjQLHg3WU7jccYs28PC3c6JpIewL?=
 =?us-ascii?Q?5kVKBjoQGycF/PCW4QeFjIwtiVc2do8wKLtwYk6HwNolemmQvRzDM5iF04vX?=
 =?us-ascii?Q?3L9G2BlHiCORmCNtllygwaB/AbWBH5MYyLc4yB5S7h27eXLwPViXb0AbflU+?=
 =?us-ascii?Q?I8Nm6Y+hhgunHlrrCX9LVbQ5gnun2X+mptSdRo3UJqBQxaBRM9rHApJDzAbK?=
 =?us-ascii?Q?4jdp1UHE5BT397HDMGmRGcm+e1mMEV82RQ0BVyvBK3V06oyx1eMBFi9cfJ0s?=
 =?us-ascii?Q?fMiMkVaHabjkuH1Hzrr3wZEFc192Urubhuvk8HMO9xMynvX0nomV+BuyvGbP?=
 =?us-ascii?Q?OxSzE2lk9uCFL7qdN8ZGgBXoLUlteBZbpn9vT/VRp1QHNh3mnMXlkRJiHVyo?=
 =?us-ascii?Q?9RNZx4ZW/BqjZ0YAh6uBSrACMh3gXl4CrO9unAqi/0tjKk776w3AiBUqU2Ay?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a688300-b1aa-4fbc-7a6d-08dd895f9a19
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 09:56:25.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l59rRYdS3SM2o/Hsqw2dnKZ6BuWuw8qvIKUyXISRDhD6bxNdPzzeE0XSSy/ZXpWe4VE2jMdXi7n4KwRE1oXQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
X-OriginatorOrg: intel.com

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ca91b9500108d4cf083a635c2e11c884d5dd20ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Linxuan-via-B4-Relay/nvme-add-__always_inline-for-nvme_pci_npages_prp/20250429-120709
base:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
patch link:    https://lore.kernel.org/r/20250429-noautoinline-v3-8-4c49f28ea5b5%40uniontech.com
patch subject: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250502/202505020833.Q2TEFWfx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020833.Q2TEFWfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505020833.Q2TEFWfx-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x0 (section: .text) -> memblock_end_of_DRAM (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x4 (section: .text) -> memblock_end_of_DRAM (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

