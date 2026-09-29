Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F83ACF01;
	Tue, 29 Sep 2026 01:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790644231; cv=fail; b=Drzqzuswq1gbPsYr7iGKEd9eltiWu+Glf/BjjzCQRmscQYORA2vODHJY4c/77x+s2pwlPP7cUKNxc2XVhlSfYH6ERs0UmaobHsp6BsGLpPmwtjeoN5WZiA2yhQZ80e7I04FrKIXBNbAAdlwnE5lFQqlOoUEQhO4O/Y1/Wd5AD34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790644231; c=relaxed/simple;
	bh=zxfA0kqYxYInIKLDR7ozA1L0aAjLz4QlrKrxcMvz0IM=;
	h=Date:From:CC:Subject:Message-ID:Content-Type:Content-Disposition:
	 In-Reply-To:MIME-Version; b=g+l/DsIODuptx27k4n5xuc2hjQFeQrngFGhOBiVXByJBdzQrOQCeVcHSPC0vJ3rGDlBRmT62pbM+HJnmB8u4/xX2pQ5DZYq6XIqOp7nmxPFk/rTdXRS0MUWXKtt1u/9kAb2OOJz77RazuC7UXlKtmU0lwMooTK/eyfTkaYy5XAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaS7nd1Q; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaS7nd1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790644231; x=1822180231;
  h=date:from:cc:subject:message-id:in-reply-to:mime-version;
  bh=zxfA0kqYxYInIKLDR7ozA1L0aAjLz4QlrKrxcMvz0IM=;
  b=TaS7nd1QD3sXs5821VWhuogEYIm0vKZMQr53efgIwp7q52Y6FblUxHvd
   +4WRl9ze/+i+EeyjP0+kRi3SAdt8guF6c5pd4DAHjjaEpkxMIaLvhseqL
   A2yJD+Y9Pk4SWd2/1FhxzBQabVPPZl4rISmYGKYOt8x/q/HQBsogcDqX+
   gGPVMQga8L4SaLgA8iow/x0/PqT4BUEyNAJe3+xYodko588UJBZMIDTmx
   tfPU2N64ub6KZTRYmw4UtG83+JAhyB8X9zDmjANDSYeR55R6pS9Ub6fxW
   f6rZriphxychGpWcagLXBi3/7UzvfaoLhE1JN3zeqASbDC+ufJF+QpMBs
   g==;
X-CSE-ConnectionGUID: bsY/GcYST7WxN6Y1+DMkXA==
X-CSE-MsgGUID: zyup869ASVOXKvBNrOWJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101877803"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101877803"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 18:10:30 -0700
X-CSE-ConnectionGUID: vSq0qvNxQXujZJRRpbCtTg==
X-CSE-MsgGUID: D72PKZ1oTyOHPm6yMU9v/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274754510"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 18:10:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 18:10:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 18:10:29 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 18:10:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwzuY7NAvFCFM9mrK6jcsEJjxvUJ+AYxYmVTp/DoYMNgTbgrvD8Ktwsoo8lJ6eCtfrDXr1d4eLkNsBOsOpFiHpTpbf1JAm90gSQPCHFGW6UawnqOSwGVCaPOMzJVvgrQvedomVrPsClLMD14Zq0J8zAKoYvXbaMpVjp+CiK7+d6QHK2nCv00HULo0X1KmLPahoQmbnoxU2otn8Tof8kuRxW91PQI7bB0flnAAfx+N41Iw5S7qfKOMoZztKYH9ymwHAsQNviZWfprcdux4RkIODbPf70jyqohGq3pONv33TOb6dPNm/Zyoxao4CQDy3FjuPwjbBjOyW5SmXge/bUxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+pdZYh/CDF/I7n8+n6x/FWHlfuER1itKOBvIno99yk=;
 b=XWjxcqqWqJ/g9m9e5kkBRRT1FSSUhW9rhdm41b9MDNt3rla7fSwtDp/F8YMHKWtrj5V8JlhiuUdA2i8AJvByG8K87s2WFLMoFeGOdh+8tR6NzflrsxxsB5BAnt68U9ubzKdLe/ZRtCkDNJIZwHsoT9xKtM7sHti0t/er8spu9sPJcEIWp+/kVH4GXP3nfd4q5ZS6irW7Nmwu8HDShVrZXD/ycpJ5q37MI9qHfjElDO9R8LaN63cgRx94xPHkob/oqm5wemYbwoyL7QSOenSUVEKe2OlHAQSt8C3yh5FkedxaFHJNFCe+jzN7hrimOuiSD40T5j2Taj5/ciziL73CMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 01:10:26 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 01:10:26 +0000
