Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AA5D518;
	Tue, 18 Jul 2023 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689694717; x=1721230717;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YCTCiYTIExx5E56BJ47TjKmJkAHip5qU/OG3ippd5as=;
  b=GG1viGd+yxtFprqkgPNTIzSs/HDkRQUtfvdou+D0V1H/mAA3QIRwPdig
   rou8TCDOcg/SSkU964CYn6/CwxKkZX1G/w+9NvN8dvjZ+MyzD3ZaT0IjH
   m41sM91GD3pc4WylidHFf73QFuu9T4+tyLo0/cpXePgE3syuIM8igTFfs
   ftx38ttjrW0YeFegaHOggNnEtNFyAPmUFPUFXriWn6/dN8BpVYSOCtnQP
   FnygHaa3WKGUIVjcahkiYbAChIMnKROUUrigJUPQZ7jG4pveXyndRACAY
   QOtLrwqGn8ctB+BbrhZvkWhTXcgyx/BiITfJZ/u1aK4y09NXWu7inLNgu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430002011"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="430002011"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 08:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717640201"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="717640201"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 08:38:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:38:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:38:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 08:38:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 08:38:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP/ChpiiHBENGQH7+tGfj6hfPG3QfQjNNOqmTHT4D4DlnM+tkbTsHKbBTBisDs37OaxHURecDHd1q8FOtyawhERc+w8TyKBmDLpFrRf4+H1T3/yKe2BLm4MPNfa/LwUXhMHs5MJBuW8A51bJg85QI5bkfGW0M1tkeZOEwMixOrG6S551eGQ29h4O7fle4P+cBuPJXM1Gpy4ZMrBkAOavuNYsguJvLIVAWbrZHJh9JRN670roFbPmv81QlqRZwPgIYD89EMoOJkqjYTmIkqlQrLzYL79w04jZe+7Yp34mgh9qrblgQUdFIN/pszewEUTxrSOPSoO/hFYio+IylgtYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5v9Ih6/GZdpqGoMdwgQsUo+DaednRsC0NMrf27Wxks=;
 b=T9V9HBS/DRK+Xm+5S91doQCqQ6C+OHM3uxLhW+NF//R7H06YB79zi/6fMlEzuiwQsmdBwqZL0Cr57am1iZHv074M5j0XsYWAl/a5lvGSeHFa+Qb6HT1trbH3T3Q+DJPc09HERmUczr9vSSDv0LbAiQWMQJ0VGGsNi98TpjRmZLP4tL8LF8y1hGnByaYrQnAXN5droLojwMw8Mcj38GOGU/4CjDuG59Xv3PPHqV8rfxleoqrnuwr77A6CYidcg2S0mNyH2frQ3XF4ByWvA3YvUfj0+60URzWcls1bp33AN0os7WR9AbDP+xdFTgRokrtAfGSNcbayP04ffrLUarktug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:38:30 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::4a1d:c5ed:d344:4043]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::4a1d:c5ed:d344:4043%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:38:30 +0000
Date: Tue, 18 Jul 2023 23:38:20 +0800
From: Philip Li <philip.li@intel.com>
To: Hu Haowen <src.res.211@gmail.com>
CC: Stephen Rothwell <sfr@rothwell.id.au>, kernel test robot <lkp@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [srcres258-doc:next 1/1] mm/memory-failure.c:1891:6: error:
 redefinition of 'is_raw_hwpoison_page_in_hugepage'
