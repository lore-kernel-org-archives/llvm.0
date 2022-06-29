Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0263D6C
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 16:08:41 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r18so15016306edb.9
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Os4mayMMpFsaTesvNE1De3rTgq6xRWw/qV7BZPpOtpk=;
        b=WKBtC/f/OZCaP/FFnlHcOyXMiWjUU7ynF9xFnSGYbWvYA/X2Ax01CmrgO82VoImDvh
         X6nmUOcLu5gKe4FtBVG+K8vhI82rRrROpHqYLC06NPtTZeImiePzTylR71l1sfllzP/6
         UQBikD4IORsuI4Y/FcT9ULSZA2hI2EQYkZ0Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Os4mayMMpFsaTesvNE1De3rTgq6xRWw/qV7BZPpOtpk=;
        b=Mlc5Ntvu6EP5KfPUxkioz8vxxvcihM1of19ZxpRJ4bATZceIYii/FnxJTnk0OTBLNy
         ZQOoexh+je5vawR5jRdWmclT3ItrKxuc8o/zsRUJTngpRuPTRt48xB+69AjQU8ZUm26v
         OaSi22X2W/Gce72nP5r/1GmA7f2fB9eN+hYMN9xYWGIn2+6cLjPEdqcVIcozxfBabPr+
         BbzZtipptmkdUxVTZq4gj2v6cQWNIQDGixtiXgN8pg4oJddCGJ5Z/FHx0YDRGt6fCq5P
         zBdSD/M6RHNp5HAIwyisk6Q57f3DQtdzXuPTfkmm2dBB+bD5abkR8PcFeNYLx1AsPhoJ
         uAXA==
X-Gm-Message-State: AJIora+Vm5xan2N8jUVIBlkOZq9D1AR7NfaqdMpEqdPFKAVhYebF5JlJ
	fWvuQovrT5aM4xPKxz+tprPhNcRvFAMSfLwX
X-Google-Smtp-Source: AGRyM1s87cVocbhR+uUxR2zcJKkooKFBQkP3FD7vu0rJWOIZCS7A+y41whK7B0GZTVZfhfxkXL28Kw==
X-Received: by 2002:a05:6402:448e:b0:435:9926:1acc with SMTP id er14-20020a056402448e00b0043599261accmr5184156edb.179.1656518919336;
        Wed, 29 Jun 2022 09:08:39 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id pj10-20020a170906d78a00b006fa84a0af2asm7948472ejb.16.2022.06.29.09.08.37
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 09:08:38 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id o16-20020a05600c379000b003a02eaea815so1384033wmr.0
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 09:08:37 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:3a1:68bf:d17a with SMTP id
 g12-20020a05600c4ecc00b003a168bfd17amr4140154wmq.154.1656518917270; Wed, 29
 Jun 2022 09:08:37 -0700 (PDT)
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
 <CAKwvOdnfRnqBF8exO-Y1ooX=67TrO_8fSzgZwvUtidN_P31hzw@mail.gmail.com> <20220628224255.w4lmzalkx3qejuyg@treble>
In-Reply-To: <20220628224255.w4lmzalkx3qejuyg@treble>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Jun 2022 09:08:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivq+i2-xp3WagixzQMBXaD4etMDmiTp5f-mgsfwOjxtA@mail.gmail.com>
Message-ID: <CAHk-=wivq+i2-xp3WagixzQMBXaD4etMDmiTp5f-mgsfwOjxtA@mail.gmail.com>
Subject: Re: mainline build failure due to 281d0c962752 ("fortify: Add Clang support")
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 3:43 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> So, something like this:

No, clang should just be fixed.

These UBSAN reports should usually be WARN_ON_ONCE.

It's all the same issues we've had before: causing a panic will just
kill the machine, and gets us fewer reports.

Now, UBSAN is something that presumably normal people don't actually
run on real hardware, so it's probably less of a deal than some. But
hey, maybe somebody wants to actually run an UBSAN kernel on a real
load with a full accelerated graphical UI and real drivers: a panic
may end up killing the kernel, and there you sit, with a dead machine
and no idea what went wrong.

So the whole "panic if UBSAN reports something" is COMPLETE GARBAGE.
It actually makes the whole point of running UBSAN go away. You *lose*
coverage.

So please don't make the kernel worse because clang got something like
this wrong.

Just fix clang.

And fix your mindset.

                  Linus
