Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C036AA3;
	Wed, 30 Aug 2023 17:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b422HB3ShJTUZkc6GWo9hUquFHplJMFD5nciol7b8uoaNh/iphxRJMT2qCCERn51FZbWxxDTEbn19WkL27S5+GZNcyQ/yW8Ewn7raKZRTSLYBDSZVbel3rkws55j/i1q1mF3WUQ3HjVy3QgaKj2PbQrvzpRM6gRyySZ4ehATmLWMcL1q07SuD9DrMc4foxCyiYlK8z5uDQbfa0nt3ioOk24cprPwJrzeNv6036zKn2ELheRPJfh+7MhyP4OV8BxS3Flu418xz0KjV8OXBTSb02nzPVE6VKjrGEJQpezrv6PWytTcgIPjXNKJ97fvkQ0AaRLwD/7vUHo0XqfIuPeu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPyuCE3/rAUSg4jcRT8BmsfYQvi5ZeRUyp1C7i08UMI=;
 b=DlTZac9OWN+UnNaOopU1RH/BdFbVFtYiwPv1VZPILomPzYA+a0Ggk2nOtywhiPmndDkEYoqrIhWbQ7qdqXeHROjWEg/2CK6aG1OYZDCIgEKkJnpCuP7WhLchvkk29/S5BDt8BnI7BuwdpHZ3bNLt6qMsqiuL6qwVcZHxK+6GCVTBXAHX4dimK4k4L+G+SlAGlI2lBdO2Ok/pMcJxTezTGZnFBakWX2ZChyIquGRf9slYs3URLcEeQOrOc00vjJ4GQIe1hTB4ijwAOlJDnrGlqoCWAFuGced1MB1N0XAa/MaxxN2KbHL6zaStrLJD/0Wjw/VaZyctm/D8MCJl2enqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPyuCE3/rAUSg4jcRT8BmsfYQvi5ZeRUyp1C7i08UMI=;
 b=BbtaiC+M5kyUxbwP/06u5eP9HvRcoPZlM5fwIpyYJYcsDhA/b+ZFIezXaP/wAso0IxequjciJgQIhb115rGQ4rKl0+v8vGqoawlsimOEiMMn6B9ZVaKnM2X7kXA2A26+i2JfoUmHg+oEhOuyztDDVUU3yNnV1WwvcEO2S9tRnScd6SjJxnvdYKjk2/TOR5ust44XWOupfqP4kpOXa2L0V7M9LpqtrsU8WBbbzQJE/9Qimj4jiLcLUD8A6nOP9LZa4j63UAFoWztdmFFNE7BoSwjM4LZDcAqvlqDz/cT5yM9MJB8EjIG6rvPxoS/P4x8/UHb5464urmK4vtuJUUyN2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 17:19:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 17:19:19 +0000
Date: Wed, 30 Aug 2023 14:19:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Yi Liu <yi.l.liu@intel.com>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>, Jessica Yu <jeyu@kernel.org>,
	Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [linux-next:master 3581/12910]
 arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration
 must precede definition
Message-ID: <ZO96FJMTmA0JCkN/@nvidia.com>
References: <202308251949.5IiaV0sz-lkp@intel.com>
 <ZOiapxgvLqM1w+DU@nvidia.com>
 <CAKwvOdmoewb30p1yazbkPAEDPhrSN2csngohDiC2fOJ=3Mufng@mail.gmail.com>
 <ZOkDvPOt/UMprbU4@nvidia.com>
 <CAKwvOdnBg2aY+WwG_GGusRcf-XPZYyqNAYoDb62dJw1MoZs_Nw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnBg2aY+WwG_GGusRcf-XPZYyqNAYoDb62dJw1MoZs_Nw@mail.gmail.com>
