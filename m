Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705921537C8;
	Wed,  8 Jan 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736316998; cv=fail; b=Q94osVa+aAVxvjixAObzvaAcO0PdqVRRgpXjCIo2umO0CVbhos78UpBcXJYRcki5Tcx9BE7AeeJHDwtGqlpsM40xgpOBSzp2QDpIewUmpLOeHWoZUv58/kqxTTuktAIHMG/NAe4nn/BdmiBEQxrj0lTo+MAyumgkyVq3eMwtbqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736316998; c=relaxed/simple;
	bh=Gj2Gh4dH7lx/XsaVLr/jVGgVVx6WbkCy0xFedjN+MFg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kUoHmSAmn1Wv0vbt4EFKZ9QrNMclijnL7A0HV1uIgjdZafDX/WeeqOKHGxd5pILkgEpGhgYlABhiMRXSG+LkpJDYEDpmXFiNOW/PeMjElJTs6rrRp0Eud3+rA381KM2GSJ/YGKnFXjNMIO1DS9S0Wi9fRANHwwzbfQ2jM5WZa9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCUv89gl; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCUv89gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736316997; x=1767852997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gj2Gh4dH7lx/XsaVLr/jVGgVVx6WbkCy0xFedjN+MFg=;
  b=jCUv89glHYrzQLIMeP+ujmgGc64AewLNXxf7TIKasdLd3p59KgTaLieE
   olhCrUG6ZcaMILSept3Vq16qybYIzJH+zbZeLOzNwWkMG/Ivhn+DcyGix
   O9YYp2ML2OwnOQYRxNtvUVJDlLn8+MuN6ORZM7eXyWKdkEk7iE5Yo2mEr
   MV8jYoxqglTbj28LRezg/IL+pzkigLsMrSjyN73FBBeaPrmYY0Yb8+Ya9
   DolJW44ga/OohulBDPd9tP9cVbvDiifo+h641Ygm56BH1XJttYSAI2s45
   kjqv/oAVFCaH7RApg7PhgwYl1PihTL+dTCXVdY32UjJBsjRSPW542F7S3
   g==;
X-CSE-ConnectionGUID: hT1L7KAiSuyHF/mj6DCobQ==
X-CSE-MsgGUID: NqTGrT5+S4+y9078mBox7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36745468"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36745468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 22:16:36 -0800
X-CSE-ConnectionGUID: I8Q4hiiiRhifuR8fTC0dNg==
X-CSE-MsgGUID: 6ps67lcFTX2cclXMzfSzdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="107979650"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2025 22:16:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 22:16:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 22:16:35 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 22:16:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+a06tn9Xx3fRiqFkXKQwsbBQ0xypv2wp5As30W51rBuT66x4X4MlkfD+2ibNPXMtkcFuvANdzWrPpnTEZ1pyU+OjyEDN/lV+Tf0wVP/6lD0BahGdQr6FJYN+JiilJDPPFjuFU5qbuCwSun7dTH/4VSsn2qfToAV+BNM0RMWmSDZ86v0mRGOE2a20c6KNP4dpszbh0dR6oYHjGzwi1fm78yKROe8iEJvHwxYCECQAjrRe3xIewojgRCxhNjvUpNMqGU562mPPdRmip/iOC5272D6OMXpmySZDop+eL4YeaCuGGK993v9xWaa5l0J3m6wZzoQRpVsoI8x9tZQApDoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFcSfAIbSdUlNS1im6c7rbEVZWndknzY8tF6F1xfUvE=;
 b=pi864+xoWarMMmjvwHB5CAa29+8V2bKuwdHtGxWoRBgPFmviXLZzltJYxz4vFzkNyhHV8ZTB4mRrQCjhAHb+oTT1RNAmvg7q4SQxHO3OuCCHcVX+qv5arTSBQWbS0oIB/s4EeN2l+Qa6wk8+yBZiw7JJ1iD5txhbngJYMIaqz2ZMgKwW1lxPF0qmCHu8w/fh/UTT5VRAHzLnWWTshKjzqE+y3BEJsPjyyG5IAbdtSfKPOIti9RB2t9mMUz538ill20fnP2ho/xAcNfdgsRR+TxX4/J5/DmctxoI+DoxPxynC4Kk6cHqIOY201LGjxyv1JzNIIJWgTBF2E1jE0fuVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Wed, 8 Jan 2025 06:16:14 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 06:16:14 +0000
Date: Wed, 8 Jan 2025 14:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-linus 11/11]
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: warning: unused
 variable 'tnt4882_pnp_table'
