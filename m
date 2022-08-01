Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35EF7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 17:59:00 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u1so8265881lfq.4
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 10:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7yJue3wpE46mqMp6WfUlVgKTJyxRggT/HsVWQliUjAA=;
        b=baZtFM+E8jy0urk7ZQ/53EmacTrKbsBnvC4gnQsFSE4Xor6gw+u3FxpwZ3oOBhnwpW
         rLj/pVIQZC4/vYyFqDZQCnOTkDIUNeHUIinm/xvmU1t+cJbC6QjCDmIgcBM9yuAehGeR
         z3jZkpzc/sjT3iR4N5Kw9qPzwsgeSvm3VXBF5sj6kzz7wWaj1kT4oH42lixMmwWy3cEp
         0hwtc+ML4IqNE5y8J0JxkRWe++b8jbXAvp50q/q4jQmV0JNcSUNY9oI19wEMddsPC7u1
         aseeDg5zh5jGKprMt726AzYUEB3oc+hRmMHVQwelMzX/IItZKahz9+UTzSCXghGppvNL
         4FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7yJue3wpE46mqMp6WfUlVgKTJyxRggT/HsVWQliUjAA=;
        b=AeXIFNPgkdsuXQiCIg1+Ia8IC1wQrkPRtnSN7lgq/ZR0MmBSuUtzCKzWjPuFerYufa
         Rso0zZlmBcMXfQfpTu6p6W9z371dJ464mdH+poJuZ3DepGUEZAFpmXMQYljzHGhLVDzW
         tf+yv4yOsFoayZbcHDPHfCiP84Tku4l3HFXf5jFb3oR+q9hUYopl5lDFpINRmfq++gm7
         NHcSlVOq6yi4eFFZEWDXB7OR/qiD/cQ11zMcH1r+XGIAiOAsCHbPtZLZQoGHmsyIbmPv
         VkzWIOBfhn88o6eLkDYQ5GWwW1zB1Zx2NSwbdfBEFUazBnXVN/wBBtFrIns5/ouv54yg
         PicA==
X-Gm-Message-State: AJIora9cNfEJY0w6ItJ8vYgUCsX79WT/p+uvJOxzTliMsvIBRNx+W/TW
	EGODYJKVnMTm6+yPLgJLHBRT1twW8JZy2deWizDRIBpAo5oB/A==
X-Google-Smtp-Source: AGRyM1tGJjG6mSt41oFvvwn+SA1Zafr1raTgRq9oDWlEyv2VYmo1Yqq8O7EFhbioIhMWJ4CIBLfi7iGbUSCW3bHKpwY=
X-Received: by 2002:a19:7902:0:b0:48a:6872:68ab with SMTP id
 u2-20020a197902000000b0048a687268abmr5702496lfc.626.1659376738622; Mon, 01
 Aug 2022 10:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728161208.865420-1-yury.norov@gmail.com> <CAHk-=wiFJboHXZEXtMhDcHbEYXujTiDxkGbpONC=DJA7dJG6nw@mail.gmail.com>
 <CAHk-=wgga5hrg5qgm4UwuOCjgBrobhZcdKTr1AFU7WSWgVKKZQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgga5hrg5qgm4UwuOCjgBrobhZcdKTr1AFU7WSWgVKKZQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 Aug 2022 10:58:46 -0700
Message-ID: <CAKwvOdkigxQUF399-WoWwsg-W2dbMj-mx4sOx91hb9RDodqHmw@mail.gmail.com>
Subject: Re: [PATCH 0/5] lib/find: optimize find_bit() functions
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 2:49 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Jul 28, 2022 at 11:49 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > It builds for me and seems to generate reasonable code, although I
> > notice that clang messes up the "__ffs()" inline asm and forces the
> > source into memory.
>
> I have created a llvm issue for this at
>
>         https://github.com/llvm/llvm-project/issues/56789

Thanks for the report.  I left a response there (in case you have
notification emails from github filtered; following up here).
https://github.com/llvm/llvm-project/issues/56789#issuecomment-1201525395

So it looks like at least 3 things we can clean up:
1. https://github.com/llvm/llvm-project/issues/20571
2. https://github.com/llvm/llvm-project/issues/34191
3. https://github.com/llvm/llvm-project/issues/33216

>
> and while I noticed this while looking at the rather odd code
> generation for the bit finding functions, it seems to be a general
> issue with clang inline asm.
>
> It looks like any instruction that takes a mod/rm input (so a register
> or memory) will always force the thing to be in memory. Which is very
> pointless in itself, but it actually causes some functions to have a
> stack frame that they wouldn't otherwise need or want. So it actually
> has secondary downsides too.
>
> And yes, that particular case could be solved with __builtin_ctzl(),
> which seems to DTRT. But that uses plain bsf, and we seem to really
> want tzcnt ("rep bsf") here, although I didn't check why (the comment
> explicitly says "Undefined if no bit exists", which is the main
> difference between bsf and tzcnt).
>
> I _think_ it's because tzcnt is faster when it exists exactly because
> it always writes the destination, so 'bsf' is actually the inferior
> op, and clang shouldn't generate it.
>
> But the "rm" thing exists elsewhere too, and I just checked - this
> same issue seems to happen with "g" too (ie "any general integer
> input").
>
>                       Linus



-- 
Thanks,
~Nick Desaulniers
