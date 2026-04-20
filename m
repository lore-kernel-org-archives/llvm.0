Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155517A305
	for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677473; cv=none; b=AjsoJlufpkukvuq0yakAhxpQfCHbhKvmss9BYUv+IIF74WVseRMuwTGrJOg0/QiV1OxfpOzhcZnCEpdSQHgnyKtpzZM6CHGSWC9KyQOuK2lM9BUjNEMP9A+gZzkT5PjypTApeMLJAqeBkOBV3mVqxsZDoCwuip+/PWMzh+3sXuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677473; c=relaxed/simple;
	bh=FclrI+KKzqvQDOfr6HxBKLTnXnTbAyUpuwGWIP7HA6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulUqcdxSF7BB/31wQxfYAcOxzSb+IibcaieuVTMZtRBXhDyF4ghd1OdQWKbdfu6FdaHvYFQE3k7GHOZt4zkImpJ76Os1KCOSrBOv5Tj1AuL6J1qt/XDbvC9MhIlxIQXufRU3RjxhQcXhFkXrUhlcyp+YfyMbsVyPzJ0je3VGZyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmFTTReY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmFTTReY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d572f7437so1829733f8f.1
        for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776677468; x=1777282268; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8qj3m2YeOYn/tCa0oABW2STR1TsWGVnyRLFC3kGM0U=;
        b=mmFTTReYwTEySNFukas9c7u8lJGn4rYD5vBhcX7diHd3feGPnCB421OEILXxGt1pNe
         6lj2PBprm6EUISvgrjw4iKrutqBkEqelEep+apz+TUw8hB27n5D6Y2nV05NGpjT1KDki
         u4vEKkrxApN2Iu/n5ye+64AasGOq6g9BAxi6XST8qBZpeyFeItdSoVHnXh4kc6ZTyebS
         dZ22slj+gISSacAgnW/YFiuY8PhMD4lXcN6pznzp6PcjisXIW37A4f3akDb2IVoJjp1D
         iCXgi99sCXtHb/cmUDvlfpVCcX2YOJhdyZIf5emXBsln3uCA54I6NJypA7/jhLfeHEGH
         9QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677469; x=1777282269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8qj3m2YeOYn/tCa0oABW2STR1TsWGVnyRLFC3kGM0U=;
        b=NgyGhd8+2eAyOF4PKWrnY7HSLTrC4MFtK8Zha2+xWVs2PbkBXURRC9LFnSMAmeNGIs
         +dFJuKNJvrzuflQ6SBS2SsA5Kp5ozxrHTaIwHc2xx2oYko6JK4alndudPHanAbHWXVhc
         csnEO2B/SmiO4YUQIOvLPLHEb/lw3qi7w9efd1cJvi9whfZTdekrhK7zPQclXdL1ptyF
         U41/FSyhbHM98pWOzKX+c7rPIMi5sbqa8uEEW0+1mS2luJa1PGN7vGlwbnYyXgIpK8Tl
         /3xZPcS+6S3oCuFtBRNxSNv1bcUAt2e0Gvvow09GqnTrA4/N26V+GqWr9tyMTI0XYAkS
         6VcA==
X-Forwarded-Encrypted: i=1; AFNElJ8bNK8eZ8O/3jDUGgD+qLeTzWhCBGAqFGuzf3jgkGxnVzvGTlwI5DvKlCG3TrqSeV9Orb9a@lists.linux.dev
X-Gm-Message-State: AOJu0YwELfFAyqlkeFCbCR3b9qqfw7fIfYGNrB8TJ4wadvfJVio5habU
	hL502Uk2YeNiBZdVyQpYNJZ2PK48JG5pBvh96k6ofvIL52NZCLol55k0VRoftF+urMw=
X-Gm-Gg: AeBDiesasRmz9Pt+TAWEH1UQuLbZPyEPhJPr+rcyPf/kxVIGryGjvSOay+O3pqxCV4M
	uMHtmTA8LS8+VERZ+xHNilXZ42fyRP8bezsHqvM28mvp6zDnGmHJa/J27hVeAz6c2KcuUsL+veg
	mC3RBqt+pxlPAucIH1O068z5U2O8k4uEGyfx5GWoFSxzFDInS+c92Ix2N6RSORwB445QedgoJHr
	dYUL80t9LN0l/5VOfZn2Pz6vY4dOYjnBaVaFcQYxon8HCiNtIiVz5TkEHo8b8oXoEStl9i7x1Pv
	oj+lF7TYri+AtYRvf/gc41HLJO7DctJe9u/ltjvHDNLeQbGcJSNuiD43w2SzGLqh8NdqYHbGwCs
	sCj3/XzUxjiu3voTWCOvarPK53xYIRb3y3YXXRzLOuZcEpzttt11m5UegazFPYgNPMUdtIdEH1A
	5qejtWtuENqvGLqyJ5G8Xe/wCWI/nBCvmnHk5fjcN2Hts=
