Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DC16132F
	for <llvm@lists.linux.dev>; Thu,  2 Oct 2025 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444375; cv=none; b=RXlew9BZNGO++mzxEWboYX5EyybqDZff3k2SARjPv7LEZ+b6h5lQ5vXXPm3IBb+TIaMwC/icJtfIGR7gObWXqg/6IM5ypQZQerFSxLSxftFevt3srnV7ySVf/ROtrKeBp+aplKPv+TK4UREiItg4FKi0hA/xT/i9WBiF4FTy6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444375; c=relaxed/simple;
	bh=S+1bWtKOYwigu0+XpEoNbQ5mowIEfWBLYIkns68Vnyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXMu37zcHaE1BN+BlDPgFijB4B9UX2i30i4xlxdCOtymkF9gjh5wz5YmH6teTUYy5HGjrukuiQNSttZetwhEbn6utAiQWzzGuDre0U/CCk4QUPZN0ubp0Nq+pfC+VDREYtdQYAMkTi7jwXKAtX4Fc5Uy1znRQwx2MFIB5/mgVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6wTYB4v; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6wTYB4v"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso1067270f8f.3
        for <llvm@lists.linux.dev>; Thu, 02 Oct 2025 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759444370; x=1760049170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUtPgFs+a1OL7nG/nqf9VG8T8Iw8/JxdJFSGGo+Duvw=;
        b=e6wTYB4vEZdjRROhLN1lkgLVxZNvL8PT2QbFNFzOHHZz0k0CT7KqrwRavdhOxhe6az
         /SS0XIi7+VPvMkghn+cOo+D1r904HbIZG7sU/61RQ0lsNINFoyb5ZPi3LwXFw3jBQMph
         OdFekRv60AfUKNngFkX+1jd8xVF3r1J7mhTmS1b980W9hqqMG02eCHq+9vuf2UQ5LQ2F
         BRiCVHf1UJA1+mNHu1XesNyTj5N7CGxEWuwWuIjdSawz+AyabFK1h9yzsGpcSN/TXZ9A
         oCWNH8nLVvkfOLQJUpMlH8kFWTJVIiGbqr6G1RC+wiqTpVVD4FzxBEevi/a3mT9O5tAv
         zbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444370; x=1760049170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUtPgFs+a1OL7nG/nqf9VG8T8Iw8/JxdJFSGGo+Duvw=;
        b=Detnva/mQx51GEZfA9oiChBHEKNAcN/NG5IGDmMrgTKVzOHkM1YzudsHohg5TZfgHe
         VyTR2rbCffZ0FzshAssapqHRPPpUCnJHrjQFI3oz0qFlfOvP57a7B2GwqS/2WkjD6BHd
         eTyquJELRF732H59S0naiqBERCwlLpP7PcMEioDvoiZGpp8wyh5uuwFkpizXb6YMIrla
         Jl9g3ZfR7PzY52VapEOr+iM6Y3VyS7jeujjG5YhzIZVdQomPlhj6EmdTZGfWWlTB4kyM
         FsO+ByUF6z40jhMpZaMeY+EVoToXO2NQO5ShzUH1kqQrjUIj2+mdLsEGN1KGTQX8aM94
         VK0A==
X-Forwarded-Encrypted: i=1; AJvYcCVL7HrDJ+FZoCtqltW5IkZ9EPpH+rl3F1EgHFMhZdcYUx3/hT94Sc4Idk7IrjgPvImHCwNf@lists.linux.dev
X-Gm-Message-State: AOJu0YwoyqfxmHgYcjbj6stZ3CLLzlMEQHJH9AvJLEHdOZ4/bt3NNSPp
	Uy8hxiOdt7dbzqvsvKmNAr+HlGpK9eZSwA3QKr0UVstHsCo6YhmmZDZ23WHaUdCafyS19VDWLSv
	ryuhod7eq7EFv0PzwxJ6+yCpZlg205Vx62bhdOmGR
X-Gm-Gg: ASbGncv9SYYOzeuAh4v3qnbvT3IYgDRbFmptyoXrWJK3g9qhgesFPkX1P8wPSMaqY8O
	QzRMCxy7P5KUl3hulxWcNtGeAFJE/+q6iAXPMBUlUyObUzbSZ71JjTkMAL01abAIlGiODKrrarQ
	qA+WbnE7x1yv/RN7ndu6QfF3f55t6yy5hTJ2DY5TzciXAWFTTkm9YftEytd5OO9gjK+FCRHtjuE
	LApMA69M07QTUhoGITdJXLe2WKDzOy5FRV2QCk=
X-Google-Smtp-Source: AGHT+IGdWGPoz5PKrFGJEg2IcZ3ZPwnel+t94IMPQoWxzpXWAW09OSY4bzY7R+GccI211DbppmE2wBVRR005RgsZt+w=
X-Received: by 2002:a5d:5d07:0:b0:414:6fe6:8fa1 with SMTP id
 ffacd0b85a97d-4256719dfa1mr547619f8f.38.1759444370371; Thu, 02 Oct 2025
 15:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
In-Reply-To: <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 Oct 2025 00:32:37 +0200
X-Gm-Features: AS18NWD-5OHn1TKOTve9_yuzsaz2MvZIT_RmmhqjCCsJ6y7cPsY7xJ_qWzQC8XQ
Message-ID: <CAH5fLggBkR=n-8UfVcOhHTQ-gda0VLBpaK1p5aA=3s=tWSiGRw@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:28=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 2 Oct 2025 23:42:59 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gma=
il.com> wrote:
>
> > On Thu, Oct 2, 2025 at 11:19=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > No idea.  Let me cc rust-for-linux.
> > >
> > > It's a one-line patch:
> > >
> > > --- a/include/linux/mm.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_mad=
vise
> > > +++ a/include/linux/mm.h
> > > @@ -296,7 +296,7 @@ extern unsigned int kobjsize(const void
> > >  #define VM_MIXEDMAP    0x10000000      /* Can contain "struct page" =
and pure PFN pages */
> > >  #define VM_HUGEPAGE    0x20000000      /* MADV_HUGEPAGE marked this =
vma */
> > >  #define VM_NOHUGEPAGE  0x40000000      /* MADV_NOHUGEPAGE marked thi=
s vma */
> > > -#define VM_MERGEABLE   0x80000000      /* KSM may merge identical pa=
ges */
> > > +#define VM_MERGEABLE   BIT(31)         /* KSM may merge identical pa=
ges */
> > >
> > >  #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
> > >  #define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit =
architectures */
> >
> > Yeah, non-trivial macros confuse `bindgen`.
> >
> > For the moment, you can do e.g. [1].
> >
> > Other times, we have changed `#define`s into `enum`s -- that also works=
.
> >
> > ...
> >
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -106,3 +106,5 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA=
_PRESENT;
> >
> >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> > +
> > +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
>
> Sorry, this is rather annoying.  Rust is breaking the build for a very
> simple patch.  Many developers aren't rust-enabled and probably aren't
> even able to test a fix - my attempt to get a rust build setup working
> didn't end happily.
>
> Jakub's patch fixes a kernel crash and needs to be merged into mainline
> and -stable reasonably soon.  But that is now blocked until someone who
> knows how to fix this error and how to test it gets down and does those
> things.
>
> Jakub's patch is present in current linux-next.  Can someone please
> send us a fix?

I don't have my git-send-mail-capable laptop with me right now, but
the diff Miguel shared that adds one line to
rust/bindings/bindings_helper.h will fix this build error.

Alice
