Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2692D1A0BC9;
	Mon,  2 Jun 2025 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848129; cv=fail; b=qvuXhbnDwTiJvSZW8QlqmFukXLS/2zY3FF8l8dPChjo7Wq2z9Sia7QH6/1dbRt4dEl5xXZgFmg4XTBBNkzTQWeCuR8IWV5dlJUmWVInuvqD0ASmg/YgY3upcbz7RvGBNm8GlEExWhbBWZO4sDf019KWQ9bAdtTUfLGfhCa0eXJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848129; c=relaxed/simple;
	bh=qJXgt9d2gwP1d0njgDcRL/QFHfSupZmdcfEh7J/3OF0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EGqXo4XQtzRM6vVRuUEUi3XjQNV0kncR1vAel5GxzbLX5b812OzhWm2FCDEDrOeiQL6MvCYP+RwpHeD85MXTEbBGWnsXPs2R6yoSZbhigupPXKOhplOPsx9/k7SuO/EMm1amM/UEyFimk4U1bD3GrhS2+VL4xYVj+0WNk8hnCGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iytHNzBy; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iytHNzBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748848127; x=1780384127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJXgt9d2gwP1d0njgDcRL/QFHfSupZmdcfEh7J/3OF0=;
  b=iytHNzByzLZ5RJOMGMMCQ2XVQEO4lyMtZ4ePOl+rLGLqMuDX1557tb5i
   L8DhWE+a8vlGNW5DwC9ake1z1oOfhoaunbit6DWp/LuIeDBvR6UGmiwds
   6BZDLoCsfNCmUnAp8HY0S3ajYZD/AqTydlFeO/93GoUvXQwy10YGarkUf
   ptUfmXBgeAoowZy4qY84S53dcRPl+Y4lPPFOBGP07mm8OVPfbAGtIbiAJ
   uoP4bdxRZcT+8dPSPVPUuqhJkHHRwX3jz5a/2wYxJu5l1L8whECPrXmba
   WBW+rnPRsxe4MVQUohs6Pn+r7RK9TEEKNY4Qjmq6b4uGJzeIg3D9tuOi5
   Q==;
X-CSE-ConnectionGUID: XHqZFRb3QGORze32SeUECw==
X-CSE-MsgGUID: Do4kY0lVR+Cbq3Ou/U9xSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62200264"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="62200264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 00:08:45 -0700
X-CSE-ConnectionGUID: Jjgnw+4dQEOWsJc7y1IYRw==
X-CSE-MsgGUID: Cu89PFeOT/CzurjLhqY6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="145418808"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 00:08:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 00:08:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 00:08:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.79)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 00:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhh1xcHPD//C8Dt2rwds8gzy8zaUcfQd9mbCqVuACLGH+QHt/vBbkXbVUQeWLOkIw9T9+N5KA70tYJemcJ0s2WmxliLj0HNIWGoMvlh7ye4jHZ6Pie56Mxq0/ZMBNyJMUXSXJ0zOXlNOa3Q5KztFNi5BA35dixItkYhgRJb76Hr9Yonp/xO8WEE+H9M1XbVraVBu8Xf3y6KauZn1GDF9WFeRfi+unFQ4RpqLErHGjMUc7HYH2CBpHt+DOiKICR8F+F5+JTUp6f+56ZJfbhJY+obsLo4YX6Z6Tle6KW/36OG4H7CtXPlT0iUZBpm7TyZ8QYvjaDzbY4PnbXec6F8OYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2QG2NEyJ5kcdf1jCZlgLG3v4cMYdYSsaZjN4Hc0Fyg=;
 b=r78UuW3Kywfor6oPab167ds24tXBNG4BdxUT2gBsZk7zYmoGeFKT+B9FCMOxsclwH8uphGj4LQZpYIJZku6jlg+uF1UL9MeLQat56bIEW3WRgQ339Zyk0ybUqJWGajJpde1GyjbiOkdkWeVCU9O19uleX5Rv2fZFeOfAiFqJANbRgD5tjoGwkyfUkggfDirfyan7QJN5AlcxG5OsIV9I0ONehsGPOYtHCgkT6+eF9kQBqwl1eaTAfNAURCHdyiYGzzvDcSkFh5dTAkIwhX1q7nWVP2231adaK1EbifuU5uJHMBDpIDj8AC0pslvo+5h79ShdNvB4bFmrffipeQPZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 07:08:42 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 07:08:42 +0000
Date: Mon, 2 Jun 2025 15:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>, <llvm@lists.linux.dev>
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 5/5] clang-16: warning:
 optimization flag '-ffat-lto-objects' is not supported
