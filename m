Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1B362
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657181072; x=1688717072;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=p89GxWtJ+9SVYpH9DoIi8Xmc2Ha0AzNyqUefbpsVTvc=;
  b=OWHFtEVAF5fMCHtdOSIsJCMAU5yII7q0jjseyYFTXUCX9fm+w7XyTLVc
   XrtG+pcA01SpD0fI0sJovkGqf/n1EUjDY9dClq78BrnVJYkqXY5VDrYyc
   kDIbvB8iGpvVtVI5KnUao5Bh0Y7Lklp6xUMXDS1ZxJ+7Y693/bN0Qqu0o
   P1M6njReCbm54yKXx74ch8gStXStlBm7wlq5NIUUWWHxDLJMKhbDH3wNL
   ncyX+6tQfY92GThLtqqUZ4ZNIpSn91t5nkP+1o4FfoJWclDbcV0hIG7CO
   WR3lBnaDI5zhj+NK/DLQOcAzJwpfwrs1peIcgo9gS0ZqcZ90wVHrGg7Mh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="285086472"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="285086472"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 01:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="696420653"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2022 01:04:31 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:04:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 01:04:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 01:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3rBtZkIKscJKH3hWNcbi7vJ8AGr5emt9kP0VTot6bPRmaaENYmAW5j/kE/MdHHEQySTuQo7dETimtVLfAUBmMc6k/QSmSaYNv5ZIscRAmBL7hEfYNtONrtWeVYoMyFZkrtjKOg+94MBTr2UdFsANc49RcK20I8T1oVQXESBGi9JDrYQGB+D61pt7B2DC//AxvwTD74tiuz7CLYvLGFhjLCLZQcjes9AeBoYqVgWWcwrUlm3u8dTAJzLYA/yXRFk7ZtR6uiLz1xAwlL/4K0nZVMoMWRyl5Jye3zsFjgrazFzCJbYiqoytW4XNpp0tUNUwP9JFn5ohPc5EYaVoLGNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvoCO+k7v48VcHary+QklsTp0+gc/+uqDbHU9WC6lTQ=;
 b=g8/80YN1eQbOzsKMRcdEZk59aNBzmFt7qq187aiRG4wwXrRa6dGnxp57YigkGMm8cXwQbtH+GL/ljJAfuPnlN1mDFT8CqRQqxBuZZsgEuoWtmtS9G7RI07EbchYWNYgXP1VnPlYCfzJE1AH+Rwt/Wd/UD2TcFMqlPbkbgOhx/tKkW2TqhvVL4tsLUFODmNndHghTxP+fn4sGpLUWgHlQmWhWQihvPlIU06MoiZS0tkPN5rEZLYwh05USwVtS8403TScFZT/VdWqcOHI+2bS2kqFO97iKwKQtIKFVpTVBdiXnHNLF+IEtZB3pAvBm0S7Ujvi2gxcg+Pl+o5jwfqWwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by DM6PR11MB3130.namprd11.prod.outlook.com (2603:10b6:5:67::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 08:04:28 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::71d0:716c:7d6d:94c4]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::71d0:716c:7d6d:94c4%3]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 08:04:28 +0000
