Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25114B08E
	for <llvm@lists.linux.dev>; Sat,  5 Oct 2024 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728143327; cv=none; b=sot2Wz6yixUts51xQ8V4LrmNGY5Tl5NjFmmKWFET1XylPmwL9OyDCHRr+OX8ZR9Sd78l9P458yadrzz96rUpIdLjhGuYDPfwDDCdiLKAk2G93izuI1gBRvfNfNflHu801el8YVIbdWZ+j9ko+EH7DH+S6L8JaQ7qYEbjl+r+DDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728143327; c=relaxed/simple;
	bh=CAwZZ/cbkZfNcTx3fD33ENauVSXB4fGFVU4Z9VQV5ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9Iv6x2jwbUTjDk7KoKnhv3gqM6FEam2KMaa6j/xIatK9Kvyl2snpjkOuMjeC55g27Z6TxPiklKQ7saskz+2SgvcQkrrPxczVNcxXz9z5cojK7RGbTY65NhWRkpmFnKJ1gHSsKcPlQBGezRPte4/r/By3DHOtTyPTqycWJQGcQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aluYHm2t; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aluYHm2t"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso35620351fa.1
        for <llvm@lists.linux.dev>; Sat, 05 Oct 2024 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728143322; x=1728748122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtxqmhjvfS2LHPA1jTETD3JSTrJ84jElXfjubNHHF9c=;
        b=aluYHm2tNOIG/V917RIWHzuudL5VntrvBtDtwOMoMPL9hdGT2DU/WpKbdTx/R7jXI8
         eX3K+n/0CeDyVjtWtpOVmcHkqjZKvjmbS+OsEQqaYJUU5xHJ3UQTsVZ9LH0VEEYe1PDJ
         NxAnkMqLCZqKC0yXRVI9VKhDd9g1CZ2QUMYQjgLF10BV5owbExWb5KUZf7v2hnC8ncv3
         aL82KR9ysT6Dee4LBZkLdOidWASF4mzFV8KMA7md3d1swa9SFuhVlFXkDU8fJMG1No8W
         pkQFBGZJByamQPxo1dZyB2Z94/kjG4D+A7cAO5MvKgNNo0IY3d5p0gxwhfe/jfLDtS8S
         zAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728143322; x=1728748122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtxqmhjvfS2LHPA1jTETD3JSTrJ84jElXfjubNHHF9c=;
        b=m4CohpftJmVTy12CWbmLS5AR/mO3+kfgkQv1VmY9SD4gZy+FcV6Bw/cCbIgp06HpEV
         8H/w5hGmZGALAB9Gi/5GtH/T8n78qkPIcqsWqx/+0r52+qOouEbWfZtJACLgDb5FBPBg
         AkNEjKy+Q7yBfYgG9uHdV3DzZhGKBybxoyMFrcGOOYqJl8mzqAkatZ9KJGK4iQh00SOa
         bQY3pwj6v07fXRdA0LE0NVa2uFnq769HvlGFZIIkUAXNPsuVfocIstP4k/CxYXFWsMNe
         Y6ZGxBgXAXeBrGsPhNvB5AXwQxVoHfs3JfpoV06CcBevwmUeRawv1kP8XYokE8OzfliA
         Fr2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1bEePjeTnoJiepzqSwC1E9S25mczRvkybpQRVaO3JtBN2ASrF1P/FFU73SqMvduFEhuV2@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg8RqrE4jkNYV4foh6zGbXMnr0hfw+fq4KMjSCISlMpGjhok4f
	F5HLqbe3wBS4Qr5hz5yvx04w2rqUFeJTfHhuqthiru0JuKHCt5Rw1IRvkBqtqfsiK4zDUPDbFJu
	hv5D/1P44J22qMHaEUwIaDzB6PQ==
