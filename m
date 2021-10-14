Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010772
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 19:33:30 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id y67so5081096iof.10
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Y3CUDnBdTwrB31OmbGNsn7XVJp+6GgfdsLjPUZSzRw=;
        b=jADDAblRGxyXiLiV7CxIpwecQCD9qtT4yoY2Xh45iAsai0Ba3cIwOwcCtpwuPaccXk
         7n1/qude1VF3weiueYkQQtxs8v4r8g0tZfUbIOd/vosMMipYCotyffMJOlE+BAvjXhny
         NQl4UbSsCCV0wK3Th+fGAr7Bq2YVx4EtvFoWjsPstB5Fh889MYCp047ncx3ZrEWF+qY5
         6A1slEOTm//B+IS+w0c1kkg2kuzEpFerJtFxHTuyHzCgPkyUo9GaFDoqJcrZuZMgMryI
         REGOKKO22dHzb454XsjmdAxItSzmmTa0RUmusEahaBvCZpxfVhBWqwSea0EREou36i7m
         9D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Y3CUDnBdTwrB31OmbGNsn7XVJp+6GgfdsLjPUZSzRw=;
        b=EFpybBvk6QIfaAVRXji5biPlGX0xareyWu1l8ym+D85bOM3UlfQu2Cvk9cbW6Q1llm
         Pi9BonYYJwyv2vdmROxA4Fnzh96q8ddnosaVzc2+XW2ixeNCgkjbTWkAs/BAUrx5EB7J
         QF3WV52oIIHvI+4+oz7oWiGrKv285xu3wL8yrhQHqxmJOF3WWEbWzHNcDkHzXxTdQWDn
         jAjoTWxnz3lS3K56Tj/p2uozRL6y04TQsyccpMcTqJRQhE9yKUAqSc/4dDH37dEaECte
         vmFMECmfF3IDJSQ5lap9FpeeWF/Vc4e2+u/qclizWm2CoGFkTvPu2LhtAvd2yqa6/vL0
         vHrA==
X-Gm-Message-State: AOAM532Ru+YW9DXsQVpgPdGmNFLSBtS6yFrokXpODN66CSBQ4yLbL0Zq
	/7eIIPBLqilvyJPNecWlWPt8stZ8pgF6Rht4Wa0=
X-Google-Smtp-Source: ABdhPJwFRtnszd9LYlqNvIgsElFFrpNYGnstm/pQiqEgtxIO9ow2deXivNbAElzfpFpNoNFcwvJ0fM24pn6fAwxIGtA=
X-Received: by 2002:a5d:9d56:: with SMTP id k22mr654825iok.177.1634240010184;
 Thu, 14 Oct 2021 12:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014132331.GA4811@kernel.org> <YWhGQLHnA9BIVBpr@hirez.programming.kicks-ass.net>
 <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com>
 <CANiq72nt+8bCGAm8yhvTZfS64ovOi9_U=Gym7biUhdEsc3Neaw@mail.gmail.com>
 <CANiq72=UVCmjr1tpSwcoOkid5tWZirKCnV17_Peqy-LBmEQHEg@mail.gmail.com> <CAKwvOdkSFhzSwo2hfFjXXHypC8eU+VBCnRVjvNima7qx85z65Q@mail.gmail.com>
In-Reply-To: <CAKwvOdkSFhzSwo2hfFjXXHypC8eU+VBCnRVjvNima7qx85z65Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Oct 2021 21:33:19 +0200
Message-ID: <CANiq72=vZ0gvJRuVcNaBi3CQfgB4edEUyLpL8DvZeLkDSvttOg@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 8:55 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> $ grep -r BUILD_BUG_ON | wc -l
> 3405

Definitely -- I am assuming a significant part of the macro
invocations cannot be static asserts so that we would ended up with
churn anyway...

> Oh, that is a good idea.  There is one already for recommending the
> use of static_assert instead of assert.  That's actually very nice.

Happy to help!

> in the kernel, I wouldn't waste time with one off patches; rather I'd
> work on automation (since clang-tidy can be taught "fixits" to fix the
> code in place, not just warn) so that we can better enable treewide
> changes AND keep new instances from sneaking back in easier.

For automatic fixing we would need to be a bit smart due to the
negation w.r.t. "style", i.e. in most cases it should be easy to apply
it to the expression, e.g. from `!(x == 42)` to `x != 42`, but in
others it may require some "human touch".

There is also the possible mismatch of the usual style rules even if
we apply e.g. `clang-format` after it (one more reason to avoid human
formatting...).

But yeah, I think we should be able to cover the vast majority of them
easily. We can always send them as RFC patches and let folks adapt the
patch, then enable the warning/error by default after one release or
two.

> Let's see if I get an intern in 2022, maybe I can have them focus on
> clang-tidy+kernel.

It would be great to have someone adding more `linuxkernel-` checks!

Cheers,
Miguel
