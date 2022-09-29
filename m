Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49953A5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 17:26:42 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id jo24so1260296plb.13
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 10:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hp5MQIBdOQ5Xk6FQmwC1/qIjFwJwbOcf9xoZvfBFSSs=;
        b=RyAGnpmVQ7MHTy3FCbwhx+2SCA1IVKkyCDgY5S0n/JQkX7ciyU6WlRztNvL4tNYrWY
         P8yeb9atgz7sJsNunvKwjSto1jvT288QBV6GYqC7mDy3SZwOfgTA5t2FFXRx+RY8vD1K
         prK2Vz3hNVAMyJWXzGokK3qlkKIop5mkwV5XeVXDK9D8JowjYfW2wPcbAXwbOtCYcci0
         wpJJ4cwbTD8ShNL1hy5MkbWLlI5g2YJ3Hze+RsckkZqZfGsUhNdyzO3PbImn4y+OfjdG
         qSqThRukWMKgvEj4MkvYX/UUXLkN4msLyzS2iZukUZ1wsy+oAQDEztxkF5S0D94S0938
         CskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hp5MQIBdOQ5Xk6FQmwC1/qIjFwJwbOcf9xoZvfBFSSs=;
        b=uajAh0SH8KnMfX4bj8D9/CBfUXOuRDm90Pn+cZ+6crHMBus4/rJAah6gowFGCrnlDc
         PT2/KK03owzg0z6lbtBkA8Apk9oR9h04eUTuGZkiBMzRGg0I0BTV1b5B//fTnvSY6mai
         a1mAroRuB+x/w+UuGaE48SUa59y4uClksGMtWGYELfpeJIpCPDx+C7YAo5X2qRsEnpGW
         QmcBK/rvCDKrifti71hS2WyHGL0Aj6SbXYH8+FCS+ZFIHksxgv2wqnA/cEDJsWeF2lKy
         SAQKQFIWxQEG63ONM97vJkF1kPVWEb/7tTZtvybc+HGrX2tQiKbqsiOXWhkJR9ItE6aL
         q/MQ==
X-Gm-Message-State: ACrzQf3QbsLjMOVYDaxrQRffJ2lTEIDL56V+weX3Z6lBwef4wpco6cts
	0tQ2K4+JVppwp70sPIgzz0WqkMxvRyyrmaeHjeL3RA==
X-Google-Smtp-Source: AMsMyM6PcJA6nad6z96ctWkFUw7ZK/KRKkinRUcyyms0OiRxIbikPJZ4kvR4bJl/I/IumZ6cAydMH85aCXmtXaokv7o=
X-Received: by 2002:a17:90b:1d0f:b0:202:be3e:a14a with SMTP id
 on15-20020a17090b1d0f00b00202be3ea14amr17447921pjb.102.1664472401750; Thu, 29
 Sep 2022 10:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkaKTa2aiA90VzFrChNQM6O_ro+b7VWs=op70jx-DKaXA@mail.gmail.com>
 <20220928210512.642594-1-ndesaulniers@google.com> <YzVRJ3NY2w1NSoM2@gmail.com>
In-Reply-To: <YzVRJ3NY2w1NSoM2@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 29 Sep 2022 10:26:29 -0700
Message-ID: <CAKwvOdk4bbwy6mb+uxO1BUCz5=0K7t1Xa899WnZS1VY5Sdhqkg@mail.gmail.com>
Subject: Re: [PATCH v4] x86, mem: move memmove to out of line assembler
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 1:02 AM Ingo Molnar <mingo@kernel.org> wrote:
>
> Yeah, so you did various whitespace & indentation cleanups, and I think if
> we are touching trivialities we might as well fix/improve the documentation
> of this function too...

Yes, these are all wonderful suggestions.  My hope is to also improve
the readability of the implementation. I will incorporate your
suggestions into a v5 and credit you with a suggested-by tag.

> calling standards details. If we want to mention it to make it clear what
> we are saving on the stack and what not, the best description is the one
> from calling.h:
>
>    x86 function calling convention, 32-bit:
>    ----------------------------------------
>     arguments         | callee-saved        | extra caller-saved | return
>    [callee-clobbered] |                     | [callee-clobbered] |
>    -------------------------------------------------------------------------
>    eax edx ecx        | ebx edi esi ebp [*] | <none>             | eax

Oh! Perfect! I'm so glad this table exists!

> Feel free to carry these changes over into your patch.

Will do, thanks.
-- 
Thanks,
~Nick Desaulniers
