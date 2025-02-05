Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F8217733
	for <llvm@lists.linux.dev>; Wed,  5 Feb 2025 23:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799196; cv=none; b=eUOqt6en2vXoNUO4kxamMf0FtKxpW3fbSwh4+8Iled3HNSYD5nEcR5cn8Lpat1Ei1YnbSLwGniJGNtbm/RKusY5xSKuljFI8OCxNserxaGK3r+HwFbThpXL1dw/VKRVbHYxrvTgw9KhBQiKN0zssnNSkuQgkvUF117LmfRIQGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799196; c=relaxed/simple;
	bh=HAN5lns6QbH/dk+ZI5/Icr84qs9daziEv9NLfcbDTVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7VDHN/iM6ftosMjGi77pYu9mjEILZvKAPGwaSinSBwiirfig1KCyD7GQ4zQuIo0h1WiMM5QQSwrhiJy+hSOvqMUmzdD5vqr1wIvRg73N4tGqtNT/VfiqJwEjyNSXZI0+TSzDdRR+UF8OBH2EBibjlbk3/t2ZwV/qOCH8gdYkGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuVPq3lr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuVPq3lr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso1869115e9.2
        for <llvm@lists.linux.dev>; Wed, 05 Feb 2025 15:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799192; x=1739403992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=splJksFz56TDIrwwM0xZxaI8hN1W91tSLAlTGFboN5c=;
        b=WuVPq3lr130BRGxM4YwIZvqV0qowEQZZ+aK+taMVTvznbA0J5d272NBn5228tnOkTg
         od4U8FybMMbl5MbD66tseYw0cMPCgn1lrNN8fWa3J3aVZ/seGfy15CRQlq4zN9YwMaTE
         cgpr6Hf89o2a+zgt57ZLlki47nhA0Wk+grCfji4SuC0ISKv3st28J54ZZ8Y7kNvyJJ2u
         hw21J1y6lOytg/NGvT5Q6FSGPZGTSRvBpzSHfnYaeRs2fyGJZ4tpHcttrbcdre2Y/gVP
         e4gZrF4fc9K5Y053N09bGEOQ4MSLiePI49V1Jt8P2jnwRTIp0j2o/sxzhnzANriarHb4
         wS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799192; x=1739403992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=splJksFz56TDIrwwM0xZxaI8hN1W91tSLAlTGFboN5c=;
        b=CDqGyLVmfg9EvLuTj7hCFjGdGkeN+rs8RoFSu0XwZZvPXQ6/rIP9zojfpgJAoRETag
         jb0dIelLnf4FFnFWaOAQIaDRmJdv7YQbCcZH1RBFAoUhXWXmVbu1RzX/SOCntIk8caHT
         ikW5ODFL1xuR5r+SEzKmWKWkqD0T0zqzMv0zavywN15tLrT/s+MUVRxWSJA2qoYg/Sqa
         hdc+u8WSZJCPPhDoqH+nK6BjTP4e6fbah+FfzRuUQJ1UIqFA1sfZNvkv7P1EcFhv9aDc
         to0l67Ohvvd4Jy2nPy5soH9zu/W2YThknyW1q7CqgxKgudU1cMQQ+CN8wrA1oLOoWKyK
         /sKg==
X-Forwarded-Encrypted: i=1; AJvYcCWh/EnFh/uyJAnZO+pwIovB5t5lTx/jOZv0OY3jkC4KTdoukBzTKyt7EK+KFLT4coe72gz2@lists.linux.dev
X-Gm-Message-State: AOJu0YxEWHdsOZmeeq6J8xvgurTpM+n7wLVwZy9FOe8OJZ+YSYXwofJh
	NzsROEQ8qssv5rnO9LBM/MMziIVb22DfwtUIKtI1KbgpznvGQWZk8vWUv7eKMoBZbnhvFSEyvNN
	9FEQqf6MJR+7c+xL/niriz84PWuw=
X-Gm-Gg: ASbGncuotmzHiWjJ8r6ZIUT13B45PmcbMqbraH4OcisIp15pG+ZcvWhHDwLgZ/hv9NK
	hKMUm8sV3EAJaY9+IWKHtetSEbotxHJb2hMt9YuPxskrp9je9j5S4If3YrvpSn1DCi9TkrlVQYQ
	==
X-Google-Smtp-Source: AGHT+IFSFHWVEoOQLLmJ+PaOxc/EbVSarQ3d2dwZcdG6PEJNBpkGd7CO8NPniQu76duw1X2UJRbhBv8DnKzYKrkcERY=
X-Received: by 2002:a5d:64af:0:b0:38a:518d:97b with SMTP id
 ffacd0b85a97d-38db4858781mr3265952f8f.11.1738799192252; Wed, 05 Feb 2025
 15:46:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:46:21 +0100
