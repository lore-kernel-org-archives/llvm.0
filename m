Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317849448;
	Mon, 17 Jul 2023 07:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4rZ/Y2NeZPONSYUfzHcrQIax53Ey82kODrxEifAVr9gBAIWl4Ty7swmz2H8FWVoXxbfs9WF+4EPYFZHGOsQeqU7KzE6sKiSBPKKNm9ZOz5vUZyk87lsL8m8EUcqBgHOpeMoH9GRiuO2BGUKPpD2iVVDTaCylbCWOCtvXje0Gq+xJK962+jaL23aO2qLt4gjUzGTK8Mz1q0s4hPdfz1ipOgqUt/rpDtAc91Pp9stA6O32NVQeGva1X9NspMFeCq2y7KA1NI/tzV1RZuFfjBd0QFkzGNFWsgu2nOlUGiEtFhtoUorUpCdCw5H3FiWSnwWPe6tFc9OgdNspFAVOD7vcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLRPWsWGVnK46HRi1QsFOtsezDJw5eGm/rhbxv1wr7o=;
 b=R/iBlrcRzY9esjxioO7D7p7svf1oE4zL3+WBqZcyeTmWdaehL0JkLNSc2fWhe7AQl5ApitR4BOPgsT3FcCRzKic2iEQXFgnTibl1byvR4O+VY/ZA6w6pgtY8FY453H5T9qL6D7gGgYjXcHXP9L8qiiuM8mtm82lhraaUgJWUxGq5kM22YOOrAGnvMwYs/ReFOaVkVlE9quruk66oA86A+D6yzmP/+ztIZNq1aaYfdQPx62KjcgTkn3UtW3FA71ZAF2ifIs3IBdEOpoCLwbKYTWD+ijB6DunAkIl9GAY2D1Wk/GEyZ+Dw9uaRFBpW+TJdLjTm+rA3ZmAEX1xgFwCCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLRPWsWGVnK46HRi1QsFOtsezDJw5eGm/rhbxv1wr7o=;
 b=IyM34zizGWt3BP91ojIlS/4XQXc3Gz2j2G/c3oLHX1tX9A/v6etNaNcWi6bDSz11XbPtJdMnDWO4au9vE/FIFHoeMnt6rwamAqUQE0r5NTZKs2FgmPy6QUWW2tru2Dvdf35O9g1n1RY2y3LpGAggX//72KzrpSyO1gFoFoIVCI9Izj/3sOwHlUdHopOxffBSbn8cT5zygbwI/uHgQGoPypBm1giHjlbAGbU6NyOIvRHQcH4eMTs8BTVTIq4COfgza+8ducwZASESqS8mYQdYTmE4D6qna5tI0QlMA7jJTKA4jLoyqFwCStWU2i1AFfFLQ80ChauOBBMJ+Z35s0lmHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by PAVPR10MB7355.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.38; Mon, 17 Jul
 2023 07:38:52 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a171:a3f2:99b7:5f29]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a171:a3f2:99b7:5f29%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:38:52 +0000
Date: Mon, 17 Jul 2023 09:38:42 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:platform-drivers-x86-simatic-ipc
 3/7] drivers/platform/x86/simatic-ipc-batt.c:152:5: warning: no previous
 prototype for function 'simatic_ipc_batt_remove'
