Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2120.outbound.protection.outlook.com [40.107.220.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDCC8D8;
	Mon, 12 Jun 2023 08:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2pirTqk7QRU/XlUL+DH51lxOYUkL66juMflqJzHUUeCWpYkEm9sHJQaMyiSIx0d3exKM+m/FgseYm3j1gSagilQfzOHtoSe7t9ZzaTT5vXWV6qOhutMBkM62vsNowuPSjyPQFkpAjenAn9NyoeFuYJ/XgR6l7lLayL7Q2OeMbnVIfjYO5Go724jloee4XlKyWcVpMr1rLPIPxq9NjHg95utTiE2cI5bahCB/jq601IMKVKyDRnzc3ZU/g0upV/iMRpPH4WYA1Z8UihqbFRiEf9007y8LkaKzfF0kHNs7sVDsGfzTEyFqgUEjE4EjetAZv9SI6CQy5j3+7FWrzXlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NS025U+WSKNQGN5ODYlsZ55zh6i6W0yzzwUzLo9WyU=;
 b=e4c7JV0gcNjH4z913UxLZYylax35X5qpvGxoyyHdbAYuE644+4sTuIsgQoyEiPki+LlYbZcPBAAmKrQGi7T2/fFXbad0s2TKT3GnYp1TlptSw8+ZW0hTHFVibcAOTdcR8GTiOvhSIoXI2Db47XtITXOBq/FIy2f35Dd3raBfagGP4PwDXjCCWczvPF7fJLBCoUU/cMpw2+Rh63YyE1XaVlmssbSsD4950J6OOfDYAM8AY+SWGNXyXmS9/TYSL94vN7wHk2Xzt2kwKCbO+MPavaxv3vDJaLL46WK8zr0MYBzFrXWzu1yWBQhrzyJRNXgVAY/v2ZiBe8NdrNzuM2gHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NS025U+WSKNQGN5ODYlsZ55zh6i6W0yzzwUzLo9WyU=;
 b=tULDedXwxsEK7QFUfjQjCG0LHjhmIUH70PU+KmnLg2ZQuF37Ejj5dWgbASf81DScv4K9PmPSHduHhXFROMQ+sv6jNBqDDkIVRV7PwcswfKhDjJO0fU/KMu6YjQlDTONJGPU+472fYwKa/gRt8S9JR3HFDy4dWeul9ov1e6fAX10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SA3PR13MB6347.namprd13.prod.outlook.com (2603:10b6:806:37f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Mon, 12 Jun
 2023 08:15:56 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%4]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 08:15:55 +0000
Date: Mon, 12 Jun 2023 10:15:50 +0200
From: Simon Horman <simon.horman@corigine.com>
To: kernel test robot <lkp@intel.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: Re: [netdev-net-next:main 26/28] ld.lld: error: undefined symbol:
 efx_tc_netdev_event
Message-ID: <ZIbUNpktWf2TmKGZ@corigine.com>
References: <202306102026.ISK5JfUQ-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306102026.ISK5JfUQ-lkp@intel.com>
X-ClientProxiedBy: AM0PR02CA0170.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::7) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SA3PR13MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 66beedca-9d50-4b82-d0f5-08db6b1d3ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YSS+nrLWFiU0HDlfFDCa5vvg/Dzm22X7qGZ194Ss9mcjxMxsRCkAf5PvMkv7p0Ol4T+kzAINDDKhuOmN3V2aaYRn/v3Mu/zWhruhPEuz/FDgcHOoKtIvtrCofIlZ8ePGX2ucfVoXTDwcbIDHSH/cpXiW36J4L/uRsyp4CedH6hYrjeTy4+PhfLEivQo9kHylFmw9QSTBqX0OtuI23+TscEUc+8HMseLYhUCwYC+xc40M7dg9W4IyEP7Oz+KYIHj2CQfkX5XomtcmwMgmxAxhmxcfu4qtfic+9QWwOOkfnvdsQbSZMDJmaX7ZGiSHJ7MEdHyx6fkZSVfAhMo5THLBZSUARCD6OWpa0loHe+q+mUf5FX3XqOT/qr0hjXUUD6bcIZDh5Qm9PwSkseO4mmNH2erPbwVd3DYP0GIty7mnUNDKokjXb2Z7thZZAv84oQxPZvsF9WpuUELmltyXFA70moHFFssLUkDavVIutBvoUchraYbfv1McTq2Rdbe/cyAcv/pKFk0kJ0e73gz7uILzN69UfYU7G6wC8I3dDHMgWgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39830400003)(366004)(451199021)(54906003)(5660300002)(6916009)(4326008)(66946007)(66556008)(8936002)(8676002)(44832011)(41300700001)(316002)(2906002)(186003)(478600001)(66476007)(6666004)(966005)(6486002)(6512007)(6506007)(83380400001)(36756003)(86362001)(2616005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3QKqqgqZZBhN2CXajYSugYW30q0yZEP7WD29D+O6MijefiJegwhUZj+xgdON?=
 =?us-ascii?Q?NIR7nnL+OVEs5ybBoK3PqWEO/8Nc0vkdEB87rbS7yUriXVJI6Q02hkIr4hvH?=
 =?us-ascii?Q?W/W+J79MuOlQsLY8aBD2/u0iwWPQEbn5jmtq7o5kXgdDFkMIPbZtRxLbPgeY?=
 =?us-ascii?Q?frK4u2G/fadmy17jimng0VobCwWtctxxkL+PvkpFIQAtWVLzFBG4NMBB0Veb?=
 =?us-ascii?Q?H8AcGwXP7RconAORxIJBN5aExhsrWiZUxbt6ryAlF/MutKqutOTJdEqD07aQ?=
 =?us-ascii?Q?HAvX2HhJ2MkAOT+z/60Dlehpe5svTF0eHNF3boZ8WkYYAPkxfF1vN2PIOhHb?=
 =?us-ascii?Q?fHGBD2nOCSPIHnLgzx6DMCu42X5UM6oemdGeFP2kC+JAfG01JmuU6idouMF8?=
 =?us-ascii?Q?gS/9aNlKW9rI4DJkbLvCa0lHSFkvZPIfdRHL7+ipfVVabicqp1ZU0R8/yfqa?=
 =?us-ascii?Q?NcQ5mLLduHaEo3Hes8MPHW9ZD05db2cBesmPIOcfZLD7anCTT+lNk8gtVAR8?=
 =?us-ascii?Q?S6hz8GKft6J+5G8t6WkhS6pQrRmaa4ZQF69ESBEm13mzZtS+Le+aLET3HmKC?=
 =?us-ascii?Q?Bd2AYJo54UrCZrD1Yv7UZkephMGmyx/CiP4kwpX+vCRXeaVaf3loXuKXia8L?=
 =?us-ascii?Q?zGT5k1oqhHBgP9qUjOuRqD+cTUyBKWrMjlYpclXfsqJBk79cu2+MtlLC+x2D?=
 =?us-ascii?Q?NF3lr3J9magV4cEhMTsaWoMdas16BloBV1RWkmB5gRvjkx3Sv27xd1k7aEvp?=
 =?us-ascii?Q?BpbLf5eSH5q92qcUpOoQhTzsVk2hkbodtN5tt712vY+lQJdgZ1zsn+fTSuch?=
 =?us-ascii?Q?17iKyjkerbcmOxn5J1fWM+3bSxchVxmwtl47CeMbyZe/B6y/Frp03d5Q/MYn?=
 =?us-ascii?Q?FDo68d/f7PTvRFX/WwT1gVgwxVzyWuZ6wQ3RyI2oyZ1ZJCulRY93YiiRWN8x?=
 =?us-ascii?Q?9th1eZZjhbCgxOOra8cIUTuJqWEJyU3JifB3yyFQHZJE6OL12F1lt+XPXUld?=
 =?us-ascii?Q?l93Ch0akLyR6EB79M7YGnn4YbnGxu9auTGrVCwPwmc5CL6APu/o6fKmf7Fk+?=
 =?us-ascii?Q?ZKwBrDVuYs9Gyrc74MWpIpFkK/Vq3+6EWXtpgrO3XNo2JR7d9q6Ff2NyF3Mj?=
 =?us-ascii?Q?0ShoJRPi9khwwgnoH5m7np2hRFovvyLvS6bR9zgCc1DHJlUHniXTofEU09rq?=
 =?us-ascii?Q?eZWacARSSINUWEIDFFVhbvYbc9WVQjhM4lnwdPQcmxj7tHZluZkSbnm+fGmw?=
 =?us-ascii?Q?YjLkOUdHuM19y51+8CC5r+fer9nl0/gPppecuXPP1JY7Fz3IgKspIoNH5zUD?=
 =?us-ascii?Q?x41nOZdAcXKcTh5TAL9z9+hipxkxS0W4qcKg4CyLm3o6/jg0PTGrnX1JgBb4?=
 =?us-ascii?Q?YsdgZKbmuWLY8dS/PC3BRk3IU6WrE+2eIRMeta7fuQbp8ViNV4pPR47vhbiJ?=
 =?us-ascii?Q?L2V4Aq5EfP8Gd3O3/xKHYxlB1DAeh+wDs/gnxJKYr7e456vb5J8RjlUlQL03?=
 =?us-ascii?Q?2Kyoz+E7qgOhR63v473LFy6EXfJa4BjTu2c1Y1uLa2712NVR5kQBUfrGvI7a?=
 =?us-ascii?Q?ROqJbiTZUNexVtj7cgfy7R27qcgAh358/oV3WCFqanEY3Aq4SLoSnwd4dFF4?=
 =?us-ascii?Q?MHYD2Pl5Flyx6CdXlJ+1I+qc7Cc3FPcfdt24BBGFmwJJUDtqVAuhHg+vUwe4?=
 =?us-ascii?Q?AyR47w=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66beedca-9d50-4b82-d0f5-08db6b1d3ed8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 08:15:55.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk0V4Pdz6NW2TN+q8SQVBxeZ+WQLBvGuCSck2rTxezBYBZ4GEKET8KqMv9dCRykFN5myCvUqqEYjHsg/CyEKRrzJFvJ79HQ9XQjnjakmYg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR13MB6347

On Sat, Jun 10, 2023 at 09:10:45PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
> head:   e431e712c83676a8a9cd3988b323e3ef994a8ff3
> commit: 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9 [26/28] sfc: neighbour lookup for TC encap action offload
> config: arm-randconfig-r011-20230610 (https://download.01.org/0day-ci/archive/20230610/202306102026.ISK5JfUQ-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
>         git remote add netdev-net-next https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
>         git fetch --no-tags netdev-net-next main
>         git checkout 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306102026.ISK5JfUQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: efx_tc_netdev_event
>    >>> referenced by ef100_netdev.c:313 (drivers/net/ethernet/sfc/ef100_netdev.c:313)
>    >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netdev_event) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: efx_tc_netevent_event
>    >>> referenced by ef100_netdev.c:329 (drivers/net/ethernet/sfc/ef100_netdev.c:329)
>    >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netevent_event) in archive vmlinux.a

A cursory investigation leads me to thinking this occurs
if the CONFIG_SFC is set but CONFIG_SFC_SRIOV is not.
