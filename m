Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6433F1
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647789482; x=1679325482;
  h=message-id:date:subject:references:from:in-reply-to:to:
   cc:content-transfer-encoding:mime-version;
  bh=/0+Ee8PviYgY582wozjGHLMbUeBRkqy6041XwicH53Q=;
  b=dXjkZ5ddIdwyq7c6YawztXoxoUO29ywt02PMLN9sl7IqiIjkqT/kYsOK
   7AY0M/LwCGJb6I2itFO5qBjdo6UkZMI+iwuvhL00rHJFlg1l9K8OlORVR
   zlwJJPxFdw4cx4qtnzywpRXhqKz+KOGG/wgXDLxChID8CQ7X726ix5jjk
   M8MGDiqSgIkKkdph2/wITzfL/PA2l7CB+J912VPFBH5eG+tTvEeR65Cah
   IzbEIwrLytBtGC9fXQwH6Ld6y2OFsy2ohnu/g4Y3k2zpRELFSDt6MGvmv
   N6zoUVc5Q9lOGWeinsFHiMBf4JtomBfSttDf4bWlJ+E4Grp4RTyTcsXRv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="343835906"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="343835906"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 08:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="716192848"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2022 08:18:01 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 20 Mar 2022 08:18:00 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 20 Mar 2022 08:18:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 20 Mar 2022 08:18:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 20 Mar 2022 08:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNBg/xllq+r34r8F6P38Ybw1sWqMV+RURaYNvRGKVTiJGbv6aACnUV7PnXkuQky/tQx+waA6ngZ/0K2fQXFjJd1Ma9fiwyaopQQzDrC83hGqksm3ziLMrsfVUs03AY59gVaKFaWoqFbyHcM0PeIIuAucmWLTjhgPF8UlqVIg4jafaj6UFWOX+PKgiWpaIO0sb2mQJQGkYbdV7DihGf9ZhSq3+0mKH0allbjZDYV/kNHT71DHE1/lBTysExn26QEhp4rzV2z6XVXuihXNaFP+AAmvWJNTjT33qJjycykODloOuQ2qsw42J6vWj2IjTfIc1e78Z2e7tFmX8uGESe8gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfgaXqJP3rHgaFTN96aNrOezr3h1iH0nxwtOTcRhiEs=;
 b=DOqSZezUkboJ4Pz6a7z933UUtzKBJ/IlMtJ4siE7YvqF7cUEQFc+q9KluY4wn0B3E9sr7rdwlfVdH3fOF3Nd42i7jlRZUlAoR3VpPfwLTluP24s4FN8KqrD/6n2HIJpDOf1KI+QJreeVR4bu4SozulTV9ypx1CEg+Zoq2ug/OgkB2pSy0blMwid5Hl1tdRC93ERBOXyf6rMPMhhshzSPULb9Q/p2dbjDb8+cC0Do8/r2M88mh1tJvjHgQte6zYx3t8SrFkLISb+KsbgpDc0zH7Q4o2drzVwkdYGV64KWlklD3QwcCQDGp4jNJEvX1njS1vR+t2HdPdNiSXTex3SHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by BN9PR11MB5468.namprd11.prod.outlook.com (2603:10b6:408:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Sun, 20 Mar
 2022 15:17:58 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::90bc:9408:541e:5b94]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::90bc:9408:541e:5b94%8]) with mapi id 15.20.5081.022; Sun, 20 Mar 2022
 15:17:57 +0000
Message-ID: <31b38d57-0c0d-e8a0-89f2-b872a73688bd@intel.com>
Date: Sun, 20 Mar 2022 23:17:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 3/7] xfs: xfs_ail_push_all_sync() stalls when racing with
 updates
