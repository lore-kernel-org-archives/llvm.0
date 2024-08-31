Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3974C74;
	Sat, 31 Aug 2024 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110994; cv=fail; b=nV9TFOO48dVGbgSjH83mUIQ1Eszrakq1TvlGdmPo5AT+qdeagB1SrQV8ZdmhE6WSL7CJFBK8+bMRFnYWSEOzPWnF13i4HyTeZUOn918oRv6wgX4u03z8Xh7XdkaApffl5t0g3uDV+7fE8OqIEdhVN0Xg3GRH5xB36JocRjaq+mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110994; c=relaxed/simple;
	bh=m8H98rROG6A12sYHaCCV54mxMqCkCG9jLtBF5+6G5eY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dYh69q4DdzuCIXLDEoLtqgm/mhX0J7uNAobLqn0nijFvQLBA4nJCLGlkvMpVGkzhHtMqGelW2O71882S9gtfXxy5wjoIp6Po7Ja78MobaSP/ezTtc/XwjvTaIAfwE5KOk4V+ie2eE3ziDCJuUHtEki0FCfoW0kMeX/68o05xJXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Shjo5oyk; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Shjo5oyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725110992; x=1756646992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m8H98rROG6A12sYHaCCV54mxMqCkCG9jLtBF5+6G5eY=;
  b=Shjo5oyknXBLWWYnVu7fXdgkq7e6qPjOINzoVNd6EdHoSns3VDeeXJaz
   Xf2Xti/mX1dkIQEW56tU6LbuYn3q7C+iExs4XgQoxFUMGnnnFx4OF73AW
   GCCDSMnxsFJMQ2mW4VPnVHFbbb4umdEW5o2oNGVYzAhhnZSJKgSa7ajvi
   pqb0++w3D7/1gMC4VI2ufSNlQSS1cysYbIXr27Bt86KQGyXpENcVaXrSP
   Nicd4uW9p0buZJgvOFvQdQp4TBacVbtR/WB2UF6pNTE6v9sNQ29elxHk/
   uUhu0yIZXO1GPwPthDVgYimaGGMIDdSkJLXk3G30sVs1J3IWGbhudFA7B
   w==;
X-CSE-ConnectionGUID: cJThQy3qSB+MqlYSIqtTwg==
X-CSE-MsgGUID: dNWyp8yzSpmWKYXBqWpQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23908572"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23908572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:29:51 -0700
X-CSE-ConnectionGUID: a3JImfJfTquxLgOYTl3gFA==
X-CSE-MsgGUID: JsWxPf8IQxmop5QU68486g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="101637585"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2024 06:29:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 31 Aug 2024 06:29:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 31 Aug 2024 06:29:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 31 Aug 2024 06:29:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 06:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7ntxsXvsFirKFscGtRX93PfiDKSTMiIkgmfPyH5divKtKEyIKqcwPRSF4fOMx1gyUS0JH/6sZW8A55khWDVw/s+nwkmVIGVbT7+gov/f6ylQ1PUF0YZ/fYt6UTIdJDkGzor3pSRrBU4sXht1PWyAlDG7NX28AXQ3AbcJun1FI1PuPIlqARddiOyVxGzFgZ94MNI5yBi4WS3AdR6iYlkB/lrlk9UP1Qe0sfNR2fRblPMo6GGntfIbPireKrL5UhcAQj4bLFJkFaFM2vSRkIqDe78LJcFVFKtRcOXkCOfB4RzZ6c0Q0GyY8wI6mW7SknPiFyNMCTqjGDxtFdvvLWDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XHc/MWg/cS8obCu7yyv/jpnVxw1UVtztpKMze4rIhg=;
 b=VLzmB/lr9k1zgSQh52oVTJwUb0ivXFXPaZ6kpcQlCEXz06X0qlnHkWvrnWflfvcXQ3qhR7Ez6d46d+lnwepiUGDblxX1qkbH4eVSoeQHz8a8N+3WKezm51kClXwVvW0eFwdENYA9txWowoM2irZBxoIPJdyE02rlR3/K5QjXvaWSpHHOohBXG58uwlwNP30/ZDRhWxjY1A4vG1APLLGLyO3Gpf1SjCe/c7On8Jt+zGrPRjXSr18nBWEOI2pUAE7gUor7IPID4ylHXd85dx4ZzYpy6/XR66mZycvROPVW7hN5nJ4h+BWrbnRXBsG58yIYDRyG20WtB9Gl8s9enH+VJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sat, 31 Aug
 2024 13:29:48 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.020; Sat, 31 Aug 2024
 13:29:48 +0000
Date: Sat, 31 Aug 2024 21:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: linmin <linmin@eswincomputing.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>, Pinkesh Vaghela
	<pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 2/24]
 arch/riscv/boot/dts/eswin/eic7700.dtsi:187.28-200.6: Warning
 (unit_address_vs_reg): /soc/scu_sys_con@0x51810000/noc@51810324: node has a
 unit name, but no reg or ranges property
