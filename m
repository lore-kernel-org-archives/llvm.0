Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B913FC3
	for <llvm@lists.linux.dev>; Sat, 11 Sep 2021 02:19:51 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id k17so2326284pls.0
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 19:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8EtnMLMiIHFJFlHVYJRwro8IIw7R7Mbb5z4Gwszkp08=;
        b=BbotpxrciNC6SLvdNT0vPAdnHOozYpyuu22S0J6+K2/O8L53liWOZknXR9DBQDQ2PZ
         DKRakMqGivp6SZgZNJ2cEoN6fALWQ3mfW6bZp7H3RDlqwJFFUC2FHks34P+JiYgPE4u4
         4GQrBSH3MyNE0gz12/vBib3BIsm7m5bVLabbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8EtnMLMiIHFJFlHVYJRwro8IIw7R7Mbb5z4Gwszkp08=;
        b=5PLE/UYdeouECJmX3PyZLdlb55xulpmY5hkIb8nLMxPUuS5yf1f/I+KWK2qHxmUfYo
         lEAeJvoqh0S7Vh3pj1j9BWPKRXbW5cJS8J6ysLOOfN4Jg3NxbFBjWKCgR+zZXrpz0I0S
         KqHdGOIHHEDL8XvKMeStWI/tm6zuqTrpfu8vvyMUrKR32J54aG/0tW1RTuNiKd9KODVq
         gtF4ehYLSRkrY+woGpzrTBknNF7HKz54LEi6Apk08T4MfLnA2cyEy69Y/+Zb/gyY1/iA
         Z16EnYo+HIoSpdAtZa6FsXtGpcMHza/OBpsQhsUHys6Hulol4GX33D7v2Y5s1ClNSc7o
         cJFA==
X-Gm-Message-State: AOAM531LG2REU/rAbw9EfJJn6WlC3XfGNkaygmahQ0mfJ4C5gDE+ZlkK
	rCm4UHA5uZsPIBylXlDMBCSqUw==
X-Google-Smtp-Source: ABdhPJy/InJUYPMpMexX3Psdt1AmnK19JNfdvpcE0XYYJRXi/47uXSBR/fUN+csumHsnFG1R3G06qw==
X-Received: by 2002:a17:902:db01:b0:13a:7afa:f9b6 with SMTP id m1-20020a170902db0100b0013a7afaf9b6mr607405plx.43.1631326791529;
        Fri, 10 Sep 2021 19:19:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e13sm175429pfc.137.2021.09.10.19.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 19:19:51 -0700 (PDT)
Date: Fri, 10 Sep 2021 19:19:50 -0700
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
Subject: Re: [PATCH 00/10] raise minimum GCC version to 5.1
Message-ID: <202109101917.5BA95B87E0@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:37PM -0700, Nick Desaulniers wrote:
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

Given that it's all compile-time type-aware goo, this isn't so bad. The
gist[1] you linked off the bug report is pretty close. Needs some
bikeshedding. ;)

> Raising the minimum supported versions allows us to remove all of the
> fallback helpers for !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW, instead
> dispatching the compiler builtins.
> 
> arm64 has already raised the minimum supported GCC version to 5.1, do
> this for all targets now. See the link below for the previous
> discussion.

That said, I'd much prefer raising the minimum GCC -- no one appears
to actually be building on 4.9 -- there are close to 200 errors (neé
warnings) on x86_64 allmodconfig there currently.

-Kees

[1] https://gist.github.com/nickdesaulniers/2479818f4983bbf2d688cebbab435863

-- 
Kees Cook
