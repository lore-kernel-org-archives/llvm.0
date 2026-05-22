Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577302CCB9
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476332; cv=pass; b=fsYhPwJWnelp15HSYeNCCRbafNVetHJLRRTc3Az8P1Fev6cmK2jIf2ROsylW2/DBb4iw8PeDi3vz8ctzvalza+lLmiC956HAQrZxUZU+Kvyq2Ns0hOICRJ1VQRjTFsxRKlargwHsfZwjcxr0S3oWcuHYBZYe1B9dRE9QLyBOcG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476332; c=relaxed/simple;
	bh=hRFS4cmhynTPVd4GrMfoxSj6j39EY7It1MyHgoE9fjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iC33A9p/q/7xJVKdqZkaVRYcZDIYMiFGDu5M3JfxdRwHX1OHWiNIvV7Qv/muFJ32mvClOk2TYTTqckt3UnFSuKVUxD8dd3xrCFORfAfbkMjZxet247Dir0oTrwBv/l2bpoPbSxNkeeDUSOIf7CEGqy/iPvA6LudZlbVHpXx0TsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IDFYhYTU; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IDFYhYTU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so36a12.0
        for <llvm@lists.linux.dev>; Fri, 22 May 2026 11:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779476329; cv=none;
        d=google.com; s=arc-20240605;
        b=lf2Zm0ZXC6ZWyPXdVuB4DmbCLRSlD8cBJsB4uianQctMi96DKF5d2lZqN7g3XktsXZ
         B53N/EcD2WxjuMwNgOXFZKy7uwv378LQTHQF4H5usKsvcZ2rdttFuVhL7/bKOs6K3GE+
         4gsNatx6gqSXprT3imTwLWcq8RFfMqtXIHmY6ufpQlDs4vj9nLsyo7lzeo0Gzc6hdwQk
         MrN8fJYlRhFVWf+N22ZotpJ/AMyQXOxiRVkpJI+GTuO2gF3nlOdGp0oloQ15QtQmhRUH
         jeW8pmQeIRlaHUWimxVj0K9NDUrMgAOIVK7wzLfYQ090p8FQFMdJltV64V4LJDtVjRL0
         VmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMwz4z+EA6zNQCbHPb/YJJbfZgdDZSR5G08ccyLBu/U=;
        fh=81O/ix9nokHOU9X2C6F+BAZnNkbmEUjqWVBKgXmXoOo=;
        b=cm76ntVbkSOQt/VQorV+ta4N8Ka4hcyESezUyqrej996S39Qohq/phir+xWS+vUCKr
         rTolxSrLbj1IagXhHazTeQMuCYgyiVaLSGa2u5ikkx9iGLBKj25kuurSB4O+/UdPlNY4
         ONENqlwciyLi0/g5p4pi9ihvp/SM+ktTREH7OVRtPg0vf96BZtBWsHxMyVpMoFHOkCaJ
         1rzv3vDdJmUPfFOLykTWLAE3llpLVPF8aSVIDWdqRlN4pVIknTnpM1uDkwgbt3Gy/TZm
         QTutNLwdu7599TtqR7SzSfCI7bszsCgLNLhhYNnbA4P4O1sEKY5IysucPqXRLYMDgT8G
         Qh6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779476329; x=1780081129; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMwz4z+EA6zNQCbHPb/YJJbfZgdDZSR5G08ccyLBu/U=;
        b=IDFYhYTUM9l7df0cLHZzCP8MSWsfYrmJssSkTug3IW9kEqehBXiLdOCoi4ggXf967V
         RU2otVhhvMawkFPdADE+Q9ykqCL0gAXOstaQtrxmtJIa4XflAZd83Bs54cVt3EoJbqkI
         aUzuVDwZ0jlUfHJZ0jORMj7YmihOghT+OpOBOUPAL6v7sEz8DJzclSeuzRkrHlsPPN+L
         xr2caZV6PSJ6MOYu4fhKkOvEQNoMWV1JnqbuwMLnzO476mek5ahvENzp3MlRgNKkBlBm
         pjqMgCxP3NtLINXnPHlg2bi09CDD+gAxzsJ+ZhP4n6fRMI6lRcHbkj9GamevnknPLrR4
         Mtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779476329; x=1780081129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMwz4z+EA6zNQCbHPb/YJJbfZgdDZSR5G08ccyLBu/U=;
        b=cAFqCNo64XCCOwcxgFNeoBuqJXlOQjTA/HyquIp1wU2fBgs/+pzGSSmK8e6A+/JRIa
         JNzN90XmzmLDtQeqHO9Ivxi2+Jpwp3VgCjYj8Ve4i5fsrDuQqLhwIEAUNE+ErhG/blux
         RPhUvVAnBJ/FC984Pez66MigvOZWa7Q/8TRFSpQ/IG0Y0WV6vDyaZ4kDzeJsR5puHhmR
         RHQAegL7MI7zIVxuHdrVCvn4INbY107zmVzq6BYNNt2Y1s0U9d49ODyflu/p8YqVZ8ux
         QOX05pSCYdWuKafBxysqda42F4O98Pe5sPAWdQp+OGZWGLayLjDgf5iyxCTfOBOOGeac
         K9dw==
