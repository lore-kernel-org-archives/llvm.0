Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD529A40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 07:50:33 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id e5so3761744pfl.2
        for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dt2OAvtuqDumbkn/MrsQ9uanevxL0KkSOfPOC0rhFvA=;
        b=JHtIiq70aFWQwaChjGYCDAdDui7sJYmQCZgghJ6c6OO/6w1ZiTLwUfLI/0Toa6I5Cq
         JKoq44S+/axf7YzU3jou6t/MObjG12PoDx+E+k4gbtSwW7WAWY5kjLXPdjslQFxydEkq
         gzgC7Ykrud5COuHEMj7lLE/Lcp3wStyVwvyC+MsQQRDV/BeUnnhF7ZAloeoWM5WcR8Do
         guXPvzQANnK1bg2qYJ5uTOypimi5ohiphAQmTYdCK/Ur/YloomOZG8XVi8DHQMxtMhEL
         Li1T3zsRAuhly0+kyxNn6nvGK+10pqZ/jl6IipsCmZmgAhwoJELnmxUCPj+shyzU+fB9
         YxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dt2OAvtuqDumbkn/MrsQ9uanevxL0KkSOfPOC0rhFvA=;
        b=VxYhIil4uSRYV6MCl0H97/MmHlhbEemiQyxgkO0cabtFmAOAr/TrUsS7MrXE7X0kZj
         6psZIW/fOHhMmRYtFOZF3HTn8nASvFyiVl+B0pIaicXrDxBAQYIPKZQYtGS4SF8ND9JS
         E+Lm5tPGKli9xDXjLV9sMeROumEj70wdZrF7s3ddbS/UzeUDZfk/MhwdCS2cXBUcIO5X
         h6HE933E3WuyGQR9HADrv0lakm7ZdXGRZjJDPl2rXBmEyydBiAS3DmA0YUkY21kH/KvF
         ey509IPThm7jnfWf1oNLFVrSudA6vb5hr2EV+CziyERRz2k92mMJCz6sk9v6H00Y7pYF
         V6sw==
X-Gm-Message-State: ACgBeo07kkg/jOtQu6EoPTvT63BllTeDH4m4YeJN3cM1fCqN2to1zYw/
	NNplF5SlmGN2t7vAOBrOm/Ij4KrYj68++A==
X-Google-Smtp-Source: AA6agR4HDi5XYbZZ1HQqACG68+NrdY4RdmXUW55j8pwyIXVZlASdBcrbE2rMZ4Om4jLkH8LXhuH9dg==
X-Received: by 2002:a65:4609:0:b0:434:8f0b:5d05 with SMTP id v9-20020a654609000000b004348f0b5d05mr15222722pgq.606.1662796233107;
        Sat, 10 Sep 2022 00:50:33 -0700 (PDT)
Received: from [10.4.108.105] ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7954e000000b00535e950aa28sm1032535pfq.131.2022.09.10.00.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 00:50:31 -0700 (PDT)
Message-ID: <0c594ac2-d775-6424-6850-191c0c30275d@bytedance.com>
Date: Sat, 10 Sep 2022 15:50:26 +0800
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
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, linux-kernel@vger.kernel.org
References: <202209091157.akimiv18-lkp@intel.com>
 <a37a1b71-e7b4-4b7a-9aec-a9ce64d13d84@www.fastmail.com>
 <69409ea6-6daa-7973-c950-c6ca9ad96f50@bytedance.com>
 <Yxt/ICkxAH/+tn08@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Yxt/ICkxAH/+tn08@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2022/9/10 02:00, Catalin Marinas wrote:
> On Fri, Sep 09, 2022 at 03:07:36PM +0800, Qi Zheng wrote:
>> On 2022/9/9 14:30, Arnd Bergmann wrote:
>>> On Fri, Sep 9, 2022, at 5:12 AM, kernel test robot wrote:
>>>> tree:   https://github.com/ammarfaizi2/linux-block
>>>> arm64/linux/for-next/misc
>>>> head:   2d2f3bb897a3de4190b1b6b296c3429d01327554
>>>> commit: 2d2f3bb897a3de4190b1b6b296c3429d01327554 [2/2] arm64: run
>>>> softirqs on the per-CPU IRQ stack
>>>> config: arm64-randconfig-r023-20220907
>>>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project
>>>> 1546df49f5a6d09df78f569e4137ddb365a3e827)
>>>> reproduce (this is a W=1 build):
>>>>           wget
>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>>>> -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # install arm64 cross compiling tool for clang build
>>>>           # apt-get install binutils-aarch64-linux-gnu
>>>>           #
>>>> https://github.com/ammarfaizi2/linux-block/commit/2d2f3bb897a3de4190b1b6b296c3429d01327554
>>>>           git remote add ammarfaizi2-block
>>>> https://github.com/ammarfaizi2/linux-block
>>>>           git fetch --no-tags ammarfaizi2-block arm64/linux/for-next/misc
>>>>           git checkout 2d2f3bb897a3de4190b1b6b296c3429d01327554
>>>>           # save the config file
>>>>           mkdir build_dir && cp config build_dir/.config
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
>>>> O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>>> arch/arm64/kernel/irq.c:81:6: warning: no previous prototype for function 'do_softirq_own_stack' [-Wmissing-prototypes]
>>>>      void do_softirq_own_stack(void)
>>>>           ^
>>>>      arch/arm64/kernel/irq.c:81:1: note: declare 'static' if the function
>>>> is not intended to be used outside of this translation unit
>>>>      void do_softirq_own_stack(void)
>>>>      ^
>>>>      static
>>>
>>>
>>> I think we are missing an "#include <asm/softirq_stack.h>"
>>> in arch/arm64/kernel/irq.c
>>
>> Indeed. Hi Catalin, do I need to resend the v4 version? Or can you help
>> me to apply the following code change to the for-next/misc directly?
>> Both are fine for me, depending on which way is convenient for you. :)
> 
> I'll fold this in, that's the easiest.

Thank you very much! :)

> 
> Thanks.
> 

-- 
Thanks,
Qi
