Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683E2DC79F
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779507008; cv=pass; b=OZsRdW2x4oS3zD/LAfvsKxhVZBymyhj7Hi2q207BIiFjLbAHM/XE4P7cw7dUPQPiQ/exfZmkltx4nAbtYslEPLGPeRirxKO4MqmlLQx3G7wQNV8dG0Kb5i8SMcInpfZVq2eNBk5j7vvhy7a5+hAmWAznX0MwLutUpC2JoBlZxMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779507008; c=relaxed/simple;
	bh=8fhYLevNnBF4qV5jx88wOotlEU/Kvhd9jg/p+f/Zl+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5z+jTtE1o9R3Dp+uERvCzmmXpoxKkLRl4o0JCyz1lXA6E3DkDbIbENnmDXTqoLrtVPHznazL+KKhtd67cVJGhFe1XFYwbvbH4uSepeQcvt5yJoTvvBnD0zv/V9nYhu2F+Xwqbt0hLPGS4+KpGNAN6bQSsUJEPZalOwKKDs85cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h5XQEB5v; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h5XQEB5v"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e61648f10so3341cf.1
        for <llvm@lists.linux.dev>; Fri, 22 May 2026 20:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779507005; cv=none;
        d=google.com; s=arc-20240605;
        b=UM6i25UKVAB3y5Fd6Ad11PpHoySpnRHnyWcALpnjomL87EF2+XV83kZCgL/ytg3xi9
         FC3hgE0TqEY13X19L8O6Rqeh2xLcyb21rhd3zuysK412uuaNmKO5t4AUwZFFFGdtPeP8
         AaqFa/l7VXVIbxHkrDTn8Qfilkz4ScWz48R9BnitQ4NPAuOl18QShiXOXze7deFaovuO
         J5s5+ztAgGRpH/IPLuvFeWScvjODT1mPi5cbUS9qdBtstZ7K0MJOV7RVn4UcH+M4XMkx
         oSkzlXdpXm7Xq2AdcrPeoOM7I1KDjT8p9980Ufqm5C5CibOYQ3W2gJ6OBQ64EUR6Y1nd
         Rw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JK5gLxQbjIkEbCgE/V3XaU3F+kQQGKdHkKUQ+3yQlX0=;
        fh=hHOIi7usnEOs/cDspZEqhtd1M9n7gOwjqUWAUSo3l6U=;
        b=ihiRAWAtg69y7Ki70RKD08c0Pwnh7efpJDWhySl0y5W2oAntgmccaDaBFrQmzhFD+R
         CuvGK6AJ0t21Od3oHlqFAU6wYsvqghQEYQYAQDHazgiYOUbAief2b+axVDtHvgoY+S3d
         ipu4UZyvIcBMfeChHVU4iEAtVnymVDQrPvEC9Gxgs2Hr3KXmzWyvyY6O0cw9jib3/xk6
         4dgeGlEqc93tF+CX6Zv2/Ny9Q2kuYak/Hah0yYRkRDwBcFaQTfPgQH9pEuJ0zTSGkoxw
         qMwZNuoGHf2A+ApRV6hR2boMxuyuK/BlwqvuieCxBS6zzz69ykGM2keONkR+rE+uSeN7
         OKwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779507005; x=1780111805; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JK5gLxQbjIkEbCgE/V3XaU3F+kQQGKdHkKUQ+3yQlX0=;
        b=h5XQEB5vHg+00uCYXFjhn+iXhR2CoKRCv0Yo9yDrda+wUgr7VWCoKghsoKRT15A7pm
         ciPPXV4yaJUewmLwXM/JDBG0tif2jhsjfAXFE2KH+GINd+PmVK+0zzY79QljICRgFIOx
         ZQi0W6YT32C4eEcAXzLtIS5Y/A0nyFZY49I4M3FSuGzBh4PMERtanYkQyUkMLjA68Mlg
         +bswHZ1vYstZLwfCEpMS/vHAdetyF+L+TpoEiEXhxpRcwvWqVoG9rlYu7aY2wfjidyN6
         iavN53GqIUSbamB/SNKzDQrn6l7TW7osWv1+GnVfIjfdzFaSQYSMvXNpkCXT2XicQZWm
         j0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779507005; x=1780111805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JK5gLxQbjIkEbCgE/V3XaU3F+kQQGKdHkKUQ+3yQlX0=;
        b=F2qOzQAKOHbfGDixB+FbetsChso5UF1J3GBzRUi1uRc1PtAtHM+ji5555vE8EFrzVh
         fvp1tAqnrv470RTV4ezXpBr2DOnqPVRA/uu8lAPAmyIu1t/OKYwk7s0Z3WrBdEHGKkEw
         l9BoCZtt+A2UzKR8SG+uhHKvObsBGw5WKcRcW/P79CC7/WD3P7Q/YrZz2yt2TOvQODQc
         3y5JS7k1wIIdF7s+J6rR7MZPeTqYsNaSIoUngCaq2dO6lcB4IMEBBHyn/h8s/A24s8Sx
         +Wde+AiwMyLZ7xQVNyv8NtIWmDLh3B8cYBEToBXbJyb2VDac/7/ZNvSSUxx6n8+v7oCd
         x5/g==
