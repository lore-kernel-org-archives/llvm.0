Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45016253358
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179191; cv=none; b=sXT54cMX3RNrW4KFxZIzjNaHFsRezT9YBzORqjYvUEn57PY5buqla0KN0GeUWnHcR/TT9oVpIOxRV0pDOqY0cMP7mv5tWd/E7e1bYcTyOrPTlJ3LGxwG4IvpUKU6KHO+5Dkzg7z5A/d8ht24NUWUgAfVE73ildi9wNxtJEzNtLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179191; c=relaxed/simple;
	bh=OuZVI2GLzoUKIi3pchVrqPyrM9O9b/wTFR5FJ2en3UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jI2KFUFNt8/Fw+Q3+fTiviL1fHOjL4kfYOyO6mLgyNFecvUEjOvqaUvwutlXoDEplUHG0QrTO/FgWfg0KzpvZXz2CJNUApbM6ZfHe9j+qsvI16k8jmiU979bHczb13u22JnOWuHvbIORuI+ovaaLZyXF9QRM8gi7fxjUKheLwos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVWtDF4o; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVWtDF4o"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3dcce361897so2031767f8f.3
        for <llvm@lists.linux.dev>; Sat, 06 Sep 2025 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179184; x=1757783984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJMKKvsr9aBhw2LBExeW27+96C2S4i1wtwzuhhQgIDI=;
        b=dVWtDF4oOT2B8Xo8TmuxuhxTpjr25P+5wAACzZjJ6dS4+mojBlFZDA6njaWRU6gSAd
         HV7rLORkq81pdhiucFlI7ViOy4ubWFzUUTLWUbylt/iMbrGx0gpQYKlfiZj/geWSy1gu
         TolJ3OBK8Yhpt4NFaVJYqAdVbnCflSjantpH50xKolVMydHZ3Er9nk0y517RKz4o28r+
         ZnuyeDXBrt9SYoztkniOhykS/fr7Hl7ruGAl/AM1FQnkXGnXcV1McZ47qx//hOsStw6h
         ZPLui1MU4Ur34LAXFivFnVTzz9nAoSljM4WUnCjfLivgudbrdyw5aJpuTYhbOhcX27K0
         +AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179184; x=1757783984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJMKKvsr9aBhw2LBExeW27+96C2S4i1wtwzuhhQgIDI=;
        b=R6C5qgb63Ied3s3MS+LLrQnm0a2yl3dIcoYOP1vMwW5MWGzKzRfep1Ww6KUh3KEDGW
         WAq7QWaEVuL8PW6ocXOAzqhX/Jgv9Q4NKYamuYAJNXNw5k5Sdtvicm82zzQcDxT4zUJO
         Y3nGPnNRFMhvS4rJKZaXU/bZ/zCpTMoN03ZXfVWbAywjNH3tywLlrPXCnf2wOWMM/orI
         8/8LnvQwToA/0MjYlZts4ECbe3aZ96caYt8xYrkbBg0PcR1PWHnJJYRHYabtiGAZlfki
         gTELilm0Ayz1GRGNauxQtEuyeaZ6OobjHWw5H0aXRGlpmpqV1zvDTegAQJUFfXITx4hD
         gHqg==
X-Forwarded-Encrypted: i=1; AJvYcCVEEx/Kr6sZWautr815Y+xKtbLaFmh+lwnv0EB1/8eWbS743ELIdCqbuX43v/RbFhUXKKFR@lists.linux.dev
X-Gm-Message-State: AOJu0YwEAkmZ2dHcsLyOF9hYOSFYbr00D1IuffsI6OiD596ylFkirtB0
	we/gLKnTvSrc3BTHa/Kjx2z4TdD0Q8+spwvPRfJt13nOEaEDMkWTrfKlfnti4H7DhiKxQ6kJkn8
	sHPJpHKkABmptvr1aVRmb40EyNEg+m9U=
X-Gm-Gg: ASbGncuf5xysE+vObGTbierQIlNokPfz/cv812sI404vOV1ksRx1sPaosWENpHmP0eb
	DRDbXu+mfr8OeHEppxLhYpGVaiDJhSvUnf7x4xOejn5SD0GoyYAhqWH3JyXmGNzZE8K2Dc7Pwpo
	7dE4Mt78bCe4/6eYNyy6uZI/IDuMJQcJn3nNkNG9afLor/ifE5fTqxlZykGk3o72EL16gApoYQR
	H0h2fgd
X-Google-Smtp-Source: AGHT+IEt1QBffRC3qCjFQkegXvZucxYLutWCtmj14Ka9sbWhzeDhlKSUm/6Exox7rMe+GxRha+OpSlfJGP8xa6Nz8LU=
X-Received: by 2002:a05:6000:2c0b:b0:3e0:37f3:7778 with SMTP id
 ffacd0b85a97d-3e64317d070mr1984874f8f.26.1757179184312; Sat, 06 Sep 2025
 10:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <3db48135aec987c99e8e6601249d4a4c023703c4.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <3db48135aec987c99e8e6601249d4a4c023703c4.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:19:33 +0200
