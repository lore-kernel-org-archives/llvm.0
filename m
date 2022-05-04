Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95E2596
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 16:42:21 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso21859037b3.5
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E92Kc9QSviCU9YuL/lueHEE6ZF2RofRyLsLK9SHZEnk=;
        b=R8J/TT07oYrufV49kAQ3YHUSBYTRi7VEcKUu2DfAyEmJj8PSITMqzsIwsc42rLW0Z0
         8nbWQlU/3RQsgiPhNrJHyn+j7/r1tHvcdC6pOIDDLMIUbbuQvWvEJ4v0ZwdnCpqcnsPy
         IHt0rZWHVl/W+W61m/2q9L4SKno8dnBt1LDMp/DSlvHFouKxP9qED+QMAElGsdC7DfnT
         EI2ogF/23MepFXVgjP+dbKj0WscxN2MPaSE6Hq2SP2VvUE7CEX0KNydbZL0JAY1rsn0A
         qaimhFH3XvY8D6dEErQUro/i8/3eN0G150VIlkGrGf3Zt+8rLud9fme683BmVndhj7Rf
         TTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E92Kc9QSviCU9YuL/lueHEE6ZF2RofRyLsLK9SHZEnk=;
        b=AqjfSe8e/6ctzmFoE9G5Gp0SBvF/VE16PeYb152vGQL2QyrIAHM8UnEWY5hfI9QdaZ
         3uGNULpDw6/dqOftoQp7Im7gWI3hj90SCYK61mv+Nh+5gkfKm0Zz19GE8v+5r1Ax1VwD
         V9gqPgHL12UnSsLAoaTBjcyQ8XgnWI9IhUA6k1kG0FTR2zK8MfrhRszJ9GdprC3z+XlY
         gRc/WDiWfQQQ+6q+g0gofY0crKeAn8pRVxLOoL85pSryuQwefe4k+Oda4KpHK4WhaSIJ
         HJzY8q7AoyTycKyyI30zdASTh2i8Fgfi14OOKrI3ykT5/OrNAeMifFp1WFhIdlREcrNw
         z24w==
X-Gm-Message-State: AOAM5326MPSYhsvxNDRcGkY2Y3HR5DVwq6EqzhRFskRbEq+9fB6JNVAQ
	REccdwKLqbCs/pFcHd7mR6L5NFKpz4f7R+tAtV4sbQ==
X-Google-Smtp-Source: ABdhPJwB5M3V9c+Qv29Mq6hOLNSkS/Cx5S+8NXTtckXjYvD9wrbuciGbXqgPOAtbV19GJMbODjTK/MWJYRMmEhMP+pU=
X-Received: by 2002:a81:1e14:0:b0:2f8:c348:9c62 with SMTP id
 e20-20020a811e14000000b002f8c3489c62mr20003528ywe.291.1651682539258; Wed, 04
 May 2022 09:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com> <YnKnLyyXPJl5Llc0@FVFF77S0Q05N>
In-Reply-To: <YnKnLyyXPJl5Llc0@FVFF77S0Q05N>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 4 May 2022 09:41:43 -0700
Message-ID: <CABCJKudT9r=r0an4BwNp0-E1wC94wLWiHvUX4_vA8tDkQ=uHKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] KCFI support
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Wed, May 4, 2022 at 9:18 AM Mark Rutland <mark.rutland@arm.com> wrote:
> I wanted to give this a spin on arm64, but I'm seeing some very odd toolchain
> behaviour. I'm not sure if I've done something wrong, or if I'm just hitting an
> edge-case, but it looks like using -fsanitize=kcfi causes the toolchain to hit
> out-of-memory errors and other issues which look like they could be memory
> corruption.

Thanks for the detailed bug report! It definitely looks like something
is wrong with the recent switch from std::string to Twine in the Clang
code. I didn't see this issue when compiling the arm64 kernel, but
I'll take a closer look and see if I can reproduce it.

Sami
