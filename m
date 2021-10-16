Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17B2C80
	for <llvm@lists.linux.dev>; Sat, 16 Oct 2021 01:11:43 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id f11so5877703pfc.12
        for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnmWcpYjZ93+9/USsjI5yc08CI3gidamSDoWKAiSGj8=;
        b=GZKEtGQXS3effH9eTB7DvJ1KHialm9ycCtkHxx+6wj/8ovcnezOgoxlFNi6ojEvxLp
         vCAEn7ozv11GEu8EMAAO6Xf/S0e6bmp47qsDYuHAdVGUM9iRdKA8VHZB3NlFghC7sv46
         FsXw9Erkf/aCnnEl9pWrTbV385gyLs43Hx18EXRAGlUMmVCL2D5ym2Kj2mhtIYRfBIqv
         Qrf9XHbOp6LKOl/7m7BM7QkcqNaIymW4OWH4GuGYKHpLO9HqrVXYSv7jB6TA7NC8DT11
         6sMeUJvndfAQbJjDFrz+sehU5SVlaOfT3aJLAsvtfm2W+JQtKO5tINTrh0I7b0qI/gto
         kCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=ZnmWcpYjZ93+9/USsjI5yc08CI3gidamSDoWKAiSGj8=;
        b=12nXD5QtCSIPlKl6wmsH3q3fkSt6U2uxr643krLfFGXxpA00mr1i1eBZNpM0KXIMyZ
         a9q7iDvyDqp4ECPfjguqnDri82uHiI/B7Kq2Ab8c1GeoHvbuCg7aKsMk8QSjIShDRY1R
         E+O1zxm3CIoh/asAhUrlB5xFINYDuyHULxJ/kYskHqWoMpMJ7MmZDNItWBx2OtI4byXG
         YrJJyD04dPkMKrgHBLVog9VO+tq/v1VUxy7iLDedCO62olNYkFOvB0aY9ZoFLBOQbjC0
         M9B/tr3etOESxEA93LiEM3p7M6JZH3C5TR/83ORNHLd4WCBb/DB2nOwwz49YYzGYkiHH
         hHHQ==
X-Gm-Message-State: AOAM532f6OviBc0Ww9mMoEri+niPLu1xFEeMOd/Hirl3hahyVmPx2gFW
	Es0hUOv8D6VNB85LV1JXj8VYFA==
X-Google-Smtp-Source: ABdhPJxxfRHsneRsqZjvSmgeS3HDNbLOMcOQWWbfnO+S3BjiB+68l3s3+LJr9/SMhEdp2RjiEUtLoA==
X-Received: by 2002:aa7:8189:0:b0:44c:293a:31e4 with SMTP id g9-20020aa78189000000b0044c293a31e4mr14844220pfi.51.1634346702295;
        Fri, 15 Oct 2021 18:11:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id pj12sm6334412pjb.19.2021.10.15.18.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 18:11:41 -0700 (PDT)
Date: Fri, 15 Oct 2021 18:11:41 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Oct 2021 18:11:19 PDT (-0700)
Subject:     Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
In-Reply-To: <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
CC: nathan@kernel.org, elver@google.com, akpm@linux-foundation.org,
  ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
  ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-8b034488-1592-442a-a206-203c73b3b3bc@palmerdabbelt-glaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 14 Oct 2021 11:31:00 PDT (-0700), alex@ghiti.fr wrote:
