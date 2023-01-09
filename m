Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE3123A3
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 23:16:48 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id dw9so8991233pjb.5
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 15:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdxb8zOWzmCtZYGAnOxoisnrJmGWQMSvlh0UjB+YR7k=;
        b=UxAF7v3TwIoeGe5lQ6e+O3vtZeX5QbNQAGD5TBMn+S38e90Q1b0GycbUkS0bysawO1
         j70JyJFwOR0rIR/oqb1klqdObw5jR+JiUHccm/jMuRMZNMXFVkIhH2KId5yVjOnW9i54
         I9aMGRLe1s95Qf43s9P8xQdcdpNjzcd1YSw6aN7BHmfG7pwXHab5daDUsCHTLHmw2k8A
         rqVKKyyL/GfVB004FzuAjHJheV3X9+vuerYl1qqld80K+i1xSAdh0GDWZhMS/Ami48Ev
         yhM5TKZkw8n/ppMdjMn+Tsu7H8sVATtk3erU11epZGM8n1psz6e4etZQh8sfMzxUQiTp
         RLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdxb8zOWzmCtZYGAnOxoisnrJmGWQMSvlh0UjB+YR7k=;
        b=ydHmmlsQEKZz4x1pT0Okvvsnfdh0vAikXkNn5lSdKR5YV06wkHSVJ4QR/ml/ngK8Gw
         qqIjSzsF/u7IopCkAnfxIbGYXQtVSOhQpJ4Y3stLUOpy/ExnH8gEemiohKk93Jg/atAZ
         HmQKQotVPCxEoxaFyJWeHeg5D3NfluVhQrVdZnxT1bGsPTRS1scHPskkqY9y7TR1zU+R
         ULPLwVEVKcg377CIbbZFEQlLpnj06X5oR0xYDVbpz1PgTRGZ79zXR9lpvX6q0CV83TLa
         qOlrjERsf1kPAkvDAvyZdg1pjf0IMHt9QyZFwRrZob2vDoJxCNpPQYlCsvNjxblT6uFy
         eH3g==
X-Gm-Message-State: AFqh2koN9emncjkKBvM7dKkXZH0ch7qjwZrcDoqMnDozZGQjzV9eB3d9
	u1U1ab8h/j/nHweAs76Y3siuyo3ZJ6K0hFl7yoRfjg==
X-Google-Smtp-Source: AMrXdXsMjJnCJ928/8DVkJxwsFwFKDvwGlcuRFMQ6S7gEnPCv4j6W4/x9swqsAsBcDJgaZJDiwcXJafslWxfIW7YrMw=
X-Received: by 2002:a17:902:c950:b0:189:9b43:a082 with SMTP id
 i16-20020a170902c95000b001899b43a082mr4261789pla.95.1673306207372; Mon, 09
 Jan 2023 15:16:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
 <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com> <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
In-Reply-To: <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 15:16:36 -0800
Message-ID: <CAKwvOd=N9kmg2bZ5iD_-qmkYz9DsNw+pE5BP1kS3oLksEpcSkQ@mail.gmail.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 2:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Jan 09, 2023 at 02:12:55PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns:
> > >
> > >   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
> > >
> > > This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> > > Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> > > been done for other flags previously.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Hmm...so this was added by the top level Makefile doing a cc-option
> > test.  How did the test pass if this was unsupported? That worries me
> > that perhaps other cc-option tests are passing erroneously for certain
> > ppc -m32/-m64 configs?
>
> Sure, that is a reasonable concern. I should have expanded upon this a
> little bit more in the commit message. Is this any better?
>
>   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
>   warns:
>
>     clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>
>   This warning happens because vgettimeofday-32.c gets its base CFLAGS
>   from the main kernel, which may contain flags that are only supported
>   on a 64-bit target but not a 32-bit one, which is the case here.
>   -fstack-clash-protection and its negation are only suppported by the
>   64-bit powerpc target but that flag is included in an invocation for a
>   32-bit powerpc target, so clang points out that while the flag is one
>   that it recognizes, it is not actually used by this compiler job.
>
>   To eliminate the warning, remove -fno-stack-clash-protection from
>   vgettimeofday-32.c's CFLAGS when using clang, as has been done for
>   other flags previously.

Ah, ok that makes more sense. Sorry for my confusion, but if you
wouldn't mind adding the additional info in v3 it might help others
(or just me!)

You may add my RB to such a v3 w/ updated commit message.
-- 
Thanks,
~Nick Desaulniers
