Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C660D36C5BB;
	Sat,  3 Oct 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038409; cv=fail; b=RyQhXJJppNH4Y0oh+rb7EYDlGTUpF5hbC4YKpkjjO65VqFK/Tu5NlHHwlHUaRhtX4eOlrDZqOm4FhznlPEiPyuEWzvvEFgoh2G45oC1W8uHZKa4cWG0DbR2Hs5wwVoVrW7LPjHbnW367bgSxGgkQqisn1f6/gKXGbj2wFdtcX00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038409; c=relaxed/simple;
	bh=4ha1Qdt66NT3iesHBtO2V3+VmgBoo3d7keBb/EyWTU0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HrRD6jAbTFQSttTDTVyRVuZTEM7C5/IgNxaPqZq6EwsnOD+916BP7XTTWF5ee8jQ1wLu8MAOmCOKSSIoTcP6jIU6U3X2/GWq8WCtw9ZH1S1FBg6nh8ZsQZ5fysoxH49PPTXwh6bfThOAHhpvStizlQUktoDU6iwykt/T7+7RTvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpSugXHt; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpSugXHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038407; x=1822574407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ha1Qdt66NT3iesHBtO2V3+VmgBoo3d7keBb/EyWTU0=;
  b=MpSugXHtt0w3GaffPvRPj5b081+jqPSviUHjAg1IQDMozjbC+E1qV+Rv
   /W6yd1Op0TdZXpS32LNCFSgjTgFsWY2RysCCk8CgOZOzd/CMSm5K7GBoh
   sB75wgvD3ED3/x2vrnolCfRgRk4lM261mSvhLCPfTvRBOy7IXc/ft+W81
   pKINOfWM+QCWKoXXW8Hdfkj0K1nsOMELRmVnJpV8aKDwhF5YsnXIEufQd
   lQX8FqgV34h6HNfTyWbxxolhQnRjBd6Y0gtzmxdjM6/RjvBGLgf3UyqZF
   JeYG1232JC2cMmRgMhXdpPqU0njPnPMxzGt54twHRXBIcisegUVLwhkLf
   g==;
X-CSE-ConnectionGUID: SZ2zOMuDR5uYxVoDx269JQ==
X-CSE-MsgGUID: HenIq4DxQmyB7B7nBw9xXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90675406"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90675406"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:40:06 -0700
X-CSE-ConnectionGUID: E2Pu2S9XQz6cZ6h8kU2sMQ==
X-CSE-MsgGUID: Qg/JfnleSYeij0PW03EXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276594014"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:40:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:40:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:40:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgN78BQoffeWBkIyNXYrSzYL896FOlbnqxrcYJ54WtpfZ913mO+NHv/WGillPDAdVC9+hSt7khHHpwGa3y/5XshAqVhkT1tbFuWu/LP4HT6EfnXVhqdDbOK2sR4jO49ZHF9K61gD7nmQr3hB8ZSisCQM1EXWT3K/zEagjobo1FecassRL2RkTXF31rqo5dn0/CANOnkDkpbCCnzV92NveDLVnWh5Pgz2N3xkDBq5H7HYWn+p9ss9dAjVVPGKAOo9MayUFjtIb1wNJXW456th4YUVjrMu0i19CwH/skD8m4i9uHkoCQvhyo3FvzCSGmxnpsGvrO+9n3YUT86xGljMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NGqG/Zy5xfmsyxLFwiFKYBGK5YdBdIo4fjyKDREG84=;
 b=yFyC/xHa9JzyHxtLD5nIlj6PAxqpzB/dCWuwXS0y8EsggZG2Epqt+hoSCABo3iWuq2yKlyEHFJIl4uLCTtePMJiYRF0miBE7MSEghEraR96sYWabqIdIbAaI/kKk2lwMTXvW5LV921zPjEwmJijnj7Qfm4I/WzBsYsycslKqifszYPxExyEm5MvU1yjgY1kWSVIsNqwxRD3ZG+l+mzJ3Ywrsg/10LQjFzobwS4BE0Rd5z9raVPjYZgtKp+gYv51UD+dQQRivu1Or/XVk4t7KaiSANb5KcUCmJwBGwD9H6JOn0av6hWLuGn/5iJpdzqJuiDUVpWty2x8jp9Lb1nYTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:40:02 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:40:02 +0000
Date: Sat, 3 Oct 2026 22:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>, Jonathan Bell <jonathan@raspberrypi.com>, Dom Cobley
	<popcornmix@gmail.com>
