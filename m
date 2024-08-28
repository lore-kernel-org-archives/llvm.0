Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004844C68;
	Wed, 28 Aug 2024 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724862533; cv=fail; b=M1ZrcqqNZEGB6DkGo/PRwHgTo54SrhjSS3RxrmN74VJKld8pakRziUpHhCsZvja/gIbwboJjrcZEAGDr/D+Gl+6WAp+oEez8TXIB2lIElytrseJhXv/tO0KlhEWRp391vNj6xALtjlmMbQu1xlfQ8g9odPgS7nKNpn7DX1z5JMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724862533; c=relaxed/simple;
	bh=ZgtTT02TLUno3TrlSZHlkNzvdrNDba4wlU26kh4veFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lGaewoyLi218Ch45b60Mey3wfbiYn8Zs2v53bvhVlgWldIgS90QNMj3Pcp1LxJG2eo8qj1Xo2totwEEefuVQZQd1veCLeHyVRvmQzssq4eGBUFEnp4zrgImvHja5xUTYZc7U4XLo+eJXcAcM6n9nxg2JiLb9AyLjGqevQDFeDkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LvEE8kaC; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LvEE8kaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnM0EbJuEM44an+lbb+H9LzOHxSNN2qddpkklbnb4fG4vI6ZIdYFaCIHP9OxZQx3vwPf472B49ngpbnjzBZGz+H1Q1LklcOKyl2b+QMV3L99PuuBLxTi2jw9cWmrmjSHfJaxj1jbKB9C182ajSc6MDODGgdea5k/+P4oR2T1kjMyUCuUlNfixKWlS8kNQWfqa4R+jQ2xC1eg3ZQ7DjcEjWfQVTWgIh4v3nzm4fc+Xv1NdB5+OmQF+qzM8lmjDQWnuL9vsvYslRP9GjsFCygiJRLC123YAutXN7V/EEHBYkllI8w/vodBfV2Q57jllxZv+ijuCPc52mvmFhbTjNS1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGZE3nELEahCAoFWh2c+Dz74VyO5XNAvq4pw2jHFMmE=;
 b=x71+dQ1AMWt/W3ZHMo02YxYWzLii3pXfmU0CJsyPiKOkZHBIVVAyQCiSSZW/dM+kysXf9PveAq8hBlJQN0qa1CcX3HExHr7h5QOlmdZmEfmv2fA9iXX/FqEERG1GpuZRIRXblaMT1bYuQH25r9ESBg3E+S0jDv2dOwryqh+ty89Xa2T8TKRDWP/uaQCDt1CNANrde8nDwYancSs2IpO+RymV8C7DOj7AMFEARhRNqLY/M9U6xQ22SKuj+zfnx0p839z4gFLQkujemQLrceJAGUoceeyZCKMINX9eTnsZBbRqSqDsgaC6vxV6v6THY2ejsFTxPBkboE1xuMVp0YIisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGZE3nELEahCAoFWh2c+Dz74VyO5XNAvq4pw2jHFMmE=;
 b=LvEE8kaCMCNeUE8pflqoqRXsV67y8dj5EBgsSTOrWCHODb7g/q8MkMb+fKSm8O74cPWuD6XzDUGFywNQEnlqobBf82fWjj4FNR4XOjDHmnP3LcE7KHjWD8qnDPhkpwwDTejzT32ulsNsrcDhKTK9FqFUgm0UhqgZpqtE0QxomEbLA4vTKrAIksVH1zxENeRYAEe4stXtreYhfmUDCGRa/r8HPcEgKHXED8R8DFRaLD/grIrYn8uEebuR043iaYNVNO9UXitDyvdh1WqxfinGoi1ZZ3/b0sgE+ID9NBf9I4WPLv8qPPWkUlY0QbC0svjrrHODOdmyHWlo8lp7h9zaPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 by CH3PR12MB8283.namprd12.prod.outlook.com (2603:10b6:610:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 16:28:48 +0000
Received: from CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8]) by CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8%3]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 16:28:48 +0000
Date: Wed, 28 Aug 2024 13:28:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konrad Dybcio <konradybcio@kernel.org>, Joerg Roedel <jroedel@suse.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [linux-next:master 4179/4667]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: error: call to
 undeclared function 'pci_prepare_ats'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <20240828162847.GX3773488@nvidia.com>
