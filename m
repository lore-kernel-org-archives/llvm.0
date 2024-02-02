Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01964839F9
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706911244; cv=none; b=BmZJoOG1pvrK4pTCR1J4sCbRF/UxKym0O7A27hPyWdUSLksI69imppWjRy7HFFk4hPFsYqiyiz32KTOgLzR2maUT5YFrGs0O8B9EBfcjA9Xf/g6CxYH/OIrzgZfAeUA3OtzCdQkb6B8nVZPna7XGET1WIzhDNZMZsL7zdAKEzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706911244; c=relaxed/simple;
	bh=T1MXEQB746wrX62S7IpUJjq100rQ6d7kzLltQ5g3nRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FD1+kOCm1iwG8qS5peRnOKX54/aj31uhYHt37e6JdM5b1Nrb/uRxoYcu25UqKD8eqUUPHYepIXC30F0Ku04sNuBJGtFkINJdDyBU8/RyH2J7SpVkLcVcr/hNqC4CmxkSMdNnIWuNGGjAMYNRrYYWCxbAo5aW85jsnxXMsiZgq4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v2W/SSgQ; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v2W/SSgQ"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4681b72f2f9so1069345137.1
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 14:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706911242; x=1707516042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hry1ZKGYXn0PLELk19zPrbAcJfAf3mQKU3XmGI8OhDs=;
        b=v2W/SSgQwhVEdTnnHN4H59DtqnOlnb21vOhpvLlgtlJpIo7EPZzWqFWcEqu7WSNOar
         k0z3++YjqtDpEiX5wW94c53LMM6Y3LQmEg8sclaPv2gerNR4ljJKBt9kQ/ado7ZVwt6E
         5IQzWM2470KzPFT9G8YsI401Ofy3E/2oOp00xxrYzJWWe9x5tEntaChwMDEcRBO9xnpn
         3Gfat3jfsbmOWkHzCvC4LzWIuLA50qhbrxglNNgTwcsFqn3sFGtl4V5ZS81Lmj/TaVCk
         mU7J0uXBdxBr8UXK2A7CIi3bDs7xDPbUDIY0bjAVHNqnuVRdkewt+/210G1oR6CmeOMr
         8SjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911242; x=1707516042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hry1ZKGYXn0PLELk19zPrbAcJfAf3mQKU3XmGI8OhDs=;
        b=oPNqYeyxXZ4tpeA9KLipCtIS2fKRcZJSFedB0X1GI6vXxLtpQtT0bpyOSu2REseBM1
         vmD3griGIEgaM7zRXMhxppzOdSBcCCqJjHOH6Ud4woCJ5bhX7gK1duIF8Qq7a6GkSTuh
         9haqWAPm1opYZ6B7aWwSnv68ekwsmF3Jfy2VxP6EV883wbtNxl9qVThjBZ0eqvRa2QGJ
         TpFW5qj58yYLFCP+NSgyLXPj9mNUtROE+CSBh7xJgge+ckkRCVuGQujrq/nzLYCviGhm
         7kBFvnITbgbI1ulKtI5AJLSwnuwmB9K3SUYrX4/CYINunWu2wQruD4ADKkeD/UNF6Z/M
         4TbA==
X-Gm-Message-State: AOJu0YxxEMD1ZDzd08Lbv//dgx8rVEsbsfGUJ96h68xCwNTxHmHRYZ72
	Ea8E0fCLzL0lpjnHe1kJmralz85OZrQ3QM0+77lUnmq0zYyFYF+wfDrOMhNQ+fst/UaPG2Ro2Fd
	t5LjecxUMqfHwn17DrQpTJTCmrjJJz8LRSzRV
X-Google-Smtp-Source: AGHT+IFUXimzUG8NKidpgusFqnc2mrXenla7Rri5SA/FWuN+STma6oTZzhlhnm7yzn8Qgpm/liJq5PDpZqGjZbzCjFo=
X-Received: by 2002:a05:6102:a15:b0:46b:42f5:ae94 with SMTP id
 t21-20020a0561020a1500b0046b42f5ae94mr8595652vsa.22.1706911241549; Fri, 02
 Feb 2024 14:00:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-2-kevinloughlin@google.com> <4ljfvg7c23g2wx4hcqz6x6tx7uvp6fffayqvu4ptsmfqajlujr@zngokbd2awma>
In-Reply-To: <4ljfvg7c23g2wx4hcqz6x6tx7uvp6fffayqvu4ptsmfqajlujr@zngokbd2awma>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Fri, 2 Feb 2024 14:00:30 -0800
Message-ID: <CAGdbjm+dt2LMqsWkzME-Gya9F=pZMubTuW3Ad3dStj=L+MW+ng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 12:20=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Tue, Jan 30, 2024 at 10:08:44PM +0000, Kevin Loughlin wrote:
> > diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/=
mem_encrypt.h
> > index 359ada486fa9..b65e66ee79c4 100644
> > --- a/arch/x86/include/asm/mem_encrypt.h
> > +++ b/arch/x86/include/asm/mem_encrypt.h
> > @@ -17,6 +17,20 @@
> >
> >  #include <asm/bootparam.h>
> >
> > +/*
> > + * Like the address operator "&", evaluates to the address of a LHS va=
riable
> > + * "var", but also enforces the use of RIP-relative logic. This macro =
can be
> > + * used to safely access global data variables prior to kernel relocat=
ion.
> > + */
> > +#define RIP_RELATIVE_ADDR(var)               \
> > +({                                   \
> > +     void *rip_rel_ptr;              \
> > +     asm ("lea "#var"(%%rip), %0"    \
> > +             : "=3Dr" (rip_rel_ptr)    \
> > +             : "p" (&var));          \
> > +     rip_rel_ptr;                    \
> > +})
> > +
>
> I don't think it is the right place for the macro. The next patch uses fo=
r
> things unrelated to memory encryption.

You're right; with the cleanup, I agree it becomes more general. We
can move it to arch/x86/include/asm/asm.h.

>
> > @@ -239,14 +244,14 @@ unsigned long __head __startup_64(unsigned long p=
hysaddr,
> >        */
> >
> >       next_pgt_ptr =3D fixup_pointer(&next_early_pgt, physaddr);
> > -     pud =3D fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], phys=
addr);
> > -     pmd =3D fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], phys=
addr);
> > +     early_dynamic_pgts_ptr =3D fixup_pointer(early_dynamic_pgts, phys=
addr);
> > +     pud =3D (pudval_t *) early_dynamic_pgts_ptr[(*next_pgt_ptr)++];
> > +     pmd =3D (pmdval_t *) early_dynamic_pgts_ptr[(*next_pgt_ptr)++];
> >
>
> This change doesn't belong to this patch. Maybe move it into the next
> patch and combine with removing fixup_pointer().

I'll put it in a separate commit even preceding this one, as it's
actually a bug in the existing fixup pointer logic that I noticed when
transitioning to the use of the RIP-relative macro. Specifically,
early_dynamic_pgts is a global variable just like next_early_pgt and
thus also needs to be fixed up to guarantee the correct address is
used across toolchains.