Message-ID: <aD1N8YhN9bRvgl59@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 50802412-2a87-438a-81ea-08dda1a44e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lSQzYLJmcWxcxWFxlQ3nYYPWxCc2F6K2/vPXy1XWnSfVtfOqwxuQ03Pkq0S8?=
 =?us-ascii?Q?a63qycFElGVRpUze55F9B3CoDIXEVaJs2DpVFZEuBCnP7NJAKbg9tlxUfnKW?=
 =?us-ascii?Q?XOf6VziUwnr3kwOaLBLZt/2fxg5051Sq+qWztANXAUUVosPKSFORu033bZX4?=
 =?us-ascii?Q?sPampBIkW+r3E6w8MQjN4Rf0AdN7aL3/0zUjzgT94EbftvBc32AL+yu/rkMW?=
 =?us-ascii?Q?jlGZRapbiwnyr6K0Hk8ipHZ3gPo+/jeiqA19UGuyw3EP1l69JQih9q53pePK?=
 =?us-ascii?Q?Q4Z9Xc5X3ta50pzBFlKfRTZX4l7Vc/TyogFgm0GTcFDcAPpyzbuuLeuM4W+w?=
 =?us-ascii?Q?lTrxr+zwPgzE3r8HAvwp5v4EzIpoNUcjtIkaYvtGPMIWE1jbQ4Kh0VPCR4We?=
 =?us-ascii?Q?biB2e1l8ly5Le+YVwrUwfA4ZZHj3RRpm9qUbt7+syJvAjDNvOzsB9xEEHFLi?=
 =?us-ascii?Q?oFGUO4AF2AwQJtJ1NGPNdyCopUTcDguwadwjM9BhjZtjpQaoD0ifC98XQkE5?=
 =?us-ascii?Q?+8U6lqDzA1O4WvdnWciEILZ1KnPgC/fPdCXLFH21+YY9kz6KGhuo+3Cm0L81?=
 =?us-ascii?Q?sEmM/Ph3djsNRxcqso0O80ksBADUlf+fsscpkSC2GTJgVRfLoKHbIN3Sp0fL?=
 =?us-ascii?Q?3Rk4iNy6HhaUXiUlHrjUlpeP0skOu5peKCcxBRBPXVTuEWPfzjIBBQwWfRs6?=
 =?us-ascii?Q?p7vpXZJpRAWoGYMF4DNy6B/8eY2RNAQr+g8luVCa+5McJsPwmtcD4KpxdhGx?=
 =?us-ascii?Q?nmWNqccLERDaextbShE6dZiIFdpbInNoUFucJtkEnRMLU/7/z8hviJQdV5YO?=
 =?us-ascii?Q?PCmligQslc/cfk3YIh1fO35SyERSaA6MNXara1KPlysNCFtz5/gQtTZIaJ/s?=
 =?us-ascii?Q?G1ohnnluHVWD1Ro/j+UP5+47WJVSakznlkgX52nUgWoFgmVnQgv9YsbNKg/5?=
 =?us-ascii?Q?v4A+iEKawX8jmvlcwY0hPX2oGcwVhiF3R/5D2vnIKfhndoC7mZikr5DbrtRV?=
 =?us-ascii?Q?ksiMkk32aLQewQuAjt4OD0KIOlJi9GGbJ7yG7Fve8gVFNs2T9LucHEH6SU4u?=
 =?us-ascii?Q?d/Bo2oYVRMAO7PClMx9u8p+H9kOzJLZH3Hi9Vfkut/vgSgV5EOigUvAjN0km?=
 =?us-ascii?Q?RJeDD1IwHjr3dK9p/kVzmTndwa/S9drZRdN5G2huB/Ueqa6G5FcW6axux6xy?=
 =?us-ascii?Q?SubF+4trVPBLVcRwaQjurA9ygd2bzYueKdGCwVYNEQbDMYQfTBLBbr37QO0y?=
 =?us-ascii?Q?MFPVoA03u8vz+VtLoe9BRC0QzuSiSq1VhFyS988VsULr2u1QL1MvLzumUd3w?=
 =?us-ascii?Q?8po8ylLPkgIq0AzNykPaVPzTYu1zNsNIMdSEpDwWkz49ZSL4EHUUnCpcHVTx?=
 =?us-ascii?Q?oylHp/5jevbGF1xtNGt6iVuQNabh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkjT8A5zUXrnT4PipVaMgQwXzBEJKWk3VOnEx67jQKpRT/L41lLvqx9UYhDX?=
 =?us-ascii?Q?9STrlOLGQkLe+aEWO/T/Yo8uYg8x6o0zDHvWdCwqArVMqgC4lSocdFOfDdhm?=
 =?us-ascii?Q?7D81E9uQzHpT2IlrN1Ozz/h6U8DVHIjr351Nsct1zY5JKInZ5VKArtkidLQZ?=
 =?us-ascii?Q?XlYghigWBtQLaFF+p8eFHCK24F8NsUBHiwEs3JAkpe3uMS39CFHSUcNP69Yy?=
 =?us-ascii?Q?39rO0mIAxepxVJNA3OncIkhDDfqe+pD8OWVq74Ip1zE9AqIBm85yOM0ALWvi?=
 =?us-ascii?Q?gp/nhHiutykO1WtxnTdotq5rCIaphd/uuagCNXAUGNwfhK7VuKOy/+Ua0Zw7?=
 =?us-ascii?Q?+E9bDNx13kVenP4rqt5Xdpcg2KUqUgmLbbOoK1brpO+deyCCAKhwLqq9ZFUB?=
 =?us-ascii?Q?URvEE+Bkq2/+v4s040nYpnYk4eMbXmLlHHXyQ8RMPOadMdMjVjbsiNXl0tju?=
 =?us-ascii?Q?n/LRMdDTNtbi4ODE0Eh0yTa0GrPwTxwSTzqrgjET0y+DZ/jEzO9qF23ir2Sm?=
 =?us-ascii?Q?dej3dfpOt824lBByEPTp3imfvJeCbIw1hJGPO3BrlxeATy3NG4jK0YgYYOQQ?=
 =?us-ascii?Q?WwdlPOgydLs6ukK0KCs6Sy0gqs75GesTebXzMpQJBUhZssCRmvJHmWtsVEC8?=
 =?us-ascii?Q?/vabiDn/z4swyFw8HYiWa3H3zZkDFupj9K/+fYj/4cxR408VzXHZZ/WVZ+sp?=
 =?us-ascii?Q?9ZYdf8CtTsS8isOsZn2xU+3qzMnd33xSXD0I142vevn1F/9/JU7aJyDRT2R+?=
 =?us-ascii?Q?FzfPcwLRjdG7VM5XmgZPrMy5g2HZ1akiGgHSDhxpBXOc7dx4/UffBSorpGKk?=
 =?us-ascii?Q?S5mTyzWwOYYZTOOJwU6z4Gd35IQEcF4PBzkfKfwZrpX+IqQj7bSWWlFm0VGm?=
 =?us-ascii?Q?YZ2M2hGI5tdXmkxsBWW/erY6yTalJ874z27a/TKzxXlPvXOhYM23SoRDGUKb?=
 =?us-ascii?Q?pZVpKh4kAfp5jMS7k4dCS+n8YB4tZCFK9Vj/UnoocIEGhDIffggL2xJsKxf2?=
 =?us-ascii?Q?gZyT532FfDDuUquiEn9fODJhh1u9v9pV85x7Hgcz73bia7sFwz2rBmnczz4Q?=
 =?us-ascii?Q?yknfe7u8CP1Oj9Sy9J/ohzOVu+4WYyAOklNMGm9VN1m74TRE72eqGVO48jRM?=
 =?us-ascii?Q?7KVYEyPwnOHjHFkhkK2HqTbH2mtI8m8pRZCjWQe26aTQ34e1hOqSW5aifDrE?=
 =?us-ascii?Q?2RfKwuNbtnllTZZGAurkw8qrOuTWGoyPZwtribyzRpeUkLFJy2e9lOCfaEfZ?=
 =?us-ascii?Q?JXnfwVEK1Y3wySwM9N+tC1KlEmuMWy2x7uimJqwxIB42nI84uMg/4RFnlhj/?=
 =?us-ascii?Q?b6U3/miVretjguNtGDD7MIAXBh855uSP1yIMWP4dBbhMHzRpxsQRsfSeJ3et?=
 =?us-ascii?Q?o+UpvLpBqwmQkWOLaLNCyP9EK4UnwJgMGL/ZZsbXsMrNKpBLfoihyw+qwcI4?=
 =?us-ascii?Q?C5ovxD7MHPXTob7i8zr70r3bsH8ypU9L3gb7kEjDZD4nYHl51tA158aogQtu?=
 =?us-ascii?Q?glbJDpBoQ2h9kv15HCTi1/jDvNNljnJ/WlLOixgET04bhcHS5xIWyhoCcEt8?=
 =?us-ascii?Q?thiS7nXII9pW5c2fSNkyUf9sowFojEVMdxs7Yf8W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50802412-2a87-438a-81ea-08dda1a44e4e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 07:08:42.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNwUPxT5pfhzTCoDMH3BCFQP3nvTObSe8auPtTAWVXItuYOu6rL6396+vKWHs07YJg+tSnGv6Ze5q7/mI61D6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-absolute-reloc
head:   4aa8b481d2f00bc4ff36a2a083abb57c7a9a9387
commit: 4aa8b481d2f00bc4ff36a2a083abb57c7a9a9387 [5/5] vdso: Reject absolute relocations during build
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250601/202506010204.sWMElxae-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010204.sWMElxae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506010204.sWMElxae-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang-16: warning: optimization flag '-ffat-lto-objects' is not supported [-Wignored-optimization-argument]
>> clang-16: warning: optimization flag '-ffat-lto-objects' is not supported [-Wignored-optimization-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

