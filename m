Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA392C9D
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 02:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641523020; x=1673059020;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=SeblSngXimNGS84t8e0Q6ElvS2CJWsu0ujOjm+OFWq8=;
  b=h/aAcOS5WfWsUcJtPTESX++iYzVD2dhczPt3ps3HsCLJvHyw6I3M7mJU
   Dn9OjhHelY7cnY2G8Tu9RU7T86ZfDmwYPprBqL51R+ox69Ow7nGdvCHOQ
   mSzOB+jRYIKXN85WTspDW2xjWAQajwkdOgHantgWpO+I03q+my7/+jS2E
   r766QfQvgHjykbMHe00xQjVB1xKso5lS9gXVz0RpC0w702Z0oQLdnXiXf
   l2dkSXnl8FFbRYjgUWlAwSn1yuzJoV6upBG452m5R13JePm0I0nf8XZDZ
   Gqc8o4bI55pKtvzBseqqXBbDyYpqapo5LycOKHLd2inTj/3hzet8ZOB/H
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="223489072"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="223489072"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 18:36:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="527220313"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 06 Jan 2022 18:36:59 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 18:36:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 18:36:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 18:36:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYDQ8YPhCa0IaSwrvfC7EZMbyd2CMD1v1Mmc+2KNsRvHN6oKAIXddZnHahgGtb9LYOR4+tUYuY86YDT5DzIm4DAD4WZEm9u4JFVGXEQehnE0jQFkJfgemjvzzmbxygqm7IJpSY+VHKl6znRQuH/XJsbm6IFuzoO2z1JHqo+DI2jL5bl0Sm5yMRlzMVlxOK2QiWk0YKyCy2PfDcwPwPmbuPFanXKksL2/8jXq3hEWg05+AAlvdM67BM4faOhoC+4zJC8QwG3K1/syxOu2JpGpX5Kn/0Cxkr/ZCEbU7txAadN52F+h8uJwSFIvLqVa2WA+hhQjupX3b9bFAovHy0QgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXTfJutG2yoFr6HZJnLsoJMXUN5P2hOoZ9DqW6eBwtQ=;
 b=DLx1u/deQ4gwtfcqE8tQ0lajjOkqKmCkB/9KdWvzAvUddkE4rWZVbi/X925oEI5LcJOyXfEjdwIcb9TRA6kCPBQHc1RJCNl7PPnWneR4+loT4CRoJO2Hic2WAEUIeCVguNCC5HFftSBjELjytCThMDpKF5pnit+P6xUW+ZAXiZq/3TlC39tjWdGbgHsbtJfrZu5JjfE5l39V1vjX//gsJ57AlndjsHd+OlrXhqoQrxqgXQz3Lf6K5//mW9bBOib6qa8FyT0H3c5o01T0y2vvub8RtwL7oU2KbMTSTiZ8UplXOya6W5c6xp+ct1d+kk4Meeg9aJ93yQcNTRdScaxG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5581.namprd11.prod.outlook.com (2603:10b6:a03:305::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 02:36:52 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::741a:c47f:a4:bff5]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::741a:c47f:a4:bff5%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 02:36:52 +0000
Message-ID: <285598c8-97ac-c542-0d9d-d8779fd741e4@intel.com>
Date: Fri, 7 Jan 2022 10:36:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 2/2] kernfs: Reduce contention around global per-fs
 kernfs_rwsem.