Message-ID: <ZLax7AklRzTtJjmW@rli9-mobl>
References: <202307181715.0dwDb1O9-lkp@intel.com>
 <20230718202633.7578c89e@pine.rothwell.emu.id.au>
 <433ced5a-7a04-e54c-8774-e2a1ae514ffc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <433ced5a-7a04-e54c-8774-e2a1ae514ffc@gmail.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|PH0PR11MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbc214a-29e6-4b97-6860-08db87a5098e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhetG7gMkgDcQdf8YyRdtGp6fR3CLXyoMz6l5QyferuITTnX1VLFKMkxlXkj4Ps8e4jbLogCpUxklPJc9ZFWCGERtH7x+lmg42quP+/JuQzeTQe1JQBICr40TQq+GevR/RaPXVe3fq0Fam7WJUCVU/KLNZ/xTk2DSElnW8p5sFe/kvvaQV2xwytxlx8Z0IBNZjdHFFEXU1POt+gZyGAFTNB92nEq93F+pInZrEsJsSUiQJHD79jhnYJ4hvqAY4fmnGHI/eYOhGPvhDmNAveUtjjp2/T71yu/W27++/Q8k3Ok/d2HguT8xrmK2BznRSVsZIQgS/c7FZvnRdOAP/7QHA9egbuQIE/SOBjanAWlHWiSZK2canz00/VAiQvb8OvBOTYcME4+Uzfv3R7ofq4A88Zd7M1WF8YMfS4F0KxQt+YOHPmtaSiRkbhRSbaVelx7V+tvAgzXXoEcdoG4ckuh49wq4QXBHLstNLUWsgXiVSJWi01gJigoCwmoW2mnEYMa3BfdI/L5Z5Gp4vg099PKcHgxdKnV3YRf4wL4ETkCbJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(33716001)(2906002)(478600001)(54906003)(6666004)(6486002)(8676002)(44832011)(4326008)(6916009)(316002)(66476007)(41300700001)(66556008)(8936002)(66946007)(82960400001)(83380400001)(38100700002)(6512007)(966005)(9686003)(53546011)(86362001)(26005)(186003)(6506007)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dha8Rdfu+VwgyjgCsHhG8HHXHGBcrNJHMyKa6CzwWwlK5aHNHoQZKVZdmYgN?=
 =?us-ascii?Q?IVPrvDw816ctIVbrvHGh0T6iF/h4FuVqPYF6mlYCOcV88fSNucnPRUDOj6Go?=
 =?us-ascii?Q?moBq3xK/KUocS1L0n3REXjqW5ipfOz+uLH/0Rlb7YMFi9og7mWl9sKTLpAwg?=
 =?us-ascii?Q?ZYDoArBA+QodV7NMUznKngmxw4S4iETUsrYxgInRQRWbS2A1rvmELWCUOP9u?=
 =?us-ascii?Q?uae20c1mEs8BwENQqkiVP0CPndZu7brxDiYtPZ2Y+R/6Gh/MgppQYNADsJln?=
 =?us-ascii?Q?Y1gLW7Oq3z5AzwPbdNSexsSlrp6N6E9rZ6N+Uq+41qBpCj0bwFhjw6OUrfnU?=
 =?us-ascii?Q?0kKr3OX+qUrdwsMXgUuqqmUJHEO8DfanVIhNS0CWgdCp3Lki/uUNgn0BdnKe?=
 =?us-ascii?Q?WkIHNW7q39abiII07VSyTqphfKB3c5C5HiqlBTzn+mVdm2v7DwUkLstL/9ai?=
 =?us-ascii?Q?xaB4h9DX85qsFFsBJYo2+4/ooYNpqr3e2o1NeUtDvzr/21iuXiHP6TcId0uR?=
 =?us-ascii?Q?1hvayoluS6TZMYCn8LBQEE2VfKR34ezX/CxJba3fZaL49wlTiYNMBZAD9quU?=
 =?us-ascii?Q?3p8ED/00RVlT1pXRbEHU7GC8gWHBjSwXRkQaJb0gUFUmS4cp1/t9RRai39vK?=
 =?us-ascii?Q?UQJJzSLHyeebWXQX3qFhuckKPzv8kc83NyM1j03yZ+bjMczRCBCkJf/Y9T5e?=
 =?us-ascii?Q?HArc4fsClcrfTd/XGNlOtQCfzzn6UpnWjquqp5R862o6vJ0qHGq8y+E5dzgj?=
 =?us-ascii?Q?t0ww98lFuO/OcKqufF4bRqY9X63K1D2vyKbU/usrQgx7Mm7mWTxLrrCq05Qe?=
 =?us-ascii?Q?m/3sSpR1p8s517DL9LHE3Wq686FkL7gpz0YKfSwMNjZhdBvlCqAex6OtaOlR?=
 =?us-ascii?Q?pYYjpdzAFMExY0AN09lZn7QNb9ahY/9p04cENnz8dnQnmdOGW7Kk+f4gRiVD?=
 =?us-ascii?Q?MHqRx5rwJHKuSRQBrEDN5/zmHOsPxI/ZeizqQCO5H+Idkvkm9DrPjVSwaUzD?=
 =?us-ascii?Q?VwKDyW5gOEaMv4KQO/AdstM9A8OyRs6IxjeCHhZld5U30HcOohK385fz1tOn?=
 =?us-ascii?Q?kn8a0rDqfHkXwrMlLxTqhTZ6rHH3b6m9R55oBE7SC5TxyjSiC4QDkvcPMW1u?=
 =?us-ascii?Q?Tv5ipT5mE1oMj60QGX/KDswWqyhwKCVct7whkswKtBk87G9K8rjh7tySuUJb?=
 =?us-ascii?Q?VDpsDlEPPf4X7w/0B+ZTTFJr7rZvewyfsnfCrtFIN+zVMtEo+BY+pQ1UfKAH?=
 =?us-ascii?Q?YKwCpJP1rizbrybEiV17QD0y2nf28+f/4MqU8LwcWlnGyRESwBL1gUBnYijp?=
 =?us-ascii?Q?SiaQF8pOzQ+8q37JIP2g2PXDFU5cdd1KYbADMVfvuPeZFJisdbRAIilnh0OU?=
 =?us-ascii?Q?CozRgUFVwDMsbJflqgHwmNF2FHI4b+zMFqbuqXBtfzLPx4Mszlu/4z5IcENq?=
 =?us-ascii?Q?ITDnXpSPZLe7ZRfERWz6IgRAq+vbI1kRmjsBvOMeI2B8l1gz5r0ezoViukck?=
 =?us-ascii?Q?H1nyFqhoYmROHskPaA/tnYTZoQgsNb8+aTPulVGuSJ0POQO38lU+3qNT8ytx?=
 =?us-ascii?Q?bV3EgQR3AgKbsFH0RUL8A2mlYF7wN9dQLwSVJM0h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbc214a-29e6-4b97-6860-08db87a5098e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:38:30.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8NxjpDzTDS9KaZvptzkmJwLbyi2/AnOG7DZxhZEolQ4DiHa8BCwmi9DouKliGyN6GtSPbio0L+D2SBZqo3+LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
