Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640767B
	for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 10:44:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 186-20020a1c02c3000000b003c6c154d528so4691553wmc.4
        for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUmV9D7S6DNL4i2POW+8bktl/5t6qvSwc6uyB9wu3xk=;
        b=LHbCnO/dYR37I38sPqEtmzSX6qHP9n1UF26l/ZHnkaqc20g09vZGPi9BLIJalWd8vV
         lVbxUSzjva5Pj3QNZMiwyhoCHS1wCfbUMvIWKnHL9h9CBqYNaQ3ZJoQzC805RkC8X78L
         1N9akEuy5N3hIhctVOB1LU1PdiyZn5QBwyu1jHcWJ/KnYnal5YMxXc+WMLKYD2kZhemh
         y/gH0MZgblO7k2rdSgaK00U2+MRxVA9Ckix+pITnEWt+k6HR9HlRx0xCXrMy7oRCiEjo
         Z4Q7g7kivqEwfkihWgdDQvXbVhLw4ABAPS0t89J1n9ima2vGWWdopguVKXZXle5YaNQ0
         2rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUmV9D7S6DNL4i2POW+8bktl/5t6qvSwc6uyB9wu3xk=;
        b=HehpPryNMuFX+1JwH5mnONR5GFpywCbk+V2B8KKL05wpemFWPeyV3Wp5dDPmTsAG7C
         s6r8mBsuLr5zY3sE/UOiipNZCgp5h67XgTs+OQOFULCLQBo/GrsgTWPUUdHuvbmkx1t5
         sYs5othVyampCaAOtYxBF5WkSgAqg8C+xh6VJQ20ZbCeck4ZbdHkmdEYENxdHa3EZTNZ
         A4xJSqOhANrCLqjTKobDntBdA7nYp8KmjEjSAkSd63K2QBJc3ySaWKr7lbwpax/2el1n
         NBxZvmuKjGizmBtxP8NLPoXMfxMTs+Xl27ob+k9d1b0BsXMotuojj3npur5F/qUH37tI
         rrsA==
X-Gm-Message-State: ACrzQf38OLJ/iYDdWGyvcJnSxmSjrqvalDQKHBFePll34pMDrwYtt202
	rAB/ECsqgO5pU/ng3hjnH5I=
X-Google-Smtp-Source: AMsMyM4Nh4nrvfx0MrLGfVB3nXCghYIs1lkcp5SMj2qDd8rRHq3dNtQxd59AKEpeVdJRJtSx3t9LOQ==
X-Received: by 2002:a05:600c:1553:b0:3c6:e12d:6f32 with SMTP id f19-20020a05600c155300b003c6e12d6f32mr27506991wmg.109.1666349080597;
        Fri, 21 Oct 2022 03:44:40 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.23])
        by smtp.gmail.com with ESMTPSA id bj19-20020a0560001e1300b002238ea5750csm1599478wrb.72.2022.10.21.03.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 03:44:40 -0700 (PDT)
Message-ID: <3d047bb4-276c-026a-e292-f0a1f011b9f4@gmail.com>
Date: Fri, 21 Oct 2022 13:44:38 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [linux-next:master 637/2652]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:432:7: warning:
 variable 'hw_ctrl_s1' is used uninitialized whenever 'if' condition is false
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-wireless@vger.kernel.org
References: <202210211531.zEaM6hBM-lkp@intel.com> <87edv1lhad.fsf@kernel.org>
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <87edv1lhad.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2022 11:20, Kalle Valo wrote:
> + linux-wireless
> 
> kernel test robot <lkp@intel.com> writes:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   4d48f589d294ddc5e01d3b0dc7cecc55324c05ca
>> commit: c888183b21f36a247bb166ca9365705611bea847 [637/2652] wifi: rtl8xxxu: Support new chip RTL8188FU
>> config: i386-allyesconfig
>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c888183b21f36a247bb166ca9365705611bea847
>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>         git fetch --no-tags linux-next master
>>         git checkout c888183b21f36a247bb166ca9365705611bea847
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/ drivers/net/wireless/ath/ath11k/ drivers/net/wireless/realtek/rtl8xxxu/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:432:7: warning: variable 'hw_ctrl_s1' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>>                    if (hw_ctrl) {
>>                        ^~~~~~~
>>    drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:440:7: note: uninitialized use occurs here
>>                    if (hw_ctrl_s1 || sw_ctrl_s1) {
>>                        ^~~~~~~~~~
>>    drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:432:3: note: remove the 'if' if its condition is always true
>>                    if (hw_ctrl) {
>>                    ^~~~~~~~~~~~~
>>    drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188f.c:415:45: note: initialize the variable 'hw_ctrl_s1' to silence this warning
>>            bool do_notch, hw_ctrl, sw_ctrl, hw_ctrl_s1, sw_ctrl_s1;
>>                                                       ^
>>                                                        = 0
>>    1 warning generated.
> 
> Bitterblue, could you submit a patch to fix this, please?
> 
There is one from Colin Ian King:
https://lore.kernel.org/linux-wireless/20221020135709.1549086-1-colin.i.king@gmail.com/