Message-ID: <20230717093842.7aee1934@md1za8fc.ad001.siemens.net>
In-Reply-To: <f635e971-ddf5-b26d-7116-473829c4dc4a@redhat.com>
References: <202307141920.qk4FY4D6-lkp@intel.com>
	<f635e971-ddf5-b26d-7116-473829c4dc4a@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:610:11a::7) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|PAVPR10MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2db459-35a3-44f5-1df9-08db8698de19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B798S5VJwO90OdzWi3BXyMcl49Sl6PWQiHrSxUwuRgo46COl+VZmP+yZ8brO/AKflAWTDf/UStQ26rGI6naQFW2OPhHCMoZTV2rF64r/EIi1Eh9SaS8tYljJnSV5Qba/8Uktwj1VLS9uKv2K4cn7s+Tw1D7xCaeDASv41gTODJ0EZRI/LX5tzgjDRCDYdtC6iEIb1LxFIe8HeG3n0uBvxjEhU3YvJv9TJRNjpfvrzcxNhLJ/LMeNG6zLjWfKr9zVjaku2Z2IuZqyxPf2POiNljP+BpRo5KUfyAn1YUwWbamTLlrSKeP0KHxD/cLBPcJA6OMq8Xaqk0wfZQmEbzRDHvgkZkZIrZNFHm+pZcFgHdudGZUAgF4RfXvH5KmTY/jnZP5dJagGa4hutc8mm86clDvSD4ZMedx1k0y8JbGeneJ/6lYo6y1/F3YwUazpsCx7UqhErggIh62TXxizWUKmXgWCsrOksQhnxcU5AZeCKZ7uQweig+kKSOA9/fnIJF0b4kMtMaaMCy1ydILvDFeqHQ572OQsUtqefWexNEN0HE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199021)(2906002)(478600001)(38100700002)(5660300002)(54906003)(6512007)(9686003)(966005)(83380400001)(53546011)(186003)(82960400001)(86362001)(6506007)(1076003)(8936002)(44832011)(6666004)(41300700001)(6486002)(8676002)(316002)(66946007)(66556008)(6916009)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j60oeml8/+a3BTbnydajQUExWwp0BxzVgB4Y6qsf6hMVtEyurXC2KfOYF3UG?=
 =?us-ascii?Q?l0+WUouw9LPvqWInjCHI/QP+kpx8JCe+aN+UlQvlxTdh64Oe/GwUskCaEgw6?=
 =?us-ascii?Q?ZQNePV2nAdszS0KTKIu3UBou2bk/SuOpBzbnM7iCEJqiygN/YVd7TPus4Lge?=
 =?us-ascii?Q?FDSKKUIw4H4fU/XqUYWX7R6PsygsM9+2IjNNHpfyHZD4nqags6zVGwnS0mYK?=
 =?us-ascii?Q?57WZkUu0fjv0i3mSd+dTEqEmtB9QwkEFVwKf5ijI7LYllQq1ndQ6mufl7JKT?=
 =?us-ascii?Q?wuPEBcCz1DP0x3jWwhr280foB3mVybsG4wgsdE+LR7jnrRHE/xDFRsPoLd7x?=
 =?us-ascii?Q?Xa6F+7OG8LniiEVDHttm6Hk406lhiTOdiXwznj7Wx4RpSDaaDHo2pQAXDnoH?=
 =?us-ascii?Q?btWlxhOBxYFEkHHUm+oOzvBoFryRGY+QAFKanizBkNmUcQtzKVIY3tejBfju?=
 =?us-ascii?Q?n98XQbmWfnD0GIMBpntrL4dZdKLYxMzG1c9FTTGOzp3cWok5Cok3mw02HKWR?=
 =?us-ascii?Q?p/kPx2Bkk1R/Krueorcvm3+of5zsTxQITZQ7kSMT0HZGerUZlbwSoSu+t4YG?=
 =?us-ascii?Q?kg38X2fXBgdnUcvV502xVEzB4EgzxmzpN83XxONhQZ3TxXPAz96btYIei5PL?=
 =?us-ascii?Q?P0+wwvxSwbIlTzgaGgTl+/vuVyXfT1Nfj9K5mF6XgWWCiq7iQ4uvsMG+0MfW?=
 =?us-ascii?Q?YtrWgKavmuwnITVsoV/HkZ4qaRW1KDpbaQGZhU6dIWzupQ63hUEaw+MdJsq2?=
 =?us-ascii?Q?UpPWH7tJlbT2rCr1ajLL3rk1efwodH6Najl3x2PxSMNt3fJmeoE6u6N3q4+I?=
 =?us-ascii?Q?GpVYahAUolo+b+zY1aYg3ma79S08w8TE118fddecHqnmXeDbMMe8fAl3lGh8?=
 =?us-ascii?Q?htuHBeoZiZPBH/IS2KPoyljPpY8pFtWrO1ukHKuUL6zrj3SPtIMhCG/ms8Eg?=
 =?us-ascii?Q?i7WmIgj2tqrnPKJyWopFzJuOiPFtEskdj7xe1M/XamNGOvmejGUrE0KXEW0D?=
 =?us-ascii?Q?cNALMo42pRz7/7ovi7/1+f2BWwOigk8lKm5jb0ITFZhEKoJ+x0LaP1z2d5gw?=
 =?us-ascii?Q?SzkdzJxBeUc51agse977JkEHgusIZ1P93DaeE3jKSyTKQgtEYWGfALzWf+Me?=
 =?us-ascii?Q?IkgODvP/UQC+3Zl+2tgTztn6PfN4Vf5bLBqvtMC0nquoJzzjVu1C9KKk3ztC?=
 =?us-ascii?Q?m1C9U9/ZHDHU3uQqimn+SNhqwCXq3K5OeHI5PMRydcfv86rhDHGwC9+QlVs+?=
 =?us-ascii?Q?ElasFLDWWltGVv/UEMGxR9Okx6NYx9kJVJ2Sq30//+SPbdo/JiM0e2N8igX5?=
 =?us-ascii?Q?hNvu5PwNA7q4AdocvFArOPuK6QOFQoy38jAIFWxjZ9OWFhSG6RzpTp8JUWBH?=
 =?us-ascii?Q?+NWd88yognqQL0W9qjNecqtOFPi0RKigp9cQUNv4NYwkX8ApMDXjZk9aDgoY?=
 =?us-ascii?Q?eC9k9rCILjKZi6zV7FNluT/DEqnm/WFJZtqH7omtqRH286eJqxDyYOKyvL6L?=
 =?us-ascii?Q?OKO+J4Zs3yKpZ8N3iw/Csl6+G6GD/iF/08zPcmw9rGUHmKjhn9SHJ6TTAUCS?=
 =?us-ascii?Q?/Y4xpHsvavHpweHiGCkiwiAjaXiK6ujeYoVL7vhBtL7anhPFvtyF/JpAHqsw?=
 =?us-ascii?Q?2aKBeB0ZAuGO17vuVe16tY5kqPHMauXUNbQxKM4Xl5CSGk7H5WfLSiC26CGf?=
 =?us-ascii?Q?IHmtLw=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2db459-35a3-44f5-1df9-08db8698de19
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:38:52.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dwOhRwauDABJWmNQSLGJYIlyQn7WUZfWPV4Z9lUAk0H99pfTq6kwve6HhqRel44vrw73wXOcLYK7v3HcZNGYFkNFibXpyEEBZhDBkQqXow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7355

