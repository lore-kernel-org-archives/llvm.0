Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C218E750;
	Tue, 28 Jan 2025 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738067469; cv=fail; b=ML3yBY6TQMi3SVAa4iXjeHZ3uOjKcZwHb0wB/u8wcET2dQYeKMv0wmdjycMyDSH0PJYGIJmspuBANCye4Bg5o7BzfNa2FyQENLyUftJcy1xVcO45Ag4grfzVOonQP6RgUuLLoB4cDjKJrJK4zRvhxGmYfRwdjkNfqUmvMD8vj40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738067469; c=relaxed/simple;
	bh=uyyHVkUBrtbblEcFykGLMEzkh5SX4skm7XWs42Ss/gk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tKqIJY7tvFQjQCILNCuofx4hf7t1mPpD7xMCn78YG1EyGSlz3epPxWfbJ3My6NAzGcTMZSJAOJ5odq1Pi5+5i/tabz6kL/S/Y8dw88CzKWDa8Xt23qztn3uS40G1PMNX2N1yT+uXOrKzfqz4FWZRtGlzzKcYUTpa3h/cSXZatoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeUSD5XA; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeUSD5XA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738067467; x=1769603467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyyHVkUBrtbblEcFykGLMEzkh5SX4skm7XWs42Ss/gk=;
  b=XeUSD5XAQxy55e+ZX+SnUft/lpw2gh+krvdKNrYXTEjtj4loJsmwoaA2
   cA9llI6oFGtdYvGNd/VxcI5oSW+A50zduzgPZFnhEMDBPHIVbkQ1E1Rf9
   94PskcJ0byQ06YRqa+vuqh0nZeZqJEuKPsS+sTrB1JW9GetuxfRVU8paJ
   dRTQ3u0eFybxmxxCMejCI2tLFaP3peNFQsR3ytADkIxNgXscElg0D2mnI
   UkAVLCHCrGueKR7fzZiMEiv8n7COipEJEpCs+rQi6Uybarq6wBmSI7wQt
   cDsox4Jiq9pudxgtVpgYsLkZDF/+EVWYpIfH0r4LRiylw5MOzEhnJ6CRO
   A==;
X-CSE-ConnectionGUID: BjLzb0/LSPeg/MSdXr0j9w==
X-CSE-MsgGUID: mBkk+OROQ3ChtkyaX3D9aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42307052"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="42307052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 04:31:06 -0800
X-CSE-ConnectionGUID: y2AD2MtjSeGknFJKhgvFiQ==
X-CSE-MsgGUID: ltw88yF6R8SXJ860hRnJrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="113768600"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jan 2025 04:31:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 04:31:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 04:31:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 04:31:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqWXTLHUeskOtcIui50lkVChbdMaDz+fsabemhSOUCyO0Tc6Mb6yPDNLbJjg/mtxQebrme9CpoYtAYdOgLkbsnFRzpwuL+i+gSbXdlSSQdt58moVZBX3HJn7PbvM8CeN5QYcMKRhVRlG2pslhXS/yJ/kPIvAy6HpgIucfmKmI5tKIPFgbjI3+qJu62nJhYqzs8fEhT+UkS7qI5XyNSKn3jh8oBo+pxcaFjtSpz8gXYbPWgBdE3QKRf8Dnha/4dp8SoUMdzCHD8vWVCv2petECPQ985hm7ZLTl39zIfik0smsjzeqhPpiWKUQnaRUJhg8Su96WED6i2fzJF5+HEXmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2klQ+/uG3lZqTGDPiK4t7L0NMaZ0ER0p+QCBqMz4Z0=;
 b=rYLw1n+fcWRICYt6jRn5Zpz+8YsHk2V53lyaEAuc/rsN85pqxuNHEXfGPH33TpVXCgpcDiPAEvWhPPv9D7ofaQ3FJ952D2OPxyt0+tgUzFGAE3d8jSjXqhSD0ZMApRN8vjtevBMR1KZOMNJ0bnlUof25M1+9AkvOKlLmPLcY7osabq1blnrsDNFXZtiGn3/H5xWNtSFWSK1RQo6qHowwL13zDlBtqAPMYZXhSbkVTguSXk6mcZPhI+KChzigwCuYqRH3y2+AEj9JVmwmvUcRmjw1rS6MOSf1Itwkru57waT78sCgqOPW3GnMyFFC7YE2hHy5RnoP0FoezRYl/l2atQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 12:30:35 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 12:30:35 +0000
Date: Tue, 28 Jan 2025 20:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <llvm@lists.linux.dev>
Subject: [nathan:b4/llvm-trap-unreachable 2/2] clang-14: error: unknown
 argument: '-mllvm=-trap-unreachable'
