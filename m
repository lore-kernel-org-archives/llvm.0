Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33E3659E1
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696704; cv=pass; b=CkxaWdlq3PoR2e7SEuI77vkivwmjq7NnUID9V7kfwEOJqTtpPnaPZbQeZ2a0U5CONeoNli4wmXoG4GMIvBHbP+ZvynYI3CkX6B0nGKq0kAVJq+VlSpusI8Me9brjqzsxSvhvURXcnJJmuu6FrkxYFtAvZdFXb5zhcO1ofEuczd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696704; c=relaxed/simple;
	bh=ba9bbmEAkheiEDws5LhcWEM+6hgQ4UF8udNOuiErZMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5jiVwNw2e+1sPwI0CxxZI7PIaJhShuo5NDD/gegC5Tt8pJM2MrPwNkb5lxAwLsgNk6ubTgojXU1mtjK26+WrKGD8MNvR6U4u8oz2cxa8/Zkx528ZB3payPk0d3whKsUN8RlRSRHbu2vShL0PYW9OGvqQnNO05yxJxEIQeaMdzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fUZZkODE; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fUZZkODE"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-509069a7a7fso197511cf.0
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 14:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773696702; cv=none;
        d=google.com; s=arc-20240605;
        b=cdc/KPPN1rEOZg2w9vRQvep+3L+jZyh5LpjMw2qsCo9C9UNz+X+badapmJsscVMyd9
         IyDl4wrrlJezL3+GVdcS0EkGBNjF1hwkAHktMYOm0AcpNi3Qjmo1nfm3E2A1g+8mqGce
         x3u4LqOePsbOVUxgtAsdBFwrdTJUzzkkj/QJBH7teqqf0J+70izvEs30cGlRkseYr28m
         dGMlhkyX0IkX1dWuKsehWEELZDJU9xOZaZ8wmy6LUgl40ajukLHIWSBkf2t1dsvkTFLJ
         t/C2mEuYM+uwRpDkgJiH3f4/a8XUnB7/6CnzUSN/a4/c7xcnV9P85EMlOuD9KgAbO1nx
         hjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8LVGJ4gIOrfEJj4v39fONwrhQkuquXLDX2xvlgL/L4=;
        fh=k9zboSqirc0aEtwouBrZcwfcJQvKmvwuaU6FLKglfl4=;
        b=gZCHBSwlqRonXPpSP7Zz8ajJvxcN3yIvqALmc7QgmBiZZLnk96AkFouLWBXl20Bb0S
         KjSY9aDP2TePr64I/HtY7dRGAedIKCUHRU0uZJRlUVxepNJZgNaSrlh4YtxkvYSNHioN
         yBCBD+tbi5zjuMWvsyU8suUI0bCC10YyGnxCvgyVqvJdiKa0XSj8cPd2r/9y/qtUR9RY
         Q5c2oaB2WFdk/wjOaxWoStm9QoDG5htgGY7N9uu1mki9e4OSGUyTpbnujybLgML1Hc3N
         W7ES4aD9t+O5f+CPc+kTHyQAxzve26acpG0D5vfA26HydCfc7lI/qVzTgqxFxX8k95IP
         1Nig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773696702; x=1774301502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8LVGJ4gIOrfEJj4v39fONwrhQkuquXLDX2xvlgL/L4=;
        b=fUZZkODEA/MuMiEXPr5YjdUv2QKnfY4oBKH2iUWrnnCL5nodZwzfE7iaLWWoM4vJti
         3cmZz+wPFjeL6sQmmvUz1OFNvytEum1vXxZxqPlsk8WpJv7x9e92WvDQX2uL5yHQVtnr
         awGDjAe059kbJpmCKmxIE0kK7d78BFe2p4o0Q4yddAGp2NijuyfXoht65s+c0JhT+lg8
         jguNp6CP4UR3+o/UpxNnW24DChVwDiKhquAlWv5yEGOduJ5axMLiMOtkohbFglS/rAB0
         uA9a6kcK8SasjFFsWcV6xeQXIQTql9VfrEmgr7kceO21yE+ye3RCLpwVcU4g0WlQP7/r
         9oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696702; x=1774301502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8LVGJ4gIOrfEJj4v39fONwrhQkuquXLDX2xvlgL/L4=;
        b=GXt4fdaEPwF1mhw6S1k1eI0ecG6jGbbPf9kW67eE1hw1QM/cgiB0X+UlAUVrf7zSNn
         g5avEOXspj1soqyBRDE1A/BT+7Q++QttBQkk1lOs57YdpWZJed7Ma0vorxg8vg4aR1hw
         M9cqICdsD8IuGRiB4amV5r3NshKLdC3HLj2U4qKBFnvYF360nohU/Ir6AsPUgnc7MKTR
         CkSAKWrCMfXZihq+e9RN9lrPE7+9hcCywZ9bwLLvrNeI9INUoLJPUMxTxp7x5jYU8Xn4
         PNxgbUvKJre6kGMW/UlYURiH6UfB5v1UB186GcvW5ziD3BueEsdd4xmr013x91MhIDQY
         9Ruw==
