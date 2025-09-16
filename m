Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E59930E0F0;
	Tue, 16 Sep 2025 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031986; cv=fail; b=OxvmkKBFJsYDJ1F6sZq7YLiJ4rDLZDkzoUsiHvLfbdGww3dM/VWXZoEHSLkdf0NY3reKLLsxNfQCTHfT2J/g4Nl/c/ODMyqgTNe+MgrwUHX/Qfm8cRdG9Ie/5B1j7uarOsr5GrOOdfA2OqN3lc0+DQ6gGbI5d0GsurGlraD8p90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031986; c=relaxed/simple;
	bh=1WrEkr6rRINh2m3G0Z1s5DMsi617h4ArfRjbIwgFZW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CzfLVVIu5xJ6C60KpOO+KUkhBaN5KUAQPS32ji7M3Z5bU/J0d+DgSSk0DdIHQzREIVCvRSX+ixqdrYyqqLGXImHS4b4ugKhP5v1NnWTmQltk7OSFm6oR1dJvC/coyKVpyBhy1iaIyvBbeqCzrxWUwwrDf6DpfeEWaAZ6YwWrZCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gYYv/T5H; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gYYv/T5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeohwodkSCEm2LIj3J1O2c2Zj9Y5MwnVskQrW88j5ol1b16LW/povZjGwRTgqKmcUIRrghuuy+5Mrdlmw4XgHy6BxQeJXJR+f+BBhl14EwgmA50SfJ7rmt8ar0Oq4mbukKmWaW3yFJ5oH86Jlp1YhFmDhgCHLUOWo+XUbe7pYTkTgOTvYOf+Z0O0AgExBMLSe0bEvsP4dQHwvItCFz9gdaxDo1IqIRHcQb4udNU2HlvPTHonbcamvr0cJPw/NBKzrxCeIieOOEexNer2V8Ml2aT+QOfVWEfU2pNbj+eb73jXLBFi3ePxIw/0itVIr27KNO7OdVqUc/yMTlEPauYVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XmgJlts/oiBATVhr/qxs7pLJWoFpWaNIUabsIyLloE=;
 b=ZWTv6Pop5v/65qZnb97R7wqIkjbGyowTK6swCy94JvlApNB01VjjHZAySnOKi2onSTljJuNqJx7Le9w12YYjQ7I4x4oN3SNBMTcI1A9EYmB5rPIFn6a3l1cXQerzI6ukQUlbUwpmVjILTp7c3LOLQ0zZWueoGVQZiyp9Bj8Yl0owSvfzEvE+ChRAQ1+flDE3mDvMXqGt1fBU8rQz92ZsyDA7nf/LKEIrvwwLGUsVnfaT5unrEGj8KHGZ0wBKn4EXf61oiU/ySjP8BVQ7gkUhE8knim0ZBKy4SqUukZojnQjm4ylnWsfVUpCy2B8io1huBGRKUS7/bg7E6/Hq4jjvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XmgJlts/oiBATVhr/qxs7pLJWoFpWaNIUabsIyLloE=;
 b=gYYv/T5H0IvHuoOCpZQr+W+3/ghNcaQlYHnEW8NTPMTqGSIT5usUmYzwBfV9VuiMxqK0SucCZA6uicUbTiOaiLiBFumf7NHLx4rRw9SQ3QHAyEhMxz7xiT9+UCAjutCQqk2W15v/iiGiOzInSm37LR48h81YSCDzX5/mCfW7eFCGh/Cl0bpKvRhEUL9/rNlbVk1MaMbGm27uvJtFCUob7/IEgg0GztxyoBsWEaP/47+TP1A6GswsbVtX0QQBnsReZup9Vko6wACNwy5OQrK/GyPCkLq18XP/dFQcPdM6gMIVwvOME+NPaigRQ6ikDpPkstaLV+rOxeK7mTiNiJjskA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS0PR12MB7583.namprd12.prod.outlook.com (2603:10b6:8:13f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 14:12:58 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 14:12:58 +0000
Date: Tue, 16 Sep 2025 11:12:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oliver Sang <oliver.sang@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20250916141256.GF1086830@nvidia.com>
References: <202508271856.ixwxgh3g-lkp@intel.com>
 <20250902124856.GE186519@nvidia.com>
 <aMj38M8HeDSQHQPf@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMj38M8HeDSQHQPf@xsang-OptiPlex-9020>
X-ClientProxiedBy: PH7PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:510:23d::8) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS0PR12MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 856b8783-ba6f-4a92-3c1c-08ddf52b2330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TneZnmlRTnWWECXHUDv5WCreiZ718yI7BKFrLTjLxv/8uPN1j9scjB0+Glt5?=
 =?us-ascii?Q?546kdVwVH+Cy2oHC755nP4nbGRHHbRrrU8nZ6Bc8MOaBnmkWNFOjcBWymVkL?=
 =?us-ascii?Q?HNJb6tq04HgSA1yqDQlS8cKwyDEWMYW6qin2XnndzoYTuAZjRHPLFZEG1CBy?=
 =?us-ascii?Q?beiKrUsNIGg6Sy7PYR7730TcXfzgPzLlby/Ysu4gf1WQsn1KJItEgOpl3DmA?=
 =?us-ascii?Q?74/Lhoi45yPStPulVnpqSQ4JiQMF5ZIzAqN63Zkfl2FxyW9JLilnyBD/h+oq?=
 =?us-ascii?Q?+PfbFfEipfr1UQvxNj2JUQXkqt7mAoEWA8SC/Ba41xuQEnzTKbqhsCAt8fr3?=
 =?us-ascii?Q?pckBU03O5JcZq4cno7X2k6nnWeahn477SqlIDDOYfW7DhtVyqQCT3gpbMDeA?=
 =?us-ascii?Q?7HehZymbsIvabTqHEq8QnszpSgwRPCdHS4Q/UOfX3u80wayxuELxAhO10DVA?=
 =?us-ascii?Q?gPdlqPEny39fF6e4gHde/BKBuX3qpxEO0yuOuR2KYUZAYAgBTlcGuplzjZ69?=
 =?us-ascii?Q?9pS0/3xAL70QU2d5AQRktBtDm3E0MLMZW5upXmesIzlbdOyniSqIwMC85y56?=
 =?us-ascii?Q?I4SkFasmCkJEJIgYH3odmOHNltZj5NXMcel1ynKMmjfEv7vOqyoHfjJHgg1H?=
 =?us-ascii?Q?9YszA54iQGsuo1K/8VEH7S+4Xie3LBz7C+zWAvtZ/3ysJeMqOmkljPRQrJ2q?=
 =?us-ascii?Q?nyO3nU6QGZFo02gScZHf+/ezsszzylyJiTK8gWr/ki50sfbUj9PAgLOCah+x?=
 =?us-ascii?Q?RC2/aAFSDJgpWKxB5rca0NNR0ERF3zECK8qJ/xb4L5zrsXF0eG9c35i1A53u?=
 =?us-ascii?Q?I6rxlAN9Q5YlBgceHNW8P2L2YlOcviyUf9S33QqNLk3HDEb5LE80u/zHD+y+?=
 =?us-ascii?Q?bYNWQ1aEMvZNqONjLDcaQxndRe+4w4/SOWLv4JegX99t7UA4RyDiiF5w5+Xd?=
 =?us-ascii?Q?UAAA9LWqOik9xwhrOd9BLAS+pcFbyZULWzOGI8Rf7Bf51oAWk6RjcjP+bOTr?=
 =?us-ascii?Q?2tGi9XvyNMaUC8VzXqg/OAftaUFTv3UJY22emrSeQqZCgy0MLnPESogBiayj?=
 =?us-ascii?Q?hD45RNIFpVywQg8iON4TX4+WfbMT8Tq0q5VO9536dpx3rqbvQweQuM87yigh?=
 =?us-ascii?Q?V5TJ1HjeBo4IdbBa/6UdmYklT/ENWndHmja/YFpDZcRz+kTXTE3Ex0Nql0EY?=
 =?us-ascii?Q?jRvGByPbhzp0EPmWVbGVPuwGnK41019XD+ynwq/ZRuTOz8w4qK23bsag6xTZ?=
 =?us-ascii?Q?V7KHhnD5AVLESWoD2v3FDU0phvef1rhUr1Xlmt4nbGIlx9NZrUWgJ5WN+6QZ?=
 =?us-ascii?Q?PLSMpKoDi/eSpxGkjW1VdTFY/xPEhIeWIn7MT3QcuiZZeeEnIqbXXvVgyjei?=
 =?us-ascii?Q?S170zAzjnXkXppW4PeOxSq4kBLtB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?215wTtxTbRRC+743oUa/1va9sTRRQdpyE+7MkCOsUvjNP2oCxXX/QpIpxGMo?=
 =?us-ascii?Q?nccpkd9hwJPxDDHMJv0bQR8QnfeGauFN6RbEMQBvuYQqjehGGz8XGg4vdJ7w?=
 =?us-ascii?Q?SRSA2VQvUBL2ZA5gxVNEwTbE6VzIOekQUTR/Ql5KiDtpJSLvBmoT68tOrpIW?=
 =?us-ascii?Q?GVNzSQfFP1f02ToOKjAaXUWJtlhMMXgtXAZZHrpmnKTDbJHSSPNiDOL6hYnT?=
 =?us-ascii?Q?rYYAFdBuVh54YWyquni4L0Y2h3mcc/th1MIqjgcOCitIg02BbsX6AozVSeTu?=
 =?us-ascii?Q?bFq5ZSLQrF9BWeWmnggL+Hjg+0TAeXSn69vBbMhmN4UM8GaYUctoMDEGoJSz?=
 =?us-ascii?Q?n8M2Zwvl/y5Q3opkEpv+lsft6XRLnPkHF/ihhOuKpTu6lDz34hFwN9WRNBcT?=
 =?us-ascii?Q?g/3qQd+RqKJPVfUQ9dAFLOfZ1eG285SaPm7gU0uYK9stXw9Z4glmAHTREadp?=
 =?us-ascii?Q?gkGoZoY9oD7SWTqOcQaxIR3lubwpuOYa5wywFYE6w9ApEYWmWM5YIinIBjQd?=
 =?us-ascii?Q?1+rGpzwC+pYO4A9ML38WSoQ/WdSJDunGsNriYSI7G4d9mjdcdwXkg4sTXLtc?=
 =?us-ascii?Q?L24kw/iXdy3RO3C2oxTKRWcUbH/ZHFIeB11jUQBx0TkUEAXFpjV2svzMYnn8?=
 =?us-ascii?Q?T3ExIOqbIhdRR9wJNGeKFY0MFYnt83oZpfpCXs4QVYVHfmR3GaCjo/ssSRRO?=
 =?us-ascii?Q?SA+3k0F9O9VEsDjSv1jGVKaARVzjXX4ox77OvvkglFPCsEfVVulcbZkXaUJG?=
 =?us-ascii?Q?1mUFGNJmpfJwsp0vrc7c1jB3j+wQlECzYbx8bSUL51jU6R0vnZOG8C/3JeDC?=
 =?us-ascii?Q?gU7rjOshPrSzbscMTG1eGI3BZ7Vdy2wN6mUqo57QrTWifZ4LZnED76IZmEzv?=
 =?us-ascii?Q?exptjN4tqSBzK4j911imCKZ0HwLDzeU/hAcXc67+0pjEEJcwC/ZBv7dpEYVH?=
 =?us-ascii?Q?8YZtkA4uAYkI0VC4LVVcUrFze7CX84+NtXWZBIb2TJVSapV0wt3GEnuBG/hT?=
 =?us-ascii?Q?VcEE7RPVIllQGBtbrbxO+aHLQ4eh5TNZyN/lYXNVTr0drja7lHgG1UcYS3qt?=
 =?us-ascii?Q?ndXATuqj/55hcFRDaDfPAxLDFYaxUOWE40SLZMAfdqwTruX1SgjmC3azVvYV?=
 =?us-ascii?Q?g+2HAbhlE22tJZ/bAwkSNcMvcjaEOUhAc//WCDCKXWPC6C9I+/dZKLhE6gM0?=
 =?us-ascii?Q?9dgdEhttaQO4ofNj74Ahsj67tqgLo5+s4xIxk/k92paGZhTmyniSvAF1CRF0?=
 =?us-ascii?Q?26RnMrZ3Ow89kOhposDg2mEwSFFqjgIme68LoZfbmHBwC/gOwEtBhoFru+Ft?=
 =?us-ascii?Q?ffCZKcZcYMHbAxsGJV07BmQ0d+W7tX5l4HEboVoiC2Su0GEbI6fskCqqQw71?=
 =?us-ascii?Q?njJKZLQ7g9aD17EpSwEBtJ4aK+tgTT7EvEfUjmIbj8NrNJUzBsc2jPWf6c6L?=
 =?us-ascii?Q?UFXUX+49/5nM/Gfln9j0QzBgX9Dss79oHnd/1mHG0fD81k5MJ596hhgGT1m/?=
 =?us-ascii?Q?htLgAhvbFVPwR7ABJnL8eQ59VA0PmsVZ/xFuXWVtWO+tJThqAqrnJvtsinFI?=
 =?us-ascii?Q?J+rIdAi+F4OgpMx9N3kzZ4VAYqV36YWylQuUqzp8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856b8783-ba6f-4a92-3c1c-08ddf52b2330
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:12:58.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW3i474+j9fiE0eKhLwOkGOqwyGCAe90YsKtzB/J+Qly2kbSvI/JHAh0MPfinlwC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7583

