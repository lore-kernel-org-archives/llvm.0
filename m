Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B55CBD
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 07:58:25 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-415155b2796so202981cf.1
        for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695283105; x=1695887905; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVDAf4WvVJJ7OSvhi+Yfiyx2UN4HVXEh6f4xLTULUGM=;
        b=GKAxBejpNRPS1W70uWmBXOf4A+hrsr23H5KgFjx/pkPSIhcT5S5oiR1WTihaiFmUAt
         VCcE/izo6BqJOG73HAYV/jujcf15+aUAMH0yXJwRQWNs/ldNBsufN600pSgkwAM28rP4
         KR41Tu4wxykTc60gqJ7+5f6jLiwyH/OjGEnMPXsTJrIaem8rThAwiExJEFDEkpOrVbwS
         6sgGcTgJLkH+tqV+NyOvQJ0tsIefVgPs/R1rrZo1pE/glZ+a5/RYvFo4rn+v7XUgK8kQ
         qk4YIJSq3o3Nn5nPq0I4DeqfI68hgv+2TLuDOlLm6vz356gUvF0OiLkaQQg/hK1xcInY
         b+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695283105; x=1695887905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVDAf4WvVJJ7OSvhi+Yfiyx2UN4HVXEh6f4xLTULUGM=;
        b=o1FY+AvVnT5EqSXr3aPoFaQTI8qsMVa3UNpHYVVieBe5KSGU89Dly0f4RKPmvj4uos
         ZbVfPOrSgI1n0iuD14eklOG6H7ciu7MQcZuBKGTM8fHuyIkTlKR2Igk5GjoVF6Y7d70Y
         r+VnmcsxPQ15e5zNlp9ILjT7ceLo3S8auVn7I/Q1YFRRzu5mV+m0cInTOkG+t1nUVI9T
         ibmQuxXne2RH/P9rTe3vVd+0kIZh4PPUHvQVu9RFis0B7S8WB0qEV7EPW6Y6LpP90jjZ
         lym5S6fQNrLQecqgu9+t6oWZBuOA8eboB2yJTBbmINjeYJuiJxUXuj7ExRbExL3eSFZz
         RhHA==
X-Gm-Message-State: AOJu0YwgUadL/UOWnf7Y3t6gW+K6xHW0G6yMGMFwy5oHJgXSo3rHBH8R
	6rmiR2FvqcXat38CTRgl2nJjtv1I+c16gSVphuCJfg==
X-Google-Smtp-Source: AGHT+IHhB5IobmDnc5veIt6gFjFNMEhSdUigSI1xxqe8K/+P5OK7t3buKoUeeDTzHcWQMy7ISbP8znADFgHSZBnWzng=
X-Received: by 2002:ac8:590d:0:b0:404:8218:83da with SMTP id
 13-20020ac8590d000000b00404821883damr135481qty.1.1695283104920; Thu, 21 Sep
 2023 00:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920001728.1439947-1-maskray@google.com> <20230921072655.GA14803@noisy.programming.kicks-ass.net>
In-Reply-To: <20230921072655.GA14803@noisy.programming.kicks-ass.net>
From: Fangrui Song <maskray@google.com>
Date: Thu, 21 Sep 2023 00:58:13 -0700
Message-ID: <CAFP8O3+_8H+fetuoqwwcfqJLNtYmpsWZhY2arD7HMuPmcN+X_g@mail.gmail.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for annotations
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 12:26=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Tue, Sep 19, 2023 at 05:17:28PM -0700, Fangrui Song wrote:
> > .discard.retpoline_safe sections do not have the SHF_ALLOC flag.  These
> > sections referencing text sections' STT_SECTION symbols with PC-relativ=
e
> > relocations like R_386_PC32 [0] is conceptually not suitable.  Newer
> > LLD will report warnings for REL relocations even for relocatable links
> > [1].
> >
> >     ld.lld: warning: vmlinux.a(drivers/i2c/busses/i2c-i801.o):(.discard=
.retpoline_safe+0x120): has non-ABS relocation R_386_PC32 against symbol ''
>
> What, why ?!? Please explain more.

This can be read as a pedantic warning from the linker.

A location relocated by an R_386_PC32 relocation in
.discard.retpoline_safe records an offset from the current location
(non-allocable) to an text symbol.
This offset is conceptually not suitable: in the ELF object file
format's model, the non-SHF_ALLOC section is not part of the memory
image, so
we cannot say that the offset from the non-memory thing to a text
symbol is a fixed value.

> > Switch to absolute relocations instead, which indicate link-time
> > addresses.  In a relocatable link, these addresses are also output
> > section offsets, used by checks in tools/objtool/check.c.  When linking
> > vmlinux, these .discard.* sections will be discarded, therefore it is
> > not a problem that R_X86_64_32 cannot represent a kernel address.
> >
> > Alternatively, we could set the SHF_ALLOC flag for .discard.* sections,
> > but I think non-SHF_ALLOC for sections to be discarded makes more sense=
.
> >
> > Note: if we decide to never support REL architectures (e.g. arm, i386),
>
> We have explicit support for REL (as opposed to RELA) architectures, so
> I don't think we can do that.
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
