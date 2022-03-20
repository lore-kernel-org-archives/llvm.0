Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34033F1
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647790329; x=1679326329;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=xveUjnUux1J0NOajS6Xf1t71z3DIt7/hmKHXjc72FAA=;
  b=htH28u3rd1w5TIZMlx9wTc2Gfx60mx8x+FVkTv0XzIt0gjDXy831dLMp
   u9Hxz+ZPEKhCqRrRr8P73hc2NcD6EAuPWWeQd0y8rikcBHFL5mkGfWZRR
   cbyHbDpFCRmws6HnAykavFHGh/Hp7M+8uB1oe3JXdLGeEtAfJkPdKcIDx
   Ym6n2qnqU+EW5uewWi/SBpWt6i7yWDzG04luz2Wlm3Ulglkt5Ji6S6I1B
   KyeH0bQqdE87YpvA4PtsSeJxeFoVV+5t6AGO471JuhE/cC8ohSX4sbitD
   b4s4IHN8CvX+dT7rYjD4oB9Zrqjp2mmcto+Sj9HoMIt9/+3f5Z9i0oA6c
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="318117138"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="318117138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 08:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="823805641"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2022 08:32:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 20 Mar 2022 08:32:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 20 Mar 2022 08:32:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 20 Mar 2022 08:32:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeXDA8yfCYL46DIqQPj3mkdbzJj7hI0p3bjKXUTpbAmgGEkI2tAXuf5O4SvEoEx+gdjK+4TF6ipPQX8RhlgLE/CiquzN6OyU+b8yOeRzOZFPUMtzaERWR6XTyxnODXS/dpuLjSFigrKGOp/ZmBxmfUm5XKgAPj8JSJg4fi3zd84XouH7g4V4JdF0vLDh52mEoiMyptAEflHo5JbFRH0A5w5aFR1Oi1+XIYKt/LiJ1oOrh0NTCgy4154abmR2VLu9VAEIVR52Dmp4IloVwtO+6ipA7r7UbLajzN/r6a7KlNHTq9v9l1nynNnOMy+suctwYUjo3+4NT4NKHnLcuGkfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW1GAQLnBLb2kriobMWDxxytNy/9z5/WSW11PKjKmZw=;
 b=caFAYANWGGx6uFuW6eis/EDp5QIFGAzS+F2uFUkB3j7+1kb5soRzsokWJAXEpn8eAL4LuvKcWAhZCH4hAqw/p5PhPVAlN8gwpWAhfcz3piIhSwN9H8RRzl9313EtgWh8ZI8I2vFdwqNa1eIqQ0MUUAo0rnsDGdEfhXr5VT4RA4jJmtFvkQXpK4l5CPJw5sl5DQljhwFedZghWkGChXTx1hmgtunTbux0ePuiyITV3NH9AbOcUNqlDrI/ELBRU8L/KNBBfZHpu2j8h6YcuLXBqCB7YBA+UQVUei2conx9RO25o6csjmqrfKQRwGBtT4EYxW8qw8B8Yu/+cg+0LYW/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by CY4PR11MB1655.namprd11.prod.outlook.com (2603:10b6:910:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Sun, 20 Mar
 2022 15:32:06 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::90bc:9408:541e:5b94]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::90bc:9408:541e:5b94%8]) with mapi id 15.20.5081.022; Sun, 20 Mar 2022
 15:32:06 +0000
Message-ID: <1046ff17-c705-76ab-3f9f-b11e79f87313@intel.com>
Date: Sun, 20 Mar 2022 23:31:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 03/11] habanalabs: change mmu_get_real_page_size to be
 ASIC-specific
References: <202203171437.0m4BxdYd-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202203171437.0m4BxdYd-lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, Ohad Sharabi
	<osharabi@habana.ai>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202203171437.0m4BxdYd-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1b94034-5c77-4f54-f82d-08da0a86ca31
