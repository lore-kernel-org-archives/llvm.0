Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43ECA52;
	Fri, 25 Aug 2023 12:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfBsGuOBrWkkeg/qLO2t4kMPhXtO65Sxbr67Qdv5htQQ92ROsMide+UHGRMUDGN4hclwABidGKY773bHpfD8Xl+gZ6wIZBjx7tpBxEE/e4qoH7RISuE98ussIqAoSR7oXQ31EkYwRkazFTYByGzhZutRMEI8ylPAB0oeTqkWqMDJoQIs39SOWY5BJXP7F+MbWCpVQbOIDzvS54re/5tqKWZJgkIfmKnI9hNT5BrMXo5c+2iqffKp696WRisResnhUHq0EspkjfyWiDwavCAOTEbvu6yJVnpelZWQ7McxDM/ckyoKZyTKkuPYYezTyb11/vN0vv3KkPbfRia+lMus0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3d210B3rjoSJanuY4A/gzoKdik/rwe2KhrCZcdBon0=;
 b=FF9wtmnbF1a+AflZ0btJJujRFk2mk0A6Ihn6gY0T0mY77P/Kxf9vFzsWTZp+lI2KchZ22/93fXG7xLcmzjjFEnhYbFWtA/MQGNEE+DIJuFsuaajZ0RC/lWIZ0tTxobYZrp5S18xg7A3kNnxvg//J5b+cN1rmiK9ao1HcPxAc/m4cQlXtAcp9td3ft5kIfiweSUDLLu/N6G0y2IqksNS67ezTfNiO4GDQfhYmiZQf40B2vYvgW1HJqKf0N/biGQn2uqaXPnNBeFPCgae3hyEVTUAPuyuY98rx8x97X+NepzjNIJnA7NR5wrJGMUgYmmW1unk6MzLav545o/9B5s2qkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3d210B3rjoSJanuY4A/gzoKdik/rwe2KhrCZcdBon0=;
 b=sj7PwB19Z8F/tG2OLwELHtER26QuNsu+JPXJYG1bXXHpSAN3bkvSb/wZXUNbMGN83kUhuMTG58WqPrmMXm+dITTzLQVXRCKZLaw0rcdSeJRXifkBJWy+C4JgPg8EgydZiyqiF/GX8j+Ujr0inAfbsY7aRVJZoTmLh33JEs81fkTJQGkgl+gsaN6OgsQgRj5HOqnkKHccHzMrH5Ok2/DRtTZZN6DT2+8lDfMdJn1qv42eirXj7Djc1rglfINXEVh1pjDnU/p2oFdyl0uYVFeVOPCLiwqs5dUFMxlI/VfNhFT0216oKCfpctj2Evp4NxmGTcRZmJlhydtPxYGZ/gEgtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 12:12:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.032; Fri, 25 Aug 2023
 12:12:25 +0000
Date: Fri, 25 Aug 2023 09:12:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>, Jessica Yu <jeyu@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [linux-next:master 3581/12910]
 arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration
 must precede definition
