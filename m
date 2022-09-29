Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA510F7
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 08:02:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id lh5so1107650ejb.10
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=EQQgZ1oVVIB2JdD2nmuwpf+Il33tHiTgoiAin0UQX7g=;
        b=jghj+N/x6DMb1kjsQVVEyBvQ1pzdTp7A+dQeVzwZlRUHu32BD3G/dBUmB5Eu2Pa5si
         D1384nyITPUBi/auEtexM4wthZFlpwhyJ+Ql1bD39kXOvSvatwtKKV7TFrXcE9WuTDRc
         /yLU72oMH9wK8zlqimr5ojgLdKX46FyynN1Cpl1nSY2K1Mvsqp4+PrprNIBZ6fYUfB7a
         kMqEaypNx/DvX1UUTjiCTefvkQvruy/J2wMNHAtKR1SW+l2vpOKbDTAQwtlEH41HJjjk
         5C3JJJWCrIcC5+mIczN1gTiIkKwU5yp2fDP5oCunCpzYM4lHBCB0HzHpOh9QQo2mko0O
         CGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EQQgZ1oVVIB2JdD2nmuwpf+Il33tHiTgoiAin0UQX7g=;
        b=HYxWzWmhN/lNhItXJqXRw4hLUvGjFmFfprAkUdwVVumvD1OjvE9ncZnOmDEjB9lEEL
         or8bD2AZvRst71d7qr8dyQb27lJ6jPjAPgsiTPHA0AWBFCjpmjaR7Rl4tUpn5wGZTzTQ
         66/OoQ3lZhUOZJJ8LJWwlRUhODmHA4zhNJgrsCLGXUtmmJA68E0azguVh3vbjJy66Eni
         ihUOZrSSdcJLWKKRZzIA+GNC3BNChfHTDDeHVxWWOSjCflYcuN0FbCRRbPjM1+3emS8Z
         +qDgpxElD10KQtOxdE57mF7oDORLbRiZdWXia0T7d05KSXVr91btMSKs3XzgxasmZQs4
         QRqg==
X-Gm-Message-State: ACrzQf0wQ58yTRF/nbYCTJc/dhc9Qog5eprwd+N1VqTdXjcOJVsyn4hO
	PjTHIGGey6KfJL0PLybiESA=
X-Google-Smtp-Source: AMsMyM5pIPkTkuHYPVyoASBVf9z6TsmQTwVSVWKAmdR+1daO/DvsR2OHZ5bB+DwjQx9Lb2KXhNTSSw==
X-Received: by 2002:a17:906:4fca:b0:782:2484:6d72 with SMTP id i10-20020a1709064fca00b0078224846d72mr1731025ejw.150.1664438570228;
        Thu, 29 Sep 2022 01:02:50 -0700 (PDT)
Received: from gmail.com (1F2EF01B.nat.pool.telekom.hu. [31.46.240.27])
        by smtp.gmail.com with ESMTPSA id lb20-20020a170907785400b00781e7d364ebsm3621610ejc.144.2022.09.29.01.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 01:02:49 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Thu, 29 Sep 2022 10:02:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v4] x86, mem: move memmove to out of line assembler
Message-ID: <YzVRJ3NY2w1NSoM2@gmail.com>
References: <CAKwvOdkaKTa2aiA90VzFrChNQM6O_ro+b7VWs=op70jx-DKaXA@mail.gmail.com>
 <20220928210512.642594-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928210512.642594-1-ndesaulniers@google.com>


* Nick Desaulniers <ndesaulniers@google.com> wrote:

