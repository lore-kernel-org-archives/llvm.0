Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2131.outbound.protection.outlook.com [40.107.243.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF676361;
	Tue, 13 Jun 2023 05:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln+O3gdsbURGlK0hk++c9ZwahGKwpmeDNZgOyUeI18H6kGSUdzQmcTad7avU+Tg58O/M0Ikl0wB712UX69BQxnJxm1udcV2WzgA1DmH1Xx0sGJVBtBEWIFX5lZFCZW+q93hKECmOIoQnTUew7J2rf09zg/vbQdSfIphfaQw/4/zCIJtfJHic5uCucQ7RMq5seXnqFoS3SnOJh/wNwEmQhWFe0zdkXaAH3ZV4YjIhJIBUQn3bNKaJxgvt8YQzgEdEoBlziyBQm9uLcKYgiE9RjWMrIHCLA+Xxqri2HBw/MMDor4sJvtG6XNIko/r3nslDn4yN/6aurCFn0KSQEDCsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4ECIW1If2JdxyfyMHFg50I4z0ds9qPB2bBRmCnu+sw=;
 b=OG5RiRWqifqFLaA2MNZb99s4CYYMBB92jK5A8PqwJOd+j/b3tJI2Ut5UZD3LoopqpVbVgoNmuzXGz8AAxiDo/QbsaBrkfPZCq7BQmkDC03aUz2w5okXBg4q/wAr2Hk5JBLFCjgW49rA+4h97bZmZqIPGWZlRluufLf+ae4fGTQ9ZlsEgkig7Au1QDr36OJ65q+wAKVFs9q62szK7gv2V3ebkxP1T/UqpZ1ILZF3AnU+KOO1YR/dHHC8GdoP2fp6KutyFHkSdhpL5Ao4TFAzf6OoTWPIoHnmw+5nZbS7d74zxWf1K9R3eVAqHFCKHadfCzTYLcs9of7dJyII5i9PSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4ECIW1If2JdxyfyMHFg50I4z0ds9qPB2bBRmCnu+sw=;
 b=MOBEmImt0vU8Y7SsOSCpT45vahx6HrvnqZzPGMnGUfc+oU/8Z9ER9VnbvW/HFHnBZDk4gyXI/ciUfSAMSNbNqWi+4YmQ7gmiRLrK/U8rQbx4KYxSX4jSNDS6Eklxt+R5bmUpjReyJDsNlPrkfsmQBOpdVbdSKirChYGwL4T3Zv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SA1PR13MB5492.namprd13.prod.outlook.com (2603:10b6:806:233::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 05:50:22 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%4]) with mapi id 15.20.6477.028; Tue, 13 Jun 2023
 05:50:22 +0000
Date: Tue, 13 Jun 2023 07:50:16 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: Re: [netdev-net-next:main 26/28] ld.lld: error: undefined symbol:
 efx_tc_netdev_event
Message-ID: <ZIgDmJ9kgsfbZHm4@corigine.com>
References: <202306102026.ISK5JfUQ-lkp@intel.com>
 <ZIbUNpktWf2TmKGZ@corigine.com>
 <8724de62-fe9b-cdd4-bb39-b3c06b440f5f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8724de62-fe9b-cdd4-bb39-b3c06b440f5f@gmail.com>
