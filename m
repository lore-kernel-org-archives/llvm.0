Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B8B29CA
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 07:38:09 +0000 (UTC)
Received: from mail-oi1-f182.google.com ([209.85.167.182]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MK5BG-1mwatV0KjO-00LVAa for <llvm@lists.linux.dev>; Tue, 01 Feb 2022
 08:38:07 +0100
Received: by mail-oi1-f182.google.com with SMTP id q8so17181117oiw.7
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 23:38:06 -0800 (PST)
X-Gm-Message-State: AOAM530wy9SoVclO8SGqUoeuZkElsFga4gOBPYgtxW6AtCdAqNtlFFPc
	hssU+WmmomfCkrHzbOas0pr0XlugvZdaNEoZ/2A=
X-Google-Smtp-Source: ABdhPJwoAJXauxOlZ1TxRJZjpbgTXhT/BjZ6VY3RAg/96c46TCKIEYOphf3tKWPRy+ZIq5Ssv3EeqyOOpFvjD7WxsWE=
X-Received: by 2002:aca:2b16:: with SMTP id i22mr389475oik.128.1643701085749;
 Mon, 31 Jan 2022 23:38:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220131225250.409564-1-ndesaulniers@google.com> <202201311550.31EF589B2@keescook>
In-Reply-To: <202201311550.31EF589B2@keescook>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Feb 2022 08:37:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3-WqWUCps131vS1W9T6sN8yQ3GAaja8JP0GYCQjP68Qg@mail.gmail.com>
Message-ID: <CAK8P3a3-WqWUCps131vS1W9T6sN8yQ3GAaja8JP0GYCQjP68Qg@mail.gmail.com>
Subject: Re: [PATCH] docs/memory-barriers.txt: volatile is not a barrier() substitute
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Len Baker <len.baker@gmx.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XWo3Go+X9Gm/bcmwXlykZOa5nULJalG9WUVo/CE5WTQofZkeeEc
 QGjYDIBfgsSdoDALA68x1OxjS7/q02DHkTmPunIWhlwzlElK4MNA/VhxYbPw5FCOxla77Or
 7J5uQkU+6s8I/jUQt6SD1f3vB8FplrPzPZ7ouiXqZYF3/tzsbgnJY6ccHroym4Haker/amU
 kFjHe7P62iyT1L3un0cvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cMQEKhlZOM0=:JXGoOi1xZiFsGkzCCOuz0I
 ejYck+yisc+FNJjYqjg2vmsl3BCF/svKgbsckl+ilt29cSmeDqdFQACUH+SE5NlUny4iHqWyu
 NWsfZ/b0v1dQt64bICGegnygIci9NhzZJBir2kRD3VSdBNhDmvmxxxl0AW9L7x6reqeT33Bej
 /eOW2B4ZTb9mLvYI2IgP6IOGzBp2bwk26jyvcc2NC5e1h/fWzaJlbkxlEcxhNYJMTDlU1WGQa
 DTpaLPxcp84ejuHi/tRk+lQsOU2aBIgzZBx5cIyHIlNUHyWQRcQmSze34RcYfFvKL0EXw+QSt
 2CxQTVZ88Ns+lxRVAm85gUMsksAss243KNUyodJ4Vv2ILE9qsWsAwYwNh/RvaRhqhUblm/3Hd
 SEp81z8zOkG3qQ8Y4lwkhMEbZmWUW+/OF2EkOU4W5rd1lSPMVkIvE6kaouU0tg78IMurF2ILd
 s14KFDWV1Gvv20LmUPK/u96Pl2edAFmhvz0mf2KVdyySqZEp+s4wWuVypeHE2Gqxd8WTVrnCV
 9VFnbtmot9Ghx6z/bybzdK/FXJ/T+TaG7croM4z2HlPWQxV7n7D2Jcrvnn9+1xnj/4MmF6zxK
 1GlHi49rAnDNnh8sz22q7ckEGK3Av8zlxvCYMv/ipG3w/M2mM2Q8ZiWbUyHvlxbb1mVvwP4Mq
 DzcqIkL6XVWjRT2zJrFBQiUuZp3uZfuHm0RqaUYQd+npJm+coNc3i55GQv1A8OVy4ZrEh6luR
 8bRaptcc1XqhDZDqLWu0hc1+G53L+oQzpFkVC8DAJN7YRMOfZI1uy8oavHBW0sFzuv+m+maf1
 y4zKrAK6LHfQxRja0V/lp0aF+5d4Om8J5HXG5PtJ+IaOF/NKvQ=

On Tue, Feb 1, 2022 at 12:53 AM Kees Cook <keescook@chromium.org> wrote:

> > +
> > +According to `the GCC docs on inline asm
> > +https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile`_:
> > +
> > +  asm statements that have no output operands and asm goto statements,
> > +  are implicitly volatile.
>
> Does this mean "volatile" _is_ needed when there are operands, etc?

It depends on what you want to express. The idea here is to give a way to
gcc for optimizing out anything with an output, like x86 rdtsc() when the
result is not used, which is sensible. If there is no output, such as in
writel(), you don't need 'volatile' because gcc can assume that an
inline asm without outputs has side-effects already.

A case where you need to add volatile is for (void)readl(ADDR),
which is an operation that has an output as well as a side-effect.

          Arnd
