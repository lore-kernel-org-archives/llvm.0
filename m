Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF899622
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 07:07:42 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id jm11so932118plb.13
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 00:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5aQOmj4o6dy+y08Ndf5GP3ShJjdt3XzOKjEopk6m/lE=;
        b=TPbzxpyPzcDS/2Mu6bTugXg7Evw4zdwAU0ETEKmg6oSWWB2dTr0yCd8rRlVpzZTD1l
         A1JKGtlEa0KKAHnmb+DDf+HKhQB668P2MfErJ6E5wZHnjAIL1mElQWdH5FKfI3W14tdy
         l9eT1NqeubKDL1nNpHkATVRpnvKrBACw0b5+ALb4uPettYoqHeky9E7npLq2k5gWqO9T
         qCFcN6LLBYM+d0vhgF6eip5CM28zPLH4E8FAWfobeL7XGAzzvBC6zy8nNm3bH5ef4aHu
         TJvYlg09bqHC4hAh5HmNT8ubJngGXLekNnWPU7Stnvz7/UNY8A8x4NOke49aPy9HmgqU
         qbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5aQOmj4o6dy+y08Ndf5GP3ShJjdt3XzOKjEopk6m/lE=;
        b=JG9GcT7EGLdOFzPCgGopZZy8Vg6CSaGaPDGTQVP2EWN9eI0LTDazl/LX/jaIXJkKkU
         yI0vF1CQGi2Ac6QaDxDK6ZSg+0LT4JKaAk5JpCLwQJXQ0FULpJHV0Y16j/nk7DRzNSeA
         yOircDyYNidBlbkLscd7ocgwqXA99FDfNoSobQJZATKIHcQLEJeHyH9HkoJz1VP8vQd7
         Eq13Kyw8NTnENN0txXGv6nccXzq+zXcKmt18Z1ZnaOfF/eUe+ul6WKjuIwzo7ZtYXGPY
         AZ5x1Vupv90MrUCZJ9qb0BN+KTPxwryy9KgnNAGu4Ux3HRT+RUDiXyWbAKyep3aF5QWw
         caPA==
X-Gm-Message-State: ACgBeo0lkuLWcJ4KyOI2ej3+KFt80SMcP7KPjJ1WPfBSc/3UQZ6rUXbh
	G/4z78viQGahzleXi4MAw5GoDg==
X-Google-Smtp-Source: AA6agR6KbyVvA8JXAeum23FDcoKOigidJa7JqE+5eS/1/Rhp7TmDzQkmZjEuOFLqTQBJiEbYW6ZhDg==
X-Received: by 2002:a17:90a:c711:b0:202:5cda:765c with SMTP id o17-20020a17090ac71100b002025cda765cmr8330639pjt.35.1662707262018;
        Fri, 09 Sep 2022 00:07:42 -0700 (PDT)
Received: from [10.4.108.105] ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id cv8-20020a17090afd0800b001fb53587166sm656041pjb.28.2022.09.09.00.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:07:41 -0700 (PDT)
Message-ID: <69409ea6-6daa-7973-c950-c6ca9ad96f50@bytedance.com>
Date: Fri, 9 Sep 2022 15:07:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [ammarfaizi2-block:arm64/linux/for-next/misc 2/2]
 arch/arm64/kernel/irq.c:81:6: warning: no previous prototype for function
 'do_softirq_own_stack'
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, linux-kernel@vger.kernel.org
References: <202209091157.akimiv18-lkp@intel.com>
 <a37a1b71-e7b4-4b7a-9aec-a9ce64d13d84@www.fastmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <a37a1b71-e7b4-4b7a-9aec-a9ce64d13d84@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2022/9/9 14:30, Arnd Bergmann wrote:
> On Fri, Sep 9, 2022, at 5:12 AM, kernel test robot wrote:
>> tree:   https://github.com/ammarfaizi2/linux-block
>> arm64/linux/for-next/misc
>> head:   2d2f3bb897a3de4190b1b6b296c3429d01327554
>> commit: 2d2f3bb897a3de4190b1b6b296c3429d01327554 [2/2] arm64: run
>> softirqs on the per-CPU IRQ stack
>> config: arm64-randconfig-r023-20220907
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project
>> 1546df49f5a6d09df78f569e4137ddb365a3e827)
>> reproduce (this is a W=1 build):
>>          wget
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          #
>> https://github.com/ammarfaizi2/linux-block/commit/2d2f3bb897a3de4190b1b6b296c3429d01327554
>>          git remote add ammarfaizi2-block
>> https://github.com/ammarfaizi2/linux-block
>>          git fetch --no-tags ammarfaizi2-block arm64/linux/for-next/misc
>>          git checkout 2d2f3bb897a3de4190b1b6b296c3429d01327554
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
>> O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> arch/arm64/kernel/irq.c:81:6: warning: no previous prototype for function 'do_softirq_own_stack' [-Wmissing-prototypes]
>>     void do_softirq_own_stack(void)
>>          ^
>>     arch/arm64/kernel/irq.c:81:1: note: declare 'static' if the function
>> is not intended to be used outside of this translation unit
>>     void do_softirq_own_stack(void)
>>     ^
>>     static
> 
> 
> I think we are missing an "#include <asm/softirq_stack.h>"
> in arch/arm64/kernel/irq.c

Indeed. Hi Catalin, do I need to resend the v4 version? Or can you help
me to apply the following code change to the for-next/misc directly?
Both are fine for me, depending on which way is convenient for you. :)

diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index c36ad20a52f3..181df57c812b 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -23,6 +23,7 @@
  #include <asm/daifflags.h>
  #include <asm/vmap_stack.h>
  #include <asm/exception.h>
+#include <asm/softirq_stack.h>

  /* Only access this in an NMI enter/exit */
  DEFINE_PER_CPU(struct nmi_ctx, nmi_contexts);

BTW, when I just compiled the kernel with W=1, I found a lot of
compilation warnings, which is somewhat unexpected.

Thanks,
Qi

> 
>         Arnd

-- 
Thanks,
Qi