X-Forwarded-Encrypted: i=1; AJvYcCVNxaR7UrTtAdQEx9gzqLHno3BEh/UaIjXEj60e0zKFFDjXYvPZPI2bxQnMCOQM4T4Yh3j8@lists.linux.dev
X-Gm-Message-State: AOJu0YwscF+8Bvn9vbfL7k+t+6r0tGEEpkHc3hAyG2t4YnqNJNwLMMII
	TWNALUEdV8LYLuGibCEfEoXFLzoYw/91Lx8gQIlEiJs9WAB4YkE5rljlNlu0g3hazm67WfXGFIU
	WhlWd4itW2xR7/Pbg5VLGSMP8IENRrQ2eI7VhsFLk
X-Gm-Gg: ATEYQzz5JpnwlAm77RiLpmhQyI1H29BdC9lZ7euUczUwELMKjjmrmprbiJFD51mEath
	fQqdax5ACs8CqOvreX3BPiXVOHR4QvIJpq3/pHTvueyjYhi+U+gCBMehJtRMLTfBr0y7rivt/Sm
	YtuaVQqAv2LrkIEuHsdwWZoNi7nHdHfHjvHXUcaTSCYJzj4jUPGtqIrAomJMOv0lupMysoIr5yh
	bp085FjnWhbH1Ry9yYfL9iglS4FaF6M1q3X4FUIlLABC/FVuh3uUb2DHfB3kHY6oMXfAtul38o4
	Exgqy7UA+m2V4Bw72/Gqda2kvpat7i0uCR4=
X-Received: by 2002:a05:622a:310:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-5099ae71297mr1683051cf.15.1773696701012; Mon, 16 Mar 2026
 14:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
 <20260316175953.GA1910339@ax162> <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
 <20260316204311.GA1329928@ax162> <CAF1bQ=TPeLOmRTMcgjVCz2QsJxT4t1FcabPU2ZX2tnanj_QRsA@mail.gmail.com>
In-Reply-To: <CAF1bQ=TPeLOmRTMcgjVCz2QsJxT4t1FcabPU2ZX2tnanj_QRsA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 21:31:29 +0000
X-Gm-Features: AaiRm51-EjV_9PptzDc1hWn5HVjHZU-tvc-Lt3FwH0Czwy-xD602aJIwM7imqNU
Message-ID: <CAF1bQ=Sc__tFmGoHQaehTwk6vyx-akGLXcKVGBJ+vXbstyt=zQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent the following updated patch:

https://lore.kernel.org/all/20260316212930.120438-1-xur@google.com/T/#t

-Rong

On Mon, Mar 16, 2026 at 8:53=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> Sorry that my previous email may have caused some confusion.
> What I really meant was to keep -T (not change to '--thin').
>
> I think Masahiro's change targeted llvm-ar (<=3D 14), where it uses -T
> for "truncate", rather '--thin'. So he used ''--thin" explicitly. But
> this "--thin" was not implemented for some old ar.
>
> Since we the minimal llvm is now 15. The '-T' flag in legacy llvm-ar
> is no longer a problem. We should keep '-T'.
>
> -Rong
>
>
> On Mon, Mar 16, 2026 at 8:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > On Mon, Mar 16, 2026 at 11:16:41AM -0700, Rong Xu wrote:
> > > If that's the case, we can just remove flag "--thin". Can we verify i=
f
> > > that works?
> >
> > I think we can only remove it from the second llvm-ar invocation. I
> > tested
> >
> > diff --git a/Makefile b/Makefile
> > index 2b15f0b4a0cb..fb001e02cc0f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1260,12 +1260,11 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
> >  KBUILD_MODULES :=3D y
> >  endif
> >
> > -# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
> >  quiet_cmd_ar_vmlinux.a =3D AR      $@
> >        cmd_ar_vmlinux.a =3D \
> >         rm -f $@; \
> >         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> > -       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -=
F -f $(srctree)/scripts/head-object-list.txt)
> > +       $(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F=
 -f $(srctree)/scripts/head-object-list.txt)
> >
> >  targets +=3D vmlinux.a
> >  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> > --
> >
> > on 7.0-rc4, which showed no issues. This is basically a revert of my
> > suggested workaround for the original issue:
> >
> >   https://lore.kernel.org/YyjjT5gQ2hGMH0ni@dev-arch.thelio-3990X/
> >
> > You could add this as a prerequisite patch, I don't think it should be
> > squashed into the move change, especially since that appears to be why
> > we are in this situation. Why are we converting from the 'T' modifier t=
o
> > '--thin' in the move patch? I know the documentation of llvm-ar and GNU
> > ar says that 'T' is deprecated in favor of '--thin' because it may do
> > different things on various ar implementations but the kernel only
> > supports these two implementations. I think we should just copy the
> > commands as they are and address the deprecation separately, perhaps
> > with an ar-option like Nicolas suggested upthread.
> >
> > How about a v3 that looks like:
> >
> > Patch 1: The diff above because all supported llvm-ar versions do the
> > same thing as GNU ar.
> >
> > Patch 2: The move patch without changing 'T' into '--thin'.
> >
> > Patch 3: The same as before, perhaps without '--thin' as well.
> >
> > You'll need to base on kbuild-next-unstable [1] to address the conflict
> > with Yonghong's "kbuild: Reduce the number of compiler-generated
> > suffixes for clang thin-lto build" [2].
> >
> > [1]: https://git.kernel.org/kbuild/l/kbuild-next-unstable
> > [2]: https://lore.kernel.org/20260307050250.3767489-1-yonghong.song@lin=
ux.dev/
> >
> > Cheers,
> > Nathan
