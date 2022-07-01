Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15510E8
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 04:42:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x4so1377118pfq.2
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 21:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=msPYOhdZk/dTzF+121o/hCul9kH1y8Q/KJ2JfWUsMoQ=;
        b=H4cFUUvuKp70J+2j3dwqFw2Zr+SRi1eXI3M5JZQUixFvIFWeg4sE7PZ7Adsx+ahZqf
         rD+tzBZaU20KlAaR0+v4T+bppvcz/197swomxyCeOz5uLQxXVM6Aooiae7mJGRKBW+jh
         7wlvkooy8Wn8YmCT0gBVogPUN0ZZAZuK8LWBxaZQumE9AQdm+08mJqq0THSIcxgLUZRf
         pyX2O9SvoZJX67BKFRnOe3NpQAOyFT/wX7fHSBB8dq89bzGs1HOt9faOKp+YRajH0gBC
         ojGAgBYSuN699Ewe7uHnulwQTsG61nFWn57ycaZBXnBSD/eiPPtGZBfuijm5SorD1urW
         xuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=msPYOhdZk/dTzF+121o/hCul9kH1y8Q/KJ2JfWUsMoQ=;
        b=LcLoHLapFF8Mp5AGuS6/9W2+arhc+Vezax+alt6X0X/csxrX1AAVNFlcmO1jf86LY4
         Ln045cJp6Z4WNiFSBJUXv/AW2WoIMleEarAyZIFlGhhY69xNyYa21h8gGVYw06DBp0S/
         HruWBYUgQ2OXo2K3ivkuVWMLTottj/LkWzboBdfxoNaJPAYvWJg6ENDDKdFIH2/PFcDF
         m9vQDN5yF5VuwnSA1IU5QmzDwH66qTDz53Fl7jbRHvQChv40Z7j2kqW92zWplyDJ0dHJ
         tgm1/Lr4ZcLRHlPT0u4ydsseKC8URyxy9YW59m6sbGvO7x8tD+YFCVUosFlH+rdgPqSd
         IsJg==
X-Gm-Message-State: AJIora8uAf+QFzCDg2LFLGvRvzUGnIYOm9UT40Hv6g1psC2fR1Zw0V+T
	UNXij03kD/XkxYkFMhsGRKo=
X-Google-Smtp-Source: AGRyM1sxM8hl7EVM47OJpTc4SHAcFzfUmT1sBwRvGQ8XkOrtkdS0PL+wwJv/UMqFPgUfchZaEWCn+A==
X-Received: by 2002:a62:542:0:b0:525:a313:fe28 with SMTP id 63-20020a620542000000b00525a313fe28mr19431059pff.73.1656650567140;
        Thu, 30 Jun 2022 21:42:47 -0700 (PDT)
Received: from [0.0.0.0] (jp.bgp.twd2.net. [2a0c:b641:571::1])
        by smtp.gmail.com with ESMTPSA id v187-20020a6261c4000000b005255f5d8f9fsm14583099pfb.112.2022.06.30.21.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 21:42:46 -0700 (PDT)
Message-ID: <f8f35abc-1482-c62c-18be-368252c9ec39@gmail.com>
Date: Fri, 1 Jul 2022 12:42:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, nathan@kernel.org, llvm@lists.linux.dev,
 =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20220512205545.992288-1-twd2.me@gmail.com>
 <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
 <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
 <CAKwvOdnSRA_1wO8bb3tuGCunPjx_pQDi2_0O9yQLbk-TRR3dyA@mail.gmail.com>
 <CAFP8O3J2s1RoUu7JG5AT6kWuvZ6EmEsbtQ7Z5rOFwBQmoJoA3w@mail.gmail.com>
From: twd2 <twd2.me@gmail.com>
In-Reply-To: <CAFP8O3J2s1RoUu7JG5AT6kWuvZ6EmEsbtQ7Z5rOFwBQmoJoA3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Palmer,

ping?

Thanks
Wende

