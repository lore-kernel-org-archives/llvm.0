Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211807081C;
	Sun, 26 Jan 2025 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737877274; cv=fail; b=g+P7/LMdSzo2oyZbUrPAy0ELiJ2aBAxrAaeCUOmhJ0QawPCi+bV2M2OLVoQNLNS/YsInU1eWNVBfgwZSBtuJsC3Oymwnu9T0ydZSong7CR9wSVcN4WMbGkGS9yujEhHp5h+jIP+HWVuaLH8joXqny52GtEWAjpulmCnh5Z4J2ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737877274; c=relaxed/simple;
	bh=UpbWmhRRtEEzE1Reuop65UDOfUHHtAmeBGNjX/wWcUs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Bm4W9dBGjP7o60Yvg2Bh8DzURnKOQiQ7S7HTQ5RSaNYTPIPV4GMei6sgS1Benw3BubJPwfUONKcKa2l5eB+02m93o2TuW0F8Eepf0LD4viCCELHK+4ZygTdsbfUv5qUKbjX8NCHaerbDk1qg3kbciNoOYyn4S9j1z9L7+bwsrqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNeIF39i; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNeIF39i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737877273; x=1769413273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpbWmhRRtEEzE1Reuop65UDOfUHHtAmeBGNjX/wWcUs=;
  b=cNeIF39icQJ/A50fSH+2zr29jE4Fe4eJJGdIORSnR+p9LbDa6gkP7P54
   Dx5tRhGAWIEoER76BhvaJNIk7QfaaqBgQx4PgIXxM7DItzbSKkOTJQsOV
   lL0OJsmt46rtXDIq21yuDbP5fz1I31ZPo8q025bzuqMS5sZM3rvKcSqQb
   QQopL9RCXEvYwihJH0kTo3N5svHgU5LoIanU3fKxB09DMip1YJRXZaxKQ
   VxPsHWVWKMJmRAJtWoCK7Ie2MuKFXP0Afqry06dWqsdf23TalGT9R2pqV
   fnOK0WNxSaL4d+UrnGPeSg5w629unnZd1yWLVsNYVrQ0H0ld6dLQeUgDg
   w==;
