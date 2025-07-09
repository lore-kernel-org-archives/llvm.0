Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6A11185;
	Wed,  9 Jul 2025 01:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023796; cv=fail; b=UTZXSm3WwkeXhQIgb9MaVi6RVbFGfR4NSEl9WnQCobi4kk2F70yCyuKKcw9gyJvHVYA779Kfni8TRtowcx8/jeKquLU5se5sm7Xpdv7Gk3+echsqNnlRDHR/1Sbq4LE4gaoMB7b9BerwOUfWjvLq/3zFDs6kobQQn12QQNWK9Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023796; c=relaxed/simple;
	bh=+0BUuhDucaNi9NHHnI65WQ6eDc/u9/MdNFZXOGJ8Tc0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ifek4NZPs867TtQBNCKxN2HviwTKjFhk8uzsZ0tc/sbAJ2knuBilYfqc/vb9ZouytPaJPoCqV2qpDdNuiQUVP1UXERdoZiWgo/pfJMlUR/RjBUJr9/AHBcMcnXYHaAD9gUiUP18Zn92/cj6OpPGlO6eWBj7qYnO4OT7IG+uRLYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQoqTShZ; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQoqTShZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752023794; x=1783559794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0BUuhDucaNi9NHHnI65WQ6eDc/u9/MdNFZXOGJ8Tc0=;
  b=hQoqTShZvl7rz9bSdPp4x186OIVDfP+Bk2haQy4oMCBcp8yb2Xo/IB0P
   z/63wuyfz9DjW3W+ReISyZQSoxjLM7UTV/M5MNhCTTB7YFj6TNAF075Fm
   34YTjOe5ru0B4nPe87J344i5s2l8EOg7YHoz0Ol/j/GjRxYgmB5xhDtO4
   zdNKgOtd0VeDGo7Qdfjw08tVPlfTy5J84Lf3vxvbq/Q3yBLrXClOutBGS
   15ve8e3clV6XJu5GNFkWEvJaWRiV6rgq+T9wjrpUQAFv8RycLC0ZbCoWs
   QIzhn2LLMJz0uAnNgXyDCqN2/juK3dVc1uevmIKTAls3X7khX8uezP9rE
   w==;
X-CSE-ConnectionGUID: lbbr7LgjQbW9eewsNNEPxw==
X-CSE-MsgGUID: jhIKjRguSg+42klPhKTRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53385820"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="53385820"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:16:33 -0700
X-CSE-ConnectionGUID: /GPO8jqeTG+hyZJKAXSdZw==
X-CSE-MsgGUID: e3stY1PhQKGsCcOto30t0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="155966807"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:16:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:16:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:16:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSsDjGVpn/SgBYG+5tdpdOn2qOuLtsOIB4pOZKN7AFhI1x5GnUSsMfv/48QI5c9o6Em2+k5sNWQXVsR2dKyqxhF4PNxOTscHiSKClzzcKAY8lCP6D+n5nDZg1sulCyhE1d07vDJoDDZqHq8HdWFF492nBRuCnWeGz6kRwUQWWw+kZ7e3zIhgYRlW6yQ2wA12Za1s9rfKomxWrAtU54u26dxpyKPiElEuPjsfrj0F8HG2Rg9Kf8+26MJCuSGQ56vEa/KT9K5Cy2yYH2Bb/ZHbW50FhB3Ybh8jroxpOvHZGxQQUqT/Gsfrz39RueARQNrls53TRXY1+efZuZEnjaQhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTy34oJ1kKtVY2ghUYeD0P5wg3oSQDHgQoh6Wx5XQbk=;
 b=n7PAlqoZY1I/GLF/p+3ocx5Vwgm2uypJfVvUjcfChByZVsvcFENfwXlvxb77UJYKCnLvKPD50aAec1cJQz+gphUyioXM2/gygG+Wm4BQuerw6jK+BUVhJxOCEZGaySRzzp+xL6JxCrc8seRqxniuYUaxpm3ZjGZsIfdtZxpTmh1iIvquIXHgmAqjxQrIAhvkv9k3RYZESysoRhZN2TgkDkAm8I6fJzlmcv7o0a1OVaZiKh1D9pTpI52ooXA9Bwjhs4bweCuLwTT0Nuojzz4VvxKdEb0LSnDTuPq77M8EjKEaf2EDE1AEYWnDiajlcyIdGqC9wajfeU/Nhjamatmttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 01:16:28 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:16:27 +0000