X-Forwarded-Encrypted: i=1; AFNElJ8M8mwzC2JzOV6xHSSSVLwdkFhXTIb4lR8sLBKbHGH00npyNV5bMr3akL+p3hnzJpb8OUFC@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ/jYpX8j+ImNAyzODp9YsCUkzE8ZhE47gtAcbrP0SzyalXSAF
	VaAtziPZ7xSbnPWeihvFYtVy0onTEnzeLFk/oK5Z1c+GGYEJ00T9KWlpeLdiG6OlkryB6HEtTTC
	RlRz/oCJg+pohE7PWqjrmXVtL3g0Js41kp+xRtU27
X-Gm-Gg: Acq92OH4t0S30yb6uQ4zsFdXCB/dw3GA6AQel7RfimnBUXGOcROvIhC4JXyqe5iGVBM
	gCgO7mhEucwlzOcoR4kMCBzDdT58QtDRgv7yH+eSqVjKJC5giVTO089vm/GF4TPnSYsawe2OXFd
	RxqrEUzWeq8zwbmpFxDxOm8b6Hy0gZrErvNhqj0uR+kYF/eUNAZh9XdLNVaSZwemCLkI5RlkkLD
	JN3uYGeShx0X2zfDRboTxUjX3lDfzPMnLpDis9nrRWBCsk7GLayohbarcuGYJvcaG0nO/GDXwSj
	A+IVF5cAorLF3Nxwygs=
X-Received: by 2002:aa7:ca4d:0:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-688fd149e71mr7025a12.10.1779476328245; Fri, 22 May 2026
 11:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev> <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev> <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
 <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev>
