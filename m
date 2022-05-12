Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2871160
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 00:20:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bq30so6319206lfb.3
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hmOCXqJx3aPNv4toFluqExpM2fAmi+JPCbe0noGaZQw=;
        b=RJmRo0HgfC9Kf3yO0+w2/I5Wdot1ejiTWXVtN28t570/TpcfZ0rXnWvezeh6gmWdW+
         UOUa64hf/XUk253RtaHBUlobyqh8Y+2ZpxgEGnOaHs6TxXvVIToG+1RR946wBgrFAbyk
         opCld9z+r4zI7R/FHeYrNOtWFdLHzDZnUBfnxP0+3Iluf55T61NuXpsg3uCRJt5THX+Z
         dsCbcwhJWJcxK/xhknvj1IRvrgMGuYkHvKSkbDh0K6RlnFIAHL3yN8oHALbCM7IN/dAE
         86sTXvEBhUVpOfFCalqkkPuWXTYJALcsdV3Jf6WEosfXUhH1BRbZNdlp0F/HZncqS63c
         FlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hmOCXqJx3aPNv4toFluqExpM2fAmi+JPCbe0noGaZQw=;
        b=3z58XFlRa/mCVygj7o7G/Q7CV0wpPtNhw0alZgvew9N5K+UaOMw6ITtN+OxZpDvIl5
         /UYobJqc0Ek40Qxg+WamofuwGdAZPT8uBUbzmrr3qqo6JV/GZ1pSoVsE6v5oKQYJ79vf
         aD4gSDQwJEIaJoblhqXHReUWlbrPG7Bne4y/oqEpsPc71bT6J+nlqo7wB92NZIXjiXXJ
         ePsLmPiuHtgx7MGcT12e8X2BUlY5oS9m7/YGXViQ2KpXpErnA72SChYXis3VTZ9X/q9e
         9El0iMo+dBmfxT0wEaTNOkvlP/WazlLPFH6+Sd2xXm5obos5Uy4M5RYvfASIefqnaBud
         N4jg==
X-Gm-Message-State: AOAM533cBx/gFY4HpZniJQ53XjdPksOsUIfJAUJhy5H9UEI1AmFhl269
	MLzB9LbtmoT6DROYBTIE7UoupXjWSe3eivcpNinfVg==
X-Google-Smtp-Source: ABdhPJyJa8CFD2lJb3SXoKRhg9zlKbw7LnvKB8sRqmoJ23L1zXPSQZb94ZFTj6dAS5ma5T1eblHEUYAN6lJ7kSfAXhA=
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id
 b6-20020ac25e86000000b00473d04460f5mr22024882lfq.87.1652314806600; Wed, 11
 May 2022 17:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220512000340.1171988-1-mailhol.vincent@wanadoo.fr> <20220512000340.1171988-3-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220512000340.1171988-3-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 17:19:54 -0700
Message-ID: <CAKwvOdntx-ZBqVYhdeOO4C1tF4Mx=OpFNYBQUfB=iXjfQO9bvw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to
 evaluate constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 5:04 PM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> __ffs(x) is equivalent to (unsigned long)__builtin_ctzl(x) and ffz(x)
> is equivalent to (unsigned long)__builtin_ctzl(~x). Because
> __builting_ctzl() returns an int, a cast to (unsigned long) is
> necessary to avoid potential warnings on implicit casts.
>
> For x86_64, the current __ffs() and ffz() implementations do not
> produce optimized code when called with a constant expression. On the
> contrary, the __builtin_ctzl() gets simplified into a single
> instruction.
>
> However, for non constant expressions, the __ffs() and ffz() asm
> versions of the kernel remains slightly better than the code produced
> by GCC (it produces a useless instruction to clear eax).
>
> This patch uses the __builtin_constant_p() to select between the
> kernel's __ffs()/ffz() and the __builtin_ctzl() depending on whether
> the argument is constant or not.
>
> ** Statistics **
>
> On a allyesconfig, before applying this patch...:
>
> | $ objdump -d vmlinux.o | grep tzcnt | wc -l
> | 3607
>
> ...and after:
>
> | $ objdump -d vmlinux.o | grep tzcnt | wc -l
> | 2600
>
> So, roughly 27.9% of the calls to either __ffs() or ffz() were using
> constant expressions and could be optimized out.
>
> (tests done on linux v5.18-rc5 x86_64 using GCC 11.2.1)
>
> Note: on x86_64, the asm bsf instruction produces tzcnt when used with
> the ret prefix (which is why we grep tzcnt instead of bsf in above
> benchmark). c.f. [1]
>
> [1] commit e26a44a2d618 ("x86: Use REP BSF unconditionally")
> http://lkml.kernel.org/r/5058741E020000780009C014@nat28.tlf.novell.com
>
> CC: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


-- 
Thanks,
~Nick Desaulniers