Am Fri, 14 Jul 2023 15:05:34 +0200
schrieb Hans de Goede <hdegoede@redhat.com>:

> Hi,
> 
> On 7/14/23 14:01, kernel test robot wrote:
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> > platform-drivers-x86-simatic-ipc head:
> > 161c6512536100ae4919032ef6f1132621794e01 commit:
> > ad90535e51415fb636054649b5894447a984496e [3/7] platform/x86:
> > simatic-ipc: add CMOS battery monitoring config:
> > i386-randconfig-r021-20230714
> > (https://download.01.org/0day-ci/archive/20230714/202307141920.qk4FY4D6-lkp@intel.com/config)
> > compiler: clang version 15.0.7
> > (https://github.com/llvm/llvm-project.git
> > 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a) reproduce:
> > (https://download.01.org/0day-ci/archive/20230714/202307141920.qk4FY4D6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a
> > new version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202307141920.qk4FY4D6-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> >>> drivers/platform/x86/simatic-ipc-batt.c:152:5: warning: no
> >>> previous prototype for function 'simatic_ipc_batt_remove'
> >>> [-Wmissing-prototypes]  
> >    int simatic_ipc_batt_remove(struct platform_device *pdev, struct
> > gpiod_lookup_table *table) ^
> >    drivers/platform/x86/simatic-ipc-batt.c:152:1: note: declare
> > 'static' if the function is not intended to be used outside of this
> > translation unit int simatic_ipc_batt_remove(struct platform_device
> > *pdev, struct gpiod_lookup_table *table) ^ static   
> >>> drivers/platform/x86/simatic-ipc-batt.c:159:5: warning: no
> >>> previous prototype for function 'simatic_ipc_batt_probe'
> >>> [-Wmissing-prototypes]  
> >    int simatic_ipc_batt_probe(struct platform_device *pdev, struct
> > gpiod_lookup_table *table) ^
> >    drivers/platform/x86/simatic-ipc-batt.c:159:1: note: declare
> > 'static' if the function is not intended to be used outside of this
> > translation unit int simatic_ipc_batt_probe(struct platform_device
> > *pdev, struct gpiod_lookup_table *table) ^ static 
> >    2 warnings generated.  
> 
> This is caused by simatic-ipc-batt.c missing a #include
> "simatic-ipc-batt.h", luckily I have not yet created the tag for the
> pull-request for other subsystems.
> 
> So I'll squash in a fix, do a forced push and then do the tag +
> pull-req.
> 
> While fixing this I've also added "static" to all the struct
> gpiod_lookup_table variables in
> drivers/platform/x86/simatic-ipc-batt-*.c

Thanks!

Henning

> Regards,
> 
> Hans
> 
> 