X-Gm-Features: AWEUYZmWa4puMe4djsB8DuAJDHlgw8tfTIgkGA6kMcFx6SJvTthEfUEqJBWFe6Q
Message-ID: <CA+fCnZcG0nv1_ezc+yu3Wj_7iS0r_QfK9OcDnK-MRmJ=BF4iJg@mail.gmail.com>
Subject: Re: [PATCH 15/15] kasan: Add mititgation and debug modes
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:37=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> With smaller memory footprint KASAN could be used in production systems.
> One problem is that saving stacktraces slowes memory allocation
> substantially - with KASAN enabled up to 90% of time spent on kmalloc()
> is spent on saving the stacktrace.
>
> Add mitigation mode to allow the option for running KASAN focused on
> performance and security. In mitigation mode disable saving stacktraces
> and set fault mode to always panic on KASAN error as a security
> mechanism.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  lib/Kconfig.kasan | 28 ++++++++++++++++++++++++++++
>  mm/kasan/report.c |  4 ++++
>  mm/kasan/tags.c   |  5 +++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index d08b4e9bf477..6daa62b40dea 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -244,4 +244,32 @@ config KASAN_SW_TAGS_DENSE
>           ARCH_HAS_KASAN_SW_TAGS_DENSE is needed for this option since th=
e
>           special tag macros need to be properly set for 4-bit wide tags.
>
> +choice
> +       prompt "KASAN operation mode"
> +       default KASAN_OPERATION_DEBUG
> +       help
> +         Choose between the mitigation or debug operation modes.
> +
> +         The first one disables stacktrace saving and enables panic on e=
rror.
> +         Faster memory allocation but less information. The second one i=
s the
> +         default where KASAN operates with full functionality.

This is something that I thought about before and I think we should
_not_ add configuration options like these. The distinction between
debug and mitigation modes is something that's specific to a
particular user of the feature. Some might prefer to take the impact
of having stack traces enabled in a production environment to allow
debugging in-the-wild exploitation attempts. Also at some point in the
future, we will hopefully have production-grade stack traces [1], and
this would thus change the desired behavior of
KASAN_OPERATION_MITIGATION.

We already have the kasan.stacktrace command-line parameter for
disabling stack trace collection. On top of that, if you prefer, we
could add a configuration option that changes the default value of
kasan_flag_stacktrace (but can still be overridden via the
kasan.stacktrace command-line parameter). Note though that by default,
stack traces should be turned on.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D211785


> +
> +config KASAN_OPERATION_DEBUG
> +       bool "Debug operation mode"
> +       depends on KASAN
> +       help
> +         The default mode. Full functionality and all boot parameters
> +         available.
> +
> +config KASAN_OPERATION_MITIGATION
> +       bool "Mitigation operation mode"
> +       depends on KASAN
> +       help
> +         Operation mode dedicated at faster operation at the cost of les=
s
> +         information collection. Disables stacktrace saving for faster
> +         allocations and forces panic on KASAN error to mitigate malicio=
us
> +         attacks.
> +
> +endchoice
> +
>  endif # KASAN
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index ee9e406b0cdb..ae989d3bd919 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -47,7 +47,11 @@ enum kasan_arg_fault {
>         KASAN_ARG_FAULT_PANIC_ON_WRITE,
>  };
>
> +#ifdef CONFIG_KASAN_OPERATION_MITIGATION
> +static enum kasan_arg_fault kasan_arg_fault __ro_after_init =3D KASAN_AR=
G_FAULT_PANIC;
> +#else
>  static enum kasan_arg_fault kasan_arg_fault __ro_after_init =3D KASAN_AR=
G_FAULT_DEFAULT;
> +#endif
>
>  /* kasan.fault=3Dreport/panic */
>  static int __init early_kasan_fault(char *arg)
> diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> index c111d98961ed..2414cddeaaf3 100644
> --- a/mm/kasan/tags.c
> +++ b/mm/kasan/tags.c
> @@ -78,6 +78,11 @@ early_param("kasan.stack_ring_size", early_kasan_flag_=
stack_ring_size);
>
>  void __init kasan_init_tags(void)
>  {
> +       if (IS_ENABLED(CONFIG_KASAN_OPERATION_MITIGATION)) {
> +               static_branch_disable(&kasan_flag_stacktrace);
> +               return;
> +       }
> +
>         switch (kasan_arg_stacktrace) {
>         case KASAN_ARG_STACKTRACE_DEFAULT:
>                 /* Default is specified by kasan_flag_stacktrace definiti=
on. */
> --
> 2.47.1
>
