Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66544DB71
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932775; cv=pass; b=oe6SmEdu/cHT7w9MT0dBwvxALmdC/IdW74k7Tjr4JMulfbSO5n0+6YQJk5sAajRRu4R1tnRQxXyjLrOuO5+BW5ESSZqC3dzl4CTSGq8m4Atm7PUfCn7j+FSRA1VYMtNXE7rS6brWf8yURnbEBgPi5pDymaj9nj3qXc7iUbGp6KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932775; c=relaxed/simple;
	bh=G0ot6VfCtfTdK2d9u7Kku4JHYhx/Ooh4GfeogKVkVAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgAjgsVSa4my8YKcN0eM/tSSOB1G4PlEnmRxUURF5j+/FWTE0xlPC+SBJxmwXh/LKDaVGZqHnogWRdUQSiHB7w0B763L14eEJBoiscVmiZKqcWOdrtBeHSBcYj4k+ic4pS86mPFybU1k344TrNoJIYQKkOewoFfE5HfLHFxVjn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDsYDJ0Z; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDsYDJ0Z"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b87693c981fso945890166b.1
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 10:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768932772; cv=none;
        d=google.com; s=arc-20240605;
        b=ba3JLNbM/P1JS43byl+AT+HN4Ramjh2u53jietYrrBxRgrTeg8hsvX/9SbDvi6xxLf
         wmBLXOaQ0xTPYjX101285Xc4iyAZR7bdq2HTihcCNpYC99nIR4q+RGc1f6Sp1+wUV8JR
         sbeqdi1V+oiyUGDMxNtukuqHEzp7nVMQFa1yEvEbxzjKjqewJpyPfO5ooRg91HI2qg9e
         S06Uqq2gZLDZFg/1ZG4rW6biV+L6klyZllzPfs9SQTSL+MLmAGfUypAFBflB2m+muAPT
         JXUWju9l4FnvRjfgIV2ilHDVya53G+0m+vP4SwdGFFEzZGiWV70XIN5icUFks7oOLhx0
         98pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e8YNtzr6sL6sTnKQNamIDqVuGsbXWJqsHdWC+WyrhKw=;
        fh=zYQtKGhwzWVXtH2ZjIZ5iAKYVs0KaUEf5mF42zt49EM=;
        b=abWnLkE+aD9NFYSO+0xuBs4+UzvnA4vHg3INQNfc7H/x9Yghhb92H9EvgIK2hTCgTQ
         ATy/amhEVmHlbxgrsVQI7SH6jsG4G5vHp1HdEuuqMS5DEmVoVnZ9xHGOzE0KmoM35r0b
         E/S5Uda5mk2D2Z5xd/DVSEnOW5gA7FKBBI7msRmvchunentrC4DHwLnH2ZEVaWMJZCEX
         2OjRmser+spyWVKof+qurRvYASl4r1UJkjfn1nuWEKriCL937Mf5zrqIuAS7HRNI0Xfd
         i/7l75WS5xKtFKrVO0m8yyJopU0DmPby5ayK2bJWGgTwy9dRNLtPpadFejIgLB9pBXa8
         96cA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768932772; x=1769537572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8YNtzr6sL6sTnKQNamIDqVuGsbXWJqsHdWC+WyrhKw=;
        b=hDsYDJ0Z1wbjDbZQZ0xc960t6u1tg55MOdA0jSTbWiKvOopXeo8YMVbRv4Cv4s7Bv8
         PoLTF+CETn6K57B0fv3DO6jY1psK0XMA7EeXgWwr/63XKEkmezB/jsFtwlNbiJQLD2o/
         Snq41nBOx+sDP8zIsYUCsCB70TINOm4/kI4fp//lUyDv3dCBtQs7eGRt1ZdQf8wGRemp
         quPIpR6nDTyKIkkCOn1yrDD1K8tF42sGcWOEaD8c4zPcaPnDQBBC4sboU8Xl5lBQUbO6
         h2ErO5Yl8PyBVA839zELmqK3IeZrZUmgm2a21R34Y6Ghj7ZOjCsi3hsdzQ16fRoE0eDu
         91/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932772; x=1769537572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e8YNtzr6sL6sTnKQNamIDqVuGsbXWJqsHdWC+WyrhKw=;
        b=FmqQKD6m+0qNeRMSWak3WWtzI+FAzZnwDV3zc7S06EaviFXr35W9HuG/xUOon/5qoF
         HfP/LcSOJDpEF83efpMCHpp2eqU5JglkR/LW3QQ3lEy7sUu+fcezB6rdNmyw+VWyG4T1
         np7qbPfirwk6v16WQoigyikcxj0bVzUHWkXRRT3KAAaowktUUFseHTzvFj2MZSirp8Eq
         K9xa6RZWJdrqjQsc0RKcre3mpHzeT0LQSUlhbPnK+XqvSY3qdrttBCbCHYQ7gmLEW1Rq
         49COxlNZ5xpTysN7OGSBC2ZJaYFpJ+kM/AmhoLQ0LFfZy4wy0V/zM/xAb2c2g+pWM3Eu
         0qDw==