X-MS-TrafficTypeDiagnostic: CY4PR11MB1655:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB16550ADC854BC50330D7690DFB159@CY4PR11MB1655.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPmDmqXVUOdB4R4YP3+U/YVjDkR4lrWdYpY9KlnXFCpa/ZObrSn/G/CBu8/u8T89+9So4WFHJCQCNiF1GrXf1PsuTDdtF7++g+9aNThmd8KY0AE63D9l9uKybXALm2ZwUAwKSwFYKPeko9Yf2c0QhwVLLuGG/EhDusdQiyd03i3wV02OYveDpuOmOhYaps6jschN7NhCigq9civt2fKqjOyrCifr7oMsqpTVv6wHU1THLYvcOfANvn4BbNPTrD5mjWgeYzdSNTmllKv/YcGwqssbQcyCbyyhjOrqhrNqNDGUERpLQddkdjms3GPqPwC52V6jvGnYZPEzCH61cUd4JwN8UZl0Ws11mFY0u6pFTRQx6SOlBV3TXDrYHsOAiC07I8tpmbNDRJHQIVZh7jL9XgVRgOaDVC8NrHv7jQPUVPh1EYLIGve3DWxt5rXoX7FWsEMUfZLngyxeeuP9uiqp/Mklrmsu7KjgkC7YAsMWtU38yUphZV8xaaTpcF7dOXcPbtU6WsAIAdIG9gkvbcKfJhqZ2FjeBnHcnqV0puX6NIIiGlZoDMboxIPj+9avdBzbLtCyY9v1gq60JAejVX4+PujP+zkrRK+g1ypb/sH0SBcXSOZW1LilPX3owy2LXHNA0SZq3t+DJpcyNLIKq5r/VtD/KQtObqr5urq0mv6ZNZJqzCHLS3BkxyrKutLM9d7/lT1x9QpPOfc89NK+L4Xz9xiret2CsZDSIKB1f6Zhl2jZ8dcXLI0VmbxF4OXbtAtsA8zSONeLPCs9dcCbQQ6GtAVvYGD/9xCy6PlnPjTqx+DHIxO+HqFG7HEeHE6G2mUc38dgHmfi5FbUpMY6rT+/DszLaxHAZnw3AqEzM9DD5ZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(5660300002)(966005)(4326008)(8676002)(66556008)(66476007)(66946007)(8936002)(4001150100001)(316002)(36756003)(6916009)(6486002)(6512007)(2616005)(6666004)(6506007)(38100700002)(82960400001)(31686004)(2906002)(508600001)(26005)(86362001)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtqaGtVRFFBZGlMeWtTODZKTWE0WUxUVzM0SkN2UmErek5ad211YWVtbGJt?=
 =?utf-8?B?bkxVYXdDZHhBWHZuSEFwY2dzZGNiL0NtOC9DRGxTTXZHOE4wWWk3dnVIQk1Q?=
 =?utf-8?B?UnBxNmNqY1pmeUQyQkNHVEFMQWpyQnc2TG0xTlZNSTNqZlBxcG5wbGJaUVpq?=
 =?utf-8?B?Ty9acURqeFBPVkdTM3VWblltZFdsY2pabS9XMXpsTTVhck16aHhtUlJoNkl1?=
 =?utf-8?B?em9jSFhIa01GM3oyWUM0VXBIdFVDb3hLOFF2RmdZd093ckZodkRBZzlESkxF?=
 =?utf-8?B?TVF0dWdZTTRoRTk0WVlJNWowK1hsbFZOWERNQlhKdzc2MWNYMFhacmw0K3pR?=
 =?utf-8?B?SThDMHE3MExVeG5lZnJHT01XWCtqQ3N3MzRUd2Q2RElzMTlZT1dCc0ZmeTZW?=
 =?utf-8?B?VWFpOVdra1VtMmo4T0ZUeDRBbzJCMENKUnRJVVNVeWdiKzBhN1NNYnc5TU5L?=
 =?utf-8?B?d0RHWHJ6eUtIblhObnp5WlVUNHNQK3luencxVFpWbFhrM0RyTHJIMmdKS3Jx?=
 =?utf-8?B?TVowbVZrN09kN2pmN1BGcCtVdk1PVHA5ZEtMODZNUFF6b20yU3RyTEJsYjIx?=
 =?utf-8?B?OG90RDQvYkZrRWZ3QS9rcFdONkJvZTN2VGhRQ3hGSVV4UlBHVXJ3R0N4SlRH?=
 =?utf-8?B?RXlTZ3pCMzVyM1Q2ZzRFcmFJYnlzWldKaW4rbFBab2dwcTFqRmNTSXBsd0w4?=
 =?utf-8?B?dkhKSnh0S3VHdUszdEpFa1IvZnJKSnVmNGJKakVrMUt3b2krbGkwR3lQOFR3?=
 =?utf-8?B?Wm1Lak9DU3AwTytDdTNCWWRwTXNlNU85dlZ2REdaQWkwZWFHY0lUWFZxeTFw?=
 =?utf-8?B?Z2JDR3NFOGg4ZjQ3QUZSM1oxd3BTUjMyTjNWbjZWV2txN2hVTmhscnI3RXFx?=
 =?utf-8?B?U0ZRTHRSREZobDB0YWdmY0gydSs1Q2YyWjYyVjNJdDJMeHF5aVhzdnJObnFQ?=
 =?utf-8?B?My9Fd0ZYcXN5SjZVQVQreWdGMTR4bExOdTZpQktsa2RZUWlmMDZjaE1YeDky?=
 =?utf-8?B?cGVpMHhVbmtUcHhGTnBYY04wTnNXSmM0VVd6QmIrUjhvOXZnTXY2M1dqR21V?=
 =?utf-8?B?YjZzZ1NlQ0RWYVI5NS9mS3o3UkRuWkNzWFpkaWtwelpDK3VnWTJjOG92eWxP?=
 =?utf-8?B?bnVUY1N3djRhenZEeDhPVFFScllBZ1dWZXgxSGtRSEg4SzdQeU85OTNackVp?=
 =?utf-8?B?dEhKUnR5NU9GRTZoQXpUMkxvYjNXU2gyZGtSV0lJaVBxUGladGVSRmRwU0Fk?=
 =?utf-8?B?bWZraHRGOEpEWjd1cVdSRVdDQmpXMEVkNFc1RkxnSkxVcVpYeng0a1FRZmY2?=
 =?utf-8?B?WFVFUmg0RTd4SkZhUkNhc29zck1TbGF5V0tPMCszNHdwdnlLYXNmRzlGNFVz?=
 =?utf-8?B?dFdNTlFkMTVjRkVKQmhqMXFXN1BGYkhvanp0R0dyR1JWMy9JK29vOE1CUEhN?=
 =?utf-8?B?WTlSdjUrMjFTaE1NbWZpSXQyU3FMYTBjQURIMXJyZTlHdFYyZ0ZDZXp5Qzkz?=
 =?utf-8?B?ZWJ3NlVka0ZBMTNJTEV3cUcydFBoYnlBVXlDNHpHVHF6Z09ZdzhnSWU2dGlz?=
 =?utf-8?B?U21BbmZ2Y01zR3hrZlBSL01wckJ6MDJFUjhqdXc5T0ZGZXpyenJIMS9sa0Vj?=
 =?utf-8?B?eVRRQXRDUnd2T1dKK09CWjFEVXovN25VSVF3QWplNlNTaG5ZRkVUMXhCaitK?=
 =?utf-8?B?eEwzeU9kbVJPUzI3bmZiQmV0NTYxNGlwSDhMVWxhZ1YyT1JFSTFzd05ZUGZW?=
 =?utf-8?B?a2lSaUpSbzFZbmdSbEdOR2dYVXN4M0ZqOGNIZEwyVXg0ZS9PUm1YYW9MWWVZ?=
 =?utf-8?B?ams4Rkw5cCsweE1JUE43K0JpU1dDQWdNOHZXTzczamkzL3FzTFdEMEZOTmUx?=
 =?utf-8?B?cCtqZTdVVW9sODB2UFpQZlJISFVrZWovc0d2U3YzaTBKL3RXbUxRcHNsOVJ2?=
 =?utf-8?B?UGpCNi85Z3l6VnlpZzlBTlB4MVdiZ25OZVdWN3k2VjVmV0xOUjczbGNEYjZC?=
 =?utf-8?B?Sk5WRU5JNzNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b94034-5c77-4f54-f82d-08da0a86ca31
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2022 15:32:06.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jqttaCPEuW3kVElpDkCkbR5pWb3GdGZkpHBvg5xXyZHg01bozv2PK04Dtnz6h0QsMzIzabiIHSWaiWCJjKLeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1655
X-OriginatorOrg: intel.com

