Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C6197509
	for <llvm@lists.linux.dev>; Thu,  6 Jun 2024 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689068; cv=none; b=fJdNe1/rGZNrviMjnHb7OGHRAS0uJJQtHAG1Cmqk5gU5zPKDCq1hInq5fUC7nt4Dbd00bVTP1wFeIjYnrsW4SvXetlupz9ct2BBI5RW0jZsoE/pmedHjxThUJBIntS9vhDnQsnZ2aSSGXGL8u763mCakBtwlMDUpyJOcFaFcm60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689068; c=relaxed/simple;
	bh=adIEv1ABiv2Y/+wtwJ0SEGkRWG7wXeRgEZiP/ll5KEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxl/8mwHk7tJnPa57fIYiMTyNtLdfpUWrLpnplTcb7Ga9q+Bc7n2InWWslwN2Xm/fy/NqtE5RKmGiWbKb3ozJdo4NmiwR2mz/KPKxO1LRLxIxNKgQPv+n/eKbtQ9/1/ZIVHZ3j36d2G4MEG+oKmtKKQi3wgUn/ZwXyilxjiTCUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=toyMQmcF; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="toyMQmcF"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2c1a9b151bcso902695a91.3
        for <llvm@lists.linux.dev>; Thu, 06 Jun 2024 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717689066; x=1718293866; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDmlKGnxhvteIYdGoZUuN1H/FeEZVR1GpReejN7otNE=;
        b=toyMQmcFpAe5yPKqvr1J6mzDGsXfWyb3LszYvRV/UotTpKVI/czHD03rrbLL0iPlto
         tlJLIO3Kkw5cFY/FDAHTixaOtUAavWE/q2exf9WZIML1O5jyQTkYIgwXhOc1gKdmEls1
         iZaiGj/kYbls7rOFlPZLmsR8pgkHGy4xkwnrzK1nJRcUVXXULfK/rHrf2PcsvBcEpN3V
         ovmfA3e3AVsLoWwBHbMLurZ1cVpnrngm+XtRw93MlAmxXoqhQfgNk7nJEHukDjQ4vVRF
         CKwARivSQ7MgCK4ZDwFFQKjYkwe7HU6GYTpg15q2TVQgJDUIyak/oO58BrL9qLXtL6oo
         CFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689066; x=1718293866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDmlKGnxhvteIYdGoZUuN1H/FeEZVR1GpReejN7otNE=;
        b=ZkDafhRwkuzQRJDLUThcwSrUUn1GwL8yxeA8YfJPLKI07OcUnzg46E1I/gqxXx/noc
         JTuGQWBFJg5l5BPiMvtB8CWJxB6K9Oga/R5KcvHkaHrsZbXbcFTJ297twrV9HX0bXhfs
         uGbVBWaoVikuXR21LGVEb7Q6tFolnwYn33rjr6CrLH06OufxmxcIEd143EU7SJgT+QPd
         UlBNH7dUOdKMQpy6JbljkSqC5NB4XcsEaMODU3pk9qhIrGWnsdHEQTIKfhWvq4olQyaR
         sQ7c0qSaZr/HL2C3dFqJiAJTtYXW0XKDnz8FTcFYOO81L68+GImHawMx0wirltH908ye
         hKKg==
X-Forwarded-Encrypted: i=1; AJvYcCUT3qAvNpDv9c4OHLUc+LIbELQYmo3J3rMrTG730CYhSwR1s3Zo/+6GTBrJaS+8zlXJGTae5P8/0QPF+UdzNMlYSpKiuA==
X-Gm-Message-State: AOJu0Yzhk5o2nOVa/fz4Rlw5tQnqY0+7KY9bI1YGNxmejuxbT4vB9I8p
	eQ56/1Yck0FkFyFH7kG0vH0Tkvah96B9ojwww0C20j1LpiqCvDOcLybKM6HHhN8=
X-Google-Smtp-Source: AGHT+IGDNf+n2WEFOQ3uys+exa6v8+p9xOEthb5+b/G77zFZwY+Wcx90+vRsnhUCfmsd12xUa2qWiA==
X-Received: by 2002:a17:90a:9ac:b0:2c2:5341:7ed6 with SMTP id 98e67ed59e1d1-2c27db58f5dmr6165630a91.38.1717689066272;
        Thu, 06 Jun 2024 08:51:06 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28063a7fcsm3756281a91.7.2024.06.06.08.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 08:51:05 -0700 (PDT)
