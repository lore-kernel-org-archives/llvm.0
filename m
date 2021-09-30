Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25A168
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 08:13:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b15so21702150lfe.7
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rngmrucDKKX7vdIHXqMF2aFdczPuqoVJOJOEzSi6QbY=;
        b=iNpcZg4FJSl/E0D91jTLYN066/g4fht1tZDk+kVvvvC7m46uhYrADY0r2LKAGRpsvC
         eMq9NuvIAdmLDYXSKlH8gq0n7rin832Urmt2vVm4t69SGxz4h7WuoI7te1dYuO7XqSIL
         XIpEflqiahGNwxX+hyvImbJ2T6Wrr2CE9nk5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rngmrucDKKX7vdIHXqMF2aFdczPuqoVJOJOEzSi6QbY=;
        b=O+L8h2+d12gcTBH+ejYlysFOzLSveaDyGoI5Bvt7VS1MtoY228zZ+a1D+9SkvLWA8/
         qSgmloMXkveR8uJyFDvvEESRB+Bp3QvEaT1nMstjhnZrEB9ASheh6FreuWf/yq4SGwvV
         CjYweOa/tgWRCT9kiYfv0AkYPsREIjqLPjE+ywFR6/A9P0MgcbjfEWKj8EiHUbZezPoy
         YCUbDwjrod+d+pZsgaLx3g0FPlk5WS95eLFhOvUgvHKCnTMOTuSoLsOEehp9ItFox7V7
         yUSWHVqB94FBHxKJijqmI8y+0Y0GhE5j+JlyzAlIK9ceo+sWy+zrDhdBMdcpWm0/ydJv
         PMww==
X-Gm-Message-State: AOAM532YAT4LwxyV+nKw9lR1Mx7U+lcFiZtrzpmAV8fDFd1br6ioyjt0
	i9F5zk2GG/+ZnawcftbplKnR06BjdhingtOd
X-Google-Smtp-Source: ABdhPJwVZAMv47uohlDP+rsIJRUSKybyRwjMsKkN5RqtA6lISri5H7k6tbqtVyiHSqpzDdtegqaX8w==
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr4699363ljl.266.1632989624326;
        Thu, 30 Sep 2021 01:13:44 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id s2sm259046lji.1.2021.09.30.01.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 01:13:43 -0700 (PDT)
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To: Nick Desaulniers <ndesaulniers@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
 <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <77204240-ef3a-d72c-dfe1-d8a47de5329b@rasmusvillemoes.dk>
Date: Thu, 30 Sep 2021 10:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/09/2021 02.18, Nick Desaulniers wrote:
> On Wed, Sep 29, 2021 at 4:28 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>

> Though for the defconfig case...somehow the cost is more than with the
> sanitizers...
> 
> arch/x86/mm/amdtopology.c:157:7: remark: '__nodes_weight' not inlined
> into 'amd_numa_init' because too costly to inline (cost=930,
> threshold=45) [-Rpass-missed=inline]
>         if (!nodes_weight(numa_nodes_parsed))
>              ^
> 
> Looking at the output of `make LLVM=1 -j72
> arch/x86/mm/amdtopology.ll`, @__nodes_weight is just some inline asm
> (.altinstructions). I wonder if I need to teach the cost model about
> `asm inline`...

Remind me, does clang understand 'asm inline("foo")'? Regardless, it
seems that the

  asm (ALTERNATIVE("call __sw_hweight32", ...
  asm (ALTERNATIVE("call __sw_hweight64", ...

in arch/x86/include/asm/arch_hweight.h could/should be made asm_inline
at least for gcc's sake.

Somewhat related: I really think we should remove __cold from the
definition of __init: It hurts boot time (on a simple board with quite
reproducible boot timing I measured 1-3% some time ago), and it is
likely at least partially responsible for the never-ending tsunami of
functions-that-obviously-should-have-been-inlined(TM) but were not
because the caller is being optimized for size. Whatever small cost in
extra .text is reclaimed after init - and those who are concerned about
the size of the kernel image itself probably build with
CONFIG_OPTIMIZE_FOR_SIZE=y, and I see no change in such an image whether
__init includes __cold or not.

Rasmus
