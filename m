Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B7342532
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463959; cv=pass; b=phsEbSROfPjbuxws6zoxDCK3PGX9iuTuL7anjW29oLhNkoYM6dACJCFT/DEWR7AzowD2j4oW50bRZ9N/xMcfnXpy1ct0/gEh7MkzYucDIEBb93dxbSRu2XIyh8PBJuzJh1zoztbNOqg6U6fsvPRVA7mZjHU7qY5bkdvbDC+hL9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463959; c=relaxed/simple;
	bh=a9VS412HjFSA9q4crKDon66e2bzVF7Ac8ki81ngingg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohjvp1nikvG5HX19NbIlgklTNlzSxTRKinGEJtZPcjLKY1aEThs00ZGfiqU3ijlkuTo2r645S4rk4paHd6DVOGqdslp4uGOh1nVI+j6R6CpV6zkDxfW7sIb21ZmemqxL+5jZL/SlK4uZKdRU/McPfboK3N0UBdfgvyRHsTnA46I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DMUifqMd; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DMUifqMd"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so315a12.0
        for <llvm@lists.linux.dev>; Fri, 22 May 2026 08:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779463956; cv=none;
        d=google.com; s=arc-20240605;
        b=X+t3sySVACAGPXlWFtqgejY6i264KkEBaY8xocF34Wh3a+LYChDExrzncO5SxBFRY8
         LuhlyhKCk7z8SUwzkWC33Yjtn+pbh1j2EH17zKb/Deu4Xlusa1asnvvMNo4im49bVbFC
         HV15xsjvIc7wGgPjO5iJL6XrPDveZodnYLPLeEdQGpEyTEkSsHa6SATMn4hQoRHRgU7i
         22aQZQiOhpNMaNof9UCSmuT+LhG3uloPrNN6u3E/wTWFveGADaRGMR20uuTkovhD9kJL
         2VdLLfy2Ty2bq/lr+HFJeeyjqjfLhf8QQZIaQf92I5ZDA7BUjC/n4r7e4+sqjYXjucfj
         zg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rI/yUCYSeKg3fwrAwmuT28Ed1FRs8RkhlNNNjCcL7B4=;
        fh=sTh/K46bEgYbdCQEqtFzSNODE31BwQPAgyVuqa01w+k=;
        b=LzQn+G4Oleby9vK+F6WbFcywgiB/Y5zR6jMRx8XvZ9K/FKydrdeSfWNTffZdbkVLKb
         es/mrYeCb0BEXMdDdaZKPufPsrush0FI1/0GqeGCZHiMgePm9WqrDgP9sB4W4eEZS3RS
         P1TPluTpoCQmqslPu7Gg9qEj+9RMSepFhXdumn/Uetj351dw8QR5HmvYVATnPCbXPT3i
         y5Ti/p0zYG7qfaa7bNi1VG7np1r06BWk7MSzzMs9GduobCvE4WSvWmqH3Nlfw8PGGY85
         5RulmA4xn3mNrX+707SyP62Y9nBVJbKYa3CRxpFmMBCaN5LUY3wppAaK77nUq6rsoyoV
         Ko7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779463956; x=1780068756; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI/yUCYSeKg3fwrAwmuT28Ed1FRs8RkhlNNNjCcL7B4=;
        b=DMUifqMd+e5r5YdWo23GdyqM+VBwh6V1NuycDAYxBecqjQLRYvp+q1vSv7mwFN9IHa
         r7T+eAJ1a9vreeqIWoGBQATVeZ3BN0u21OGMhGuTz3LfY+zJfFfeIE06gVd9tttTQigo
         DEBtvTd/EMnkL/R8j95Vihy3cYf1NU9KJWxp7LUnJmEHglqr9e6xj16o/UOTfIwJWGI/
         +NNCFPnKU/Ntcj1v+jv6z8nJvpK14J9yz0+AF6DufQiL3JjZ/nfPT47Kql4HNkZnzUtu
         lM14SZx2UzbiP+z3cv3lGJgzF4rkVpYZw63Tukl/ZwQ8WmUB9/taTohz4D/c/mTTpkgd
         feTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463956; x=1780068756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rI/yUCYSeKg3fwrAwmuT28Ed1FRs8RkhlNNNjCcL7B4=;
        b=XLuR8yUQfkkJx+0IjwrkYarUPx3g40zQtdzsbGai+0+Vdw9i4A/lCilwT2LxDb3eCz
         ncfyfaLGQpQPRkNpEyPJ0SS3fACbz8ym0xHjdvUi3M8MITiSVgOrSM4p/RSiSEp5Q8uI
         aWVryJJM7WZkExnvQmuRfMPaRNvHFfMi3W1/rIBpRYjhtUeeebgvZy3+SdzWWxUGqlM8
         NwPrDAYPMqR7a3nwuiWir1evPztooJ/X393QdE9rDzhgf8NwjXfMSuiMdXGYVsALqAwJ
         RW1kcebCX4nTSA1dR9Ohu01rbiVYqmson18roQh4ixK29bYWG98lkUF22uR77y4t/kv/
         9cYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lrim2corozYcluxphfU9S6dS8I0TXEXXuJP+qxhhA8b76mRhTgY0++NBLpKnFdDsEgF8M@lists.linux.dev
X-Gm-Message-State: AOJu0YwRYTZXon6KRZLsEQI1nLA/NZ9xDcoDt7z4Myu+tJU5aEB5MRD0
	8jPuBHKmnK00LzSrbf/meddl2jD0rgPiLGwmr4D0QXIG3iHW2dNV9tAHkqrpXCAEsklAKI4SkSh
	xhaOZGl+p7wPVPvUcYjAIyLVuhqjuDeqQwmhdMnIG