X-Forwarded-Encrypted: i=1; AFNElJ8i/tHUk8Zspfpd11Ox90IeY1bTcfG3/QScgQJS5IAQ78DV3jOdcmzKHlT20uRkJ5cvrQmK@lists.linux.dev
X-Gm-Message-State: AOJu0YzD1d0BpeVWy9lAXftRed1isdjd5sUOb8/aNtupN6we1/9NvwP2
	hjMJiXIjFCrfU3RPjrdwrYU18LR8DLQOwLsTy/6BEUR9+xWOH6eB3gxZJjH7KBEWisTR6h+vkjG
	OkAa+1w7XCVE2m7+v8YQRGIx7vbDoOLo9uIUJhTOj
X-Gm-Gg: Acq92OFqFHknjMJHhod/FWeZx1VvrjF0c/I0P80rSg0C8LHqJyPV5g3jH5n1VnBL77G
	TiZFnlUlljG4H4hnxyA/JY9xBAdYFX2qmBNni1UDf6uF8NDunwb99H4iuHqcdkxTz40jL7k6Swh
	mh1IsAuLOrCGNLNj4+W/satoh8HSgktHg6YWIYcn9B2zNEva5QKCxTd5xtW6JIo4aEEwlM3tkRs
	+7UvsJW7cKeYi1h9GbLA3WIwj3BJjHqbBAIw5acldzgtuwDjRc+3hqPGnznlg8YsWXuAGp85I8h
	hw2wIA+XB+rDc6CYrE9wBNSh4WgM/w==
X-Received: by 2002:ac8:740d:0:b0:50f:d03e:6482 with SMTP id
 d75a77b69052e-516e1420bcdmr4200341cf.4.1779507004366; Fri, 22 May 2026
 20:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331154827.2793269-4-xur@google.com> <20260331162729.GA2006419@ax162>
 <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev> <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev> <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev> <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
 <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev> <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
 <20260523011721.GB520407@ax162>
In-Reply-To: <20260523011721.GB520407@ax162>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 20:29:53 -0700
X-Gm-Features: AVHnY4KMRqv8x9cFMRsJgYipZ3Ido1JNxvYz-UijLOJrxb35a4lmr5hy5RjuEZI
Message-ID: <CAF1bQ=ScvbDL4TY8=FJzwULP9KS-aZ4K=o4f+QxGssca+Q7ovQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nathan for comments and suggestions. My comments are inlined.

