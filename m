Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB272
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:33:42 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id g2so4543125ild.1
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 11:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+j+pYQu87pkGY8k6xk4ixkLqZhQPYzfsNnrem2/r1sI=;
        b=JD4j8WQLmkICYaOgc0gXMtkfwdLsHiqWqk/yDvb2iEPf1sS/tWrj/pvDmVsWRHBfyX
         QZjDJdyeGbtV/NSZ5a3YbXN1qhBVaIIuZS1uwZ9jawtEPUDZAksIvjn/+o5NsCoz+w1r
         rnOWL2umfadRvrCrcqAu8+ZYAad/TJTcses5NgAd8hIRp7B/6SGW3lgpewFbuiSfhEQu
         ufuHg8HhRFgSH4ijfhWAJKUk+u6NtOC1G0Nl+yzrsSnMZpZ5vt4H4dSuQNMY5cLgfjrR
         MxpbST35FiGRw5eISbkvmuFRkina+AbMOCuyYlxE7Bgrr4q+5tWJs69P9WCATiPOmxPS
         b1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+j+pYQu87pkGY8k6xk4ixkLqZhQPYzfsNnrem2/r1sI=;
        b=zZ1Xs0+mucJzsexKRPKCULA8gGrylKtzUU069I92JFVwhG0wk3NXoNfhqElVdTHoIB
         y+96nlyKXjey/50oTJjG8Ncqew5lfkKq28Yc7jVbEy/Y/0/F3eByXnJMHfz4ZASWPrGK
         yIzEgjZmI7sZmzMaQFPt0njWSnUJaNM2/oyyRQA1wKD4ZSHgeEnXIyRhn711vNqIIUn8
         kw43QD6kLDtNqV5wTjcgFLaqBQXDw79ObBgHnQFbtUKpEl0LQW5tBqWt9kApsckKUzLN
         hioh40xmcWOCJB0nu797jMiuGI6a96KrDF6D3vJDs3iK7O2tIqzpnaTSbH3XIfs7cO8S
         ZWvA==
X-Gm-Message-State: AOAM5323mKOUHWM77i1kI9sCG6GMvO/pEB141nIJG1K99FyIbySIGa6G
	MB+u3rLwWKB+CKWt0/tMaU3auzxiCK/qkyb+FLw=
X-Google-Smtp-Source: ABdhPJwrkGmuLdx0cetnkgytKccpl2ClEVCSwUACDYi8lxKtiY4P89Am9jCUSel9JHbSzBfdatiujqc9Psee3W3pNLk=
X-Received: by 2002:a05:6e02:2141:: with SMTP id d1mr455233ilv.5.1634236421531;
 Thu, 14 Oct 2021 11:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014132331.GA4811@kernel.org> <YWhGQLHnA9BIVBpr@hirez.programming.kicks-ass.net>
 <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com>
In-Reply-To: <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Oct 2021 20:33:30 +0200
Message-ID: <CANiq72nt+8bCGAm8yhvTZfS64ovOi9_U=Gym7biUhdEsc3Neaw@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 7:49 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> It's a good question; I'm pretty sure we had a thread with Rasmus on
> the idea a while ago, and IIRC the answer is no.

Yeah, I remember that too.

> Basically, we can't convert BUILD_BUG_ON to _Static_assert because
> _Static_assert requires integer constant expressions (ICE) while many
> expressions passed to BUILD_BUG_ON in the kernel require that
> optimizations such as inlining run (they are not ICEs); BUILD_BUG_ON
> is more flexible.  So you can't replace the guts of BUILD_BUG_ON
> wholesale with _Static_assert (without doing anything else); it would
> be preferable for kernel developers to use _Static_assert (I think we
> have a macro, static_assert, too) in cases where they have ICEs rather
> than BUILD_BUG_ON (though it flips the condition of the expression;
> _Static_assert errors if the expression evaluates to false;
> BUILD_BUG_ON when true), but I think there's too much muscle memory
> around just using BUILD_BUG_ON that if you introduced something new,
> folks wouldn't know to use that instead.

Indeed, `BUILD_BUG_ON` requires the optimizer to see through whatever
you are trying to do. Way more powerful, but finicky too.

Another difference is that `_Static_assert` can be used in more places
(file scope, inside `struct`s...) for tests about e.g. sizes, i.e.
`BUILD_BUG_ON` is not a complete replacement either.

> Probably a better demonstration would be to try it and observe some of
> the spooky failures at build time that result.  We may be able to
> separate the macro into two; BUILD_BUG_ON and BUILD_BUG_ON_OPT (or
> whatever color bikeshed), where the former uses _Static_assert under
> the hood, and the latter uses __attribute__((error)). Then we could go
> about converting cases that could not use _Static_assert to use the
> new macro, while the old macro is what folks still reach for first.

That would be a nice to do, but I am not sure about introducing one
more macro about this... I think it would be simpler to submit patches
for moves into `static_assert` even if we have to "flip" the meaning.

> I'm not sure how worthwhile that yakshave would be, but at least the
> front end of the compiler would error sooner in the case of
> _Static_assert, FWIW (not much).  But I don't think we can ever
> eliminate __attribute__((error)) from the kernel unless we're ok
> outright removing asserts that aren't ICEs.  I would not recommend
> that.  I would like to see more usage of static_assert, but I'm not
> sure how best to promote that, and if it's worth discussing the subtle
> distinction between BUILD_BUG_ON vs _Static_assert again and again and
> again every time.

Perhaps we should add a comment in `BUILD_BUG*` about checking out
`static_assert` -- we have the comment in the latter, but those
reading the former will not realize the may be able to use the
latter...

Cheers,
Miguel