X-Received: by 2002:a05:6000:2307:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-43fe3dcc52cmr19854706f8f.19.1776677468404;
        Mon, 20 Apr 2026 02:31:08 -0700 (PDT)
Received: from [192.168.178.64] ([84.246.200.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm27158026f8f.28.2026.04.20.02.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:31:07 -0700 (PDT)
Message-ID: <3d6ec3f5-e33c-412c-b89c-09f657218c29@linaro.org>
Date: Mon, 20 Apr 2026 10:31:10 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] perf arm64: Support data type profiling
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Zecheng Li <zli94@ncsu.edu>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, leo.yan@linux.dev,
 Li Huafei <lihuafei1@huawei.com>, Ian Rogers <irogers@google.com>,
 Kim Phillips <kim.phillips@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>
References: <20260403094800.1418825-1-wutengda@huaweicloud.com>
 <55fde39f-36b4-44b4-bb9f-4179c6d2d066@linaro.org>
 <7c6754bf-c544-4c27-bf7c-71b989f75273@huaweicloud.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <7c6754bf-c544-4c27-bf7c-71b989f75273@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/04/2026 02:53, Tengda Wu wrote:
> 
> 
> On 2026/4/16 23:31, James Clark wrote:
>>
>>
>> On 03/04/2026 10:47, Tengda Wu wrote:
>>> This patch series implements data type profiling support for arm64,
>>> building upon the foundational work previously contributed by Huafei [1].
>>> While the initial version laid the groundwork for arm64 data type analysis,
>>> this series iterates on that work by refining instruction parsing and
>>> extending support for core architectural features.
>>>
>>> The series is organized as follows:
>>>
>>> 1. Fix disassembly mismatches (Patches 01-02)
>>>      Current perf annotate supports three disassembly backends: llvm,
>>>      capstone, and objdump. On arm64, inconsistencies between the output
>>>      of these backends (specifically llvm/capstone vs. objdump) often
>>>      prevent the tracker from correctly identifying registers and offsets.
>>>      These patches resolve these mismatches, ensuring consistent instruction
>>>      parsing across all supported backends.
>>>
>>> 2. Infrastructure for arm64 operand parsing (Patches 03-07)
>>>      These patches establish the necessary infrastructure for arm64-specific
>>>      operand handling. This includes implementing new callbacks and data
>>>      structures to manage arm64's unique addressing modes and register sets.
>>>      This foundation is essential for the subsequent type-tracking logic.
>>>
>>> 3. Core instruction tracking (Patches 08-16)
>>>      These patches implement the core logic for type tracking on arm64,
>>>      covering a wide range of instructions including:
>>>
>>>      * Memory Access: ldr/str variants (including stack-based access).
>>>      * Arithmetic & Data Processing: mov, add, and adrp.
>>>      * Special Access: System register access (mrs) and per-cpu variable
>>>        tracking.
>>>
>>> The implementation draws inspiration from the existing x86 logic while
>>> adapting it to the nuances of the AArch64 ISA [2][3]. With these changes,
>>> perf annotate can successfully resolve memory locations and register
>>> types, enabling comprehensive data type profiling on arm64 platforms.
>>>
>>> Example Result
>>> ==============
>>>
>>> # perf mem record -a -K -- sleep 1
>>> # perf annotate --data-type --type-stat --stdio
>>
>> Hi Tengda,
>>
>> Did you run this with any itrace options? If I run your command I get repeated blocks of duplicate stats and types, which is very confusing. One for each sample type that we generate decoding SPE.
>>
>> For example the default perf report output has all these groups:
>>
>>    Available samples
>>    0 arm_spe_0/
>>      ts_enable=1,pa_enable=1,load_filter=1,store_filter=1,min_latency=30/
>>    0 dummy:u
>>    3 l1d-miss
>>    18 l1d-access
>>    0 llc-miss
>>    0 llc-access
>>    0 tlb-miss
>>    22 tlb-access
>>    0 branch
>>    0 remote-access
>>    22 memory
>>    22 instructions
>>
>> Obviously there are 22 samples total (instructions) and they get duplicated into whatever other categories they happen to have flags for.
>>
> 
> Yes, I agree. The duplication makes the type stats misleading.
> De-duplication is definitely necessary here.
> 
>> To remove the duplicates you have to do --itrace=i1i. Could that need to be default for perf annotate with SPE?
>>
> I'll look into making this the default behavior for SPE data-type
> annotation.
> 
>>> Annotate data type stats:
>>> total 6204, ok 5091 (82.1%), bad 1113 (17.9%)
>>> -----------------------------------------------------------
>>>           29 : no_sym
>>>          196 : no_var
>>>          806 : no_typeinfo
>>>           82 : bad_offset
>>>         1370 : insn_track
>>>
> 
> Here are the results with --itrace=i1i (a slight decrease in accuracy):
> 
> Annotate data type stats:
> total 1138, ok 877 (77.1%), bad 261 (22.9%)

I'm still it a bit confused why you seem to get a 'total' count that is 
a sum of all the sample groups, if it went from 6204 to 1138 when you 
only asked for the instructions samples. Whereas I get separate groups, 
and asking for only instructions samples doesn't change the value for 
the last 'total', it just removes the other outputs.

It shouldn't change the accuracy either because the instruction group is 
the top level one which contains all of the samples.

> -----------------------------------------------------------
>           6 : no_sym
>          44 : no_var
>         197 : no_typeinfo
>          14 : bad_offset
>         238 : insn_track
> 
> This will be the new baseline, and I will work on further optimizations
> from here.
> 
> Best regards,
> Tengda
> 
>>> Annotate type: 'struct page' in [kernel.kallsyms] (59208 samples):
>>> ============================================================================
>>>    Percent     offset       size  field
>>>     100.00          0       0x40  struct page      {
>>>       9.95          0        0x8      long unsigned int   flags;
>>>      52.83        0x8       0x28      union        {
>>>      52.83        0x8       0x28          struct   {
>>>      37.21        0x8       0x10              union        {
>>>      37.21        0x8       0x10                  struct list_head        lru {
>>>      37.21        0x8        0x8                      struct list_head*   next;
>>>       0.00       0x10        0x8                      struct list_head*   prev;
>>>                                                   };
>>>      37.21        0x8       0x10                  struct   {
>>>      37.21        0x8        0x8                      void*       __filler;
>>>       0.00       0x10        0x4                      unsigned int        mlock_count;
>>>      ...
>>>
>>> Changes since v1: (reworked from Huafei's series):
>>>
>>>    - Fix inconsistencies in arm64 instruction output across llvm, capstone,
>>>      and objdump disassembly backends.
>>>    - Support arm64-specific addressing modes and operand formats. (Leo Yan)
>>>    - Extend instruction tracking to support mov and add instructions,
>>>      along with per-cpu and stack variables.
>>>    - Include real-world examples in commit messages to demonstrate
>>>      practical effects. (Namhyung Kim)
>>>    - Improve type-tracking success rate (type stat) from 64.2% to 82.1%.
>>>      https://lore.kernel.org/all/20250314162137.528204-1-lihuafei1@huawei.com/
>>>
>>> Please let me know if you have any feedback.
>>>
>>> Thanks,
>>> Tengda
>>>
>>> [1] https://lore.kernel.org/all/20250314162137.528204-1-lihuafei1@huawei.com/
>>> [2] https://developer.arm.com/documentation/102374/0103
>>> [3] https://github.com/flynd/asmsheets/releases/tag/v8
>>>
>>> ---
>>>
>>> Tengda Wu (16):
>>>     perf llvm: Fix arm64 adrp instruction disassembly mismatch with
>>>       objdump
>>>     perf capstone: Fix arm64 jump/adrp disassembly mismatch with objdump
>>>     perf annotate-arm64: Generalize arm64_mov__parse to support standard
>>>       operands
>>>     perf annotate-arm64: Handle load and store instructions
>>>     perf annotate: Introduce extract_op_location callback for
>>>       arch-specific parsing
>>>     perf dwarf-regs: Adapt get_dwarf_regnum() for arm64
>>>     perf annotate-arm64: Implement extract_op_location() callback
>>>     perf annotate-arm64: Enable instruction tracking support
>>>     perf annotate-arm64: Support load instruction tracking
>>>     perf annotate-arm64: Support store instruction tracking
>>>     perf annotate-arm64: Support stack variable tracking
>>>     perf annotate-arm64: Support 'mov' instruction tracking
>>>     perf annotate-arm64: Support 'add' instruction tracking
>>>     perf annotate-arm64: Support 'adrp' instruction to track global
>>>       variables
>>>     perf annotate-arm64: Support per-cpu variable access tracking
>>>     perf annotate-arm64: Support 'mrs' instruction to track 'current'
>>>       pointer
>>>
>>>    .../perf/util/annotate-arch/annotate-arm64.c  | 642 +++++++++++++++++-
>>>    .../util/annotate-arch/annotate-powerpc.c     |  10 +
>>>    tools/perf/util/annotate-arch/annotate-x86.c  |  88 ++-
>>>    tools/perf/util/annotate-data.c               |  72 +-
>>>    tools/perf/util/annotate-data.h               |   7 +-
>>>    tools/perf/util/annotate.c                    | 108 +--
>>>    tools/perf/util/annotate.h                    |  12 +
>>>    tools/perf/util/capstone.c                    | 107 ++-
>>>    tools/perf/util/disasm.c                      |   5 +
>>>    tools/perf/util/disasm.h                      |   5 +
>>>    .../util/dwarf-regs-arch/dwarf-regs-arm64.c   |  20 +
>>>    tools/perf/util/dwarf-regs.c                  |   2 +-
>>>    tools/perf/util/include/dwarf-regs.h          |   1 +
>>>    tools/perf/util/llvm.c                        |  50 ++
>>>    14 files changed, 984 insertions(+), 145 deletions(-)
>>>
>>>
>>> base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
> 

