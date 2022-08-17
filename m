Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F787463
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 22:08:16 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id i19so2394947lfr.10
        for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=MdXe9v7V/n49BLfPIm7mAPC3zaXea5taJTJFdb6i330=;
        b=ad2R800fXpR9dwOXrfOT66zX7atkDbWCJuzExzeA9SOHu6hrhhW8FD8ZkdBXt3Kkvz
         p5k4JJVQcAihCgjScizrSXVM3UdAV4Zh3VB8ZMz6m4XaheZD4gJUsX53gDk3DJh3phIv
         Jh+RrCh9xONalatJVG1gRFh7dkx6m1j17YDDM4wqkLvpzWQyk9M1dQ89vS7yktQjlyrY
         nSWyuVfMRdfAK0GBQKm0OiruU5DHNr7/F/jDfH9hXxUO1XQjUKfnoZCtLgIc6RPEobpj
         rRMXGAl/y44i9E9X207ThzhY3fB/MJhKPsB6QDT9zugoQhc4vkvZf0dG80xd5hfJ+VrR
         A5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MdXe9v7V/n49BLfPIm7mAPC3zaXea5taJTJFdb6i330=;
        b=l/qso6WzpzlU4y7iOo36wpIa8HngAxw3cXAh9gCffwU3VyalgFR5yKG2bksdQDuANr
         2etZmneKJV6a7YP+wFJXmoBalUZQe3zArF4DL9vB8VpZkP/97URw8SFHLmAPlDOz+UkK
         GdzBkMJyD4b5oDqJg+fFM7c4sDI4Wv8LX0bOpbftp4ndR+rS0ahmi0OqYP/gtZiwVLVR
         3wNzKInciWZGEMSroiXqpYnG2jI8u1GLju4MMFbVbneyPEXfo1tznE3AxnIWhfF2UNtP
         xjBOqdShapvPRnHCyuDtbXvyTDvLI4vMvNJWx1lCUvcmWRV7Q88/spWqh0IHfd85f7yg
         MoCA==
X-Gm-Message-State: ACgBeo1DIWuqPSaw4NDXk8XY2vVRLmxUP/YuR/0xCUN/sX9z9kBHwbAN
	jf0GdLcU8yXdA7xG5tnKesPUm9wj4l81oh28VUExBQ==
X-Google-Smtp-Source: AA6agR6bbMV/+NnYEX/0CwW9iDlRuDXiyrW9k/uewNGpLosZ7a2gJKZGRauS38UPO+Ee/bRdMTB7b5oOC3RJt7neQAs=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr59229lfr.647.1660774094305; Wed, 17 Aug
 2022 15:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817185410.1174782-1-nathan@kernel.org>
In-Reply-To: <20220817185410.1174782-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 Aug 2022 15:08:01 -0700
Message-ID: <CAKwvOd=0R76r6YqNiOhGNt_XrA_t_ZbuBbNNdNXV4CWpDy0+Bg@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Move '-mindirect-branch-cs-prefix' out of
 GCC-only block
To: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 11:56 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> LLVM 16 will have support for this flag so move it out of the GCC-only
> block to allow LLVM builds to take advantage of it.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1665
> Link: https://github.com/llvm/llvm-project/commit/6f867f9102838ebe314c1f3661fdf95700386e5a
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch, I also boot tested this (in virtual guests for
both 64b and 32b).

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Peter, is there anything else special about these prefixes needed to
make use of them?

> ---
>
> I was not sure if this information is relevant for the commit message
> but I can boot without any issues on my test machines (two Intel and one
> AMD).
>
>  arch/x86/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 7854685c5f25..987da87c7778 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -14,13 +14,13 @@ endif
>
>  ifdef CONFIG_CC_IS_GCC
>  RETPOLINE_CFLAGS       := $(call cc-option,-mindirect-branch=thunk-extern -mindirect-branch-register)
> -RETPOLINE_CFLAGS       += $(call cc-option,-mindirect-branch-cs-prefix)
>  RETPOLINE_VDSO_CFLAGS  := $(call cc-option,-mindirect-branch=thunk-inline -mindirect-branch-register)
>  endif
>  ifdef CONFIG_CC_IS_CLANG
>  RETPOLINE_CFLAGS       := -mretpoline-external-thunk
>  RETPOLINE_VDSO_CFLAGS  := -mretpoline
>  endif
> +RETPOLINE_CFLAGS       += $(call cc-option,-mindirect-branch-cs-prefix)
>
>  ifdef CONFIG_RETHUNK
>  RETHUNK_CFLAGS         := -mfunction-return=thunk-extern
>
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> --
> 2.37.2
>
>


-- 
Thanks,
~Nick Desaulniers