> +SYM_FUNC_START(memmove)
> +/*
> + * void *memmove(void *dest_in, const void *src_in, size_t n)
> + * -mregparm=3 passes these in registers:
> + * dest_in: %eax
> + * src_in: %edx
> + * n: %ecx
> + *
> + * n can remain in %ecx, but for `rep movsl`, we'll need dest in %edi and src
> + * in %esi.
> + */
> +.set dest_in, %eax
> +.set dest, %edi
> +.set src_in, %edx
> +.set src, %esi
> +.set n, %ecx
> +
> +/*
> + * Need 3 scratch registers. These need to be saved+restored. Section 3.2.1
> + * Footnote 7 of the System V Application Binary Interface Version 1.0 aka
> + * "psABI" notes:
> + *   Note that in contrast to the Intel386 ABI, %rdi, and %rsi belong to the
> + *   called function, not the caller.
> + * i.e. %edi and %esi are callee saved for i386 (because they belong to the
> + * caller).
> + */
> +.set tmp0, %edx
> +.set tmp0w, %dx
> +.set tmp1, %ebx
> +.set tmp1w, %bx
> +.set tmp2, %eax
> +.set tmp3b, %cl
> +
> +	pushl	%ebp
> +	movl	%esp, %ebp
> +
> +	pushl	dest_in
> +	pushl	dest
> +	pushl	src
> +	pushl	tmp1

Yeah, so you did various whitespace & indentation cleanups, and I think if 
we are touching trivialities we might as well fix/improve the documentation 
of this function too...

For example the comments around parameters and register clobbering are 
somewhat inaccurate and actively obfuscate what is going on.

1)

Firstly, the function uses not "3 scratch registers", but four:

   eax [tmp2]
   ebx [tmp1]
   ecx [tmp3]
   edx [tmp0]

[ Confusion probably comes from the fact that the main logic uses 3 of 
  these registers to move stuff around: tmp0/1/2, and tmp3 is clobbered as 
  part of the 'byteswap' branch. ]

2)

The description of the calling convention is needlessly obfuscated with 
calling standards details. If we want to mention it to make it clear what 
we are saving on the stack and what not, the best description is the one 
from calling.h:

   x86 function calling convention, 32-bit:
   ----------------------------------------
    arguments         | callee-saved        | extra caller-saved | return
   [callee-clobbered] |                     | [callee-clobbered] |
   -------------------------------------------------------------------------
   eax edx ecx        | ebx edi esi ebp [*] | <none>             | eax

This makes it clear that of the 4 temporary scratch registers used by 
memmove(), only ebx [tmp1] needs to be saved explicitly.

Beyond the (content-)scratch registers, the function will also internally 
clobber three other registers:

   esi [src]
   edi [dest]
   ebp [frame pointer]

These esi/edi are the indices into the memory regions.

Since esi/edi are callee-saved, these need to be saved/restored too.

This fully explains the prologue - with annotations in the comments added 
by me:

+       pushl   %ebp                // save callee-saved ebp
+       movl    %esp, %ebp          // set standard frame pointer

+       pushl   dest_in             // 'dest_in' will be the return value
+       pushl   dest                // save callee-saved edi
+       pushl   src                 // save callee-saved esi
+       pushl   tmp1                // save callee-saved ebx

...

+       popl    tmp1                // restore callee-saved ebx
+       popl    src                 // restore callee-saved esi
+       popl    dest                // restore callee-saved edi
+       popl    %eax                // memmove returns 'dest_in'

+       popl    %ebp                // restore callee-saved ebp
+       RET

3)

But since this large function clobbers *all* callee-saved general purpose 
registers of the i386 kernel function call ABI, we might as well make that 
explicit, via something like:

        /*
         * Save all callee-saved registers, because this function is
         * going to clobber all of them:
         */
        pushl   %ebp
        movl    %esp, %ebp          // set standard frame pointer
        pushl   %ebx
        pushl   %edi
        pushl   %esi

        pushl   dest_in             // save 'dest_in' parameter [eax] as the return value

        ...

        popl    dest_in             // restore 'dest_in' [eax] as the return value

        /* Restore all callee-saved registers: */
        popl    %esi
        popl    %edi
        popl    %ebx
        popl    %ebp

        RET

This IMO makes it a lot more clear what is going on in the 
prologue/epilogue and why.

Feel free to carry these changes over into your patch.

Thanks,

	Ingo
