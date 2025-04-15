Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422F275108
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701244; cv=none; b=FeTeZjEb5X7WFMGhyd2anIsU1zMMs0LwJwPNcLu41EoDWRfAw6AXrg+cLq8VsLCkfuSpZlHQMQFrSP6Xgg3mfkqKOjTdOXkl6nODgX2PD7ITdpJUbrYIFAqnU2UNZ3qb+/iuXfOVk/N3ChuUJjwP+sPkoB0vmw6RCIElGqAcfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701244; c=relaxed/simple;
	bh=hcLPhfxenRnvO2U6OAAPVSctWKDdhcd6fkpJdxhI3xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKsZV/YE45I4RD4KBv4qF1jtp4dJvZS53O64rmXOjiIm37C9HQJ8RRBQFx52gDS8XxyZLGIo8AhRIwgDNxn0mB4BPA7UHXh5RzJtwOgLuIKYllUKjGVJ7NH0dtnOlccGEFl8tCPiURlBCyrarGije1/bEz0SLee4QFFppcsOmVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XmvIWm3R; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XmvIWm3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744701233;
	bh=HmPsfRmAPmNXzJi9Xx7CUeeH3IbUJeikFdzI0teQOag=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=XmvIWm3Rgx2JcNPbvxxmiDT0PjjP5c7tky8OQrMAJU1q6PtbLe4FXre9Xhvj4lCKW
	 I5f/9+odpVjajFFaCDLvlR49gwOkgWD+BUATLbK8MVOSN4B9B6xZmA48rpIT4moUMb
	 6G9t62a9+j9807kqCD1diBRrkANLma08RJhyLGus=
X-QQ-mid: zesmtpsz5t1744701229t5a9a8731
X-QQ-Originating-IP: bCIcMY6qwlKqPGDrs2NLkrBwKWL1WOuBonmbyr32P6Q=
Received: from mail-yb1-f180.google.com ( [209.85.219.180])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 15:13:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6713350526972272955
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e6582542952so4101916276.3
        for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 00:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuZrk9V/6WGiUhL11LKNRxBPQDNYePXMIHNmTD0Stt1u4DfGOmeeii6aQJXQB/86nNNQci@lists.linux.dev
X-Gm-Message-State: AOJu0YztkInTnRsatsU9BO9l8Skegrc3gAsaGmvhXEZFgbuyxVJrGyJJ
	F19SR4761irPCrXLDNKiZiA/O1q4bUCQBJW5x1Mfrgizc7YuJkjZslC71zcmuE4UGVi+zJI5pjw
	jZwoP+pgJ30XSDhmzQvThbS2HN0k=
X-Google-Smtp-Source: AGHT+IEHwgvmHQkHmDgMlzvWPPgWIS0QJhl8XByWGSmXFpzp63NMw9b1uL3nCEc2EUX40kluM5VlaWS/voVwS2L2B38=
X-Received: by 2002:a05:6902:228b:b0:e6d:e70f:dbed with SMTP id
 3f1490d57ef6-e704de8d4admr24101805276.16.1744701227015; Tue, 15 Apr 2025
 00:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com> <69F64A6F8DE504F5+20250411105459.90782-7-chenlinxuan@uniontech.com>