Date: Wed, 9 Jul 2025 09:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [jlayton:nfsd-fadvise 10/10] fs/nfsd/vfs.c:1277:2: warning:
 unannotated fall-through between switch labels
Message-ID: <aG3C5HV8zV5Ydp22@rli9-mobl>
Content-Type: multipart/mixed; boundary="N/nV+FxCxf7pfhwV"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7189149c-5a7f-4dc2-b873-08ddbe863a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YKfciU2isVAdbSjr/2yykhiRDv83X2ZNi/hhzLDpiTtGIjdRypAMG5dsKoMr?=
 =?us-ascii?Q?oyDA9NAAScAumFtPleZBhOyojlJwat8dY9ZPbu0Gojud4eC2SNWn5ZnHC+T4?=
 =?us-ascii?Q?4uLKPwUrV9WHj5TwdrNTPgft3Ar2UD46rHmGNQIigQvA/+/4FEAc2JQAiqJ8?=
 =?us-ascii?Q?2U+htx8lzxKEtzVJFhDziqqqsnhd3Mx+KqJcrghSe8gESb/02gOZ6ire2sdF?=
 =?us-ascii?Q?8pTqHsFEny7JWz+vDIv4c2IOlZe/DFqNS+OPnvao46Zo6mnvXC0y5aQHhHHK?=
 =?us-ascii?Q?UbTxi56AMQ5EN173pISBx0hi1JowgZ2uBSPR0Y9wkZPoA9gVR4jy0hz2L4pc?=
 =?us-ascii?Q?oE/sXZaZC76/eA69jAPvGP4AGFIMen8f6dPl4W0N4QO9dL7Z/87TPtDimiu/?=
 =?us-ascii?Q?34z9/IWt9k1/E08DmNCK34ZDohgoOwlAIQCH8fptQvTKf+kQdW0X4wdgUWMO?=
 =?us-ascii?Q?IHV3WZslFPu/M6Fkm7dxp9NVqM6U1/DjMj9sae4Bn6untNmhyh7OZBnQ4yRQ?=
 =?us-ascii?Q?ix4x83ksOcLZ2Dg+NJXZHwKI/5w/Kzvvxu+0jXgn+hxfU116NaK/u1WGfZuo?=
 =?us-ascii?Q?gJFEE8o5oykHrtl8phdB+2G4Opm+PtqiQtmH50cyQXtzZ1dUdEcF6aXzsTrJ?=
 =?us-ascii?Q?nk+jhD71+WXpPRf6ktDniBHmpX1dy7x0eIB1V0Q1/HQqek0m9Mpama+iwwjF?=
 =?us-ascii?Q?Wsrinx72NiK2xCKjPuzvQgkL72trhOqovT6VCa4qqrrdDSXc0+Luu54NGEqw?=
 =?us-ascii?Q?KoWACTfaDGc2Y4IjH7D3VnZyZyWqvksyOMzt8YoxMmUDj5FYK8AoSN7oLV+m?=
 =?us-ascii?Q?2N77xGA6Ja3AI9qBdBG3Vf5AbrGgHnoWx9JyPa+Jn98mpmY7eppw4k5QBOdQ?=
 =?us-ascii?Q?hG4kUoMJ7u/GGGcmKvs3xMC7BsGOfpoxdCVz2H4jqY9Nhsgaq/+bMcJk8Rv0?=
 =?us-ascii?Q?9QtNnfXSByGnIFxomxZMNcC3FprDWsx2WadUIakRRBKMdT4KKDIZDmj0Og/n?=
 =?us-ascii?Q?p/iaV+WhqeM8ZHg2wopbL/9codlKKra0lJ3kXlu6ghaQLtPGhXq00vPFlnva?=
 =?us-ascii?Q?RcZ8u3Y32O/5QQHLqQ3Y3I5+mOcUUbNQWjAHIrGBfV8TXNubz9m4HGRhDWKX?=
 =?us-ascii?Q?IMF8p5HLxmqcBge889b/hwkOxPQrxp0QoEoUFkonLA8QjWWA+gQPegnEHu5m?=
 =?us-ascii?Q?vEzy+MgDiax9H+ycg48BPYK+QKtxd6kLyzWw6RuwZUHNMM1z6Tuh9HZOEagA?=
 =?us-ascii?Q?mOtLFEWHOM/CCQSADW0KQVC0fncB5OX5gtAY1pwGxgbQmVrcce0o+cR+CEWP?=
 =?us-ascii?Q?3UAHzBIb6/PFVS+s2fBqUYi8/Y9L75R52BJrXXLl9VnEKIfhy5XEYyei2lFN?=
 =?us-ascii?Q?uqKbMy04eGkKbSXjArB64Nadb+Wd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lrnYj5lpFsXC8aOr2TXOY6GCbmcV4qLp2YqVwLuYMtd83FGyhH4uSIDBk2YA?=
 =?us-ascii?Q?YbqsOjylyT3UPMehvENH0IDsaMo9oMxeq6txoSmE+mhIkN3pzapXNsSGn0pU?=
 =?us-ascii?Q?DSW4PcHmH2aY8UL1UCFeCFeYiORenyRbZBzS5Q1OM0FE49beLm75yPs6CDQf?=
 =?us-ascii?Q?NC1MPwKAOZGc1Akj0UYj/sXX+Y6uaCGIsF118WTePTTZhGHO+2+PV0O8eM24?=
 =?us-ascii?Q?LsokxHs/TihyIT5S0LLZSw5uBv5GyeXX6Qv3dGUVdBC5zx85QpVdNqekY/c1?=
 =?us-ascii?Q?gRqny6EFBmPnz+9+hRgt+GbhYW83jMOkwWHl3eB3ykNG3GxDAt3V2kOXpAkm?=
 =?us-ascii?Q?a2l/7/zm9DIOcNbBSDNsfYXxFtWDj9jhPjvh4atu3999gBacCtTTYEVBRNAJ?=
 =?us-ascii?Q?twqYuH5aLSnL5ID3yzLmVOQzz387h4wpzJxyG0uK/dJ+jJpVBKnoYmx8/kfS?=
 =?us-ascii?Q?MgeLTiiaEaO/8nTmekLr4BIgkGfHb/sgNjce8N9cqPCvmHllNvef17WduMTH?=
 =?us-ascii?Q?mIx1JAySSFAMCWJZySsAjgctN4HJb6HBzN8DfIrYuCx+S/Anim9M6EXrfATr?=
 =?us-ascii?Q?Qi5i1AgNT0OrNKGme+L3VSAAZSA2hNCR0YHuqH60C3VdfuaDr0A6liGgCNzw?=
 =?us-ascii?Q?2Q31pSvyltDNecVh1QPG56h5GqUbeucgY8UwmTd1tNUUBqZpE5A6PGJJpPmU?=
 =?us-ascii?Q?7eUdXAc1fzTO4iMaaCP+4lX1Gn1qm/sstWJmig2Mz1m65rJqH7b+KqMW7W05?=
 =?us-ascii?Q?lMjJpjSOE5IUkH+tzpRx+ZQAmCsJG75IEoSD7vf9l9CjDedEh5UYQLQGIosa?=
 =?us-ascii?Q?wcnem986XIG8u+BZHKnIirdY1Lna6QWHTLTPTbqOdNJ8nU02LGL0YCQjOf++?=
 =?us-ascii?Q?zDtJGUtTZXrF0AWfAFYa1n4LapJXqllDIFmJzXN3OX1DOkECk2ESiy1HOGwj?=
 =?us-ascii?Q?uJR4Yi1lqNU9UY+tURVhCUdjj8Rdo6hS1dB82+ICByKb8UvDQkmhTul9ZJu2?=
 =?us-ascii?Q?AbxuzsGgeOu3KhdlaeAO11MDm6WRquclDFLTdgRTnfkaqvOcx0zigdiQEk4v?=
 =?us-ascii?Q?zcpimluu7siG8q0mB6ErU6Kl1uDeTmoFQtQF/woZbrYVyqSz98mbhFL+pO1u?=
 =?us-ascii?Q?psb3RwS3z/Be11SI/bi9hLHwTlyh3pGSErh/TpUB2eaGFRfWa9CX74brGz00?=
 =?us-ascii?Q?q3Fek/X26itqKeNSJV/6IOSA5WCV7O87vTX28lDpfvSzuK3MWX0v5K/UKuiY?=
 =?us-ascii?Q?R9dj1x6V2EckGTEzhRauN9CX5b7oLMRFNa0wVFzprLkDbRKLpStEmRWLka7u?=
 =?us-ascii?Q?PgvqIbiWgst2/SU5RQDvx2jQbqih3r7/6opNheenF6D//sXX4QzD6wIdguLY?=
 =?us-ascii?Q?wy7C/T8HtSMAuPOuWWuBfxnBkvs/3Un+YseA47GbkZvomycQsmf6MYIHunNY?=
 =?us-ascii?Q?36b9xQEZEMxeFWTF2TT1gEZU+r5aRj1NfNJfCC81ShN/4Ub7xuN4JzRPgnsi?=
 =?us-ascii?Q?f1rJUNn3jPtBv+Oi2sYnR5d55D0HoGVtO+fyPx/0qE91948lcZN0w7VHHffd?=
 =?us-ascii?Q?1puySbN5RMGqyaz3Y2BmLBfZMnZuM0ttPmV9G++2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7189149c-5a7f-4dc2-b873-08ddbe863a7a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:16:27.6043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVfQ6lRS4WHIn0OYiMRqp0htNBdTutNvmqCXY+vmAriCLjzHjXch/IqJqdrTJdy9OAwdS1Scl0HnSHlQylkM+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-OriginatorOrg: intel.com

