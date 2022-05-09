Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6377B
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 08:37:08 +0000 (UTC)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=71422e7e6f=fe@dev.tdt.de>)
	id 1nnyag-0005Ez-Tx; Mon, 09 May 2022 10:18:02 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1nnyae-000XIX-Nv; Mon, 09 May 2022 10:18:00 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 2ABEB24004B;
	Mon,  9 May 2022 10:18:00 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 7B958240040;
	Mon,  9 May 2022 10:17:59 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id E20EE27512;
	Mon,  9 May 2022 10:17:58 +0200 (CEST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 09 May 2022 10:17:58 +0200
From: Florian Eckert <fe@dev.tdt.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Alex Shi <alexs@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: drivers/hwmon/ltq-cputemp.c:23:2: error: call to undeclared
 function 'ltq_cgu_w32'; ISO C99 and later do not support implicit function
 declarations
In-Reply-To: <65c92404-1d6f-6969-89bf-20b8eefaeff6@infradead.org>
References: <202205080416.vzIXy16B-lkp@intel.com>
 <65c92404-1d6f-6969-89bf-20b8eefaeff6@infradead.org>
Message-ID: <81b9b2cd3f981b6206e9d8c52b3306b3@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate-ID: 151534::1652084281-000005E4-CE3BF94B/0/0
X-purgate-type: clean
X-purgate: clean


>> 
>> vim +/ltq_cgu_w32 +23 drivers/hwmon/ltq-cputemp.c
>> 
>> 7074d0a9275860 Florian Eckert 2017-09-01  20
>> 7074d0a9275860 Florian Eckert 2017-09-01  21  static void 
>> ltq_cputemp_enable(void)
>> 7074d0a9275860 Florian Eckert 2017-09-01  22  {
>> 7074d0a9275860 Florian Eckert 2017-09-01 @23  
>> 	ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) | CGU_TEMP_PD, CGU_GPHY1_CR);
>> 7074d0a9275860 Florian Eckert 2017-09-01  24  }
>> 7074d0a9275860 Florian Eckert 2017-09-01  25
>> 
>> :::::: The code at line 23 was first introduced by commit
>> :::::: 7074d0a92758603369655ef5d4f49e6caaae0b4e hwmon: (ltq-cputemp) 
>> add cpu temp sensor driver
>> 
>> :::::: TO: Florian Eckert <fe@dev.tdt.de>
>> :::::: CC: Guenter Roeck <linux@roeck-us.net>
> 
> This driver builds fine if I change it from SOC_FALCON to SOC_XWAY.
> Maybe its Kconfig entry should be stronger?
> 
> config SENSORS_LTQ_CPUTEMP
> 	bool "Lantiq cpu temperature sensor driver"
> -	depends on LANTIQ
> +	depends on SOC_XWAY

Fine with me. I think it's better to narrow it down.
Because this macro is only available for the SOC_TYPE_XWAY [1]

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h?h=v5.17.6#n10

Best regards
-- Florian