Message-ID: <ZtMawkZ1+6KpgvRp@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2f170c-5615-45aa-fe28-08dcc9c0fb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L7y4ZDFeGZ5hMbnyvxbHzTOE1KhUMSoKiy5nWv/wEEU2JLA566ntcXcq0JwM?=
 =?us-ascii?Q?NgewwX8FWU8WgfOGcH5OiRtRmyi+dZ298Es/eCSCLFl0eXxCF4I9LESGlauA?=
 =?us-ascii?Q?ZDjbbZlWjWOLNBuoTURe2qtaM93KSF2y0n8ZuCrgWUEDJtZOw8HF9zyjpOOx?=
 =?us-ascii?Q?rcHqJGyGhl7aNQDUNNurQpmEV2GOUAH5d2eYt6vXvfACnh9LlJD7H4Dgkax+?=
 =?us-ascii?Q?NH3m6nwP7LHssc1A5jYJJpNWb9awcZI7vq68Kb5rkxYe/WXOdtqAnafO9tZV?=
 =?us-ascii?Q?aLfBelAU8jTsu0WBucwLF/nmetKOuzlk0tmerg6tz57uE/6h3V0mic2KNy3c?=
 =?us-ascii?Q?vp8tq6t3gHOA+bzp6x7hlYa5BHKGVPabwHge/L20XgkfOYfacpssvVPJ0Zvv?=
 =?us-ascii?Q?CarkcBNOHFN8KAv0qjSkZw7lhd6YZBUs0PDeBhml+SD9SxT7/7tZIlOHAVRm?=
 =?us-ascii?Q?XuBgEcaczbbatPgWbv9XB1aVHZVWN4LwV09j2a3qP6IiFdEzKsiv2AWWIfF0?=
 =?us-ascii?Q?vHFEAnCiAeOent+eCRO3clmujxXCodAJyFvQP4DP4krzpVKTO4zbDaAEl/sQ?=
 =?us-ascii?Q?Psr74SfHL0hR7/Gxz4XAzplodXJ5O5UR5WYVpUZ6MgzXe9yj+kAZIK2ybDub?=
 =?us-ascii?Q?q9yBWdr7dXftduryIMpJVWh9Wqvm3lpDKVeZDHBJukzoyb5WmgWPceAtTcsj?=
 =?us-ascii?Q?ciCMdlLwRxGlemsy1AJPaRFBYODROOW/siGx6cApRgB3ipEG9YiTTcdiIF/k?=
 =?us-ascii?Q?PrS0KPFcQvzccjBoua5/+060+ibVs9thlGO8NvGSf8U/MfYtvIG6VOdCbKaq?=
 =?us-ascii?Q?0qGe38WSSzVdkxMXIcfPLcu6HAQpyR6Rz/T4wTMeMrj+O8cIf6mdGWg4LHQJ?=
 =?us-ascii?Q?8WLgdOhQpPOGhKiP6bQf9qQb08Pguqr+45AFqmit58xjFg9avuEYoir8TCOA?=
 =?us-ascii?Q?AbcCyyvuLinm+dFs7ozvoDohOa2qGVdxFV5R7LDsNV+t4ysgUN8zOAP6rRfQ?=
 =?us-ascii?Q?TBrnPAKxiWuC1dDgT7FGk8ZCVnTQmtW8QOGTBXhXoaultB3+BYDq+IPX/Mop?=
 =?us-ascii?Q?lqOxbw25jvQwOiIWFJHnou1QWKrG57gvY55bpeV+u5qJ0r2PgkFMpDJcntLl?=
 =?us-ascii?Q?z7FFlHCFZ6t22Zw84nIHUHZEXCCzbGstXadaAXkX6c07jOJBiecQFWBrW9Xs?=
 =?us-ascii?Q?rNRdaGpVQ8lBceRIdPUsstrp/CqkM9TpBDdmacSzDX+OvjRtSxjwC8WqquDg?=
 =?us-ascii?Q?mrn8ZDYnsijxGHokilxLUNsOYdVYhhqyex1I7k6l2fSoex/+Bc9DLWrq8dvv?=
 =?us-ascii?Q?bIGR6sI6kjOM/TSea9XQVarPuM8uEJw47xdv7qmCIWePRdMueo0iGEbWOn1L?=
 =?us-ascii?Q?nBl0VAk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aBHgxTenVdeS15l1RL+u2iF9KjV1g8Aj0OH93wfYl6qGgsGC1gH/lb139Y//?=
 =?us-ascii?Q?RLWwcXByAeaNPWZikvAKHY71jDzOm/X6rkb0zr7slSI3D4nh2xeo4G93c24v?=
 =?us-ascii?Q?4iFFEzr4AEjR1OM6tc4hnUyE18ScxKPiuPz92fU5bLlGEOJnT91/U78pWqHz?=
 =?us-ascii?Q?4CRJ9ycI6jVWrq5lCh8y+2iwLmrunFYv+lvTD1FPKPMwaCABtLUaIC1hSZjD?=
 =?us-ascii?Q?cmVOAejDbiUz7dEQw6Mx5rK7Omzbh3a1lS1SoqsS3yYJheBb7DDUXXj1067E?=
 =?us-ascii?Q?coT7RUaJN/DcNo9hO2H8G6A+UX42r+HXzFpHfL22I5V+6Rk6eMew+7EVFCie?=
 =?us-ascii?Q?rruqPs5fQVzFc5YpL9IAkhm1GG5j6NVWKHeIcTraqWpYx//n0yOpE1leus47?=
 =?us-ascii?Q?ZrLcwixHRt5MWd12MowjuG1re6lDDG+SFlJF/iabfar0aOi2gu9mwvzox36o?=
 =?us-ascii?Q?oADRhmI7Pck1/2zEsBbk8jRdKdpc6PMBQbdDuiq0ORFd/ArTyi1EFBVKCB0L?=
 =?us-ascii?Q?UwBr+QAQfdYxoAXjV2LBw7R44GZ5Ztd6yqDcw7LfCbR+JKnkYK1r9nctyxft?=
 =?us-ascii?Q?zLcOMehnUtzn2VAsiizsZZwPXMRqlCj4ZEthzpGQNM4NPee4upSj0KHO4aXz?=
 =?us-ascii?Q?ncKtBXB7vsAtsrfGQtfXvdnz76t5Qe78XNObYj2ieHkpyAVuPd+/eFSxKrAG?=
 =?us-ascii?Q?Uc7FbMZ7fFRL3VlGJGhUQHlrbbNNEHn4gymSFgTjq5ahmuIeZS6uN32WNGac?=
 =?us-ascii?Q?mf1uTFDCtU4/A+/EVLDue80JCvL9iH8CwvM5EsmxDrnU5tY2HCjORCsRmcOk?=
 =?us-ascii?Q?ztpjkhJCMnkgcnEps4XQtKAEC/Da8cUywNx9nsSlmDFkEu0oqezsYO5Ma3+D?=
 =?us-ascii?Q?5fgqmw9NtEOtojUYTdW2y3DMggopW3d6Nk44pPjKbPhQ361o/S7Pd20Ig/Jg?=
 =?us-ascii?Q?FubEz253a4rDXWXofeMkeGbprPj+zha+NPxk/Fpl6JIoRrvEGdPYju2cKmYB?=
 =?us-ascii?Q?jk7bPWfRDbiLpNzBNG2NWD8wlu+nDguKXEk4ye1OSnoIxLVp2vqbgoIyr8mY?=
 =?us-ascii?Q?nhpR1909bP04O2mg/ue/uwqLi34bi20SXcbCJl7Bh3Xh/sl9P/9VRGQbfHdT?=
 =?us-ascii?Q?fxE142CLFIAHKIOgJmngdGom6TmviNmolLvVm4UMUp2FyEGgYkPU5FXk2oI0?=
 =?us-ascii?Q?RQWjAdyanvx99+VzBPIcKRj9B++EDBgBDUC57hfC+xWbseuLQTYzmaveezBz?=
 =?us-ascii?Q?m3FZfkO8XcttauN7UABkrTgADMMiRyT4zhJ9k75JOKmxaUId0NX2mMAaWPxd?=
 =?us-ascii?Q?MEMXTt5xbt3DlSuG0X5n0eibpXvCxW7mUXjAlxsbJmCeZwmwRUDmZprqe/Me?=
 =?us-ascii?Q?/VCC1+SOzzb/7oJTjQtiNnUIneTBvqAlucxs5ct19LqhnzEzyOJfXSdXF2+N?=
 =?us-ascii?Q?sUIN1Kk5VFYz9iFG0R2UZt+KEUi/Cxhx78VPYNBFFPJTE3vi30JoqOhpGDh9?=
 =?us-ascii?Q?jaxonJCLiUQnksmxOYYlpH3HzOfZU2YYBf8odbue1xaqpQBywze68nerU/Uv?=
 =?us-ascii?Q?8NCF8BUMYCYM8nFnUJtHGGQVNBGrxjpJaCdUVA20nTe+p/7o7Wt7IQVw/Aej?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2f170c-5615-45aa-fe28-08dcc9c0fb81
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 13:29:47.8167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx3m0P2TMhrd/7dwew4czM0cqlkWCWUmW+NSfpqyyi+aNyowB9IBff/pLm/f/HWynklQ7eIS2b8gWEPzKKmqLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
X-OriginatorOrg: intel.com

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 8ea3019924f781248309581a15420c095dd02ed5 [2/24] dts: eswin: Add dts and dtsi files for HiFive Premier P550 board
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408310440.rUfsH66k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310440.rUfsH66k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408310440.rUfsH66k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:187.28-200.6: Warning (unit_address_vs_reg): /soc/scu_sys_con@0x51810000/noc@51810324: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:274.47-284.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:285.48-295.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@40: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:296.46-306.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@80: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:307.46-316.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@c0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:317.50-327.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@140: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:328.49-338.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@200: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:339.49-349.6: Warning (unit_address_vs_reg): /soc/power-controller@51808000/eic7700-pmu-controller-port@240: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700-noc.dtsi:21.22-269.3: Warning (unit_address_vs_reg): /soc/noc/d0_cfg_noc: node has a reg or ranges property, but no unit name
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:552.11-553.7: Warning (unit_address_vs_reg): /soc/dsp_subsys@52280400/es_dsp@0/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:581.11-582.7: Warning (unit_address_vs_reg): /soc/dsp_subsys@52280400/es_dsp@1/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:610.11-611.7: Warning (unit_address_vs_reg): /soc/dsp_subsys@52280400/es_dsp@2/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:639.11-640.7: Warning (unit_address_vs_reg): /soc/dsp_subsys@52280400/es_dsp@3/dsp@0: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:913.34-958.5: Warning (unit_address_vs_reg): /soc/video-decoder0@50100000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:947.27-951.6: Warning (unit_address_vs_reg): /soc/video-decoder0@50100000/vdec0@50100000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:953.27-957.6: Warning (unit_address_vs_reg): /soc/video-decoder0@50100000/jdec0@50120000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:960.33-1005.5: Warning (unit_address_vs_reg): /soc/video-encoder@50110000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:994.27-998.6: Warning (unit_address_vs_reg): /soc/video-encoder@50110000/venc0@50110000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1000.27-1004.6: Warning (unit_address_vs_reg): /soc/video-encoder@50110000/jenc0@50130000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1151.21-1162.5: Warning (unit_address_vs_reg): /soc/ipc@0: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1164.20-1185.5: Warning (unit_address_vs_reg): /soc/lpcpu@0: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1845.29-1847.8: Warning (unit_address_vs_reg): /soc/hdmi@502a0000/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:282.28-285.6: Warning (unit_address_vs_reg): /soc/hdmi@502a0000/ports/port@2/endpoint@1: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1862.31-1899.5: Warning (unit_address_vs_reg): /soc/usb0@50480000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1901.31-1938.5: Warning (unit_address_vs_reg): /soc/usb1@50490000: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:103.23-109.5: Warning (unit_address_vs_reg): /soc/reset_test@1e00e000: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:96.32-99.5: Warning (unit_address_vs_reg): /reserved-memory/g2d_4GB_boundary_reserved_4k: node has a reg or ranges property, but no unit name
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:306.34-309.5: Warning (simple_bus_reg): /soc/authentication-controller: missing or empty reg/ranges property
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:344.29-350.5: Warning (simple_bus_reg): /soc/bus-error-unit@hart0: simple-bus unit address format error, expected "1700000"
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:351.29-357.5: Warning (simple_bus_reg): /soc/bus-error-unit@hart1: simple-bus unit address format error, expected "1701000"
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:358.29-364.5: Warning (simple_bus_reg): /soc/bus-error-unit@hart2: simple-bus unit address format error, expected "1702000"
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:365.29-371.5: Warning (simple_bus_reg): /soc/bus-error-unit@hart3: simple-bus unit address format error, expected "1703000"
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:488.28-493.5: Warning (simple_bus_reg): /soc/subsystem_pbus_clock: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:123.31-132.5: Warning (simple_bus_reg): /soc/serial@0x50900000: simple-bus unit address format error, expected "50900000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:134.31-143.5: Warning (simple_bus_reg): /soc/serial@0x50910000: simple-bus unit address format error, expected "50910000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:145.31-155.5: Warning (simple_bus_reg): /soc/serial@0x50920000: simple-bus unit address format error, expected "50920000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:157.31-167.5: Warning (simple_bus_reg): /soc/serial@0x50930000: simple-bus unit address format error, expected "50930000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:169.31-179.5: Warning (simple_bus_reg): /soc/serial@0x50940000: simple-bus unit address format error, expected "50940000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:181.38-201.5: Warning (simple_bus_reg): /soc/scu_sys_con@0x51810000: simple-bus unit address format error, expected "51810000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:217.16-222.5: Warning (simple_bus_reg): /soc/hfclk: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:224.44-228.5: Warning (simple_bus_reg): /soc/hsp_sp_top_csr@0x50440000: simple-bus unit address format error, expected "50440000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:352.43-375.5: Warning (simple_bus_reg): /soc/dma-controller-hsp@0x50430000: simple-bus unit address format error, expected "50430000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:377.46-402.5: Warning (simple_bus_reg): /soc/dma-controller-aon@0x518c0000: simple-bus unit address format error, expected "518c0000"
   arch/riscv/boot/dts/eswin/eic7700-noc.dtsi:21.22-269.3: Warning (simple_bus_reg): /soc/noc/d0_cfg_noc: simple-bus unit address format error, expected "52060000"
   arch/riscv/boot/dts/eswin/eic7700-noc.dtsi:543.32-2038.3: Warning (simple_bus_reg): /soc/noc/d0_sys_noc@52002C00: simple-bus unit address format error, expected "52002c00"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:525.21-554.6: Warning (simple_bus_reg): /soc/dsp_subsys@52280400/es_dsp@0: simple-bus unit address format error, expected "5b000000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:555.21-583.6: Warning (simple_bus_reg): /soc/dsp_subsys@52280400/es_dsp@1: simple-bus unit address format error, expected "5b008000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:584.21-612.6: Warning (simple_bus_reg): /soc/dsp_subsys@52280400/es_dsp@2: simple-bus unit address format error, expected "5b010000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:613.21-641.6: Warning (simple_bus_reg): /soc/dsp_subsys@52280400/es_dsp@3: simple-bus unit address format error, expected "5b018000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:691.27-711.5: Warning (simple_bus_reg): /soc/sata@0x50420000: simple-bus unit address format error, expected "50420000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:713.25-756.5: Warning (simple_bus_reg): /soc/pcie@0x54000000: simple-bus unit address format error, expected "54000000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:849.24-879.5: Warning (simple_bus_reg): /soc/mmc@0x50460000: simple-bus unit address format error, expected "50460000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:881.24-911.5: Warning (simple_bus_reg): /soc/mmc@0x50470000: simple-bus unit address format error, expected "50470000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:913.34-958.5: Warning (simple_bus_reg): /soc/video-decoder0@50100000: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:960.33-1005.5: Warning (simple_bus_reg): /soc/video-encoder@50110000: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1151.21-1162.5: Warning (simple_bus_reg): /soc/ipc@0: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1164.20-1185.5: Warning (simple_bus_reg): /soc/lpcpu@0: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1187.24-1199.5: Warning (simple_bus_reg): /soc/pvt@0x50b00000: simple-bus unit address format error, expected "50b00000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1200.24-1212.5: Warning (simple_bus_reg): /soc/pvt@0x52360000: simple-bus unit address format error, expected "52360000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1397.31-1401.5: Warning (simple_bus_reg): /soc/pinctrl@0x51600080: simple-bus unit address format error, expected "51600080"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1445.24-1457.5: Warning (simple_bus_reg): /soc/pwm@0x50818000: simple-bus unit address format error, expected "50818000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1459.29-1469.5: Warning (simple_bus_reg): /soc/watchdog@0x50800000: simple-bus unit address format error, expected "50800000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1471.29-1481.5: Warning (simple_bus_reg): /soc/watchdog@0x50804000: simple-bus unit address format error, expected "50804000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1483.29-1493.5: Warning (simple_bus_reg): /soc/watchdog@0x50808000: simple-bus unit address format error, expected "50808000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1495.29-1505.5: Warning (simple_bus_reg): /soc/watchdog@0x5080c000: simple-bus unit address format error, expected "5080c000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1507.28-1528.5: Warning (simple_bus_reg): /soc/timer@0x51840000: simple-bus unit address format error, expected "51840000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1530.28-1550.5: Warning (simple_bus_reg): /soc/timer@0x51848000: simple-bus unit address format error, expected "51848000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1552.28-1572.5: Warning (simple_bus_reg): /soc/timer@0x51850000: simple-bus unit address format error, expected "51850000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1574.28-1595.5: Warning (simple_bus_reg): /soc/timer@0x51858000: simple-bus unit address format error, expected "51858000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1662.29-1664.5: Warning (simple_bus_reg): /soc/graphcard0: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1666.29-1668.5: Warning (simple_bus_reg): /soc/graphcard1: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1670.29-1672.5: Warning (simple_bus_reg): /soc/graphcard2: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1674.35-1677.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1679.30-1682.5: Warning (simple_bus_reg): /soc/dvb-subsystem: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1723.26-1732.5: Warning (simple_bus_reg): /soc/es_wb: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1734.26-1760.5: Warning (simple_bus_reg): /soc/dsi-output: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1862.31-1899.5: Warning (simple_bus_reg): /soc/usb0@50480000: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1901.31-1938.5: Warning (simple_bus_reg): /soc/usb1@50490000: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1940.44-1978.5: Warning (simple_bus_reg): /soc/vi_common_top_csr@0x51030000: simple-bus unit address format error, expected "51030000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1980.25-1993.5: Warning (simple_bus_reg): /soc/isp@0x51000000: simple-bus unit address format error, expected "51000000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1995.25-2008.5: Warning (simple_bus_reg): /soc/isp@0x51010000: simple-bus unit address format error, expected "51010000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:2046.31-2063.5: Warning (simple_bus_reg): /soc/csidma@0x52048000: simple-bus unit address format error, expected "52048000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:2065.31-2082.5: Warning (simple_bus_reg): /soc/csidma@0x52058000: simple-bus unit address format error, expected "52058000"
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:2181.26-2189.5: Warning (simple_bus_reg): /soc/ddr-controller@0: simple-bus unit address format error, expected "52300000"
   arch/riscv/boot/dts/eswin/eic7700.dtsi:2191.26-2199.5: Warning (simple_bus_reg): /soc/ddr-controller@1: simple-bus unit address format error, expected "52380000"
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dts:103.23-109.5: Warning (simple_bus_reg): /soc/reset_test@1e00e000: missing or empty reg/ranges property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:268.37-350.5: Warning (avoid_unnecessary_addr_size): /soc/power-controller@51808000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1611.26-1626.5: Warning (avoid_unnecessary_addr_size): /soc/i2s0@50200000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1628.26-1643.5: Warning (avoid_unnecessary_addr_size): /soc/i2s1@50210000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1780.12-1788.7: Warning (avoid_unnecessary_addr_size): /soc/mipi_dsi@50270000/ports/port@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1790.12-1798.7: Warning (avoid_unnecessary_addr_size): /soc/mipi_dsi@50270000/ports/port@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:467.30-483.5: Warning (unique_unit_address_if_enabled): /soc/eswin-npu@51c00000: duplicate unit-address (also used in node /soc/llc@51c00000)
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:392.27-397.5: Warning (unique_unit_address_if_enabled): /soc/debug-controller@0: duplicate unit-address (also used in node /soc/ipc@0)
   arch/riscv/boot/dts/eswin/eic7700-arch.dtsi:392.27-397.5: Warning (unique_unit_address_if_enabled): /soc/debug-controller@0: duplicate unit-address (also used in node /soc/ddr-controller@0)
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1151.21-1162.5: Warning (unique_unit_address_if_enabled): /soc/ipc@0: duplicate unit-address (also used in node /soc/ddr-controller@0)
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:713.25-756.5: Warning (interrupt_provider): /soc/pcie@0x54000000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/riscv/boot/dts/eswin/hifive-premier-p550.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1742.12-1750.7: Warning (graph_child_address): /soc/dsi-output/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:1780.12-1788.7: Warning (graph_child_address): /soc/mipi_dsi@50270000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/riscv/boot/dts/eswin/eic7700.dtsi:1790.12-1798.7: Warning (graph_child_address): /soc/mipi_dsi@50270000/ports/port@1: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/riscv/boot/dts/eswin/eic7700.dtsi:2053.9-2062.6: Warning (graph_child_address): /soc/csidma@0x52048000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/riscv/boot/dts/eswin/eic7700.dtsi:2072.9-2081.6: Warning (graph_child_address): /soc/csidma@0x52058000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +187 arch/riscv/boot/dts/eswin/eic7700.dtsi

