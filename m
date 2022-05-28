Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B392C9D
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 21:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653772989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kE+5xG8jcmXULJ9dKwJxu9sTJadmTdzBiQn8/DuDpEQ=;
	b=GX39E/GJ3b/aH+37v57p/JO3W1mUdF8iNqXJwohnoU2hVmbTQY979G7llZRIO7k4EhOKxd
	Hr8qFeBJMuY8a28DoHiHeufKvwdZ/qiRCepROTGBY18/6lcGNDMfRIbAkemZRiyne0G5oN
	UagL0N2b7Sf+S5zuSTI0Z1is/1OabOA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-TnBiVxHVNiiyR60ULA8oJA-1; Sat, 28 May 2022 17:23:08 -0400
X-MC-Unique: TnBiVxHVNiiyR60ULA8oJA-1
Received: by mail-wm1-f70.google.com with SMTP id k16-20020a7bc310000000b0038e6cf00439so4666535wmj.0
        for <llvm@lists.linux.dev>; Sat, 28 May 2022 14:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kE+5xG8jcmXULJ9dKwJxu9sTJadmTdzBiQn8/DuDpEQ=;
        b=jcOKob7EyWUgecsBlPv2x/HYiHakuidVbwYbBgwlzt8D80AGqNOU52hgjkeash9lHV
         8ED6Ql8KtZUIDnjF6KLGYokW9w2USWkte4Mhvg1o90DFdxg7InyDr4N5cEmhvpUWi25P
         HtS4xw4Cg0LAzK2FRNR/jaImhhsCLC2reKQaWEbCIHa9qOUWStbxqiUWrZIBhS69c8lC
         EaBfoP1d6HQcxzJKmvTDJbU47EUHNrKiab/U/h4w/EIJ3V7vylskVsvUU7s67W1Zy4Ci
         1KaJHlwFViPGyLJ8605hNfW2teFz229xmnGGccvwTxJIdik7qodfYahJhiM1TBK/OP8E
         QC+A==
X-Gm-Message-State: AOAM532RySyGFCTKy4xqbyvjNCrDwapsg4GmeZd/IXXS9ojbz9fZKVvd
	DWoA2WFii8OZEYTDmYVK2FbYYeupXy2shuU6sNWoZQDtHlu0nnbgizuMNTCfqw3uM1HV+uFMFi5
	ViKJkaysiCLu6hA==
X-Received: by 2002:a05:600c:3ac3:b0:399:323:3a8d with SMTP id d3-20020a05600c3ac300b0039903233a8dmr4225464wms.101.1653772986550;
        Sat, 28 May 2022 14:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVsSyOb0XnZ6URggw11kE8MM0LpxnqIgbC4pGmvn1ihhE65XG3cF1k/hqeHqV6T9b9R7rRuA==
X-Received: by 2002:a05:600c:3ac3:b0:399:323:3a8d with SMTP id d3-20020a05600c3ac300b0039903233a8dmr4225455wms.101.1653772986199;
        Sat, 28 May 2022 14:23:06 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b0020fded972c0sm6055347wrr.45.2022.05.28.14.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 14:23:05 -0700 (PDT)
Message-ID: <607265eb-bfbf-4134-f2fe-d66cacd7bfbb@redhat.com>
Date: Sat, 28 May 2022 23:23:04 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: warning: unused
 variable 'ssd130x_spi_table'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
References: <202205290422.eoxGqDMR-lkp@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <202205290422.eoxGqDMR-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 5/28/22 22:58, kernel test robot wrote:
> Hi Javier,
> 
> FYI, the error/warning still remains.
>

Yes, but in my opinion is a false positive.
 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
> commit: 74373977d2ca26e5735377f8874be70bc2f030f5 drm/solomon: Add SSD130x OLED displays SPI support
> date:   5 weeks ago
> config: hexagon-randconfig-r033-20220529 (https://download.01.org/0day-ci/archive/20220529/202205290422.eoxGqDMR-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=74373977d2ca26e5735377f8874be70bc2f030f5
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 74373977d2ca26e5735377f8874be70bc2f030f5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/solomon/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: warning: unused variable 'ssd130x_spi_table' [-Wunused-const-variable]
>    static const struct spi_device_id ssd130x_spi_table[] = {
>                                      ^
>    1 warning generated.
> 
> 
> vim +/ssd130x_spi_table +154 drivers/gpu/drm/solomon/ssd130x-spi.c
> 
>    145	
>    146	/*
>    147	 * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
>    148	 * if the device was registered via OF. This means that the module will not be
>    149	 * auto loaded, unless it contains an alias that matches the MODALIAS reported.
>    150	 *
>    151	 * To workaround this issue, add a SPI device ID table. Even when this should
>    152	 * not be needed for this driver to match the registered SPI devices.
>    153	 */
>  > 154	static const struct spi_device_id ssd130x_spi_table[] = {

This comment is quite clear about it, the table only exists due a limitation in how
the SPI subsystem reports the module aliases. It always report a "spi:<device> even
if it was registered by OF, and that's the only reason why we need it.

Setting the struct spi_driver .id field just to make this warning go away would be
the wrong thing to do IMO, since always the struct of_device_id should be used.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

