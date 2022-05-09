Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B0184A
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 02:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652064885; x=1683600885;
  h=message-id:date:subject:references:to:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6TG55oMch1iZopwvqYlYuV7nAvf2RZFPb1Q3+HjW2Go=;
  b=HMiBvYf8Nl1TjZSaXrWQ+KiQNWyxEYJgrZPYQwZuIl2i1bAG7I6b/ZUo
   I2CjBOgn/ZKuTm1VJ9+8935Q/n2rxrQ9eIn+F0QLug9fWoOXoUR6ZzAIl
   fN/5+jwQITPJPWdVTtt0MskthPsfoJs3eVVhwPN8dRrSC6Zdcqh2cRs4+
   Zh10uVwuI2Sh62Q1FpTtNnjqXuAFWGLJYlXJ3p584oHmqN39l/xNIbvYP
   8IbZmSnGa7iduHdzleDK/TLGd0V861I9qx4NXF5t6hTpRTx0dam8+le5G
   SA9qEnhON108WkAFgyyXQT7DwF5j4u0/a+EIrqFYCmq6e+MxrbZaV44sN
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294142819"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="294142819"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 19:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="622734204"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2022 19:54:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 8 May 2022 19:54:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 8 May 2022 19:54:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 8 May 2022 19:54:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 8 May 2022 19:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFzrz0cLMwEMtNYdaqt5UUEXfv4891/awNxfM7E1COzhkQ09Wn52MzTkMlJX8juj+KzwCjoFlKfsIhY390T79yYz2zmDhOdBbTysfY44/NmkW93i3jcFGTh/36pfAXEFRWJqvWUfkKFLWghoZCu3IuMCuVw3/nyjmuDLZiq28wERSUuhm30r9MiKho82M4kB4AU9FzfEYa6EuTo8rT8uvef0FE2uboZTzO8cwlzQ1xCEdiAMxSrdCJxMdyAXl4YaQdiOWV3pwqZa/DMdATftBmxZM5945AWuN3/FJUdkUz2B/KOaUS0lhrRWureNN/0FnSi6r0YP9glVZIqNDSg44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPIxSZRQ3zwdzMW9dP0ESyr5vtHvDDhYfILFx6dYUk4=;
 b=NjCUGZWzrTPETHRYh+CQ9jEuPF6K4lNTEO9MJshf+Fqrmki+mh0oiw1Y6+Yot6vQQypyZ+nffmSw6MuSAEV0i/Mqbgq/Bmp39GuwX5dMsA04lCUVmFJGwQMaJ8p5ox+8QzSEr8VjyImCE8Tbd9cSwXvvvFsTrzauygIZfe4MSaj3HltBIyNxRvnmcjyrtsaVqryRtAW275KTz2Ma2UmC8xuMS7FdQxrYx3xaHXId7ryAPWiK3dWBp3yWbTPeA/BMdc5B6wy4aiKOjn3ABAAuuUOryG+yG3lX0Rr+Ct5HYw1b9UlCn6mAOxJLRDxB9EQ6o7lZIKih0TPSGP8DO6vv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 02:54:41 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::91fc:35fb:9ebc:81ec]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::91fc:35fb:9ebc:81ec%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 02:54:41 +0000
Message-ID: <e9b69a15-a680-06f4-11ef-3fa5060e5430@intel.com>
Date: Mon, 9 May 2022 10:53:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 225/1129]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1044:2: warning: Value
 stored to 'tail_p' is never read [clang-analyzer-deadcode.DeadStores]
References: <202205090439.ddmmSvqz-lkp@intel.com>
Content-Language: en-US
To: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
	<linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>,
	Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@xilinx.com>, Sarath Babu Naidu Gaddam
	<sarath.babu.naidu.gaddam@xilinx.com>, Swati Agarwal
	<swati.agarwal@xilinx.com>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202205090439.ddmmSvqz-lkp@intel.com>