In-Reply-To: <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 11:58:35 -0700
X-Gm-Features: AVHnY4K3cFIW6JK6tgXDuCP9vy2W1rymg6sZaGXje-miO-XEwEi8PJimZKWBOaw
Message-ID: <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang ThinLTO
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Fri, May 22, 2026 at 11:44=E2=80=AFAM Yonghong Song <yonghong.song@linux=
.dev> wrote:
>
>
>
> On 5/22/26 11:14 AM, Rong Xu wrote:
> > On Fri, May 22, 2026 at 10:52=E2=80=AFAM Yonghong Song <yonghong.song@l=
inux.dev> wrote:
> >>
> >>
> >> On 5/22/26 8:32 AM, Rong Xu wrote:
> >>> On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.song@=
linux.dev> wrote:
> >>>>
> >>>> On 5/21/26 11:31 AM, Rong Xu wrote:
> >>>>> Yonghong, thanks for the update.
> >>>>>
> >>>>> Regarding this guard: ther is a period of Clang (before this patch =
and
> >>>>> after your first patch), even though ld.lld having these options
> >>>>> (specifically --lto-whole-program-visibility -mllvm
> >>>>> -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
> >>>>> remains unsupported, correct? What the behvior of using this option=
s
> >>>>> in distributed mode with these compilers? nop or it will lead to
> >>>>> error?
> >>>> The in-process thin-lto support is landed on Feb 27.
> >>>> The distributed thin-lto support is landed on Apr 24.
> >>>>
> >>>> If people are using distributed thin-lto in kernel between Feb 27 an=
d
> >>>> Apr 24, there will be some issues. But people typically use released
> >>>> compiler, so we should be fine.
> >>> This is not the case for us (google). We do use compiler b/w releases=
,
> >>> and we build our own.
> >>>
> >>> What is the issue if we use the compiler in b/w Feb27 and Apr24?
> >> If you use the custom compiler between Feb27 and Apr24 and your kernel
> >> will do distributed thin-lto, you can remove
> >>      $(call ld-option,--lto-whole-program-visibility -mllvm -always-re=
name-promoted-locals=3Dfalse)
> >> from your kernel. Since you have custom compiler, you can
> >> do some customization for your kernel as well.
> > I am referring to this specific patch -- there are cases that use
> > custom compilers built between the February 27 and April 24 LLVM
> > releases.
> > I don't want to see any breakage for distributed ThinLTO in these cases=
.
> >
> > I would prefer to keep this guard for distributed ThinLTO for the time
> > being and remove it later. What do you think?
>
> For 'remove it later', when this will happen? When llvm23 cuts the rc
> in July or cut the release in September or the end of bug fix say in Dece=
mber?

I can remove the guard when the minimal clang containis the 4/24 patch.

> If we carry the guard (for distributed thinlto) in this kernel release,
> that means at some point, we will need to do kernel backport, extra work.

I don't understand here: this is part of the distributed thinlto patch
that you would need merge anyay.
where is the extra work for backporting?

> Also, since you are building custom in-development compiler, you can
> disable this flag -always-rename-promoted-locals, problem solved, right?

I'm not only talking about me. There are other users also use this way.
BTW, even in google, I don't control the compiler that being used.

>
> Nathan, what do you think?
>
>
> >
> >
> >>
> >>> -Rong
> >>>
> >>>>> I would assume there will be errors; otherwise, you would not ask m=
e
> >>>>> to change my patch last time. In this case, I would keep this guard
> >>>>> and remove it when the minimum llvm version passes llvm23. What do =
you
> >>>>> think?
> >>>> There is no need to keep compiler version guard.
> >>>>
> >>>> Before llvm23, the below will be a noop:
> >>>>       $(call ld-option,--lto-whole-program-visibility -mllvm -always=
-rename-promoted-locals=3Dfalse)
> >>>> since '-mllvm -always-rename-promoted-locals=3Dfalse' is a new flag =
and the compiler won't
> >>>> recognize it so the kernel will resolve above 'call ...' option as n=
oop.
> >>>>
> >>>> With llvm23 and later, the kernel will be able to recognize above op=
tions and
> >>>> things should be okay.
> >>>>
> >>>>> Best,
> >>>>>
> >>>>> -Rong
> >>>>>
> >>>>>
> >>>>> On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.son=
g@linux.dev> wrote:
> >>>>>> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> >>>>>>> Hi Rong,
> >>>>>>>
> >>>>>>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >>>>>>>> diff --git a/Makefile b/Makefile
> >>>>>>>> index 69ccf9b8507d..26005c64016d 100644
> >>>>>>>> --- a/Makefile
> >>>>>>>> +++ b/Makefile
> >>>>>>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>>>>>>>      endif
> >>>>>>>>
> >>>>>>>>      ifdef CONFIG_LTO_CLANG
> >>>>>>>> -ifdef CONFIG_LTO_CLANG_THIN
> >>>>>>>> +ifdef CONFIG_LTO_CLANG_FULL
> >>>>>>>> +CC_FLAGS_LTO        :=3D -flto
> >>>>>>>> +else
> >>>>>>>>      CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >>>>>>>> +if CONFIG_LTO_CLANG_THIN
> >>>>>>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mis=
take:
> >>>>>>>
> >>>>>>>       https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >>>>>>>       https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d=
7@linux.dev/
> >>>>>>>
> >>>>>>> Please slow down and test build your changes before sending them.=
 Each
> >>>>>>> revision adds four new emails to everyone's inbox, which is just =
noise
> >>>>>>> when there are obvious, basic problems. 'b4 diff' shows no actual
> >>>>>>> difference from v8 and v9, which should have been caught by a sim=
ple
> >>>>>>> build test right before 'git send-email'.
> >>>>>>>
> >>>>>>>>      KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-vi=
sibility -mllvm -always-rename-promoted-locals=3Dfalse)
> >>>>>>>> -else
> >>>>>>>> -CC_FLAGS_LTO        :=3D -flto
> >>>>>>>> +endif
> >>>>>> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be re=
moved.
> >>>>>> See llvm patch
> >>>>>>        https://github.com/llvm/llvm-project/pull/188074
> >>>>>> which supports distributed thin-lto mode too for reducing the numb=
er
> >>>>>> of renaming. In other words, for llvm23, both in-process and
> >>>>>> distributed-process are supported for thin-lto.
> >>>>>>
> >>>>>>>>      endif
> >>>>>>>>      CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>>>>>>>
> >>>>>>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>>>>>>>      CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>>>>>>>                modules.builtin modules.builtin.modinfo modules.n=
sdeps \
> >>>>>>>>                modules.builtin.ranges vmlinux.o.map vmlinux.unst=
ripped \
> >>>>>>>> +           vmlinux.thinlto-index builtin.order \
> >>>>>>>>                compile_commands.json rust/test \
> >>>>>>>>                rust-project.json .vmlinux.objs .vmlinux.export.c=
 \
> >>>>>>>>                     .builtin-dtbs-list .builtin-dtb.S
> >>>>>>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>>>>>>>         $(call cmd,rmfiles)
> >>>>>>>>         @find . $(RCS_FIND_IGNORE) \
> >>>>>>>>                 \( -name '*.[aios]' -o -name '*.rsi' -o -name '*=
.ko' -o -name '.*.cmd' \
> >>>>>>>> -            -o -name '*.ko.*' \
> >>>>>>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>>>>>>>                 -o -name '*.dtb' -o -name '*.dtbo' \
> >>>>>>>>                 -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>>>>>>>                 -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> >>>>>>> With that addressed above, the series survives my basic LLVM 22.1=
.2
> >>>>>>> build test with my distribution configuration. I'll provide forma=
l tags
> >>>>>>> on a properly tested and fixed revision.
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Nathan
>
