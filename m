Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D353603F7
	for <llvm@lists.linux.dev>; Thu, 21 May 2026 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388317; cv=pass; b=sXX31bK4I9aB4C5X+GX1ObMNtLTm89FuYG3rdClUpXJ5NsXP2yPtl0SWOPJb03mRhJySEwLv0UopnawhbNMvOyxEW/ZIzCPb/xY/EVLtgGJ5zoTlVHT6mhfm46nA3xIssS7meAN0bo1mIya8uornB+zHHw9wQPU5FRL5Icrwjgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388317; c=relaxed/simple;
	bh=JCUL6BVAaRV0BJqq4ez4qxChXAzJLI8JUaO8Tc9BWzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFA00JtFyQnieLlejdGWIN+h6fn15G3Jv0PgU/HoUEMlLSjbF5/EgMVJSphBSmKLZXUpDn12vwwvdIj40nVbJCvc5OzSbKy+aMSks+Gy+XtgaM9OF5/wz40lW9HYs/WnVjdUFdmXN6ht3802ihGcXe7n+UxGxKTCqGsrC01I3IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tk0mLIBx; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tk0mLIBx"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-515548f390fso1201cf.0
        for <llvm@lists.linux.dev>; Thu, 21 May 2026 11:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779388315; cv=none;
        d=google.com; s=arc-20240605;
        b=h4OdgbO9u6PGdV/rHiN27oTTrO07Se2ljOMoGcCrSD9JmV9svSiJWwKxx2meV6jWlY
         4uutDzqlM96T8hpmgJNifG2CFdxI4sR42tGoTbSQH1kNK/lPeJCl5bRzv9KJu3UmLna/
         7Bwo0hIB8ktW+OcwvLlNPckiMH4hCBO0L9viUhZvWLdDwzUgyrDruWbbX0OKqv1rnf3X
         XRDYui9bUxh3z4CzHDLGUbNgYWkfV+5mMA2Nlha1gvkP+1y30m2drEGBmV+baehqwba/
         JQqXXFO778YMy4u/NyuaDCGVX3BlQqV/J2sNATHzAVFSg8RCWWepPqL1zpj4NmDlQek2
         d2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4HPdoCW0jGYUIMarCqD5b6sgxXyrUSlqYmstTvtcfA=;
        fh=IRJzgwvdnjAqPjCjyBE1E+Pbc7FdB5jwYAcKZcxrMr4=;
        b=Xx7wf5dT9zsbjzlRWEgvuoLk7oHarVKnKKcTYowt7+NiFYkiLz3Qsfa6/vo4GkTee9
         fg3whRtBPFl4XcIjxFuw0hDjLcnxHBSYDH+C8T3JbtkqzRmFAm5r8jCzfGmkBVEBpS7e
         LSelm2h5g0fxC+aiUHYyzZa0vBOsYExlvT9w1T9hucutPnILjwn6pg723F0tDHlIWfSW
         Y1Fa6VYcSNs4Udt1SC0j1M9BKpLyVjXSLBl2ZSJsnH65+0mth595NEbGvE2BzAswBPhA
         8dC1/ErC/fb1qDzCHwKRvM1Z5oNbWY5o++iPHh1jALoLfISvgUNk4OcoD/n1AU3lt6nn
         Iv5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779388315; x=1779993115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4HPdoCW0jGYUIMarCqD5b6sgxXyrUSlqYmstTvtcfA=;
        b=tk0mLIBxQhb6NS+b++20sCSej9oEXIhHv1Mh9mfRZqu3rlJAytbOgsKvsbKplPovg7
         dVuMEREl3YVSLksmBhLweEByEmFp+WxndC0S94qEcwUfGQ9PMUiayUe/dwZ2o29g1oQh
         Pur2Pvv6sL8yWgeNkAkDlaZv9Xhw1WX6zN5FUAoFK3ZmLIQdGBkAvfeB869l7CXWAbFS
         +8hi2uuYiD/joe6k8Mv1WcstmWaiIqPauHRLwGFyhG6lLYOq4K3nUPgW8jxJdURlSgPK
         2JUkVw3H9GwPbo3LozMd+tfUPwgl+yOf30P6/M63HPTmAmNQ8DAGk8fFkxT23yRKm/GB
         vUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779388315; x=1779993115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4HPdoCW0jGYUIMarCqD5b6sgxXyrUSlqYmstTvtcfA=;
        b=NpvGfDYkRNR+M5gmldP5cWDO1CZu9wUPWdw8Dgex7mCpQ1zX8QJUqzLn06kuZwsflC
         MbYrvq8B3jJPKHEkUKDjcQz4864NcQWvVQZdv4ujIbRpgbiDUC9cmGIEh6FgRcuDMFJY
         BXA8kBypqD7MFXH9BHOsaOM515B+PHJ3ZWJopfYtW1umOmwTOEAqdvtL6eVT9wXDBT+F
         vq3RLS/UslMv9E07s+6aqmJEjQAVqSJqapfOZcGX94HKCKsF2PgIt6T6splTF8KeXqOr
         +NuJQ8uFvTU3+zPZuOO+kwG5McXhJWQGrATDXt25fIeY8AZnvuGAHHKrEeLlDAekS7S7
         r28A==
