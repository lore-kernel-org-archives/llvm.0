Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55C145FE0
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727293189; cv=none; b=J/rB1qfYXRe2DFAFPoDNheQWSEj9A/iYQXzF23XN9IoqbTTsZuOVQwhb3UIzqRovrUub31AE+EL3XgVbKb5PZ07IOiU1SIMMxNNGvOFO02ghhKiv62+M30qM4+EwTUiEiD06kef8nVbu6DXBP/0iTp5pXwO2ntDasxNSdU8J+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727293189; c=relaxed/simple;
	bh=yp4KiWnI55kflWfEV5sb0zGnBH7ciSvhguN8q9bReGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVAJxKoVwIKwQEsxCG4GjsH2YVPIstRGEIUQf/OOMK+x5iO/0wGWh6GJMfLfo4IdOKjLuv0kk8/CRguQyICd7QlZWLuhZfKohr8+QOPdRY5A2JDZrOWToKmSQqZVujP3nEo8/B+Mf7vLBg/wzPEPUMoibLhCFIX+j3DN4g4iRxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m53Jvv0i; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m53Jvv0i"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f762de00fbso2467831fa.2
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727293186; x=1727897986; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp4KiWnI55kflWfEV5sb0zGnBH7ciSvhguN8q9bReGk=;
        b=m53Jvv0iLBgtes/P+L8bJJBOePQl/JoXMu2y4I0YAuzu88pDjOZwaICsMYW4iXYmzD
         kiAoBTOdeYTHiIX1a+tA3LK63h4iR/zfKqfhKhcblhz3BPenRpIIbLbeSv2aR28wB3DJ
         8i4j4xHKNMurbL5A0aq128Hw4GaC+BIJ92WKBIltZ8ARl1o0x72yfwaRXNLD9iqAXQbD
         MQ1ZS4EEbWvqPeqMgQtVheQx9bqpV2ATtbzgCbx9fY2eFLNgjbeCPlQR9MdSgpLF2CJP
         D4wa8GAM5kThdd8gHOA9NETqNYzKWV/A4beyoDVhjDHWSWuBoUBnaoh1DIF/rXFFf4/f
         4fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727293186; x=1727897986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp4KiWnI55kflWfEV5sb0zGnBH7ciSvhguN8q9bReGk=;
        b=wYXAjeT4xq3hmtEPCC8/Nws19A1WbIiP36SEwWGQiRelFZzb4WutuOjRDustH+VVX7
         hedEbDH71phMVcwgjhO+ZqoWn5OrzgFcOLPuK8drlEJ0YPln1UJ6Vh3QhHFYZgJxJKRz
         0J5abZoVUac/UX1dbqSupklx0/H6LFsWf3zsrVGzwmUsBu25r5C8Hw5DfVJnOHihtQ2s
         i0i+yzXszwUVBzWjGh8G4k1I31kpbVg40BK306UHtV45wzMuWvS3TNJGBjm0zYyCLrdc
         ngiCbtrVwEtF14tiZsaH2ANWrAeic1OLFC/48NzMK38+PHfjdLXAJiktxurtl0yVBHrr
         eATg==
X-Forwarded-Encrypted: i=1; AJvYcCVum3LzkZS/6bzv88psEvoOoVOZM08XtYuIN1z91mkWMU3ithmpO34Xby/CB0c8Xb90wd99@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgg4ZO5l+VsoiCcC+kr27jOsJzxsh1rSAph/3aniVA+pGUAVbn
	O0luhtt/x8RDPQrTlwbanKvRXhTF+IxgR+DZn9RgQ4UFTbILk0y7GouFVOukJ6U5K/7aAK6Mffh
	Tmyvk5UQ8WBwIkYqe/dl5lMZtKyU=
X-Google-Smtp-Source: AGHT+IGDMO+ONSKS8XitoA0ITEi5U77wfWogthP7KZ5PTbGU9A+6a8gl715c2Sg7nQwKl7GBJXFXdPzETY/KKnoKxqg=
X-Received: by 2002:a2e:a553:0:b0:2ef:2e8f:f3b3 with SMTP id
 38308e7fff4ca-2f915ff665cmr27096641fa.21.1727293185428; Wed, 25 Sep 2024
 12:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-57-ardb+git@google.com> <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
 <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
In-Reply-To: <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 25 Sep 2024 21:39:33 +0200
Message-ID: <CAFULd4bLuHQvHNaoLJ4DoEQQZZF0yz=uD27m49M+AbYnh=+NzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:14=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Wed, 25 Sept 2024 at 20:54, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Build the kernel as a Position Independent Executable (PIE). This
> > > results in more efficient relocation processing for the virtual
> > > displacement of the kernel (for KASLR). More importantly, it instruct=
s
> > > the linker to generate what is actually needed (a program that can be
> > > moved around in memory before execution), which is better than having=
 to
> > > rely on the linker to create a position dependent binary that happens=
 to
> > > tolerate being moved around after poking it in exactly the right mann=
er.
> > >
> > > Note that this means that all codegen should be compatible with PIE,
> > > including Rust objects, so this needs to switch to the small code mod=
el
> > > with the PIE relocation model as well.
> >
> > I think that related to this work is the patch series [1] that
> > introduces the changes necessary to build the kernel as Position
> > Independent Executable (PIE) on x86_64 [1]. There are some more places
> > that need to be adapted for PIE. The patch series also introduces
> > objtool functionality to add validation for x86 PIE.
> >
> > [1] "[PATCH RFC 00/43] x86/pie: Make kernel image's virtual address fle=
xible"
> > https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgro=
up.com/
> >
>
> Hi Uros,
>
> I am aware of that discussion, as I took part in it as well.
>
> I don't think any of those changes are actually needed now - did you
> notice anything in particular that is missing?

Some time ago I went through the kernel sources and proposed several
patches that changed all trivial occurrences of non-RIP addresses to
RIP ones. The work was partially based on the mentioned patch series,
and I remember, I left some of them out [e.g. 1], because they
required a temporary variable. Also, there was discussion about ftrace
[2], where no solution was found.

Looking through your series, I didn't find some of the non-RIP -> RIP
changes proposed by the original series (especially the ftrace part),
and noticed that there is no objtool validator proposed to ensure that
all generated code is indeed PIE compatible.

Speaking of non-RIP -> RIP changes that require a temporary - would it
be beneficial to make a macro that would use the RIP form only when
#ifdef CONFIG_X86_PIE? That would avoid code size increase when PIE is
not needed.

[1] https://lore.kernel.org/lkml/a0b69f3fac1834c05f960b916cc6eb0004cdffbf.1=
682673543.git.houwenlong.hwl@antgroup.com/
[2] https://lore.kernel.org/lkml/20230428094454.0f2f5049@gandalf.local.home=
/
[3] https://lore.kernel.org/lkml/226af8c63c5bfa361763dd041a997ee84fe926cf.1=
682673543.git.houwenlong.hwl@antgroup.com/

Thanks and best regards,
Uros.
