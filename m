Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C41DA27
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 23:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707952263; cv=none; b=VFrQB+n09uyAcabYm0fEY3DJbOGlmWESuIAJnLXK6C0uhyaG8Sh2/jMrP49Hqi5QfSBw3xaxwtBvZeEwfTOOv4v+ZuMjTuy5vx0r0efYllpiVsvScA6SOZuUcbCXuuDlXiDXFpuQNDOk64E11K2QmmBZPiL6ao5bbpzl9F7Oamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707952263; c=relaxed/simple;
	bh=UW8RGf9gZBE71QcUMtK+MfmU0jrUtwnNwb7STvh115o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqLfaLTZzHjQkZ0TchYWyyeBbOvHRKOjtkNGWzLnGwDI2Dy74EjZSlrZOwS0/fT6ktagJL+cy0xkYd2gnp+nuzJEzMiRcBbn5oGtW2ofbTE3B8QwSifCvX42XKOGbYhqQUAcQInSgAjLrK8Cavo2BVQsH5njtgeoBswkofSdva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBGNGpfW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBGNGpfW"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4120933b710so11755e9.0
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 15:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707952260; x=1708557060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFdP6RSMwEWacxovIP52kptkXcSgN4Mbf51UhpxEIDc=;
        b=CBGNGpfWz5Y6MAMjNFiEeZQtkaPWPMNAVslKfruunx+1/9CaG2BrveKNbNz7vGb2+8
         Du8RRDjOMHESyB12zOf2fh/D+aFec/f7noVCtO75P5AZG9+8QAfVlIYAr4FpKMKKyOZT
         41Q4tqxH3MrSxCsa9Ju0nACBhU6KCL1twRqYc9XHl2aWpLPMuTGcQJpUbvsuDhbDyS3e
         7ex2dyOz7NHoAGbMcapmks/glAYOEwCHhgzSd2WGC18fcBoAXgj6mJxSxo6LBDRbln9e
         foG05MzA3XtuSyTYNrZHLpIsEUj15jjXTd09dsk2a3a0pwiSpO9TwmOfmaSZCwRWnTqL
         uC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707952260; x=1708557060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFdP6RSMwEWacxovIP52kptkXcSgN4Mbf51UhpxEIDc=;
        b=RopDjHwfcriwh7dzWooYExKW8tuzsU9gDrhklL7vmgTB9RNbGxN3o42FppREwnsRBl
         8Z/GA6Woo8km+jfVHtWmI61i/6K/dvsWcs0egoN59/go3XmGC7eOFyAr7agU/mNyEJsj
         5LElQlsdQfCAeh6mozfpJHHzdk2H1BwKaS45EBrYh+vuXpXnjE9+gx8GPa88T8xirKah
         qqsFu0KDcFtIREw3Yd/aP//e0lCBlZ4mfPRdPAqpOiHdI1se2xkT3ifiVxLWt0eSqfKa
         TF7FqU5DH5x7FaYOdZn57iEZDLVDoDj3vMJ9LcI3HgvteOy1WFBptWDiuRqbiMaNtlsz
         ebOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUJto78jeE70yw/JZ4sZznI5rPBP7TaUpE23T17UGP0HUVT/MuDN066ZHWJLxUxIsnvR+pbXWEvN/c8IRpsUHYvuNgKA==
X-Gm-Message-State: AOJu0Yw/O+i7NsugkMKHZbzrdUV75lVh1ktizqdq7DyU0CRLMddEJ3Vp
	doeDJJfE4Zq+l00j8hi9VkS1cx/U7wcK2uJuFV+0lWnx0zNKKOkDXlXoFyNvQY0K9dFc0UTilYg
	7LpBUcFwNwqhmsl4Rh0KZm/4xN0Ntcvd/MOhN
X-Google-Smtp-Source: AGHT+IF/GMoDj0jOjVDt9C1sIgJVOb6+Nx4zE7qML7SwDzztZ+XjdTZSiyVZzroVRAotbePaXYYVUQbDyXUc8oU9ToQ=
X-Received: by 2002:a05:600c:1d93:b0:411:cdf8:f3d1 with SMTP id
 p19-20020a05600c1d9300b00411cdf8f3d1mr347227wms.0.1707952259858; Wed, 14 Feb
 2024 15:10:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240214212929.3753766-1-maskray@google.com> <202402141405.0755DD4E5E@keescook>
 <CAFP8O3LWBHkbLwFJdmy7iSGD0cMSy1jczETo=N6oVapCgPY=sA@mail.gmail.com> <202402141433.AC69F2A3@keescook>
