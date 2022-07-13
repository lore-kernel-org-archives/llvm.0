Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E444681
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 16:02:11 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id z25so19833576lfr.2
        for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWhhvtNedj35MafqKUgxobbUIMg+S+RFU2eVuxPt0V0=;
        b=saXm/2DYYz98lsTnnnC4cZtzYwilQkVPbJz+Nt8IPEgjczMyht2rA9hFXIPsqWNa6W
         jI+4KGQifKOciJaWQpa3wxOyh1iDQ3qOjrX7waH11xADUvW1AIhG1JvMAeDQ7DctNFhe
         6hyWOeo/UxxgdDqONL085MaflbXekwYgcWtnVe0XQnbhXnqNnuH3+u1igyds3nyyU+ec
         Bmk6o8eQhP+6F3ls5V7k0sXqT1WMSCC5s4lUxMiIeEvk53wyARe/cqu9v+G3jDWEmEHk
         7ZiVFOQK0Fhy21v6o7n+Mmt8F/NHkiTMTH2vNkK13sxtrvtnVYPzIpjYY7y5VC9zOosC
         QkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWhhvtNedj35MafqKUgxobbUIMg+S+RFU2eVuxPt0V0=;
        b=CifueHhi+yYqzwDrEk7X1USFULMPsLSVlQXJrq99SC/CucUcgpPWIEGdgXMX6Hg0we
         OuZOBxKp7CVomvZ57FI3m5JROdO8c0DsJhXrBnA4XgEov7+NnZPmUa0ixtpF0vIhgddX
         xsTz6h6u3cuErNj9dV/EzTPdFLW7vNBs/MRlha4g+yh3MaL6bdfbWZGpUVxg/L9xx1rB
         Qqy33gMDYgkWRAcxcKgWnpcAYNe+gygNbnSTwD3HqMEKyVRNDEB4JiOpiQYWqrj/bxNd
         XmS4gfmU0tVUrCW64QwJtmT8p4/jzzxEgjzMEC8NbvZI8agsl5Un57wBZePbGHzOv1sA
         gwbw==
X-Gm-Message-State: AJIora91c36MaetlPBgOWNEqLABC7xQowiTXlH0Pi6dNcQOYG7VT3rlO
	h2ZeYQDy7QzgzxnSqeBdwuW3qSf2zCMpKTq7lZheJQ==
X-Google-Smtp-Source: AGRyM1tEeAU8wQ+I9NLXcaCNWF3OMoEcj9swPCub58eFdu/CXAS2vrblZpMhD6UCziXF3nb8vHjaU/FZqJjyD96sp1k=
X-Received: by 2002:ac2:4c46:0:b0:489:e93c:69b with SMTP id
 o6-20020ac24c46000000b00489e93c069bmr2291049lfk.403.1657728129923; Wed, 13
 Jul 2022 09:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Ys7pLq+tQk5xEa/B@dev-arch.thelio-3990X>
In-Reply-To: <Ys7pLq+tQk5xEa/B@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Jul 2022 09:01:58 -0700
Message-ID: <CAKwvOd=kqfAZoywsOFbvvzUJD+zVgFgmDAAcb7h0U8LGzfG33A@mail.gmail.com>
Subject: Re: objtool "'naked' return found in RETHUNK build" with clang + CONFIG_K{A,C}SAN=y
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 8:48 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Josh and Peter,
>
> After commit 9bb2ec608a20 ("objtool: Update Retpoline validation") and
> commit f43b9876e857 ("x86/retbleed: Add fine grained Kconfig knobs"), I
> see a spew of objtool warnings when building certain configurations with
> clang. Examples below, they appear to trigger in every single file.
>
> With x86_64_defconfig + CONFIG_KASAN=y:
>
> arch/x86/ia32/audit.o: warning: objtool: asan.module_ctor+0x11: 'naked' return found in RETHUNK build
> arch/x86/ia32/audit.o: warning: objtool: asan.module_dtor+0x11: 'naked' return found in RETHUNK build
> init/version.o: warning: objtool: asan.module_ctor+0x11: 'naked' return found in RETHUNK build
> init/version.o: warning: objtool: asan.module_dtor+0x11: 'naked' return found in RETHUNK build
> arch/x86/kernel/cpu/rdrand.o: warning: objtool: asan.module_ctor+0x11: 'naked' return found in RETHUNK build
> arch/x86/kernel/cpu/rdrand.o: warning: objtool: asan.module_dtor+0x11: 'naked' return found in RETHUNK build
> arch/x86/kernel/fpu/bugs.o: warning: objtool: asan.module_ctor+0x11: 'naked' return found in RETHUNK build
> arch/x86/kernel/fpu/bugs.o: warning: objtool: asan.module_dtor+0x11: 'naked' return found in RETHUNK build
> arch/x86/kernel/platform-quirks.o: warning: objtool: asan.module_ctor+0x0: 'naked' return found in RETHUNK build
> init/calibrate.o: warning: objtool: asan.module_ctor+0x11: 'naked' return found in RETHUNK build
> init/calibrate.o: warning: objtool: asan.module_dtor+0x11: 'naked' return found in RETHUNK build
>
> With x86_64_defconfig + CONFIG_KCSAN=y:
>
> arch/x86/ia32/audit.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build
> init/calibrate.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build
> init/version.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build
> arch/x86/kernel/fpu/bugs.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build
> arch/x86/kernel/cpu/rdrand.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build
> arch/x86/events/probe.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build
> arch/x86/kernel/apic/ipi.o: warning: objtool: tsan.module_ctor+0x5: 'naked' return found in RETHUNK build

Thanks for the report. I wonder if this might be a compiler bug; it
seems like the {a|t}san.module_{c|d}tor functions are being emitted
with ret instructions?

If you have one of these builds lying around still, can you provide:

$ llvm-objdump -dr --disassemble-symbols=tsan.module_ctor
arch/x86/kernel/fpu/bugs.o

(I'm about to head into a bunch of meetings now, but can check more
this afternoon; see you at Noon)

If Peter and Josh are bored, feel free to stop by
https://meet.google.com/yjf-jyqk-iaz
at Noon PDT / 19:00 UTV today.

>
> If there is any additional information I can provide or patches I can
> test, I am happy to do so!
>
> Cheers,
> Nathan
>


-- 
Thanks,
~Nick Desaulniers
