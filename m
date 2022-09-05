Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575867E
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 02:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662346483; x=1693882483;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=i85N6sloW8LS+xHic5Eug2egGQTHgjjirik6HG65/zI=;
  b=HFJfIClRMrEyfdqpRrKJxYCKpBJFY9z0B6l5+IBBL5slBeoJl1zPDeRB
   Dp9yVj4GtMRx2Tj40uA7BTiRFMLgEdr520ukDmyFhP/ls/W6igvi3YA70
   aZrkIYPe5HrI88InHQZZzYWJpmgUYEDx36fptvE3MvTNCCEO3VYcXj1tP
   PcjVy6be53kK4qcDtg316JuDCd3OO1KknEiEje+jPBov47OpLob0FkOw+
   lbIByPm//FQHI3m7K4W/U1a10bZMEXGYVPT5i6kcNjcwInt2lFtMTFb28
   ifC8gav0jRpnCnjPgtwyOhWizF1cLTV9VszBJrurBYHTpc/KHvHkmdiP4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="295033204"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="295033204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 19:54:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="643633527"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.208.118]) ([10.254.208.118])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 19:54:40 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 2262/4736]
 drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for
 drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead
To: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Alvin_=c5=a0ipraga?=
 <alsi@bang-olufsen.dk>
References: <202209030755.eB4SkwGE-lkp@intel.com>
 <92d78ac2-c32a-cd19-891c-7bac77725b84@denx.de>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <494af0d7-b07a-3d50-7539-09c300b79dd8@intel.com>
Date: Mon, 5 Sep 2022 10:54:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <92d78ac2-c32a-cd19-891c-7bac77725b84@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/3/2022 10:31 PM, Marek Vasut wrote:
> On 9/3/22 01:21, kernel test robot wrote:
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>> master
>> head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
>> commit: 822a6200734c94ccbfc9ae7acc5da5505b991515 [2262/4736] extcon: 
>> usbc-tusb320: Add USB TYPE-C support
>> config: x86_64-randconfig-a003 
>> (https://download.01.org/0day-ci/archive/20220903/202209030755.eB4SkwGE-lkp@intel.com/config) 
>>
>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project 
>> f28c006a5895fc0e329fe15fead81e37457cb1d1)
>> reproduce (this is a W=1 build):
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=822a6200734c94ccbfc9ae7acc5da5505b991515 
>>
>>          git remote add linux-next 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 822a6200734c94ccbfc9ae7acc5da5505b991515
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 
>> W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/extcon/
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting 
>>>> prototype for drivers/extcon/extcon-tusb320.c(). Prototype was for 
>>>> TUSB320_REG8() instead
>>
>>
>> vim +19 drivers/extcon/extcon-usbc-tusb320.c
>>
>>      18
>>    > 19    #define TUSB320_REG8                0x8
>>      20    #define TUSB320_REG8_CURRENT_MODE_ADVERTISE    GENMASK(7, 6)
>>      21    #define TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB    0x0
>>      22    #define TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A    0x1
>>      23    #define TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A    0x2
>>      24    #define TUSB320_REG8_CURRENT_MODE_DETECT    GENMASK(5, 4)
>>      25    #define TUSB320_REG8_CURRENT_MODE_DETECT_DEF    0x0
>>      26    #define TUSB320_REG8_CURRENT_MODE_DETECT_MED    0x1
>>      27    #define TUSB320_REG8_CURRENT_MODE_DETECT_ACC    0x2
>>      28    #define TUSB320_REG8_CURRENT_MODE_DETECT_HI    0x3
>>      29    #define TUSB320_REG8_ACCESSORY_CONNECTED    GENMASK(3, 2)
>>      30    #define TUSB320_REG8_ACCESSORY_CONNECTED_NONE    0x0
>>      31    #define TUSB320_REG8_ACCESSORY_CONNECTED_AUDIO    0x4
>>      32    #define TUSB320_REG8_ACCESSORY_CONNECTED_ACC    0x5
>>      33    #define TUSB320_REG8_ACCESSORY_CONNECTED_DEBUG    0x6
>>      34    #define TUSB320_REG8_ACTIVE_CABLE_DETECTION    BIT(0)
>>      35
> 
> I still believe this is a false positive, is it not ?

Hi Marek,

Thanks for your reply, the issue is not introduced by this commit, it
should be related to '/**' in the head of this file:

diff --git a/drivers/extcon/extcon-usbc-tusb320.c 
b/drivers/extcon/extcon-usbc-tusb320.c
index edb8c3f997c9..41041ff0fadb 100644
--- a/drivers/extcon/extcon-usbc-tusb320.c
+++ b/drivers/extcon/extcon-usbc-tusb320.c
@@ -1,5 +1,5 @@
  // SPDX-License-Identifier: GPL-2.0
-/**
+/*
   * drivers/extcon/extcon-tusb320.c - TUSB320 extcon driver
   *
   * Copyright (C) 2020 National Instruments Corporation

Best Regards,
Rong Chen