Date: Tue, 29 Sep 2026 09:10:18 +0800
From: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: net: ethtool: add BaseC2C medium & AUI C2C link modes
Message-ID: <arsP+jisGE3G1dpH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202609290735.6l9LLSfn-lkp@intel.com>
X-ClientProxiedBy: SI2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::7) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bee9df-8050-4868-7cc1-08df1dc671aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rxbwJZPnTNKXHXc/whb2NpvlewKwYe70JyufzEuJQTCxH7yOETzk/cw11l4nHb6BwU/aEHNZkdsudznkHDmsCxWX3DtdOsfxmWodNPD8TgsiVdbojbaZjgc8yudiPxnyRFvcEZdzIkCa4DlBm1pH2A3n/e+inAzh3+Fc4YJryI3yMsuWHU7FY/gEE6JjKDYZh07/2/JBRhxqPtpeoHFr5qDI1aVqhCIy0I0HpGcHP7WcD3S1ih0YrKs43WknGrvEtftUyaOVQqEGLaeCWKwcfyvs9qcAieX8qvjncx/0+r+b+y/g31DxQhYxKpErF/Zlwesce67j6aGazB2bZ2m2l/0VknP0794YFO5nRondszcXvSrSOQOPx57SPOIxC15i/LJjO2zlCa8szoL/eXWq9+ZYQQGrl8ZVElUs7oQAP8/6gDZ2tUMMV+HC2wXWZ6I8mEcrkl+eFfSRVYDg8ktZmq7AwOHO+UyAE+Zaxn5Hf/3hyNdWnoyTyMIEax2Rx5vZXLIx5Yq28sZIWYyycOgXT1SkqaSBk27NnljYB+0gYmWesTp+5cNMMAZZ+4aqHASg1KNoItfYQFiPY1D4ViXhQqsz3AYjxF66Ic1NZjR2el8uK7KhguYBCZQxjbHFHbNm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zqHJuAsGblbZ0fp7MvpFLx8B2hljhiekkmQ0Bh+ME4q0SttOLsrTz/owKhrm?=
 =?us-ascii?Q?OI70YYpE4/qMTo9FgD7Fu1hx8+0tU/4BZlfxjxpXlvxpvRbgvauLePoC+tiC?=
 =?us-ascii?Q?C9eHEec8R/gaMYgX6wl9SaejbBO8jDRvx0+myjtuz5MEdTH9uwO7dUoA5EIv?=
 =?us-ascii?Q?Jcy/jIppyb9u6fAPaHMSpYyJOp3K+qy5CbM5X9q4yGmpzHupUn4U2XXZj9su?=
 =?us-ascii?Q?58SOpZH/AYqPSpAsTWb6ddPOTo9q3mn2CfvIyyOMU847Rahb5CBJrjwCZwtg?=
 =?us-ascii?Q?l2++U86DgIz8MgV6bAXZn/P0o6V+W8pWk2QqsMHtB9NhJ39tDBxBVuc8isqh?=
 =?us-ascii?Q?g7Vi/FqFXkU1/AltGHrhUXJWeV5e+zQORTrZRM3xVVO0+3DfPyS593W56Pe4?=
 =?us-ascii?Q?mXJ6b/fbEHfvOSSpBykwEuLG/xMK4V64T3wOBfylt+6jAjSFp3+uMpUEkvw4?=
 =?us-ascii?Q?bNla/uJzkEM+Ii4Pqm+Zw7g8/IBBk4nOheJgHyUHWKrSLcPjqYV6VqQijkmA?=
 =?us-ascii?Q?jG8vACkjiptHv2BDOOZbhcHIMOju6MqBgKdcT1OIYK00H/+a4LvcpMXb0mjf?=
 =?us-ascii?Q?A18cwpFpfMbay15X4UFe+ikw8adyppo3OHX38RsvqA4NZng4XGTOz9BsBz5D?=
 =?us-ascii?Q?LdDqg/6c7ItYlQVBoHg1h4b9pv3Zjj1Wy/2iXjYMTmB/ACV4wv6bhk5e5KYa?=
 =?us-ascii?Q?9xJyZ1VWWEMXtVS0DlGcIBXSuPs0aZWALOqVmrxMuYdPWpq/vYOAagDBlD/Z?=
 =?us-ascii?Q?dBLqGr/A2GvNIR9+/QsBbOLq5K0HTTeyQFIXWrbM1B8lZHiQC88pr8GXSNvN?=
 =?us-ascii?Q?HSm/DSOSQzvzGtx4PSqlY/37t425uc58wa69FsPaPn8dTrmGO17IrkZW7Wfd?=
 =?us-ascii?Q?b8FrBgqj/+0cCppRqzNtjf264jpG2sVHKvB0Au9iNkYAzBeIMqtU0SKTzs5Q?=
 =?us-ascii?Q?ZeFIWPxtAUl2bo7p4/Ctd87kQrSTl+JcZDxOPrv5mZB4GykomDEvgDH2oET3?=
 =?us-ascii?Q?yPEA/D2sReZ9YQN7QB8iv+SXhqRpGlGU1xVGoEy0yw+GtayeA0r0wU7HFYvv?=
 =?us-ascii?Q?fowwNImzx6ucFA8z37WH/CfqPxGeHucOV1PiFvMWbe+VktBxYkMl8ulk407t?=
 =?us-ascii?Q?zxIgAIPozoFucrhnjdnlpJE8zhobhKoEkB4tDqZUZnnfZUapadAF8Y7tfYFx?=
 =?us-ascii?Q?Eq++e6mshM78cL4Ami9zMLpPoEfYgDIfik7IqMWbjxio2ol7Rz/o8NxyMwAc?=
 =?us-ascii?Q?rsUGuVy+jzXbSiCcJx7J0D4WD+8tRLJmoHoOChiYMz3WaE2IU+I8YXCGk5bC?=
 =?us-ascii?Q?qrAztGFIcyqyMpjbcoeHrX3bg12ImZENZRGOxcalsh17l6uNLZYzFCxCl+Bi?=
 =?us-ascii?Q?OTZluCq5sfV/EnQaj0aeCjDdvFGWyLjAPU+3nIb5o25MmZSeocE9oWROG8PF?=
 =?us-ascii?Q?0peDt0q2TjWY/6vEKkUOlq+msiSodOfQ36W5VBis4VkGxHQu1SshI+1aINOG?=
 =?us-ascii?Q?0JfxCdlQPnjrbwsM+Vq838sSNgbPFEs4Yy1Q+fk3XQyW+7XXWRArmijJUYfH?=
 =?us-ascii?Q?mlL5PW+Qq735CPA+1VsWmHCpQv27Df6G6gJr7A7xfFS4HYo2ApBVxheJDf6K?=
 =?us-ascii?Q?brjC8RqKPJ+8wYG6T/tVOzpnz3uuBwn16ciP01TEfrfxYQ62DfuT5NVpCiKt?=
 =?us-ascii?Q?CGeMsJPJFEwzTBp0xeEHl9zLjohgt/7rShL5Dexg+UIo6KQwKaorX4ljzgOm?=
 =?us-ascii?Q?RFAUxlRvzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: VFiQ1yL/t8vgnnBYZSHE6CgXEZkAsH+DoUkNsFO2wpEgh8A6O5quce1hx4UQ8t+4dXnH4EwGcKqQS1miX5G8CJqLM91H5VDaaewjXH0F4F6XtGXgAo6K8dvUmKCXznQBwYyQfQblgPxiXJafocXlthJNz4U08X4Ps0jpRdPTqoYienUrtfFZBqxOzx2HsI0aZjzbYpWb7gzJdUJRTI/ns8zh5CXcmIofO0WANBzrDaUTKZE6euBURem0n1xolruzcUQ4+COdt/ODO7JdTsqyG2w32rGa4w7BYC2ZCcqF0mJU6z3o6yA/lwQBLdV58k+F7CMgHDHlvuRbDwmupDlywg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bee9df-8050-4868-7cc1-08df1dc671aa
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 01:10:26.1276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvoVEf3wqfi3O7W5oWmdXUwJJ1Dgo3PdBpE4c/AT5BGfBBzIuHHcebpqz5fkIHJKKBGcditVuyupIAtN+O+Ytw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
X-OriginatorOrg: intel.com

