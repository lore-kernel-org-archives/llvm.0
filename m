Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19151361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 17:17:01 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id j84so17330774ybc.3
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FXOnPvl8QcJEDWbi0XN3Lq19sfoQAsf+gUr01P/rvlk=;
        b=OM8kgeKWnkTLRBZ7RTDJtDZ0OhbvjKtrtPVbHiJv9VobLZNWVHWGgo4QzJUZykXSZV
         S978AF1P+/+TQwUaWw5r4iAwDc1TIqRPVZfN1U/fYopNiHC0uAC28XABNd1kdXGW/Cn9
         Gzzz9IacrdlQD2sQ8SN0iUKwmUj7CDUv2AQqwHCBdIW+MTQRZO6d1YJo05tPskMcsXRK
         6bHxZTPRNql9kT25XB+YzCb9HV5qM8t/bbn/OP++K53Zdm1sI9eoAErldOq/3+coa2/H
         g7PnWG4un2TUvBbf5ZxcHBq0UFRQF7bpmF3t6OdWsOOkZt3u3dTwaYtW+RnaDr3VwLWH
         RLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FXOnPvl8QcJEDWbi0XN3Lq19sfoQAsf+gUr01P/rvlk=;
        b=FZSn20tuQltR5PkYzhRWOF3x0SG8tAJVt3sBk3y1a+ScZT8pylRjLXyr9cq9fZyCsB
         UwJPGqY6p4nuRhowEcejaZu3sc0EDul3E5yXiva3hbMXGjZi8d3KmoMGpu5M+uWNaA1S
         1p8KTfTYkTFzmBTIG9NmBb5Ye8lcbbFn85gITDrCzvY62qGaLo9oLTLXGxO7Ur0VCkZy
         LNGIdiAJa1nhLZnp2LNprvjRuEm/+WUmuq6DZGs/0aqF3BByxqqwMSQ3daMUPuKu4J0M
         iCQiJFzblJqXZnJKo5RUdwZMn14Kl6eqjCCzhzlCYoWJoTaljw72WMbr3Wz6ZZEIyq2p
         SbKg==
X-Gm-Message-State: AOAM532j35zhrPJF0tKUpUw87O6IJtANv7R/7ur2MjQeR/71JwhXGSVJ
	Kf07NOKnxfq9pagItdfcQYXSON73wleiRnBwn4S6PQ==
X-Google-Smtp-Source: ABdhPJwErdMw9lIEVb8u38lNc4NgNXjt+kXxu9dBYmAQWe/u7yXSrIRYHJOVxdd0pqgjysXHBrZd7vzZ6OxxZCayB/s=
X-Received: by 2002:a25:dc93:0:b0:64d:9c5d:d43 with SMTP id
 y141-20020a25dc93000000b0064d9c5d0d43mr6954243ybe.560.1652721420662; Mon, 16
 May 2022 10:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-22-samitolvanen@google.com> <202205141503.3D87637B85@keescook>
In-Reply-To: <202205141503.3D87637B85@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 10:16:24 -0700
Message-ID: <CABCJKud1j8RCa2khJBcDxpJA-kmhb1XYU8rJLca658oduEMeoA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 21/21] init: Drop __nocfi from __init
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
> On Fri, May 13, 2022 at 01:21:59PM -0700, Sami Tolvanen wrote:
> > It's no longer necessary to disable CFI checking for all __init
> > functions. Drop the __nocfi attribute.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> Maybe move this up after patch 11 (the arm64-wide __nocfi removal)?

Yes, that makes sense. I'll move it.

Sami
