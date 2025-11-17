Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10932E723
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383089; cv=none; b=htNlRDsXvT8Y7oMmnhtk8lMQKVndMRqQWh7q++4YildwEZPzqlTY8S9KDS9KKYM4SjttA2HEyCcMxU2lw9gKTUQgtESsYigTU2wlZmDcJGuEMxSdCMdLdyXAqMZfVZeK7hZckcL9CWe/ReaZ5dCEosi8iidyxOvXnDR8mp44JSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383089; c=relaxed/simple;
	bh=90ARYsr5SJ4blEuyPYL/Jtb4E6D8WXtX8MbAPsByqzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgnWvp3FkH1uI01IQdspf5JYs3+x6Ezf5+hUHkWMCiYjgKVuRE32/X66aJxiF0McbphTiFGDPIDwCRJFQjXLCp6gjyXTSlQexXPFeijsXk4l4DbXQy/ZQ6PAnsF73ZdhsH7gZVtZN0jlUq2fiD/NusdcQqymumx37/6oCstjrfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dh76Lmvl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dh76Lmvl"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-587bdad8919so10034e87.0
        for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763383084; x=1763987884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URpeK6n/6k1x/9RtXp9adoDav0Kb5+tdysXjc9cJrC0=;
        b=dh76LmvlwzxE0z9tqCehpSJ/gT0avhnRscS0CTwy58Jv8ZNzhW6PWSObN3tZwEhYFs
         6PpCITB0TEjNOLTbSbzB7a6gxhgQfgwGZXpaj303CF4ypMLLdRiZ66ji+dVQ5dpDC+WW
         Dte2vOs2NkpScMe1BzDOQ7t9oNxjukXYC9WFuSW3GzB8bvDT+4/G9qo0KxmlG4wNk74s
         mNLwN5wdKnszl8ujYjAFrpbyaOU5qR+JddjAVuF6/qsoSbeReuerTzv68AvozouHnzvl
         otSz7yYJ/cZQIBRwfSvkRNsdid8/Bf4/4M1E4ppaOuxspWSP3AAjoR5XZOhzvfYb2vX/
         4LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383084; x=1763987884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URpeK6n/6k1x/9RtXp9adoDav0Kb5+tdysXjc9cJrC0=;
        b=VVDcTYHhUuftQiQvdnCo80hFTMVlMjeV6oGQJ/VQtj1/rb2nRC4IqlpzcP0YryRRDK
         aLgyM4/e77fpRYaziUHRct/8yzCuyk9ErDBidFVAdiYgBZfLPSQS9vhKKxWH9hJmr0xx
         mXc3sLLPNXhN+zM2w05k5SPF/qddkBSUH1MWSn4MTa/0k9hgKpClMVc/RFz+WaCwFgYP
         /d30zF962e4QAXPy/Vl7UA7SRNZD0RJHQK8+QdVXnfQZmLb1h5NKUMQiGLt2wW+cddK4
         USRdTwHCp79PWy3qj6vRVqi8xYz62A1FGTCyH8SomRhvDFXcWc3DEQfwox1qOiya6kUd
         YeWA==
X-Forwarded-Encrypted: i=1; AJvYcCWjiUQuA6z0jrBGA8yvyLRi1+CUCEhbDOHWb0bQvfNQlDjg4eQIEzLKAK+sU1wE+MGePlyO@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq2ohToXIfcA0ZEt7YbPuRe006V4y3JA+/C18h42TviPVGHTyl
	L+vbb4CDVPNaSramogHBqqt2Uc7Lv+MorXNj58UTcp/GKnenZIaFQnX+igIwVHKtkAcHuC74sDa
	JLiNuI/0/OgMR89G5fohFtNv401J5xrPzHyHCClgt
X-Gm-Gg: ASbGncuvFw0qTj0EKoyhq1qvOWZCxCgOKb+rxKFHJZ552l9M7zLsIJf8JPz3tEEiC/P
	xHxM6ZWFpvwCjj43NU/lFq7vdr9kjcBXa6xt95Xi0DT9zIgT2w4cTpZ1aVmB4NxFVnuiZyxU7Dm
	CAd5Ojk2AmE3volchx4cRqXUmU+x1+3FXszt/JZNNOY8pD/lvbr6lkQnbjGdnpV/aA8IYXUxfOX
	ExpNmKOMtAsOg1YWgjZ9MBfEaKVrStKNs9XVYNsvdkdLlGoNJVUCiHUuDK7bMPEyqvtLaOfPHWX
	7mHXBhjW7xSEQtONDcT7nvxEAyuWznq2Mso=