X-ClientProxiedBy: AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SA1PR13MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bb5ecc-5e72-4f45-cff5-08db6bd213c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5H+plqwnPxSH7ezQF3wkuwgWROBQeuZ+NIDEbdnNph4dSGbGaoHU8OoL7OzGJBDteq1muz4e54aU1oDtI1xp40EoLiYTmj5d+pHuRVzZS+K5qWMw/SHzY8GfCP7Cz6wMbFumeIWqQMLHvfNK9BPvdf+UAnhSiX7ZGyZ+vdi67oGauPihbqMx6QLurBOFnJVvbZ63Tac3P5CrTipeZUsKaeqWQ5igLFmHaQHtSpmlcGRROCCeyQGu4xxt9wJZsB6g/WU8L2o0wMLu+m0808jitwa0gUlAVzX/yGDU3fYgpeXq0Y9J8DU5iw5dyZpMGdPEg+Qnn99p5Qiyh+MSKlZ02j8fpBzxzcrGaL+tN95Fx6dp6IaeW3SXmgIYi1I8qFk7V3je0hJ56yobpH+q2n1AdfODLV80htj/4I4Jb1Pn1CZDjJWWKI24NYJ50eaMWpMsWb4lK+c3A7eJkkE7Q7P/Ot5W1wksthSjLCeVbugnHaD7f3D4SSCjzg/nVubqBrA86tuEHckLdwB5iVdad3Lp1OLz81/q2rA3f5cuBzv2dAN9Mx4ZruqLrFIHTby2aC+IjrVsAg32tgHPUYsFeNYw7DhAK2tXZBvX++jnehhsu6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(346002)(136003)(366004)(396003)(451199021)(5660300002)(54906003)(8676002)(66946007)(66556008)(6916009)(4326008)(8936002)(44832011)(41300700001)(316002)(4744005)(186003)(2906002)(478600001)(66476007)(6666004)(6486002)(6512007)(53546011)(6506007)(36756003)(86362001)(2616005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yd2wF91mrJvxJaGUEQsc5DYh2Tb1KTcyML4ggJBkJ1MHe8qGiNZIjstWwJYL?=
 =?us-ascii?Q?R0xIsCFq8UIgnqStj9yi7kQ7VHZQNQt0Uh+SR2u1BwnGkvEZlu8k9eftdFV7?=
 =?us-ascii?Q?gLVNQFFg2T9+G/6kw/b3N0//zHVp5BmvXq7L1uPzlxu5MQn8LaJM5kqorM1t?=
 =?us-ascii?Q?1OlucuxFk5LXskoRLgxyFYHMRZguMzfwKDOAjAMyZ0YXN/d/mKH88I5V7zzX?=
 =?us-ascii?Q?NElEyeogJ8vmczQZMDK3LDU1804JLcsA5yrfOv+8BbbKQVIANr359D2Myx5A?=
 =?us-ascii?Q?QbX6TbVvdSX8D7k6Rg46iGra8DIwIs65+/nfyrBdT/CVMo8/5OjbTJm8wSHY?=
 =?us-ascii?Q?eBM+++/5ivt54n+KLHlsrXcfVO3AXxzzRDLIsQdDDNaM729xsOwhMG+SveqQ?=
 =?us-ascii?Q?2nQLcc6DPHMCE2R1buhbuC/NbaoVXjeyeBIGyMvdoqmHIduaM3Urt6N+MMOd?=
 =?us-ascii?Q?3bHK4rLNabZQNujoSAJ+XSNclNCRwhvQR3rEuIt09TtQc0pvOrFYOOdGspiO?=
 =?us-ascii?Q?2ymInmln5S1vnneEyvzGKUVw6OydA/KsAEQ/e8OGICWlPKobX5jnXcgO1SeH?=
 =?us-ascii?Q?K9VUNGNWxxtsiAQ1DSKGkmNFsvN+YUf0AyXdFgZJgclnFv6pt0+v6cCNir1E?=
 =?us-ascii?Q?x/EMQZi7wvXS1vUfy7nqC9khumvPD5YJ+W/75LaliJNwoJ7MbsuCxeDxylxR?=
 =?us-ascii?Q?kGQ+/4iKOwomR73k+1gJ7jJ2LQSOfLu3bioRfUS1eOE8Qw6c3nAofLaVZnAD?=
 =?us-ascii?Q?w4fqCh+IGJLSg1yIHdQZtkB9w0nsezJXTuTZpsMAtLPJ6/9gBdh6ISml9UGc?=
 =?us-ascii?Q?Iab90xU7+5CX6KUCsDukIWUOyUPM4J3Y9NUa2hJYJPND0xZe36jO56ZUhwpj?=
 =?us-ascii?Q?J1fo77G74VmvJYY8CMudsiet/5YyctoZ0nWc8EjeeRpAg8AspNKFDWOKoz/t?=
 =?us-ascii?Q?Crv+NeTf2HQ1Wanlcab6C0ydKqnJZk2pufbEotMQOA4cLvffhMec8ZyNyuIG?=
 =?us-ascii?Q?d6L06SMCFLXyMAB4EFzo4w1ken2IuQofUWonRZGE2baGRSsM/B2E03YWmGu4?=
 =?us-ascii?Q?mbDdf9urP0rwBqgsk2oqNtapZlpKOss2c3/iu9SCpShYsP7qIObTrpIXd7NB?=
 =?us-ascii?Q?Yb704eEWI7v6pKRzxT2i1zxKGAPeC2qL6M2AGSXv81XNb5g4lTt9MtOPug9d?=
 =?us-ascii?Q?R1rV+LV/tuu6NY8J5vKCO/3u123M1Hh2uPXjwQE8Sga9uNF7QwB1l7AMXBuP?=
 =?us-ascii?Q?AeX1KSto5vvuE+dxNFyb2hZ4Kny1MfqPUtNt8qR/ec7Iw9mUzUeLctvEmjza?=
 =?us-ascii?Q?GqaM/81QuU8CqohecxkkZPZS0qifup2eU/toeoeW/tmGPJ6EwJChhcW4DubG?=
 =?us-ascii?Q?MFmwISXcoFRn8HxnETdQq1aKT0nHMMgph7Nv9lKCLIcyGptSBbwvhYpDefuB?=
 =?us-ascii?Q?FBRHfBqZsCQKRSmSQU6Tc1Zaek1Nnkf3X6g33nE2Wzv2zUYp2tJTfbs82aS5?=
 =?us-ascii?Q?u00jRMfSmQTDyT3uICQHFiQAjPOqmiyqxaczrDsUqKMVHNDoiQYTQ8v3vh/s?=
 =?us-ascii?Q?744xSddnyi4/H6v5N2/gu5VMGl6gpfyH2ei1CAVsJ1M4/4S7Ic7azjWzJ90u?=
 =?us-ascii?Q?I0ZNytzGSwYbhkSNjyLOyGV+VzWa7cAjk91rv8Elxr1NL85X8OmuEXqW/B0J?=
 =?us-ascii?Q?G3xfRQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bb5ecc-5e72-4f45-cff5-08db6bd213c4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 05:50:22.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExBukW7l5Y0GFIzc+96MCUvt57/dGZPVQ5e9qi04ag/IpkcgS3x0qB/RUBnbmVwAb/9hwlNarzsb6dRpfiv28qNtkgsqUD8LB6NcJgaQTr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB5492

On Mon, Jun 12, 2023 at 09:44:45PM +0100, Edward Cree wrote:
> On 12/06/2023 09:15, Simon Horman wrote:
> > On Sat, Jun 10, 2023 at 09:10:45PM +0800, kernel test robot wrote:
> >> All errors (new ones prefixed by >>):
> >>
> >>>> ld.lld: error: undefined symbol: efx_tc_netdev_event
> >>    >>> referenced by ef100_netdev.c:313 (drivers/net/ethernet/sfc/ef100_netdev.c:313)
> >>    >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netdev_event) in archive vmlinux.a
> >> --
> >>>> ld.lld: error: undefined symbol: efx_tc_netevent_event
> >>    >>> referenced by ef100_netdev.c:329 (drivers/net/ethernet/sfc/ef100_netdev.c:329)
> >>    >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netevent_event) in archive vmlinux.a
> > 
> > A cursory investigation leads me to thinking this occurs
> > if the CONFIG_SFC is set but CONFIG_SFC_SRIOV is not.
> 
> Yep, looks that way.  Patch on its way shortly.

Thanks Edward, much appreciated.
