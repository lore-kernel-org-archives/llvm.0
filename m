Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA62AD32;
	Wed,  6 Aug 2025 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754447122; cv=fail; b=BqQxvDhJKo/UvNQU5nrF/immBLjboEQBKZ4z6bVzPrUPkK1APkcLfeBbkyof2qls5+9aJEJUOxvE9wWLu+CWp9iX1sgI16CuDmti8Ae3kWtmQTzZ1Oo8kLje9xM2R2YIvqVguH/6iYvVsXg4/Q8B0uqq7dq2fUgFLBN5BCYXSxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754447122; c=relaxed/simple;
	bh=dhaxFbqBVlATp7/MoYyE6CFCEA7p8dEGSZdP/wknqI4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tD280bAY3tB8vRHJfrIOBj2hmHtcq++7oQtMLXXZa1CbWkjpkmTeKKGsyYKvf2LGpKIJNm2z0oae5ZwxLEhGoUvzmzRsPmIJwO/I3YVS9F30+ip4eStC7OkIiRUw740OUVmtgodjQH8Hg3dhFDHIdSq3AyNXzfxgvKMGhRt25oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2QwXJgP; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2QwXJgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754447120; x=1785983120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dhaxFbqBVlATp7/MoYyE6CFCEA7p8dEGSZdP/wknqI4=;
  b=M2QwXJgPRAzYEMqechjtDpwvod5zAbpSF3LqV3nLq526jZiFhQkgZBKC
   N6vlsGmelXzhCnK1YF6vlUtF0A5UuS6J27T+7CwWIQhrEsKty3ds/0rLV
   nEPxE7312faZNNNgtJjuczaJUxMYPh6viMNvcfyPeGrlHmkNrwXjIj7K0
   zWJSLz+ITPXmN3ojgsKGrY2885oc9g4qxX3fM3feRKzbmNYAgUC26pr6Q
   yh0eGEoZjEnPA8vO7IkWVKkKx2RO140V8W3mROTpH9MBf/LXX7VU+Ajl4
   p6vN/kSHvsho9dOXuCWMHZNmULILGWnItb6Cj6ZUnM4eC0GQtKnlBHoK+
   Q==;