Hi Oded,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on next-20220316]
[cannot apply to linux/master linus/master v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oded-Gabbay/habanalabs-set-non-0-value-in-dram-default-page-size/20220316-194323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git d6cd2f85931f87dbd07c664c9c6e806db1dd7c75
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/archive/20220317/202203171437.0m4BxdYd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install riscv cross compiling tool for clang build
         # apt-get install binutils-riscv64-linux-gnu
         # https://github.com/0day-ci/linux/commit/9535025e314bc12dbdeebee7c71634699759bcfa
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Oded-Gabbay/habanalabs-set-non-0-value-in-dram-default-page-size/20220316-194323
         git checkout 9535025e314bc12dbdeebee7c71634699759bcfa
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/misc/habanalabs/common/mmu/mmu.c:220:2: warning: Value stored to 'prop' is never read [clang-analyzer-deadcode.DeadStores]
            prop = &hdev->asic_prop;
            ^      ~~~~~~~~~~~~~~~~

vim +/prop +220 drivers/misc/habanalabs/common/mmu/mmu.c

9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  184
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  185  /*
5c05487f155093 drivers/misc/habanalabs/common/mmu.c     Ofir Bitton    2020-10-22  186   * hl_mmu_unmap_page - unmaps a virtual addr
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  187   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  188   * @ctx: pointer to the context structure
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  189   * @virt_addr: virt addr to map from
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  190   * @page_size: size of the page to unmap
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  191   * @flush_pte: whether to do a PCI flush
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  192   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  193   * This function does the following:
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  194   * - Check that the virt addr is mapped
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  195   * - Unmap the virt addr and frees pgts if possible
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  196   * - Returns 0 on success, -EINVAL if the given addr is not mapped
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  197   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  198   * Because this function changes the page tables in the device and because it
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  199   * changes the MMU hash, it must be protected by a lock.
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  200   * However, because it maps only a single page, the lock should be implemented
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  201   * in a higher level in order to protect the entire mapping of the memory area
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  202   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  203   * For optimization reasons PCI flush may be requested once after unmapping of
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  204   * large area.
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  205   */
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  206  int hl_mmu_unmap_page(struct hl_ctx *ctx, u64 virt_addr, u32 page_size, bool flush_pte)
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  207  {
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  208  	struct hl_device *hdev = ctx->hdev;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16 @209  	struct asic_fixed_properties *prop;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  210  	struct hl_mmu_properties *mmu_prop;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  211  	struct hl_mmu_funcs *mmu_funcs;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  212  	int i, pgt_residency, rc = 0;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  213  	u32 real_page_size, npages;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  214  	u64 real_virt_addr;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  215  	bool is_dram_addr;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  216
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  217  	if (!hdev->mmu_enable)
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  218  		return 0;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  219
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16 @220  	prop = &hdev->asic_prop;
9488307a555925 drivers/misc/habanalabs/common/mmu.c     Oded Gabbay    2021-01-11  221  	is_dram_addr = hl_is_dram_va(hdev, virt_addr);
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  222  	mmu_prop = hl_mmu_get_prop(hdev, page_size, is_dram_addr);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  223
ccf979ee330b19 drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-10-05  224  	pgt_residency = mmu_prop->host_resident ? MMU_HR_PGT : MMU_DR_PGT;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  225  	mmu_funcs = hl_mmu_get_funcs(hdev, pgt_residency, is_dram_addr);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  226
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  227  	rc = hdev->asic_funcs->mmu_get_real_page_size(hdev, mmu_prop, page_size, &real_page_size,
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  228  							is_dram_addr);
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  229  	if (rc)
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  230  		return rc;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  231
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  232  	npages = page_size / real_page_size;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  233  	real_virt_addr = virt_addr;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  234
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  235  	for (i = 0 ; i < npages ; i++) {
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  236  		rc = mmu_funcs->unmap(ctx, real_virt_addr, is_dram_addr);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  237  		if (rc)
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  238  			break;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  239
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  240  		real_virt_addr += real_page_size;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  241  	}
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  242
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  243  	if (flush_pte)
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022-03-16  244  		mmu_funcs->flush(ctx);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  245
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  246  	return rc;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  247  }
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020-08-12  248

--
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
