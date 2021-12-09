Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B621368
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 12:58:48 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id w5-20020a4a2745000000b002c2649b8d5fso1633007oow.10
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lxsC+6JiZmFDaNw110BSUcqVFCAa+894CcThmcjMkw4=;
        b=ODJRjouncmQdis6R3Wkh0AAmsVvD75zmtLay+9U5trU4UpmYi+Oafvfm9sYnpZKsNL
         +irLZobZ5CaBUGopda5OwI8/bBOPE//XpncmNzbCZxDrcpwvZHA35nNFZZful9gS93z9
         gffPJXdFC1OHKb9ZlVzm3VEkvl2maD5ppEcIOpcUR7zICKJlYcNPm9G3T3edTzp8qPNK
         4RZaSjhSb0qco+YzxVmH9msEqP4GGXzg6r+yr+uustf2sqOcsAx2ut9+mYs7tW1+Ne3s
         s03kNoTB7kVEt3lkJ/+JkIPVrQtJG+cdPH6uiAvTYrG9GiWbD60xezK8cLkJ+ErnbUZe
         c+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lxsC+6JiZmFDaNw110BSUcqVFCAa+894CcThmcjMkw4=;
        b=MaAB1mKGMJwM6xDNLyX+FG0LKLsnbZfc3uWKziLT054/GZenYBgsTiOzT51GP1wZqA
         YGGYbOaJcuKZ5qwEfBtM/qCpw8f0YIyfmjsZgSk2ofgnA8T2sYy+PZQt6k4HmVF8Mwi7
         WPJawPGT4BzNcHZZmhPMh8MTUDD2E+SM4aBPeiMv4HKiOUMEJxMnUOBejCB8r2XRw6Sh
         b/frRiFcHeOwXR8xAGXWil0vLk2mO5IiQE2EfnP+6Blh0cEYKfYKrDvRDKEK1WPU7xy5
         +abTGZDSAXMZjjq9OjFUXCxbB+i1A3feKd8wmoRSa+uNsyex0fTQlsCYBqrSnV/FlJgD
         nu8w==
X-Gm-Message-State: AOAM53099YsUrOJG63xY79mEJd28UfaVAnlwjfsBVOTOsvIUZ6J9wQyH
	1sRxDJlnxE2/ouYJxCAqD5nLpH1Y2FNDWMYob1ORPg==
X-Google-Smtp-Source: ABdhPJx1kHulafJl7mfoeK/Aaae12wnFfqTO5IQ/HVdFm8xIC0tzHu8TGZCUdVjrgJX5a2XnFm74ss0UQEZzk/RMIwM=
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr3585635oos.25.1639054727653;
 Thu, 09 Dec 2021 04:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com> <YbHaASWR07kPfabg@hirez.programming.kicks-ass.net>
In-Reply-To: <YbHaASWR07kPfabg@hirez.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Dec 2021 13:58:35 +0100
Message-ID: <CANpmjNODi8sLHe8JoU-phddf++vh+1sW90b08j-yM7chsecxyg@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Potapenko <glider@google.com>, Jann Horn <jannh@google.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 11:27, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
[...]
> > There are several options:
> >
> >       A. Make memset (and probably all other mem-transfer functions)
> >          noinstr compatible, if that is even possible. This only solves
> >          problem #2.
>
> While we can shut up objtool real easy, the bigger problem is that
> noinstr also excludes things like kprobes and breakpoints and other such
> goodness from being placed in the text.
>
> >       B. A workaround could be using a VLA with
> >          __attribute__((uninitialized)), but requires some restructuring
> >          to make sure the VLA remains in scope and other trickery to
> >          convince the compiler to not give up that stack space.
> >
> >       C. Introduce a new __builtin_alloca_uninitialized().
> >
> > I think #C would be the most robust solution, but means this would
> > remain as-is for a while.
> >
> > Preferences?
>
> I'm with you on C.

Seems simple enough, so I've sent https://reviews.llvm.org/D115440 --
either way, there needs to be support to not initialize alloca'd
memory. Let's see where we end up.
