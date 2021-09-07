Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8823972
	for <llvm@lists.linux.dev>; Tue,  7 Sep 2021 13:44:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m2so6920136wmm.0
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WkJEILKIhdl3VRNi+o6WcfgG/yP64dQ+4mkD99PbiSY=;
        b=XhJXnn6iv7V1MGRg9ZkLlas1IdzwsXckNYuZK2QugSrgr+IfNKJJ0bjcJUQrbOyr06
         LrfxDlXRmjDHEcq0HrnbYOTSRwoM4wrJZM+Ife7R6e9gh7FUvhrPEb3WftwjnB1PhOH/
         CMO0ofcZwZM6h4zBz0fBtTOJtRddgsWWEmuypIxs17tSO4BiVN97qpK0J877R15g7w8r
         JDwnyFjnqEGDKCPfCv6bPiegXwWT3pNCJfsgQpeCXegUUTW6ZK1CqAAsnCUxN7hVuZwG
         LEJIpqS92a/QTzlmsNdNxmFzQZf2l07YM7a194bNQnqguxs/jRbFHNkgr9Y5jk7ichEl
         AmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WkJEILKIhdl3VRNi+o6WcfgG/yP64dQ+4mkD99PbiSY=;
        b=htul6GmlHVx6KiQQ2SWAsOMJ4Qah9e3qUvjt7THnfgsYiyCDfMuDdEGTP2fKV1wK9l
         xOp6BEfgLpUaolm36UHf+yolvhLrbkvq4b8oKMRgSs2DrR42GADFQucy7VJOkd9U7tF0
         lZn08uJnTiIHm7+Zs/hAcKyW3xA7aNY3E/jceexP38kru9wgHc60PfmTPzI7dIjpdIE9
         nOR1lES6GaO5FnGOFpEdOM1vD+A8gifNsyyac+q3sOzBUNWtWFsoAcd9odkhN9zCFjU0
         cBjhnEnieYuMKJZDiOFrCLC8QxAhMrA3lK6AZz9xyuzkQ7IWnHmkB9IubtHQazFiDpI0
         +/Zg==
X-Gm-Message-State: AOAM5305BRFwZ2XCO+tsljaRq4tUmXQ29/clBrsJ3ShSlkIUeGvTDxri
	UuPuO4yaq8l/nPmXgjOMwnO9xclRN3AWj5VOQb4=
X-Google-Smtp-Source: ABdhPJznwkAIj2BBCM00XE8Pt6l/jHjtuDBdb65PfqgK9fRTDong02ISge3DaBIZvF7SqOG/fhi2pQ==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr4120310wmj.78.1631022271773;
        Tue, 07 Sep 2021 06:44:31 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
        by smtp.gmail.com with ESMTPSA id r129sm2357134wmr.7.2021.09.07.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 06:44:31 -0700 (PDT)
Subject: Re: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
To: Nathan Chancellor <nathan@kernel.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, llvm@lists.linux.dev
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-18-richard.henderson@linaro.org>
 <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0699da7b-354f-aecc-a62f-e25693209af4@linaro.org>
Date: Tue, 7 Sep 2021 15:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/31/21 2:51 AM, Nathan Chancellor wrote:
> I just bisected a boot hang with an LLVM-built multi_v7_defconfig +
> CONFIG_THUMB2_KERNEL=y kernel down to this commit. I do not see the same
> hang when the kernel is compiled with GCC 11.2.0 and binutils 2.37 nor
> do I see a hang with multi_v7_defconfig by itself. Is there something
> that LLVM is doing wrong when compiling/assembling/linking the kernel or
> is there something wrong/too aggressive with this commit? I can
> reproduce this with current QEMU HEAD (ad22d05833).
> 
> My QEMU invocation is:
> 
> $ qemu-system-arm \
>      -append "console=ttyAMA0 earlycon" \
>      -display none \
>      -initrd rootfs.cpio \
>      -kernel zImage \
>      -M virt \
>      -m 512m \
>      -nodefaults \
>      -no-reboot \
>      -serial mon:stdio
> 
> and the rootfs.cpio and zImage files can be found here:
> 
> https://github.com/nathanchance/bug-files/tree/15c1fd6e44622a3c27823d2c5c3083dfc7246146/qemu-2e1f39e29bf9a6b28eaee9fc0949aab50dbad94a

Hmm.  I see

IN:
0xc13038e2:  e890 008c  ldm.w    r0, {r2, r3, r7}

R00=c13077ca R01=c11a8058 R02=c11a8058 R03=c031737f
R04=48379000 R05=00000024 R06=c031748d R07=c03174bb
R08=412fc0f1 R09=c0ce9308 R10=50c5387d R11=00000000
R12=00000009 R13=c1501f88 R14=c0301739 R15=c13038e2
PSR=200001f3 --C- T svc32
Taking exception 4 [Data Abort]
...from EL1 to EL1
...with ESR 0x25/0x9600003f
...with DFSR 0x1 DFAR 0xc13077ca

So, yes, it's a ldm from an address % 4 = 2, so it is correct that we should trap.  You 
should see the same trap on real hw.


r~