X-Forwarded-Encrypted: i=1; AFNElJ8AKDY9rKgr5Qm+PZNmfHrfJRbkhdNx5VniCPsXD28XuZtiIycvniSti60ynEQG9uPzU4Me@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdssfa/bhyyfk2kgfxoYWATZhqy+MQ8h+xub1CGemUir5/GCaM
	CImHmrUit+cVk/GRoFA9euMmqCAoSDIcchsyz+I/WJ9UbfWNwld9g7uZPDFbQZvWQDtO70zLMde
	0qsLhn3twx9MP8ezfDZyioEXEmGOfDRgHNL3N5i8y
X-Gm-Gg: Acq92OGuqDtPFJ1Cfn2GfeCK/LVC8+LQGh+M/S34cgmIPGMJGVv3w1eQL5JGUj7XHGB
	cPvuLwpYPeHn3uMeKqiYJzZ24wVqc8QMZ5rPwGgJh9bWybB+U++uHh1dyWSheZilwordWUMB3K1
	r3Q3nOCP9btj67Q+Rwh9CqewRVnryUheni1RCzDJNKYkm1ydlET22cX1aPR4wJ+VSwtd0BEMRnm
	es3MNOOE++D3D+3hXufNXIjgv7j122D9IyXJnriqoXqyC9Ro54UVNcl6udHWI/Gzfdj9e6vDWFT
	G/e+agI6d+15JzwnlEDxKSt7ABeX9QVZEHNKEGGAB26Kv14xig==
X-Received: by 2002:a05:622a:8409:10b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-516ccc0f77fmr3401731cf.9.1779388314629; Thu, 21 May 2026
 11:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
In-Reply-To: <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
From: Rong Xu <xur@google.com>
Date: Thu, 21 May 2026 14:31:42 -0400
X-Gm-Features: AVHnY4L-IBnKhTC4Sxx4uCsrsxDz7e6XOGHFPkp2IX4Teayfu17l3WAhSBz_Wsg
Message-ID: <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
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

Yonghong, thanks for the update.

Regarding this guard: ther is a period of Clang (before this patch and
after your first patch), even though ld.lld having these options
(specifically --lto-whole-program-visibility -mllvm
-always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
remains unsupported, correct? What the behvior of using this options
in distributed mode with these compilers? nop or it will lead to
error?

I would assume there will be errors; otherwise, you would not ask me
to change my patch last time. In this case, I would keep this guard
and remove it when the minimum llvm version passes llvm23. What do you
think?

Best,

-Rong


On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> > Hi Rong,
> >
> > On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >> diff --git a/Makefile b/Makefile
> >> index 69ccf9b8507d..26005c64016d 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>   endif
> >>
> >>   ifdef CONFIG_LTO_CLANG
> >> -ifdef CONFIG_LTO_CLANG_THIN
> >> +ifdef CONFIG_LTO_CLANG_FULL
> >> +CC_FLAGS_LTO        :=3D -flto
> >> +else
> >>   CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >> +if CONFIG_LTO_CLANG_THIN
> > This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake:
> >
> >    https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >    https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.d=
ev/
> >
> > Please slow down and test build your changes before sending them. Each
> > revision adds four new emails to everyone's inbox, which is just noise
> > when there are obvious, basic problems. 'b4 diff' shows no actual
> > difference from v8 and v9, which should have been caught by a simple
> > build test right before 'git send-email'.
> >
> >>   KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility =
-mllvm -always-rename-promoted-locals=3Dfalse)
> >> -else
> >> -CC_FLAGS_LTO        :=3D -flto
> >> +endif
>
> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be removed.
> See llvm patch
>     https://github.com/llvm/llvm-project/pull/188074
> which supports distributed thin-lto mode too for reducing the number
> of renaming. In other words, for llvm23, both in-process and
> distributed-process are supported for thin-lto.
>
> >>   endif
> >>   CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>
> >> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>   CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>             modules.builtin modules.builtin.modinfo modules.nsdeps \
> >>             modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
> >> +           vmlinux.thinlto-index builtin.order \
> >>             compile_commands.json rust/test \
> >>             rust-project.json .vmlinux.objs .vmlinux.export.c \
> >>                  .builtin-dtbs-list .builtin-dtb.S
> >> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>      $(call cmd,rmfiles)
> >>      @find . $(RCS_FIND_IGNORE) \
> >>              \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -=
name '.*.cmd' \
> >> -            -o -name '*.ko.*' \
> >> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>              -o -name '*.dtb' -o -name '*.dtbo' \
> >>              -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>              -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> > With that addressed above, the series survives my basic LLVM 22.1.2
> > build test with my distribution configuration. I'll provide formal tags
> > on a properly tested and fixed revision.
> >
> > Cheers,
> > Nathan
>