X-ClientProxiedBy: BYAPR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:a03:100::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: d691808d-6cfe-40ef-9cb5-08dba97d3e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PG8rICj6oRxSi9cRjuIWz54Sr61478KfaaxtZXMhOF9g/3JN02AGSXFUK0ImNYtT/yevIhuhgGQEv5IHcdbAKCTx2nNCy3d3I09c8KYts6aWCdaVz+cQRqR6MwtLa9mYvg668lB1w11h8czxhAld4HHHy8RxjLu8b3H2ueeQsTfE6pKi7zIAgC7IrOp8qbBslJdQ0bJeu74jPZmRPuq0apJT1NDwbMjckbblsCYCBK0y5hO/bvw7V+8Wvny3rFInngNNMubNiOzvUH29yJYYiX/U0fEyj2M0FyjcvImvSVM+Fc0cWErIiRLil+vousHhMSnsXq5jCmATHyGs5tWKh1xJoZI1dhUOmlzO9gN5GkcsHkKqiJVXC4S6ISVDP3AjNVKk/oPdCOw0jf/iXpmgkDDZ4CxUfuC5Abu0JyfudkSvzny/YhH3y6moVdPIZlmrOPqI3mU9AsSQpwmahoksJwUvFXzNzrrzCTCp6cY/9mqABa4wsN+mggp+8cg5hi3GTq4CeGke/eow7kUAGgdkCwgtIKzZi7iJm990SWo3+/qSMqgM5ncqHXU8R/G0Uvgw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199024)(186009)(1800799009)(6512007)(26005)(38100700002)(316002)(6916009)(41300700001)(4326008)(7416002)(2906002)(86362001)(36756003)(5660300002)(2616005)(8676002)(8936002)(6666004)(6506007)(66476007)(6486002)(66556008)(54906003)(66946007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aDGJCZl9Rl24hiJR5myh+cIrUArzOxy/lGJMCANavXLuU1a4XQnoP1Id629+?=
 =?us-ascii?Q?jigQMmH5F5JVX5qG4ywV8L4Dc0zw64iGf/9wziiPsAigok9wGn5rEHO7oiFZ?=
 =?us-ascii?Q?Acb+G7Lm7uoICIHkw/e0SYAYBh+sH135o9XQz0W2mlIkjCLJ7sO8ya7PlCy+?=
 =?us-ascii?Q?qhWb8iiQS8SxSC2RTNKoe5rLOkWMT7aUqsByFEb/w6Ro9bGFgmhvdq0JJ9mJ?=
 =?us-ascii?Q?RPLwTucy3gHxgM3IHKlbHkJOfKbl1MA72sO2XjbQ4Pb0O4kc0ZW2Hknuq/VM?=
 =?us-ascii?Q?KT1tTkjQuzA0alzEsozT3z5nbj4RVlA7THq2E8GpjA5FErWf2I0RADxs15Df?=
 =?us-ascii?Q?LgTgK5cAxPHmVqWNa5n4AyMLss5MWrT7SXb225KZcE/ao+bMSKuya/PwiD1G?=
 =?us-ascii?Q?7rhi/8i3ioikDIeT4L+iVngjQvFWbylKqArguEN945sbpyjgz7XOc0piYS+K?=
 =?us-ascii?Q?gXaRPtn/frIan576gmIXEIv6bzIbPHz8ZYSW3Fff4kfmymy93lwNhYA/UKQy?=
 =?us-ascii?Q?WAqPopIhBRH42xJB/dfrMN1/rk8eVoVvosH8zKItT79GrQKhS/QGXkFynwQV?=
 =?us-ascii?Q?gcMqFWBorqU6OskDlu5I7ov+w3U3f2Kux3XouSpye0f0oV3cqxOz+h9+3C1d?=
 =?us-ascii?Q?4MUufvOiKIAYYa4OaqAUWMCjUTJmRm/5dcR0TXH1Z6K0Zm/gLLSVapZVM9g5?=
 =?us-ascii?Q?auqrs8Jkgrif0C8zs+sBASuMvnyXOQmGuYsjhWE9iTN83PKYL8LtGnQ+6ydD?=
 =?us-ascii?Q?CBomFv92cjfa8AN+i9QAhYnWUy4ibYhSo3+gCm+HWcyshRDCk23PYKcNbS+Z?=
 =?us-ascii?Q?4bNr5s3BTvZB5A4rgWo10Cu5xjvFhzunGHRcSFVTSKQwfMqbFu0v7+fXWCC9?=
 =?us-ascii?Q?bR+wNtcMGwQ1LPbCmIn4d3BDFJuDesAf7RYsoWy/ZZ3619uDkLcgjG488JwR?=
 =?us-ascii?Q?W23bsO5nexK1Bj/wVf8f+bTUpaCRGpgB7cW1Z5gVGcP/DIx0GP6Fua/CqcAv?=
 =?us-ascii?Q?8IfM1qrnzUQUMrPDHMEdgv9QF3G3bL2l2HLHPQtDIkLQXqCKuwgd/AZOVNVn?=
 =?us-ascii?Q?H+Xcsm/lwrOVPXOYyE53uClJa3CBNKEx3j2FUi2IZKmHBwPUybfQRpqNrjLb?=
 =?us-ascii?Q?Bs/kLIh3LGp74pLet9lBsRV1zUkF9FMRw+bWaoVsR/BPdsZBJQcG2IwGZ9dR?=
 =?us-ascii?Q?B3O4da5V3P7yCvx0kC/eS5GPxzbH4/iJoM393cfbOt344fhHjKZLWqzYgiPF?=
 =?us-ascii?Q?IxLvCEoq18pJjj1Oa8nvsM/j0znOGZnHdWhZLhkf0/yLsxOreST9tKIpqDiZ?=
 =?us-ascii?Q?yNqswAzqqxLf6Rvtn+HN3W9r4J29RzTL2/WTS8cwipqmQQwiGzeywtO0J1td?=
 =?us-ascii?Q?1A2N+JCkDCwUrNXGVAbQQECwM9ckWcEaz+UgPXpIKeqs5r8MIkJDeQSy8fCJ?=
 =?us-ascii?Q?yLzNGB/MqRtAEhcAKd+9MCmhTzwGyJtaScvq64qyPMKIOkKb4zOs/Hp1CauJ?=
 =?us-ascii?Q?zgxDjR2Jg+3MLz3zMsbhNY7XTQXPFWmMIBz8E2Y/QyZNXBD0XoR3rZCxEwhk?=
 =?us-ascii?Q?K2Gpvii5coTu4qjlLgIrsLd8atzGm0/gXxbfyx/q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d691808d-6cfe-40ef-9cb5-08dba97d3e9d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:19:19.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iexPTSUVt/Gf7zGZC4Gapk221HSC7p/1WFN+QC983E0IKpn2g/IvKdcgvBZi9hz9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128

On Fri, Aug 25, 2023 at 01:04:31PM -0700, Nick Desaulniers wrote:
> > I think the issue is that:
> >
> > # CONFIG_VFIO is not set
> > CONFIG_KVM_VFIO=y
> >
> > And
> >
> > kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> >
> > Which is a combination that doesn't make any sense.
> >
> > Looks like CONFIG_KVM_VFIO should probably be called CONFIG_KVM_ARCH_VFIO
> >
> > And then
> >
> > config KVM_VFIO
> >      bool
> >      depends on KVM_ARCH_VFIO
> >      depends on VFIO
> >
> > (or similar)
> >
> > So we don't even attempt to compile kvm/vfio.c if we don't have VFIO
> > support turned on.
> 
> Do we need to split the Kconfig?
> 
> ```
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 484d0873061c..e5ebf89de855 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -61,6 +61,7 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
> 
>  config KVM_VFIO
>         bool
> +       depends on VFIO

.. I don't know these details about kconfig very well, I assume there
is are reason most things are done with the HAVE_xx approach?

Jason