X-CSE-ConnectionGUID: 5PCpw9gOSCqpSlx+h7tLgA==
X-CSE-MsgGUID: qCWpVXXpRci2f64hkVDnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55967509"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="55967509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 19:25:20 -0700
X-CSE-ConnectionGUID: 871oAuC+Q7GqaaiXjQTWxw==
X-CSE-MsgGUID: zLvf21JyTVisYod7aJ9WYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169918859"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 19:25:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 19:25:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 19:25:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 19:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKHPOh2oBpmaZpPk2rKkBk9xsuoN40snWP+LkL3DvY36uWozHN4flL6+erBoGWLsjxvvIdGK2l+MBvf5xrMcBx1d6cE0EZti7zaYE1Ox9ENZmCKyaMCSqaCd69Q5DK++d8e1tyMAecR3br7LMskO7GG4uZdIWkcxW+Ayn4HduRYPMF96YD2ZvGg/+sm8ZXAFGU2/Nq6DynPCtE/e2YxHROEujzSA+7NjqTR39+KkeXmZkg+oln8eSwOHqtGgC63J4DHTCeA9inRIuPaLLu9dhwc0m06aU2getecxCnbBlSky9d3jST3eT0CJbMKaBf8HsYvZesbkgdoO+OAVQU/Ptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoT1O0uj7UdmoTrQUsX1u0TIbGw/Ls1ARJ4t0H/FjsI=;
 b=xrY3aZE80cJGAJIYg0wQ2JDrarx7aLhGNA48m1yqjehoGZoKRX4Ig9O3idatoZVqTUET7jpxEu2BbobZFJ+PnqSBdksKFUcNKo4z3CiF9TDoVk0+PjJJqwX2g4f67HZ5eTO20y3Zgj+a7hMh0E1QFn0L/vdw2QBCVSF6csEUaVTj0iJU8GKz4qDLOqHsSA6301ha0W/kqRxkEpCUB33yq5FBwOiIsmw9KKeDBCVF6huKOBTCHeCyph9sA6NKbV00r+3WG6mXy9HoT3I4QnBF1KlI2UpyzzXssm05U/jzcDFJVKXvNb60I2PbKZ45XmCjBf5RXaGpAIJDixO54UItww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH7PR11MB7052.namprd11.prod.outlook.com (2603:10b6:510:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Wed, 6 Aug
 2025 02:24:57 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 02:24:57 +0000
Date: Wed, 6 Aug 2025 10:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [linux-next:master 11988/13293] /usr/bin/ld: warning:
 vmlinux.unstripped has a LOAD segment with RWX permissions
Message-ID: <aJK88QWH9FA+zkfi@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH7PR11MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9e421b-ea72-4935-31c8-08ddd4906fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i4c/2dvuVaCt3NGpn/qIbsyTdQqcevjPs6mPKoZG97D62dn/3XE50TUGcg0H?=
 =?us-ascii?Q?pbwZi3J9FKxWxdHWdKaG4Q0grmCBbXC0CaWWtEOeYArZ3WN03YLsuQ51eVBY?=
 =?us-ascii?Q?7U20RbWNu1SyuAUyWP/P+MBBOwfTcyoXbBEdyi9vuvTCrFyntDh888bVOgo8?=
 =?us-ascii?Q?ifwDSYWgfyhuO5k9R5haO+LkZEuczGJ7wty7B2XZYTY+OhNJxcj55TLHe+V2?=
 =?us-ascii?Q?lBYfkTXSL7v4uapqb/kCT8iH+uVmKl9GS62YofOW/Cc8toVbl3uj7Y2Jg7uC?=
 =?us-ascii?Q?RPyUBJkXQHlhS7ALplCLgj11SoOF1ZuER9nLTcJPfNl65+RMod45nCjSnFw7?=
 =?us-ascii?Q?KOYdsBCceSBUwm2eA2o1CGTKwYCWKOD8ZUDjNgB2N1jWqhBJlsFW8h2z0Vm1?=
 =?us-ascii?Q?BdxPlGPcI4s1aGMKupDGFaE1K6S90WOpt1pDsaEO5swmjcKYqhcI/e2m1nAx?=
 =?us-ascii?Q?7O+0i4wByfdDSLw+3WXhfUlEyGEItk+Fv4L9ONfFiELWliHbnN1l4U6CX20f?=
 =?us-ascii?Q?HTtHr2H8BUZzk/WyxT9KmGahmVIUFg9wQGYTm9NyzHJTM1DU3SPxG2jcxo/O?=
 =?us-ascii?Q?reGqURzpF+pb7dWIy2cBIEaQze/zLqJLOlB7ktGu9ndJ17/91vd9nAkVfu3Y?=
 =?us-ascii?Q?cRj2Y697hjyiINWNF7ZAYSm4gg1n3tRjTvBlJveA1Aol4GTUds9bly4DLoqF?=
 =?us-ascii?Q?utjKAAgKDM0GlNHfWWSHMmfGxfwL5PWSJ0OjfZ6Rrrl8Ka00VBOMQiHFnozZ?=
 =?us-ascii?Q?IGrJOMjUZaschQLnHDe8tuDg/cqcpOcsM4f5h5Um0TVGF58POkx8mJc7zHD6?=
 =?us-ascii?Q?z4LkEaeiHtLxYQQ00nDNLuCMa79x86BTFmKVoxYxIYFafMn9VVzdWJw7wcGX?=
 =?us-ascii?Q?QOgSAAqansZMrhhyXavPr03zpNEJef8JpMHSQcEnvjJWNnRqroWotBlbItO2?=
 =?us-ascii?Q?lEVA9IKHHNxoIlkIEsa/2rBFcZoVwJxCDnChcbGcHxXq3HcE7Sr28RjnA8gl?=
 =?us-ascii?Q?+2pILf9zxYhgMEULu56FKz2JTMV1ZW7v+C9wQTnLqBQ9yh0WU4GYaNoyq6Wp?=
 =?us-ascii?Q?Rg1mcPCMdbpa/HtpR1VMJ9rkwsuBbdjh9NnsaiwyDW69mg40jrpVqKHBYE+7?=
 =?us-ascii?Q?CK0qlOesphUmVkCq0JtirffTq4J/DUx1bE6EJCwhpj/p21hNdWMPUHE5oGUI?=
 =?us-ascii?Q?3yKrBjV1yd1bmZRzUS1INCbDx3j1ueHT5z9IV084zbRXXU5Z7EcT+ogH3Aqp?=
 =?us-ascii?Q?szEbVzrML2Kd7V6GwuwhvnBUP2FLq2gxfJMDKGH7oL+112drGHdtEWSZk5pP?=
 =?us-ascii?Q?bD25WlU24qitRo9tm6M1QMu2+des9vZEkfI56J0N1BRN86knF2rFqCGr+yDq?=
 =?us-ascii?Q?FABR1C+D1m7KguSSrTJW1kAcQlLD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CowV3M/sU+q+CmSEW+utupKbHgBfAvMcZTZLbeYu2JchKnFVTBUKPVd5H7dC?=
 =?us-ascii?Q?ljATRUID7HlEAj95tnIbQ73ctnSYdFolbbHD/UHjy+cmUbgokPkGtsTv8E1E?=
 =?us-ascii?Q?GQqOHcBwf6ysOfrJFggd7w7wIf+o1AeCqzA6Xhfx74AWIWKmMTTFhQLAFBDP?=
 =?us-ascii?Q?RsxB0mRDyWQBWESYDCjhrI7zHo0ZnFI51Q7JKs8ZvarUyq6sxNNE5BughZ96?=
 =?us-ascii?Q?rTmDl7cATEzPFHjScGHoNRF4y0X8ZqdBf/+PJxVcL1IvWO3AyRdxkKRs78ke?=
 =?us-ascii?Q?gVCVRh5Dw4NylVXWmKJdCVFFAvvbbcbQ2rOwefS/cQYFIFEWfq8MoTsU+FtQ?=
 =?us-ascii?Q?37FY1fvaz3b6cSf3xiAL+pLc/7HJ5OzXXV4gF90EoaMlv9LWtfKmPfkRcohw?=
 =?us-ascii?Q?LxG07HTH08rfJqEamL843oP+YmN1een2RbhbnKArd2+5NzYaJ7MrjjveKsVU?=
 =?us-ascii?Q?vtnbc6vE5dq12VCXiVtDd03rvafHtKsqUDFZeHCFu1C5ALf4OCPhfK0MlNX1?=
 =?us-ascii?Q?meraI+wn4mTjUqLKlOsgbtkSc31oimGa37aivD2GAoQbcqZGqahPGzlouuOh?=
 =?us-ascii?Q?5MCanSG/6N5ki8SRLULm1HC7Sx6SBv31F9hzCEDzKSwbLw9NwG8+ui/55Ppb?=
 =?us-ascii?Q?PMgwuXoCThoEq5AbWdtwv1n4FRsmLHwf+bNx9QwfvgUSs2/Drc54c/Kn6Bsa?=
 =?us-ascii?Q?QSYbJZCaE0BCxQUJ9U3mDulVx8LAhX9u3lQl7te8BqmN0UN27hHXrPGjRsGs?=
 =?us-ascii?Q?epjXdlK6tkjqRnfEEEfm3se/FHGc2Mlw3P91LamIAzMDLmidYVFkcdcdWEhi?=
 =?us-ascii?Q?9Q7u1z5B3VaruMtTym5xsOs8CQ373xbmqwVniw88wU1AJxEdqGEDZ0dNdfkN?=
 =?us-ascii?Q?C/PwOabdQbXmRs683iKUd4DWyyrAMxGBITyU0eHgzgbyaHOeHHQEVzYGHmPa?=
 =?us-ascii?Q?ouoxpVYybvEBEVwuNUMCcpc+J1UHkQiX2hI2sx8pVIXU6l9XAzicNLyNVWsh?=
 =?us-ascii?Q?IGfN2ZBJxQTRz+zQUU+/0Pl93S2cMj0h7K1ys8guTby06V5/Zv2ENre0leEg?=
 =?us-ascii?Q?mMyB6gYJKEksb3KzeDFsrhzaLchVYG8/64idNM2KwaP1ZddrI06FtyZG3pi6?=
 =?us-ascii?Q?oBTQFhew13VJM0lL64lZb56jb0fn+SCJSXVuqeL/Oo4hwKQpmvlWUsWMlvCV?=
 =?us-ascii?Q?e7nGO+A1U9QmuqqH7Djz7UEsxFkpsOEb/DeJ64T1oP8+7lOw6pB5K9HqsPZs?=
 =?us-ascii?Q?jdRcvP7nbNk/LxyjuawXib/cA48Xx0IbCh/N4jtcwjZ4L/D4WbxSpNtCt/vc?=
 =?us-ascii?Q?WN5sFCB3dzt795vzbn9lqUX/IIgUhZjA4on0B6XJERetkUBFDziTu9y7biO5?=
 =?us-ascii?Q?0s19lx3Kjt1ZmwOX5+n+Qv3fn6NipMkDP+sTgJLNhgWbStweb5wgof1WYfJs?=
 =?us-ascii?Q?dFNZSQBCe/VorIRd4rth0YxawTOyGpZvrQ6zQmRO+eE+Ni4XTOGdtS3ybk8a?=
 =?us-ascii?Q?c5IMVquJG5z9GHq9jFRQnQ5/8z6Nq4De2QJP6YvYO+XFkNwkrKuOSWapTg+t?=
 =?us-ascii?Q?p2jXUK2a/lumVCjZAef3a4cOFh/ugkvdM2ibT+tn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9e421b-ea72-4935-31c8-08ddd4906fb7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 02:24:57.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1JEErCVqMMxr7baLwQXoMFe/+KvJ8UbWRRv/HYbh3PWgQU72cO1wYXYrl1gnDdEOdhs0jMSFyKUCho32lNQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7052
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
commit: 6cba15e9daa2a0714c9159a46fd021947745eea0 [11988/13293] kbuild: always create intermediate vmlinux.unstripped
:::::: branch date: 11 hours ago
:::::: commit date: 10 days ago
config: um-randconfig-2005-20250805 (https://download.01.org/0day-ci/archive/20250805/202508051600.JORbJraJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051600.JORbJraJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508051600.JORbJraJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux2 has a LOAD segment with RWX permissions
>> /usr/bin/ld: warning: vmlinux.unstripped has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

