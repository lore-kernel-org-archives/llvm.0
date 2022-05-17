Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2E10F8
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 20:36:51 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f863469afbso4096067b3.0
        for <llvm@lists.linux.dev>; Tue, 17 May 2022 13:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ap6I3L4wAL2dCUYbfv592hI1CK5Q2LIvM0tZSX0GvuE=;
        b=ExlnNy27IdZuSeHWhoB+wChwCWqkCyYWFwRPPA2XWICoMp/0iSB+0UgbJlEzhwDYzV
         SMT40ZwqMBmRgOSYUTA2q+yp6FZR1llqfeaNClhztQ9J+UBKHhKcZ2VewvTL8xnNu+JB
         ZrEYCvyLXT4xEDs7VMFQHjLsulNCsHVAoMHChcme8bpk9vRy39GW3YuyIA69rH1CIUmd
         G8aheQL7oWM8YW6ttEAPmxVbCCeUNok07yUqRS4PzpeCGqjbuBIiBYxqAI7HDDKOLmO4
         XQl4kz19ESmGzRU2DTUhAwuZHs3mA88L2vWmBR5UdbPXrpeFe1MOLsz9GklUpir/x34f
         zVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ap6I3L4wAL2dCUYbfv592hI1CK5Q2LIvM0tZSX0GvuE=;
        b=VbvP4mdN1PHHmPrU6T2zvuYdJto/0LRDKV+h+B3XxuaOKUe8QriEMArWMrdnw/8h9R
         me8mgmWbyL61a5/fY+eukqwnZghQUyz89rilZ1BtVv0x63pgSW8L5nbZBFF/zisrcT/0
         DQzjjOmkCpMtbrTj6qNWCkDoec5B/W1iyhuOQhGftWnbNUCEVdAw56G+ToZNMZzU09oe
         UZ16YmEomniToUI5oTJHXvCoq6z8quz45O9xkxJBhce9s3/egAhJuDzi0lwq2hnIe6ST
         x5rvuSBA5GMaHmC8cLke7BNqJwp2C4GMXnl7GQgLghEKS+f4akDNuouTr+ZVhlag8Dms
         OS7A==
X-Gm-Message-State: AOAM532hyA+9In7Ckwm3o18/B9T0NxTEihB70MiiZKcUJVYC5lL+hwMj
	7X8sbLzMPUy6zfaoBHhnKeEeE4DarJMAtCFwIyVyPQ==
X-Google-Smtp-Source: ABdhPJz6+ql5NLCT+TCJzkPXm3RGXLdJGWYcAV8GnmANmUz8/mfTMhwDLOzesEEUiMBMguVZLZHXbKZDvfTwj/yIcJU=
X-Received: by 2002:a0d:d747:0:b0:2ff:22b9:9281 with SMTP id
 z68-20020a0dd747000000b002ff22b99281mr7123980ywd.305.1652819810645; Tue, 17
 May 2022 13:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com> <f65c01979b884174965802a13cf6b077@AcuMS.aculab.com>
 <CABCJKueo+cw1DHH6N2dUjD-U7OKqmkJUyimm0ychv1drt5U9Rg@mail.gmail.com>
 <19b3e040302d4d8aa240eee43427dfaa@AcuMS.aculab.com> <20220516214414.GR76023@worktop.programming.kicks-ass.net>
 <CABCJKucPMgMQ-D_yByvMSx6yutjsBXGAwirmheOYejWHARi9iQ@mail.gmail.com> <YoNENqdLBK6tLmpa@hirez.programming.kicks-ass.net>
In-Reply-To: <YoNENqdLBK6tLmpa@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 17 May 2022 13:36:14 -0700
Message-ID: <CABCJKuePNjvcKqZ3ZRmv9ws_2-L2B+a1y_rSXS_cjprf=grLrw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Laight <David.Laight@aculab.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, "x86@kernel.org" <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 11:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, May 16, 2022 at 03:03:02PM -0700, Sami Tolvanen wrote:
> > On Mon, May 16, 2022 at 2:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, May 16, 2022 at 09:32:55PM +0000, David Laight wrote:
> > >
> > > > > The compiler always generates this specific instruction sequence.
> > > >
> > > > Yes, but there are several ways to encode 'cmpl imm,-6(reg)'.
> > >
> > > Yes, but we don't care. This *always* uses the 32bit immediate form.
> > > Even if the immediate is small.
> >
> > Yes, that part is not a problem, but it's a valid point that LLVM
> > might not always use r8-r15 here, so I will have to check for the REX
> > prefix before blindly attempting to decode the instruction.
>
> LLVM has always used r11 for indirect calls, will that change?

No, this won't change register allocation, but I will have to ensure
that the compiler won't do any unnecessary register shuffling for the
check itself.

Sami