Subject: Warning: drivers/rtc/rtc-raspberrypi.c:18 cannot understand function
 prototype: 'enum'
Message-ID: <asETunjGveTgiv3U@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH7PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:510:325::21) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c72e06-4e87-4b0e-5884-08df215c351c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: +pNtQfrDiAQEd0bN9YoiOCzhnQ10VNHCNN03CQJwv9A9/ZwRIJWE5EqEZe33mCCXR2w8rCTxqIzeJ133qAokUQIUq54uc5T2BvOTkVnVDSMBYHJnuYcxO22HR2OcAtkPEOwjKyhsbrX3wHxsov/7UPngAHHDSfdtmp80b3+rRiPTM1P7EuD64/Lxw49LUj1Iv7uuARcoV11dY7uY3DR6BQD5K65MW0lzYfHXGt+v9jDGl6ulKkjbdkBOLZudQ8nVZKjAJC0U34Eamb8ZfplnoNp2L+Cp38Rl27qdbyMVMlKkgxWzILmhJ034DUbTibUS7qNXFo65IZL7fzS1N4lG9Wz6yV7fsV2E8eF3s6B0X1+ARJV+JBT2GFheHzsxMXUZuzX+gzBKAsJUZmhDT4dEYQxAhrMBXL2yPLwZdjz4LBVp/JkYgZQTCWZGQLqshwvc5Scrcv4KsH20qXxtR4a3OOLGeJgPRIB2GcIYXxzJOZWY4hjA4xF+W0d//SzYRinz2AIFIGKLccVSD3mi0nSONMqbKxosnD98xqb2ZMOsmBMvn3X2MDAHJbRFFfME6xxsXVc1ay4W+wqWTAuYEgk814WlugaRm2yh4Sg8OM5p2qnv+uhF8ReDdJFwizl/UEOb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzXedhKor4VWMR+q2wcuH/1yt/L87VxLK8zk4tq3atu2hTQBZoML8yDBhzeM?=
 =?us-ascii?Q?g5p592GT4krhR+9K/opNftolPl3KFsaoW/H/ef6030C7oAbXaxzCSrPnJb6e?=
 =?us-ascii?Q?MTiU0LyKgOtWV6zhn7M1Ka+TdkDmqnRyFuCxuyZucRQSfy5eaCmDzv7/2xpA?=
 =?us-ascii?Q?tDVIGE9bU/mEG3qkgs01n4nqYvVmQ8v5lRC8G9wkqp+Ipwu0htsuEpq093Gk?=
 =?us-ascii?Q?Sm9g6r/8EhPzvbOu2UzfFLx1tabwZE1Sg7TMMGBia52/Op3J525qT4lJi47u?=
 =?us-ascii?Q?cN5tST3Dcup9J53P+oFqXdjJAUbEXu5m7ZWINHlMmcNtwa6NJCBWVYsMj1WI?=
 =?us-ascii?Q?ykYiMSgCZrpStay/91RqadoAxsnEtxnlyFpqICH3SnXT6TYj7RLsVu0XYi0s?=
 =?us-ascii?Q?q67LZ68xwiSI/yPZA5CRjWx2Ryj0J3QUubD2SPT4O6opqUTb/d4frokHkOXR?=
 =?us-ascii?Q?hesd/3Ye+JzthzCIUvE1/puoHKf7pr5eF9hHiDeDQnKSxXj1Brf/p9+Dl4Vo?=
 =?us-ascii?Q?lkafqr4XskWPD48dkfrmkW4keC2PNo0cnqAhns06+nlxuPAJNjDVM2yGJcqp?=
 =?us-ascii?Q?7sgKmDB1npcJTBnTOAbPryM1GT7YZqjTUWqKZkQejxEWWxidsqFJqCO8YCKs?=
 =?us-ascii?Q?P4gWGYX6GQ7PiBbKZAAw+issCuqHYWtdKwa09QhE0Xk3tA5M5jZG2oojA27u?=
 =?us-ascii?Q?M/VMT6mgTlLzSoAgPcCClfMNe68oKK+yEbJrwcQRTp5PZvhjIlKjEcA8ihbs?=
 =?us-ascii?Q?aD2rCSwsT5mndUVZvrh5qJ/M0BIsCweTf5097nyT3Y1l4UAUFU5CWh7MjUyz?=
 =?us-ascii?Q?54sjv4yKmBdjkQ0xqXVz+FPAC8rUG9yanXJMWMaA8D/8vRZXodM/VVTA01RA?=
 =?us-ascii?Q?WoiSL0vw6fW7Gjbm6NtvPVWjudjmlJRwO0WjCL4/NODUm4/hrfUldud1kICE?=
 =?us-ascii?Q?G4VOdTuR0IhQVZrf3XWRmEAVdcGwmivY5OgmlX61y/bvrbIuOujqOFOY3bwp?=
 =?us-ascii?Q?6QMG6/sr8ilE5NMMWApRFUkxl4d28ozOLiM+uE9UXLy1h4Sjoz+UBW7L9Xx/?=
 =?us-ascii?Q?mG8x3GuOZK55B2Q306O9PD2TtkaBEv152PzSK2XBg2iAsht45xjuq5bV9hF/?=
 =?us-ascii?Q?NGkaqDcrWQUqrnGppeO10u5PaG87f8v0t83+d9LAdPc45UZpdSJPdsS51QVf?=
 =?us-ascii?Q?UNCAzwRoaAxK32o2TaDe2tTzOsW/auH2smZoclMU++09OUjClb9sOzWFVrqO?=
 =?us-ascii?Q?oROmAHs0zfbScJKgWWUzul81Y4+V6um97M2zzya96zDUSEpU5x3myTAwOGrX?=
 =?us-ascii?Q?tNT/qK5Uus5tfQP9N+oQ/k2KNlaEYWpSPnuFOQ4HS9revqb7xy8bvgjXNHr4?=
 =?us-ascii?Q?jt5gQ6s93lXdH1vJ6Sz44EtU845NMTOEhz/tu8dDciMuWwpit6lCaeshrHy/?=
 =?us-ascii?Q?NI8ix9YSou6Kdn7E05N9ZjDBdgQ91vvCEx6jIWCBIEXHENSUO9Xuvf8H1+xT?=
 =?us-ascii?Q?N+GiImxFAZQg4M6HHf4FkfQh7UZpHYQLF7ezzq8EArkWnV6vawWaOs52i2ms?=
 =?us-ascii?Q?lxvx+REUW7AEpODiVbkdhq0CckiXAy4vFCKHF4qsotAj+GDxOUnJzE5JdQcF?=
 =?us-ascii?Q?0XP/WvvmQs/7QUhZrf+7q06k/7JKwS2q2sdP/rrXfpjOddU9X+BOrqBqbxom?=
 =?us-ascii?Q?uoOhfgVQIK5CSPY/Fnu7obPom/w5wOgf0mLpnvtrCbBS24/Qmr9pt5F4YOL1?=
 =?us-ascii?Q?nRweiik5Zg=3D=3D?=