References: <202408150626.4kndgpL3-lkp@intel.com>
 <7b28ccf9-63fe-4e32-8484-24b55432c2b6@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b28ccf9-63fe-4e32-8484-24b55432c2b6@kernel.org>
X-ClientProxiedBy: BN9PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:408:f5::29) To CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7763:EE_|CH3PR12MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d8876e-f994-4b11-c7fc-08dcc77e7ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nXJtiAvEOHeP4d5ljQS5Dicz9I+qWvHlIcc6FjumCsuiSp8cR4dTCgdLmvfl?=
 =?us-ascii?Q?ESMNfmNrM4ERrd1AEbYUw+jH/83ac48/4wFe9cL16kgQU7yw0BDumoh5ktTs?=
 =?us-ascii?Q?6ra6EKk0sejcY2hl8o/xW8j5dx1FNS7LgF9bdyCXKCobMyyHWfhR3WTnRZRg?=
 =?us-ascii?Q?wTWP982vU8Sf8LZdwxvcPVUIook+ntQDTpc7nPswqU9fPkOh2YOsXBiwM1kB?=
 =?us-ascii?Q?8AnI7PRZm/gPJeUtBF+IR01iqRsw5gpJztOZ0ErBpnBZFizcqkri0F9vhimL?=
 =?us-ascii?Q?SfnEbkjBJFF0j0jEouBA5erxvVU08qo1RchX8ZS0m0N520tu28uJqR8mFwzK?=
 =?us-ascii?Q?zoevKZx+LbCDURpNldJWzVQA8Vj55hA79CpTH3011CHpU9G6T3KMi5nHzAuk?=
 =?us-ascii?Q?yetaddzJVvLQfAhspxXr9jZhqGgcuJsnZuZtbcGZCB+61JX5xuEcyoP5MyzK?=
 =?us-ascii?Q?sUexqWqc+qAaLtsfc3PRp7ZqHGOiUmj9lqpIZUMzr0y7iEH/6MmcH4NQixSF?=
 =?us-ascii?Q?eGawZ0J4u5IumsHsh59Ghs+ZYNXtMVmc9D8yyC/J9n3krW6RvSmZR5WR6I5m?=
 =?us-ascii?Q?VEDUCbwXfQDX7PGNtbqyIOp6knee/aDbecWsZT8far+DdeNshFAd/+xzxT3G?=
 =?us-ascii?Q?1alca8ABY/jKR7jkTslv/0UpuhDqEpVtsRrtpgvSkHEGqSoaGwqZwNpf0sp4?=
 =?us-ascii?Q?b4QUiuYF92bmAZMsdlMGPJOHOKDSpN7TjoHzFGLQkBVIGdHETQlx0iUIzEXw?=
 =?us-ascii?Q?UHyahRzsBER1Rb66UkapCjOMtIqW4HP9zFmbsUq1PST6NX/Sd2MQxHKFQp9O?=
 =?us-ascii?Q?yIQ2QnGK1hF34Z+z0JZYKfPemevM3Kugc5jubPLaTQAHTG0YTp1qcO9aNlni?=
 =?us-ascii?Q?5diE9MRMdIjm7MveigyJq/83Z2oaaQzM86BdZ2e6IumZb9sgyqWHhGyrsoma?=
 =?us-ascii?Q?6vjbchogwRTy5jdiGKZA9eIunSdOPOiZL2CKx0zcLWW/9In+MCPmC++Ak0rA?=
 =?us-ascii?Q?6As0isI7rbnhM6MfbvfLUfShHZKXI82uBFCqFHi/RKaQ1DfDOr2hlEPcJsk2?=
 =?us-ascii?Q?3eWNBuqB4etE8lUO/rBMQmR/+sh72EW1Q8wJSl8AteH4a81XurSy7eKvBRMX?=
 =?us-ascii?Q?nRRPetheDsw6f7AnR7haXYuCYfmdYRa9dAPa7e2ETMCDxSDuoF+vrscun+pw?=
 =?us-ascii?Q?76FrAiu1No2kZHr/HGZ3SJnZKthoCk0v6s7ISdHcHxvUCLP/5dRh/VDEZaA/?=
 =?us-ascii?Q?KTvoRIz9SVqWtb9TtK/CC0LAHVzJGoWA3zMd5RPNUEPM6VsptaIGWc1bdiF8?=
 =?us-ascii?Q?DE9BKSIJBE7HoXLkhMuyKMVnWnYzE2ssSLbgpRgy2eVzAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8MY3QXRapN5xV3KYVSdLa9w8Pv1tApc5zFrM30vv5MbbU4kledu7czQao2Go?=
 =?us-ascii?Q?ICJdgEa6oeG6a4pOexMlASoO6jwv9UrlBFVbzOppF2lFxHk4RzX4uMNGm6LV?=
 =?us-ascii?Q?tGaFSvBdVaaP5BKP9t3X8PMFXeNn1yQ0qi2uOa3x+HDMFx9JDvCAoNQX1WcO?=
 =?us-ascii?Q?pqG+0kfSN3GvktBRIXuRFGTxBCwdg/gbPD6qxwdRFE7GXQE4fxr4v0rIy5Ws?=
 =?us-ascii?Q?OZxlQSKO8JqXSTTdVmuDkWjBPnFbUU5bncbnJTr1NuMvwNFMxlTIv6iUbyd3?=
 =?us-ascii?Q?YFc8rwNKQL0Dbk3+MnBVQkLYkSiEJSBTQuW/zv/jtkBXAJEEG0oEE04Xe4nr?=
 =?us-ascii?Q?kuuMKPAiVOdvvttdIK4G0KFq/bAcuUG/c54KlPgfnYNSGfUrCJp0rzZzBdXM?=
 =?us-ascii?Q?M9pptmYBLr6aJrWFYkwbHxO9wwWeml9U3ITrQ7E+fv62+3eRialYJdDfTihN?=
 =?us-ascii?Q?l76WoCn2+0sNZPsTM0anMnF9qEzk2aWWWZF2VhzgircqXgNTFM6n04pKAiQm?=
 =?us-ascii?Q?sb1sjuxpQU47yJzcz7Nzy3EXRf+djTxtH/py6fjz7bTHZ4NTPQUfQb831kH2?=
 =?us-ascii?Q?L0TXvxk4J+yVaKJjXE1+TxG9WKryw5hU+kuvypd6g9T7OlsXh+5In1bn7PCF?=
 =?us-ascii?Q?4kYl4qJZqRHc4d+OnNK49E4EsLZ+ZzJKoaxuKDNNXZAISfJIsaMZFicub296?=
 =?us-ascii?Q?VLzj7QJmT7jSWrQJzAFHZtzEpLJa89KVG1YixJk90EAoCBks8TKLYEwfTc+G?=
 =?us-ascii?Q?/4ofyVIggrmzpv4T/aAUPW5jRB4tXePX4dQ3XcubaxRYByOfgLqF+BCcdshm?=
 =?us-ascii?Q?sMaSdQB/7B6by8r26cqQjE/THG9EZchYTBTzQoUNDaWGNvYNqInybZAc0SyR?=
 =?us-ascii?Q?eoYicVFhvXnFdsWGdHTYJJAxLMiEMMXWm2+gJO2T/tRKGt1l/2BdnBbj5sWC?=
 =?us-ascii?Q?+451SYEEsOoD7T65HyKJn4QavE8u2fKThQ4gieN1xSkxO39F9moRgGBz7IOQ?=
 =?us-ascii?Q?IAAvwoW8/9Ns9isUmRpFhMlgx/Lu3cfkeDn89drA5DPxEwBAzaqj/fZMrofb?=
 =?us-ascii?Q?Y5uMkar00CffFQKDKvFvFSmkYhuAjitCe+eyGG070TMauLgQJci2Y4/1dnPk?=
 =?us-ascii?Q?1tmvdvZ9tDSsUypmNDW7+sL9oQMXN48ddjBgXpyonZ0Qv+2MxuHlQZAOB/u4?=
 =?us-ascii?Q?pGlNQcBYuZ/5u/AS+iS4WYUIrQ8nFmN4Uspmseba9n+GyjciRx8JyOig+4AI?=
 =?us-ascii?Q?23Juh910SD8pLiEtoS2NqiLI4RlFe7M1MzumS4Np1rzTa4Tb9qfwtvDKdkvp?=
 =?us-ascii?Q?iPlOFoHA4iUGixZi/UqYsd1icXT2aWmKQ/cd4CJKEk8jOEcDmd9vIH7P6dPI?=
 =?us-ascii?Q?m0RfujLHKnhS6UaOTpWshtXzAuYhhNuIaBYUxWuovuzxKl+D7WGF+yAAH0j4?=
 =?us-ascii?Q?0iAdmUd/kYSBInSWichyEo6D4EI42sK76Z+mnhNGZ6aaNI3O5sAB2U194e2P?=
 =?us-ascii?Q?ei+HX3/aq79T8Xf9gCNnWJSoHoLZIRInfy15HAmziB8dqdISWgZuB3kALDoG?=
 =?us-ascii?Q?fMDE4YeExnuLkDtxAQgSbJJdXwr4VcyCHWACSm0w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d8876e-f994-4b11-c7fc-08dcc77e7ecc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 16:28:48.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsQuKeyWGQd5Xd45zMdn9QFAoP1HLrrh3agXxR4Vqd6kt9O8i3wF6aoYofb/N6ad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8283

