Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96565A
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 07:38:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so4559575pja.5
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ezqTgX5aoFbbwvpb8+qZYeXbiyBI9c/LxzdN5thGYBE=;
        b=36o10mPT7FUuo1YoAo7NjWWgKGI1JALa6tQB4PGmjQu8/LEQLz3vqdyC27sKqApetx
         PF1vTDo18oi6kKiNlE1GiqzwKaPZeH4tOu4KavJWHrq0rZTmteHrNLarqezaeWXX5THn
         mJHjFSwnXgFs8wyPvx1JzQcDK60oeyZCEuTjPW+1TI8t6Z266xVoNgQ9TTUxfHiFuVhb
         p1SP6ENaW0EJLH0Tmve7+778fLX0KAT+pzZGEZgXCjf10vT62iMX+UpKxOSa2MeGpvIX
         vw3PX+4LGhdp3im+dV/onIYCZo0cU1r9qd/RmZwc6QdAxec8SYPRW3B8lnCbpPGYURw1
         my4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ezqTgX5aoFbbwvpb8+qZYeXbiyBI9c/LxzdN5thGYBE=;
        b=5JFv1CNVd3sGNO8l3waGWPGfxrUy4zMxnPI0h5cPWsW9De/lMLK6/VF1zMbXX0NY9x
         A/Kn5AoatF7rnJaCz5ALJvwxf7QYYCGCLYjMKZCBsYEVTAfXlTfVd4sWISrulES+7QoW
         l2rkVufJmBMiTs2wleaA1009HF8FCp2yLfmYBmz76/pHxvKj9lXxRR/FFL5BVF0iFTMx
         1P/v0Jme6CJsHYLPc+3/k4vM4o0Pmt/ZV8L7LHWgRT56mI+v9wusFl96RMkbOCT5nAR/
         JO4nSefpFiBLKA2FLZskdrqSdAL9PrPAvZxYVSDYDthYoMTidu3dIqfFalajNJKnI4QO
         bjzA==
X-Gm-Message-State: ACgBeo19vx0532SHupxtFO0zTnU4yCqewQ/9ifeHTl0tU/TAlLTWP2zr
	Mnt1JlDH2Nu4qw3R8CUm40K4Ng==
X-Google-Smtp-Source: AA6agR7qNrCFjMSZtJX99NaFJwB36AGWp6zJMOQ+DYnsGTLGnxJJr/oMTnL0JwJEv5/AhJc6HAn/sQ==
X-Received: by 2002:a17:90a:640c:b0:1fe:1763:e169 with SMTP id g12-20020a17090a640c00b001fe1763e169mr8147519pjj.35.1662709106554;
        Fri, 09 Sep 2022 00:38:26 -0700 (PDT)
Received: from [10.4.108.105] ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id r17-20020a170902c61100b0017532e01e3fsm708598plr.276.2022.09.09.00.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:38:25 -0700 (PDT)
Message-ID: <c7ecca99-696f-220d-7ecd-9be51cc947d9@bytedance.com>
Date: Fri, 9 Sep 2022 15:38:20 +0800
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, kernel test robot <lkp@intel.com>
References: <202209091157.akimiv18-lkp@intel.com>
 <a37a1b71-e7b4-4b7a-9aec-a9ce64d13d84@www.fastmail.com>
 <69409ea6-6daa-7973-c950-c6ca9ad96f50@bytedance.com>
 <23cde275-613b-4895-a05c-48a0ec55ff6a@www.fastmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <23cde275-613b-4895-a05c-48a0ec55ff6a@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2022/9/9 15:35, Arnd Bergmann wrote:
> On Fri, Sep 9, 2022, at 9:07 AM, Qi Zheng wrote:
> 
>> BTW, when I just compiled the kernel with W=1, I found a lot of
>> compilation warnings, which is somewhat unexpected.
> 
> Correct, the kernel test robot only sends emails for newly introduced
> warnings, but it will keep nagging you about them.

Got it. Thanks.

> 
>         Aarn

-- 
Thanks,
Qi
