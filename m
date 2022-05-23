Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA686629
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 09:23:06 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i11so24291429ybq.9
        for <llvm@lists.linux.dev>; Mon, 23 May 2022 02:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSdESsXQYczC4k5qR6EUhoG55XqgQrQ395OHEw3icQs=;
        b=F8HSpXRSjVM7pZBQmec2XP8xxvHGgVlKoUVrnjR5+FFu0EB6GyLC3qGVFF3ikjgCka
         V775VArldkOl4XOCaDyeYhcyx1l18rKp5ds6R4Ejj6iwp2Hlb4fbexV88wxlurWQuMNA
         c7OfYoj1E4RWK3Eq4XGtIFuZaLQcmWVDJPBAef5WNbJgi4zf986AKAKpLbtl0kM8Ff5A
         XEV+bL2vP1RFEVz2r2GbVcNwpPztK/YXmUUjQDqK4tr1/RwtBw4jwHkw80AQt4v8BIXc
         dZ2eCc4vzzbCgQBkpHLY89Huujc6j46igdFeMPH5j/6yin/o1EAUL3A6zMhipTHNJ9po
         31Yw==
X-Gm-Message-State: AOAM533AFqwOKHh5cS6CLY3rWFfdYmYPegchlB6txExRCk8wMGaom+dG
	u73bemE3Gwg+oiGGpNxwNJOB00iAwUpQvsEjJNCa/G8cJe7GUsF6
X-Google-Smtp-Source: ABdhPJyy8YU4QNP8+S3euZ1cip0Al7OTJHjUcN2ZpHTMyltrNjuzU9LvTTPZtV62bLbOXw9bFGPm+tKQq9FLJrOwEKI=
X-Received: by 2002:a5b:491:0:b0:64a:f42f:6973 with SMTP id
 n17-20020a5b0491000000b0064af42f6973mr19994401ybp.20.1653297785863; Mon, 23
 May 2022 02:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr> <20220512011855.1189653-1-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220512011855.1189653-1-mailhol.vincent@wanadoo.fr>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Mon, 23 May 2022 18:22:54 +0900
Message-ID: <CAMZ6RqL-GBDW1f4=eE_N+jaBjSnD7A8kG_XsNjyvcp94M2Ok3g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	x86@kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu. 12 May 2022 at 10:20, Vincent Mailhol
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
> I also think that the fls() and fls64() can be optimized in a similar
> way, using __builtin_ctz() and __builtin_ctzll() but it is a bit less
> trivial so I want to focus on this series first. If it get accepted, I
> will then work on those two additionnal function.
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

Hi Thomas, Ingo and Borislav,

Are there any chances for you to pick those two patches during this
week's merge windows?
https://lore.kernel.org/all/20220512011855.1189653-2-mailhol.vincent@wanadoo.fr/
https://lore.kernel.org/all/20220512011855.1189653-3-mailhol.vincent@wanadoo.fr/

Thank you!


Yours sincerely,
Vincent Mailhol
