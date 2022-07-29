Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2321360
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 11:25:10 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-324293f1414so13162187b3.0
        for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 04:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+Xle1HhYZA4u0BpE2NkhWcW76kE9EOZDKtebTajiOs=;
        b=321iw0o2CwVFTQlggyRx5qAGEPddX9PJmv66uPHkrWUStDMwBAL4d9xUmMSACvaIee
         2e3ygQSEykDEOyKlVGEhRerz5KMDqW2hMMt4mKSQ1LqAVaKslxBSH8ZvnljwwrbnWBWH
         MAk5hvVXe1UKCttSjooU3QFQd3YYAxF8FRJqZ+Sum4rub+u0i4P2IkQ82756EjpE/qfY
         TO+nCzLkO9QVRYyFnzXRZfJPgg5XsQG2pCJGIFT3rdhOWgwZ56y57DG9yEDTiKwzh7w0
         oRzW2GcwauWWA56J+pU8v+MBzM9FSelhSboID0RofXxYJzNZo8IjkbVDqhiVjcBPrtws
         v13A==
X-Gm-Message-State: ACgBeo3DG3WIG3WxROwPhsbyN60dvyzwgwAxN4RHmk/t9cI9bwmr/RGl
	McF22zJRF2cjyCsjrnpFGqFwJEHgnGUapWrV1mU=
X-Google-Smtp-Source: AA6agR4vyF0x47Jgt80gnEl94cVYa+Ot/cwsvfn8nZQ1pVGqtBnuuInF9zUL3vVRiAm9LfYeN3e4a0I/onBCnkpLX2A=
X-Received: by 2002:a0d:e682:0:b0:322:b5e1:5ed4 with SMTP id
 p124-20020a0de682000000b00322b5e15ed4mr2611471ywe.220.1659093909158; Fri, 29
 Jul 2022 04:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr> <20220723151521.51451-1-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220723151521.51451-1-mailhol.vincent@wanadoo.fr>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 29 Jul 2022 20:24:58 +0900
Message-ID: <CAMZ6Rq+KohWoRurA3cKog18D=NuXNj_k4+ZmPRiakZd7ZPS1OQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions
 for constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun 24 Jul. 2022 at 00:15, Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> The compilers provide some builtin expression equivalent to the ffs(),
> __ffs() and ffz() function of the kernel. The kernel uses optimized
> assembly which produces better code than the builtin
> functions. However, such assembly code can not be optimized when used
> on constant expression.
>
> This series relies on __builtin_constant_p to select the optimal solution:
>
>   * use kernel assembly for non constant expressions
>
>   * use compiler's __builtin function for constant expressions.
>
>
> ** Statistics **
>
> Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
> of __ffs() and ffz() calls (details of the calculation in each patch).
>
>
> ** Changelog **
>
> v3 -> v4:
>
>   * (no changes on code, only commit comment was modified)
>
>   * Remove note and link to Nick's message in patch 1/2, c.f.:
>   https://lore.kernel.org/all/CAKwvOdnnDaiJcV1gr9vV+ya-jWxx7+2KJNTDThyFctVDOgt9zQ@mail.gmail.com/
>
>   * Add Reviewed-by: Nick Desaulniers <ndesaulniers@google.com> in tag in patch 2/2.
>
>
> v2 -> v3:
>
>   * Redacted out the instructions after ret and before next function
>     in the assembly output.
>
>   * Added a note and a link to Nick's message on the constant
>     propagation missed-optimization in clang:
>     https://lore.kernel.org/all/CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com/
>
>   * Fix copy/paste typo in statistics of patch 1/2. Number of
>     occurences before patches are 1081 and not 3607 (percentage
>     reduction of 26.7% remains correct)
>
>   * Rename the functions as follow:
>     - __varible_ffs() -> variable___ffs()
>     - __variable_ffz() -> variable_ffz()
>
>   * Add Reviewed-by: Nick Desaulniers <ndesaulniers@google.com> in tag in patch 1/2.
>
> Vincent Mailhol (2):
>   x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant
>     expressions
>   x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant
>     expressions
>
>  arch/x86/include/asm/bitops.h | 64 +++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 26 deletions(-)

Hi Thomas, Ingo, Borislav, Dave and Peter,

This patch series [1] has been waiting for more than two months
already. So far, I have not heard back from any of the x86 mainteners.
Do you see anything wrong with this series? If not, any chances to
have someone of you to pick it up?

[1] https://lore.kernel.org/all/20220625072645.251828-1-mailhol.vincent@wanadoo.fr/#t

Thank you,


Yours sincerely,
Vincent Mailhol