References: <202201041512.lFBs9kxK-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202201041512.lFBs9kxK-lkp@intel.com>
To: Imran Khan <imran.f.khan@oracle.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202201041512.lFBs9kxK-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
 (2603:1096:203:b0::18) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5559eee6-9978-4932-b3f9-08d9d1868fd5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5581:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB55817EFBA89DFEF63BDD34D3FB4D9@SJ0PR11MB5581.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:407;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMitMdy4xzzWnXcCJ7xf7vpYqjX3a9Al0SMCyN920MiYHq1a8/Ei6J8Ht6NfTWaEn/L8Wx6OVekseZVIra0N9Gr3kJ4UuxR7MbCNpz4mMkbfcbk3aVvUeNHhiU7wliEkWj2lj0Tf/wcc/Fj2Q8hITEl1iCLdNQmLBvE3+6EIVH0i5QuDv90yVrXVKs6ZKvWpztpmQkdnQDmEcoDzByZh0ZUu5P/oob0JasV+xGRpX1P/0FMv5RVUnWDS/VW5JSXPlZ6SJx20Dzi2F9acjaYVLGy3ImGGn2x2X0ih8TrDqq1sWSd0nM/zSmONCNjqwIsEp4thoah4U2ay+7x6p65Ww1BM8V7UvZinec4Wj85ykLmk4LOZ+E7R9cZMVoSLJqVIZwb2U4tH4g2Ax2fTpVj4Kqr0U/bx90ACi2cUBVi/6FaTQZdu5DW6003WWBCem/5MCWH3wxGPIIvP6y/LASLih1Bx10E0YrF+JjebOaRtJtR3IVo9F0MrJNpD1Si1vIV0ofAeEGHEKL/l11OWEwVm90g0fifwYNHiBRWBcvce/wCrB3fnlhbDjmL+s40fqeRsW17Cz4qkIdR34Fqr8/rSr/3FFB/L28QJHeXTlacL3IXEOBZeFPsiiyA+0HG4Dsds+YVBvik+L64HfxbNnc5vqNQmlNbc8JWIQiVAjygcEEcCkIbo4jeMn7R0Kk9FSsnkI0fzXPcbQ5Dnb8gFjmQCetL3prrMXREdgTBIeWsQQKzJIy/NmECHaX0/NSWaDIrcH0Th2CwXPtVUKG9gsY4cbkJG/f5PRSTlv25XYs8l6kNCCUcQ/5qYCHHajsEsCCdJNTv+YUjXtpEINBlOkhcUDlObedSASSN+pod1snETtJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(5660300002)(6506007)(6486002)(66476007)(66556008)(66946007)(316002)(6916009)(38100700002)(31696002)(8936002)(6666004)(82960400001)(2906002)(86362001)(8676002)(186003)(31686004)(966005)(508600001)(2616005)(4001150100001)(26005)(83380400001)(6512007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmloUVhmWXFHOVQ0aUpVL2hoNzJCeDlUeEkzVDRCb3NFR0VNMmhkaDlNL28w?=
 =?utf-8?B?cDdpVkZQTStjSWhOakZaSUV1RVJoT3J6ME1RdmM1QUp4TmdPaDhUajJBS3F5?=
 =?utf-8?B?N0lqWnRzQ3YvOHpGV3U1Nzg4bVJOcTE3aFowcGtNdkRSTjN2ai9hako5Y3Ay?=
 =?utf-8?B?RFJKajNHMzh6L0NjV05YZzBpd3lnTnJoWmpPNzNrUXl5VGNpSnBrK1JuQzZh?=
 =?utf-8?B?b0I2bUtwVFhtWHNqMXdzL1hBVVozTVRxK1hyRE5TV3NPVG13V2NsMXpXM0tt?=
 =?utf-8?B?blMzMXN4aWljZnJVbjdUT2tyZjJSTUFJMlI0QUY5Y3ZlTXhSWkQ5UWluRjJz?=
 =?utf-8?B?OEQ4czBzRk1iQTNwMFYwOW9NYnR1NnZ5ZVRvb0ZJRUFYWUZjRjZZM0twQmVP?=
 =?utf-8?B?V1VFU0JpZUNaMG02M25ZcTNBVEdDenJrdkwwM3JmS2JoNnRGVUJqL1pvZ3hT?=
 =?utf-8?B?bnRPZWZ3UjVGNXJNWXR5Z2FjOGwzWTRzbUptOWwvbDh1ZXhDOWdUNUJyWjlL?=
 =?utf-8?B?VE1Gdjhxa2hPVVBhdmY5akpTeVN4cmNFMWYxTURyWmkvYmEzd3Fjem5VZnl2?=
 =?utf-8?B?R0l5LzNGcm9obWFRYWlMaTNHeG84WDhQYmtXSFBqY2U2TnNzWmVyMk9vYmE0?=
 =?utf-8?B?Q0kxUjU1ZFFkMWEzSmNEUkxpYndzWGFUL3lYaytvV1ZHTm9kV3JaQ3lqR0dx?=
 =?utf-8?B?M2JiR2dvNGxMYngwdW05alI4T1Q3WGR5Mk5oKzZ6U0RLSWJtMmIzdXZhME9n?=
 =?utf-8?B?MXA4ZVlvMU84eXhzVmpiQ1g3MXhhejhaSFRYVk5iNjNOQW9NaEd2RWRVUG8x?=
 =?utf-8?B?TzM3YllJRTFFMlMyVFM3UjVZNTZYVDcwbEI5TDViMzZ0VVlmRGxNSnd4WXdL?=
 =?utf-8?B?REJBaHEycG1OWTN1cFdMZnRjbURQYzYxRERQaWFNNjBhQ2hmdENEZE10bXBu?=
 =?utf-8?B?d2FpRUdNTlNWYllDVk8wNk1RR015M1pPSHNDbFlPeW1LMEF5dXV5NzByT25i?=
 =?utf-8?B?cUd6YWthZi9DUUJnNUVBWVY4SjJHQWREcmFiM096RFltR1FUY1pJVU8zNy8w?=
 =?utf-8?B?T3dLTEt2ZTFub295aUg3elZYUXJLeTkxSXE4YlpuQWI5Y0htTVhTcmR4S3ZX?=
 =?utf-8?B?alZWM25TWWxtQThPUkJ3b2FLYkpFOW9RNGtRcVMva0RyL3d5MHVaVEJTRVJw?=
 =?utf-8?B?N0k3R1NuQTdob1lhSkhkNllmc0pvQ3g2eVNKT2M1KzVaTnBxUElOTlBOSDlh?=
 =?utf-8?B?eWhDTkJCN0J4MDBUVXQ2a1lDWWYxVVB1enlGVUpwditKc3VpSFZ0ZzdHa3JT?=
 =?utf-8?B?QWU0dngwOHNGUG1NaXJiOHYrQ29UbFhEanBwbDE4YUVCSjJpeFFZRVdndU9H?=
 =?utf-8?B?VEFyaEpucExhaVNQVmVtc2x0UXIyODBoOVY4R1ZsMFJpaWx2bGtLV1liSnU2?=
 =?utf-8?B?RFgzMVFiUEFFYVVBZy9HekVNK1g3UDNMYVI4R2ZQTkpaZ1FkTmhZUlRKZEND?=
 =?utf-8?B?aFA1TEMvWHBQZGFSSUhNSFhjNWx5TVN6MHI1UjJEV3Y3eDI5VzZoN2pJOGlz?=
 =?utf-8?B?THVhM2tTN0tPcTcrU1d1RnpudTU1REp2RlNpaU8wajFBQy9VdFlUS012Rkpl?=
 =?utf-8?B?M0ViVUpINHh3K0kxaTVwb1VHaGlYVzJQd2NTRWE4WGY1VUNPTXdLUmZqay96?=
 =?utf-8?B?UjNDOFNydFovcmF3dTlmT2pEYlFHdzdLNkxRVVd2M3lpajNXY0ZBM0pqU2FM?=
 =?utf-8?B?dnR2V25PUm1DNExtcW02WDc0YUFaMTJkK2Z4QTNtQ3RXazRuZnY3NFYraEw1?=
 =?utf-8?B?L0QvNEs1eFltQnU4b2hIUGRuZWpSWFlsSHRIT2VjVytKaXA5UnQ1NmlwZ090?=
 =?utf-8?B?bXVlbTNnNzUvU05ncjNzbytwUmFVQWlHbXp3ampEMElZSVh1dU1SemFoQVI2?=
 =?utf-8?B?cVZ4Mmlld3hDRDNJSUd3TFBnMTYxV0tVUE56bksxNDBmLzAyRG5KakkvWUR2?=
 =?utf-8?B?VGRZcEFlUkVhbjhobWZSRHVwV3J0SGlwMHpSck1lU2pZR1pSbC9XU21SOWRi?=
 =?utf-8?B?eDhvV1IzVmtCVXBVdlNKYm03TmVPWkFzL2dmeDZRVmM0L0txbWVQMTNpTTYx?=
 =?utf-8?B?RXBUY2x6QzN4NTZSUnBwYm5hQzN0bDd4M21MMmpSekcvYjh2ek5aNG1UQnN2?=
 =?utf-8?Q?L9wtSz3WbGnXWgnHc2X5B4U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5559eee6-9978-4932-b3f9-08d9d1868fd5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 02:36:52.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCuiTA7K7yt7IsPdYkQRvP7HgCaCix+0Yi7hgMg7NVykRFBi0lqoE1UrFDa85Mr84fg1gJy3HcDFX386iPpJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5581
X-OriginatorOrg: intel.com

Hi Imran,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on ea586a076e8aa606c59b66d86660590f18354b11]

