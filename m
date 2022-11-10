Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DF11A629
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 19:06:22 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o7so2455242pjj.1
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8BOfwJyZkB5NeEkoK9HFl+Jpr8ENfJAqXI5cJXPbV58=;
        b=nVYsd80hcxMv8ff6fLEa671TtzbPmVVCP1aPUXP0s6+BujlXVaze5aQociyjzmAnlW
         5W4BpzMnVVqWD3kXN+QkmA4t42sP4n+cIQrhaQkxhE/T8UB51PRMjJwk4f/XxJTULlAF
         0UX9NtEt9fcOSitjV6oaZxroCFZqPJ67lU7C1CqNAzDVpktF3ylxkr+XFKfC5tBGD+mo
         GpVfjDW6xYl5VXv6oN4COhPIVZ1yKi9o+8ZBFzGkMcenCokt3/NuMFkE2S5wyvZDy26P
         CzLzbhARvWXDpI4fowrGuZOZA4Kt3z+9+afVXuWt8ep5rdycTCXrZOIuwkgyfeBHc+WO
         9Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BOfwJyZkB5NeEkoK9HFl+Jpr8ENfJAqXI5cJXPbV58=;
        b=P9UV1ZCkKEoNXlFMYNHSmeLhouyqeXjdx962VTNIQEilAoZLXgwg1iSttnRxbKMb2f
         1iTfCLVnZ6vhp2VSTChStjS1EbLBZbZTfSHq5Vq5YTff4BATZnEHqYxExUfU5gy7tIS1
         DGOBowrpogC6ZoaytrYA09esUh1asS3CrJp1h8vZ2IUFg6srM5Sx3bzPMYIYMr8cxJKm
         YwJTBUVy3Hn3batKY5R7hjZFDKz+XKjTg5bDoBMCMxOnY9a4NPN5tcS7qpaTfyiBal0A
         YyuGSxuL4LeuafQ6HhOWstvwNr53EonG+jwNOozQT6uxnE3a4iaMM5q9yLzT9bpRZiBa
         sbYg==
X-Gm-Message-State: ACrzQf3JQKuOXh6JQXdbGr8TsDo0EP+DMhUwrzWFgToyQqBqB8ovZpbM
	ZcxNMstbWO/wzhFIgdbryUjVY3LXACnBAm77MFwaIg==
X-Google-Smtp-Source: AMsMyM6LzgdK6gm66CyORfaEyT80odV+S0OASHc9uDM/+naRIEiC1LJkBIueaSZfN21OBm/dwxkjdGo74I31A4DX5Kg=
X-Received: by 2002:a17:90a:c24a:b0:213:13aa:3e2a with SMTP id
 d10-20020a17090ac24a00b0021313aa3e2amr82957783pjx.107.1668107181512; Thu, 10
 Nov 2022 11:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr> <20221106095106.849154-2-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20221106095106.849154-2-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Nov 2022 11:06:10 -0800
Message-ID: <CAKwvOdnzx0Y-vmFsRS6=rCveqAJVn6hXEutdn_ow=jbtNeQcCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] x86/asm/bitops: Replace __fls() by its generic
 builtin implementation
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev, Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 6, 2022 at 1:51 AM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> Below snippet:
>
>   #include <linux/bitops.h>
>
>   unsigned int foo(unsigned long word)
>   {
>         return __fls(word);
>   }
>
> produces this on GCC 12.1.0:
>
>   0000000000000000 <foo>:
>      0: f3 0f 1e fa             endbr64
>      4: e8 00 00 00 00          call   9 <foo+0x9>
>      9: 53                      push   %rbx
>      a: 48 89 fb                mov    %rdi,%rbx
>      d: e8 00 00 00 00          call   12 <foo+0x12>
>     12: 48 0f bd c3             bsr    %rbx,%rax
>     16: 5b                      pop    %rbx
>     17: 31 ff                   xor    %edi,%edi
>     19: e9 00 00 00 00          jmp    1e <foo+0x1e>
>
> and that on clang 14.0.6:
>
>   0000000000000000 <foo>:
>      0: f3 0f 1e fa             endbr64
>      4: e8 00 00 00 00          call   9 <foo+0x9>
>      9: 53                      push   %rbx
>      a: 50                      push   %rax
>      b: 48 89 fb                mov    %rdi,%rbx
>      e: e8 00 00 00 00          call   13 <foo+0x13>
>     13: 48 89 1c 24             mov    %rbx,(%rsp)
>     17: 48 0f bd 04 24          bsr    (%rsp),%rax
>     1c: 48 83 c4 08             add    $0x8,%rsp
>     20: 5b                      pop    %rbx
>     21: c3                      ret
>
> The implementation from <asm-generic/bitops/builtin-__fls.h> [1]
> produces the exact same code on GCC and below code on clang:
>
>   0000000000000000 <foo>:
>      0: f3 0f 1e fa             endbr64
>      4: e8 00 00 00 00          call   9 <foo+0x9>
>      9: 53                      push   %rbx
>      a: 48 89 fb                mov    %rdi,%rbx
>      d: e8 00 00 00 00          call   12 <foo+0x12>
>     12: 48 0f bd c3             bsr    %rbx,%rax
>     16: 5b                      pop    %rbx
>     17: c3                      ret
>
> The builtin implementation is better for two reasons:
>
>   1/ it saves two instructions on clang (a push and a stack pointer
>      decrement) because of a useless tentative to save rax.
>
>   2/ when used on constant expressions, the compiler is only able to
>      fold the builtin version (c.f. [2]).
>
> For those two reasons, replace the assembly implementation by its
> builtin counterpart.
>
> [1] https://elixir.bootlin.com/linux/v6.0/source/include/asm-generic/bitops/builtin-__fls.h
>
> [2] commit 146034fed6ee ("x86/asm/bitops: Use __builtin_ffs() to evaluate constant expressions")
>
> CC: Borislav Petkov <bp@suse.de>
> CC: Nick Desaulniers <ndesaulniers@google.com>
> CC: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

LGTM; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/x86/include/asm/bitops.h | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
> index 2edf68475fec..a31453d7686d 100644
> --- a/arch/x86/include/asm/bitops.h
> +++ b/arch/x86/include/asm/bitops.h
> @@ -285,19 +285,7 @@ static __always_inline unsigned long variable_ffz(unsigned long word)
>          (unsigned long)__builtin_ctzl(~word) : \
>          variable_ffz(word))
>
> -/*
> - * __fls: find last set bit in word
> - * @word: The word to search
> - *
> - * Undefined if no set bit exists, so code should check against 0 first.
> - */
> -static __always_inline unsigned long __fls(unsigned long word)
> -{
> -       asm("bsr %1,%0"
> -           : "=r" (word)
> -           : "rm" (word));
> -       return word;
> -}
> +#include <asm-generic/bitops/builtin-__fls.h>
>
>  #undef ADDR
>
> --
> 2.37.4
>


-- 
Thanks,
~Nick Desaulniers