On Tue, Sep 16, 2025 at 01:38:56PM +0800, Oliver Sang wrote:
> hi, Jason,
> 
> On Tue, Sep 02, 2025 at 09:48:56AM -0300, Jason Gunthorpe wrote:
> > On Wed, Aug 27, 2025 at 06:53:24PM +0800, kernel test robot wrote:
> > > tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
> > > head:   fbb816ad5a7780a27bde18e3090b30552b6068f9
> > > commit: 9722034883c205c7cfc7e395cb9a44221f010fc3 [8/34] iommupt: Add map_pages op
> > > config: i386-randconfig-r111-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/config)
> > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202508271856.ixwxgh3g-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > >> ERROR: modpost: "__udivdi3" [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
> > 
> > I could not reproduce this..
> 
> sorry for late.
> 
> not sure how you reproduce? the reroducer in
> https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/reproduce
> is wrong. could you try below?

I used the instructions with the ubuntu clang 20 build.

Your instructions with the 0day clang build do reproduce.

This seems like a bug in that 0day clang compiler build:

static inline unsigned int pt_pgsz_lg2_to_level(struct pt_common *common,
						unsigned int pgsize_lg2)
{
	static_assert(PT_GRANULE_LG2SZ < 256);
	return (pgsize_lg2 - PT_GRANULE_LG2SZ) /
	       ((unsigned int)(PT_TABLEMEM_LG2SZ - ilog2(PT_ITEM_WORD_SIZE)));

Is the source of the issue.

I added this:

	typeof(PT_GRANULE_LG2SZ) x = PT_GRANULE_LG2SZ;

	static_assert(sizeof(x) == 8);

And my compilers, and the 0day sparse, all fail that static_assert, x
is 'int'.

../drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h:36:9: sparse: error: static assertion failed: "sizeof(x) == 8"

This is correct as in C the type of an enum value is always int and it
is a GCC extension that if int is not big enough for the constant the
type is promoted till it is.

But for some reason your clang 20 build is saying it is not int. That
then triggers incorrect 64 bit division.

Jason