Message-ID: <Z34YJR1iwzcbAGFM@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: bc715b8e-5694-4c57-8ddd-08dd2fabf465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yvCGnkjbyiWOC5fI7YizzrfAdyST34nrHYc/xMHTmzMMYvOXYCxKV06Y7/7y?=
 =?us-ascii?Q?1/7KU+3bN36xRalFYIvEHlCPxVpHDfxWf01zvOiG7tAr26AM0VKcGuRAwj85?=
 =?us-ascii?Q?tg2PEIibmtYcBz8ca8uvBFogVHARM2IiV4Eb1Ynvy96EJjDW7tHm78xeRv/0?=
 =?us-ascii?Q?L6ECLjYPo+U/414demQL9a9qmQ+JtAbkHalbHMyr68VGPp+AaaY3CfkaQCj3?=
 =?us-ascii?Q?iXzI3dr4gLQ70w0JCbDAO1WpcT9wcYwmgvpRE13mGHr4P6iejwH+GWiQlqwv?=
 =?us-ascii?Q?VcI3BG0pjrjWt2skoT/jj6556q2CnQUwETlD3hKQZPsMgglE7zNz+ZVnfwMC?=
 =?us-ascii?Q?x5EnLsR7XOtzl3RYArQDemjeR3jIR0qrB/lk16ue/YO/rXHkZ3S2wThS7xvo?=
 =?us-ascii?Q?ER08x8/NTI+nX7s40m5mbERhmAMI7bKkyxOb65RO9ot3I6zRjeKTzDtQ2m8W?=
 =?us-ascii?Q?aCLsm6H8AHRyqZnKILEjaxnmFUjj1yXWn9L10YUZtrNooswZguZOUEO1YZXl?=
 =?us-ascii?Q?qOTkTlmYUkZxPxtuyhSqDu7qrzfz28GLMIMPh0DwKeAmcyRCff3wji9/pEUC?=
 =?us-ascii?Q?uhCUggpgovTZp8DXE+P4kee8RUKQFtQCTcuEtFcWIRjE/0blmYZqT8iMtgoh?=
 =?us-ascii?Q?Zi0dXNEp9U88AaV0kkbpNR7e9OI8hwsA9LhC2caiNFh8WnWP/MRzURNMjaPF?=
 =?us-ascii?Q?QzJNbQ4CpLb/IS93OE+y+Htbwx1XJbuo/j/67jD7sbGY8Xx+Gm9oDkaWUoBe?=
 =?us-ascii?Q?NqX8hLAzQLawczgVhioInj0dSPlkGZLK59vDW2z4Hqy/WkHNl3XL9NBPnQ+d?=
 =?us-ascii?Q?L39GB1R/HFmhgUs45+blfQ3lqYBYUC8rtGkN1bzbG041df9uhxIYpAF2b+P3?=
 =?us-ascii?Q?L+pJAaFzGrIOhgrUoETAPo5dYh1X+DTatnClHZW93Hiw4JDWZeGkFHAl/T0n?=
 =?us-ascii?Q?6rH1EFj1cOoralXmYPjHDzP2V+vhMQ0yJtHtm3yNCK0py0Ti1NJRMofHPONt?=
 =?us-ascii?Q?VCMc2mWsj7nu6H/jp0EwWGQ5E8qDqhmk0OyHUVXRQSw5haroOpBlc4SKPVwe?=
 =?us-ascii?Q?/YVrCTrKeKCxVFXUXm5YCUtW0ObofHajPlAxQ3agn8J9NoFgs1AihWIjRH92?=
 =?us-ascii?Q?O+nn6og8G7HQRYHz8HcVmpT7NW6whfeSaSCFMgE5hxhQwedXk6EkUF7hGz+8?=
 =?us-ascii?Q?fqbZkSzvM0y5fGMsG/gfQbSxI8qjxkfNr9+oH5VyUUWTB99tYypd+xg51p7y?=
 =?us-ascii?Q?enUIUBHaW9Pep3La4gbqQQvys2SSPlrrO0G/P+1AYWuumoEnT66I93gJlJc2?=
 =?us-ascii?Q?nDqrPs4PVkj3CM70cz3ODr8U6jO90iFJQBjOuE0yISahaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TjokQnK6CucDaIfErLIvoeL58zxqlI6P04p+Sujs2o/peKO/IkknvTqwsLif?=
 =?us-ascii?Q?TyKyn2HsiWYu3sU/zH+pPkj78b9Jb+2fqYy6IWIKGjsb4xq2tU9KxRRtwJgR?=
 =?us-ascii?Q?mNquJOaCyC5E1Bk4v6CEpyHDkdFefTVvSTSoiXDGTrKqETvgtYkAU58R/zIX?=
 =?us-ascii?Q?rAhb8aJO0+wlryNarBl73RnLyZ4HnyOpmwmp8PJoDeX7KgQA1vxBAwutTsLw?=
 =?us-ascii?Q?if6FvIbRiURF7UwAjy5n8QDUgcEA0lYeY5vPuatFOOnqSHHe/tk6+g4i5/EW?=
 =?us-ascii?Q?XtFQcW+obm6CigsrWi0QntGYGL9of1ZGPHp+ymHvY92PuaSs9OQG8MKlbd8q?=
 =?us-ascii?Q?aZYPV3IypZgodnfL3Y8YWSFBUCM0CIiPW2CuphHsQOVQxjPS1HOzxyLNNhLK?=
 =?us-ascii?Q?dOuzemKzXr5oIV8WSbtT0vpkXDBGuGOMG+1wMGRirJVFQm0c66M8vilZBPov?=
 =?us-ascii?Q?kifsrKunoRIONoUCjEi+ScZIbYQ+slhz345+PPygfWwbCP5oBM68tZ+Sk2hZ?=
 =?us-ascii?Q?RJZWrY9Nt5jj190vCFQxXqS6aouMrHL1QlGgwOwhoETu6l+BdgK/hr75tdkJ?=
 =?us-ascii?Q?Z1H7GqH20hO6JUyd2y50qJnkX4+SYLyFk2qfVqWl17t503m5YZthxYNC9AT3?=
 =?us-ascii?Q?XiAnY+elcUCk/8FR0EgN9Td0P5Ac/HTFg+qui30xDVmkpdd8YOpdHY5L5EDQ?=
 =?us-ascii?Q?98lHuwErwiO5prYB0Ua6piEdVG7CWqDxpQJnI2USsbuBs8CcJ2n2Vum8/Buo?=
 =?us-ascii?Q?SNlLATdEyGNEOEEGrVkpXx2tPOkvT51mwrQk3aexIIi2CQu7lwsPEDmiHSXe?=
 =?us-ascii?Q?rgBjWsJaqumXJfjmyx6OMB93JLh5jN6xH7mYue1Aw9exe38rL4ochkuYjXxC?=
 =?us-ascii?Q?/TzV7yYvf2f3N+WQ7DRzPmdoQCBwW01nQdGy5wSWAhEBtdnA/Zjkm3XOee5X?=
 =?us-ascii?Q?uUaW7G+07uxJHY5T6r2Pf7KEhmOOehxM1DC00mrJJb63YdMOzfU7nLOXuav5?=
 =?us-ascii?Q?ZfqeEfR56+3zUtVtgPaA/KCRNSadjLBBLZSfyOpTwU7HzFg2eVY3cDGMMwzn?=
 =?us-ascii?Q?1UNQ9YcVroIeRfhHP/Yvu3Y6T2KyI/vDSn89PAZt+Z8zMHt64Vtdgso5fAJL?=
 =?us-ascii?Q?dtGpAE7oXk+6q3tLR5WLxu+ToAZb8TaCDnIvFXVB9cOhjWxwCrautkeX+zOK?=
 =?us-ascii?Q?crh31MmN9NDgdTQycE32ltAGkcJhCWZByizarPzzAdbXHGT9h/5pAnT3avMM?=
 =?us-ascii?Q?J8txZ4iyweAoioJzdSRPkBwNGmI0r2n+0V/OZcdl410dMNJAgS2+kVpczsva?=
 =?us-ascii?Q?FbUulDM6D56DahmdrhsZbHzJe2maVBZpL+KSAQJUEI80tGJgbNqZ2ZdHSwRA?=
 =?us-ascii?Q?CAYxecYCsHiCpCB7KYhfDkBCcwsd+wJ3BzUHKifbkUjUzqAVgo9IHGcJhexS?=
 =?us-ascii?Q?bN4qHk3MzKcv9KQZo7QZPrz8Qm3Jlnb/xi6kGwKYhhDrn5J9aAg5Mu0fUiU/?=
 =?us-ascii?Q?QQ+uwms1BHm9kq0UpjyzXP0aCa6sb5OtBv7PTU1q33kXDi6IQshseYdjzO/H?=
 =?us-ascii?Q?/cSjBeUm5CgM0IoX/yqlcMpvw70T/BVEXyS83+vl1+mNXDNgjMpynUuBKJpY?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc715b8e-5694-4c57-8ddd-08dd2fabf465
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 06:16:14.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RV0vJ8KUCefxmiF8hkahYvBlTLaIlLg8mWPABfkgYD4C210yiPukJJfUEVWe1BY/BvEwI+b7fy7CFqivTVTx8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
X-OriginatorOrg: intel.com

