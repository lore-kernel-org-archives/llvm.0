Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D457C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 22:35:25 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s25so19439608lji.5
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 14:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hYlTdB/zH2zblgmoJbVMlgCNjIMCACNfbfxIFy7zCbg=;
        b=YffGxEV3fEqsY9GWBppaPKRNBrzynzAbY4wbDhUWFOco26tpAhO0IuRkhq7R7kVeGy
         kCGrfkmtISOexCpSwD56tAqw/AgM/E4KcPGmW07tdJ8L7KV9gUJ5loOsfwzPzx4rL0ff
         cDYHSDoIMX0sKc/h1HNr8rms3/UCLLdxaGBGd9OeWf0ChoSiL3vBeXsk8eFWuBftDU/a
         tP6qLXNC7TQPjB0FwnoMgHIzJtGjjBMHmv+TRyXjAHe2aDuPsMDDre44MqC1PK1dHv8X
         Xsj8hrFOHzN0ZmXDvsA1dh0jx7fSDdb/YL2BnjlgcDV9DxoY/cQJ3kyd2y/5n3Lfne1V
         V0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hYlTdB/zH2zblgmoJbVMlgCNjIMCACNfbfxIFy7zCbg=;
        b=0fSZBaQNBUz+CZRkj0fbQn0xT7SgNRfOlB62El7/xg5iWV2rAilGnjxzBurnnKKkSy
         DgcdALlo/MgRnpL5lkuFahMxT7wyfpoybC0F1bBz0B07+0gcPFdrCNjdHhXpx2EfbzXY
         N4QGucOEEswuI2YywJL7ks53cZq+gksxoANYNjkjNvEgrlRhBLadQM7mSKYRnf/rxtzh
         xJcVdvHIB25wdVHtT8W/waFqRx42OlRbILsopdpm/zQt6ypqwOJMRoRSKJ7ulv4WQEBv
         +Z1Hn9jPFUC4R60NVUcPSv9JroBa6ZjKiQ5xKQJdHTbbb5LpkzkuN1WzhfpepzcFAAAz
         EZIg==
X-Gm-Message-State: AOAM531UmIn0bbuHtTC8n/rrUjh6UKFF6CS4EOGb8hIkqk38wLUhKkzu
	jiCcpHMeQHQ0/lk0GY5h4PAGEzwdQS7lXwzGpLZZKQ==
X-Google-Smtp-Source: ABdhPJwVHTz2zvTK0ayUxuiGwOqs9pIIC/w5dCvcb2CQUe352hz3nLfzoOWf5Dg7DKvOI2mQE9DiR//yb8ERcSUxlS4=
X-Received: by 2002:a2e:bf24:0:b0:246:801e:39d3 with SMTP id
 c36-20020a2ebf24000000b00246801e39d3mr8691548ljr.472.1646087723877; Mon, 28
 Feb 2022 14:35:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225032410.25622-1-ashimida@linux.alibaba.com>
 <CANiq72kXoonDYk095XvBwEtRCRNECd1iQOqJHE2cNcgLyUMfcQ@mail.gmail.com> <26a0a816-bc3e-2ac0-d773-0819d9f225af@linux.alibaba.com>
In-Reply-To: <26a0a816-bc3e-2ac0-d773-0819d9f225af@linux.alibaba.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Feb 2022 14:35:11 -0800
Message-ID: <CAKwvOdkykPtGTL6ud8qJZHSHKV2eSbpnZE-G4oyymD9BiQKHdg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] AARCH64: Add gcc Shadow Call Stack support
To: Dan Li <ashimida@linux.alibaba.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Marco Elver <elver@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 11:37 PM Dan Li <ashimida@linux.alibaba.com> wrote:
>
>
>
> On 2/25/22 12:47, Miguel Ojeda wrote:
> > On Fri, Feb 25, 2022 at 4:24 AM Dan Li <ashimida@linux.alibaba.com> wrote:
> >>
> >> +         - Clang (https://clang.llvm.org/docs/ShadowCallStack.html)
> >> +         - GCC (https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html#Instrumentation-Options)
> >
> > Maybe Clang: and GCC: instead of the parenthesis?
> >
> Got it.
>
> >> +#ifdef CONFIG_SHADOW_CALL_STACK
> >> +#define __noscs __attribute__((__no_sanitize__("shadow-call-stack")))
> >> +#endif
> >
> > Since both compilers have it, and I guess the `#ifdef` condition would
> > work for both, could this be moved into `compiler_types.h` where the
> > empty `__noscs` definition is, and remove the one from
> > `compiler-clang.h`?
> >
> In the clang documentation I see __has_feature(shadow_call_stack) is
> used to check if -fsanitize=shadow-call-stack is enabled, so I think
> maybe it's fine to use "#ifdef CONFIG_SHADOW_CALL_STACK"
> instead of "#if __has_attribute(__no_sanitize_address__)" here, then
> move it to `compiler_types.h`.

Or simply add a #define for __noscs to include/linux/compiler-gcc.h
with appropriate guard and leave the existing #ifndef in
include/linux/compiler_types.h as is.  I'd prefer that when the
compilers differ in terms of feature detection since it's as explicit
as possible.

>
> And from the results of my local clang 12 compilation, this doesn't
> seem to be a problem.
>
> Link: https://clang.llvm.org/docs/ShadowCallStack.html#has-feature-shadow-call-stack



-- 
Thanks,
~Nick Desaulniers