url:    https://github.com/0day-ci/linux/commits/Imran-Khan/kernfs-use-kernfs_node-specific-mutex-and-spinlock/20220103-164752
base:   ea586a076e8aa606c59b66d86660590f18354b11
config: arm-randconfig-c002-20220102 (https://download.01.org/0day-ci/archive/20220104/202201041512.lFBs9kxK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install arm cross compiling tool for clang build
         # apt-get install binutils-arm-linux-gnueabi
         # https://github.com/0day-ci/linux/commit/3dd2a5f81a41be1f22391cc8ef0ac78293de0141
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Imran-Khan/kernfs-use-kernfs_node-specific-mutex-and-spinlock/20220103-164752
         git checkout 3dd2a5f81a41be1f22391cc8ef0ac78293de0141
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> fs/kernfs/inode.c:102:22: warning: Value stored to 'root' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
            struct kernfs_root *root = kernfs_root(kn);
                                ^~~~   ~~~~~~~~~~~~~~~
 >> fs/kernfs/inode.c:123:2: warning: Value stored to 'root' is never read [clang-analyzer-deadcode.DeadStores]
            root = kernfs_root(kn);
            ^      ~~~~~~~~~~~~~~~

vim +/root +102 fs/kernfs/inode.c

ffed24e22845a3 Tejun Heo         2013-11-28   91
ffed24e22845a3 Tejun Heo         2013-11-28   92  /**
ffed24e22845a3 Tejun Heo         2013-11-28   93   * kernfs_setattr - set iattr on a node
324a56e16e44ba Tejun Heo         2013-12-11   94   * @kn: target node
ffed24e22845a3 Tejun Heo         2013-11-28   95   * @iattr: iattr to set
ffed24e22845a3 Tejun Heo         2013-11-28   96   *
ffed24e22845a3 Tejun Heo         2013-11-28   97   * Returns 0 on success, -errno on failure.
ffed24e22845a3 Tejun Heo         2013-11-28   98   */
324a56e16e44ba Tejun Heo         2013-12-11   99  int kernfs_setattr(struct kernfs_node *kn, const struct iattr *iattr)
ffed24e22845a3 Tejun Heo         2013-11-28  100  {
ffed24e22845a3 Tejun Heo         2013-11-28  101  	int ret;
393c3714081a53 Minchan Kim       2021-11-18 @102  	struct kernfs_root *root = kernfs_root(kn);
ffed24e22845a3 Tejun Heo         2013-11-28  103
3dd2a5f81a41be Imran Khan        2022-01-03  104  	kernfs_get(kn);
3dd2a5f81a41be Imran Khan        2022-01-03  105  	down_write(&kn->kernfs_iop_rwsem);
324a56e16e44ba Tejun Heo         2013-12-11  106  	ret = __kernfs_setattr(kn, iattr);
3dd2a5f81a41be Imran Khan        2022-01-03  107  	up_write(&kn->kernfs_iop_rwsem);
3dd2a5f81a41be Imran Khan        2022-01-03  108  	kernfs_put(kn);
ffed24e22845a3 Tejun Heo         2013-11-28  109  	return ret;
ffed24e22845a3 Tejun Heo         2013-11-28  110  }
ffed24e22845a3 Tejun Heo         2013-11-28  111
549c7297717c32 Christian Brauner 2021-01-21  112  int kernfs_iop_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
549c7297717c32 Christian Brauner 2021-01-21  113  		       struct iattr *iattr)
ffed24e22845a3 Tejun Heo         2013-11-28  114  {
2b0143b5c986be David Howells     2015-03-17  115  	struct inode *inode = d_inode(dentry);
319ba91d352a74 Shaohua Li        2017-07-12  116  	struct kernfs_node *kn = inode->i_private;
393c3714081a53 Minchan Kim       2021-11-18  117  	struct kernfs_root *root;
ffed24e22845a3 Tejun Heo         2013-11-28  118  	int error;
ffed24e22845a3 Tejun Heo         2013-11-28  119
324a56e16e44ba Tejun Heo         2013-12-11  120  	if (!kn)
ffed24e22845a3 Tejun Heo         2013-11-28  121  		return -EINVAL;
ffed24e22845a3 Tejun Heo         2013-11-28  122
393c3714081a53 Minchan Kim       2021-11-18 @123  	root = kernfs_root(kn);
3dd2a5f81a41be Imran Khan        2022-01-03  124  	kernfs_get(kn);
3dd2a5f81a41be Imran Khan        2022-01-03  125  	down_write(&kn->kernfs_iop_rwsem);
2f221d6f7b881d Christian Brauner 2021-01-21  126  	error = setattr_prepare(&init_user_ns, dentry, iattr);
ffed24e22845a3 Tejun Heo         2013-11-28  127  	if (error)
ffed24e22845a3 Tejun Heo         2013-11-28  128  		goto out;
ffed24e22845a3 Tejun Heo         2013-11-28  129
324a56e16e44ba Tejun Heo         2013-12-11  130  	error = __kernfs_setattr(kn, iattr);
ffed24e22845a3 Tejun Heo         2013-11-28  131  	if (error)
ffed24e22845a3 Tejun Heo         2013-11-28  132  		goto out;
ffed24e22845a3 Tejun Heo         2013-11-28  133
ffed24e22845a3 Tejun Heo         2013-11-28  134  	/* this ignores size changes */
2f221d6f7b881d Christian Brauner 2021-01-21  135  	setattr_copy(&init_user_ns, inode, iattr);
ffed24e22845a3 Tejun Heo         2013-11-28  136
ffed24e22845a3 Tejun Heo         2013-11-28  137  out:
3dd2a5f81a41be Imran Khan        2022-01-03  138  	up_write(&kn->kernfs_iop_rwsem);
3dd2a5f81a41be Imran Khan        2022-01-03  139  	kernfs_put(kn);
ffed24e22845a3 Tejun Heo         2013-11-28  140  	return error;
ffed24e22845a3 Tejun Heo         2013-11-28  141  }
ffed24e22845a3 Tejun Heo         2013-11-28  142

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