X-Google-Smtp-Source: AGHT+IFy5BQdcKTM5pC/9jMPlY7ZonZoW5+JR6Q7jYJyX3TdaPkFOCjzBNXXomOHFC3iBti8H6R4TD7QvaCuc1Od6Uc=
X-Received: by 2002:ac2:5489:0:b0:594:43e1:ed43 with SMTP id
 2adb3069b0e04-59589f3f93dmr136803e87.2.1763383083500; Mon, 17 Nov 2025
 04:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
 <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com> <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
In-Reply-To: <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 17 Nov 2025 13:37:51 +0100
X-Gm-Features: AWmQ_bkPGKlC7yzB_IKlVYRYwfrtk5qrJ0gV1blydN2SBPqDNyo3yBZpGetbnq0
Message-ID: <CA+i-1C2-DtH326ppTx6V_yJ3HX-H0b5i9GNnXb0Q5mUF-Kexdg@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Nov 2025 at 12:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.com> wro=
te:
> > >
> > > With Debian clang version 19.1.7 (3+build5) there are calls to
> > > kasan_check_write() from __sev_es_nmi_complete, which violates noinst=
r.
> > > Fix it by disabling GCOV for the noinstr object, as has been done for
> > > previous such instrumentation issues.
> > >
> > > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> > > ---
> > > Details:
> > >
> > >  - =E2=9D=AF=E2=9D=AF  clang --version
> > >    Debian clang version 19.1.7 (3+build5)
> > >    Target: x86_64-pc-linux-gnu
> > >    Thread model: posix
> > >    InstalledDir: /usr/lib/llvm-19/bin
> > >
> > >  - Compiling from tip/master at 6f85aad74a70d
> > >
> > >  - Kernel config:
> > >
> > >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e186571=
74f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
> > >
> > > Note I also get this error:
> > >
> > > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !E=
NDBR: machine_kexec_prepare+0x810
> > >
> > > That one's a total mystery to me. I guess it's better to "fix" the SE=
V
> > > one independently rather than waiting until I know how to fix them bo=
th.
> > > ---
> > >  arch/x86/coco/sev/Makefile | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
> > > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2fb172=
09a7426e7893dea988c 100644
> > > --- a/arch/x86/coco/sev/Makefile
> > > +++ b/arch/x86/coco/sev/Makefile
> > > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
> > >  # GCC may fail to respect __no_sanitize_address or __no_kcsan when i=
nlining
> > >  KASAN_SANITIZE_noinstr.o       :=3D n
> > >  KCSAN_SANITIZE_noinstr.o       :=3D n
> > > +
> > > +# Clang 19 and older may fail to respect __no_sanitize_address when =
inlining
> > > +GCOV_PROFILE_noinstr.o         :=3D n
> > >
> >
> > After Thomas dug into this issue a while ago, I meant to follow up
> > with a fix, or at least something to start the discussion.
> >
> > TL;DR there is nothing wrong with either compiler (as far as this
> > issue is concerned)
> >
> > The issue is that KASAN/KCSAN enabled builds use a version of
> > set_bit() that unconditionally inserts a call to
>
> instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
> directly, and these are usually only called by compiler generated
> code.
>
> This completely defeats the noinstr per-function annotation, given
> that each compilation unit only incorporates a single version of
> set_bit(), which is the instrumented version unless instrumentation is
> disabled for the entire file.
>
> For the short term, we could avoid this by using arch___set_bit()
> directly in the SEV code that triggers this issue today. But for the
> longer term, we should get write of those explicit calls to
> instrumentation intrinsics, as this is fundamentally incompatible with
> per-function overrides.
>
> https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u

Ah, yes thank you I think you are right. My GCOV "fix" seems to be
bogus, it probably just hides the issue with incidental changes.

[Dropping verbose notes so I can remember this next time I come to the
thread...]

I was reading disasm and it appeared that the __sev_es_nmi_complete()
-> kasan_check_write() issue corresponded to the __builtin_memset() in
vc_ghcb_invalidate().

But yeah, why should GCOV cause a kasan_check_write() to be injected,
that doesn't really make sense.

So probably rather than compiler instrumentation of the
__builtin_memset() I am seeing  the __set_bit() in the
ghcb_set_sw_exit_code() that comes right afterwards.
