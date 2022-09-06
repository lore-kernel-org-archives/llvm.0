Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3737E
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 18:26:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t14so9445499wrx.8
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ebadhH2uYVNTslR5/261s7BWUnmUPBodlcqT9q7w6G8=;
        b=ouyb1NFaaJmVw2D5Z+apTQaYtMy1L9tXjdOm3G0+A3X0y9XF6Z2VYp0OClNSy/O94L
         7IRwykt0SxBx75g95cJWUNNmeHJlMF035UGAe5U/g+d8a1STdXUQRn6Y1309cjoF7CmB
         Bn+kuxDGBiQugwLb/Yw0VorkrExVBjLj7RfoC/VAgKWM612LHzDJjgPGRLsN4Qei/mMf
         IFTe7Nn2l5z6lmFV9/aw/s5NDLyuZrQQKSExgxSvzd+xo61HyYiZ1yIFbiEFcVHFDzMc
         kOv0yt4TgkKIRU/Ant9uTbP+yISj7eLuT28aMqYI86W136Quj3Vg+S7cNIMxcGYb/qih
         zk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ebadhH2uYVNTslR5/261s7BWUnmUPBodlcqT9q7w6G8=;
        b=A6JsliAwcXCnJbDrBiypgOQEGUrlPoUjQmxkIWikDklmc932Ug8w3932NY8fvxPLE8
         Xp9uBBBJ01ysAJYDB2vmGfPCiIRhh3Vppr988GS6mH6scgwLa9BvhmpbFY/AuwjnBLt4
         NXLDY0fQVtptv+/yVGVDFeT9C1zqX+IIgPqjhyrSJdw8khEfObQRv8Hkwz0RbmjsOT/p
         Wmmbqup/xQqVUIFSOrof9YhbOo2ipdD1Ldemaw/PVVD4GS9rrCoMYzMmjYrwbTd4HCGc
         ziOExEIQ/bH6hF2yBl2UGvr/B6O6XSmlgbWkqlNSbqyY5gLMfL2OjeGldz8scZesxf0H
         xfAA==
X-Gm-Message-State: ACgBeo0FXSrU+2cl47bPubX9XbSomzveOQVsR4zbMy9wut0lboQOOjyM
	b0voazTd4XLA41GWoboWA6vpDHQ0TzNyyjsuqh8Bcg==
X-Google-Smtp-Source: AA6agR7pNNwn4fhSG+iMJ8bz1+4iqG4YUPuYPcghISM7jq8faXl211XoIDxETeH03HrnYY+egECXTP5/t97C+IGFLik=
X-Received: by 2002:a05:6000:813:b0:226:da5a:84a9 with SMTP id
 bt19-20020a056000081300b00226da5a84a9mr24413460wrb.309.1662488804474; Tue, 06
 Sep 2022 11:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr> <20220905003732.752-1-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220905003732.752-1-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 6 Sep 2022 11:26:31 -0700
Message-ID: <CAKwvOdnr_F9-voPj4cp2HG8=U32a8Hp1aLpynSQiKOrwe4txpQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 4, 2022 at 5:38 PM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> The compilers provide some builtin expression equivalent to the ffs(),
> __ffs() and ffz() functions of the kernel. The kernel uses optimized
> assembly which produces better code than the builtin
> functions. However, such assembly code can not be folded when used
> with constant expressions.

Another tact which may help additional sources other than just the
Linux kernel; it seems that compilers should be able to fold this.

Vincent, if you're interested in making such an optimization in LLVM,
we'd welcome the contribution, and I'd be happy to show you where to
make such changes within LLVM; please let me know off thread.

If not, at the least, we should file feature requests in both:
* https://github.com/llvm/llvm-project/issues
* https://gcc.gnu.org/bugzilla/

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
> v6 -> v7:
>
>   * (no changes on code, only commit tag was modified)
>
>   * Add Reviewed-by: Yury Norov <yury.norov@gmail.com> in both patches
>
>
> v5 -> v6:
>   * Rename variable___ffs() into variable__ffs() (two underscores
>     instead of three)
>
>
> v4 -> v5:
>
>   * (no changes on code, only commit comment was modified)
>
>   * Rewrite the commit log:
>     - Use two spaces instead of `| ' to indent code snippets.
>     - Do not use `we'.
>     - Do not use `this patch' in the commit description. Instead,
>       use imperative tone.
>   Link: https://lore.kernel.org/all/YvUZVYxbOMcZtR5G@zn.tnic/
>
>
> v3 -> v4:
>
>   * (no changes on code, only commit comment was modified)
>
>   * Remove note and link to Nick's message in patch 1/2, c.f.:
>   Link: https://lore.kernel.org/all/CAKwvOdnnDaiJcV1gr9vV+ya-jWxx7+2KJNTDThyFctVDOgt9zQ@mail.gmail.com/
>
>   * Add Reviewed-by: Nick Desaulniers <ndesaulniers@google.com> tag in
>     patch 2/2.
>
>
> v2 -> v3:
>
>   * Redacted out the instructions after ret and before next function
>     in the assembly output.
>
>   * Added a note and a link to Nick's message on the constant
>     propagation missed-optimization in clang:
>     Link: https://lore.kernel.org/all/CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com/
>
>   * Fix copy/paste typo in statistics of patch 1/2. Number of
>     occurences before patches are 1081 and not 3607 (percentage
>     reduction of 26.7% remains correct)
>
>   * Rename the functions as follow:
>     - __varible_ffs() -> variable___ffs()
>     - __variable_ffz() -> variable_ffz()
>
>   * Add Reviewed-by: Nick Desaulniers <ndesaulniers@google.com> tag in
>     patch 1/2.
>
>
> Vincent Mailhol (2):
>   x86/asm/bitops: ffs: use __builtin_ffs to evaluate constant
>     expressions
>   x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to evaluate constant
>     expressions
>
>  arch/x86/include/asm/bitops.h | 64 +++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 26 deletions(-)
>
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
