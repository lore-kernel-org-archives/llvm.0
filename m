Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307353670
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645090529; x=1676626529;
  h=message-id:date:subject:references:from:to:cc:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=byR9M0rVXM5QiUdkapgkOtKZLpqKjdU/XHunKwoFgiE=;
  b=EGOWTleK26+uc6Qg8S0KpMPWf40GsAQlTSIM7Wm0fZrXPh62ejYK3aXw
   a4pbNgJZFcjV6yZk4mSMtDwMOw4TXokl9tb2I7NNZHF7ihHYXXcWpz1Ux
   PnO46JVyr3hJK+YDm0P4EXyLnQbWecPprBx0c6g8ZMipuN17l09Ip+ed7
   XpO30N5pnGXZ5vBO6C+ftG6s/F6i1uXYJE0qL3yiV9LoXtSqORSqHWflb
   zPnL9vb/bxNER4VLmxKagoIGYu+tRjQlhTQqTTV4ob6SF7HESNw7Mhp46
   cQzjDr+oq7UaAPipclqckuH2i/jrUfqZZHuvyTCoeVGuyltCTd2ASsSb1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311579041"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="311579041"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 01:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="488038369"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 17 Feb 2022 01:35:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 01:35:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 01:35:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 01:35:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 01:35:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY3Z1rxWGBZKe52XVqM3r/EubzZeuEutLby/QCOWTr0+gg4oyxWybkvZvjE2W8kXv6wvG3o5/pi3510cACI7Q+t5Lk9+gdqAXhlTv+KVMScDNyd4zFUGCDxmZY2rTxlCqZU8WtBDotnstx9euo1yi8PqlJJnu82MuKbwWOofHWrERCRxf1ToY3e74Eceb/ArWRH9fV9WbgCWdPd+FKfOd91iFyMfZLnKnubOmsXeY/742xiQJASxC5D7skS/8rPaCfNKod3BnL+5jCwlo3vKB5GcofcGaSmQdAOaL1evtQLZFuYWlygeV2+cxgp4rW4LQCKnVxEFw6TZA2VzrkYAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC2ITMUaf1Jrwi5D767fzArzHzh6WRzeRhW3vd7kDwI=;
 b=iypngSDtTN6nmWyXgkSbVt6PCRucAfbjB/hkQ3IVkUsYvKWYyaVK7s1YFLjtBpngmo8gwRDoOAhfhsvv75mR/UryJQKy/0pVNkliVCk570W3Y0rUy/86s8uzU88BctXrqZkossXz2MBEsbIdyzubWRE61mhCA3i/AfHxWyu56XJCtDRbrjH2imXBjX6LNiovjG1hmxqL5v/i3Myt3eR7eFx3KUYc88MW6xMNOPt9lQJPc8N67kKl00p7JXKoF5CJWVqMKyKFyVtoH0zPMMX2/bP/D41IAmXCEiVFlGGB0But0Idr72K2M3iEa1aQDLHjKETdk+Ol+8sKx3lbLleLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 09:35:25 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d%9]) with mapi id 15.20.4975.017; Thu, 17 Feb 2022
 09:35:25 +0000
