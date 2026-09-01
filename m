Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731412DB788
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299122; cv=pass; b=El2sbfzDGjpX8hS8Lp9qQF99VCndFF020MILdhB1kSMo+t8GnSnOSu5Zrrnu93BCZ4pDqSmLhhTQrZ3CLMHm84cJp+/N6ucAidtnC19gtXdVEA8u1GzEMlcnKB613rdAmTUtWu8PdqJd0ByzvGJXSzBgkQGwRq8oAzZ5EBKeAhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299122; c=relaxed/simple;
	bh=ywHIx/tXiCmtCZoDEckTSBG98GZ7RVOV9Q7zo0qlC7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGXGiYhNQoC4eljBZ6SrzeKrOVp0Td/SNu9L8EL3K3ascSzaU2jFW/iThaJYJ1K+JxVP8F5sGo1nM/Vfp+5iArPimvkN5p3Vd0/Eadx7FZKOZsP5UZAe/WAX7GIhrcsnXeBtVZGc2IxPwG820pqEehLksFxKrRMsnX7pH1CD5Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KZDVMoUT; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KZDVMoUT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso2289355e9.0
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 14:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788299119; cv=none;
        d=google.com; s=arc-20260327;
        b=cYmUEXeBTTn/M1sqkoNIA5drbv82fIdOrGz9itVOMd+koZ1nr7f1fia38MtSEJJqXm
         ujIaeFtPka0cUv9Fm91DZMKAst0aIWPDFklBYbbaBQGLDdtwqUCgubKnxpvCt96UGKwS
         BTk7kaCdk1u/Z7OG0GTo2KC8p94qdIT6j6fkb2T2+dHmUxfROt9+89O9q9rxaD32QLKZ
         l62w9WUcXvcvrQyvw+THKPV0JQpHOAQnF3MHC53QFOwT6xejK2AaOtK0uYjcFZ+U7D9A
         K6SWsgYo1UurdUrWmelHkDhXmoBxVbv6rATkwaNEkdb7tNnhjXH90IKg3VkxWfMUqqjn
         J3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cgiBuN8pwAqtwrYzI+JS4k8m7KC3ziuw/j4zEg8Z38=;
        fh=0Ssr+MZ4kp6qCgEWIrHhBUeNuqngPh00TehHG6baxZg=;
        b=ia8YuBOassFOQtrWkF+zkiB1h9Zb5dQw1Oh1TwVMA9xQjLxGyWPdG15nSBpgct9WBo
         IP1VT/2JrnXnED6n+4S/Xjlj8Nr++zTrnty1jvaD2TvN+s/7lZ0rTpNrg7kyxOrvFLRD
         GBI92iIR9nFAT6ISueDxmxOwqKJPROdhiWyVC2/AGaacJRfxinVxUYoxIAonWdqEvhx9
         Pm7ISTVr3zlHHqmx4XsSSRgEVQ55/b7q9zwUQchZXE0A6RtVpIQ2OuRnvK6/1MXkackX
         ykW1ydGvRXl7V6/Cm+B6fH7LoOVAXH5COvRQCFyqPc885PbPBwqXFr9/sMc9QgbdOsuk
         kVZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788299119; x=1788903919; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+cgiBuN8pwAqtwrYzI+JS4k8m7KC3ziuw/j4zEg8Z38=;
        b=KZDVMoUTtP/F3ayOKrUNqCvmoltdpoLZ03Eu+YugS7vwhid7R2kRF/FqKOvtsmhOVq
         L6GzNSRzAiOlsxbb5hZ2PHXCzvmisc1ITmCDdJINTt6XArQNkFrKs8Y04Q0/huiaOK7N
         /M1tYH6C99w17Xh7opsqxTdTmMFdksFsMaTSJxMOICX8E6cRDi6xB2XNzQaeZ+bB54G9
         sdHEfQRZzTIWHFF5eDUQ2JXCzbb+sTiFoXeRPyFOpQT00ntPrXlsKLjq4SDilPGQ4j5r
         dEy9b1tnzt/4RQ/mauTZU494jYO3uQFr6Sb0F+ISxxKwt6WewgS1L5uKigq9ordtD1FM
         0RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299119; x=1788903919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cgiBuN8pwAqtwrYzI+JS4k8m7KC3ziuw/j4zEg8Z38=;
        b=jIqFhd7/QRME5TO/QbLiS1PrkQw4f6GYSKey3r7oYw5RWoCcEqHCTbzXvR2NHzEa+6
         aRA7TytoweqgLMalwtmads2GEK38MMx4OKYvseaLHaO8cvj09v9revE5sE9TYeo7HOVu
         nF5NSu8HHc9pmrumcvAgUQQFcOsO+H79S16Rf7j3JKnvLlGglAIYP5FKOYFgoRZqO/38
         edg3eJrOjbyPeZMQ6aLQhHJNftoVfxfrIlSrPEvvGI09awxzpAtlUg6io23tp/moB5Wl
         zNjG+mtfngbI/Pe5M5/QRJWLLLolhGPaGJOq3s7n//9TXceJQ/CWmZLtSL0d1ATrgk28
         2S+Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro1AaKxHSQiuJb3iOM8fmwFCKyzw06d9ywkSX9FgMMom89GBIZfKjlXha84/C834BdN94aR@lists.linux.dev