--N/nV+FxCxf7pfhwV
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-fadvise
head:   790eb4993915b8777f54cf053ee714e6c8613405
commit: 790eb4993915b8777f54cf053ee714e6c8613405 [10/10] nfsd: add a NFSD_IO_FADVISE setting to io_cache_write
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507090137.X55jloEb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1277:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1277 |         case NFSD_IO_BUFFERED:
         |         ^
   fs/nfsd/vfs.c:1277:2: note: insert 'break;' to avoid fall-through
    1277 |         case NFSD_IO_BUFFERED:
         |         ^
         |         break; 
   1 warning generated.


vim +1277 fs/nfsd/vfs.c

d911df7b8d44de J. Bruce Fields   2009-06-15  1198  
f2e597353d50f0 Chuck Lever       2025-05-09  1199  /**
f2e597353d50f0 Chuck Lever       2025-05-09  1200   * nfsd_vfs_write - write data to an already-open file
f2e597353d50f0 Chuck Lever       2025-05-09  1201   * @rqstp: RPC execution context
f2e597353d50f0 Chuck Lever       2025-05-09  1202   * @fhp: File handle of file to write into
f2e597353d50f0 Chuck Lever       2025-05-09  1203   * @nf: An open file matching @fhp
f2e597353d50f0 Chuck Lever       2025-05-09  1204   * @offset: Byte offset of start
f2e597353d50f0 Chuck Lever       2025-05-09  1205   * @payload: xdr_buf containing the write payload
f2e597353d50f0 Chuck Lever       2025-05-09  1206   * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
f2e597353d50f0 Chuck Lever       2025-05-09  1207   * @stable: An NFS stable_how value
f2e597353d50f0 Chuck Lever       2025-05-09  1208   * @verf: NFS WRITE verifier
f2e597353d50f0 Chuck Lever       2025-05-09  1209   *
f2e597353d50f0 Chuck Lever       2025-05-09  1210   * Upon return, caller must invoke fh_put on @fhp.
f2e597353d50f0 Chuck Lever       2025-05-09  1211   *
f2e597353d50f0 Chuck Lever       2025-05-09  1212   * Return values:
f2e597353d50f0 Chuck Lever       2025-05-09  1213   *   An nfsstat value in network byte order.
f2e597353d50f0 Chuck Lever       2025-05-09  1214   */
af90f707fa6d54 Christoph Hellwig 2015-06-18  1215  __be32
f2e597353d50f0 Chuck Lever       2025-05-09  1216  nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
f2e597353d50f0 Chuck Lever       2025-05-09  1217  	       struct nfsd_file *nf, loff_t offset,
f2e597353d50f0 Chuck Lever       2025-05-09  1218  	       const struct xdr_buf *payload, unsigned long *cnt,
f2e597353d50f0 Chuck Lever       2025-05-09  1219  	       int stable, __be32 *verf)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1220  {
fb7622c2dbd1aa Chuck Lever       2021-12-28  1221  	struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
16f8f894108270 Trond Myklebust   2020-01-06  1222  	struct file		*file = nf->nf_file;
01cbf3853959fe Trond Myklebust   2020-11-30  1223  	struct super_block	*sb = file_inode(file)->i_sb;
99223b5d289986 Chuck Lever       2025-06-13  1224  	struct kiocb		kiocb;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1225  	struct svc_export	*exp;
73da852e3831bd Christoph Hellwig 2017-05-27  1226  	struct iov_iter		iter;
555dbf1a9aac6d Trond Myklebust   2021-12-18  1227  	errseq_t		since;
d890be159a7139 Chuck Lever       2018-03-27  1228  	__be32			nfserr;
6264d69d7df654 Al Viro           2006-10-19  1229  	int			host_err;
01cbf3853959fe Trond Myklebust   2020-11-30  1230  	unsigned long		exp_op_flags = 0;
8658452e4a588d NeilBrown         2014-05-12  1231  	unsigned int		pflags = current->flags;
01cbf3853959fe Trond Myklebust   2020-11-30  1232  	bool			restore_flags = false;
f2e597353d50f0 Chuck Lever       2025-05-09  1233  	unsigned int		nvecs;
8658452e4a588d NeilBrown         2014-05-12  1234  
d890be159a7139 Chuck Lever       2018-03-27  1235  	trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
d890be159a7139 Chuck Lever       2018-03-27  1236  
01cbf3853959fe Trond Myklebust   2020-11-30  1237  	if (sb->s_export_op)
01cbf3853959fe Trond Myklebust   2020-11-30  1238  		exp_op_flags = sb->s_export_op->flags;
01cbf3853959fe Trond Myklebust   2020-11-30  1239  
01cbf3853959fe Trond Myklebust   2020-11-30  1240  	if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
01cbf3853959fe Trond Myklebust   2020-11-30  1241  	    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
8658452e4a588d NeilBrown         2014-05-12  1242  		/*
a37b0715ddf300 NeilBrown         2020-06-01  1243  		 * We want throttling in balance_dirty_pages()
a37b0715ddf300 NeilBrown         2020-06-01  1244  		 * and shrink_inactive_list() to only consider
a37b0715ddf300 NeilBrown         2020-06-01  1245  		 * the backingdev we are writing to, so that nfs to
8658452e4a588d NeilBrown         2014-05-12  1246  		 * localhost doesn't cause nfsd to lock up due to all
8658452e4a588d NeilBrown         2014-05-12  1247  		 * the client's dirty pages or its congested queue.
8658452e4a588d NeilBrown         2014-05-12  1248  		 */
a37b0715ddf300 NeilBrown         2020-06-01  1249  		current->flags |= PF_LOCAL_THROTTLE;
01cbf3853959fe Trond Myklebust   2020-11-30  1250  		restore_flags = true;
01cbf3853959fe Trond Myklebust   2020-11-30  1251  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1252  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1253  	exp = fhp->fh_export;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1254  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1255  	if (!EX_ISSYNC(exp))
54bbb7d206db78 Kinglong Mee      2016-12-31  1256  		stable = NFS_UNSTABLE;
99223b5d289986 Chuck Lever       2025-06-13  1257  	init_sync_kiocb(&kiocb, file);
99223b5d289986 Chuck Lever       2025-06-13  1258  	kiocb.ki_pos = offset;
c689bdd3bffad8 NeilBrown         2024-07-26  1259  	if (stable && !fhp->fh_use_wgather)
99223b5d289986 Chuck Lever       2025-06-13  1260  		kiocb.ki_flags |= IOCB_DSYNC;
24368aad47dc65 Christoph Hellwig 2016-04-07  1261  
1969823caf1635 Chuck Lever       2025-05-06  1262  	nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
1969823caf1635 Chuck Lever       2025-05-06  1263  	iov_iter_bvec(&iter, ITER_SOURCE, rqstp->rq_bvec, nvecs, *cnt);
198bc27df52244 Mike Snitzer      2025-06-16  1264  
198bc27df52244 Mike Snitzer      2025-06-16  1265  	switch (nfsd_io_cache_write) {
198bc27df52244 Mike Snitzer      2025-06-16  1266  	case NFSD_IO_DIRECT:
198bc27df52244 Mike Snitzer      2025-06-16  1267  		if (iov_iter_is_aligned(&iter, nf->nf_dio_mem_align - 1,
198bc27df52244 Mike Snitzer      2025-06-16  1268  					nf->nf_dio_offset_align - 1))
198bc27df52244 Mike Snitzer      2025-06-16  1269  			kiocb.ki_flags = IOCB_DIRECT;
198bc27df52244 Mike Snitzer      2025-06-16  1270  		break;
198bc27df52244 Mike Snitzer      2025-06-16  1271  	case NFSD_IO_DONTCACHE:
198bc27df52244 Mike Snitzer      2025-06-16  1272  		kiocb.ki_flags = IOCB_DONTCACHE;
198bc27df52244 Mike Snitzer      2025-06-16  1273  		break;
790eb4993915b8 Jeff Layton       2025-07-07  1274  	case NFSD_IO_FADVISE:
790eb4993915b8 Jeff Layton       2025-07-07  1275  		if (stable)
790eb4993915b8 Jeff Layton       2025-07-07  1276  			kiocb.ki_flags = IOCB_DONTCACHE;
198bc27df52244 Mike Snitzer      2025-06-16 @1277  	case NFSD_IO_BUFFERED:
198bc27df52244 Mike Snitzer      2025-06-16  1278  		break;
198bc27df52244 Mike Snitzer      2025-06-16  1279  	}
198bc27df52244 Mike Snitzer      2025-06-16  1280  
555dbf1a9aac6d Trond Myklebust   2021-12-18  1281  	since = READ_ONCE(file->f_wb_err);
f11ad7aa653130 Chuck Lever       2021-12-28  1282  	if (verf)
3988a57885eeac Chuck Lever       2021-12-30  1283  		nfsd_copy_write_verifier(verf, nn);
99223b5d289986 Chuck Lever       2025-06-13  1284  	host_err = vfs_iocb_iter_write(file, &kiocb, &iter);
7bf94c6ba9fb29 Trond Myklebust   2020-01-06  1285  	if (host_err < 0) {
1b2021bdeeca12 Trond Myklebust   2023-09-11  1286  		commit_reset_write_verifier(nn, rqstp, host_err);
e4636d535e3276 J. Bruce Fields   2009-06-15  1287  		goto out_nfserr;
7bf94c6ba9fb29 Trond Myklebust   2020-01-06  1288  	}
09a80f2aef06b7 Trond Myklebust   2019-12-17  1289  	*cnt = host_err;
4b14885411f74b Josef Bacik       2024-01-26  1290  	nfsd_stats_io_write_add(nn, exp, *cnt);
2a12a9d7814631 Eric Paris        2009-12-17  1291  	fsnotify_modify(file);
555dbf1a9aac6d Trond Myklebust   2021-12-18  1292  	host_err = filemap_check_wb_err(file->f_mapping, since);
555dbf1a9aac6d Trond Myklebust   2021-12-18  1293  	if (host_err < 0)
555dbf1a9aac6d Trond Myklebust   2021-12-18  1294  		goto out_nfserr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1295  
c689bdd3bffad8 NeilBrown         2024-07-26  1296  	if (stable && fhp->fh_use_wgather) {
d911df7b8d44de J. Bruce Fields   2009-06-15  1297  		host_err = wait_for_concurrent_writes(file);
1b2021bdeeca12 Trond Myklebust   2023-09-11  1298  		if (host_err < 0)
1b2021bdeeca12 Trond Myklebust   2023-09-11  1299  			commit_reset_write_verifier(nn, rqstp, host_err);
bbf2f098838aa8 Trond Myklebust   2019-09-02  1300  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1301  
e4636d535e3276 J. Bruce Fields   2009-06-15  1302  out_nfserr:
d890be159a7139 Chuck Lever       2018-03-27  1303  	if (host_err >= 0) {
d890be159a7139 Chuck Lever       2018-03-27  1304  		trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
d890be159a7139 Chuck Lever       2018-03-27  1305  		nfserr = nfs_ok;
d890be159a7139 Chuck Lever       2018-03-27  1306  	} else {
d890be159a7139 Chuck Lever       2018-03-27  1307  		trace_nfsd_write_err(rqstp, fhp, offset, host_err);
d890be159a7139 Chuck Lever       2018-03-27  1308  		nfserr = nfserrno(host_err);
d890be159a7139 Chuck Lever       2018-03-27  1309  	}
01cbf3853959fe Trond Myklebust   2020-11-30  1310  	if (restore_flags)
a37b0715ddf300 NeilBrown         2020-06-01  1311  		current_restore_flags(pflags, PF_LOCAL_THROTTLE);
d890be159a7139 Chuck Lever       2018-03-27  1312  	return nfserr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1313  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1314  

:::::: The code at line 1277 was first introduced by commit
:::::: 198bc27df52244f0e8a420e7a40552c3ac45c905 NFSD: add io_cache_write controls to debugfs interface

:::::: TO: Mike Snitzer <snitzer@kernel.org>
:::::: CC: Jeff Layton <jlayton@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--N/nV+FxCxf7pfhwV
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--N/nV+FxCxf7pfhwV
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=790eb4993915b8777f54cf053ee714e6c8613405
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton nfsd-fadvise
        git checkout 790eb4993915b8777f54cf053ee714e6c8613405
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-20 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-20 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/tty/serial/8250/ fs/nfsd/

--N/nV+FxCxf7pfhwV--
