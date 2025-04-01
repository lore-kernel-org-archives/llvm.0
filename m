Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ADC33F6;
	Tue,  1 Apr 2025 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468439; cv=fail; b=D0mYV4aw8WQmrx2BEXQ9dDziw54Ldh6jsb46GS9MIL39uCvFJA60utub5Zr+bmZWNePRoA6rFvDzK+eeLyD9I2ZcGojXgcxyaQMJn9cFyj9ZZUDH9iJ81/2EifcaHa4VrqUO4JOYr1y22DPlF/bGyjhHfNBLdFKki5cxl2Aee+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468439; c=relaxed/simple;
	bh=K0XbI8GAfa67qAN8GR4eacQIPatMhT4pNCaVoezjmNQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=g042jrHzcmg2s127WCTsHDTj/qWCimua703xtwEkrY03UmApb3IyrusB1Hu1Tdi31yLIbzwr7DGgJC5MjuO/P+Ol7jYSjVk0o5gi39yLW6FJmp2RBgJdbt1knvHbC2d5n68zKAWrHSnjYjvdZ8hCAYSEHRaDzssLLF3zeUUtEMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeKphyig; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeKphyig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743468438; x=1775004438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0XbI8GAfa67qAN8GR4eacQIPatMhT4pNCaVoezjmNQ=;
  b=BeKphyigNzm1T4Im0HgtwUHdspHPavExwoL0gdurMSmJc63KQsmuVMrA
   xe+FIi9VYDiIJQC76TarKl+dntpCJUgpiyHXYFAGCBnXxeNRd0Np/cOfC
   sgxHozlwP4idqzTrNRNFcOc+3Qe2eFhcAenODQMCMMo2YlhrQqwk5jIPq
   1CgiSOW89N4YPdbyweirKCzGlZvuuKBbfLd15xJC81dpo4mdtNKpfQ29W
   /WWPUx+G2BIFK6WTlDhKUpDyL/xVf2Pnx+1pZO3yKp/Oe7tsuNX9WEPTW
   B/ZNThpaZG+dJPHW0g/RKKewSsj3VLs8NtOhZZqC1iZOKo9RFd+jCqdFj
   w==;
X-CSE-ConnectionGUID: swtC+MloS9yD24kzaGtr6Q==
X-CSE-MsgGUID: dKqVp9vGSGeUmpaNnML6DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56140985"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="56140985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:47:17 -0700
X-CSE-ConnectionGUID: YsZV16CkThC6KDfaFg3yQg==
X-CSE-MsgGUID: dsTMUagBRfCK7I0Mndjg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="131231854"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:47:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 17:47:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 17:47:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 17:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDjiZfhX15IT4mfcjvHyymI1qatjoEm5NdxeGkaLN1Tri3VxIXG8kf19ovDxlUAaOkkFy1CMgA7+aMLRHUdj1KZfefeu4iujrdywZdxqgH/mEna2t5jBTzdEFgV0W6tms5pzlCeU8vxbA2eALIMqnTocpUzhjKTz70iMqTecsMZlhdrEIF9BLmT13y3AkJXnhzrXx/WoN5w2z0W5BA71pNt7M0Q97XqyxCrlrX8HM41LsGargZPPF/D95m1B5FY52xgtxhVuZQb0JPqo2Wt5kVJOVOddaj2fu7DlVzXn9PBAlihXz9JOAs3HHQQYFLrhufIskW25w9rXqUbxuCl6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQQHuQgwA94WKkxM2uA+rtWh/Fwci6jwW1ak/ig1RwE=;
 b=wcSphj2cN3jOUvE5xTAEJ7Dr2xD1LZ1tzfeMovkkt0a9s0X4tFJvE5DJco7Xa0j5sUu9ZP61K5GYh/2H/fng6L2iCxE66sfpN/lkXp3QaG9I2VLGsY4LDJ8xg8PbTvxvHgWoZsZd3iOgv9B7qF/VA9Jryuad8dcSGromW/w8M0sBmBaniLKyRCslt0ybqmX2Ar6hBV4q4bFoSXd/H6OzpQF/CQFKc5hv5tMsIsgjmbLllbWHqfMFLoXQfo0ieF092pY+gmpkJVuVwJdizKZHIXApQSlsDw7ZR1fAZTGLKuvLEMr0kdoffcO++13XDhQUOev1L6K+fd4atoghb+cPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 00:47:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 00:47:13 +0000
Date: Tue, 1 Apr 2025 08:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:objtool-werror 3/4] check.c:3538:10: error: no member
 named 'warnings' in 'struct symbol'
