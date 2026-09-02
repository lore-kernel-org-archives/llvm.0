Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09D33A708
	for <llvm@lists.linux.dev>; Wed,  2 Sep 2026 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356646; cv=pass; b=ed2j8xH1oxEVHes2+Zyq20mVFhW7bKQCAfHNB2ahjlhAPTD0/6fYZz8VRrAVZY/2M4mNFRVh4y95FmeMR5pW06d7/RZKk3Yjdr7rFZLRoF+MsUePqyhQYwHAX1017bNcTa3FDibFUtlfjUyGlSo1MeyUletErpD6JYU01FgiWfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356646; c=relaxed/simple;
	bh=eBCVbFvfA2xMyMFovGTR8cuVY5LDneB7UwxZBqbyciw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/vR5TEeuT5cvG77B4Dndp7e/lUKbGrVDUCU0AnpueP/VP7xc46CzlevTA5Ufez1CudNgavRbXaiURBlsypho+p1x1eLM9g8Bt+/uJ4CJK5oqYrXbTAPn5YxRFQxRMd/oGDakC3B+KqpfXdOudq7O20cuFvQFfc5TkjsKrs6Uwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=szbM78Gs; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="szbM78Gs"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b383347fa6so1514245b6e.0
        for <llvm@lists.linux.dev>; Wed, 02 Sep 2026 06:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356640; cv=none;
        d=google.com; s=arc-20260327;
        b=imY5pSawJ+qpQAkjxQIBcU/z2nBdkPlYOgYqFi0WwhtaS0hi47rYOnA55RJQkEJ9EJ
         82aerEDDTNgqAaXH4O9Kf6x8kfljYjpRYJc0iftv8AxwJTE+cFnzu4+tYWCfB+bGYqBp
         9MWbO8IEo+uOLizgUCJrJzkb9bpNTrpug1i44/tOy6IZGeg9TrCWrCjNYmnCWQNf3WVS
         jarQXpJLN+EEOQkIZHY8b6LDuOMFZz5yI81glRijVG4Wv9G3en+q/ldBEjbhRf3M9n7i
         RetZIgcx7BHo9lfFpRdaFAjMOp+Hn1l4vvQeVg0Anuk4Ubi96FLkhYjBSeXR3CQQpSB5
         Br8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OH53ybijunYoNfJAXp5YQ5Xv4Y7ODEOPTSxs+1JBmaY=;
        fh=VTgS3iNNeKSxv9vjPJcGWcDdbwSW2M8+P90MozLYw/E=;
        b=qlFar0EJDvOIeAChThH5yQq/Z3M/8/LvfxOX9qWfhEsPMjSyHZKx+K9UFy3zbjM8T7
         z8IEke58kFbim8ocr6StLHtqkJ1yYMGKHWQn/bvMIvnTC+3PMShnxKmXOL3GKirv8r4V
         iMVdVHhDjsTayjYrnozP4MoB4E7ib634IrxxqYOnwCxs3hjUy6hrfyJlH3dmGncAY5NY
         21A09kBir4rqlc4jLRrw3RSuV9fGz1Z1UJPFjVd/dPfPhMK8ijoFlIElRAFJqj3YLYdj
         myVBWK0BTeyuTkfnlwknxJ+ufnHytyP4M/scFPBicPypZXTOi71eXc3N4re/dPQuSIn9
         waxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788356640; x=1788961440; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OH53ybijunYoNfJAXp5YQ5Xv4Y7ODEOPTSxs+1JBmaY=;
        b=szbM78GsAGDymIIRWKdYXYO7um2zaXcV1ZwmtZqtzkgvajx8FriZ2V7zOoSGKyGZmm
         x6UyfllcsShjrBe9y2QGf/QVJA1DpG6EGZQfpUSHvjMJ2CDbveoEdrSMpR7mX025D/YB
         esZcOLziL6hmFJkvePpR5tJ/yBv021aiLdHXINBY382WI7Gr6uuLlsV0V09Y7oHTSaBb
         cYNpfddgMpYi5EST7ReOJ5oJa6pcaZ70eTU+VabXFCriEgcMgCL9W8UFveuL5Wr3sHRg
         0dm7grAoHEPtZcccEDOrlv0Ntkn6SBmC/O4lxL51Dskv47/KR3Vb+Pz4r9WmfoAgNWEr
         +J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356640; x=1788961440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OH53ybijunYoNfJAXp5YQ5Xv4Y7ODEOPTSxs+1JBmaY=;
        b=B+iGEQOjhJLFfKICdsck6n8c0iaRyteh9YIj6EXKVVVvumlxtcquOMORtWd3a45CW0
         GdIN5AQqLn7wUPgy03P9UUUIKgUlzplENqTeS6aGTSoXewx3TBpNT5Im/Qw142dbghlQ
         C8+gR88FRdB84cLbFzNEF0qcV0tvXKJ2DoN7cqmm1AL721Lyqb8CYIcWm6ZK3FXWG6KV
         h1o8exu1WgW83tQTPY8EHAPQmzQ7VB0LWluJLM1xE2KQvJV7AHQv90kkmCexNnUi1sx6
         +tnY3p3/C4q3RNOtYQS8o4NffeOLc4L6Zw5hQI/nKm/BW3uuyjOQ0gKbFSpED/iaY1+x
         8iRg==