X-Gm-Gg: Acq92OGsarOlN+HF801bMGxDzAw3/nr04mAMxwHoZ0P49F7z+9wphHQJ8pna6GeDAOQ
	745AkJeLSSWClrwKzgrE9dqfibK9w/0ea4MZi/7a8wVcApixkFibTPTSNdX4gvg6LeO1K5TW+cS
	bhhCZvFb82qsQ7PtOqBsGzKW1xiPJ2wYeIIOzDWDFey9ePGK3QTui8k2nLfbN4vTd1loOaHyGPU
	PFpUfec6UpqfHOlbkIVoPGQGvfPCly5HPmkWF5/33HeiZVNJzufsAAb70EAQzLphQJEhteZS4xm
	L6OyteiKGAqh2VGOVfQ=
X-Received: by 2002:a05:6402:5143:b0:679:4b60:c7d2 with SMTP id
 4fb4d7f45d1cf-688b5fc3349mr44103a12.1.1779463955878; Fri, 22 May 2026
 08:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com> <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
In-Reply-To: <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 08:32:23 -0700
X-Gm-Features: AVHnY4LkDeTc8ulhes7q2m4zXKmK8ysgPXmh9U1opVtQGL54sFQJ74iKiLeEB-w
Message-ID: <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
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

On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 5/21/26 11:31 AM, Rong Xu wrote:
> > Yonghong, thanks for the update.
> >
> > Regarding this guard: ther is a period of Clang (before this patch and
> > after your first patch), even though ld.lld having these options
> > (specifically --lto-whole-program-visibility -mllvm
> > -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
> > remains unsupported, correct? What the behvior of using this options
> > in distributed mode with these compilers? nop or it will lead to
> > error?
>
> The in-process thin-lto support is landed on Feb 27.
> The distributed thin-lto support is landed on Apr 24.
>
> If people are using distributed thin-lto in kernel between Feb 27 and
> Apr 24, there will be some issues. But people typically use released
> compiler, so we should be fine.

This is not the case for us (google). We do use compiler b/w releases,
and we build our own.

What is the issue if we use the compiler in b/w Feb27 and Apr24?

-Rong

>
> >
> > I would assume there will be errors; otherwise, you would not ask me
> > to change my patch last time. In this case, I would keep this guard
> > and remove it when the minimum llvm version passes llvm23. What do you
> > think?
>
> There is no need to keep compiler version guard.
>
> Before llvm23, the below will be a noop:
>     $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename=
-promoted-locals=3Dfalse)
> since '-mllvm -always-rename-promoted-locals=3Dfalse' is a new flag and t=
he compiler won't
> recognize it so the kernel will resolve above 'call ...' option as noop.
>
> With llvm23 and later, the kernel will be able to recognize above options=
 and
> things should be okay.
>
> >
> > Best,
> >
> > -Rong
> >
> >
> > On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.song@li=
nux.dev> wrote:
> >>
> >>
> >> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> >>> Hi Rong,
> >>>
> >>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >>>> diff --git a/Makefile b/Makefile
> >>>> index 69ccf9b8507d..26005c64016d 100644
> >>>> --- a/Makefile
> >>>> +++ b/Makefile
> >>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>>>    endif
> >>>>
> >>>>    ifdef CONFIG_LTO_CLANG
> >>>> -ifdef CONFIG_LTO_CLANG_THIN
> >>>> +ifdef CONFIG_LTO_CLANG_FULL
> >>>> +CC_FLAGS_LTO        :=3D -flto
> >>>> +else
> >>>>    CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >>>> +if CONFIG_LTO_CLANG_THIN
> >>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake=
:
> >>>
> >>>     https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >>>     https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linu=
x.dev/
> >>>
> >>> Please slow down and test build your changes before sending them. Eac=
h
> >>> revision adds four new emails to everyone's inbox, which is just nois=
e
> >>> when there are obvious, basic problems. 'b4 diff' shows no actual
> >>> difference from v8 and v9, which should have been caught by a simple
> >>> build test right before 'git send-email'.
> >>>
> >>>>    KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibili=
ty -mllvm -always-rename-promoted-locals=3Dfalse)
> >>>> -else
> >>>> -CC_FLAGS_LTO        :=3D -flto
> >>>> +endif
> >> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be remove=
d.
> >> See llvm patch
> >>      https://github.com/llvm/llvm-project/pull/188074
> >> which supports distributed thin-lto mode too for reducing the number
> >> of renaming. In other words, for llvm23, both in-process and
> >> distributed-process are supported for thin-lto.
> >>
> >>>>    endif
> >>>>    CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>>>
> >>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>>>    CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>>>              modules.builtin modules.builtin.modinfo modules.nsdeps =
\
> >>>>              modules.builtin.ranges vmlinux.o.map vmlinux.unstripped=
 \
> >>>> +           vmlinux.thinlto-index builtin.order \
> >>>>              compile_commands.json rust/test \
> >>>>              rust-project.json .vmlinux.objs .vmlinux.export.c \
> >>>>                   .builtin-dtbs-list .builtin-dtb.S
> >>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>>>       $(call cmd,rmfiles)
> >>>>       @find . $(RCS_FIND_IGNORE) \
> >>>>               \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -=
o -name '.*.cmd' \
> >>>> -            -o -name '*.ko.*' \
> >>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>>>               -o -name '*.dtb' -o -name '*.dtbo' \
> >>>>               -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>>>               -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> >>> With that addressed above, the series survives my basic LLVM 22.1.2
> >>> build test with my distribution configuration. I'll provide formal ta=
gs
> >>> on a properly tested and fixed revision.
> >>>
> >>> Cheers,
> >>> Nathan
>
