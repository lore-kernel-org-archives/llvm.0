Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF42C89
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 11:57:39 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id h129so2521917iof.1
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 04:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qP8qUdurFon+vS8eyUqKuAmxlr00Ucs7J31uCZEKlng=;
        b=RHqUFEetTG/eYk7o+keixgzTsx76qze7UUJ06SBYaebyHUQ2d5IplJMpy/dauoI6iB
         dXDfk49UADHMti+mCSw3jTWGQjE/NgyfiGmOE5qL/lL/MPBMO0UjMMvD7P5hwfEGmnTp
         fswdFmXWOJINyEbFlJ8T5NobRk2GBLe1NKBcVcC+ueLeV1X1P5jxzNRiQvzBt/26KEZs
         fgXpPBMzaFop8NrepFeSG5d5inz6n9u76TL2FuJjgOh0lxhzA98scObInb5Bpu/19LBT
         pEsirjNTqtAilTcjDnmEoaZ0eH2ebJd6P7nA1tXnCkBRiyLQcvZYF13hpRZrB5GMogAt
         Fk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qP8qUdurFon+vS8eyUqKuAmxlr00Ucs7J31uCZEKlng=;
        b=Ff217CSfgBlE8RxPLUZSETpohdGkGNuOKzidQLC3KiIE3KSojBf5ORVoLBJdNc2j1U
         Jvb9aYeyNlaVkJIXjrli4f2G+BsAaf3HuI8JcKNXl2BQSkP9xjqFXsVO+C864M7TCZRv
         8p0oMGYXp8TJys8lqY2a8HdWXptVxuY5wsgRB61x+Tf5cXUzHV1i8IQD/Qtb0xFGimMN
         +fmLMluJN5pMGyyAAoKok6IEZY87eBll3Sa/b77yQPbUGvplNFV/ivs9wEJkLB9+Wf00
         hBMJdH8XaAdifO2PkX8sWSVPZvr2HDHWOH3oCcFJNe/Zmw8vnD2TydYJ6PmF0h3OgMXM
         6TwQ==
X-Gm-Message-State: AOAM5336Iq941m2v+HLyUK/JqGeLxBFLr2KDqXAS1IwhxjaUmbp5cHpc
	sPhXCd9G1TqG6pX/YXHm2gdflYPiyKqPQYTKbGs=
X-Google-Smtp-Source: ABdhPJzrUCrbL4qoMWWF4ycdUPgt1QQgBnX/C1pCX8aC6wNFiNRQWvoYqGnSTsMpnJdJpFN7PKPT/9sQv64HdBNoy10=
X-Received: by 2002:a5e:9b18:: with SMTP id j24mr6049480iok.202.1633521459169;
 Wed, 06 Oct 2021 04:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922205525.570068-1-nathan@kernel.org> <CA+fCnZdfMYvQ1o8n41dDzgJUArsUyhnb9Y_azgCVuzj6_KBifA@mail.gmail.com>
 <YV0NPnUbElw7cTRH@archlinux-ax161>
In-Reply-To: <YV0NPnUbElw7cTRH@archlinux-ax161>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 6 Oct 2021 13:57:28 +0200
Message-ID: <CA+fCnZc5=fqM=eEZ3RLqBFaxR72bjxndDdnM_rOkiSBi3+2L6A@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 4:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> > This part of code always looked weird to me.
> >
> > Shouldn't we be able to pull all these options out of the else section?
> >
> > Then, the code structure would make sense: first, try applying
> > KASAN_SHADOW_OFFSET; if failed, use CFLAGS_KASAN_MINIMAL; and then try
> > applying all these options one by one.
>
> Prior to commit 1a69e7ce8391 ("kasan/Makefile: support LLVM style asan
> parameters"), all the flags were run under one cc-option, meaning that
> if $(KASAN_SHADOW_OFFSET) was not set, the whole call would fail.
> However, after that commit, it is possible to do this but I was not sure
> if that was intentional so I went for the minimal fix.

Ack. Filed https://bugzilla.kernel.org/show_bug.cgi?id=214629 for the rest.

Thanks!