Message-ID: <Z+s3iKYoTPYXkLq2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 748a956c-8660-4f36-8523-08dd70b6bda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I3WglahU7Ed/+RqTPyMNUKoz0J2BREgOeROz5NWyWvAojV4XbC10Acw5Z3W8?=
 =?us-ascii?Q?rhCRzf/0u5cthMC5B3fmHXa9tisGsodeTj1Q21rys6hpUxewylLTkQWLgsS+?=
 =?us-ascii?Q?h/wlfymNP5bBlj1uRkUXvXOzVJGYua4y/bibcPp/NuWQHwoKObCr5YAVULOg?=
 =?us-ascii?Q?QrRvdsq94dOgHV0bcjbWbGZcjT0lgJWfvaV1CgbpI0/NJXOcuOmjon3ExbWG?=
 =?us-ascii?Q?ufVIvFj7hj6ywz2KFrptMnXwz5lMicDgWhAJF6yk2NT/2cnfusTJdW+KYkOG?=
 =?us-ascii?Q?hInkqwoKhuo9a3RI4XIIWmjYR1xpliYkQsdSs1Mzvr4mxZpOXYGq44J4bo0B?=
 =?us-ascii?Q?LHSu70olXRn/h/w0bNbyMLu8g82ufdsOXQRIi5b+AunraQ6/wUNoiE8p1pPY?=
 =?us-ascii?Q?md1QxVgKLdbJXXKUu7lbh8sgqO94JpvMowjsFfLI8zARrYuGdLZ5F/wnQ9ws?=
 =?us-ascii?Q?qNTiMvaQRriaB5p/gKQ+0yixm1YATI66ETd+l3CMaed+4yVKYj9L3I/U41BN?=
 =?us-ascii?Q?sxjjOKmxPJvWjVp9c98VTXRKE4cJ62QLUuQOk1iidHGtfBOaKDXl3fLYtx2F?=
 =?us-ascii?Q?KERV7pgXbduQPRKrcYXfb1phDnG1z1oXRS4EZssq3DoHEnVDuO28Y476arFp?=
 =?us-ascii?Q?29/j6/XJu3Y1eXpHkAJQsSuqLITb5mn5OKnlRbirs7+2qFAeNQ+y8W2PTZjA?=
 =?us-ascii?Q?J86ABHXM/ffDXssYuqycIVxbUqnKso09fy6wzOzmTVWjGHIFwQI9+vbZ+vm5?=
 =?us-ascii?Q?badb96TK9JlrreAukYtoKw/ZNy4jYPFwN/WsY/XA3i8ivImYBLwUMNVgaBLg?=
 =?us-ascii?Q?cD1Ul2PuIRxExfp1WhBZ9XigVrLVzi/+jMrumzgjllxnOip0oh8yV1+xsVE5?=
 =?us-ascii?Q?uhgxCzhKZ6YsCJE3U5Y2oj2fW+V784CICQ3Y+wySN+IAPq1fvcB/d9iat5ld?=
 =?us-ascii?Q?K5fG3MrhiQGqXBcoRWwfLSG6/Ff/zhKGgERoiPCWJJonmDdwBUd+k3Ti2Dc3?=
 =?us-ascii?Q?jkkW53mHvPUch1wmV490cdPUcvRlkiRyBMy5aap/qAuP6HWVQWoToJiYXDjW?=
 =?us-ascii?Q?TF/Keb89v9nXktzYHo4ArtM5xarJ1QAhwMDuVANf2cTIBKt6gtmVC1i77WYH?=
 =?us-ascii?Q?ZQpLmEEK6RGJIiQGrGj0GVV7Hve9AzNpGgoV2UjJSrEyFth4D9qWG6dRaki6?=
 =?us-ascii?Q?NOh346EtSfEAjoetpM/MY9uBADSW80lrdmAVknDaAxctUvP+WvFrrBztRYOY?=
 =?us-ascii?Q?Od1iNGjVsraHWK7shi/Znxrm+7I6WhbUN1oaeFnWiU5kEELYWgkAgYLVfDLa?=
 =?us-ascii?Q?F44P/3kGzCIhUMsgjIuCYJSlU4JQt+xiht8W8gnNEnuIUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kg+OpAGiGbdklUWZs9fg0KTMTs0WUKj1adFw/d4Bb02mopAvnNIgfDksVKj9?=
 =?us-ascii?Q?pECjjxmiKs+HGISDktnvZtArRxIVbKklWKmx0F0RmgY9vT4qYnQpnyjgPH0G?=
 =?us-ascii?Q?5S3XDB0h/n3g2Uz91BTxceQsrS/sb8FZOTo5akODGbg8nc7J83BoQRg5ohhO?=
 =?us-ascii?Q?wglntM6bHuvSBjvHtmCEPXI9VyPGLecz20jSQM0w9+nK2mVSUPBkDRJZ2C+P?=
 =?us-ascii?Q?Y6kRy3d4TbC01VqxjPI69H1+2aNNZctT0aMVnudG3qnRG1WT9EAl8+XpP3FQ?=
 =?us-ascii?Q?NW7yxfo0pjJmd1IgelOWIOJNDzaNjf3HygqR8SKJu1cOBC2+ucuBHo9c8+fR?=
 =?us-ascii?Q?9+O732zZvFE34EFJcnAJbNkmvCuRJ+79PDBpfR+/OG8WWN+31ik0Ok1BliYO?=
 =?us-ascii?Q?z7QZvyTxD1HhLes932ZR4GOX74hF39QN6J6D7AqjK3Vdv2FZ+Sox15olB7Dx?=
 =?us-ascii?Q?hSdnJw2zXAvi6ylnPl5VZhjk8oYejmMroOpXJrjeuRy+hYmWrOkMFWGTff3R?=
 =?us-ascii?Q?FaFAiW+VHibp3y0emGERqAay8mJa6EQsa6jG6EpiWIGsfAJo5fc0cVscJcVH?=
 =?us-ascii?Q?dEXBkwmWId14WXJL39eojviFFqb9XYuT8HjgPD/sP+0xJpiWUGTZYlVNpnk+?=
 =?us-ascii?Q?f4K5Vbb5icStAbfQU4Erfn/s+QXCbBqS31eRIIoTBO4epHAFS9F5N/xEaM5Y?=
 =?us-ascii?Q?f/Y0gXRfSo0aAYxEqav+exV/7OPE/kFEjqYHUA4i1P+evVECWQk2CXhfp02R?=
 =?us-ascii?Q?0BljIGeo8819fsMpEoLbMg3yWxmIHrpfEoAu+SOJleBkI7b+9mz5GzNxMGsk?=
 =?us-ascii?Q?nzTdBQab4wSZ8wM24NHMf1TPQyXEOfNwkvKTf4DhM48kyfxFhTONpbSG37AL?=
 =?us-ascii?Q?9awtAmFPdssUVz/oSvsm3FBCBMAwRBLXawg8Ro9itJkG8B0CjXsWwcMPkfdb?=
 =?us-ascii?Q?lywFEdf0hWi6flu6d/+2OcM6ZToafwj/+fdguukI740ZlckmYn6ykef9p0oE?=
 =?us-ascii?Q?mtamVzsekJYPhVVdcf20TQixbvkraSYdL4zzxQdaKEARGQ2GEaPhdy+jz7uq?=
 =?us-ascii?Q?iy3Xrj9gsnWmZ2W87EPSfFDbnBgaC8Tmzg8w/BYgyA47BzoeCMY8CBtcDJ7g?=
 =?us-ascii?Q?QvXEtqndWORjdGS5+UXPKwSFvCv460GkRpYEHbBxZ4+tyFB3NG77/gs52b4G?=
 =?us-ascii?Q?3l6EYukWycwKSHDLyBAu/htKY+mwxqU1LFxYgflTJeN1q4DigV81z/f7DCoh?=
 =?us-ascii?Q?K+FvpfFpqT0/2RMxJ+dA9KKl/G8lswqp23X9RXvSr/qBSSlZaB8kEsKV3Q7j?=
 =?us-ascii?Q?VhDojvnmhyEAgoMoqPrQc14x9C4bAIzMHW8U+d9vgC9pQMk7flwyQwteVfHw?=
 =?us-ascii?Q?jt+9Mz1WltBqKq42GuQ4Rk3faUIIEynIiu9VA8MVyx6K7y/xdNCunBZIdiRG?=
 =?us-ascii?Q?RioBsi8FJ4uV+zHtA0t2AC+9GQ/i1GYtw5VjmYWM6OMfYHWwczfcm1NDkLa9?=
 =?us-ascii?Q?iD3s5fClyxodgvzNBoSh/8w9sQB/q+83O+jPMDtCkf19sDjZHvNBy5CzRLcB?=
 =?us-ascii?Q?cXb/YDDWb5djjv72l8vult/cc1V4KLCNkHHcnOLP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 748a956c-8660-4f36-8523-08dd70b6bda4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:47:13.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUC/W/48fQwcrmEH1X1qi8u7IoGLEH2CJXjqYEr0PPYnR1d3uzPaeRhXJf41FpPuAsvd8Q63CmTbJVB8sozorg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   fed6a8b43d3441f6b9d0700b429bc7a686023b9d
commit: d69b7d42d9b26e320e50855413577be6c3b51a35 [3/4] Revert "objtool: Increase per-function WARN_FUNC() rate limit"
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: powerpc-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504010444.FAFVZ3BR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010444.FAFVZ3BR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504010444.FAFVZ3BR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:3538:10: error: no member named 'warnings' in 'struct symbol'
    3538 |                         func->warnings++;
         |                         ~~~~  ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/check.o] Error 1 shuffle=1485354277
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:65: tools/objtool/objtool-in.o] Error 2 shuffle=1485354277
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:72: objtool] Error 2 shuffle=1485354277
   make[2]: *** [Makefile:1438: tools/objtool] Error 2 shuffle=1485354277
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1485354277
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1485354277
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