Message-ID: <4395b8ae-4cdb-82fd-5c83-1c0af47702db@intel.com>
Date: Thu, 7 Jul 2022 16:04:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V8 3/3] rtc: zynqmp: Add calibration set and get support
References: <202207012151.nYCjgJqj-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202207012151.nYCjgJqj-lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@xilinx.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202207012151.nYCjgJqj-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:3:17::20) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2db7ce-9034-43e7-eb52-08da5fef50d7
X-MS-TrafficTypeDiagnostic: DM6PR11MB3130:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ns+5Ve0mBuOpuEe9iw6WYoFR6mBzOD9rVwe0mZKADqNBiAy34o/xNzfwUgiUZmPP/l/LpXcXMmc8iLlV64syHqYTFo2DmUQa74ng69laQx+qpHN3J9W1Oo3IcwXq+mCR7C6QkhKdHOdUkWdo2ogTm9KyDr1uKEipzVrLeMowgBwhhA04H0aRafVB/rPIes5ST4HINGPhSeDYpVluS2OO+igbUJN/W8X2hLFzeFxHLatgIqub6H5K4YrPBK+wB7Hy/PTXacUT5gQpZ0pgxMgwQYD9KsNlG/1Af+9/YNPHC9JAxcw03hrREQJHllanfpO0skm+slVAKRhcUulsqJY7SJrHldhtFtJkXELWvyUMRQ8pWgg5bFnVyo1aGN/EmIGoZ4C1PglFEGbiNDlkJDDu61e5UZTkz7Vw+DXlEddaDf1+kwgzvuurUcRc2xuN1gZMVV/ASAf5CJrcywVvvfk2PImMLNeVHcL7f79orEZ/0XWISaBvI0Ww7RNl9ZdhoRxlhy2Y9az2zO2GKlrDEgl7MlSoGgnsPgmCAqBrEKqJytYRl5UF9LGRNlZkgm59tVLvl2/ebzTvmogM8L3EINK5j69aaDqM7YvgqmMqpz9TaJtlUnTKvNmroBJ9NSLSvEtXUwb7XTpG63BYjP8D4xj3F5JLHatPJkkpIhbsR1pxY6+7JI/Nng84aWpwsAvOd368dCvjI6LXOjTCsyZ6m0T/J1OuvKJ41jD9qRYtLvAdQte9KGnXbhReP1+5tKluiI6BEfH8tFSRQIUcnPo3dsWgrsOYvANZBrek7JcpMvhbATURKseFy7+AyWowUwi5w7yxF85lz1EvXk/C2vtYMReWyc/d1rDCWf/COP0WCtSmf20D4jgtX+W5E8JXusMdXY78KBSHtuehvTvh+EaTwfGcflcR3VDRSIkiqaUI+Zs455o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(136003)(376002)(366004)(396003)(4326008)(186003)(41300700001)(6666004)(6506007)(26005)(316002)(31686004)(36756003)(6916009)(83380400001)(31696002)(38100700002)(6512007)(2906002)(8676002)(966005)(82960400001)(8936002)(5660300002)(86362001)(2616005)(6486002)(66476007)(478600001)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0M2VG1UQU9sSGNLL3NXRlNJMEVSN3lKK2l0VzJlOGptZjIxR3pKbXM5d3gv?=
 =?utf-8?B?M3Rva0IwditkQ1hKbXlIejhERlNuYVVyYTFGWENpZjlpYjlHYTFuM0x2MkhT?=
 =?utf-8?B?S3B3aTdLRjFZbjViNXNGcEowcHkyTUwyaEI0Nnh3eS9KU1F6cHNPR1BUb2NM?=
 =?utf-8?B?TDFNRXBRelJqRFJvbTAyWVhxSUpsbktrTEdCbWF1b2hlWTFKQzlHZzl2WWhT?=
 =?utf-8?B?T2Nha1JuYzcyU0JPbEtabE02UnRablVuZWFmTGthbHJMSzBrU1ZzMjlzL3VV?=
 =?utf-8?B?UFpVVEZTSUMxV2NiOHNYVHpmNGxkbWhqRmlSNVFYYUlnZE4wQ0VsVjNlV01R?=
 =?utf-8?B?dUFBVHplcGN1S0pmbjVRdUREQXdEZ2tXT05Yc21kdzdYNy9IVjlJdk1rVTZk?=
 =?utf-8?B?UUF6TTQzODNyd2RuN2UvZ0NXZUNKcCtFYUxwTlRyWWJBbU9weGVqd2tSamx1?=
 =?utf-8?B?TDUyd05BNU14aUhyWVlIMDlscTU4VXMxL2FjcVgrR2NUc0NKWW5oR1ZIeFdZ?=
 =?utf-8?B?Q3h2VWhwemQyeGI5K0Vpb2FuNlZ4ZlNLQ0RVeTBzNzM0WGxKSlMwekxoUTZJ?=
 =?utf-8?B?YjdvOEtqdTZZMGsxK0dLTFRYQjdUTlI2OWFZWlczTW80U3BaUEM0M1c4L0Vr?=
 =?utf-8?B?dzJnNnY5L3Zqb3JGYkkraGJyM1EzT2RnZzBuOVFhMXovK09ocERreVhKTXd1?=
 =?utf-8?B?MHVrQjRRdS9JY25vdm1ERUpsRGU5eWhsWVMvZElLdHQ3MXpvWng1SHVQbHJh?=
 =?utf-8?B?dUdWbnJ2MzcxU0Y4VXgvaVROeThoTnFtcmJ4QmY4VkFZaHdESE9sSjBGaUtF?=
 =?utf-8?B?Nitmc2FhcnVDWUtJdzV6cUFrdlN3NnR1N1Q2b2QrRmtUeWJIck0xUUY4ZXFy?=
 =?utf-8?B?YnU2a2h3S01JaDcrQmJ0dHFzVXBPYjJ4VWtYS0tFWHBtWEVMTzlLMW9ReTJU?=
 =?utf-8?B?Ujh4eEs1eHJNaktHVng3V3VuSTRVMHB3QU5Rd2k3KzFRaFFEalA2ZEtHWjJ4?=
 =?utf-8?B?NWwzd2I4S0t0OWJOc1NnRTlMNTMvZFdaQXAvVm40YVpxM0dwOG5aTEZZaytO?=
 =?utf-8?B?NEplWXRsdTAwaTkwNWt4UWFueGgrbWlaRDVNbUEwekRlR0FBanIyTzkxNWQ1?=
 =?utf-8?B?M1NuTWFxWVNQTzNIcVlLSWZRQndMdzM2QlFQYjJlQUdBRFhqeml6WXR6L2VV?=
 =?utf-8?B?R0lYTnd2bTlGMTRSY05Ec3UrUll3R2lRK0JBM0Rta0hCRE1MWGRiM2ZMaEJX?=
 =?utf-8?B?a1FzYkFnUDNPWXYxRmVxZkU0ZFVLOXN2L0RqUUdZNDhoaFdrbUJ3RFAyRWtD?=
 =?utf-8?B?U2k5ZEJlWldVZE15TDJpcnVSUzQrdm95QUlIVlBubXdCdGdQNVNtSC9PcG9C?=
 =?utf-8?B?NHg5NzRQcXM0c29Tc20xRlpqNWhKTHBEWmN1MXJyRTUwOW0weWtUTFVaTHpP?=
 =?utf-8?B?eGdhdHZiL3hPM0lYTHI3VGVkQmJHWndCc29yNjNYOFcvZG1VQ2JnS1RTOTNF?=
 =?utf-8?B?NFBaNHRSc3AzTmtUUU40UjJCTUVkK0dUbVVJZkZ4UlJVQmlIdkczS05wa0JM?=
 =?utf-8?B?b3BZMlQwR1B6cXVqOTdrcXJvTHhRbWNFdU1hWlNmMzNRR1RaU0cwNjNvcDRs?=
 =?utf-8?B?ZUNteVpQUHVhRWFrMFNHTzh6ejVUNXk1bC9ibDNLVHZEMWgvaWFXcjJFMFB2?=
 =?utf-8?B?blByd3JlbzlXcWxSdnZ4bTBXRitGRC9NdmY1OXJwbTJoQWtqK0syOW5pUUlF?=
 =?utf-8?B?ck04dnJyM2YwWDFneWFpSE1ha3lOYXNWWDJ3M3Z0SUxscmt6UEVzZFRYamw0?=
 =?utf-8?B?REE2U1B2MDNBbERndmtFT1lhWEtkViszY2QvaTN3bEVTQjVMaTltWlBmV3E3?=
 =?utf-8?B?UUZqbkNSbU91ZkNnaC8wLys1YzQ5Q1NzbHI3RnAwd0l0Q3ZEVU5DRzFsaUpE?=
 =?utf-8?B?S3NrdGdKSUdlRlhNeFBaSjJOVTBQOFJiaEd2R2lINVloWTllU1ZiaEFuQzEy?=
 =?utf-8?B?MG5wQWQxZGRoMVEzeHR3VVgzMk9yUTRJRUp4M25scXNKWkVvUE1ubkNBUjVN?=
 =?utf-8?B?cDVUNFpFSXR4b05VMjNXM0hnRWJXMFRTY0tpTWViUGxRVis0dkF6bWhRbDdJ?=
 =?utf-8?Q?kdjijZPsIoT3PRmrY0EtZbdiz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2db7ce-9034-43e7-eb52-08da5fef50d7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 08:04:28.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgpby6potB0m1VCLNT8cL0F+TFSWcDqW2s/ndH0txbDymVzAwvL21G52WAOMQQswKC276z1A/0S78269M4NbGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3130