8ea3019924f781 linmin 2024-07-29  121  
8ea3019924f781 linmin 2024-07-29  122  &SOC {
8ea3019924f781 linmin 2024-07-29 @123  		d0_uart0: serial@0x50900000 {
8ea3019924f781 linmin 2024-07-29  124  			compatible = "snps,dw-apb-uart";
8ea3019924f781 linmin 2024-07-29  125  			reg = <0x0 0x50900000 0x0 0x10000>;
8ea3019924f781 linmin 2024-07-29  126  			clock-frequency = <LSPCLK_FREQ>;
8ea3019924f781 linmin 2024-07-29  127  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  128  			interrupts = <UART0_INT>;
8ea3019924f781 linmin 2024-07-29  129  			reg-shift = <2>;
8ea3019924f781 linmin 2024-07-29  130  			reg-io-width = <4>;
8ea3019924f781 linmin 2024-07-29  131  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  132  		};
8ea3019924f781 linmin 2024-07-29  133  
8ea3019924f781 linmin 2024-07-29  134  		d0_uart1: serial@0x50910000 {
8ea3019924f781 linmin 2024-07-29  135  			compatible = "snps,dw-apb-uart";
8ea3019924f781 linmin 2024-07-29  136  			reg = <0x0 0x50910000 0x0 0x10000>;
8ea3019924f781 linmin 2024-07-29  137  			clock-frequency = <LSPCLK_FREQ>;
8ea3019924f781 linmin 2024-07-29  138  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  139  			interrupts = <UART1_INT>;
8ea3019924f781 linmin 2024-07-29  140  			reg-shift = <2>;
8ea3019924f781 linmin 2024-07-29  141  			reg-io-width = <4>;
8ea3019924f781 linmin 2024-07-29  142  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  143  		};
8ea3019924f781 linmin 2024-07-29  144  
8ea3019924f781 linmin 2024-07-29 @145  		d0_uart2: serial@0x50920000 {
8ea3019924f781 linmin 2024-07-29  146  			compatible = "snps,dw-apb-uart";
8ea3019924f781 linmin 2024-07-29  147  			reg = <0x0 0x50920000 0x0 0x10000>;
8ea3019924f781 linmin 2024-07-29  148  			clock-frequency = <LSPCLK_FREQ>;
8ea3019924f781 linmin 2024-07-29  149  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  150  			interrupts = <UART2_INT>;
8ea3019924f781 linmin 2024-07-29  151  			reg-shift = <2>;
8ea3019924f781 linmin 2024-07-29  152  			reg-io-width = <4>;
8ea3019924f781 linmin 2024-07-29  153  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  154  			status = "disabled";
8ea3019924f781 linmin 2024-07-29  155  		};
8ea3019924f781 linmin 2024-07-29  156  
8ea3019924f781 linmin 2024-07-29 @157  		d0_uart3: serial@0x50930000 {
8ea3019924f781 linmin 2024-07-29  158  			compatible = "snps,dw-apb-uart";
8ea3019924f781 linmin 2024-07-29  159  			reg = <0x0 0x50930000 0x0 0x10000>;
8ea3019924f781 linmin 2024-07-29  160  			clock-frequency = <LSPCLK_FREQ>;
8ea3019924f781 linmin 2024-07-29  161  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  162  			interrupts = <UART3_INT>;
8ea3019924f781 linmin 2024-07-29  163  			reg-shift = <2>;
8ea3019924f781 linmin 2024-07-29  164  			reg-io-width = <4>;
8ea3019924f781 linmin 2024-07-29  165  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  166  			status = "disabled";
8ea3019924f781 linmin 2024-07-29  167  		};
8ea3019924f781 linmin 2024-07-29  168  
8ea3019924f781 linmin 2024-07-29 @169  		d0_uart4: serial@0x50940000 {
8ea3019924f781 linmin 2024-07-29  170  			compatible = "snps,dw-apb-uart";
8ea3019924f781 linmin 2024-07-29  171  			reg = <0x0 0x50940000 0x0 0x10000>;
8ea3019924f781 linmin 2024-07-29  172  			clock-frequency = <LSPCLK_FREQ>;
8ea3019924f781 linmin 2024-07-29  173  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  174  			interrupts = <UART4_INT>;
8ea3019924f781 linmin 2024-07-29  175  			reg-shift = <2>;
8ea3019924f781 linmin 2024-07-29  176  			reg-io-width = <4>;
8ea3019924f781 linmin 2024-07-29  177  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  178  			status = "disabled";
8ea3019924f781 linmin 2024-07-29  179  		};
8ea3019924f781 linmin 2024-07-29  180  
8ea3019924f781 linmin 2024-07-29 @181  		d0_sys_con: scu_sys_con@0x51810000 {
8ea3019924f781 linmin 2024-07-29  182  			compatible = "eswin,eic7700-scu-sys-con", "syscon", "simple-mfd";
8ea3019924f781 linmin 2024-07-29  183  			#syscon-cells = <2>;
8ea3019924f781 linmin 2024-07-29  184  			#size-cells = <2>;
8ea3019924f781 linmin 2024-07-29  185  			reg = <0x0 0x51810000 0x0 0x8000>;
8ea3019924f781 linmin 2024-07-29  186  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29 @187  			d0_noc_wdt:noc@51810324 {
8ea3019924f781 linmin 2024-07-29  188  				compatible = "eswin,eic7700-noc-wdt";
8ea3019924f781 linmin 2024-07-29  189  				interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  190  				interrupts = <392>, <393>, <394>, <395>,
8ea3019924f781 linmin 2024-07-29  191  						<396>, <397>, <398>, <399>, <400>,
8ea3019924f781 linmin 2024-07-29  192  						<401>, <402>, <403>, <404>, <405>,
8ea3019924f781 linmin 2024-07-29  193  						<406>, <407>, <408>, <409>, <410>,
8ea3019924f781 linmin 2024-07-29  194  						<411>, <412>, <413>, <414>, <415>,
8ea3019924f781 linmin 2024-07-29  195  						<416>, <417>, <418>, <419>, <420>,
8ea3019924f781 linmin 2024-07-29  196  						<421>, <422>, <423>, <424>, <425>,
8ea3019924f781 linmin 2024-07-29  197  						<426>;
8ea3019924f781 linmin 2024-07-29  198  				eswin,syscrg_csr = <&d0_sys_crg 0x100 0xffff>; //timeout paramerter
8ea3019924f781 linmin 2024-07-29  199  				status = "disabled";
8ea3019924f781 linmin 2024-07-29  200  			};
8ea3019924f781 linmin 2024-07-29  201  		};
8ea3019924f781 linmin 2024-07-29  202  
8ea3019924f781 linmin 2024-07-29  203  		d0_sys_crg: sys-crg@51828000 {
8ea3019924f781 linmin 2024-07-29  204  			compatible = "eswin,eic7700-sys-crg", "syscon", "simple-mfd";
8ea3019924f781 linmin 2024-07-29  205  			reg = <0x000000 0x51828000 0x000000 0x80000>;
8ea3019924f781 linmin 2024-07-29  206  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  207  			d0_reset: reset-controller {
8ea3019924f781 linmin 2024-07-29  208  				compatible = "eswin,eic7700-reset";
8ea3019924f781 linmin 2024-07-29  209  				#reset-cells = <2>;
8ea3019924f781 linmin 2024-07-29  210  			};
8ea3019924f781 linmin 2024-07-29  211  			d0_clock: clock-controller {
8ea3019924f781 linmin 2024-07-29  212  				compatible = "eswin,eic7700-clock";
8ea3019924f781 linmin 2024-07-29  213  				#clock-cells = <1>;
8ea3019924f781 linmin 2024-07-29  214  			};
8ea3019924f781 linmin 2024-07-29  215  		};
8ea3019924f781 linmin 2024-07-29  216  
8ea3019924f781 linmin 2024-07-29 @217  		hfclk: hfclk {
8ea3019924f781 linmin 2024-07-29  218  			#clock-cells = <0>;
8ea3019924f781 linmin 2024-07-29  219  			compatible = "fixed-clock";
8ea3019924f781 linmin 2024-07-29  220  			clock-frequency = <LSPCLK_FREQ>;
8ea3019924f781 linmin 2024-07-29  221  			clock-output-names = "hfclk";
8ea3019924f781 linmin 2024-07-29  222  		};
8ea3019924f781 linmin 2024-07-29  223  
8ea3019924f781 linmin 2024-07-29 @224  		d0_hsp_sp_csr: hsp_sp_top_csr@0x50440000 {
8ea3019924f781 linmin 2024-07-29  225  			compatible = "eswin,eic7700-hsp-sp-csr", "syscon";
8ea3019924f781 linmin 2024-07-29  226  			#size-cells = <2>;
8ea3019924f781 linmin 2024-07-29  227  			reg = <0x0 0x50440000 0x0 0x2000>;
8ea3019924f781 linmin 2024-07-29  228  		};
8ea3019924f781 linmin 2024-07-29  229  
8ea3019924f781 linmin 2024-07-29  230  		smmu0: iommu@50c00000 {
8ea3019924f781 linmin 2024-07-29  231  			compatible = "arm,smmu-v3";
8ea3019924f781 linmin 2024-07-29  232  			reg = <0x0 0x50c00000 0x0 0x100000>;
8ea3019924f781 linmin 2024-07-29  233  			eswin,syscfg = <&d0_sys_con 0x3fc>;
8ea3019924f781 linmin 2024-07-29  234  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  235  			interrupts = <356>,
8ea3019924f781 linmin 2024-07-29  236  				<360>,
8ea3019924f781 linmin 2024-07-29  237  				<357>,
8ea3019924f781 linmin 2024-07-29  238  				<358>;
8ea3019924f781 linmin 2024-07-29  239  			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
8ea3019924f781 linmin 2024-07-29  240  			#iommu-cells = <1>;
8ea3019924f781 linmin 2024-07-29  241  			resets = <&d0_reset TCU_RST_CTRL SW_TCU_AXI_RSTN>,
8ea3019924f781 linmin 2024-07-29  242  				<&d0_reset TCU_RST_CTRL SW_TCU_CFG_RSTN>,
8ea3019924f781 linmin 2024-07-29  243  				<&d0_reset TCU_RST_CTRL TBU_RSTN_0>,
8ea3019924f781 linmin 2024-07-29  244  				<&d0_reset TCU_RST_CTRL TBU_RSTN_1>,
8ea3019924f781 linmin 2024-07-29  245  				<&d0_reset TCU_RST_CTRL TBU_RSTN_2>,
8ea3019924f781 linmin 2024-07-29  246  				<&d0_reset TCU_RST_CTRL TBU_RSTN_3>,
8ea3019924f781 linmin 2024-07-29  247  				<&d0_reset TCU_RST_CTRL TBU_RSTN_4>,
8ea3019924f781 linmin 2024-07-29  248  				<&d0_reset TCU_RST_CTRL TBU_RSTN_5>,
8ea3019924f781 linmin 2024-07-29  249  				<&d0_reset TCU_RST_CTRL TBU_RSTN_6>,
8ea3019924f781 linmin 2024-07-29  250  				<&d0_reset TCU_RST_CTRL TBU_RSTN_7>;
8ea3019924f781 linmin 2024-07-29  251  			reset-names = "axi_rst", "cfg_rst", "tbu0_rst", "tbu1_rst", "tbu2_rst", "tbu3_rst",
8ea3019924f781 linmin 2024-07-29  252  				"tbu4_rst", "tbu5_rst", "tbu6_rst", "tbu7_rst";
8ea3019924f781 linmin 2024-07-29  253  			status = "disabled";
8ea3019924f781 linmin 2024-07-29  254  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  255  		};
8ea3019924f781 linmin 2024-07-29  256  
8ea3019924f781 linmin 2024-07-29  257  		smmu_pmu0: pmu@50c02000 {
8ea3019924f781 linmin 2024-07-29  258  			compatible = "arm,smmu-v3-pmcg";
8ea3019924f781 linmin 2024-07-29  259  			reg = <0x0 0x50c02000 0x0 0x1000>,
8ea3019924f781 linmin 2024-07-29  260  					<0x0 0x50c22000 0x0 0x1000>;
8ea3019924f781 linmin 2024-07-29  261  			eswin,syscfg = <&d0_sys_con 0x3fc>;
8ea3019924f781 linmin 2024-07-29  262  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  263  			interrupts = <363>;
8ea3019924f781 linmin 2024-07-29  264  			status = "disabled";
8ea3019924f781 linmin 2024-07-29  265  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  266  		};
8ea3019924f781 linmin 2024-07-29  267  
8ea3019924f781 linmin 2024-07-29 @268  		d0_pmu: power-controller@51808000 {
8ea3019924f781 linmin 2024-07-29  269  			#address-cells = <1>;
8ea3019924f781 linmin 2024-07-29  270  			#size-cells = <0>;
8ea3019924f781 linmin 2024-07-29  271  			compatible = "eswin,eic7700-pmu-controller";
8ea3019924f781 linmin 2024-07-29  272  			reg = <0x0 0x51808000 0x0 0x8000>;
8ea3019924f781 linmin 2024-07-29  273  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29 @274  			d0_pmu_pcie: eic7700-pmu-controller-port@0 {
8ea3019924f781 linmin 2024-07-29  275  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  276  				reg_base = <0x0>;
8ea3019924f781 linmin 2024-07-29  277  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  278  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  279  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  280  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  281  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  282  				label = "D0_PCIE";
8ea3019924f781 linmin 2024-07-29  283  				tbus = <EIC7700_TBUID_PCIE>;
8ea3019924f781 linmin 2024-07-29  284  			};
8ea3019924f781 linmin 2024-07-29  285  			d0_pmu_dsp1: eic7700-pmu-controller-port@40 {
8ea3019924f781 linmin 2024-07-29  286  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  287  				reg_base = <0x40>;
8ea3019924f781 linmin 2024-07-29  288  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  289  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  290  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  291  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  292  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  293  				tbus = <EIC7700_TBUID_DSP1>;
8ea3019924f781 linmin 2024-07-29  294  				label = "D0_DSP1";
8ea3019924f781 linmin 2024-07-29  295  			};
8ea3019924f781 linmin 2024-07-29  296  			d0_pmu_vi: eic7700-pmu-controller-port@80 {
8ea3019924f781 linmin 2024-07-29  297  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  298  				reg_base = <0x80>;
8ea3019924f781 linmin 2024-07-29  299  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  300  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  301  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  302  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  303  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  304  				tbus = <EIC7700_TBUID_ISP>,<EIC7700_TBUID_DW>;
8ea3019924f781 linmin 2024-07-29  305  				label = "D0_VI";
8ea3019924f781 linmin 2024-07-29  306  			};
8ea3019924f781 linmin 2024-07-29 @307  			d0_pmu_vo: eic7700-pmu-controller-port@c0 {
8ea3019924f781 linmin 2024-07-29  308  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  309  				reg_base = <0xc0>;
8ea3019924f781 linmin 2024-07-29  310  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  311  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  312  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  313  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  314  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  315  				label = "D0_VO";
8ea3019924f781 linmin 2024-07-29  316  			};
8ea3019924f781 linmin 2024-07-29 @317  			d0_pmu_codec: eic7700-pmu-controller-port@140 {
8ea3019924f781 linmin 2024-07-29  318  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  319  				reg_base = <0x140>;
8ea3019924f781 linmin 2024-07-29  320  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  321  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  322  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  323  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  324  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  325  				tbus = <EIC7700_TBUID_VDEC>, <EIC7700_TBUID_JDEC>,<EIC7700_TBUID_VENC>, <EIC7700_TBUID_JENC>;
8ea3019924f781 linmin 2024-07-29  326  				label = "D0_CODEC";
8ea3019924f781 linmin 2024-07-29  327  			};
8ea3019924f781 linmin 2024-07-29  328  			d0_pmu_dsp2: eic7700-pmu-controller-port@200 {
8ea3019924f781 linmin 2024-07-29  329  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  330  				reg_base = <0x200>;
8ea3019924f781 linmin 2024-07-29  331  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  332  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  333  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  334  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  335  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  336  				tbus = <EIC7700_TBUID_DSP2>;
8ea3019924f781 linmin 2024-07-29  337  				label = "D0_DSP2";
8ea3019924f781 linmin 2024-07-29  338  			};
8ea3019924f781 linmin 2024-07-29  339  			d0_pmu_dsp3: eic7700-pmu-controller-port@240 {
8ea3019924f781 linmin 2024-07-29  340  				compatible = "eswin,eic7700-pmu-controller-port";
8ea3019924f781 linmin 2024-07-29  341  				reg_base = <0x240>;
8ea3019924f781 linmin 2024-07-29  342  				power_status = <1>;
8ea3019924f781 linmin 2024-07-29  343  				power_delay = <6 6 3 3>;
8ea3019924f781 linmin 2024-07-29  344  				clock_delay = <4 2 2 2>;
8ea3019924f781 linmin 2024-07-29  345  				reset_delay = <2 4 2 2>;
8ea3019924f781 linmin 2024-07-29  346  				clamp_delay = <3 3 2 2>;
8ea3019924f781 linmin 2024-07-29  347  				tbus = <EIC7700_TBUID_DSP3>;
8ea3019924f781 linmin 2024-07-29  348  				label = "D0_DSP3";
8ea3019924f781 linmin 2024-07-29  349  			};
8ea3019924f781 linmin 2024-07-29  350  		};
8ea3019924f781 linmin 2024-07-29  351  
8ea3019924f781 linmin 2024-07-29 @352  		d0_dmac0: dma-controller-hsp@0x50430000 {
8ea3019924f781 linmin 2024-07-29  353  			compatible = "snps,axi-dma-1.01a";
8ea3019924f781 linmin 2024-07-29  354  			reg = <0x0 0x50430000 0x0 0x10000>;
8ea3019924f781 linmin 2024-07-29  355  			interrupt-parent = <&plic0>;
8ea3019924f781 linmin 2024-07-29  356  			interrupts = <57>;
8ea3019924f781 linmin 2024-07-29  357  			#dma-cells = <2>; // change dma-cells value <1> to <2>, to support peripheral selection dma-controller,See the parameter dmas for details;
8ea3019924f781 linmin 2024-07-29  358  			clocks = <&d0_clock EIC7700_CLK_HSP_DMA0_CLK>;
8ea3019924f781 linmin 2024-07-29  359  			clock-names = "core-clk";
8ea3019924f781 linmin 2024-07-29  360  			resets = <&d0_reset HSPDMA_RST_CTRL SW_HSP_DMA0_RSTN>,
8ea3019924f781 linmin 2024-07-29  361  				<&d0_reset HSPDMA_RST_CTRL SW_HSP_DMA_PRSTN>;
8ea3019924f781 linmin 2024-07-29  362  			reset-names = "arst", "prst";
8ea3019924f781 linmin 2024-07-29  363  			dma-channels = <12>;
8ea3019924f781 linmin 2024-07-29  364  			snps,dma-masters = <1>;
8ea3019924f781 linmin 2024-07-29  365  			snps,priority = <0 1 2 3 4 5 6 7 8 9 10 11>;
8ea3019924f781 linmin 2024-07-29  366  			snps,data-width = <2>;
8ea3019924f781 linmin 2024-07-29  367  			snps,block-size = <0x80000 0x80000 0x80000 0x80000 0x80000 0x80000 0x80000 0x80000 0x80000 0x80000 0x80000 0x80000>;
8ea3019924f781 linmin 2024-07-29  368  			snps,axi-max-burst-len = <16>;
8ea3019924f781 linmin 2024-07-29  369  			snps,max-msize = <64>;
8ea3019924f781 linmin 2024-07-29  370  			iommus = <&smmu0 EIC7700_SID_DMA0>;
8ea3019924f781 linmin 2024-07-29  371  			tbus = <EIC7700_TBUID_DMA0>;
8ea3019924f781 linmin 2024-07-29  372  			eswin,hsp_sp_csr = <&d0_hsp_sp_csr 0x104c>;
8ea3019924f781 linmin 2024-07-29  373  			eswin,syscfg = <&d0_sys_con DMA1_SID_REG_OFFSET 0x370>;
8ea3019924f781 linmin 2024-07-29  374  			numa-node-id = <0>;
8ea3019924f781 linmin 2024-07-29  375  		};
8ea3019924f781 linmin 2024-07-29  376  
8ea3019924f781 linmin 2024-07-29 @377  		d0_aon_dmac: dma-controller-aon@0x518c0000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