X-Forwarded-Encrypted: i=1; AHgh+RoQveBxIWrRh6ObJHwn0lhyax3Nl17pm4lkFFdKdx0jvoQAB64epNt32e+Z2/wal26BhpzN@lists.linux.dev
X-Gm-Message-State: AFuF++n+e9x4EyO7hvxNRoY3TO96QKJh5ml9epGV3K9YhEtF9Ap7olmi
	0wb2a4AQw5VbYDC0iQCoJeY1W6kioTSmboVkiYimb6Q/+FZFHuzvnJ4nKGFsE+/c1w7Dd/5XVpM
	hA/RTtnlNWvDrN72HOtX7rxE533MsZhckUhEZ9Ud+
X-Gm-Gg: AR+sD12kPzUyH9J8MjxrF9FQapIUchwQD3H464B8h30dTyx6o1a694PU+PmpdHgEBsN
	PZoS1/XGPRjiNfP+jBpJsTReBmw//jQ45qfm7v4nau5HjT/UPd3PZ/pwByI33rpkViH0gzqAI5u
	rGyxRnYsUHTYqW82PrgqjZBnldBOjP7oB95FPCZfRutmA36IWNX33roOcvW/CmOhJ7CkUCBDkFe
	pvclVmA0JZmTTd6qWkvh0ywyk5dB9DTYAoTLN3cVyq4/V3ZEIAXRwmdyA3ob1lIn1KPHjHB8pJp
	6sQIxmmibPoiyDoTG5ZO44HMNcQirMqhTH39iv3l+w==
X-Received: by 2002:a05:6808:1795:b0:4b3:5da8:1da0 with SMTP id
 5614622812f47-4b71c52e940mr1827413b6e.5.1788356638926; Wed, 02 Sep 2026
 06:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com> <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
In-Reply-To: <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
From: enh <enh@google.com>
Date: Wed, 2 Sep 2026 09:43:47 -0400
X-Gm-Features: AcwNN1Ugm9qaNtJA4BValHn6hwKda3ef1jRT8zcSOcPUdm-ZVB0BjO70Z0pKBAc
Message-ID: <CAJgzZoqAqw6FzGVzr1=5n69xUFpE3krkzc4tbCDPjohFhz0zdQ@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:45=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Aug 21, 2026 at 3:46=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > The register offset macros in <asm/ptrace-abi.h> are guarded by
> > `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> > were left unguarded for 32-bit. This causes havoc for userspace that
> > happens to use identifiers colliding with these short macro names
> > (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> > userspace is forced to be super extra careful with include ordering to
> > minimize the chance of collision.
> >
> > Wrap both the 32-bit and 64-bit register definitions under
> > `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> > User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
> >
> > Assisted-by: Gemini
> > Link: https://github.com/llvm/llvm-project/issues/217413
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> + enh (who pulled this into android for testing)

