Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E11376
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 18:57:53 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f83983782fso164085497b3.6
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X0lDvgtygkUQt/MUd8knhUulQHn3vRN7wQxbpMX/7kc=;
        b=OtkZKug+pHgQ2UZ/72x5bHwTEdoqxCQfEkm1QUCKIEgRffjKW3KbMb3c/K0hbgw8Hh
         4snt1OZnOFAGl+LpQ4hpHFIJxYGrgyUHb3MpltCQAyohc4EBc2K3cVdSQIPXWZTMCpAo
         xvkF6YXXSdLtGnt7ynxNOqwGwVVTZspuksDC6xnRRp98ABNh0U+IV0ZaF0Dke8RLQ2hY
         0zwsUzPrYM4NS77Te/aQXLi3uZ8/Pe1REWifevXQA7rgTj6p6tmReRBxgn3R2O7hm2fZ
         OJ6CVb4R6Yse/fCzJP36XXgjWUGVUJLUzzJC39/+B4Yu2HI44XK9AEZhZ/l6VNqETlCG
         d/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0lDvgtygkUQt/MUd8knhUulQHn3vRN7wQxbpMX/7kc=;
        b=eKGxYCI41gbCKu3VKMdEahAxMnPEyW2YX5S5132NVpZbYXrJkAF08SzmlJ0dCFtUxI
         nOiw57fbruqVg59huTE4A6/iP6pgTfJcYq47vNSy4aAnQZvS8dp286aktvjKSnPSBY24
         paNhP1DgdwB4FXqfKelO47ocviAWv83hIHZdj8WVKFmg7/AaLdSH4BM/bhvk2ZYmrTfu
         LYXGCVaxxfJGdK2q6ukU+DiuGOFFVWdWlL0iz9Ht59UTkpjBhO/wMWZML0yXfJU0IXZ5
         7vwurds+cFIoYH/hBkO53/sqsiYFfkg3sJFXrPSr3GoLmi2hdJI0rTUm5LwsGJyv9gFU
         iBew==
X-Gm-Message-State: AOAM531vo/ySAnpLTu0uEWko+5m3pBWfdFwfrX7L4l237jreBAWA8vdt
	Ry+mAEcc0DHBCpa4nKEE9Jz+sFG+ihrdY4ABJPPDWQ==
X-Google-Smtp-Source: ABdhPJyxnegSHSL4esR4Y8T2LGVa+WGgTYoK2/N/07nmR8fbjF1kDUJlLs7zXniWb3x4daFZGwyj8JCag7XedUMNBVU=
X-Received: by 2002:a81:7953:0:b0:2fe:f8a9:7e45 with SMTP id
 u80-20020a817953000000b002fef8a97e45mr7139331ywc.23.1652727472248; Mon, 16
 May 2022 11:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com> <202205141501.92A22264B4@keescook>
In-Reply-To: <202205141501.92A22264B4@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 11:57:16 -0700
Message-ID: <CABCJKudiLBjsNHUTH6zqhYik0WQZwsM4OceYJadYKoDQYOFRXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, May 14, 2022 at 3:03 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:58PM -0700, Sami Tolvanen wrote:
> > +#ifdef CONFIG_CFI_CLANG
> > +static void decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
> > +                         unsigned long *type)
> > +{
> > +     char buffer[MAX_INSN_SIZE];
> > +     struct insn insn;
> > +     int offset;
> > +
> > +     *target = *type = 0;
>
> Should report_cfi_failure() have some additional hinting for the case
> where target/type are zero? Like, "hey, got an inexplicable CFI failure
> here, but preamble decode failed. Yikes!"

Good point, I'll add an error message here.

Sami