X-Forwarded-Encrypted: i=1; AJvYcCVdbcx8KUHUezrU8PkIESwOoaG5FRBt/gpjLyxoa2bDvH19Ca/Snu/Sug/Ihp8oWxDelJQw@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg2Za9yBYopR0w2jP3dWTmeTF2wg/DZjUtg2aF+cdF8+5jBIzu
	EMk8GrjiqnifFZ4NwZ6CANJxDt0+2/7yPV6uzUCurrBYURqF/qzNXPHCQDLL46caVyDBb3XBwyH
	if/2RDd7FeG7tk3gRrdROf0VnHOwug37v8RT1f0c=
X-Gm-Gg: AY/fxX4p7ITh/S2QTNVsAiSz5rZusPKPXIzaHonfIhPaMIOfwo0TSnGp0Q+PGYjYsbR
	7o/y+s9Att/pyNKxxFIwnlS72ZAFz+DRafWzcHwZtZ9jzU/5W8jSSLo9ZzjeyhooF6PD+XJYq1b
	Y190McI+u+jJboiE2yGkRJ5h/cYXJT53lPoq/2hYQzUQ4aOu0fekc/Lim6L6TYXDJu0i8O2XNzT
	fNk+3T8Q5K2RyWQ7Z9HZKSqHX8yQgprpp9nrdBeMJM99qctw64iUp8vOT4Ds/iUt1L3HGJyTuEn
	x2+NatHtTt0tkQ3cA5JgElcn8j1NnLYNzuWUXKLV3TUUrLfw0PjfR2HFOH+aFnVGdFQwh2ArKnp
	f/dM=
X-Received: by 2002:a17:907:9615:b0:b80:5ae7:5d94 with SMTP id
 a640c23a62f3a-b8792d27519mr1273652266b.7.1768932771343; Tue, 20 Jan 2026
 10:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114193716.1740684-1-morbo@google.com> <20260116005838.2419118-1-morbo@google.com>
 <20260116095318.46a149fb@pumpkin> <202601171106.90E508A9D4@keescook>
In-Reply-To: <202601171106.90E508A9D4@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 20 Jan 2026 10:12:34 -0800
X-Gm-Features: AZwV_QhDwTff35V7oRC_lRCHIRr3OUHATuj7NTOuUgdO0F2oWVoaStpeXxTPVes
Message-ID: <CAGG=3QWeYZqLA8FSMYZFRrJ24LtEKJdmRAq3awkMZj0+qy=4_w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Kees Cook <kees@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 11:07=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Jan 16, 2026 at 09:53:18AM +0000, David Laight wrote:
> > On Fri, 16 Jan 2026 00:57:57 +0000
> > Bill Wendling <morbo@google.com> wrote:
> >
> > > Introduce __counted_by_ptr(), which works like __counted_by(), but fo=
r
> > > pointer struct members.
> > >
> > > struct foo {
> > >     int a, b, c;
> > >     char *buffer __counted_by_ptr(bytes);
> > >     short nr_bars;
> > >     struct bar *bars __counted_by_ptr(nr_bars);
> > >     size_t bytes;
> > > };
> > >
> > > Because "counted_by" can only be applied to pointer members in very
> > > recent compiler versions, its application ends up needing to be disti=
nct
> > > from flexibe array "counted_by" annotations, hence a separate macro.
> > ...
> > > diff --git a/Makefile b/Makefile
> > > index 9d38125263fb..6b029f694bc2 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -952,6 +952,12 @@ KBUILD_CFLAGS  +=3D $(CC_AUTO_VAR_INIT_ZERO_ENAB=
LER)
> > >  endif
> > >  endif
> > >
> > > +ifdef CONFIG_CC_IS_CLANG
> > > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > > +KBUILD_CFLAGS      +=3D -fexperimental-late-parse-attributes
> > > +endif
> > > +endif
> >
> > Will that still be needed for clang 22?
>
> AFAIK, yes. AIUI, this flag will remain while -fbounds-safety continues
> to be upstreamed into LLVM.
>
> > Looks a bit like a temporary flag to avoid regressions.
> > Probably ought to at least have a comment that it won't be needed
> > by some future clang version so that it gets tidied up.
>
> Once it's no longer needed, yes, I will want it removed from the
> Makefile.
>
Would it be good to 'fixup' a comment in the Makefile for that?

-bw
