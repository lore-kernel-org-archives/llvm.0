Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5833FE6
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 21:40:05 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id mf9so35269119ejb.0
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=klf2T5uOmYkulw+Ytxhor7E1jRh+wZUXX4z/9h4gYAk=;
        b=hAQm1c13W/XqzJEQGpVDQndjuXTIF/hnLGFygg19fcRMwVFwwvtwTnuY62qNkTKPsN
         ummZuhAltApu5WzcBlZRapxwbWg7c0aLtThrKLZaU63b6nHxlLMnebmA/0hCeagDrFcn
         hagyyVyTMpXMrTeCXHSAtT7Z8257jVCbYTvK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=klf2T5uOmYkulw+Ytxhor7E1jRh+wZUXX4z/9h4gYAk=;
        b=c0zYBLkUn0bhWfxHh9d+NX6lL4ldxQr3zPdZCvRfr7wGcI4PsyYG8znKuF1moiNXh8
         H8jAZZISDMNbuQEUb4nsZnrgiXOXSPJXsRtPI759opbaGXU6pEn8y53+V01xwYEBOXkg
         N/MzWr5ku4lJjFjKk/gN3hWTz36B0d5rbPQCX3orHheiz8+kHGv5OS9G0GvjhtjW1z6b
         /DBxBQXlRLe8zQaI8SES4JYiVza1YM5cTkRXjdzWgXISnzFNP/sEE2QddeJdvKb97pqi
         jkQGTaLFtLf592RjdYkqk1vrZf2w7FlJ3qGqH1aqsaxVk7allr/MolmonzuLhXRoaAmo
         GTVA==
X-Gm-Message-State: AJIora/H4Q2smUY5KGU5jQOhNW/j7ydsagwZ5hkV0ub5WMsvPfC+bqDl
	IIgPkZDFkoLxRLSyenRxjl1Ei9EE4kT53yrJ
X-Google-Smtp-Source: AGRyM1svd4din+qjltEe3K+yEtq+UwdxC8P05ulpehyXu1YzLiAm3ZhjPQH91P89F+wJVlUOWO9xbg==
X-Received: by 2002:a17:907:3e05:b0:71c:2ba5:1ab with SMTP id hp5-20020a1709073e0500b0071c2ba501abmr5336435ejc.93.1656538803826;
        Wed, 29 Jun 2022 14:40:03 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709063fd400b00722f66fb36csm8060136ejj.112.2022.06.29.14.40.01
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 14:40:03 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id m184so10147035wme.1
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 14:40:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:3a1:68bf:d17a with SMTP id
 g12-20020a05600c4ecc00b003a168bfd17amr5659198wmq.154.1656538801585; Wed, 29
 Jun 2022 14:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YrLtpixBqWDmZT/V@debian> <CAHk-=wiN1ujyVTgyt1GuZiyWAPfpLwwg-FY1V-J56saMyiA1Lg@mail.gmail.com>
 <YrMu5bdhkPzkxv/X@dev-arch.thelio-3990X> <CAHk-=wjTS9OJzggD8=tqtj0DoRCKhjjhpYWoB=bPQAv3QMa+eA@mail.gmail.com>
 <YrNQrPNF/XfriP99@debian> <CAHk-=wjje8UdsQ_mjGVF4Bc_TcjAWRgOps7E_Cytg4xTbXfyig@mail.gmail.com>
 <CAKwvOdmQKo4tZRLWxK2tTvd+OEtUmKJM7XiijLAF8JWMeUzFMA@mail.gmail.com>
 <CAKwvOdnfRnqBF8exO-Y1ooX=67TrO_8fSzgZwvUtidN_P31hzw@mail.gmail.com>
 <20220628224255.w4lmzalkx3qejuyg@treble> <CAHk-=wivq+i2-xp3WagixzQMBXaD4etMDmiTp5f-mgsfwOjxtA@mail.gmail.com>
 <20220629163400.cgeqmuu45zsyxtwq@treble> <CAKwvOdm7=6M3pdHnqLFYkV21ypYpN4rTaNCe48dN3hWOOd+T2A@mail.gmail.com>
In-Reply-To: <CAKwvOdm7=6M3pdHnqLFYkV21ypYpN4rTaNCe48dN3hWOOd+T2A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Jun 2022 14:39:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1qhf7y3VNACEexyp5EbkNpdcu_542k-xZpzmYLOjiCg@mail.gmail.com>
Message-ID: <CAHk-=wj1qhf7y3VNACEexyp5EbkNpdcu_542k-xZpzmYLOjiCg@mail.gmail.com>
Subject: Re: mainline build failure due to 281d0c962752 ("fortify: Add Clang support")
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 29, 2022 at 2:21 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> For hahas I tried:
>
> ```
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c

Yeah, no.

I think the proper fix is to just say

     depends on !CLANG

in the UBSAN Kconfig.

The whole point of UBSAN is to *detect* undefined behavior, but continue.

If we wanted to crash on undefined behavior, we'd just leave it alone,
without any compiler option.

Think of it this way: you have a user (corporate-speak: "customer")
that is seeing behavior you can't figure out. You enable a lot of
these debug options to see "are they triggering something I can't
trigger?".

But you want to get the *report* about that, you don't want to
actually break the users load.  You want the user to be able to do
what they always did, knowing that at least you're not making their
problem any worse. Sure, it's slower, but it should just continue as
well as it ever did.

Whatever UBSAN then detects may OR MAY NOT be the actual cause of the
user report. So no, it's not ok to say "Ahh, I found it, I will now
print out the report and crash".

So at no point is it ok to say "oh, that's undefined, so we can do
anything we want". NOT AT ALL. That's actually true in general, but
it's _particularly_ true when you build with UBSAN, since now you're
actively trying to get reports about undefined behavior, and crashing
will destroy that.

It will destroy that particularly for a kernel where crashing in an
unusual place that the developer doesn't see quite possibly means "odd
device driver". In this case it would be the particular frame buffer
the user uses - crashing there probably means that there is no output
to help debug things.

But this is actually true even for non-kernel uses: if you are running
an app as a developer, and you're looking for problems, having one
place with undefined behavior in no way means that you don't care
about any other undefined places. So crashing is literally *never* the
right thing to do.

So no, the whole "it's still undefined, so we can't return" argument
is completely broken.

                Linus