Message-ID: <ZOiapxgvLqM1w+DU@nvidia.com>
References: <202308251949.5IiaV0sz-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308251949.5IiaV0sz-lkp@intel.com>
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 390e59d5-27b2-4bdd-d38f-08dba5648b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tv9/+xlKePyoSYPmvM4CxgejZIGVur3mhdSNsadvNSY11iSSSmbMGsR0UP726cXRuSfIWxxjVPPbzv8F2p/WR+e7MCWaR5d9xmhyZdrgAmwQKc0ronD5paLOI6oLDddfE1FDhqJ/Y23hdFHX/XF/+1c7ylx6L7ZCEE4ZgxNgT7T0k2l6BFVGJYvGuu0/7rULnR8uoOKKSHFUyPfsGsHzuj4pzjFINJRx9D0EUwRLZhL7HnCUjQXwBwosNOl2fDc0k2dZgiAemDcHdTRpFBHW6+nv+k0lhmECLExtEHseaRHALR1TAMIwDMMehKBifoXh2q5HyAbIvp97lDmYtHeKuTCXTMdb7FhBxZVEjLy+f4mTE7cw630RNkRf1cF3U681/ZaeTKKm39lfbYSq6DPWH0EepfDcwin4i7ba9akkuphykC+2WLn4R00rAvAwG/i77j8wXVl/DeKd7hjhQTCwI1qep3aKSY5rYxXTMadxj+mhuIht9RqPj4nOnoMymhUYsDhaTWTjnxdmKdD1nluxypD9qFITszs3fbtuxJGAZIA5/2aH+2wH87lB+DMWa577dYwDyKIwGWh7CpLvDHMnkrP67EcqqcCqHPipgbf5m21RaMFSUU5N4LazrL/t4A3Lz8FYkN14rqZ9Tzxm6jmi8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(186009)(451199024)(1800799009)(6506007)(66946007)(83380400001)(6512007)(26005)(2616005)(41300700001)(66556008)(66476007)(2906002)(7416002)(316002)(6916009)(54906003)(5660300002)(8936002)(8676002)(4326008)(478600001)(6486002)(966005)(38100700002)(86362001)(36756003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ru3u2yXHr22R3f3nOUWAwJNNBPawsIqVNrATCjCk8bCkgTv3Ra8JMHuJ8ANy?=
 =?us-ascii?Q?DQB9qhAj8Gn9sEUgmguiKjFJScvhTYGB6PWMkdFFIck9Fz5XZoKV2FB6HYVI?=
 =?us-ascii?Q?3VdszisAqTHbdkpdDvbPU8Mpl46GiVas4U7NMjghc6/axHlR5ilNi9l3jJHW?=
 =?us-ascii?Q?vPuYW4hTiNdHKnX/xyjn7fk+Ho91g3jWfS1TWoSn9/FMkp+4A17BDymOYHTN?=
 =?us-ascii?Q?ZTq2iuAcT6ZFEQ5g6uUTsAzSvWAUxndOmvI9QUUHnHZ45X5PGrbyO1HCeuFY?=
 =?us-ascii?Q?3WctuMedI23IFRXbFeHRzOxuiDYnm1XTxUkKeB2UBWOS3hhzhotiPaTYmqNW?=
 =?us-ascii?Q?pL1oyodTtQhtNgADvlhpE2BtYvNSXd2Qh6/IT3BDhfw0b2sC7xpQwMPbE0iY?=
 =?us-ascii?Q?xQQf+i5p+frfhLw7dDGDnOgtbuInKHSqrhK2UBokUF2XA7goi8mHD8IqnGrV?=
 =?us-ascii?Q?Ou7yzY7EA8vtIlH18lqzd7aKO23D0LeewQplPqe86GIxn/1d+5xL+MJ07onN?=
 =?us-ascii?Q?XywkhMQdcB6IQKMsiXd9t0TSXRz3dZFIswpomTmtvwLj/Ka1/4foywy6liE1?=
 =?us-ascii?Q?A6fTSd60/x8PHt15LF8AlunoIc750MpvuCgCpFd7AUNU3X51xH5bKmuOOZiF?=
 =?us-ascii?Q?em0f/BLlGcVycfxM6Tk7zzJ9UlZ7AdHwqanOIpZ4rtyQrso4jUNrSKR8JMZu?=
 =?us-ascii?Q?ih5wFgBdqnrTnd/TAi/H6yAoOubDFsuSNimyfI7e5UcVVZq//J0I4hzmw2MI?=
 =?us-ascii?Q?bbW8VWPOeO8EqtQtiK81NOXbTKir1vrrGfsbqeotqo3vt/IoL4ALA3ATCw8i?=
 =?us-ascii?Q?DRVhDjIfwdUm0VxjmoGr+wgMY3xhDRehtXOlry+WhFG3XYdSoB42JIEaCSit?=
 =?us-ascii?Q?XDiMKQhQ32e/47qHf4UFYwWRsOaZMVFJBYa4noc8B3ZK/ZENwCZ2YIzWQhuN?=
 =?us-ascii?Q?+XwRNdM4XX/CfLRDhE+eCDr87PuNDC85lG+0uW50hQYT+Cgqd3gqM47yRgnB?=
 =?us-ascii?Q?DwnLJlhzMKJ50g07KfTzG+2WR1mEABa/zvNT86fOga5R7X4bUZ5OAB6eRdK8?=
 =?us-ascii?Q?O6c6TbopBj8LyIjgpzDRWJPXaUxM4yuS4xBo2jyn4EqOhWcjb6hxGfxVcPl3?=
 =?us-ascii?Q?F4fz6qj+hEYmZxflpSdVrZPU2119Af/YF9aCgblFBYRLu9hALNmb17vaUI/r?=
 =?us-ascii?Q?VUDogObbP7jUEk/Huo90twMXjFglJX6iv9EgDWlCfqDluDbnFq2Ksh3lBRI1?=
 =?us-ascii?Q?mmgNuSElH1dr3g2F+A9a3dnwEuV/ZrxuzVte1J1VG2ziTa508cL9ea1g2Iio?=
 =?us-ascii?Q?WJhzp/obklvRrsUngjeIyhPdW26IsccHk0/0byX8iwv5HHLB2zFsxA2KfUEO?=
 =?us-ascii?Q?Ip+URD7Qs8ebQ+mDo9zHJHiIzv4gt1o8S5PEIsKdq8C8Okn2EYbYMBlwPJMZ?=
 =?us-ascii?Q?pBTLDwY5mTGjIewCXhyxa6AbRZy/UcLcIHbQeIV29i+WmDrogmoILd5B6qcE?=
 =?us-ascii?Q?rSgTjOxyphpbc3SNdrxd5fNqO8kvHWIVpdHgDfDMWYoDfE4z+ahHMZoOCbzH?=
 =?us-ascii?Q?4lCJW0/3ZQdz4ksGxUcpnxcNuMSmZ/FjEEmEOVoS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390e59d5-27b2-4bdd-d38f-08dba5648b43
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 12:12:25.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RilJv7QnTOJpj/oU4CULe/e56mLfEBSg3RVH8ucia9GoNTjnfAWHF5s4JZ/XSBxi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349

On Fri, Aug 25, 2023 at 07:23:29PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6269320850097903b30be8f07a5c61d9f7592393
> commit: c1cce6d079b875396c9a7c6838fc5b024758e540 [3581/12910] vfio: Compile vfio_group infrastructure optionally
> config: powerpc64-randconfig-r001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251949.5IiaV0sz-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251949.5IiaV0sz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308251949.5IiaV0sz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
>            fn = symbol_get(vfio_file_iommu_group);
>                 ^
>    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
>    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
>                                                               ^
>    include/linux/vfio.h:294:35: note: previous definition is here
>    static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
>                                      ^
> >> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
>            fn = symbol_get(vfio_file_iommu_group);
>                 ^
>    include/linux/module.h:805:65: note: expanded from macro 'symbol_get'

This VFIO code is fine..

>    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
>                                                                    ^
>    include/linux/vfio.h:294:35: note: previous definition is here
>    static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
>                                      ^
>    2 errors generated.

Clang is complaining about this line

Which is from:

commit 13150bc5416f45234c955e5bed91623d178c6117
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Tue Oct 27 16:11:32 2020 +0100

    module: use hidden visibility for weak symbol references
    
    Geert reports that commit be2881824ae9eb92 ("arm64/build: Assert for
    unwanted sections") results in build errors on arm64 for configurations
    that have CONFIG_MODULES disabled.

I assume some tweaking there or a clang change is needed

(BTW does clang actually work on power, I tried it a bit ago and it
didn't get very far)

Thanks,
Jason