Hi Lukas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-linus
head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: refer to correct config symbol in tnt4882 Makefile
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250108/202501081213.5vHUhT8P-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081213.5vHUhT8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081213.5vHUhT8P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/gpib/tnt4882/tnt4882_gpib.c:762:15: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
           unsigned int retval;
                        ^
>> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: warning: unused variable 'tnt4882_pnp_table' [-Wunused-const-variable]
   static const struct pnp_device_id tnt4882_pnp_table[] = {
                                     ^
   2 warnings generated.


vim +/tnt4882_pnp_table +1507 drivers/staging/gpib/tnt4882/tnt4882_gpib.c

0cd5b05551e022 Dave Penkler 2024-09-18  1506  
0cd5b05551e022 Dave Penkler 2024-09-18 @1507  static const struct pnp_device_id tnt4882_pnp_table[] = {
0cd5b05551e022 Dave Penkler 2024-09-18  1508  	{.id = "NICC601"},
0cd5b05551e022 Dave Penkler 2024-09-18  1509  	{.id = ""}
0cd5b05551e022 Dave Penkler 2024-09-18  1510  };
0cd5b05551e022 Dave Penkler 2024-09-18  1511  MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
0cd5b05551e022 Dave Penkler 2024-09-18  1512  

:::::: The code at line 1507 was first introduced by commit
:::::: 0cd5b05551e02242f9fa15f1e87cefff9efa3080 staging: gpib: Add TNT4882 chip based GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

