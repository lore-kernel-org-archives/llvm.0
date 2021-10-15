Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72A2C80
	for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 12:37:08 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id h27so1208031ila.5
        for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBCobx1elChS3S72aWgPkS35OCuA3QaSZD8Frtc45ag=;
        b=iJTMVr8H9Pc1mfOZ3QaqwqH7z0uikzveNVHw3RlNcVIO4ADVpV26rzeDIpkQyb3Xin
         bOMAyTKd8pebx+gbZO51dAmO6ur/GHab1k25f/GHBfUBmbgNkwoiIDnDaCbLWlmMaWR5
         ohmjzl5q0NHxwOPkAFojgY8uwWcwJ1t6a5z42UnNYkEgitm/43iz88WfL9CbC/pB7dVY
         gRhjuGrgocpww19juqupsYVoTGAngXYV3WyAlOolzz26L6Pe7/MQANlEY75dWARdjhgU
         QxMCD3H498TL3YOPUFzN2RK5urlwBRfkFYBmM/Gs7b6vg4+7ikucU1WyNq6xq6spH5RC
         hDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBCobx1elChS3S72aWgPkS35OCuA3QaSZD8Frtc45ag=;
        b=ul4gHb7UzvIq+2FH8GBP4K/x+J58OTf3C9jHmjQ9+bXmBYTxAlbJJ2oWEhRJnP/ssU
         0z9cXP8m4qigk5lhbdXNhpRO229472OXfLyRMo0k87qMybJI2AImNNKY1grLoX6ve4pR
         bNG7GZoNqPn2AGt+J90eNs3Nr5aT+qikgon6HO5GJUC7UcDEYGoqOqhdCIKbY2EazqJC
         HrdjRp29rYGnA2gwKCnVz/hShIGETKoShGKpVM5pH3W1UpMEURMr9Qvn+K3oXXFgfmSB
         Pf2lE6OXuq9I4ivUhHHPEYc/uayXe8bR8lwIs1PSnqXgabmhOMERay5zcBZ/KVtjmx46
         Y6Dw==
X-Gm-Message-State: AOAM532EyaYlwnDho+GMAd70ILQjleKKoJQ5vZp2jAFHPjuo6CwUK9dx
	R+6PrZ3Z3UEZ5BaOC88BCqPoyFQ0ZW1bQQug6BQ=
X-Google-Smtp-Source: ABdhPJy08tjEX/TX/biV5oNsvhja4qA/4EvwJCIrAXxvtOgtJmRKi6+IKCsjW5Z5vwGkurS7u2XPMLAkgUrh0ierg9k=
X-Received: by 2002:a05:6e02:1688:: with SMTP id f8mr3667088ila.72.1634301427629;
 Fri, 15 Oct 2021 05:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014132331.GA4811@kernel.org> <YWhGQLHnA9BIVBpr@hirez.programming.kicks-ass.net>
 <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com> <d1c957c4-a2df-935c-2992-3540f05fb110@rasmusvillemoes.dk>
In-Reply-To: <d1c957c4-a2df-935c-2992-3540f05fb110@rasmusvillemoes.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 Oct 2021 14:36:56 +0200
Message-ID: <CANiq72ne8m4q1rRToJsH1A+b1_7FAk1wYtcwvKc9zH_8sR2-gQ@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 10:11 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> A yakshave that would be worthwhile is to kill off the macro
> compiletime_assert() completely - three is a crowd. It sounds like it
> would be implemented in terms of _Static_assert, but it's actually
> __attribute__(error). We can fold the definition of compiletime_assert
> into BUILD_BUG_ON_MSG.

Agreed, two should be enough.

> Why do we even have a no-op version if !__OPTIMIZE__? AFAIK there's no
> CONFIG_O0 option, and such a build wouldn't be interesting at all - it
> can't be expected to boot, and it would likely throw warnings left and
> right.

Yeah, I don't think it would compile as it is anyway.

Perhaps it is there for some kind of tooling? For a static analyzer or
something like sparse (if it didn't have its own define)...

But yeah, every use of it should have a comment explaining why it is
there, like crypto/jitterentropy.c does. There are a couple without
it.

Cheers,
Miguel
