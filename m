Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A408D3FDF
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 20:08:59 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id w10so418614ybt.4
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKG27X/tAaz6ZgSm5PLct1wo5H6VtWzGqhVRfSbCJeM=;
        b=K/EZX9fC9ZUuzFI6jrZypY1zTFUDt/PU70tLbqJHmQR1qUSX74ZaJgv2NcYZgAKyxp
         IGav/zFpLLCH001ejV1vMObkwX0wGHb+UKwQ6kSvjtnd8WWRAXyBC1NiC7MxyV9iJvcy
         rsCUB4L+pz5p17cwq7H2NsYsiU2vmQlHJ0Tcrq5gjSQbM8w8xZKBMin7C5Qzc1rpXYdz
         HKHH+DsRMvAYh8BOZSJFRxikufOUyCDSOOapRM7+NoJRPhev7XGLUTfGVqW8HkZcf0k2
         gZEuAouaG/VT/oHp5nPOEqDTxWb+ThYNaiR0o6i8VOaeFBhsVrUATAE4tcbhHOnazbOp
         7W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKG27X/tAaz6ZgSm5PLct1wo5H6VtWzGqhVRfSbCJeM=;
        b=RX+fMl+JtSh2uSx41ybEjYmsyQgh5B6wa8n9X50UBO51U3GkKni2enG0T28lL88LbI
         0oXxOBzVnE7rwue7iRM9fN/LfEOMdvanNeOkk16zZVOeVOHulJ/mdE5JwNnUpv4tHoAl
         hZW/ky6Jo9UPi1lAn63gHR3o0hMdZtA1ec60gJT4aPW8Yp5J/RY2wlyamKqOV0SKl2k4
         akMN92+L147x1kjrENOV+o736IuRT6YxtUxWQeGFuLXeEmG+qq69vSxyZCU9YWdvC99h
         NuJVE4nlHwzlsWPQZbojGLf54DJP9jfsFhAIUFihhdObDMB1rPkEVpo5nPOcdTeIYXmn
         aclQ==
X-Gm-Message-State: AOAM533Q5HplSwkqZqVagqQqYUNNgxX1F3ZK+9AbQZ5HrkTli4hk5ysW
	MTLMc0g72sorMzfaX8gAHlh5oPM9FV7p1uxWachqFw==
X-Google-Smtp-Source: ABdhPJwOtf4LpoL1TJ/IJSfZorBhBurQK2kH41u3Fyo5ujc2AgTfHjWisxqRuQ+5FkxK3/PBitfSFea2DlJ3i0S6fX4=
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr8208144ybh.527.1633118938474;
 Fri, 01 Oct 2021 13:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-6-samitolvanen@google.com> <CAKwvOdnJ6EPPd5UbhZhdggPRzCXmdrnxg_tO=Bq_+Gcgarvw1g@mail.gmail.com>
In-Reply-To: <CAKwvOdnJ6EPPd5UbhZhdggPRzCXmdrnxg_tO=Bq_+Gcgarvw1g@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 1 Oct 2021 13:08:47 -0700
Message-ID: <CABCJKue1dDYe9aL0ExU8NMORxJN-7qhF=D+=sSKr0d2Quhb3YA@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] tracepoint: Exclude tp_stub_func from CFI checking
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 11:51 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Sep 30, 2021 at 11:05 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > If allocate_probes fails, func_remove replaces the old function
> > with a pointer to tp_stub_func, which is called using a mismatching
> > function pointer that will always trip indirect call checks with
> > CONFIG_CFI_CLANG. Use DEFINE_CFI_IMMEDATE_RETURN_STUB to define
> > tp_stub_func to allow it to pass CFI checking.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  kernel/tracepoint.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/kernel/tracepoint.c b/kernel/tracepoint.c
> > index 64ea283f2f86..58acc7d86c3f 100644
> > --- a/kernel/tracepoint.c
> > +++ b/kernel/tracepoint.c
>
> looking at 4+5/15 together, I wonder if this TU should explicitly
> include linux/cfi.h?

Good point. Currently cfi.h is included in module.h, but including it
explicitly makes this less likely to break in future. I'll add an
explicit include in v5. Thanks for taking a look!

Sami