On Fri, May 22, 2026 at 6:17=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, May 22, 2026 at 11:58:35AM -0700, Rong Xu wrote:
> > On Fri, May 22, 2026 at 11:44=E2=80=AFAM Yonghong Song <yonghong.song@l=
inux.dev> wrote:
> > > On 5/22/26 11:14 AM, Rong Xu wrote:
> > > > On Fri, May 22, 2026 at 10:52=E2=80=AFAM Yonghong Song <yonghong.so=
ng@linux.dev> wrote:
> > > >> On 5/22/26 8:32 AM, Rong Xu wrote:
> > > >>> On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.s=
ong@linux.dev> wrote:
> > > >>>>
> > > >>>> On 5/21/26 11:31 AM, Rong Xu wrote:
> > > >>>>> Yonghong, thanks for the update.
> > > >>>>>
> > > >>>>> Regarding this guard: ther is a period of Clang (before this pa=
tch and
> > > >>>>> after your first patch), even though ld.lld having these option=
s
> > > >>>>> (specifically --lto-whole-program-visibility -mllvm
> > > >>>>> -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mo=
de
> > > >>>>> remains unsupported, correct? What the behvior of using this op=
tions
> > > >>>>> in distributed mode with these compilers? nop or it will lead t=
o
> > > >>>>> error?
> > > >>>> The in-process thin-lto support is landed on Feb 27.
> > > >>>> The distributed thin-lto support is landed on Apr 24.
> > > >>>>
> > > >>>> If people are using distributed thin-lto in kernel between Feb 2=
7 and
> > > >>>> Apr 24, there will be some issues. But people typically use rele=
ased
> > > >>>> compiler, so we should be fine.
> > > >>> This is not the case for us (google). We do use compiler b/w rele=
ases,
> > > >>> and we build our own.
> > > >>>
> > > >>> What is the issue if we use the compiler in b/w Feb27 and Apr24?
> > > >> If you use the custom compiler between Feb27 and Apr24 and your ke=
rnel
> > > >> will do distributed thin-lto, you can remove
> > > >>      $(call ld-option,--lto-whole-program-visibility -mllvm -alway=
s-rename-promoted-locals=3Dfalse)
> > > >> from your kernel. Since you have custom compiler, you can
> > > >> do some customization for your kernel as well.
> > > > I am referring to this specific patch -- there are cases that use
> > > > custom compilers built between the February 27 and April 24 LLVM
> > > > releases.
> > > > I don't want to see any breakage for distributed ThinLTO in these c=
ases.
> > > >
> > > > I would prefer to keep this guard for distributed ThinLTO for the t=
ime
> > > > being and remove it later. What do you think?
> > >
> > > For 'remove it later', when this will happen? When llvm23 cuts the rc
> > > in July or cut the release in September or the end of bug fix say in =
December?
> >
> > I can remove the guard when the minimal clang containis the 4/24 patch.
>
> I think we could just change
>
>   ifdef CONFIG_LTO_CLANG_THIN
>   KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility -ml=
lvm -always-rename-promoted-locals=3Dfalse)
>   endif
>
> to
>
>   ifneq ($(CONFIG_LTO_CLANG_THIN)$(CONFIG_LTO_CLANG_THIN_DIST),)
>   KBUILD_LDFLAGS +=3D $(if $(call clang-min-version,230100),--lto-whole-p=
rogram-visibility -mllvm -always-rename-promoted-locals=3Dfalse)
>   endif
>
> when LLVM 23.1.0-rc1 is out to avoid that Feb 27 to Apr 24 breakage?

I don't understand why we need this new "ifneq ..." guard. We have
already checked CONFIG_LTO_CLANG=3Dy, and CONFIG_LTO_CLANG_FULL !=3D y.
I think this "ifnef ..." will always be true (so redundant).

>
> > > If we carry the guard (for distributed thinlto) in this kernel releas=
e,
> > > that means at some point, we will need to do kernel backport, extra w=
ork.
> >
> > I don't understand here: this is part of the distributed thinlto patch
> > that you would need merge anyay.
> > where is the extra work for backporting?
> >
> > > Also, since you are building custom in-development compiler, you can
> > > disable this flag -always-rename-promoted-locals, problem solved, rig=
ht?
> >
> > I'm not only talking about me. There are other users also use this way.
> > BTW, even in google, I don't control the compiler that being used.
>
> So in general, we assume that folks who are using prerelease compilers
> (i.e., 23.0.0 in this case) are upgrading them regularly, as we may need
> to workaround or fix issues that happen in main that cannot be
> dynamically detected (at least not easily or conveniently). For example,
> recent main versions of clang have support for -Wattribute-alias, so we
> need to turn it off via #pragmas like done for GCC, which will break
> things for clang-23 versions that do not have -Wattribute-alias:
>
>   https://git.kernel.org/nathan/c/bc5ffe737f56ee2734597069ed71f4883054948=
3
>
> So the argument about breaking compilers in between Feb 27 and Apr 24 is
> not really relevant in my opinion since they should be short lived in
> terms of deployment. However, given that things work the way the check
> is currently written and the LLVM 23 branch is only a couple of months
> away, I am fine with just sticking with how it is currently written and
> updating it when things are more guaranteed to work.

This works for me. I can add a comment here.
Like the following:
=3D=3D=3D=3D=3D
 ifdef CONFIG_LTO_CLANG
-ifdef CONFIG_LTO_CLANG_THIN
+ifdef CONFIG_LTO_CLANG_FULL
+CC_FLAGS_LTO   :=3D -flto
+else
 CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
+
+# The following clang options added on 2026-02-27 lack distributed
+# ThinLTO support until the 2026-04-24. Disabling for distributed
+# builds until the minimum clang version is updated.
+ifdef CONFIG_LTO_CLANG_THIN
 KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility
-mllvm -always-rename-promoted-locals=3Dfalse)
-else
-CC_FLAGS_LTO   :=3D -flto
+endif
 endif
 CC_FLAGS_LTO   +=3D -fvisibility=3Dhidden
=3D=3D=3D=3D=3D

If you are fine with this, I can send v10 for review.

>
> --
> Cheers,
> Nathan