Message-ID: <bd3b89cb-07fc-4b9f-9f10-9b0f3664ec5e@rivosinc.com>
Date: Thu, 6 Jun 2024 11:50:56 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Zong Li <zong.li@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <CANXhq0pYNWvMxkkNPpYW4OrOXK19Rehdy3yO8u1sforyVjdTZg@mail.gmail.com>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <CANXhq0pYNWvMxkkNPpYW4OrOXK19Rehdy3yO8u1sforyVjdTZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/5/24 00:51, Zong Li wrote:
> On Sat, Jun 1, 2024 at 12:23 AM Jesse Taube <jesse@rivosinc.com> wrote:
>>
>> Dectect the Zkr extension and use it to seed the kernel base address.
>>
>> Detection of the extension can not be done in the typical fashion, as
>> this is very early in the boot process. Instead, add a trap handler
>> and run it to see if the extension is present.
>>
>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>> ---
>>   arch/riscv/kernel/pi/Makefile           |  2 +-
>>   arch/riscv/kernel/pi/archrandom_early.c | 71 +++++++++++++++++++++++++
>>   arch/riscv/mm/init.c                    |  3 ++
>>   3 files changed, 75 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
>>
>> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
>> index 50bc5ef7dd2f..9025eb52945a 100644
>> --- a/arch/riscv/kernel/pi/Makefile
>> +++ b/arch/riscv/kernel/pi/Makefile
>> @@ -32,5 +32,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
>>   $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
>>          $(call if_changed_rule,cc_o_c)
>>
>> -obj-y          := cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
>> +obj-y          := cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
>>   extra-y                := $(patsubst %.pi.o,%.o,$(obj-y))
>> diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
>> new file mode 100644
>> index 000000000000..311be9388b5c
>> --- /dev/null
>> +++ b/arch/riscv/kernel/pi/archrandom_early.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * To avoid rewriteing code include asm/archrandom.h and create macros
>> + * for the functions that won't be included.
>> + */
>> +
>> +#define riscv_has_extension_likely(...) false
>> +#define pr_err_once(...)
>> +
>> +#include <linux/types.h>
>> +#include <asm/hwcap.h>
>> +#include <asm/archrandom.h>
>> +
>> +/*
>> + * Asm goto is needed so that the compiler does not remove the label.
>> + */
>> +
>> +#define csr_goto_swap(csr, val)                                                \
>> +({                                                                     \
>> +       unsigned long __v;                                              \
>> +       __asm__ __volatile__ goto("csrrw %0, " __ASM_STR(csr) ", %1"    \
>> +                                 : "=r" (__v) : "rK" (&&val)           \
>> +                                 : "memory" : val);                    \
>> +       __v;                                                            \
>> +})
>> +
>> +/*
>> + * Declare the functions that are exported (but prefixed) here so that LLVM
>> + * does not complain it lacks the 'static' keyword (which, if added, makes
>> + * LLVM complain because the function is actually unused in this file).
>> + */
>> +
>> +u64 get_kaslr_seed_zkr(void);
>> +
>> +/*
>> + * This function is called by setup_vm to check if the kernel has the ZKR.
>> + * Traps haven't been set up yet, but save and restore the TVEC to avoid
>> + * any side effects.
>> + */
>> +
>> +static inline bool __must_check riscv_has_zkr(void)
>> +{
>> +       unsigned long tvec;
>> +
>> +       tvec = csr_goto_swap(CSR_TVEC, not_zkr);
>> +       csr_swap(CSR_SEED, 0);
>> +       csr_write(CSR_TVEC, tvec);
>> +       return true;
>> +not_zkr:
>> +       csr_write(CSR_TVEC, tvec);
>> +       return false;
>> +}
>> +
>> +u64 get_kaslr_seed_zkr(void)
>> +{
>> +       const int needed_seeds = sizeof(u64) / sizeof(long);
>> +       int i = 0;
>> +       u64 seed = 0;
>> +       long *entropy = (long *)(&seed);
>> +
>> +       if (!riscv_has_zkr())
>> +               return 0;
>> +
>> +       for (i = 0; i < needed_seeds; i++) {
>> +               if (!csr_seed_long(&entropy[i]))
>> +                       return 0;
>> +       }
>> +
>> +       return seed;
>> +}
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 9940171c79f0..8ef1edd2cddd 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -1025,6 +1025,7 @@ static void __init pt_ops_set_late(void)
>>   #ifdef CONFIG_RANDOMIZE_BASE
>>   extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
>>   extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
>> +extern u64 __init __pi_get_kaslr_seed_zkr(void);
>>
>>   static int __init print_nokaslr(char *p)
>>   {
>> @@ -1049,6 +1050,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>                  u32 kernel_size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
>>                  u32 nr_pos;
>>
>> +               if (kaslr_seed == 0)
>> +                       kaslr_seed = __pi_get_kaslr_seed_zkr();
> 
> Could you elaborate on why we try to get the seed from DT first,
> rather than from ZKR? 

The ordering preference doesn't matter to much,
but my thought was if someone wanted to set a seed they could override
the Zkr provided seed. Alexandre said privately to use the DT as a
fallback rather than the way we have it now.

> Also, I was wondering if, by any chance, it can
> leverage arch_get_random_seed_longs() to get the seed instead of
> __pi_get_kasler_seed_zkr()? Thanks


arch_get_random_seed_longs() is almost equivalent to
__pi_get_kasler_seed_zkr()
in the sense they do they will both use Zkr for entropy
if its accessible.

The problem is that we are very early in the boot process so the check 
arch_get_random_seed_longs uses to detect if Zkr is present 
(__riscv_isa_extension_available) is not set up yet. This is why 
riscv_has_zkr is used to check if Zkr is present. Unfortunately, which I 
didn't realize is that how riscv_has_zkr works isn't a valid way to 
check if Zkr is present.

The only solution seems to be parsing the ISA string from DT and ACPI.
The hard part is parsing ACPI this early in boot.

Thanks,
Jesse Taube

> 
>>                  /*
>>                   * Compute the number of positions available: we are limited
>>                   * by the early page table that only has one PUD and we must
>> --
>> 2.43.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