In-Reply-To: <202402141433.AC69F2A3@keescook>
From: Fangrui Song <maskray@google.com>
Date: Wed, 14 Feb 2024 15:10:46 -0800
Message-ID: <CAFP8O3JZ9=QeJR0wZwYvLYVgXKo9DYBMsaxoBS9vLJZW-U1uZw@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Simplify patterns for unwanted section
To: Kees Cook <keescook@chromium.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 2:40=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Wed, Feb 14, 2024 at 02:13:01PM -0800, Fangrui Song wrote:
> > On Wed, Feb 14, 2024 at 2:07=E2=80=AFPM Kees Cook <keescook@chromium.or=
g> wrote:
> > >
> > > On Wed, Feb 14, 2024 at 01:29:29PM -0800, Fangrui Song wrote:
> > > > A s390 patch modeling its --orphan-handling=3D after x86 [1] sparke=
d my
> > > > motivation to simplify patterns. Commit 5354e84598f2 ("x86/build: A=
dd
> > > > asserts for unwanted sections") added asserts that certain input
> > > > sections must be absent or empty. The patterns can be simplified.
> > > >
> > > > For dynamic relocations,
> > > >
> > > > *(.rela.*) is sufficient to match all dynamic relocations synthesiz=
ed by
> > > > GNU ld and LLD. .rela_* is unnecessary. --emit-relocs may create .r=
ela_*
> > > > sections for section names prefixed with _, but they are not matche=
d by
> > > > linker scripts.
> > > >
> > > > .plt instead of .plt.* is sufficient to match synthesized PLT entri=
es.
> > >
> > > Do you mean ".plt.foo" matches ".plt" ?
> >
> > I mean we just need .plt : { *(.plt) } , not .plt : { *(.plt) *(.plt.*)=
 }.
>
> But then, for example, if it gets generated, .plt.got ends up being
> reported as an orphan...
>
> >
> > The linker synthesized section for PLT entries is .plt, not suffixed.
> >
> > > > .igot and .igot.plt are for non-preemptible STT_GNU_IFUNC in GNU ld=
 (LLD
> > > > just uses .got), which the kernel does not use. In addition, if .ig=
ot or
>
> Right, the issue has been getting totally weird sections emitted by the
> linker. If you're saying you'd rather those get reported as orphan
> sections instead of being validated for being zero sized, and that works
> for all the architectures, then okay.

Thanks. I trust my judgement here:)

> > > > .igot.plt is ever non-empty, there will be .rela.* dynamic relocati=
ons
> > > > leading to an assert failure anyway.
> > >
> > > I think at the time I was dealing with avoid multiple warnings out of
> > > the linker, as I was getting orphan warnings in addition to the
> > > non-empty warnings.
> > >
> > > >
> > > > [1]: https://lore.kernel.org/all/20240207-s390-lld-and-orphan-warn-=
v1-6-8a665b3346ab@kernel.org/
> > > >
> > > > Signed-off-by: Fangrui Song <maskray@google.com>
> > >
> > > Is anything harmed by leaving all of this as-is?
> > >
> > > -Kees
> >
> > No harm. But ports adopting --orphan-handling=3D (like s390) may copy
> > the unneeded .rela_* .
> > When people read .rela_*, they might think whether the kernel does
> > anything special that
> > .rela_* needs to be matched.
>
> I added these because the were being generated. See commit d1c0272bc1c0
> ("x86/boot/compressed: Remove, discard, or assert for unwanted sections")
>
> I don't want to suddenly start generating warnings for older/broken
> linkers. (i.e. a change like this needs really careful testing, and that
> needs to be detailed in the commit log.)
>
> -Kees

I saw this commit and still believe .rela_*  is unnecessary for all
supported binutils versions.
GNU ld 2.25 does not support --orphan-handling=3Derror (2015-09
feature), but it manages to link vmlinux without any warning.

/tmp/binutils-2.25/out/release/ld/ld-new -m elf_x86_64 -z noexecstack
--emit-relocs --discard-none -z max-page-size=3D0x200000 --build-id=3Dsha1
--script=3D./arch/x86/kernel/vmlinux.lds -o vmlinux --whole-archive
vmlinux.o .vmlinux.export.o init/version-timestamp.o
--no-whole-archive --start-group --end-group .tmp_vmlinux.kallsyms2.o


> --
> Kees Cook



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