On Wed, Aug 28, 2024 at 04:51:33PM +0200, Konrad Dybcio wrote:
> On 15.08.2024 12:09 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
> > commit: 2665d975db35f124d47e9584d448a3fb4d54f225 [4179/4667] iommu: Allow ATS to work on VFs when the PF uses IDENTITY
> > config: arm64-randconfig-003-20240815 (https://download.01.org/0day-ci/archive/20240815/202408150626.4kndgpL3-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150626.4kndgpL3-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408150626.4kndgpL3-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:15:
> >    In file included from include/linux/crash_dump.h:5:
> >    In file included from include/linux/kexec.h:18:
> >    In file included from include/linux/vmcore_info.h:6:
> >    In file included from include/linux/elfcore.h:11:
> >    In file included from include/linux/ptrace.h:10:
> >    In file included from include/linux/pid_namespace.h:7:
> >    In file included from include/linux/mm.h:2228:
> >    include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >          |                               ~~~~~~~~~~~ ^ ~~~
> >>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: error: call to undeclared function 'pci_prepare_ats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >     3301 |                 pci_prepare_ats(to_pci_dev(dev), stu);
> >          |                 ^
> >    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: note: did you mean 'pci_enable_ats'?
> >    include/linux/pci-ats.h:18:19: note: 'pci_enable_ats' declared here
> >       18 | static inline int pci_enable_ats(struct pci_dev *d, int ps)
> >          |                   ^
> >    1 warning and 1 error generated.
> > 
> > 
> > vim +/pci_prepare_ats +3301 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> 
> Hi, this is still an issue on next-20240826

https://patch.msgid.link/r/0-v1-3ff295fa1528+d7-pci_prepare_ats_proto_jgg@nvidia.com

Joerg?

Jason
