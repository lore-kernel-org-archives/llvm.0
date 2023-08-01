Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986CC4DC6B;
	Tue,  1 Aug 2023 20:27:11 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-63cef62a944so39750166d6.1;
        Tue, 01 Aug 2023 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690921630; x=1691526430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UH+96n1dxGiQRmm/Y8iuGfDIC+4CahwM19klE8HcHso=;
        b=ANbBy17uXBlXL9O0hN4pSlYwLkkvDhpQyFaqbAo4yGGVxOcuUj4M0X4tyn7A9sVuvb
         ozX12dfoizOD9u/CFDel09kYw5br7c2MiBtP4Qua/XA1W9khF+HrqL5YTw3m7BThKAIh
         FZ9ijPeJWjricMYrmvamoa9Gmg0GTNPlE/3EY1AkZhqYX+ISFSq+gA1l9N33Joxr6+uD
         9/nxxbUKPhi14hQeNV0AnYDruWwmO+4UCLcjhmBTixYLRqBbPYgzt5Bi5+s2x5b+Nccm
         oWx/otFTodC/dMvvLRd86X93PB8r3kF72dtNEexPTMkeyTQUmgQt8Q/DnH78h/lqO7ab
         S9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690921630; x=1691526430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UH+96n1dxGiQRmm/Y8iuGfDIC+4CahwM19klE8HcHso=;
        b=erGb2buyxPr1CRqWcoUnQF0s31/XavsYIZ82y20wgeKlRmFVBRJ39xsN9DQv33HcKg
         PynUFLS4LO4Mp8ZJmj05wS3mTIFORaSHloGPc5suEsX/MoyHTJXHVOvskUwvAqdGr4Ey
         M0hhTiE2TFvXfjST6KaqSgn+bmM0cvAmvwTF4L+fuG7ih+2bIGw0QmyMIVcW6vQxvVqC
         6XMABmMJAx85zKi6H4IQ5iFIbi3XHa6NzKK4m5wBN67gA1HMWz5fEfnuEu4x+godPlaw
         zH3NxG/fledH9I7Ur7p5MRSPHCNJObCRX7ZTEj1glolpE6+yQZc35eMMp/akuhC3iJ7g
         Fvxg==
X-Gm-Message-State: ABy/qLZZ5CwNCIcKV2ogim4hAMcQQHl+/zGaPlOv8wPsHQNwrCp5ZkfX
	koSLicJZWowzJ7YBmdICqxQ=
X-Google-Smtp-Source: APBJJlE6VBKShw0Rlyj1OLHXOFeaJpygktQJo+MxOm+odspLGrCYUNuKiGwVY8FgDFNYgU1uuNTFNA==
X-Received: by 2002:a0c:e2d0:0:b0:5ef:5e1b:a365 with SMTP id t16-20020a0ce2d0000000b005ef5e1ba365mr16104431qvl.10.1690921630267;
        Tue, 01 Aug 2023 13:27:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d28-20020a0caa1c000000b006363f2c37f0sm4924337qvb.91.2023.08.01.13.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 13:27:09 -0700 (PDT)
Message-ID: <15f84f96-1150-0fbf-424c-65efa316454c@gmail.com>
Date: Tue, 1 Aug 2023 13:27:06 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [stable:linux-4.19.y 2317/9999]
 lib/mpi/generic_mpih-mul2.c:49:24: error: invalid use of a cast in a inline
 asm context requiring an lvalue: remove the cast or build with
 -fheinous-gnu-extensions
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Fangrui Song <maskray@google.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, kernel test robot <lkp@intel.com>
References: <202307311111.jPEdYIJR-lkp@intel.com>
 <CAKwvOdmgunghdn9fpfXcz8O0+tDuK7GgNrKCUF+-7=nTHOp2nQ@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAKwvOdmgunghdn9fpfXcz8O0+tDuK7GgNrKCUF+-7=nTHOp2nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/23 13:15, Nick Desaulniers wrote:
> On Sun, Jul 30, 2023 at 8:57 PM kernel test robot <lkp@intel.com> wrote:
>>
>> Hi Fangrui,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
>> head:   767049cead76cf699707290d5aeefb3e4d0d5b43
>> commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
> 
> These aren't a result of Fangrui's change.  Fangrui's change probably
> allows this config to mostly build, modulo the below error in
> lib/mpi/generic_mpih-mul2.c.
> 
>> config: mips-randconfig-r036-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311111.jPEdYIJR-lkp@intel.com/config)
>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
>> reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311111.jPEdYIJR-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202307311111.jPEdYIJR-lkp@intel.com/
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>>> drivers/net/netdevsim/netdev.c:167:35: warning: unused variable 'nsim_switchdev_ops' [-Wunused-const-variable]
>>       167 | static const struct switchdev_ops nsim_switchdev_ops = {
>>           |                                   ^
>>     1 warning generated.
> 
> ^ fixed by
> commit e58df56c8564 ("netdevsim: Implement ndo_get_port_parent_id()")
> in v5.1-rc1 (this report is against 4.19.y)
> Florian, does it make sense for the stable maintainers to cherry-pick
> e58df56c8564 to 4.19.y in isolation?

In isolation no, because you will get a build failure because 
netdevice_ops has no ndo_get_port_parent_id member. The complete patch 
set was 12 patches:

https://lore.kernel.org/all/20190205235326.14600-1-f.fainelli@gmail.com/

which is too big for a stable candidate. IMHO the simplest way is to 
mark the structure as __maybe_unused since this configured has 
CONFIG_NET_SWITCHDEV=n presumably?
-- 
Florian

