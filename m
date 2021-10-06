Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF302C8E
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 17:45:53 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id w10so7292254ybt.4
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymHLGH0Raq7ZmGFbhtXmAYW4w7KWD4EjLyVclCp4QNk=;
        b=FDtgJKC2yf2w+mH0oA+D57k3nx54eAv/j4VPf/geQ25vy2h5bs5gGf0Yl1iswCf1br
         twAlku9c9HaQSksJSdqaGILpkNO3VsxHP9T1pKiFZm1xd81utR7KiW1+TbdnVFM9dzpv
         8MoBpvwGcgoktnH8xTxKJKbmy6W3EpmN8/refTKp/q1c/VYBmgAmlELHwB6dYPrGl42f
         EK8d99G65Tdvk9Jmz13SG4Pw3nOYOepqAVXVBjNnwjzcGQfYX7qjEKWCQW1sl81JGpj/
         wPwKz8QCcOlukoAR89S4zRJYHYvhB8UdTQ37d5TO0bIL21axXkguID2Igqxbg/MNVIs/
         eROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymHLGH0Raq7ZmGFbhtXmAYW4w7KWD4EjLyVclCp4QNk=;
        b=PcJL5nNjXUWNFsuNWk1/Aq66P3QgqvrJaieeONkufbH/EIc/6VQvYN6kZ5Av3dzKHt
         0Z/EOyRxzpAcBoGPjmSPbtwPuVwyc30A3UkWqBkyk6UcafgR9lMR3gHnWGzNdjG/dMff
         ULDVE1bTGjql5jN8fJG+lUAWGPy6fZe3RWK51INVe8jcZPMBhS56wEOnaIoxl2YHZlxl
         hsf08TAaipA0/FvTh86U8RdyrbdboKNm6MDzzEm5Ibru9TU/W8tZ7fcVCo1FPswSbAeP
         fAr2vWpB0imPR+lHeLCVGLMytYrQQZVxX4QjNDhRWB8QNapePdLruQ6ag4auTxk3dcib
         44dw==
X-Gm-Message-State: AOAM531YD9W5tfQgYsELZTw7QoAro6Iox+JLBqvqIfDlNVoCsILl5IG8
	qmzncgCbjBPxDB7e/bhl+zt1Rs65uSY5JWkTF6lnJw==
X-Google-Smtp-Source: ABdhPJx/PRDppXa0Kq84b+6Rsz/D47+Ohg3rhbB34IFTWREHPFR3I/tnnF4mNhbpL2vllEq5+bhlJ18BTkRVcOXB5SQ=
X-Received: by 2002:a5b:286:: with SMTP id x6mr30426375ybl.59.1633542352526;
 Wed, 06 Oct 2021 10:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-7-samitolvanen@google.com> <20211006032945.axlqh3vehgar6adr@treble>
 <20211006090249.248c65b0@gandalf.local.home> <CABCJKueL4Ebaan=JBUyO3oewq7RTHHXWUQpixgf2AfC_r5T3uA@mail.gmail.com>
 <20211006125809.5389b2a3@gandalf.local.home>
In-Reply-To: <20211006125809.5389b2a3@gandalf.local.home>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 6 Oct 2021 10:45:41 -0700
Message-ID: <CABCJKudTuheEd5jyhXmfJHup7iYzOz3_OcO92hFnpRK1MapJSg@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-hardening@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 9:58 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 6 Oct 2021 09:31:04 -0700
> Sami Tolvanen <samitolvanen@google.com> wrote:
>
> > > > On Thu, Sep 30, 2021 at 11:05:22AM -0700, Sami Tolvanen wrote:
> > > > > With CONFIG_CFI_CLANG, the compiler changes function references to point
> > > > > to the CFI jump table. As ftrace_call, ftrace_regs_call, and mcount_call
> > > > > are not called from C, use DECLARE_ASM_FUNC_SYMBOL to declare them.
> > >
> > > "not called from C" is a bit confusing.
> >
> > Any thoughts on how to make this less confusing?
>
>  "Not called by C code, but injected by the compiler."
>
> ?

Sure, sounds good to me. I'll update this in v5.

Sami
