Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88F2C80
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:24:47 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id h2so16676265ybi.13
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8dJU1kv1VM7X95hRm6lPC2IwDByNnl9bwU9uhM4nxw=;
        b=sZeIpuAMkhj5amBTGEsg6yiFKwfHzX2qppNlcQ9aPn27Ja4WTtulCFvjLGY2k5ZmIJ
         Fis/PERMABHDuARXWAR6Rtx9BL3si3vyCuvLg20KAdiGAb6tqQwdhcQjY//wAvykncfD
         inWXc24R7k3dn1wclcPtHcqhnPgDDQeerS9qDfa4UcyesEws3M9nb74cNB93h1zzQ5Fa
         0zI5C0tC6ePRnzfiEsZeSnzRwskFJQ/frHUwD1qbXtHprAzSNmH640M/cZgFRmn4hDOu
         OzBv130y67SZ6z6LqOO5keAv1qo7O/hDcPofW1QYi0r6JaUj6ufL+x8vs6wg3qDfbDBE
         NpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8dJU1kv1VM7X95hRm6lPC2IwDByNnl9bwU9uhM4nxw=;
        b=6qgiXgE/l56d/OMtppiWrhQeULMfoSRVa9q+pQrIFLKZ7W0CVgIu66JbT674bW43Sk
         qmBN6DX5soPC/KhLBFW5uX/clIW9kAGIk9wmd6Cg0O91/rLrGsnmvo2/Q1bMui/6nag6
         wKFrxk74YRq6qb8l4jqUsnGeEaDCo0lDRppi1rEDdXhnRB+6+lGitwlRCIp4Qvc4UQ18
         6Pxg3Gz7/nAjrwzvY8zHQvTts0D/cIjNa0k10G5w5eyXik7b511mMes+nxfUwNGejZq+
         OyX18OREMAARSKdez25cjcpo3/gBmhY1ivvAPzVxEVoTtkHA9Oxw5+UrJXW4P2X0FQhn
         R2dg==
X-Gm-Message-State: AOAM531SklQAj+cq72YtHgbKTTOLOz5quaEVSMN0KydYN2b/rzknPQUd
	ewdNTT70M9CgyToZOFnzktGsIbrDR/L5fC/pz4IOww==
X-Google-Smtp-Source: ABdhPJzYx7PYwLC/K9tQ3WLlgnCTWsSWzh8u4LsqbgMqD5Nla5Hq42lQeU4xMSATsMK78KmS/8oBwDCwrKHse325wDY=
X-Received: by 2002:a25:5b8b:: with SMTP id p133mr7892860ybb.273.1634235886735;
 Thu, 14 Oct 2021 11:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-10-samitolvanen@google.com> <YWgSwmzPFrRbMC1P@zn.tnic>
 <202110140904.41B5183E@keescook> <YWhpbu/Y6V2p/zlY@zn.tnic>
In-Reply-To: <YWhpbu/Y6V2p/zlY@zn.tnic>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 14 Oct 2021 11:24:35 -0700
Message-ID: <CABCJKueW+=DfzONAZb-XF=mWYH_S-BeNihZfGhidOGJO=WYmZw@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] x86: Use an opaque type for functions not
 callable from C
To: Borislav Petkov <bp@alien8.de>
Cc: Kees Cook <keescook@chromium.org>, X86 ML <x86@kernel.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:31 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Oct 14, 2021 at 09:07:57AM -0700, Kees Cook wrote:
> > I don't think it's a super common thing to add, so in this case, yes,
> > I think doing it on a case-by-case basis will be fine.
>
> You don't have a choice - if there's no automation which verifies
> whether all the CFI annotation needed is there, people won't know what
> to wrap in what macro.
>
> > I'd _much_ prefer keeping the macro, as it explains what's going on,
> > which doesn't require a comment at every "extern const u8 foo[]" usage.
>
> You don't have to - it is just an extern.
>
> > It serves as an annotation, etc.
>
> Oh, that I figured.
>
> > And, there's been a lot of discussion on the best way to do this, what
> > to name it, etc.
>
> Looking at the changelog, DECLARE_ASM_FUNC_SYMBOL, makes a lot more
> sense to me even if it doesn't specify the aspect that it is not called
> by C but who cares - it is generic enough.
>
> > This looks to be the best option currently.
>
> Maybe because wrapping some random symbols in a obfuscating macro to
> make the next tool happy, is simply the wrong thing to do. I know, I
> know, clang CFI needs it because of magical reason X but that doesn't
> make it any better. Someday soon we'll have to write a tutorial for
> people submitting kernel patches explaining what annotation to add where
> and why.
>
> Why can't clang be taught to ignore those symbols:
>
> clang -fsanitize=cfi -fsanitize-cfi-ignore-symbols=<list>
>
> ?
>
> Hmm, looking at https://clang.llvm.org/docs/ControlFlowIntegrity.html
>
> there *is* an ignore list:
>
> "Ignorelist
>
> A Sanitizer special case list can be used to relax CFI checks for
> certain source files, functions and types using the src, fun and type
> entity types. Specific CFI modes can be be specified using [section]
> headers.
>
> ...
>
> # Ignore all functions with names containing MyFooBar.
> fun:*MyFooBar*
> ..."
>
>
> So why aren't we doing that instead of those macros?

The ignorelist can be used to disable CFI checking in the listed
functions, but the compiler still checks indirect calls made to these
functions from elsewhere, and therefore, using an opaque type is still
necessary to ensure the symbol address isn't replaced with a jump
table address.

Anyway, I thought using a macro would make the code easier to
understand. I'm happy to rename it to something that makes more sense,
but also fine with switching to a simple extern u8[] if that's
preferable.

Sami