Message-ID: <Z5jN47H+TTnGs0IT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d221f9-8e0a-41c7-df1e-08dd3f979014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/mnb9rLe4Msn2KDRbr1hNkBHjMdSb1/SJAexv7caDsVctS4TyqSW2AodBXYb?=
 =?us-ascii?Q?LZvtpP2xFLThLph58uwfeRf60RRtTGqv6O0fJgFll5rUW12BrsONHbwGW3fk?=
 =?us-ascii?Q?4JoAZEuqBxk4LyZWBRaO6vJJz42KjJZMuqQ4bo5Ei/jWXMEcJaaGOc+W2jDK?=
 =?us-ascii?Q?WKAv1nfcUmr/WwoPoKR+tHfeeRqv7rl2ENkykwFEAZ24Hmy8MxkWAnJEGD88?=
 =?us-ascii?Q?h1v2yC91EGlHqxfeftYIzaH5B6lmeG4jnUa/WM6DgufaPo2hBtRSoEsN4/7p?=
 =?us-ascii?Q?YBEoJyqWiEM7S/dPH/wb0ShGFem0f+9nOToOnXwtI/zQPSH12hcYAsSydHSW?=
 =?us-ascii?Q?FSxQ5zY+4BzjqPhRbBj4BCKTjFxdP1e74vK6YoOGH3P8DV7+XNn33GGDdWt/?=
 =?us-ascii?Q?PVf5IqoVR4KC0Bubx78rtSBi6XAMye15lvks8pdJvfbqomtor1rCG2x/G1dy?=
 =?us-ascii?Q?nwO3F7ex5sdnKbYsnizgNv9TIWRW8SiXfnp2JAlJBHokB2kpCbYyk8df+6Km?=
 =?us-ascii?Q?hIR9ZbzMDo5AKOSXDeVU6gqr6NqrP6DKMxxbY0B1AKGmxJdloJHnYrEgCbOc?=
 =?us-ascii?Q?zrcYzjNW4XbogH9m6uyckzEDru0+fjhTTcLUdjfhO58C2l7EWKkIPcpnK7HF?=
 =?us-ascii?Q?PUC5wtmtoVq/HYWh5dQQpUu9VVROOBzT8lv0A2F0qnBVOE0q7A8c/0rJ/sN0?=
 =?us-ascii?Q?NJTv1243FyfbOVRxcBr1qC03s6RqYuHDzTQ0s0vnu2uaTqr82FWlYMn6JoyL?=
 =?us-ascii?Q?6W++jTPGWU4jKfYdsQOsTsp7h6T3LvFsUIB4dBdWvLlsDSgIGsoqEQyiTssN?=
 =?us-ascii?Q?ILaeeDWZ8+9O57i7ThMLJPgWQK/mGQq0NteboZpyea8ExDoWxYlPZ6es76Qe?=
 =?us-ascii?Q?CyagmoSbVXuRmzUyvKOQ3D/4gl5BOyrfrE+Vim8bDRjmB/c4xY+QqS+GsLJH?=
 =?us-ascii?Q?Rmwu5oWJwFBBNEWTcEU/yg0DB2Wroq1msrIgGnw2pXFz+OrR+M5403M82SnR?=
 =?us-ascii?Q?XPElNXNPOIxPMGgdiEVUUcEZE3d1h/t8tY18ljP0EteIjd73I11YfSdAw46e?=
 =?us-ascii?Q?U4JHV/KTnbkQOE5BM4Ku+M2iik9iRU/uD3mA8S4GDSYgKYOJC9JqHEWeOhY7?=
 =?us-ascii?Q?BlganaJhADYXfs9MayooLgXZaSHuOi69pa4ef9a801ipgu4TgPCRddqdNHI+?=
 =?us-ascii?Q?pHWQ67jwP2tfwYy98kjMCeVZcLx97pPEhze8Ix87Jl0iraXY6ol6wvdPoD5Q?=
 =?us-ascii?Q?Ubc/eU0j8YV9JxvbYDmpqoKU+XxtDV3O85Ad6Dh8gi1Sw6AZqvCf3kWJh5e1?=
 =?us-ascii?Q?M5FavlrwOXEMZGMK2pNkRQMMdCCZZ4bAO1pkiHyR2R8UDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Q5+gApemPFCX5v9yaO60qQJc5r2TGK0fR3b1kYzqNFTnx8Usyu9YMbPxiq1?=
 =?us-ascii?Q?9kvrbX2pkRIRYC6YKNQeBSIFP+ZzD2sFWolhbj0ogywHZwGLxHR8hsJ7grPi?=
 =?us-ascii?Q?/C6ud5WppquQE/DHjx0+YzJO+LjVP4g5XpmigJUf0MpMbqznp405c4Cr6Hbo?=
 =?us-ascii?Q?vt2mKZpDQCM/BCIKZ41KHNsar+UbX6m84QdzfT80jYS6WHV0H95a0hruBbwF?=
 =?us-ascii?Q?YpQTSH2y6GVtcGb83un5wJoLh6+Dek1kpSKXzUhY1WpZtx5K8oB3vz1/1WbT?=
 =?us-ascii?Q?Fo2KhsmXQrKn993MnYfk+2bIflWPLuCmhXVlCpOmM8cURQOlL+3XKTl6quMi?=
 =?us-ascii?Q?FIzTC8oiMMBmuTCboEUflPHbY9+g1A5/78SndKxbzYpRA2SBbVnwsjpEQB1G?=
 =?us-ascii?Q?ngWxRATpbKBPDYxNudsk/R57XhJ3Rm6FCw+JVd53C/Rs58f6hTde9vyg7eMZ?=
 =?us-ascii?Q?SBN1CB6ufzvCmh/QLl0WuT6Id68PsXR+NCDRDys3wqYdUj5nLg219fSHeaUa?=
 =?us-ascii?Q?ZUemSOZus16guH+9XtjVlKm0QkgyZQlCJPTZawrfM49AllY1ZIkeKt/FtaEJ?=
 =?us-ascii?Q?qJY1fgOVxOXwA1u+otyg8tP18D+8gsZC/cwOgUcQY5zTD3R+JBqMF6y/lcdJ?=
 =?us-ascii?Q?H5g9Riigi6UTkLd0YWkXf1fwNVkEPWQIO0w3FmZ4b1WoxSX0Zn0A6qAmKdei?=
 =?us-ascii?Q?QGkJ1OZplWOOnwDEWKb6WKeflTdncbn2r+7t61/T/y+FpzXXAqWngYMzCyGL?=
 =?us-ascii?Q?pOEOJO/StG4N0U07v3MyRprZ5RhfGSluBE6Ia72JAKbPzcO39830teWFN9cl?=
 =?us-ascii?Q?Urc2xHnfZo58s3DHhBvn3VMHBwImTDnLst4onimU+5DV63KA/dbMgjsXMn7z?=
 =?us-ascii?Q?PGSmAT/LktRS81j01WEgZqp4hj89YCUi7UorpzE9KH7jwFLZuJ++NdgJahzx?=
 =?us-ascii?Q?22HTgjg4iNvQbURAKUCAi4qz9CSNuj8U7UsX0frWOFpn5xPxnSERcGMx5fqs?=
 =?us-ascii?Q?EZA6vLavApT0CmtTvJxMU8yi/MZavr/A/6wCmD8406JlXCCWT0kVIBP4jh6T?=
 =?us-ascii?Q?Rtg96NqicPXn0O1d1ucsJF7JfB41mdPKnRe5+EI957PJ3W11L5YwbXH5vyxz?=
 =?us-ascii?Q?CDOc44olN1nQ0RPIbcCZ7FAaoW5UQtcKxixKO0deekPCBeczNaSEdULi4hWV?=
 =?us-ascii?Q?21k73BzTW9PSbvM9ztQD+HByjiezq7723jGAGiAfF56ZAF1I/PI5dl5H+3jD?=
 =?us-ascii?Q?Vz0tSdat0fMh1KaHTfQBUXgbGl+01bp7dKTpzKo0PiNeS8raB40wrC1b235j?=
 =?us-ascii?Q?yhA179QoxttAiMJfvpHopYs9fv5WI/Nu04Rr+kfNv081z5wTHtv9kHM1XzG6?=
 =?us-ascii?Q?Gb2ff1gf3trJsmPaSQtQ+G9887O+oxLGTyRtrBWAqw8WDL/IM9KoBuYfnOzk?=
 =?us-ascii?Q?NQ/vud4FoRxykBmlGSdXjmeE/hqtY2zlxDvvo9h1EquU2eEQfeKaxOg8zp/o?=
 =?us-ascii?Q?ejANgMLUKKBOJvlmxWMKYXs2rLo3hdQP1ilPcA9BOtCsArodTA95vgfDOEBt?=
 =?us-ascii?Q?/dfMnb66mSMioCHtdjyOzjSyYqQJSNh3SEarQbayWbpCKgQzvnHc2sDLhCym?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d221f9-8e0a-41c7-df1e-08dd3f979014
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 12:30:35.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXe4uLMg+/zTKL9UFzZmmTMBk7tbkSF6oFkQxqt4Pb8BAf4HP2zf1nxArQrv+uP2PWgUmZFfhDt9RQR6iQ8ygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git b4/llvm-trap-unreachable
head:   58c89b7cf0908b7d20a353b724bc2336c56a735a
commit: 58c89b7cf0908b7d20a353b724bc2336c56a735a [2/2] kbuild: Turn unreachable into a trap for LLVM
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: hexagon-randconfig-002-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281938.BMoGVs3S-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281938.BMoGVs3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501281938.BMoGVs3S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang-14: error: unknown argument: '-mllvm=-trap-unreachable'
>> clang-14: error: unknown argument: '-mllvm=-trap-unreachable'
   make[3]: *** [scripts/Makefile.build:194: scripts/mod/empty.o] Error 1 shuffle=4091035674
   make[3]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1 shuffle=4091035674
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1267: prepare0] Error 2 shuffle=4091035674
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=4091035674
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=4091035674
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