for those who don't know me, i've been Android's libc maintainer for a
while now [was https://blog.linuxplumbersconf.org/2014/ocw/proposals/2337
really that long ago?!]... i applied this patch to Android's libc's
copy of the uapi headers (because Android uses the uapi headers
directly, unlike glibc, and exposes this header transitively from
<sys/ptrace.h>, also unlike glibc), and everything still built without
problems.

this does solve a real problem for us: llvm's coding style means they
have a lot of "FS" and "SS" identifiers that conflict with these
macros, and we see a conflict every few years.

Tested-by: Elliott Hughes <enh@google.com>

> Oleg, can I get an ack/nack here? Or someone who knows better the
> history of UAPI headers?
>
> (I think the Assisted-by tags need `LLM` now IIUC? Assisted-by: LLM Gemin=
i)
>
> We've worked around this now in lldb-server, but figured it might be
> nice to clean this up for the rest of userspace, too.
>
> > ---
> >  arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
> >  arch/x86/um/asm/ptrace.h               | 4 +---
> >  arch/x86/um/ptrace_32.c                | 1 +
> >  3 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/=
uapi/asm/ptrace-abi.h
> > index 5823584dea13..3656955c6faa 100644
> > --- a/arch/x86/include/uapi/asm/ptrace-abi.h
> > +++ b/arch/x86/include/uapi/asm/ptrace-abi.h
> > @@ -2,6 +2,7 @@
> >  #ifndef _ASM_X86_PTRACE_ABI_H
> >  #define _ASM_X86_PTRACE_ABI_H
> >
> > +#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
> >  #ifdef __i386__
> >
> >  #define EBX 0
> > @@ -25,7 +26,6 @@
> >
> >  #else /* __i386__ */
> >
> > -#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
> >  /*
> >   * C ABI says these regs are callee-preserved. They aren't saved on ke=
rnel entry
> >   * unless syscall needs a complete, fully filled "struct pt_regs".
> > @@ -57,12 +57,12 @@
> >  #define EFLAGS 144
> >  #define RSP 152
> >  #define SS 160
> > -#endif /* __ASSEMBLER__ */
> >
> >  /* top of stack page */
> >  #define FRAME_SIZE 168
> >
> >  #endif /* !__i386__ */
> > +#endif /* defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS) */
> >
> >  /* Arbitrarily choose the same ptrace numbers as used by the Sparc cod=
e. */
> >  #define PTRACE_GETREGS            12
> > diff --git a/arch/x86/um/asm/ptrace.h b/arch/x86/um/asm/ptrace.h
> > index 2641d28d115c..439c4151f6b7 100644
> > --- a/arch/x86/um/asm/ptrace.h
> > +++ b/arch/x86/um/asm/ptrace.h
> > @@ -13,9 +13,7 @@ enum {
> >  };
> >
> >  #include <linux/compiler.h>
> > -#ifndef CONFIG_X86_32
> > -#define __FRAME_OFFSETS /* Needed to get the R* macros */
> > -#endif
> > +#define __FRAME_OFFSETS /* Needed to get the register macros */
> >  #include <asm/ptrace-generic.h>
> >
> >  #define user_mode(r) UPT_IS_USER(&(r)->regs)
> > diff --git a/arch/x86/um/ptrace_32.c b/arch/x86/um/ptrace_32.c
> > index 3af3cb821524..9e9155b0e918 100644
> > --- a/arch/x86/um/ptrace_32.c
> > +++ b/arch/x86/um/ptrace_32.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/regset.h>
> > +#define __FRAME_OFFSETS
> >  #include <asm/ptrace-abi.h>
> >  #include <registers.h>
> >  #include <skas.h>
> >
> > ---
> > base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> > change-id: 20260821-ptrace_uapi-462350036cbd
> >
> > Best regards,
> > --
> > Nick Desaulniers <ndesaulniers@google.com>
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