References: <202203181702.8MiQ7z1k-lkp@intel.com>
Content-Language: en-US
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202203181702.8MiQ7z1k-lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
X-Forwarded-Message-Id: <202203181702.8MiQ7z1k-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02bcf985-a122-448a-5237-08da0a84d016
X-MS-TrafficTypeDiagnostic: BN9PR11MB5468:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN9PR11MB54680FF91E4906E0E6C56733FB159@BN9PR11MB5468.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKuEcP0BuLKECZ2vleH4kQAjF5W5B3CZVUJDJL6wokEx1FOS4J9CSl/wqcwQeojZKP9kZT86fQd1uGlX/dbhzQuY6Cq10RQGdmYFK0ZH164aKhnaedii3t+APB34zIShgvbhHMhC1U7OtohhREJNqG1Ccjo3JBNnDnmBdDPqEklipk58FnQqLXKT0Ukty7dwZB2897uf6vZo+PLWymOj/d2BOXt9xBXk9GkwR8ilkeTb82mdfEHKfyoNFHgM2n7Pt32oVO3twGHkUIfjZ0hf6CdlpJVPhqUI1BzPJXYh0j+YRV6+xu8F9dVSERA19966K9UarWdtfrDK1pzoH4EfTEUu8FxFON++KL/z9rsh8mV51UgwzpSGf/ZHKtXb/H87iCltahQTeBf5rcLnNxEqaekg9+AknycQ5Vna/eFeDNNDnQ+8LN1W5Pvx2SZSgKzblJM4Um+T7aUjmQnCs5ThuIt12GI/nTZ3AJw6jXetQo6KWgMtzv0JWoKaHqC4hLp/JBbNitHS3xyUQs6kA+WZFPre+xf1ykOuFfTWQ65NBB35peh5pSoG3MrIv/g3/gctX/722D6mvTkQqJcJqw8sE1WzGdxWqRnHTgXJhdkGZxR/5DDk2oLT2N3XNgB8LO3WvX+JS3LZ4gyF1o7l99xaEA8fJmaZkbYMIIKKXLrxchy748aUwym9oLB4P7+Dp8g2dxbf+BQ+mTkxFG76ubYz3DNulBhGVi0bcLyro1sD+3YINB0qX3qwEyQRVr1VjD5eowN+xe9U1OJ9RtJzGoOS/f45V3ULpDvpQALYfkl4E+qHVhvDyfT6IXCdAgXCJOFLxeFSbrLph6zToUL8iYQXhh6eKZWU6Ow6wAkVsG7Ca3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(31686004)(8676002)(66946007)(2616005)(66476007)(66556008)(82960400001)(36756003)(508600001)(6486002)(966005)(6666004)(38100700002)(8936002)(5660300002)(6512007)(316002)(83380400001)(26005)(186003)(31696002)(86362001)(2906002)(6916009)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRicGtvUkZTcXFBemU0Y1JxejFDZVhuVGlFRFJ3Z3p1NCtpS1FQN1pOYkZx?=
 =?utf-8?B?WFdTY0tOd1ltK3BROHpaYlRLZXl6M3BmUzBmQldwWkxWTzR3WTBDR3BjY1Ax?=
 =?utf-8?B?bVFwZDlNY3pWM1F5RmhtVll4bDR6ZHkvSDQwcUZnNHJvZFQyRDA0NUkyVnJ2?=
 =?utf-8?B?YnI1TVEzMVJoRStCNEVmTXd5RStsVTBSb2lRUFA1OWJmNUprcUtrMEoreU5i?=
 =?utf-8?B?SnVlUmRXZjlody83SEJEcWlKTnJ2VVJjNE5zWWpaQzd1YU1jQjRYb1dBWEg2?=
 =?utf-8?B?SUQvTCtET1NYMElFZHZMbHZDd2Q1WHhLeGVlWkdOSlpBWmJsZXRVZkpMRW1n?=
 =?utf-8?B?YWNqMjZHeU02M1JKSEg0aERmdGlyakZ3ZU42RDUxRmdDTS9oUTBQQnJHN1VO?=
 =?utf-8?B?YVRra0dlWUtDRWIwQkNJYXFhM2Y4RWEvcnBHZkVWN2RrNkJON01mdzNWVFJY?=
 =?utf-8?B?Y0lrRjJNd0RDaTlZS1pINk5Yam9aK0RoQTFqeGJsOFZld0R5dklseHhWY09O?=
 =?utf-8?B?cnhTVkFGUTFOQTVVZlBjRTdxVDVnV0JWRGd3b1NGY1RPTGVmUHFEWk1aTlFE?=
 =?utf-8?B?UXZOaFo5MXdOdUY1Z1Z1UmR1NEFPUGI3Vm1uSHpJdWxRQmNBSGtLZ0lPOCs0?=
 =?utf-8?B?MDVnLzVBbGpxY1M0NW14Wit5S20rQ0JUQkcxd3pFQzdMc0szMkN3L1pZcGlp?=
 =?utf-8?B?dHJKU3FabVZmUk84QzJPaVVuVTEydVBFelM5MGViS0R6U0c3aDQwUE84VmNo?=
 =?utf-8?B?WkFWSXlLbXVSalMvOTVIVGdoWkVJVTR6Mi9VZzA5L0xIdWN3RHp5NUVYa242?=
 =?utf-8?B?bWUzSXZ6bFp5TStud28yVGxLaFJ5SGFib1hTMVkrRjk3RkpUakxzSm42ZzJ2?=
 =?utf-8?B?L0lUaUFPQmpkVWF4dlcxMnlLQjJNbkcrUThTKy9Wd0ZZZ2wwOGIrTzh6cmsy?=
 =?utf-8?B?T1FWUWFXa0c0YnB4UjRyVWJyTHFSY1RJTno2V25JRXYzUHBiMVZXdmlTSnBO?=
 =?utf-8?B?dWVIQ1RRNWdaeldoQStMTkI5RnFMckdWTld1VFV3b29FUnhid203OW5vN3lI?=
 =?utf-8?B?S2dJMzFkTDJ2R2daNkJ0UGNPd2dDQ1NPNHlqOFFSbGFaeUgrZkY1VDFNWHdJ?=
 =?utf-8?B?czdaelczekh3K0xMMFlXRG1tdHVsRUlBL3BNalB3QVlUajMrZFMxWGNzQ0FJ?=
 =?utf-8?B?a0swSGRNWXJGdEIzMG5XQ2l6SGNCSXNNaGVmclVPRmE5dzdnTnlpNVRqZExv?=
 =?utf-8?B?VUVCSGdUTHpXM1VoejlkTzFZOVIyQUNENnExRTZoQVgvYWJ0R1I1dUYxU3ZM?=
 =?utf-8?B?N0Q4b0gveVhDblFFK09Obm1ZZWNvQWxMK2JSR0p1V0R5K3JrTDhua3NaMXpY?=
 =?utf-8?B?cSsxd0xOZ1NJakovM0RGTVRES000MmhDclBhcWVEVzZraU9nS0RITHc5bG5W?=
 =?utf-8?B?TXc5TE1YaVMvT2h5TnhMdjB5YmdKQlNMZkFWSmFxUnU5TnZwWlBsSG5KM1NM?=
 =?utf-8?B?M0g4YnllOVg5UTc2U21xSTBHZWdaWTRYZGZTV1JGQ0pMQm1oVnl4OGJSdGdn?=
 =?utf-8?B?VG1yMWRlb28zeldkTGdNSVBjSEVkYUxDeVBlUkZ6OHpOUHlLRjhrVEhuNE5D?=
 =?utf-8?B?WSt1dHNlaHRyT0hKdXlQZkpjWDR4WHpJc0h2aGFuK3NqSFM5WXE2Vnd2QkZz?=
 =?utf-8?B?clBIbEZ1TFhXR2VSKy9UeXFVUFFiT3dudkNVSGcrMjdIQjJIdWlsckZCL2VX?=
 =?utf-8?B?dHlhclUxSE5HYkRTYktvZzhyQWowUEwrbGFVc0M0UnBUU1htUmdtVHNnZmIv?=
 =?utf-8?B?T2UvYnpKNWI3VmdMNGxYc0w1bko2VVZVUGg0WDJuQjhUK2x0NC9FbER0bmpC?=
 =?utf-8?B?MUhIY1IydmpqUHhGRmxWTTN0U2hWN0EyanVlS3oxbnNBbTl2ZERZK1daRXhl?=
 =?utf-8?Q?5FtC0nMobYrfuBc600xHBsXUp+SoJVK6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bcf985-a122-448a-5237-08da0a84d016
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2022 15:17:57.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bQlKaQc2JyC95qs8qR0JnumuVddPgxYl76mS0ff2kiJ+ugpifVyL8BMHM7yYJ0dbtORxFXHwMOdsqOz4fx+TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5468
X-OriginatorOrg: intel.com

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.17-rc8 next-20220317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-log-recovery-fixes/20220317-141849
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220318/202203181702.8MiQ7z1k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/29e90a4845ecee7dcc9d1e1af7ab6bb2231cfb1a
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Dave-Chinner/xfs-log-recovery-fixes/20220317-141849
         git checkout 29e90a4845ecee7dcc9d1e1af7ab6bb2231cfb1a
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> fs/xfs/xfs_trans_ail.c:737:10: warning: Although the value stored to 'lip' is used in the enclosing expression, the value is never actually read from 'lip' [clang-analyzer-deadcode.DeadStores]
            while ((lip = xfs_ail_max(ailp)) != NULL) {
                    ^     ~~~~~~~~~~~~~~~~~


vim +737 fs/xfs/xfs_trans_ail.c

fd074841cfe01b Dave Chinner      2011-04-08  725
211e4d434bd737 Christoph Hellwig 2012-04-23  726  /*
211e4d434bd737 Christoph Hellwig 2012-04-23  727   * Push out all items in the AIL immediately and wait until the AIL is empty.
211e4d434bd737 Christoph Hellwig 2012-04-23  728   */
211e4d434bd737 Christoph Hellwig 2012-04-23  729  void
211e4d434bd737 Christoph Hellwig 2012-04-23  730  xfs_ail_push_all_sync(
211e4d434bd737 Christoph Hellwig 2012-04-23  731  	struct xfs_ail  *ailp)
211e4d434bd737 Christoph Hellwig 2012-04-23  732  {
211e4d434bd737 Christoph Hellwig 2012-04-23 @733  	struct xfs_log_item	*lip;
211e4d434bd737 Christoph Hellwig 2012-04-23  734  	DEFINE_WAIT(wait);
211e4d434bd737 Christoph Hellwig 2012-04-23  735
57e809561118a4 Matthew Wilcox    2018-03-07  736  	spin_lock(&ailp->ail_lock);
211e4d434bd737 Christoph Hellwig 2012-04-23 @737  	while ((lip = xfs_ail_max(ailp)) != NULL) {
57e809561118a4 Matthew Wilcox    2018-03-07  738  		prepare_to_wait(&ailp->ail_empty, &wait, TASK_UNINTERRUPTIBLE);
57e809561118a4 Matthew Wilcox    2018-03-07  739  		wake_up_process(ailp->ail_task);
57e809561118a4 Matthew Wilcox    2018-03-07  740  		spin_unlock(&ailp->ail_lock);
211e4d434bd737 Christoph Hellwig 2012-04-23  741  		schedule();
57e809561118a4 Matthew Wilcox    2018-03-07  742  		spin_lock(&ailp->ail_lock);
211e4d434bd737 Christoph Hellwig 2012-04-23  743  	}
57e809561118a4 Matthew Wilcox    2018-03-07  744  	spin_unlock(&ailp->ail_lock);
211e4d434bd737 Christoph Hellwig 2012-04-23  745
57e809561118a4 Matthew Wilcox    2018-03-07  746  	finish_wait(&ailp->ail_empty, &wait);
211e4d434bd737 Christoph Hellwig 2012-04-23  747  }
211e4d434bd737 Christoph Hellwig 2012-04-23  748

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
