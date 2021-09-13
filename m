Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264583FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:22:50 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id q68so9924896pga.9
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UrI++KrL3G98onokFq/pYKy5JvmvRNfVhFLlImhdNls=;
        b=T4/YRH+JlmYW6VSgJ7ziaJXtrmBRrWJewNIwIsqXg47Y5EuTJEqmlBUoKiX3XdBMnD
         2AA2ITMgNutd2Tps6A8LUQWVPwv844f6FISWUYDLceSfzcSzlayf4b8wAnbvNoPlg5/z
         xfVOFU6Wr45jh7XM/L47fn0fMbu62IgjUwtuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UrI++KrL3G98onokFq/pYKy5JvmvRNfVhFLlImhdNls=;
        b=I/P4pAoB8guGR5XgyEOtcZmRnMyNuuCeS9mEC9qd8MTOGEk55ZzBHFYiCiL2D7EkYg
         JAEyYZQX+Nh85F9pcCUzBmJD5bEeojEa8EmCJYEk8OsYZtM/+tJYkHeqDEnqDRUtWhfM
         BqYxHHP2KY45C/H5cTpguZ2c0ovlfDIbNw9vzbpR4Wt7CL1LXZse+MckaFHbkzkLChaX
         EF3xteFpg3G6r8WVszJqLOesY4uXO8xDgdub1U0fpuZQ+nVe7hhT/joRVxAGUbbMyx7A
         gD/APAidPGJYKmfqNiU9GYaqy0bqoXT24SFlkiZ7C6LZbqZcoiDx6bc9EYtlzZHBQim9
         aJTg==
X-Gm-Message-State: AOAM531bb9tQseCSisCdOPAVVer2VGopRHBftZsqoJg9K8x2e6rjyZ96
	6LEwtN/SqWlfR0sEWdo4inzA5Q==
X-Google-Smtp-Source: ABdhPJz8E1nDWbfV4mbfRoY3al35xNeum8/2qRNlla3EFVSZrifGJQvaci0Mhz+NJJ12HfpGU7e0mg==
X-Received: by 2002:a62:84d7:0:b0:438:af8:87ac with SMTP id k206-20020a6284d7000000b004380af887acmr367871pfd.56.1631550169675;
        Mon, 13 Sep 2021 09:22:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d3sm7595718pjc.49.2021.09.13.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:22:49 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:22:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] Documentation: raise minimum supported version of
 GCC to 5.1
Message-ID: <202109130922.8974DD20CF@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-2-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-2-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:38PM -0700, Nick Desaulniers wrote:
> commit fad7cd3310db ("nbd: add the check to prevent overflow in
> __nbd_ioctl()")
> 
> raised an issue from the fallback helpers added in
> 
> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and add fallback code")
> 
> Specifically, the helpers for checking whether the results of a
> multiplication overflowed (__unsigned_mul_overflow,
> __signed_add_overflow) use the division operator when
> !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW. This is problematic for 64b
> operands on 32b hosts.
> 
> Also, because the macro is type agnostic, it is very difficult to write
> a similarly type generic macro that dispatches to one of:
> * div64_s64
> * div64_u64
> * div_s64
> * div_u64
> 
> Raising the minimum supported versions allows us to remove all of the
> fallback helpers for !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW, instead
> dispatching the compiler builtins.
> 
> arm64 has already raised the minimum supported GCC version to 5.1, do
> this for all targets now. See the link below for the previous
> discussion.
> 
> Link: https://lore.kernel.org/all/20210909182525.372ee687@canb.auug.org.au/
> Link: https://lore.kernel.org/lkml/CAK7LNASs6dvU6D3jL2GG3jW58fXfaj6VNOe55NJnTB8UPuk2pA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1438
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