X-Forwarded-Message-Id: <202205090439.ddmmSvqz-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR03CA0044.apcprd03.prod.outlook.com
 (2603:1096:202:17::14) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5292d071-360f-4250-fdc8-08da31674353
X-MS-TrafficTypeDiagnostic: CH0PR11MB5315:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH0PR11MB531504B73DD022A34ED73636FBC69@CH0PR11MB5315.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57oe+LjzBJFpN9x7hgXC93Ga6yX7grKtxZuLQRmPYQNCTJRTeuUxpwAIo+dnrD0cJ/lKmqU4iaQ+CVZvzYhTcV5ewTJdFk/Bv9i+Epx60CVeUnMg/qeJXoj5TD3iN0MpX716hH4Kg+VNdv/lkMkAlD/+MRi57kN5n8a2x0MmdnvUMQg8n795toABEbVAu8sk21f3maTfKYbb8i7lrjESgGXfQSg916MyxrTrLz4Rz538BHT4NHCt5r9DWjMGAaG49z2VOk0ZEGlPlwySKgnGB5xRUXyMnpQn/qSPFbuiHDJ/pbfaXMpVPJgvH/O2Eb/8bjXwHhACmBYyrAiZUFBPSkW+67SCXRqUq0QFRnGZ21EMoW74Q4GXAL3dOQUiGiA8VwTvycJxSP5k4/sbAc3PXQEEeFJUaPoQYusN6jyp3deFGgyYPNA9j9kVfysH19BJvjrlj7HFT1EbDdoL982DDPALCESTQlHEIVaNBO6hCdG45K3ZQTgOsgD6EkzaPcYLtKteTYg7lSLnSuWTnfn2lI97J/sNPE8fNh6Xk7JaepokQQgxHCjwbAdeeagwCtiwG4h2vO9+tbpXtFDZY2nGDAtXhfsfbmr4AxOMipkLDirAUqjNUOPeSoGp3Od+eexZiK7XxDRA/jIn+aM7KPMNT5PD+5kNl3DFbvaafck0bSCkpX4+R6/jRfiQMPvi4yZSNbIU2uZGzt5Y6M9mrOM7foHFb3Bj25MPggdJGLiVmyDhg279BVjD30Ue3zf3Tz/Ht/ymAZ36nj5/2wuo63EyJWMMYUe7atlpxozHQorsTtcMZo2XcWnf/pknzRJlRFecyHU7W0zKTNRJzIXBOBN54TvCC1PgTz9Y4sTtYgX8PV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(2616005)(4326008)(54906003)(6916009)(66476007)(66946007)(66556008)(2906002)(8676002)(316002)(86362001)(6666004)(6512007)(82960400001)(6506007)(26005)(508600001)(966005)(36756003)(31686004)(83380400001)(186003)(5660300002)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJlMDVFUzFLSlVTN0M4a2wyQ2FzOGNMemtRMTRFYXFLU2xOcURQc0lxMkd0?=
 =?utf-8?B?Q08rTm1Iem1TM3ptU0diOVFiMXdkRFk3bHA3QnpNYjVXOVA5MitUM0Y4TzQy?=
 =?utf-8?B?dDQxWEdRRFdKQ3N4OGVJUldSZ0IvYldmVUZLUXJEcHdYcjZtZ0NFNmpTaDA0?=
 =?utf-8?B?dGFZdzg0QjZVaXoveGlhakMzU1ZTaGt0Vks0TFZnT1c5bUdFU0RnMFJvUHVJ?=
 =?utf-8?B?dGcyQkVVUjFDV241YUFKQ01JUjhzN0FHbkt2UzBiRVJVdkhoM0VNNTdVUTRG?=
 =?utf-8?B?OE04R1Y4Wnk3TmdnTnBmK3JxbTNKRnREcmEzSU1GT3hQRnFyQ1BmeGlqRG9x?=
 =?utf-8?B?b3ZDTm52UDR1Z3g1bkZ0MzZScWw3bTR0eVR5SzdGdVNmMkEwZy9uK0pCSENq?=
 =?utf-8?B?aFd3NHQ4TVZ6WU9pMjB5VUFqMkhlZ3lTNUhlV0ZjeUNtb0UrNWhuem9hZ2Yz?=
 =?utf-8?B?QnA2dDd4OSs3NGMrQ3hVYnp2M0hVa05Uem8xMUZCV2YvU0xINVZGS2cxUXVE?=
 =?utf-8?B?dEtidkpwR0pleU9RdHN6M3NFL0VWS2ZiUzQwY0Q2M3RiU1N4Z05RV3RSM2hC?=
 =?utf-8?B?RWcramRqWEpCMnZqR01yaldZL2I5NHBsWXhNSFhtVmwvU0d5V2FJNGFxeEU5?=
 =?utf-8?B?U0lLS2dVRGhTTVN1YTFwNDF6ZkNLZFh2SHdPdGI0K25pcjFTejhQNk40MExh?=
 =?utf-8?B?amVWR2FKWjZTdXkvMjF1RDk3NHlleXl4R3BZTlA4Ny9YTUUyUzhDOXgvRVlu?=
 =?utf-8?B?OFZqOTEwSmkvNXo5TmZ1dGdVYUNRb1ZDdVRoQ2Q3OWw5MldPRE85alU0VTF5?=
 =?utf-8?B?M2JnOVk2aTNJVWI5RXZxYWtyaHRzMW1kbExRby9ZZENLcWNvbGMwMWkzeUFP?=
 =?utf-8?B?UzF4QWFhbnpKZVIzUi9rRzdlbWRoV2ZCU1VKZ2VZc1BCbVpwUUErVXY1aHdy?=
 =?utf-8?B?anFVSzVSOGtITWI4V3I2bmRxcHpzb3ZlYU1LK3RielVvSmxTOW1aZERXR0Jj?=
 =?utf-8?B?SkxQTzljZE4vcDRRUitTb2swWFZKTSt4UkNtb21td3ZPYUZJUllTU2N2OW11?=
 =?utf-8?B?WDQxVHcxa1pTMlBuSC85TFBJeVczTCtKc1FSbjJ5NGEvaUdCREg5ZXR6Nm5r?=
 =?utf-8?B?RDI1SmM4MUNQbHJVaml4Y05MTGxyYU0vWHdrVGhPV3lRKzk2NWRpQmhiSjIz?=
 =?utf-8?B?QmRHR2JMNXpPMUgwNWdiODJ1THZqRFJibGNqYW1qRkRyRmZUaDA5YmNVZjJF?=
 =?utf-8?B?VlA0VnpISUtpaktzM0hNWXgyVkV3V0dDZ1FIckMyK3YyWlViSGIwS0pheG1M?=
 =?utf-8?B?Z0k5N294anU2b1ZIbVhzRVNTVjNKTElJK1UwMTVrNGcyL2pUYmxNK3NOS1k2?=
 =?utf-8?B?cWlpd2JCb0x3VDgzTXg5QnAyWnNrZ1NBZFRoblJ2QVhzL3UvV29BVXhQWGg3?=
 =?utf-8?B?eXVZalI5dHlTaFlkUlA1SVBITTRvSytWalRUaG9EM29ZVjNTdkpOYnBXb2pI?=
 =?utf-8?B?S0xMVE00Ykw0SWJYR1daVzhyMXV0MnBDcXUrdHFZb2E3RlBmLysyM01lT2RS?=
 =?utf-8?B?K3dNQmV3YkZkTWUxdmtNRVdTanY0K3ZucTNQOWhRclJXc0I5ZzE0aTVrUTZr?=
 =?utf-8?B?aW9QM3dPbm5OU1p6REJNQ1JHa2ladEdONmkrNDllcHZ2c0daREJrQ2QvalFU?=
 =?utf-8?B?VHlwVVF4cXFINE9WYjN1Vnc1dTRtYjM0T0F0VEFPQ3doSFc5aCtGSjZqUWxu?=
 =?utf-8?B?SFpSWk9qZEkzbkZyNWxtNVk2QzVzMjBwbzI1UTk1ektHTGV3WEM3S1BqZlM1?=
 =?utf-8?B?N3hFUjBoOEtYQjZEeWkrNXU4U3JPa2pmY3htNXgybGFTQThUNzNCQnI5Ykky?=
 =?utf-8?B?M20xdWhnMnpOenFpOXFSTnBaaDRlRi9kclhUZjMzL3lmOGhLU3dpT1dzVkVH?=
 =?utf-8?B?Szc2anVGL013NnRka1lMTVJxc0xJQ3lHSkNDQi81djlDZW1EaU1tMmlXM3dm?=
 =?utf-8?B?UllBVUFweGlkMW52N1Z3ekd0amZFY0w3ajJ0bXM5WFlFZi9tcWpOQ1VpM0g3?=
 =?utf-8?B?d0wyS25tVE9ZQTFVbzRpVkFGa2lBNGoxT0doaVFwQm5idmYwVEFOQkI0M2I3?=
 =?utf-8?B?S1FXK1ZPYTk3bDZNL2huRWpGcTY4TmdtcVhqRmRGSUdhNEhrL0VFOXdOcjhN?=
 =?utf-8?B?d3IxVm1lUElXR1kwZ05Wc04vVURTVmRZa3VsUmRlN1llVmpzUFNQUUJSbDFF?=
 =?utf-8?B?YlJ6aCtNb1JoNXB1VTdZWUdFVUFrT1RPN2Y2S2tVUWQzcUlUZlZrMGV2QWky?=
 =?utf-8?B?LzJoZHRIZTdjOHpWZy8zVjRkT255K1NxTnpMRm5VamQ1SkNFSFE5Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5292d071-360f-4250-fdc8-08da31674353
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 02:54:41.0284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyxP7Hkq2b0yTs8C3mcsd28mqNXEnNGawU6ZH+cFGB+1F8EMG5FsFPfW9xPgWDmkf8SIOHtbyPrDWYROluszpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: ee94241b2118ddd38a456b2b805fc584b57de58f [225/1129] net: axienet: added multichannel DMA support
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220509/202205090439.ddmmSvqz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/Xilinx/linux-xlnx/commit/ee94241b2118ddd38a456b2b805fc584b57de58f
         git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
         git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
         git checkout ee94241b2118ddd38a456b2b805fc584b57de58f
         # save the config file
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1044:2: warning: Value stored to 'tail_p' is never read [clang-analyzer-deadcode.DeadStores]
            tail_p = q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
            ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/tail_p +1044 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