X-Google-Smtp-Source: AGHT+IFQhJujfFuTsYWjO3cyatW0jMKx8lC6zgFbyjgoqUx/Eap6iQT+vvVetq98t3rLbrv3vwXyYl9HWoEEK7CMN2w=
X-Received: by 2002:a05:6512:baa:b0:534:3cdc:dbef with SMTP id
 2adb3069b0e04-539ab8add1fmr3167920e87.43.1728143321606; Sat, 05 Oct 2024
 08:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002092534.3163838-2-ardb+git@google.com> <CAMj1kXGDmkuwSROhnFkX_jYbWyAL738KmHbk5qYnThL6JWHapg@mail.gmail.com>
In-Reply-To: <CAMj1kXGDmkuwSROhnFkX_jYbWyAL738KmHbk5qYnThL6JWHapg@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 5 Oct 2024 11:48:30 -0400
Message-ID: <CAMzpN2i-EyGjkb9S6fWBXmZoj6GUEQNjSZ0-MviPJy-GiRxnPw@mail.gmail.com>
Subject: Re: [PATCH] x86/stackprotector: Work around strict Clang TLS symbol requirements
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, x86@kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Fangrui Song <i@maskray.me>, Uros Bizjak <ubizjak@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 7:04=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Wed, 2 Oct 2024 at 11:25, Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > GCC and Clang both implement stack protector support based on Thread
> > Local Storage (TLS) variables, and this is used in the kernel to
> > implement per-task stack cookies, by copying a task's stack cookie into
> > a per-CPU variable every time it is scheduled in.
> >
> > Both now also implement -mstack-protector-guard-symbol=3D, which permit=
s
> > the TLS variable to be specified directly. This is useful because it
> > will allow us to move away from using a fixed offset of 40 bytes into
> > the per-CPU area on x86_64, which requires a lot of special handling in
> > the per-CPU code and the runtime relocation code.
> >
> > However, while GCC is rather lax in its implementation of this command
> > line option, Clang actually requires that the provided symbol name
> > refers to a TLS variable (i.e., one declared with __thread), although i=
t
> > also permits the variable to be undeclared entirely, in which case it
> > will use an implicit declaration of the right type.
> >
> > The upshot of this is that Clang will emit the correct references to th=
e
> > stack cookie variable in most cases, e.g.,
> >
> >    10d:       64 a1 00 00 00 00       mov    %fs:0x0,%eax
> >                       10f: R_386_32   __stack_chk_guard
> >
> > However, if a non-TLS definition of the symbol in question is visible i=
n
> > the same compilation unit (which amounts to the whole of vmlinux if LTO
> > is enabled), it will drop the per-CPU prefix and emit a load from a
> > bogus address.
> >
> > Work around this by using a symbol name that never occurs in C code, an=
d
> > emit it as an alias in the linker script.
> >
> > Fixes: 3fb0fdb3bbe7 ("x86/stackprotector/32: Make the canary into a reg=
ular percpu variable")
> > Cc: <stable@vger.kernel.org>
> > Cc: Fangrui Song <i@maskray.me>
> > Cc: Brian Gerst <brgerst@gmail.com>
> > Cc: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Andy Lutomirski <luto@kernel.org>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1854
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/Makefile             |  5 +++--
> >  arch/x86/entry/entry.S        | 16 ++++++++++++++++
> >  arch/x86/kernel/cpu/common.c  |  2 ++
> >  arch/x86/kernel/vmlinux.lds.S |  3 +++
> >  4 files changed, 24 insertions(+), 2 deletions(-)
> >
>
> This needs the hunk below applied on top for CONFIG_MODVERSIONS:
>
> --- a/arch/x86/include/asm/asm-prototypes.h
> +++ b/arch/x86/include/asm/asm-prototypes.h
> @@ -20,3 +20,6 @@
>  extern void cmpxchg8b_emu(void);
>  #endif
>
> +#ifdef CONFIG_STACKPROTECTOR
> +extern unsigned long __ref_stack_chk_guard;
> +#endif

Shouldn't this also be guarded by __GENKSYMS__, since the whole point
of this is to hide the declaration from the compiler?

Brian Gerst