X-Exchange-RoutingPolicyChecked: WxKGs3REIm2jZkJOnoXUROoHIy0XgoJCFYy9CTA9E4xquM+FqxA5wktRZbyOfnph0OnibpWyhPJEuiVkbGZ5BHEelIVd9T73jGICDVh7Es+ggZtIFG/zjkxNHskT4YwbztH7R9QTNYtkvNMcwDrdgqRAm63RiR2fXRp9rDPaaySc5TQ+2P6A4bPvgYk/LZjEDnzbhBdcnSpk1vNDtHkXe4y18m/sydPMkaeDeTIsItCpXmJCP2edHM0jhdNCMsbsmo/v/sq1bmJ61TVLxlaYgl6y7bMyBtP9dDMMhewTjmwMEqc76B3A3xLtHyXP5dGEG2vh7RBhx44TEcoxnAMSFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c72e06-4e87-4b0e-5884-08df215c351c
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:40:02.2913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIhhj5sVpoiUjd+enQ2BK5bqEcDDUR2n3V23l3HyzuHxx3M1t1HpcCSlunhM1ynilT6S6KUCfL4PJwBC7IwCdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Sander-Speetjens/dt-bindings-rtc-Add-missing-type-to-trickle-voltage-millivolt/20261001-213701
head:   48694201a4e43273d47a3c5ffe2196ab5788d8d4
commit: 48694201a4e43273d47a3c5ffe2196ab5788d8d4 rtc: Add Raspberry Pi 5 RTC driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021858.1Kn7GpjZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021858.1Kn7GpjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021858.1Kn7GpjZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rtc/rtc-raspberrypi.c:18 cannot understand function prototype: 'enum'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

