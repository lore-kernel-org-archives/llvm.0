Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E093FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:21:40 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id g184so9931184pgc.6
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IKFED9y0v7w+FhMaqd2QIA2eUP5bCbT2SCT49mPxoTQ=;
        b=HCLOGlBq7MF6o8jKgFWWRIU4KSTMhQLrYDiW6j7kEwXvWCbDnQATyXEIJYuLlqQRHk
         XFChA0ly+uvX8gd7pXobRS1fKuuS++LPbjPsARkcV9BEH4GJGJn2aZ6+TqpJs38pHdSX
         r+EpLKHBGSfIHj26xJPcEBL12cZM2JRiScAcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IKFED9y0v7w+FhMaqd2QIA2eUP5bCbT2SCT49mPxoTQ=;
        b=0CVgOTVhnMmncpTW0zYYkVaPPZF6qptnLc5B8o15BcvCZf5wniG0lC7f/0DxNaer9O
         YzsG3ZNysMSvNcMCHwC91EwdnGmTkIRbIfDsZ2RMc6KDbkgczyLezgMUQmsV+7mHUIfT
         q5Sxw4O4FiiFjVYR7tBmgx7OZNJbH3vDgRQE9htln8OrRADll6Q/MIVwqkLJILRPO0LS
         /nsII8czN45fzi9JKTsOU+fH3MGSQHvi/LoOId043d7DwIWDIor4j2/kJyp8RWru0g/M
         H3SHUUYzQXOTKsWJQ9EMqvb+9oP7u3nqWkHeSPl3wYvVWMTmXjPiYeYbuIZRG2JnrUwn
         YV6A==
X-Gm-Message-State: AOAM530i7gZRcFZTVAJuH9iymBHaYj1x/NLUWzUixArTiyZom2rrNNYj
	LMp8XQRib7Z3uRfp3WPSgbZnDw==
X-Google-Smtp-Source: ABdhPJxnGP1kflyzFYPVzBgUMBLquG5UxHgd7HMXFZ68h+oy5s9G+QJ8KqObmwV16Y9egJHSVzwwtw==
X-Received: by 2002:a05:6a00:c3:b0:43d:e6be:b2a6 with SMTP id e3-20020a056a0000c300b0043de6beb2a6mr261966pfj.34.1631550100562;
        Mon, 13 Sep 2021 09:21:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o6sm7514071pjk.4.2021.09.13.09.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:21:40 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:21:39 -0700
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
Subject: Re: [PATCH 02/10] compiler.h: drop fallback overflow checkers
Message-ID: <202109130921.D423C72@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-3-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-3-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:39PM -0700, Nick Desaulniers wrote:
> Once upgrading the minimum supported version of GCC to 5.1, we can drop
> the fallback code for !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW.
> 
> Effectively a revert of
> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and
> add fallback code")
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1438#issuecomment-916745801
> Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

With Nathan's comments addressed:

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
