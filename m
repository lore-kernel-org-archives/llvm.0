Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69963C26
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:48:53 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id d17so1009540lfa.12
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6hct8xCrE6CB9ftodiKvDlwTR0gdrnA5ClwcliBbPY=;
        b=JMubbrBv1Nd+8w6FEi5or5LUmjlC2ld6RSrBV9zeh4LiULoqJiy9EVpd3jtEFtwJCi
         PZHnxwTZ1skg3P7ZHuFqsRPmgQuZUhh5qDWu0VuZ/qPk4BjGMeThmvjpzJLjrSpIK2Cm
         EKrTCSJ7od43H4++62FeYEuZDqMh+oH31imbnETjgycNPi0hBVSySmdfM+XljybFGRBM
         Z1lu2fA4faSic32ei6AxwHfu2kATgh69lgbGfQy6YffNkFLmFlWU+qpcfDGFmoZEE0Ha
         fpSY4lN7hB544+d/F4GCctLNlY12yUCNT9vWbPbeYvBd0NBzY3dVsAVs5dgzZrBjtciR
         pBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6hct8xCrE6CB9ftodiKvDlwTR0gdrnA5ClwcliBbPY=;
        b=zqI7pbCTEDXznQ2m9RMEiUX55EaRVBUewgXFynuTnb3ex1rWnCU53Ssl3+u1J0v/F4
         sYgpMCRo9YZMQ6ezWMvMrGSY2D3sIMJyonnR3no3+a2W5rI7L0XQQocHVj5Nw8KW7mBx
         qrVBS0bsS1kkMx/k4mqR8VO2/uiIe7qtB5FqZcfLjGGeLRLV6Mj6/m3QeFcl1qt3kEZm
         2I7dU4d1K5RspZZbgWSPOVq7/6qIK9YDZg3r23XWdh4u4j5mrJ9xCTesvveXheZ3PNcg
         SHwWqF5JVyJU1sFJLY8gEU8ukVhORRsrLT71ZtzuRwkjVNzD7X2nNm3pVUv5jHzugjlW
         3E7A==
X-Gm-Message-State: AJIora/JyPNIG6cekM9cPnhmsUD71bLl/CW0nmAImkdUr+mDoatj82Tg
	3DQrR6TScFiZQFQE7iB6dNUlFkvV2XyN1HNMV077ww==
X-Google-Smtp-Source: AGRyM1viW5VSMgPFgPinMrTL+kpk+XpxDY9JqlD86usXfDLVMuZ2ksntxKfHUq/p0uaQkcha+Bst/d+d0seMWLDTQO0=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr3942194lfr.647.1658414931709; Thu, 21
 Jul 2022 07:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714205646.4023495-1-ndesaulniers@google.com>
 <CAHk-=wgf=mrK7KzNh23dGtegSfJZx=423dCwF0hVTPOjfQ7jtQ@mail.gmail.com> <CAHk-=wh6iW0Fv9mbtX9k2=9Kc9pFEEX7unWzmN7vqB4qXhBL+w@mail.gmail.com>
In-Reply-To: <CAHk-=wh6iW0Fv9mbtX9k2=9Kc9pFEEX7unWzmN7vqB4qXhBL+w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Jul 2022 07:48:39 -0700
Message-ID: <CAKwvOdn1btTr1DeAJz-xRw4tLcwCMmrXbJChOVrvjAZ1KtnZew@mail.gmail.com>
Subject: Re: [PATCH] ubsan: disable UBSAN_DIV_ZERO for clang
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 10:34 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I decided to make a non-kernel test-case so that clang people can look
> at it without having to worry about any kernel code issues or the
> details of the SMAP rules, and it really shows how clang generates
> horribly pointless and wrong code.

Perfect, thank you.  I was having a hard time reducing this one.

>
> I'm not sure what the right thing to do is to get this sorted out, but
> I created an "issue" on github for this:
>
>     https://github.com/llvm/llvm-project/issues/56568
>
> in the hope that this can get fixed. Because it's very clearly a clang
> misfeature, where clang basically generates insane code that violates
> the rules we try to enforce with objdump.
>
> Nick / Nathan / clang-built-linux people - if there are other better
> ways than that github issue thing to make people aware of this, that
> would be lovely, and please forward that issue to the right people.

Perfect, thank you.

LLVM moved from bugzilla to github for issue tracking last year.  It's
best to file issues there, or in our issue tracker (also github) which
is more specific to issues pertaining to the kernel:
https://github.com/ClangBuiltLinux/linux/issues

You can cc Nathan or myself in bugreports via mentioning @nathanchance
and @nickdesaulniers explicitly, or just forward us the link and we
can subscribe.

Putting out some other fires/regressions at the moment; it looks like
Yuanfang has already started chewing on your bug report.  If they get
stuck, I'll dive in once these regressions are sorted.  Should be an
optimization opportunity regardless of UBSAN when we know only certain
bits are set.
-- 
Thanks,
~Nick Desaulniers
