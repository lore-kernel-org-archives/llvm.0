Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335861843
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 22:03:39 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2f83983782fso168814577b3.6
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IjaOHrJPxQNUMk++gKnFcKFfTSw8FlwW+UyobtzjVj0=;
        b=CmIEj5n1Rl0HWNhLuhDFskWScqMt8sTZf+nhjXYfnm9nlgr/YXq9h82Fae9Y2KTq1g
         KryZOd70RTA6tPdFd6uEglWV6hKFFIZmg7ZFv30zU1JzLwvckRRLR0MEMdF00hjHIHDf
         hVEuQ8BqEIRE3mG//CqcrOWdJM1NQz8jL2LfiBTS0Uvbwue/yEjA0leJcwc3aoJbKFUo
         HsYsHIyfIVblYlpHWWLtcT5unFYiki04NZBQO/jfec+mhGllAxhTLo9QATAqOOLauq7u
         ckKDPDyG+lHdQjd1OuL/8h39HKfWcmiAhNYRkNnJwcWE1smI+GnPF/PAEkdRN2Dzzitq
         q0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IjaOHrJPxQNUMk++gKnFcKFfTSw8FlwW+UyobtzjVj0=;
        b=DKr+8nbndIjodho1Os/9duXoZQXUvO1YxMtU7oWhfrTnolATbnmiZuxElFDJjW9gk7
         zIGIfhxOr8wHVyvlADJKhUWRDxbD82T5CnALWy6301lZi8ZB1vuLuiw+0Dcz4MNs/U6V
         Q9e6dB9JC69Yo4xJqq5lTOi4euYBg876P2kxgP8mogizJ/eMBJKWNXOyNuB7rWhn4x9t
         DFCxaS3PB5PCOWdP+azoVMxvgpUmlb/AHjoNQ866iJIRJ4GkSS5wCzDwItDjLWERgXD2
         76RX/o3qpHM10/xtna1OywBHxVSCX3vKGAmnbk6BYjw0coHnB1XMU7aZH5y6qkOzbIO4
         kcIA==
X-Gm-Message-State: AOAM532zj8/DJrpYK92eLb9Hu4SW9+B2kxwEHbBJmgVzV2kFKsWHplD2
	fy7s42dlpIX9BRpD9foSTS6YRkSeDUco8g998jPjRA==
X-Google-Smtp-Source: ABdhPJw3sBkLaeksICo+46rO2UaS3Fk7vsTQRrcZQqDXNASr5C339hIh2SUj2o4+spHZoBL4AtjH3f55xJ+hksTEK84=
X-Received: by 2002:a0d:d747:0:b0:2ff:22b9:9281 with SMTP id
 z68-20020a0dd747000000b002ff22b99281mr1573852ywd.305.1652738618031; Mon, 16
 May 2022 15:03:38 -0700 (PDT)
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
In-Reply-To: <20220516214414.GR76023@worktop.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 15:03:02 -0700
Message-ID: <CABCJKucPMgMQ-D_yByvMSx6yutjsBXGAwirmheOYejWHARi9iQ@mail.gmail.com>
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

On Mon, May 16, 2022 at 2:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, May 16, 2022 at 09:32:55PM +0000, David Laight wrote:
>
> > > The compiler always generates this specific instruction sequence.
> >
> > Yes, but there are several ways to encode 'cmpl imm,-6(reg)'.
>
> Yes, but we don't care. This *always* uses the 32bit immediate form.
> Even if the immediate is small.

Yes, that part is not a problem, but it's a valid point that LLVM
might not always use r8-r15 here, so I will have to check for the REX
prefix before blindly attempting to decode the instruction.

Sami
