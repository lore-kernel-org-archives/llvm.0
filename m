Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EE3FE6
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 18:32:57 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id y26so75981800lfa.11
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 11:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwoGj5TiUa0A7agdZvrBz9UD3O3dDdKIGQX+inibl1s=;
        b=ddRmXF8X8j+bmGpyuQGk0heDxx22+vmZgoacQBq/+c1TT6df9s6Rtro2xLb64I2Yu+
         BmdU6+FmgvOXOdUgyftCb2yDr8n4vFlEW61Dp/GL+MbNdvLC0O2qFYO14k9k7d9V1Zvj
         pqpla6bpEpIuLSktFJMuZvZ8Kg7/xj/KP5SZJGad3JCBGf5dEIExcglz1j0bxeUJ4aPr
         u0BjLMY2wY/0oOepwyJJ8uuUz8YYUbo/MYg0ijj38cCHV7FIS4CGt8ek3TpmSt5VP/94
         YlOytCstTloL4nYEluzCPSWYya0HfFzS465zdp4iMlBfWcOBCoJ8XdddjoEnMZKqM8WS
         VJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwoGj5TiUa0A7agdZvrBz9UD3O3dDdKIGQX+inibl1s=;
        b=P1AxPkPp/pBwDdrN8TYlGYtFKSKXj/XB7dSgl68MkcfBIRQmGtt3R96MnUHl+hcwJN
         CJg4MB7XxvOeSF60EbHiWfNNr/sRj5AAPPc0gm6jrgOoPN04PYrhqeTjgeyg//lwlfMt
         UqbewAA2li8/U8ZEMonMSly6D2R/2Xm1vUZcb8pBiIPJMvYk0SlRr2VKoi4V9KClh9Lr
         rtUaMgsBj+3q521xzAyxYJ+B0jxv6a+fFWJaShbRY4bFj5HldPX3IQ/M5DVTTLQ9tV2J
         jbIYfQaKeTf4ZMai8scLKOTiPtqBJhGOB1bz3M3he9iRmby7OAzE/PZtVDgw3nl02tmw
         EYcA==
X-Gm-Message-State: AOAM530HJLHlg4z0UyryGiM+34K24BgLjbPD3ZIE7ru6aJSTBxxrb9ru
	vWq6cozji92I+NJtDIwVsLnCGXpIncmvVdzxIWBIKA==
X-Google-Smtp-Source: ABdhPJzUAdumac7faofur/bcBqVOc7MFPVVcHzNcxQx4QmrJgjZUPBivKiZQUJ2L7ONM8nHQC0hNMbAyc5EpAC5IQMU=
X-Received: by 2002:a2e:5059:: with SMTP id v25mr17260172ljd.128.1633372374879;
 Mon, 04 Oct 2021 11:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110020501.RKX4zca7-lkp@intel.com> <20211004162936.21961-1-ndesaulniers@google.com>
 <163337043811.3396838.458236649388694225.b4-ty@chromium.org>
In-Reply-To: <163337043811.3396838.458236649388694225.b4-ty@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Oct 2021 11:32:43 -0700
Message-ID: <CAKwvOdm5bBUE0df8jbXq+bSCf9U0AM3Wm4NsZeHu=Nuhi0yd-A@mail.gmail.com>
Subject: Re: [PATCH v6] kallsyms: strip LTO suffixes from static functions
To: Kees Cook <keescook@chromium.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "KE . LI" <like1@oppo.com>, 
	Stephen Boyd <swboyd@chromium.org>, Fangrui Song <maskray@google.com>, 
	Miroslav Benes <mbenes@suse.cz>, Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Joe Perches <joe@perches.com>, Jessica Yu <jeyu@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 4, 2021 at 11:05 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, 4 Oct 2021 09:29:33 -0700, Nick Desaulniers wrote:
> > Similar to:
> > commit 8b8e6b5d3b01 ("kallsyms: strip ThinLTO hashes from static
> > functions")
> >
> > It's very common for compilers to modify the symbol name for static
> > functions as part of optimizing transformations. That makes hooking
> > static functions (that weren't inlined or DCE'd) with kprobes difficult.
> >
> > [...]
>
> Applied to for-next/hardening, thanks!
>
> [1/1] kallsyms: strip LTO suffixes from static functions
>       https://git.kernel.org/kees/c/6eb4bd92c1ce
>
> Also,if you get a moment, can you set up patatt (or b4) to sign your
> outgoing patches? DKIM is nice, but I'd like to see more folks signing
> their emailed patches: https://github.com/mricon/patatt
>
> tl;dr:
>
> add to ~/.gitconfig:
> [patatt]
>     signingkey = openpgp:FINGERPRINT-HERE
>
> # install git sendemail hook (assuming you send with git)
> $ patatt install-hook
>
> # or do it manually before sending:
> $ patatt sign $file-with-email
>

Sure thing, trying this out, the commit hook seems broken:
$ git format-patch HEAD~
0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch
$ git send-email --suppress-cc=body --to keescook@chromium.org
0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch
patatt: E: -: Not a valid RFC2822 message
fatal: 0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch:
rejected by sendemail-validate hook
fatal: command 'git hook run sendemail-validate -- <patch>' died with
exit code 1
warning: no patches were sent

`patatt sign 0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch`
seems to work.
-- 
Thanks,
~Nick Desaulniers