X-Gm-Features: AS18NWARCvbmNO2W6P1AIa0UmJPeNw-mXWqtKJ3IgauS5o9YHYHKl3h4kKJN_64
Message-ID: <CA+fCnZd2824w610t86xQk+ykfv3EyAOvhb_OuXjru5e+jE4HTw@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] x86: Make software tag-based kasan available
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:32=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
> ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
> (TBI) that allows the software tag-based mode on arm64 platform.
>
> Set scale macro based on KASAN mode: in software tag-based mode 16 bytes
> of memory map to one shadow byte and 8 in generic mode.
>
> Disable CONFIG_KASAN_INLINE and CONFIG_KASAN_STACK when
> CONFIG_KASAN_SW_TAGS is enabled on x86 until the appropriate compiler
> support is available.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add x86 specific kasan_mem_to_shadow().
> - Revert x86 to the older unsigned KASAN_SHADOW_OFFSET. Do the same to
>   KASAN_SHADOW_START/END.
> - Modify scripts/gdb/linux/kasan.py to keep x86 using unsigned offset.
> - Disable inline and stack support when software tags are enabled on
>   x86.
>
> Changelog v3:
> - Remove runtime_const from previous patch and merge the rest here.
> - Move scale shift definition back to header file.
> - Add new kasan offset for software tag based mode.
> - Fix patch message typo 32 -> 16, and 16 -> 8.
> - Update lib/Kconfig.kasan with x86 now having software tag-based
>   support.
>
> Changelog v2:
> - Remove KASAN dense code.
>
>  Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
>  arch/x86/Kconfig                     | 4 +++-
>  arch/x86/boot/compressed/misc.h      | 1 +
>  arch/x86/include/asm/kasan.h         | 1 +
>  arch/x86/kernel/setup.c              | 2 ++
>  lib/Kconfig.kasan                    | 3 ++-
>  scripts/gdb/linux/kasan.py           | 4 ++--
>  7 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x8=
6/x86_64/mm.rst
> index a6cf05d51bd8..ccbdbb4cda36 100644
> --- a/Documentation/arch/x86/x86_64/mm.rst
> +++ b/Documentation/arch/x86/x86_64/mm.rst
> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unus=
ed hole
>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual =
memory map (vmemmap_base)
>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unus=
ed hole
> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
>                                                                | Identica=
l layout to the 56-bit one from here on:
> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unus=
ed hole
>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual =
memory map (vmemmap_base)
>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unus=
ed hole
> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory
> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
>                                                                | Identica=
l layout to the 47-bit one from here on:
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index b8df57ac0f28..f44fec1190b6 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -69,6 +69,7 @@ config X86
>         select ARCH_CLOCKSOURCE_INIT
>         select ARCH_CONFIGURES_CPU_MITIGATIONS
>         select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
> +       select ARCH_DISABLE_KASAN_INLINE        if X86_64 && KASAN_SW_TAG=
S

Do you think it would make sense to drop the parts of the series that
add int3 handling, since the inline instrumentation does not work yet
anyway?

>         select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE &=
& MIGRATION
>         select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>         select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
> @@ -199,6 +200,7 @@ config X86
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN                  if X86_64
>         select HAVE_ARCH_KASAN_VMALLOC          if X86_64
> +       select HAVE_ARCH_KASAN_SW_TAGS          if ADDRESS_MASKING
>         select HAVE_ARCH_KFENCE
>         select HAVE_ARCH_KMSAN                  if X86_64
>         select HAVE_ARCH_KGDB
> @@ -403,7 +405,7 @@ config AUDIT_ARCH
>
>  config KASAN_SHADOW_OFFSET
>         hex
> -       depends on KASAN

Line accidentally removed?

> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>         default 0xdffffc0000000000
>
>  config HAVE_INTEL_TXT
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/m=
isc.h
> index db1048621ea2..ded92b439ada 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -13,6 +13,7 @@
>  #undef CONFIG_PARAVIRT_SPINLOCKS
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_KASAN_SW_TAGS
>
>  #define __NO_FORTIFY
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index f3e34a9754d2..385f4e9daab3 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -7,6 +7,7 @@
>  #include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>  #ifdef CONFIG_KASAN_SW_TAGS
> +#define KASAN_SHADOW_SCALE_SHIFT 4
>
>  /*
>   * LLVM ABI for reporting tag mismatches in inline KASAN mode.
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..5b819f84f6db 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1207,6 +1207,8 @@ void __init setup_arch(char **cmdline_p)
>
>         kasan_init();
>
> +       kasan_init_sw_tags();
> +
>         /*
>          * Sync back kernel address range.
>          *
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f82889a830fa..9ddbc6aeb5d5 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -100,7 +100,8 @@ config KASAN_SW_TAGS
>
>           Requires GCC 11+ or Clang.
>
> -         Supported only on arm64 CPUs and relies on Top Byte Ignore.
> +         Supported on arm64 CPUs that support Top Byte Ignore and on x86=
 CPUs
> +         that support Linear Address Masking.
>
>           Consumes about 1/16th of available memory at kernel start and
>           add an overhead of ~20% for dynamic allocations.
> diff --git a/scripts/gdb/linux/kasan.py b/scripts/gdb/linux/kasan.py
> index fca39968d308..4b86202b155f 100644
> --- a/scripts/gdb/linux/kasan.py
> +++ b/scripts/gdb/linux/kasan.py
> @@ -7,7 +7,7 @@
>  #
>
>  import gdb
> -from linux import constants, mm
> +from linux import constants, utils, mm
>  from ctypes import c_int64 as s64
>
>  def help():
> @@ -40,7 +40,7 @@ class KasanMemToShadow(gdb.Command):
>          else:
>              help()
>      def kasan_mem_to_shadow(self, addr):
> -        if constants.CONFIG_KASAN_SW_TAGS:
> +        if constants.CONFIG_KASAN_SW_TAGS and not utils.is_target_arch('=
x86'):

This change seems to belong to the patch that changes how the shadow
memory address is calculated.


>              addr =3D s64(addr)
>          return (addr >> self.p_ops.KASAN_SHADOW_SCALE_SHIFT) + self.p_op=
s.KASAN_SHADOW_OFFSET
>
> --
> 2.50.1
>
