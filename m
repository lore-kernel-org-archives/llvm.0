Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37C2FAE
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 19:22:12 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id x12so6919785qkf.9
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/tuWyi96ya0DlbzWNr34/HVx+HP3Iol741vjN64iIc=;
        b=AnkZHp5Jxa0Wk/NFWfm8jROZ4vvwpLiSaBjXqAL2Oj1rT8lPI5/T+3P56rGO8gKyxc
         kvInbIhXASrI/xTvh9/fbw4QmCGU0MaFulfd4JkXMuFWPqLvO4VCU+udtyP9m4y21FSZ
         Rw2TC2kmSA+ecaVyQDNVXPE9k049LXNX+T1MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/tuWyi96ya0DlbzWNr34/HVx+HP3Iol741vjN64iIc=;
        b=lSOHa6ZusAxW6gz25U2eZuC+0s98eR9rOE97bFm+jkkgG+tMxmZYPJfnnnBg/pfR39
         d4+IBxa+EEKyonzJ4PseOps/wMQrF19hXWiuIs82JFF5jYMBqETRKjxcmk4LEMw18GaT
         PSo77pGblCZ9Ft7KyZZE9ooC2i43iMxz9hQY/oYmWbpYDY6AYOLnIZruK09OcrwUQWdk
         uPH1zBoFpT5Wa7mO54a37sXI58mxafTpOAvhniDqC/6Z/UJNzjin1EA/8BRUKjzPZpgP
         NLTcAOQCc6mwu6wndo9Rpyv/k9XQJl3GyjhUXb6jb5J6f2M7FFIU1+/25krjV+6REcgf
         RJiA==
X-Gm-Message-State: AOAM5318BiQmuojj8lVQTloIeNNbsiDbx7hUtlAWy6/24dp8eKlsWXgx
	svA08yYrR/fql8pdEUHf1AG78nBwbTeIgnzoN55aLw==
X-Google-Smtp-Source: ABdhPJyu6UK46UBS0OHj2irlAkBg9aMdwS5Co0/0aOtKyGefuOKuYsb1XI+LyBQcOZdjLAAAKvP6iQ==
X-Received: by 2002:a37:a54c:: with SMTP id o73mr6381651qke.334.1633029731301;
        Thu, 30 Sep 2021 12:22:11 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id x79sm1887410qkb.65.2021.09.30.12.22.10
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 12:22:10 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id r4so15639659ybp.4
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 12:22:10 -0700 (PDT)
X-Received: by 2002:a25:6b11:: with SMTP id g17mr1212374ybc.251.1633029729737;
 Thu, 30 Sep 2021 12:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
 <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com> <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
In-Reply-To: <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Sep 2021 12:21:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wix+P0EtxFSEhmubWNZ++Qg1fj46e32uEKo+mzPu0jPAA@mail.gmail.com>
Message-ID: <CAHk-=wix+P0EtxFSEhmubWNZ++Qg1fj46e32uEKo+mzPu0jPAA@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 11:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. That's just a "bitmap_weight()", and that function in turn is
> __always_inline.
>
> And the *reason* it is __always_inline is that it really wants to act
> as a macro, and look at the second argument and do special things if
> it is a small constant value.

Looking around, it's not the only one. A lot of the bitmap functions
do that, but it looks like we're missing a few __always_inline cases.

I wonder if we should have a macro to generate those "do X or Y
depending on small_const_nbits()" - and have it generate
__always_inline functions.

Of course, some of those functions have more complex "check at build
time" cases, like that bitmap_clear/set() thing that has a special
case for when it just turns into "memset()"

We have a lot of these kinds of situations where we have a "generic"
function that specializes itself based on arguments. And yes, they are
often recursive, so that you need more than one level of inlining to
actually determine what the arguments are.

I don't know if we might have some way to mark these (and detect the
cases where they don't get inlined and we lose the vasy basic
optimizations).

It's kind of similar to the _Generic() thing that does different
things based on static types, it's just that it does it based on
argument ranges.

          Linus