X-CSE-ConnectionGUID: J1jocwNRRV28TA3edD1low==
X-CSE-MsgGUID: MmRXwt8xRIuVAlCVfdo2fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42023696"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="42023696"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 23:41:13 -0800
X-CSE-ConnectionGUID: Nn0qJfGbSrChKUnodgIMlA==
X-CSE-MsgGUID: UQBpGU55SM+F9n13RtAI8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145391838"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jan 2025 23:41:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 25 Jan 2025 23:41:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 25 Jan 2025 23:41:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 25 Jan 2025 23:41:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNqWBk8es2RcsjUo5uvk8JWGHO4M5Nbq+cpCQYa6W7ED9OYgwF5qfretT+TLKFmIECCX28WcIVnUhWpsQHZHGH1iBdolCDBEkcDSfKeOnG9oxkl9MiibhagJsIER1+EvvAQ3L68WXLtBQTP5mHE7AjwJucl+vihqT3a0WEB2iqPSWT28LjA4jV/ODQwKj6kNTLBu2saSOnyo0TY9qLKWqWThth4HWB2TBk9LzI+hd1sy0Yvo3Efd317CsvV2Fq/u+bx2Z1EnnM88VKdUvCVAg22DfeUMzfqZXwtJSOawC6neH9PmxdOFYN0BArokV6uPOGDqKKC6AOid1xhL6K8brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz+ZQHMO9WwHDvYR12sNpLWgvUatX01D2ikDp/kKfJ0=;
 b=PwetlHGNyddFRuG+1idVFaauDw2v+hsvIKBl/y7xBbiUN0MHpmbu+t1M58jlhrGodS+ePSBt/2BQXjcY9MTn7eiX6H6iw2c81tK5A+YcBI8cgpGNbscdSD9I7CToUX6j96wywuUKpdcJIy+gkGy7+/ng8Vl7VEfBoR83bJlUUtK0YT7xDHnpkmbGhUYuj0bIdkrgcrl4FDf2sw7wEnsjuVT1N336E9BzVLvIZ3X+fK8Ed18Lvs0SMgwJiHJOCoCLPNUCCsZsqwItk8lYBdNQQIk8JHOlmiL3e36UGnQJKSt57N7wU/dtQxk/zl1pyuRY5D/AVSPhX2QohzudqF1/bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6498.namprd11.prod.outlook.com (2603:10b6:510:1f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sun, 26 Jan
 2025 07:40:48 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 07:40:48 +0000
Date: Sun, 26 Jan 2025 15:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [nathan:b4/llvm-trap-unreachable 2/2] vmlinux.o: warning: objtool:
 edac_raw_mc_handle_error+0xbb8: panic() is missing a __noreturn annotation
Message-ID: <Z5Xm+RgOCcDquRuU@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f1abff-8912-455c-807a-08dd3ddcc064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ya/fgL3juwpEogAHHSrsCqduVzzyXFiaQZeOe7HGi5ja9cZzBzSWOO1PuD3x?=
 =?us-ascii?Q?Y2vjMIkK462Zx+44i7a53gP8k//Tnn46nQcokJ6sRIV5uI9lc8Lceqv8eFty?=
 =?us-ascii?Q?0cWEfjjnwd2hrC+lS9KlKMRcIRdIrCGQLzyYWaO4vWUXwS0C5SzOT/QGffgi?=
 =?us-ascii?Q?5LJ/Vs4E4FFroT5Bc4+GlxGJVp677ZXPXMRouo3Bsx5xJigj7vZBakjpcWoO?=
 =?us-ascii?Q?SKvxe1vtdbYYe/dVBlY9Sn3EKcrZiJ1LOp+Ria2+Ip1b/m0otvUiUDmpIdPd?=
 =?us-ascii?Q?x9bUN4xdyzEshENPeOxedRfAgCelI1XFogrJz5+rP6RRs5Lu8wlAEoWYekrp?=
 =?us-ascii?Q?l+t8X2QIFBMFKsccpo7t+1YCj73gTyDwbXm/sLHTmHUdqdHZDn+ldyTliS/S?=
 =?us-ascii?Q?DDK3j7gfkAwt9jeasHEfzqbR3WK3GqARHj/2qPGI6HoHryKzljxfhwClgh9V?=
 =?us-ascii?Q?HF/H77V99ImEcZMNGqJxU6Z7HOwohwVHB+l7njKz3YPqslMb9do3MTKxW1nx?=
 =?us-ascii?Q?aT3/xV5qW2EkHyDIJHMm5eaSoEokwvD8rP3Nt31XNFYXA2VNyCoCoTESe5F8?=
 =?us-ascii?Q?N445w3pmDpEPgWv2HusKEAPdI4RTLiL8kdojZ3KBlG8MOOKu7JHf62EzvtbU?=
 =?us-ascii?Q?ZL8vTDJAdKN3IRg8WJP1Cf3uk1RWRuWF6hYvgsaE6IbnB5KrefjaktiuGpAO?=
 =?us-ascii?Q?0pKEtTVmWhlUJyNn6TgfO0FiHkwdkqdf7+KbXUcLZ9zOgVdIaGbWSEg7erbh?=
 =?us-ascii?Q?jlv0Hf2sLEuX2Miu5STSA83ZFJ154D/lpvNopknyt8LxU93qJfPSbElA148V?=
 =?us-ascii?Q?I4y6MGXfovj2jOLnCdIFa2ZzyuqWPBlI/adx9HjsnNX5k6rzYdhBKODbu+NV?=
 =?us-ascii?Q?iGmr+VilziYwkUwuuOph8RWeC1OCklTmHKvTfwyMbMSRFLaFAC01s45/1QRA?=
 =?us-ascii?Q?ZpROyp2nikyjZ2/Gowejrkx+LEbOtwWo4liKzPMCEjdFhTABqDdhvBJtkRdf?=
 =?us-ascii?Q?DPRYgK7fquy8PFgugBNEKzYysXU4a5XUIp/uAuuovuRWeIsg3yJPF3mqb0Zf?=
 =?us-ascii?Q?ahbT8usUvs3CbE0hD83J8H6mI1iNvrDP+Tm4G51RyY84KwxQpND2vv+XsSxY?=
 =?us-ascii?Q?bZWUuzhD4Em+8I+bRMexlGA5QxQDlr0AvHKsjckHD126kZDtzuZhPZ9kszvu?=
 =?us-ascii?Q?NbaQXP8u2oXzCW0l4Befe3ryX7gz+SIYjt29QkPRaI+HPcrhUq7Thdne5M61?=
 =?us-ascii?Q?+yICMuu3EO+f8qJe9wh2Qd1u4wLw6Gip1LXS6aRQZUWk5drwEOPk2f2yIXN+?=
 =?us-ascii?Q?VggGcg5W6D4pB3MWiXptZloSk5HcSj3uCvwxVHlnn+gsoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FMoL4D038CBJNI9nuVjgJPTojMvuuPdW6ASIYoYpdSHVopmW4/jD5sW1rtGW?=
 =?us-ascii?Q?iEHwEFCdKTnVFeunNTd15DKCyyCIYalbPxue9VpR6HvVW4Oc99+hWPFYJWUo?=
 =?us-ascii?Q?MAEOGsFo+6VdrYQxmKC2TJ2b8ymT5KzGV841XOcW62B/Cbb1k/WDFkYwGFk6?=
 =?us-ascii?Q?G2E8sDz5tiTO62WKCe9Hj+ovhcPpXV3yTK+DUVSkh+ezy7N3tqLxl+uaKFD0?=
 =?us-ascii?Q?SzZ4xwy2cW9loHm3fBLy1EhtF1e9da1pIfBiy6fbOGwVEGczuzBrd1HmTGsT?=
 =?us-ascii?Q?eWnUdqGdhUDaKByj3DrtpSeHASHGcp5rfC3DuRqQpUJrR2Eb/eDaFgPJRk3N?=
 =?us-ascii?Q?tfbFTlIj/cl3CGiRbHVP9LylV2nAuBVHtaR5uIcgGSW+42wCCNowKRejkquU?=
 =?us-ascii?Q?26Kyg2RZh+69jioplIoFIFSyjC29tLXHHCs2Xj1QLNKgN4xMJoEy4X6kRuP9?=
 =?us-ascii?Q?l4155HEMBeaYS6wl37menx/sZtCWhweTEwO+fzNb0GWd/iHQLPYGGg+cTmNF?=
 =?us-ascii?Q?DIr4zHdhvAMWLqObMsc+P8x1AKYSYdMJkbdzIMgYgmX8RnpUJVWrHORwAkD4?=
 =?us-ascii?Q?ShkOp9Gn4ERL4RhfrDBHg5gFA0/n3KCgev2y0r9IMmNd+hnjSytGByC9dat2?=
 =?us-ascii?Q?NWOTI09cLVMUCF0UU+ua8VDw6Txj69ve8Gye8fy9SNWrK4fF/bIE09Nwdpst?=
 =?us-ascii?Q?nKQFD6U1AqtLlwwEI+gZpACiF1yJW5uLruPvdVaV/i4IVYVB2qmIB9HxGBeE?=
 =?us-ascii?Q?lZGiyCIkZS40WY9SmVgaU3YFwz3aAO/nsZW2dQ6RCgvaNSHRng6boibaCFZr?=
 =?us-ascii?Q?b415ZaRseK5aXhbz4gYY1YbanybfVR89Omh5H45y2VmKtsfpSEeWUL1R3MCh?=
 =?us-ascii?Q?eLv32fqnNl6vVoP7NBcLqUcaceMxE9J/eufEATLtMi/wybbMvlHd3Vk/4pOD?=
 =?us-ascii?Q?vNPBu+xrJJ01GcCwtpuVF9O2CWdKKQ2gG4SVOPDYBdbgjH8z6O4Y+waeX9Ix?=
 =?us-ascii?Q?Ovb0QJwn4sn/g/fgIusGyJU4o33+ITPdptNH4ZsfnyxYze9ugfqk/OSg0FWI?=
 =?us-ascii?Q?V/P7YQe9PKmZgxfRQMV2wPWhp2u6MDj1NoQ95qKkEQ+w0awNskLSy54FrjYT?=
 =?us-ascii?Q?ky/tllHd3YPfWVxyyPo0APH9fFR0Il7A+ZU0L58Eftsp7TQ6IlSaICCreM7l?=
 =?us-ascii?Q?EoST7r8e/PMmLX9x8VG80rlyOruXQn2VQk3sHQGWBpsuni2gVTeFSPGCtqgZ?=
 =?us-ascii?Q?3YFfRL+1oELMamR4tkhL15aqY7p3z+ZpOTC51YmLsGCZgK5rqmhePoZgYeSZ?=
 =?us-ascii?Q?sOPVz2zgEceot8seCh83fZrPxViDNmEdSjA9c7uAa6D9ey7DG9/3juW1rOmh?=
 =?us-ascii?Q?v7p3vU22nCkxZ94Pz/O+yKNSb4Y17U4gsYiG8mZM8+6DQdNk304mbubFX5+c?=
 =?us-ascii?Q?Web9AgBHrSu0KbhI0BuUwjyE4K9YXDygA+gM8KwUPpTvqJSdN0hpOV1qjB9a?=
 =?us-ascii?Q?wU9biFIAc5DguT8f4ee98HSSjwoQNI+ugGBwXXgf3FzsEN4ZoLFaLrRXoYud?=
 =?us-ascii?Q?R+AsZuBEYxwrj1UescXQguEZTwKhhvlYFAThzoC7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f1abff-8912-455c-807a-08dd3ddcc064
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 07:40:48.7212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6a9L+SeWOqiaWxqw3RwF3e5Te2idlZSHDTUCqusR3n2Ct6C2RZBpUjsdGmnvrnANDBFxB4NOjFAHvK/jtA4Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6498
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git b4/llvm-trap-unreachable
head:   5aa3e312a14a904fe3a91d3e0366007253c52de4
commit: 5aa3e312a14a904fe3a91d3e0366007253c52de4 [2/2] kbuild: Turn unreachable into a trap for LLVM
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-buildonly-randconfig-003-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261557.8NxULEFI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261557.8NxULEFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501261557.8NxULEFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_user_addr_fault+0x6fa: unreachable instruction
>> vmlinux.o: warning: objtool: edac_raw_mc_handle_error+0xbb8: panic() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

