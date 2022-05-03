Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB952F41
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 22:35:46 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id q2so17870571vsr.5
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 15:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8uN3rj4E61pEiXuH0S044PiehAa3W3BMN3Lqc1kk7Uw=;
        b=Ue8FeaYYp63Oq+H4NMZb+pBRhFnk/iofdWy5gXeIg5QTwAVaQhcPh7NJMycsbGfWZE
         Fc+5btEiGJmM5fEXhaxOFjxGU7fzkiSoqnkUqFrl1ZRRzs4ig52ohWMhFGSgHhm+VyaG
         TWPDOh3RfjJbT1pjROk+5GJXdEClUvyooIraMli+y9nHLH03LpgjlCrH+hdF8m40WCQE
         E5GOMstVRJssp5a6VJFS+WxZDfGT+cOVRpciMnyrojahl/hfM9ETPdwkTCKcre9KwcNY
         l73O7V2zpphu3uEFz9tC/hRsuke1nKrMRDzlaIhhkSYfm4lNq2qk0/FjvFICEl6nNSsW
         YGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8uN3rj4E61pEiXuH0S044PiehAa3W3BMN3Lqc1kk7Uw=;
        b=AGQib+um0wiH0uN2uPFmUPcOseUa5Wkiud2HtxKLS3qTeJ9KB/j549FdX4Ae+wHtRm
         cXLQ7A+3Dc9hrUMJSamU3GhMu57ElgyM3lnzmTUOvmh5Vrjbds05ksMryFWkHIerDh29
         etW1WHGjzRvDAWqR1ZYjxy/xM/Se+aNtR6smk+FXtfb5LIYPD2D9faSX0WAH+xGoD8he
         3pl1SP+syeNUdqqPttAOSoiNaysCCN+fMKQQRBs95OAZuXzUxDIPcLO5VvsahXvoD6YQ
         5/hbacF4KPJMBfhvGbrdNKv/eojmkZyVkUjxYLwwvmBp3K+Q5MbHZlLRj5qrDPCAKCKE
         UUbg==
X-Gm-Message-State: AOAM532EGtxyxbFq4pyOt6tvoszIFqr5N7x91XguDK6RWo8yHj6q4Pne
	ay/egYTVyQVGlY21FI84l4fLNXL3TQoHzHzTGDqQtA==
X-Google-Smtp-Source: ABdhPJyL+ddQCd6SprqNHsm9X7kOXr4Vs6rtLnwYWhuO4UVCOvXbzKSI2dWSxbo9OUaHxwRSd1gZJrBcmkLhnuY7a5Y=
X-Received: by 2002:a67:c408:0:b0:32d:1319:2e38 with SMTP id
 c8-20020a67c408000000b0032d13192e38mr6059296vsk.72.1651617345595; Tue, 03 May
 2022 15:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
 <202204291545.47C6A97EA2@keescook> <Ymz7DWkRJy3PMaHm@hirez.programming.kicks-ass.net>
 <CABCJKuckt75qA1op-LpkJnQsJC36m9fstbY3uD=7pET2VyyZSg@mail.gmail.com> <YnA3Le2uJRaFF4TC@hirez.programming.kicks-ass.net>
In-Reply-To: <YnA3Le2uJRaFF4TC@hirez.programming.kicks-ass.net>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 3 May 2022 15:35:34 -0700
Message-ID: <CAMn1gO614sMzKzP6qTCcXB0QCeEu-G7CHn_h=6ikCLkFo_Z2Dg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] KCFI support
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	Mark Rutland <mark.rutland@arm.com>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
	X86 ML <x86@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 1:02 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, May 02, 2022 at 08:22:57AM -0700, Sami Tolvanen wrote:
>
> > > Anyway, I think I hate that __builtin, I'd *much* rather see a variable
> > > attribute or qualifier for this, such that one can mark a function
> > > pointer as not doing CFI.
> > >
> > > I simply doesn't make sense to have a builtin that operates on an
> > > expression. The whole thing is about indirect calls, IOW function
> > > pointers.
> >
> > I also thought an attribute would be more convenient, but the compiler
> > folks prefer a built-in:
> >
> > https://reviews.llvm.org/D122673
>
> That seems to mostly worry about C++ things (overload sets, template
> specialization, name mangling) we kernel folks don't seem to much care
> about.
>
> I'll stick with saying type system makes more sense to me though.

I'd say it's not only the C++ issues but more the "action at a
distance" that's implied by having this be part of the type system.
With this being in the function type it's hard to tell whether any
particular call will have CFI disabled, without needing to go and look
at how the function pointer is defined. On the other hand, if we
explicitly mark up the calls with CFI disabled, the code becomes
easier to audit (think Rust "unsafe" blocks).

Does it seem any better to you to have this be marked up via the
function expression, rather than the call? The idea is that this would
always compile to a check-free function call, no matter what "func"
is:

__builtin_kcfi_call_unchecked(func)(args)

We already have this, to some degree, with KCFI as implemented: CFI
checks are disabled if the function expression refers to a declared
function. The builtin would allow overriding the decision to also
disable CFI checks for function expressions that use the builtin. It
also wouldn't preclude a type based system later on (the builtin would
become effectively a cast to the "unchecked" type).

Peter