X-OriginatorOrg: intel.com

On Tue, Jul 18, 2023 at 11:04:26PM +0800, Hu Haowen wrote:
> 
> 
> On 2023/7/18 18:26, Stephen Rothwell wrote:
> > Hi,
> > 
> > On Tue, 18 Jul 2023 17:42:05 +0800 kernel test robot <lkp@intel.com> wrote:
> > > 
> > > tree:   https://github.com/srcres258/linux-doc next
> > 
> > This is not the linux-next tree.  It is a tree that merges linux-next
> > every now and then which is *not* how to work with linux-next and will
> > create lots of merge conflicts which may, or may not, be resolved
> > correctly.  Please do *not* report any problems with this tree to me.
> 
> Sorry for troubling you, Stephen. It might be a misunderstanding for the
> kernel test robot as the address of my tree is mentioned within
> MAINTAINERS and it is detected and put into CI automatically. In truth
> the tree has nothing to do with Stephen's linux-next tree and it is used
> by myself for kernel documentation translation stuffs.
> 
> Consequently my intention is identical with Stephen - to disable the CI
> jobs and error reports as it might act as junk information for both
> Stephen and myself.

Hi Stephen and Haowen, sorry for the trouble. We will stop the testing
for the repo to avoid confusion.

> 
> Thanks,
> Hu Haowen
> 
> > 
> 