在 2022/5/14 3:31, Fāng-ruì Sòng 写道:
> On Fri, May 13, 2022 at 12:30 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>> On Fri, May 13, 2022 at 11:28 AM twd2 <twd2.me@gmail.com> wrote:
>>> 在 2022/5/13 5:34, Nick Desaulniers 写道:
>>>> On Thu, May 12, 2022 at 1:56 PM Wende Tan <twd2.me@gmail.com> wrote:
>>>>> Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
>>>>> issue [1] in prior LLD versions that prevents LLD to generate proper
>>>>> machine code for RISC-V when writing `nop`s.
>>>>>
>>>>> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
>>>>> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
>>>>> can boot to shell using an archriscv rootfs on QEMU.
>>>>>
>>>>> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
>>>>> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
>>>> Haha! That's ok, allyesconfig is not expected to boot for any
>>>> architectures AFAIK. For CI, we simply verify we can build them; we
>>>> boot test everything but allyesconfig and allmodconfig (and
>>>> architectures which don't yet have qemu ports).  It helps detect when
>>>> assembler sources don't use enough encoding space when referenced
>>>> external symbols are too far away for larger images, IME.
>>>>
>>>> That's a long time; first time I've seen a number from someone trying
>>>> to LTO allyesconfig!
>>>>
>>>>> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
>>>>> image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
>>>>> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
>>>>> separate patch further.
>>>>>
>>>>> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
>>>>>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
>>>> So looking at that change, it doesn't look like it touches LLD at all.
>>>> To me it touches both the assembler and the object streamer, which is
>>>> used by the compiler (and assembler) to stream instructions directly
>>>> into an object file (without the need for an external assembler).
>>>>
>>>> That makes me think that
>>>> CLANG_VERSION >= 140000
>>>> would be more appropriate than
>>>> LLD_VERSION >= 140000
>>>>
>>>> WDYT?
>>>
>>> It seems that when LTO is enabled, the compiler (clang) only generates bitcode, and LLD collects all the bitcode, does LTO, and generates machine code (assembly) and ELF object files? Actually, the error message in #50505 was originally reported by LLD. So I'd like to check LLD_VERSION here.
>> Ah, that's right. Ok, LGTM.
>>
>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
>>>
>>>> Also, I'm curious if the LLVM patch you had me commit for you recently
>>>> is at all related or necessary for this? If so, then the version check
>>>> should probably be against clang-15, not clang-14.
>>>> https://github.com/llvm/llvm-project/commit/6baaad740a5abb4bfcff022a8114abb4eea66a2d
>>>
>>> Aha, that patch is for enabling LTO for allyesconfig (especially, with xfs and overlayfs). I think that patch is not mandatory for enabling LTO for RISC-V.
>>>
>>>
>>>> Anyways, I just did a build+boot (in qemu) test of defconfig+thinlto
>>>> and defconfig+lto. LGTM
>>>>
>>>> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>>>
>>> Thanks,
>>> Wende
>>>
>>>
>>>>> Tested-by: Wende Tan <twd2.me@gmail.com>
>>>>> Signed-off-by: Wende Tan <twd2.me@gmail.com>
>>>>> ---
>>>>> v2:
>>>>> - Some textual changes suggested by Nick.
>>>>> - Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is filed
>>>>>   and resolved.
>>>>> - Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.
>>>>>
>>>>> v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd2.me@gmail.com/
>>>>> ---
>>>>>  arch/riscv/Kconfig | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>>>> index 00fd9c548f26..c55f6b95e5af 100644
>>>>> --- a/arch/riscv/Kconfig
>>>>> +++ b/arch/riscv/Kconfig
>>>>> @@ -38,6 +38,10 @@ config RISCV
>>>>>         select ARCH_SUPPORTS_ATOMIC_RMW
>>>>>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>>>>>         select ARCH_SUPPORTS_HUGETLBFS if MMU
>>>>> +       # LLD >= 14:
>>>>> +       # - https://github.com/llvm/llvm-project/issues/50505
>>>>> +       select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
>>>>> +       select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
>>>>>         select ARCH_USE_MEMTEST
>>>>>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>>>>         select ARCH_WANT_FRAME_POINTERS
>>>>> --
>>>>> 2.25.1
>>>>>
>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers
>
>
-- 
Best wishes!
Sincerely,
twd2
https://twd2.me