ee94241b2118dd Saurabh Sengar               2021-01-22   998
ee94241b2118dd Saurabh Sengar               2021-01-22   999  	if (!q->eth_hasdre &&
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1000  	    (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
ee94241b2118dd Saurabh Sengar               2021-01-22  1001  		skb_copy_and_csum_dev(skb, q->tx_buf[q->tx_bd_tail]);
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1002
ee94241b2118dd Saurabh Sengar               2021-01-22  1003  		cur_p->phys = q->tx_bufs_dma +
ee94241b2118dd Saurabh Sengar               2021-01-22  1004  			      (q->tx_buf[q->tx_bd_tail] - q->tx_bufs);
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1005
ee94241b2118dd Saurabh Sengar               2021-01-22  1006  #ifdef CONFIG_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1007  		cur_p->cntrl = skb_pagelen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22  1008  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  1009  		cur_p->cntrl = skb_pagelen(skb) | XAXIDMA_BD_CTRL_TXSOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22  1010  #endif
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1011  		goto out;
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1012  	} else {
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  1013  		cur_p->phys = dma_map_single(ndev->dev.parent, skb->data,
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  1014  					     skb_headlen(skb), DMA_TO_DEVICE);
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1015  	}
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1016  	cur_p->tx_desc_mapping = DESC_DMA_MAP_SINGLE;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1017
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1018  	for (ii = 0; ii < num_frag; ii++) {
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1019  		u32 len;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1020  		skb_frag_t *frag;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1021
ee94241b2118dd Saurabh Sengar               2021-01-22  1022  		if (++q->tx_bd_tail >= lp->tx_bd_num)
ee94241b2118dd Saurabh Sengar               2021-01-22  1023  			q->tx_bd_tail = 0;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1024
ee94241b2118dd Saurabh Sengar               2021-01-22  1025  #ifdef CONFIG_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1026  		cur_p = &q->txq_bd_v[q->tx_bd_tail];
ee94241b2118dd Saurabh Sengar               2021-01-22  1027  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  1028  		cur_p = &q->tx_bd_v[q->tx_bd_tail];
ee94241b2118dd Saurabh Sengar               2021-01-22  1029  #endif
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1030  		frag = &skb_shinfo(skb)->frags[ii];
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1031  		len = skb_frag_size(frag);
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1032  		cur_p->phys = skb_frag_dma_map(ndev->dev.parent, frag, 0, len,
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1033  					       DMA_TO_DEVICE);
ee94241b2118dd Saurabh Sengar               2021-01-22  1034  		cur_p->cntrl = len;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1035  		cur_p->tx_desc_mapping = DESC_DMA_MAP_PAGE;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1036  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1037
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1038  out:
ee94241b2118dd Saurabh Sengar               2021-01-22  1039  #ifdef CONFIG_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1040  	cur_p->cntrl |= XMCDMA_BD_CTRL_TXEOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22 @1041  	tail_p = q->tx_bd_p + sizeof(*q->txq_bd_v) * q->tx_bd_tail;
ee94241b2118dd Saurabh Sengar               2021-01-22  1042  #else
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1043  	cur_p->cntrl |= XAXIDMA_BD_CTRL_TXEOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22 @1044  	tail_p = q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
ee94241b2118dd Saurabh Sengar               2021-01-22  1045  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  1046  	cur_p->tx_skb = (phys_addr_t)skb;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  1047  	cur_p->tx_skb = (phys_addr_t)skb;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1048
ee94241b2118dd Saurabh Sengar               2021-01-22 *1049  	tail_p = q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
244a92b6cc6f9a Appana Durga Kedareswara Rao 2020-01-24  1050  	/* Ensure BD write before starting transfer */
244a92b6cc6f9a Appana Durga Kedareswara Rao 2020-01-24  1051  	wmb();
244a92b6cc6f9a Appana Durga Kedareswara Rao 2020-01-24  1052
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1053  	/* Start the transfer */
ee94241b2118dd Saurabh Sengar               2021-01-22  1054  #ifdef CONFIG_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1055  	axienet_dma_bdout(q, XMCDMA_CHAN_TAILDESC_OFFSET(q->chan_id),
ee94241b2118dd Saurabh Sengar               2021-01-22  1056  			  tail_p);
ee94241b2118dd Saurabh Sengar               2021-01-22  1057  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  1058  	axienet_dma_bdout(q, XAXIDMA_TX_TDESC_OFFSET, tail_p);
ee94241b2118dd Saurabh Sengar               2021-01-22  1059  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  1060  	if (++q->tx_bd_tail >= lp->tx_bd_num)
ee94241b2118dd Saurabh Sengar               2021-01-22  1061  		q->tx_bd_tail = 0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1062
ee94241b2118dd Saurabh Sengar               2021-01-22  1063  	spin_unlock_irqrestore(&q->tx_lock, flags);
dcbca0a74b25f9 Appana Durga Kedareswara Rao 2020-01-24  1064
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1065  	return NETDEV_TX_OK;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1066  }
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1067

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
