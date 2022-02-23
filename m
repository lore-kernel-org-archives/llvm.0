Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8DFA56
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 11:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C7BC340FA
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645616951;
	bh=+ioWVHNgMYeDeBDsUP7f/drz0hwa8yRvXmdVGF3eiFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=amipTyugIxJO3OK3SYdgOFAUabSp6w39r0/eyVWT+fJDXgPBbmQOnORSBUTQR+O0Z
	 bjZnZzvujx/rFKnqDifCEtVemDXzMXqCYKkWzWDOVRjTqXoFletbgV1Av+aN7SdIdv
	 ls/RPtf/RUjv5uqSdUbrTvKFxt/BGjABV70qd1mf2zDB9oVwFHEZKP3LdgQ0rK66jn
	 Cy0KwhZpUuoUvvLku+ZvlMUo7MuzAAzpc323fDtqdartLYEiI2YbFLE5m6bEWe0vQ0
	 KvVXhHWvrqeFmU0UBHkCw5wWBJrMROVNWfDNRBUdmFK0gB7WfGkZosotO2JFzH6qFq
	 NqlkwHQKA7Yuw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2d68d519a33so206232487b3.7
        for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 03:49:11 -0800 (PST)
X-Gm-Message-State: AOAM5314YTe656hrE/evsBefgJkgScBAKgf5/En+xDQJ0NTM1pda9lU6
	6GvbDSi96QnWO9NC01K1V20ILjBBxLOFF/H1oMs=
X-Google-Smtp-Source: ABdhPJwQIornAPE/LrSfmaLY9p5F4ZAJgJS6+jzrvvmVxK04wF1Vvvs+R7teI3vNg74R7BJvxG5X95O2qSVBFpjInRc=
X-Received: by 2002:a81:4a45:0:b0:2d6:b212:6a76 with SMTP id
 x66-20020a814a45000000b002d6b2126a76mr26808813ywa.60.1645616950272; Wed, 23
 Feb 2022 03:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220222095736.24898-1-ashimida@linux.alibaba.com> <YhUvp5RHkTlBXX3o@lakrids>
In-Reply-To: <YhUvp5RHkTlBXX3o@lakrids>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 23 Feb 2022 12:48:58 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHXz_CFL1A53J+h6EgRCKcrRfd_pMAy9Z+PztfzZYAawg@mail.gmail.com>
Message-ID: <CAMj1kXHXz_CFL1A53J+h6EgRCKcrRfd_pMAy9Z+PztfzZYAawg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] AARCH64: Add gcc Shadow Call Stack support
To: Mark Rutland <mark.rutland@arm.com>
Cc: Dan Li <ashimida@linux.alibaba.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, luc.vanoostenryck@gmail.com, 
	Marco Elver <elver@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Feb 2022 at 19:48, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi,
>
> On Tue, Feb 22, 2022 at 01:57:36AM -0800, Dan Li wrote:
> > Shadow call stack is available in GCC > 11.2.0, this patch makes
> > the corresponding kernel configuration available when compiling
> > the kernel with gcc.
>
> Neat!
>
> My local GCC devs told me that means GCC 12.x.x rather than 11.2.x or
> 11.3.x, so as others have said it'd be clearer to say `GCC >= 12.0.0`.
>
> I'd like to try this with a GCC binary before I provide an Ack or R-b;
> but in the mean time I have a few comments below.
>
> > Note that the implementation in GCC is slightly different from Clang.
> > With SCS enabled, functions will only pop x30 once in the epilogue,
> > like:
> >
> >    str     x30, [x18], #8
> >    stp     x29, x30, [sp, #-16]!
> >    ......
> > -  ldp     x29, x30, [sp], #16          //clang
> > +  ldr     x29, [sp], #16       //GCC
> >    ldr     x30, [x18, #-8]!
>
> Given the prologue still pushes both x29 and x30 (which we critically
> depend upon) that sounds OK to me.
>

Indeed.

What did come up in the discussion on the GCC side was runtime
patching (to avoid the overhead of having both PAC and SCS), but it
seems far more likely that we would patch PACIASP/AUTIASP instructions
into SCS pushes/pops rather than the other way around, and so loading
x30 only once should be fine.