X-OriginatorOrg: intel.com

Hi Srinivas,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v5.19-rc4 next-20220701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Neeli/dt-bindings-rtc-zynqmp-Add-clock-information/20220614-013701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: arm-randconfig-c002-20220629 (https://download.01.org/0day-ci/archive/20220701/202207012151.nYCjgJqj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install arm cross compiling tool for clang build
         # apt-get install binutils-arm-linux-gnueabi
         # https://github.com/intel-lab-lkp/linux/commit/2781fd75583878d86f256113b19bb005dc83fb70
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review Srinivas-Neeli/dt-bindings-rtc-zynqmp-Add-clock-information/20220614-013701
         git checkout 2781fd75583878d86f256113b19bb005dc83fb70
         # save the config file
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/rtc/rtc-zynqmp.c:238:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
            if (fract_tick)
                ^~~~~~~~~~
    drivers/rtc/rtc-zynqmp.c:206:2: note: 'fract_tick' declared without an initial value
            unsigned char fract_tick;
            ^~~~~~~~~~~~~~~~~~~~~~~~
    drivers/rtc/rtc-zynqmp.c:211:6: note: Assuming the condition is false
            if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
                ^~~~~~~~~~~~~~~~~~~~~~~
    drivers/rtc/rtc-zynqmp.c:211:6: note: Left side of '||' is false
    drivers/rtc/rtc-zynqmp.c:211:33: note: Assuming 'offset' is <= RTC_MAX_OFFSET
            if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
                                           ^~~~~~~~~~~~~~~~~~~~~~~
    drivers/rtc/rtc-zynqmp.c:211:2: note: Taking false branch
            if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
            ^
    drivers/rtc/rtc-zynqmp.c:218:6: note: Assuming 'fract_offset' is 0
            if (fract_offset) {
                ^~~~~~~~~~~~
    drivers/rtc/rtc-zynqmp.c:218:2: note: Taking false branch
            if (fract_offset) {
            ^
    drivers/rtc/rtc-zynqmp.c:238:6: note: Branch condition evaluates to a garbage value
            if (fract_tick)
                ^~~~~~~~~~

vim +238 drivers/rtc/rtc-zynqmp.c

2781fd75583878 Srinivas Neeli  2022-06-13  200
2781fd75583878 Srinivas Neeli  2022-06-13  201  static int xlnx_rtc_set_offset(struct device *dev, long offset)
2781fd75583878 Srinivas Neeli  2022-06-13  202  {
2781fd75583878 Srinivas Neeli  2022-06-13  203  	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
2781fd75583878 Srinivas Neeli  2022-06-13  204  	unsigned long long rtc_ppb = RTC_PPB;
2781fd75583878 Srinivas Neeli  2022-06-13  205  	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
2781fd75583878 Srinivas Neeli  2022-06-13 @206  	unsigned char fract_tick;
2781fd75583878 Srinivas Neeli  2022-06-13  207  	unsigned int calibval;
2781fd75583878 Srinivas Neeli  2022-06-13  208  	short int  max_tick;
2781fd75583878 Srinivas Neeli  2022-06-13  209  	int fract_offset;
2781fd75583878 Srinivas Neeli  2022-06-13  210
2781fd75583878 Srinivas Neeli  2022-06-13  211  	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
2781fd75583878 Srinivas Neeli  2022-06-13  212  		return -ERANGE;
2781fd75583878 Srinivas Neeli  2022-06-13  213
2781fd75583878 Srinivas Neeli  2022-06-13  214  	/* Number ticks for given offset */
2781fd75583878 Srinivas Neeli  2022-06-13  215  	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
2781fd75583878 Srinivas Neeli  2022-06-13  216
2781fd75583878 Srinivas Neeli  2022-06-13  217  	/* Number fractional ticks for given offset */
2781fd75583878 Srinivas Neeli  2022-06-13  218  	if (fract_offset) {
2781fd75583878 Srinivas Neeli  2022-06-13  219  		if (fract_offset < 0) {
2781fd75583878 Srinivas Neeli  2022-06-13  220  			fract_offset = fract_offset + tick_mult;
2781fd75583878 Srinivas Neeli  2022-06-13  221  			max_tick--;
2781fd75583878 Srinivas Neeli  2022-06-13  222  		}
2781fd75583878 Srinivas Neeli  2022-06-13  223  		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
2781fd75583878 Srinivas Neeli  2022-06-13  224  			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
2781fd75583878 Srinivas Neeli  2022-06-13  225  				if (fract_offset <=
2781fd75583878 Srinivas Neeli  2022-06-13  226  				    (fract_tick *
2781fd75583878 Srinivas Neeli  2022-06-13  227  				     (tick_mult / RTC_FR_MAX_TICKS)))
2781fd75583878 Srinivas Neeli  2022-06-13  228  					break;
2781fd75583878 Srinivas Neeli  2022-06-13  229  			}
2781fd75583878 Srinivas Neeli  2022-06-13  230  		}
2781fd75583878 Srinivas Neeli  2022-06-13  231  	}
2781fd75583878 Srinivas Neeli  2022-06-13  232
2781fd75583878 Srinivas Neeli  2022-06-13  233  	/* Zynqmp RTC uses second and fractional tick
2781fd75583878 Srinivas Neeli  2022-06-13  234  	 * counters for compensation
11143c19eb57a8 Suneel Garapati 2015-08-19  235  	 */
2781fd75583878 Srinivas Neeli  2022-06-13  236  	calibval = max_tick + RTC_CALIB_DEF;
2781fd75583878 Srinivas Neeli  2022-06-13  237
2781fd75583878 Srinivas Neeli  2022-06-13 @238  	if (fract_tick)
2781fd75583878 Srinivas Neeli  2022-06-13  239  		calibval |= RTC_FR_EN;
2781fd75583878 Srinivas Neeli  2022-06-13  240
2781fd75583878 Srinivas Neeli  2022-06-13  241  	calibval |= (fract_tick << RTC_FR_DATSHIFT);
2781fd75583878 Srinivas Neeli  2022-06-13  242
2781fd75583878 Srinivas Neeli  2022-06-13  243  	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
2781fd75583878 Srinivas Neeli  2022-06-13  244
2781fd75583878 Srinivas Neeli  2022-06-13  245  	return 0;
11143c19eb57a8 Suneel Garapati 2015-08-19  246  }
11143c19eb57a8 Suneel Garapati 2015-08-19  247

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
