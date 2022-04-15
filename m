Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE47B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:40:36 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id a8so9950728ljq.5
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5GhQQsTYAAakqIebY0pmOooVtTctff2fepBqdclguc=;
        b=ZzwmirRASayBc+GfyjZ2qhqJQUikvZg3cik+s7aKUO6WYywVPmkZ3dsBXc7NWNuCha
         qHtZhvZ773/eKobPiI/wmoup1+XPfdh3bTTb0b4dQtanJdHVp0jS3q4QRM7p7u+7XAPE
         84vDfvcBPpcFSqZnU24ZQTj8GayHt37RqlEEm5cn59TQqzuPfv8+/l9Ti0NhcKEAXoFv
         5dvKyTLYP7UnJC9pHK3PmwSsQGVqdpIf48icUsTWDoafgbo5kYZX7QhgZEoeaRh+pNuE
         pDGobhUkZ3zy/XNqHz/NbwqraQu774Ekd1NwSQRtk91zOfOW1xEzNbu4J/9N7h/teMXk
         gS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5GhQQsTYAAakqIebY0pmOooVtTctff2fepBqdclguc=;
        b=oBiG43QqKvvth+PUtoaupfGSaA9U/L66QiU5aoCZ4+9CJ5erQOhKetQs9/UgnkyG3n
         3LuvnxIA5QRlWMYHHoRkqM98Cv59i418QWCe41GUy5vvavHNOeV1xjQ9VYuUMGZX21xT
         +Pe5zdj+35pJxQNycq/F3aEuuu67ef2IZAuNREvilbKUPLYgC6CUA4bVh6/eQ/2IMGmi
         +TzmbkwsDkgkhkvXw+O1r0fkwx9Zlph+2oU5NTxqj0OTJJjDhTINBvCpiyhIGR5ziTgc
         v4rozEZpLpIydm5ESX5pTHJMv18Tc4VPkggX4sLRpcUd65yrr7Ob2O5LtJ0+x8EWKgEv
         QNag==
X-Gm-Message-State: AOAM532c6hXimG6re9PzGoxN1AyRrxHhRHlS3jDOCKwNL2R4BwbF5Nhl
	bZktBKSTva8C6sS8z2T2keyq3wX2fpJn1PFnC+3Czg==
X-Google-Smtp-Source: ABdhPJylpvxrk3tE1z7LwAv8lp/ZFX5HrfnNDDCkY5RZKeMSM2cq91zq/m6G1gLjpe/paJk04xWBBA5L4hLBNvzMj8c=
X-Received: by 2002:a2e:8650:0:b0:24b:5309:352f with SMTP id
 i16-20020a2e8650000000b0024b5309352fmr123893ljj.472.1650044434510; Fri, 15
 Apr 2022 10:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net> <20220415152633.GA2731@worktop.programming.kicks-ass.net>
In-Reply-To: <20220415152633.GA2731@worktop.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 10:40:22 -0700
Message-ID: <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
Subject: Re: The trouble with __weak and objtool got worse
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, hjl.tools@gmail.com, 
	mbenes@suse.cz, rostedt@goodmis.org, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 15, 2022 at 8:26 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Apr 15, 2022 at 01:19:04PM +0200, Peter Zijlstra wrote:
> > Alternatively:
> >
> >   https://sourceware.org/pipermail/binutils/2020-December/114671.html
> >
> > seems to suggest: -Wa,--generate-unused-section-symbols=yes, ought to
> > work, except I'm getting:
> >
> > $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,--generate-unused-section-symbols=yes -c foo*.c
> > as: unrecognized option '--generate-unused-section-symbols=yes'
> > as: unrecognized option '--generate-unused-section-symbols=yes'
>
> Reading so hard...
>
>  $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,-generate-unused-section-symbols=yes -c foo*.c
>
> seems to actually work.

$ clang hello.c -Wa,-generate-unused-section-symbols=yes
clang-15: error: unsupported argument
'-generate-unused-section-symbols=yes' to option '-Wa,'

:)

I recall LLVM not emitting STT_SECTION symbols being problematic for
objtool in the past.
Old pre-lore archive:
https://groups.google.com/g/clang-built-linux/c/1C6YoJKBsQQ/m/a8IS1NjGAgAJ
via https://github.com/ClangBuiltLinux/linux/issues/1209.
(It doesn't look too bad for me to implement)
-- 
Thanks,
~Nick Desaulniers
