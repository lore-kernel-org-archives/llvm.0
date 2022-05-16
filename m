Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBB1361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 16:25:27 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2fed823dd32so49206167b3.12
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RFls9zXfp5eTyiIQ+m2636iSt9xdwj1AtOgJeBph0LY=;
        b=YhXgB7NNVPD0yB1cDQg/SXVjUhX8SLXmuhEnMy8wBpqtJx2W1ubPNizgIU8zF85A9O
         4NabimscaxUtttPG7Gr13TcfobOte2BzOayOW/nlwMPCItIILzLtfLGgrw0uPqLvr1vN
         XhCPSDdmLiEtsD6yxSIRy5iwnZW/KIs5ZQCvm+r8msHjrgEmUHxjk2lQ6TIaPDXKbnYz
         sZhpeFcc2mDSmxSZpJ7TQKJHp4vjLedto83hHVkTNkoOpl6hYpxqNRN2G2PQWhl4aJCW
         EgK5oKNTRRk7HwbzJy09mdNldhGb4JoY04hsQgAJjG7sZFNeQ1kpT4ixGA+HzY9SOCsG
         1lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RFls9zXfp5eTyiIQ+m2636iSt9xdwj1AtOgJeBph0LY=;
        b=JwPQ5cMHD4pVfAk7QPcsrg4tGNapJ+a/Hrkh8teRb3JpWKXqdU+HtcZPCzn0qpFwsy
         XchRYFnWhEmiKm8Ls8f+u34laUd5JwBXrUXbAwwMIdFoQWf0L/ODaNz51SUcNsgAnLvB
         bCFqV0ckkdQCOE98DnZK2mAbuU/eSD6WEQdzQfRjw/svRbmPopgTQMPlpgaKqnWqSSFS
         qRR/BYNahkjFHxFfAWBE89RTiXi7D1+hzhOylMlFoNXq0AT5ZjYz175pDSwKx4aoTvky
         /F5m3A5DQwy7d7OPTiRhdgNhLaSgXic6n4Ql3CTH5as4Xj7z3+JOT+6/Z8RCYEhwZJ5m
         ZPIA==
X-Gm-Message-State: AOAM531aJHA3mInsKRhq6QjUEdqnL4gwA6QA2AafSK98VmjLcLEGnimw
	3oet1GVRrIEIjzaybTuS7DwQpgy1uPCcExCQe2LXs67W51k=
X-Google-Smtp-Source: ABdhPJze0FlbTm24mJB4UEHbsfYPEzROSnDu0xvZSbQCYGCBpmmty4Y0jTVl7jr510LqdmFqqvrpYIOVuhdO38wQmIQ=
X-Received: by 2002:a81:4ecf:0:b0:2fe:d9f2:15b3 with SMTP id
 c198-20020a814ecf000000b002fed9f215b3mr10961808ywb.305.1652718326620; Mon, 16
 May 2022 09:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-11-samitolvanen@google.com> <202205141451.AABEE8B@keescook>
In-Reply-To: <202205141451.AABEE8B@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 09:24:50 -0700
Message-ID: <CABCJKufbTGxjYg=vLwDUtxb06yues+yH9wV3J2hVa8uM+u1bvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/21] arm64: Add CFI error handling
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

On Sat, May 14, 2022 at 2:51 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:48PM -0700, Sami Tolvanen wrote:
> > With -fsanitize=kcfi, CFI always traps. Add arm64 support for handling
> > CFI failures. The registers containing the target address and the
> > expected type are encoded in the first ten bits of the ESR as follows:
> >
> >  - 0-4: n, where the register Xn contains the target address
> >  - 5-9: m, where the register Wm contains the type hash
> >
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> It might be nice just to include an example exception Oops in this
> commit log.

Agreed, I'll add an example.

Sami