X-Gm-Message-State: AFuF++n8oqKBht27m+7v/vJYehqmyCLG7niSi28FkZhVD74wD4fxKjms
	aod3VaxmTXcJXZFGBWXv/rf3qeg3KHX+tpo6NEONfdHOJ1fLr8ZqnwTsVq8rHhVPFND2P2fQuu/
	OB69DD4K54rPxOyofrYdNiYUb67yvWl4E35y89kYB
X-Gm-Gg: AR+sD137lEzBC5KSBYrYEpdtsU34+24EgQ44iUMBtME1y7PjdbBK2dpJN3em2v+zedv
	SlM2aPoavaUjxJsEjfM6DiTgHGgTK+LRttCUrxgtloYt+Fgyt6smPoWhxsv0FR6FOivnl6vcvqW
	/niBDsUjwivjRKyLTATcXTdMBoVd9BtiGiFM6zFp1NSwFXr5cXdmaOM2QZOcA3vWRmSMT0AI1r9
	VHTlVu5bY8Yxc+YigjLsWfep4Nt4sAQbGkIcJYR2KH/NzBbHmWZ7GcRUCQ2a6SqO6VjKlXA6pCx
	2LViaZ/1w6Ijr62yXGHeLfH/XYQg3ulPM7DWaYtIcGzmLAVsxNT/+XwseJtJvVMX22W0Zw4jBCJ
	292bVyNqQkNJtAqEIpA0syrA6t7YcIqmTe7/hl/Ui/Cj6TetAhRIXoFg=
X-Received: by 2002:a05:600c:474a:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-49ce55ecebemr7900675e9.2.1788299117930; Tue, 01 Sep 2026
 14:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
In-Reply-To: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2026 14:45:06 -0700
X-Gm-Features: AcwNN1WJANZf5K-B56FXnnbRv_nEZ-c1YRWO7ycGekrQC4yKcYcwf7zg-0bzQpg
Message-ID: <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Oleg Nesterov <oleg@redhat.com>, Elliott Hughes <enh@google.com>
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 3:46=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The register offset macros in <asm/ptrace-abi.h> are guarded by
> `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> were left unguarded for 32-bit. This causes havoc for userspace that
> happens to use identifiers colliding with these short macro names
> (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> userspace is forced to be super extra careful with include ordering to
> minimize the chance of collision.
>
> Wrap both the 32-bit and 64-bit register definitions under
> `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
>
> Assisted-by: Gemini
> Link: https://github.com/llvm/llvm-project/issues/217413
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

+ enh (who pulled this into android for testing)

Oleg, can I get an ack/nack here? Or someone who knows better the
history of UAPI headers?

(I think the Assisted-by tags need `LLM` now IIUC? Assisted-by: LLM Gemini)

We've worked around this now in lldb-server, but figured it might be
nice to clean this up for the rest of userspace, too.

> ---
>  arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
>  arch/x86/um/asm/ptrace.h               | 4 +---
>  arch/x86/um/ptrace_32.c                | 1 +
>  3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/ua=
pi/asm/ptrace-abi.h
> index 5823584dea13..3656955c6faa 100644
> --- a/arch/x86/include/uapi/asm/ptrace-abi.h
> +++ b/arch/x86/include/uapi/asm/ptrace-abi.h
> @@ -2,6 +2,7 @@
>  #ifndef _ASM_X86_PTRACE_ABI_H
>  #define _ASM_X86_PTRACE_ABI_H
>
> +#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
>  #ifdef __i386__
>
>  #define EBX 0
> @@ -25,7 +26,6 @@
>
>  #else /* __i386__ */
>
> -#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
>  /*
>   * C ABI says these regs are callee-preserved. They aren't saved on kern=
el entry
>   * unless syscall needs a complete, fully filled "struct pt_regs".
> @@ -57,12 +57,12 @@
>  #define EFLAGS 144
>  #define RSP 152
>  #define SS 160
> -#endif /* __ASSEMBLER__ */
>
>  /* top of stack page */
>  #define FRAME_SIZE 168
>
>  #endif /* !__i386__ */
> +#endif /* defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS) */
>
>  /* Arbitrarily choose the same ptrace numbers as used by the Sparc code.=
 */
>  #define PTRACE_GETREGS            12
> diff --git a/arch/x86/um/asm/ptrace.h b/arch/x86/um/asm/ptrace.h
> index 2641d28d115c..439c4151f6b7 100644
> --- a/arch/x86/um/asm/ptrace.h
> +++ b/arch/x86/um/asm/ptrace.h
> @@ -13,9 +13,7 @@ enum {
>  };
>
>  #include <linux/compiler.h>
> -#ifndef CONFIG_X86_32
> -#define __FRAME_OFFSETS /* Needed to get the R* macros */
> -#endif
> +#define __FRAME_OFFSETS /* Needed to get the register macros */
>  #include <asm/ptrace-generic.h>
>
>  #define user_mode(r) UPT_IS_USER(&(r)->regs)
> diff --git a/arch/x86/um/ptrace_32.c b/arch/x86/um/ptrace_32.c
> index 3af3cb821524..9e9155b0e918 100644
> --- a/arch/x86/um/ptrace_32.c
> +++ b/arch/x86/um/ptrace_32.c
> @@ -7,6 +7,7 @@
>  #include <linux/sched.h>
>  #include <linux/uaccess.h>
>  #include <linux/regset.h>
> +#define __FRAME_OFFSETS
>  #include <asm/ptrace-abi.h>
>  #include <registers.h>
>  #include <skas.h>
>
> ---
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> change-id: 20260821-ptrace_uapi-462350036cbd
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
