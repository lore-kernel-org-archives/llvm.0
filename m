Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2D25614
	for <llvm@lists.linux.dev>; Mon, 19 Feb 2024 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353786; cv=none; b=XIrUJIte+DouA1UFUq5z/SdzGVA0NU68RVQ8g6IASil4b45J3DuaIjLGUC9f3iviyJ4BSRjVTtHIlvMtyF/qo/Q1ETi+74ke4e5Md1LBc157Caue1V00UNbs96fD1VEfA3YyyoHo1RBWTlq/ZXZ0S1QVOm6zXh+HzDnPZ/O2n0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353786; c=relaxed/simple;
	bh=i7OIpG5Lwqe1/605B4rc6ae/IYBYtY7+WMLTv6YkkX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr4O2M6M8WbW/yoq3C7vA5WVmfSMx6b3w8lEXMM6pfXpom2vRUkyhgKc+001+WGmAUDZ5lSJBBqIFnNuaBCoxpHvZnbc3sbz0Mv7JiFOsPAItVqb+FFFHCb1tyw7WOf6Z/DJYu5Hgef9hN8t5jNatqgoMqMJQT1reLASeuvkMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-607eefeea90so30074627b3.1
        for <llvm@lists.linux.dev>; Mon, 19 Feb 2024 06:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353782; x=1708958582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiRAs6xXCSmrDwwJyZxglQDdKkrV0mexeOrnsuvFlYU=;
        b=KLou/4zeZHm3GMYhhwp4Z+oEhVaK591HXCi561ATmHKFa4Sd4JR6kng3OX7Z6ef+Fh
         ykxe9dqTrW+j7i0lcdoZNpr5MBwX4x7yd/qPgx6E6fMSo6sAw9ZmevNLzBvtJZFyns28
         Nz5z/KYTvtVxMu+XLAIJBd0s5pNqGW2UKdu4p9rzyU//fI3MPc6Vfp9lTgIexEAV/M8u
         yIPvNMZlqsxSkRRcQijmj1p0bQb+Rl21LBqb5ZETfejMdv6Hl0fQxrYrDyGLR6D9iRrv
         NudCeOy5vbjFRSdc8iOIo4X/Ro+zBc7ILpzuC7y4Lb5myh6qcilKi9iCl+tYrXj/CYVr
         1aiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBUe+9eaCfXVN/9GatmMSSBLo6d1sMw9LUEj/MOQDmqGMWeAi48wv8gqLkyvfXtf3ZGL2lSFdONZB2b3nVVmVELW0E5Q==
X-Gm-Message-State: AOJu0YwHRQbSBqmLD24ies/VC4SgrT1N+4XWwLPV3gIOMrpYkhaFVjTD
	o3Ld3zhWRhe2xnSQ26eFwB0rPL98aFpSW2zr7cIR/FFEPprclfwyDj9MlQz1Hyg=
X-Google-Smtp-Source: AGHT+IH9OxmGKWJk5IY25hq/x53z3OfiYIInejlUJ8KynyAecRQ0z9wGjflQHS7cJKQH3vi5hphIIg==
X-Received: by 2002:a05:690c:470d:b0:608:2b1:d6c with SMTP id gz13-20020a05690c470d00b0060802b10d6cmr4498713ywb.19.1708353781832;
        Mon, 19 Feb 2024 06:43:01 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id e185-20020a0dc2c2000000b00607e72b478csm1668629ywd.133.2024.02.19.06.43.01
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:43:01 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6084e809788so3086817b3.1
        for <llvm@lists.linux.dev>; Mon, 19 Feb 2024 06:43:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVl+lhmsA0fmD6TNjto/YbWkXVau6AmK52/gt6rEHeuYvByv3juH2GyEDPvG3JftPC9zyRKW/+jcKx6h/EFUF2oO7KPug==
X-Received: by 2002:a05:690c:16:b0:608:b86:7c9f with SMTP id
 bc22-20020a05690c001600b006080b867c9fmr4682001ywb.7.1708353780740; Mon, 19
 Feb 2024 06:43:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240206074552.541154-1-maskray@google.com> <CAMuHMdVOoxVFohcwwoQtY0KgZEvbjgJJ6mib8Fabo97P0krEqw@mail.gmail.com>
 <CAMj1kXGaF5bobHTr1pTg+-=s4Ft7+5SSbX72-NxsR_W_Yuxb8Q@mail.gmail.com> <CAMj1kXGw+r7yEEBA8gYBcdrqkiP=VYOSzz9YLnNavJn2snmFwA@mail.gmail.com>