In-Reply-To: <69F64A6F8DE504F5+20250411105459.90782-7-chenlinxuan@uniontech.com>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 15:13:35 +0800
X-Gmail-Original-Message-ID: <31560F16E64472CA+CAC1kPDNtOAj8qi2mu7ehMLW4KWf+2cSqKt9ahL-fW7J-Fs4f8g@mail.gmail.com>
X-Gm-Features: ATxdqUGyoXiKBtkF46dLOBtNFE2b1W790LkV75qLDVk-33ax-fPFaX8poZnDK4o
Message-ID: <CAC1kPDNtOAj8qi2mu7ehMLW4KWf+2cSqKt9ahL-fW7J-Fs4f8g@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Winston Wen <wentao@uniontech.com>, 
	Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: ODO7gCA19e1Ng2i2lVdm33mamxFdR9WXiKDPuM3f2V7fbUbtsfgQ0NfM
	WhBaqPfynHZswfw/25A+04TDaWaVFoW6SJ4L3hTSIxJoyFddvVN+AFR3IODN7P6D5reNdgA
	cVoZpoIXRqcB50yNWkV1LTJ2RLrPFF3jwn0m9ZFQIH4abWZq6HECuXaQ/f1rb/MT9354bha
	54e42xSc9Nq4ebJ+dkZ1DxL+J/izHPnCEPohni9jWcNu8RvtxQ5dZ2Iic5wuINkK8s/LS7c
	Z1cpUw2ixz9K+k4mLbaHpNpgGFXecDt3qiaF2Z/zi+uQpdjcWaqsAiHBWp66dbj8GMdkM04
	e03PzSOHwoUQXoymtCsaSJTXwdO9OIo9IOTSJiWHKgjejMW1zJwBgYtE2ITspfJi37SN8r4
	O8D1nSqywFHiYkulDLZG2f7B9rD5I6kN6SWuzi53GXYIl0sHK6qaKUjuy6NsBhWEF63qajo
	OfB1UF6OlzhzN2gZPDW13HmIwaV/2GPan0l3rTHy50hdjeUPMxC4UntDvdTBmFSaQzR1YLu
	CE+b2cdSK7bIS2tfupWCzSWzoqLDnyy16FdX2EofK0pgYoBRrHSEiZ5/lHIs9ADBwOj4NUw
	bU3fE1j1EaaPitr/iVH7wEJh3E4+y7kTW7U2dmB+Jl3FGdk8QCH4Zpb6qOP/FzoMMenvJBz
	Wh+MQhVXZE4CuLOcV2Ud1eckvmNTXbGGcNjqDtPIEPxXBrjsTDnasDIthe/6CMykixv7fA2
	iizX2FmFbHnobjFa2FYCY14PTfxkyYxTSIeZ08nJLcw3o6eKNA63h4k3wxwKgm3ccDRdyLl
	1PN+BhVZAVJMFjgBLnHXvuvxBK9OnJJRiF9G4hwkfPT3dAX1KAnokK/lfj3PHF5+wi4VF9x
	K8iGhv+y9Tz8B5l1pn11M/Fa18v5a8jwkG7gVsxDw43yY+RyXDc8ei71D5EekMjTfJVOBL5
	ptZ2NH3QWYugQMZh/D+HRVNRLqadt52OcWc0mtp86Tff/z4c0o9wuUrD11s4Q9smAfYV0wl
	ZXQaqFP4v6aPBohnvwFaYTR+2gJT4PxkhSD5nbsw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Chen Linxuan <chenlinxuan@uniontech.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8811=
=E6=97=A5=E5=91=A8=E4=BA=94 18:56=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Winston Wen <wentao@uniontech.com>
>
> Add a new kernel hacking option CONFIG_NO_AUTO_INLINE that prevents the
> compiler from auto-inlining functions not explicitly marked with the
> 'inline' keyword.
>
> This enhancement improves function tracer capabilities as it can only
> trace functions that haven't been inlined by the compiler.
>
> Previous discussions:
> Link: https://lore.kernel.org/all/20181028130945.23581-3-changbin.du@gmai=
l.com/
>
> This patch is modified from 917fad29febd ("kernel hacking: add a config
> option to disable compiler auto-inlining") which can be founded in
> linux-next-history:
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
-history.git/commit/?id=3D917fad29febd
>
> Unlike the original implementation, this patch:
>
> 1. Make it depends on CC_IS_GCC,
>    as Clang 18.1.3 break test_bitmap_const_eval() in lib/test_bitmap.c
>
> 2. Make it depends on X86_64,
>    as I haven't test other architectures

LOONGARCH has been tested, too.

>
> 3. Removes unnecessary cc-option checks per 7d73c3e9c514 ("Makefile:
>    remove stale cc-option checks").
>
> 4. Update help information.
>
> Cc: Changbin Du <changbin.du@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Winston Wen <wentao@uniontech.com>
> Co-Developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
>  Makefile          |  6 ++++++
>  lib/Kconfig.debug | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index f42418556507..0a9bf33ce75f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1071,6 +1071,12 @@ endif
>  # Ensure compilers do not transform certain loops into calls to wcslen()
>  KBUILD_CFLAGS +=3D -fno-builtin-wcslen
>
> +ifdef CONFIG_NO_AUTO_INLINE
> +KBUILD_CFLAGS   +=3D -fno-inline-functions \
> +                  -fno-inline-small-functions \
> +                  -fno-inline-functions-called-once
> +endif
> +
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
>  KBUILD_CPPFLAGS +=3D $(call cc-option,-ffile-prefix-map=3D$(srcroot)/=3D=
)
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9fe4d8dfe578..2ebb4802886a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -436,8 +436,23 @@ config GDB_SCRIPTS
>           instance. See Documentation/process/debugging/gdb-kernel-debugg=
ing.rst
>           for further details.
>
> +
>  endif # DEBUG_INFO
>
> +config NO_AUTO_INLINE
> +       bool "Disable compiler auto-inline optimizations (EXPERIMENTAL)"
> +       default n
> +       depends on CC_IS_GCC && (X86 || LOONGARCH)
> +       help
> +         This will prevent the compiler from optimizing the kernel by
> +         auto-inlining functions not marked with the inline keyword.
> +         With this option, only functions explicitly marked with
> +         "inline" will be inlined. This will allow the function tracer
> +         to trace more functions because it only traces functions that
> +         the compiler has not inlined.
> +
> +         If unsure, select N.
> +
>  config FRAME_WARN
>         int "Warn for stack frames larger than"
>         range 0 8192
> --
> 2.48.1
>
>
