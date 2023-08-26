Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F597E
	for <llvm@lists.linux.dev>; Sat, 26 Aug 2023 03:17:58 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b52875b8d9so83075ad.0
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693019878; x=1693624678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NTpWWoAzCcGiRnwVxW+wyPGfNXm/UmsRStzWL2401ms=;
        b=C1qXi5R9cHfHtuRwGLEdGwD2n+fJHV8CRjbZzTvZVn13EhS410/4/wGyluYDqwUpyt
         BT/vg/xrqYhStWJAk8XaiyH8QMXks3LTJpm6RWbRsWQF58UbEDGEK+1fIdcfbvSYnZV8
         yED3L7oIjBoXnaHSmPMh9I6AyGFnDFlHcMEY1EoBVBUPu5x6yuJ1sHuhUvMWcVVdPdrs
         LVL+miWMjmJHMK15RvKgwzbGPgPYvXLCBdiOiZ+rnD5AUepUScLXjQGnThTZnTlT5MGT
         U2CZz1vYrrrgYBlip/XgCb5Bhh8WJOAUvcGlcYyuSSurao2ZPvKAI/mK4oyOopZV6w/h
         nm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693019878; x=1693624678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTpWWoAzCcGiRnwVxW+wyPGfNXm/UmsRStzWL2401ms=;
        b=YONbnS6AlKta199NN8jPm0eDdkmNG7wpLXtYIiI5dh+JGF7yg+hv6zN3zoStqjdwfW
         qAuz8D3PbsUXUecuMO6g/O44aTawCgQNRJR+CrGUjveV0O0Nv5kXFhDVfVoBS6zTNkCo
         BvbUuqVa/qq6IiB+sMaAGcCNgBB7xXS9C0mx/cu2M7jUh6i3iQZIp2KBlByJp93kVHKg
         PxYPhVXNBfXmi/bDmfMJ+orXM/35GhME0CNGTsZW7TT/5Moo6j4tigbVV+MOFVjxYoid
         B0V2PonbbKBLH750UKfNw8j0MPhiIJkImLwSn4q5iFiPWg1rxev1KPqYwHLMk7MilEvj
         j/Rg==
X-Gm-Message-State: AOJu0YyQBHwF6xjzEvvHzaUSZ2QcgBq14roAthUkrKh3KONUiGyHyREM
	NWFeuKE8OBnq1xHf3Mo7ejkF+A==
X-Google-Smtp-Source: AGHT+IFgTjL85NMW7QVTfT1LIEunufc8m3DLUqvJfm8kEADFDEa+5LGQPIut13OdOpGUuedULTjPsw==
X-Received: by 2002:a17:902:c703:b0:1bd:b75a:e95f with SMTP id p3-20020a170902c70300b001bdb75ae95fmr128179plp.0.1693019877605;
        Fri, 25 Aug 2023 20:17:57 -0700 (PDT)
Received: from google.com ([2620:15c:2d3:205:6671:452e:1913:d899])
        by smtp.gmail.com with ESMTPSA id a14-20020a62bd0e000000b006870ff20254sm2251739pff.125.2023.08.25.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 20:17:57 -0700 (PDT)
Date: Fri, 25 Aug 2023 20:17:52 -0700
From: Fangrui Song <maskray@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Helge Deller <deller@gmx.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chanho Min <chanho.min@lge.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit
 kernels
Message-ID: <20230826031752.gongmxkr56zyycol@google.com>
References: <ZOkGCSNr0VN2VIJJ@p100>
 <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
 <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
 <CAKwvOdnYauyrzz7-ceH-MP_KZ5ED8oYxjRx_Xei68=tUOSeKyA@mail.gmail.com>
 <CAGG=3QWcZPYqHMcjwuYDz1+OQhzS40hmhdOvSBZBQOkhs8YAQQ@mail.gmail.com>
 <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com>
 <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
 <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
 <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>

On 2023-08-25, Linus Torvalds wrote:
>On Fri, 25 Aug 2023 at 17:52, Nick Desaulniers <ndesaulniers@google.com> wrote:
>>
>> So 2 concerns where "I'll do it in inline asm" can pessimize codegen:
>> 1. You alluded to this, but what happens when one of these functions
>> is called with a constant?
>
>This is why our headers have a lot of __builtin_constant_p()'s in them..
>
>In this particular case, see the x86 asm/bitops.h code:
>
>    #define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) :
>variable_ffs(x))

For the curious (like me),

__builtin_ffs
https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005fffs says

     Returns the number of leading 0-bits in x, starting at the most significant bit position. If x is 0, the result is undefined.

The hangling of 0 seems the cause that __builtin_ffs codegen is not as
well as inline asm.  Clang implemented the builtin in 2008 and took the
same constraint (penalty).



GCC compiles __builtin_ctzl(x) to xorl    %eax, %eax; tzcntq  %rdi, %rax
on most Intel processors (AMD -march= values are unaffected). The extra
xor is due to a false dependency issue
https://gcc.gnu.org/git/?p=gcc.git&a=commit;h=73543b2286027da1de561902440b53f775a03a86

Inline asm wins here as well since we know the argument 0 is undefined.

In May 2023, https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc6eb8b51f9568ae0caf46b80e2a0aff050030ce
"Disable avoid_false_dep_for_bmi for atom and icelake(and later) core processors."
removed the extra xor for icelake (and later) core processors.

>but this is actually quite a common pattern, and it's often not about
>something like __builtin_ffs() at all.
>
>See all the other __builtin_constant_p()'s that we have in that same
>file because we basically just use different code sequences for
>constants.
>
>And that file isn't even unusual. We use it quite a lot when we care
>about code generation for some particular case.
>
>> 2. by providing the definition of a symbol typically provided by libc
>> (and then not building with -ffreestanding) pessimizes libcall
>> optimization.
>
>.. and this is partly why we often avoid libgcc things, and do certain
>things by hand.
>
>The classic rule is "Don't do 64-bit divisions using the C '/' operator".
>
>So in the kernel you have to use do_div() and friends, because the
>library versions are often disgusting and might not know that 64/32 is
>much much cheaper and is what you want.
>
>And quite often we simply use other names - but then we also do *not*
>build with -freestanding, because -freestanding has at least
>traditionally meant that the compiler won't optimize the simple and
>obvious cases (typically things like "memcpy with a constant size").
>
>So we mix and match and pick the best option.
>
>The kernel really doesn't care about architecture portability, because
>honestly, something like "ffs()" is entirely *trivial* to get right,
>compared to the real differences between architectures (eg VM and IO
>differences etc).
>
>             Linus
>