In-Reply-To: <CAMj1kXGw+r7yEEBA8gYBcdrqkiP=VYOSzz9YLnNavJn2snmFwA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2024 15:42:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+6fnAf8Hm6EqYJPAjrrLO9T7c=Gu3S8V_pqjSDowJ6g@mail.gmail.com>
Message-ID: <CAMuHMdX+6fnAf8Hm6EqYJPAjrrLO9T7c=Gu3S8V_pqjSDowJ6g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: jump_label: use constraints "Si" instead of "i"
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Fangrui Song <maskray@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Jisheng Zhang <jszhang@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Peter Smith <peter.smith@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Mon, Feb 19, 2024 at 11:57=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> On Mon, 19 Feb 2024 at 11:56, Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Mon, 19 Feb 2024 at 11:03, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> > > On Tue, Feb 6, 2024 at 8:46=E2=80=AFAM Fangrui Song <maskray@google.c=
om> wrote:
> > > > The generic constraint "i" seems to be copied from x86 or arm (and =
with
> > > > a redundant generic operand modifier "c"). It works with -fno-PIE b=
ut
> > > > not with -fPIE/-fPIC in GCC's aarch64 port.
> > >
> > > Thanks for your patch, which is now commit f9daab0ad01cf9d1 ("arm64:
> > > jump_label: use constraints "Si" instead of "i"") in v6.8-rc5.
> > >
> > > > The machine constraint "S", which denotes a symbol or label referen=
ce
> > > > with a constant offset, supports PIC and has been available in GCC =
since
> > > > 2012 and in Clang since 7.0. However, Clang before 19 does not supp=
ort
> > > > "S" on a symbol with a constant offset [1] (e.g.
> > > > `static_key_false(&nf_hooks_needed[pf][hook])` in
> > > > include/linux/netfilter.h), so we use "i" as a fallback.
> > >
> > > https://gcc.gnu.org/releases.html says gcc-5 was released in 2015,
> > > i.e. after 2012 ...
> > >
> > > > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Signed-off-by: Fangrui Song <maskray@google.com>
> > > > Link: https://github.com/llvm/llvm-project/pull/80255 [1]
> > > >
> > > > ---
> > > > Changes from
> > > > arm64: jump_label: use constraint "S" instead of "i" (https://lore.=
kernel.org/all/20240131065322.1126831-1-maskray@google.com/)
> > > >
> > > > * Use "Si" as Ard suggested to support Clang<19
> > > > * Make branch a separate operand
> > > >
> > > > Changes from v1:
> > > >
> > > > * Use asmSymbolicName for readability
> > >
> > > But it still fails on gcc-5:
> > >
> > >     arch/arm64/include/asm/jump_label.h:25:2: error: invalid 'asm':
> > > invalid operand
> > >       asm goto(
> > >       ^
> > >
> > > http://kisskb.ellerman.id.au/kisskb/buildresult/15129281/
> > >
> >
> > How odd. godbolt.org has 5.4 and it seems perfectly happy with it.

> https://godbolt.org/z/GTnf3vPaT

I could reproduce the issue on v6.8-rc5 using arm64 defconfig
and x86_64-gcc-5.5.0-nolibc-aarch64-linux.tar.xz from
https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/5.5.0/:

    In file included from ./include/linux/jump_label.h:112:0,
                     from ./include/linux/static_key.h:1,
                     from ./include/linux/kasan-enabled.h:5,
                     from ./arch/arm64/include/asm/cache.h:41,
                     from ./include/linux/cache.h:6,
                     from ./include/linux/slab.h:15,
                     from ./include/linux/resource_ext.h:11,
                     from ./include/linux/acpi.h:13,
                     from arch/arm64/mm/fault.c:10:
    arch/arm64/mm/fault.c: In function 'do_page_fault':
    ./arch/arm64/include/asm/jump_label.h:25:2: error: invalid 'asm':
invalid operand
      asm goto(
      ^
    ./arch/arm64/include/asm/jump_label.h:25:2: error: invalid 'asm':
invalid operand

There are also a few warnings due to unrecognized options:

    arch/arm64/mm/fault.c: At top level:
    cc1: warning: unrecognized command line option '-Wno-shift-negative-val=
ue'
    cc1: warning: unrecognized command line option '-Wno-stringop-overflow'

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