> Hi Nathan,
>
> Le 14/10/2021 à 18:55, Nathan Chancellor a écrit :
>> On Fri, Oct 08, 2021 at 11:46:55AM -0700, Palmer Dabbelt wrote:
>>> On Thu, 23 Sep 2021 07:59:46 PDT (-0700), nathan@kernel.org wrote:
>>>> On Thu, Sep 23, 2021 at 12:07:17PM +0200, Marco Elver wrote:
>>>>> On Wed, 22 Sept 2021 at 22:55, Nathan Chancellor <nathan@kernel.org> wrote:
>>>>>> Currently, the asan-stack parameter is only passed along if
>>>>>> CFLAGS_KASAN_SHADOW is not empty, which requires KASAN_SHADOW_OFFSET to
>>>>>> be defined in Kconfig so that the value can be checked. In RISC-V's
>>>>>> case, KASAN_SHADOW_OFFSET is not defined in Kconfig, which means that
>>>>>> asan-stack does not get disabled with clang even when CONFIG_KASAN_STACK
>>>>>> is disabled, resulting in large stack warnings with allmodconfig:
>>>>>>
>>>>>> drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c:117:12:
>>>>>> error: stack frame size (14400) exceeds limit (2048) in function
>>>>>> 'lb035q02_connect' [-Werror,-Wframe-larger-than]
>>>>>> static int lb035q02_connect(struct omap_dss_device *dssdev)
>>>>>>             ^
>>>>>> 1 error generated.
>>>>>>
>>>>>> Ensure that the value of CONFIG_KASAN_STACK is always passed along to
>>>>>> the compiler so that these warnings do not happen when
>>>>>> CONFIG_KASAN_STACK is disabled.
>>>>>>
>>>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1453
>>>>>> References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
>>>>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>>>>
>>>>> Reviewed-by: Marco Elver <elver@google.com>
>>>>
>>>> Thanks!
>>>>
>>>>> [ Which tree are you planning to take it through? ]
>>>>
>>>> Gah, I was intending for it to go through -mm, then I cc'd neither
>>>> Andrew nor linux-mm... :/ Andrew, do you want me to resend or can you
>>>> grab it from LKML?
>>>
>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>
>>> (assuming you still want it through somewhere else)
>>
>> Thanks, it is now in mainline as commit 19532869feb9 ("kasan: always
>> respect CONFIG_KASAN_STACK").
>>
>>>>> Note, arch/riscv/include/asm/kasan.h mentions KASAN_SHADOW_OFFSET in
>>>>> comment (copied from arm64). Did RISC-V just forget to copy over the
>>>>> Kconfig option?
>>>>
>>>> I do see it defined in that file as well but you are right that they did
>>>> not copy the Kconfig logic, even though it was present in the tree when
>>>> RISC-V KASAN was implemented. Perhaps they should so that they get
>>>> access to the other flags in the "else" branch?
>>>
>>> Ya, looks like we just screwed this up.  I'm seeing some warnings like
>>>
>>>     cc1: warning: ‘-fsanitize=kernel-address’ with stack protection is not supported without ‘-fasan-shadow-offset=’ for this target
>>
>> Hmmm, I thought I did a GCC build with this change but I must not have
>> :/
>>
>>> which is how I ended up here, I'm assuming that's what you're talking about
>>> here?  LMK if you were planning on sending along a fix or if you want me to
>>> go figure it out.
>>
>> I took a look at moving the logic into Kconfig like arm64 before sending
>> this change and I did not really understand it well enough to do so. I
>> think it would be best if you were able to do that so that nothing gets
>> messed up.
>>
>
> I'll do it tomorrow, I'm the last one who touched kasan on riscv :)

Any luck?  I tried what I think is the simple way to do it last week, 
(merging with Linus' tree is turning these warnings into build 
failures) but it's hanging on boot.  Not sure what's going on

    diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
    index c3f3fd583e04..d3998b4a45f1 100644
    --- a/arch/riscv/Kconfig
    +++ b/arch/riscv/Kconfig
    @@ -212,6 +212,12 @@ config PGTABLE_LEVELS
     config LOCKDEP_SUPPORT
            def_bool y
    
    +config KASAN_SHADOW_OFFSET
    +       hex
    +       depends on KASAN_GENERIC
    +       default 0xdfffffc800000000  if 64BIT
    +       default 0xffffffff          if 32BIT
    +
     source "arch/riscv/Kconfig.socs"
     source "arch/riscv/Kconfig.erratas"
    
    diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
    index a2b3d9cdbc86..b00f503ec124 100644
    --- a/arch/riscv/include/asm/kasan.h
    +++ b/arch/riscv/include/asm/kasan.h
    @@ -30,8 +30,7 @@
     #define KASAN_SHADOW_SIZE      (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
     #define KASAN_SHADOW_START     KERN_VIRT_START
     #define KASAN_SHADOW_END       (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
    -#define KASAN_SHADOW_OFFSET    (KASAN_SHADOW_END - (1ULL << \
    -                                       (64 - KASAN_SHADOW_SCALE_SHIFT)))
    +#define KASAN_SHADOW_OFFSET    _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
    
     void kasan_init(void);
     asmlinkage void kasan_early_init(void);

>
> Thanks,
>
> Alex
>
>> Cheers,
>> Nathan
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