Hi Siddaraju,

kernel test robot noticed the following build errors:

url:    https://github.com/intel-lab-lkp/linux/commits/Siddaraju-DH/net-ethtool-add-BaseC2C-medium-AUI-C2C-link-modes/20260928-040656
base:   
patch link:    https://lore.kernel.org/r/202609290735.6l9LLSfn-lkp%40intel.com
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260929/202609290735.6l9LLSfn-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290735.6l9LLSfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609290735.6l9LLSfn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phy-core.c:21:2: error: call to '__compiletime_assert_605' declared with 'error' attribute: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.
--
   21 |         BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 125,
   |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
   |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
   690 |         __compiletime_assert(condition, msg, prefix, suffix)
   |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
   683 |                         prefix ## suffix();                             \
   |                         ^
   <scratch space>:141:1: note: expanded from here
   141 | __compiletime_assert_605
   | ^
>> drivers/net/phy/phy-core.c:21:2: error: call to '__compiletime_assert_605' declared with 'error' attribute: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.


vim +21 drivers/net/phy/phy-core.c

a3e51d4711793b Heiner Kallweit 2025-02-22  13  
4069a572d423b7 Andrew Lunn     2020-09-23  14  /**
4069a572d423b7 Andrew Lunn     2020-09-23  15   * phy_speed_to_str - Return a string representing the PHY link speed
4069a572d423b7 Andrew Lunn     2020-09-23  16   *
4069a572d423b7 Andrew Lunn     2020-09-23  17   * @speed: Speed of the link
4069a572d423b7 Andrew Lunn     2020-09-23  18   */
da4625ac2637e4 Russell King    2017-07-25  19  const char *phy_speed_to_str(int speed)
da4625ac2637e4 Russell King    2017-07-25  20  {
491c5dc98b848c Yael Chemla     2025-11-19 @21  	BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 125,
c6576bfe2f4baa Heiner Kallweit 2019-04-13  22  		"Enum ethtool_link_mode_bit_indices and phylib are out of sync. "
c6576bfe2f4baa Heiner Kallweit 2019-04-13  23  		"If a speed or mode has been added please update phy_speed_to_str "
c6576bfe2f4baa Heiner Kallweit 2019-04-13  24  		"and the PHY settings array.\n");
c6576bfe2f4baa Heiner Kallweit 2019-04-13  25  
da4625ac2637e4 Russell King    2017-07-25  26  	switch (speed) {
da4625ac2637e4 Russell King    2017-07-25  27  	case SPEED_10:
da4625ac2637e4 Russell King    2017-07-25  28  		return "10Mbps";
da4625ac2637e4 Russell King    2017-07-25  29  	case SPEED_100:
da4625ac2637e4 Russell King    2017-07-25  30  		return "100Mbps";
da4625ac2637e4 Russell King    2017-07-25  31  	case SPEED_1000:
da4625ac2637e4 Russell King    2017-07-25  32  		return "1Gbps";
da4625ac2637e4 Russell King    2017-07-25  33  	case SPEED_2500:
da4625ac2637e4 Russell King    2017-07-25  34  		return "2.5Gbps";
da4625ac2637e4 Russell King    2017-07-25  35  	case SPEED_5000:
da4625ac2637e4 Russell King    2017-07-25  36  		return "5Gbps";
da4625ac2637e4 Russell King    2017-07-25  37  	case SPEED_10000:
da4625ac2637e4 Russell King    2017-07-25  38  		return "10Gbps";
da4625ac2637e4 Russell King    2017-07-25  39  	case SPEED_14000:
da4625ac2637e4 Russell King    2017-07-25  40  		return "14Gbps";
da4625ac2637e4 Russell King    2017-07-25  41  	case SPEED_20000:
da4625ac2637e4 Russell King    2017-07-25  42  		return "20Gbps";
da4625ac2637e4 Russell King    2017-07-25  43  	case SPEED_25000:
da4625ac2637e4 Russell King    2017-07-25  44  		return "25Gbps";
da4625ac2637e4 Russell King    2017-07-25  45  	case SPEED_40000:
da4625ac2637e4 Russell King    2017-07-25  46  		return "40Gbps";
da4625ac2637e4 Russell King    2017-07-25  47  	case SPEED_50000:
da4625ac2637e4 Russell King    2017-07-25  48  		return "50Gbps";
da4625ac2637e4 Russell King    2017-07-25  49  	case SPEED_56000:
da4625ac2637e4 Russell King    2017-07-25  50  		return "56Gbps";
a9927022c4491b Mika Westerberg 2026-01-15  51  	case SPEED_80000:
a9927022c4491b Mika Westerberg 2026-01-15  52  		return "80Gbps";
da4625ac2637e4 Russell King    2017-07-25  53  	case SPEED_100000:
da4625ac2637e4 Russell King    2017-07-25  54  		return "100Gbps";
5a3144e4195621 Heiner Kallweit 2019-04-13  55  	case SPEED_200000:
5a3144e4195621 Heiner Kallweit 2019-04-13  56  		return "200Gbps";
14af7fd1d4279c Jiri Pirko      2019-10-12  57  	case SPEED_400000:
14af7fd1d4279c Jiri Pirko      2019-10-12  58  		return "400Gbps";
404c76783f3221 Amit Cohen      2022-10-20  59  	case SPEED_800000:
404c76783f3221 Amit Cohen      2022-10-20  60  		return "800Gbps";
491c5dc98b848c Yael Chemla     2025-11-19  61  	case SPEED_1600000:
491c5dc98b848c Yael Chemla     2025-11-19  62  		return "1600Gbps";
da4625ac2637e4 Russell King    2017-07-25  63  	case SPEED_UNKNOWN:
da4625ac2637e4 Russell King    2017-07-25  64  		return "Unknown";
da4625ac2637e4 Russell King    2017-07-25  65  	default:
da4625ac2637e4 Russell King    2017-07-25  66  		return "Unsupported (update phy-core.c)";
da4625ac2637e4 Russell King    2017-07-25  67  	}
da4625ac2637e4 Russell King    2017-07-25  68  }
da4625ac2637e4 Russell King    2017-07-25  69  EXPORT_SYMBOL_GPL(phy_speed_to_str);
da4625ac2637e4 Russell King    2017-07-25  70  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