Message-ID: <f16e0769-f88a-9eda-d1ca-aed82ccd8cc7@intel.com>
Date: Thu, 17 Feb 2022 17:35:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: [linux-next:master 556/6237]
 drivers/net/wireless/ath/wcn36xx/main.c:409:7: warning: Branch condition
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
References: <202202170554.WYrgcFtq-lkp@intel.com>
Content-Language: en-US
From: kernel test robot <yujie.liu@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Kalle Valo <quic_kvalo@quicinc.com>
In-Reply-To: <202202170554.WYrgcFtq-lkp@intel.com>
X-Forwarded-Message-Id: <202202170554.WYrgcFtq-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d7cd44-ed19-4a5a-3b06-08d9f1f8d325
X-MS-TrafficTypeDiagnostic: DM8PR11MB5670:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB5670A544010CCB8FEF3F83DFFB369@DM8PR11MB5670.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b49RYV6zJlaC8j5HCmkMmeNpVmOjqS/DeYyQmVI6tvw+Ief5ORu/DzCyf1r0L5b1CYZ1rViukvTsUx8Yjs9DhDClwn9gRgwDGFagyeoB4QBrFq7aKNOBf+0xp3pfA1f4l190Wi4/SBTWememRPrNF7dxJX41iABRUGJV0yLzRt32wUakxwKa894cHB9TOwZqGN+HpS9rj4tRicKQzbSkPCYHccTTjjq+601zWBxTnJCibqzsPth/1Lh//hcwFjGKeArrt8YiE8V0Q4UJ9WIs4fT/KUxwpF5OzvEEOsYwcMCpQDC//e7jElhG0XfUKu1lnR8nWluXTNWZsrFct40zMJWiTsW1CF7mVi61GFjzITeY385mgGlLascQTrINh+E+XvOnpiUl6bQfJ0mQ7fiPOCsWQ64Fv2WlDYe4TVX5ZnMWDQB3wNuOQ65pITAeqzBYuIawCDZ0yyjBzapfyhfBQQLqIb+4iFeE7i3BgbtmNuXMwhIxW5dRVLzyk9i4kd+eMDtOHd3xdyaMPxL5627HrtKo6vcMjOi6ANpNqRS7vRo/bCvFFoPfP/5edq5TOJLjqTXST90+g6C+fMaLDwbEgOp2G2dBQAuMLZXgUxEaEaaEyxLxxZ1x8rmLpR/oDmgVBbSbbGDTTR9vL6CnPIgxKHEB6+nlMjvIzKswotqV65ALLu6ADd9jcdQ7ZkuajEUm5pATuwCtGukQhHgiukzTq0L+VB2Wl401SVqrsz46dzLS32p31hBiTY5kfdGYvmLYpfhRjCLQ+MGzvkEHbTHqhtioKGtVfncD8xChhhNUz3I5Op2/2aU1yvDJQ5Udwm3ZKP0VplXrjksI+/F+FItk7QxnswUBb11HEyzU/Wtao1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6666004)(31686004)(82960400001)(6916009)(54906003)(6512007)(6506007)(4326008)(2616005)(31696002)(83380400001)(8676002)(66946007)(66476007)(66556008)(38100700002)(5660300002)(2906002)(508600001)(6486002)(966005)(8936002)(36756003)(86362001)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTZ6V3U3N1ZGeWhxRVJnMGJvMkkzSWhCRklYd0lLVDZyMVUrbjRwY25DMkhT?=
 =?utf-8?B?bk1LclJycDVydUhRdisxMjFTSUUvbE9lTU9rQmpKZWNyZzF2WFl3WkQxd1hz?=
 =?utf-8?B?Q24xaVpleWM5dFVYd0JRZi9yZnFKQlJuTk1FUHBoeHBkcGxFOHhIMTFjNnQ5?=
 =?utf-8?B?ZGdWT0F1SmZCVm5xSE1aajkyK0d3dzlFTDZaYTFCZXA4cE1xNFZkWXg2U2FF?=
 =?utf-8?B?TU9xWi9FUXp2Yi9UN2NRZ1BJbGxNSHpUNUxENmc0VE5PZ3puN1lmMlNqNk9p?=
 =?utf-8?B?d2xmdEF4NjJtdlk3TEliK1lueFJnaWJFalVqYUF2TldPeFAwcTZPMHA2TVJD?=
 =?utf-8?B?aG9UQWhhbGY5VHU5dlRIKzlueG9zeDRPblMxTy9mcDJrK3Fxa0pEVUtKZjhq?=
 =?utf-8?B?dE1FNXIyRkVKSjVmOWM5QmZQVTdaQ1M0eHBzN1RKdytUQ0FlcHBBck5vWlBE?=
 =?utf-8?B?TTM4amdLSEVQM3ByTllTQWtLU0t4ekNEZDU2ZXlrQTlZVFozNXdMRmF0Y3ZO?=
 =?utf-8?B?Vk9FM0NaRXl6SlJZV0VEQi9CZ3NSYVRmYzlCMzBEYStST1JkU3pBZDFUY2tC?=
 =?utf-8?B?QkdIZjZZVHY3WmdTQkdoQ3JUN0RrelhxZFJkWVphTGczd0FuVHJBVFdWQ1ZS?=
 =?utf-8?B?aGxlSlNoZytUSHViOFNTbklUdXc1V1VxQ2ZidmxQK0xWazF0cDNaa0NUWGtX?=
 =?utf-8?B?a1lFUnZFa3VzMnRpekR5NjhhMXlJbjBLSVdYRHZaakkxOWlaVUhQejN0R0F1?=
 =?utf-8?B?K1ZpSG85Mmt3UzYwVzI4Y1RxTTdma1RLZEVKZmZjWExOREhsMUlwOGZjVjYz?=
 =?utf-8?B?SEFHUjcwTS9SejNVdHRzZk81bzNLcEZTSW1kdDkwaWh2eStjNS9oelJNSld3?=
 =?utf-8?B?UHdDdmdLOHJSSUg4RlFUL3FFM04rc1hIdVgrOWRWS2pNWVpxaXZzdlBtSktq?=
 =?utf-8?B?MEY5ejBzUWlJQzJXM1ErTUFhU0pKM2JTUHloZER1QXBWQTRiOFFESFhtY2Z3?=
 =?utf-8?B?ZTdFSUN0S0o5K0Z5KzU1OTZTOWk4dmNSZG9uOXBueUZYdGtJNWJmRURoSTBF?=
 =?utf-8?B?K0w3WUo3dWpHSEdmQ3pENnhGeDVSVWZ5cXdVenhWRVZLUGc1VlgrWDJ1T2hP?=
 =?utf-8?B?aHFhamNPNVgwaW5OZmwxeXlXVk9Vc211ais3d1A4bUJPbTgxYzM2Skg3SnlU?=
 =?utf-8?B?M082a0tCcFBJd0ZaTFBwUVBmM3VKMXF1bHFHSkEzVVRzY3VpYjZRWVlSYlFY?=
 =?utf-8?B?VmxnVW5peGJrUmR2ZUdXcGtaRVE1TmNFRlpmZG9IcDJUMjc4MzdlcWZNQ1NQ?=
 =?utf-8?B?d3g5aUc0c25IdU1Sby9WK0ZlWmNndC9uY1FPVDZYaklwRUFDM0VCVDJJSEdC?=
 =?utf-8?B?UXRFNFdDNEl5MXlYQWNPYnltYngvM2ZLOXlUTWdlUWJSWC83QmJOVzNOYnJa?=
 =?utf-8?B?UmgzbjBYZ09OZ0JHUHBvVnJ3ZHJPcDFMRytrdGl0RjBWMzFKaTJZNzdseFRB?=
 =?utf-8?B?ci81bElpZ08wTDBuVlVnK1RlbEJ5Qk4reHR0T09YeVN1U21JSnFNZnVNMGha?=
 =?utf-8?B?Mks3NkJsL2tqNFVqSGFJR1pjRllUMk9NcEFQdGJHTlh0cHcxZXY0NnA4Mk9q?=
 =?utf-8?B?blZBdjF1Z1ZZdzBnVW96QWVFdExuNGEwMmE3T0xFS0s3L1p6bDdhQkZYY3Jl?=
 =?utf-8?B?YzBtVDc0VHhTSm9lMmRMczc2YW1xaEV2R2oyb3NOUHVwMTh4OGtneHRlcGN6?=
 =?utf-8?B?VzI1UFltNnBoaWthSzVUZmFRQWEwZXAwb3NzanpMM1RJQ1E1Mm5xeWtkNHpq?=
 =?utf-8?B?cTNUUm9aSmJmMEtZMmw1MnJ4R0cyVGlEN1B4aHBzR2MwSXllaWEyeG9UOHVJ?=
 =?utf-8?B?ZlpuVFBOM2M2NldzY0xNeWNEYzl1cHU1NjQzVnhpVkR2eWZ1aXJkQ1RMWTBo?=
 =?utf-8?B?OHMzc0hpc2lMaTA0bFdFRHNTK2hVQzhudDR3aUJaZHZHd09WVU5tZ3VOMzE2?=
 =?utf-8?B?UGc5TlVJcUUyWkx2Vnl3WWI5aDVoRjdVVzduU0pMSk92NmR3b3EzQ3E4NlNB?=
 =?utf-8?B?amcybVpVeUw5emRqUHFjME1IUyt4SGJOTDBPSFZuSnBHUisxWmNyaW95UmND?=
 =?utf-8?B?QlloMEJQeEU5eXk3dThtQUZTSEErSEYzeUtveVdxRWFacmg2M2xDcVkwSXNY?=
 =?utf-8?Q?hrrRbHvx/g75M0fj20+/iPM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d7cd44-ed19-4a5a-3b06-08d9f1f8d325
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:35:24.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZeANq5IyhjuGDGfo5eGA6+gy4vIgzNW+TcUmS87I7LhEEzOapi+SRM7vWU6q6+nG2KYqnNuQDpgaCfQH6ZNdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   763a906a02e961eedabab7dbedd16904a3bd0184
commit: d6f2746691cb10e484f15ab9e44e2cc2ccf9bd86 [556/6237] wcn36xx: Track the band and channel we are tuned to
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220217/202202170554.WYrgcFtq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d6f2746691cb10e484f15ab9e44e2cc2ccf9bd86
         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
         git fetch --no-tags linux-next master
         git checkout d6f2746691cb10e484f15ab9e44e2cc2ccf9bd86
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/net/wireless/ath/wcn36xx/main.c:409:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                    if (channel)
                        ^
    drivers/net/wireless/ath/wcn36xx/main.c:396:2: note: 'channel' declared without an initial value
            struct ieee80211_channel *channel;
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/net/wireless/ath/wcn36xx/main.c:399:2: note: Loop condition is true.  Entering loop body
            for (i = 0; i < ARRAY_SIZE(wcn->hw->wiphy->bands); i++) {
            ^
    drivers/net/wireless/ath/wcn36xx/main.c:401:7: note: Assuming 'band' is non-null
                    if (!band)
                        ^~~~~
    drivers/net/wireless/ath/wcn36xx/main.c:401:3: note: Taking false branch
                    if (!band)
                    ^
    drivers/net/wireless/ath/wcn36xx/main.c:403:15: note: Assuming 'j' is >= field 'n_channels'
                    for (j = 0; j < band->n_channels; j++) {
                                ^~~~~~~~~~~~~~~~~~~~
    drivers/net/wireless/ath/wcn36xx/main.c:403:3: note: Loop condition is false. Execution continues on line 409
                    for (j = 0; j < band->n_channels; j++) {
                    ^
    drivers/net/wireless/ath/wcn36xx/main.c:409:7: note: Branch condition evaluates to a garbage value
                    if (channel)
                        ^~~~~~~
    drivers/net/wireless/ath/wcn36xx/main.c:413:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
            if (!channel) {
                ^

vim +409 drivers/net/wireless/ath/wcn36xx/main.c

5973a2947430a29 Loic Poulain     2020-08-24  390
5973a2947430a29 Loic Poulain     2020-08-24  391  static void wcn36xx_change_opchannel(struct wcn36xx *wcn, int ch)
5973a2947430a29 Loic Poulain     2020-08-24  392  {
5973a2947430a29 Loic Poulain     2020-08-24  393  	struct ieee80211_vif *vif = NULL;
5973a2947430a29 Loic Poulain     2020-08-24  394  	struct wcn36xx_vif *tmp;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  395  	struct ieee80211_supported_band *band;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  396  	struct ieee80211_channel *channel;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  397  	int i, j;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  398
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  399  	for (i = 0; i < ARRAY_SIZE(wcn->hw->wiphy->bands); i++) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  400  		band = wcn->hw->wiphy->bands[i];
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  401  		if (!band)
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  402  			break;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  403  		for (j = 0; j < band->n_channels; j++) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  404  			if (HW_VALUE_CHANNEL(band->channels[j].hw_value) == ch) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  405  				channel = &band->channels[j];
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  406  				break;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  407  			}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  408  		}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15 @409  		if (channel)
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  410  			break;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  411  	}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  412
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  413  	if (!channel) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  414  		wcn36xx_err("Cannot tune to channel %d\n", ch);
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  415  		return;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  416  	}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  417
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  418  	wcn->band = band;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  419  	wcn->channel = channel;
5973a2947430a29 Loic Poulain     2020-08-24  420
5973a2947430a29 Loic Poulain     2020-08-24  421  	list_for_each_entry(tmp, &wcn->vif_list, list) {
5973a2947430a29 Loic Poulain     2020-08-24  422  		vif = wcn36xx_priv_to_vif(tmp);
5973a2947430a29 Loic Poulain     2020-08-24  423  		wcn36xx_smd_switch_channel(wcn, vif, ch);
5973a2947430a29 Loic Poulain     2020-08-24  424  	}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  425
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  426  	return;
5973a2947430a29 Loic Poulain     2020-08-24  427  }
5973a2947430a29 Loic Poulain     2020-08-24  428

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
