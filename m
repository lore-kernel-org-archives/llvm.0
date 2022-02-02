Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E162F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 20:53:24 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so7960747pjj.4
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 12:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ETnKDeiOpwbtdI5wfgwyS9AlH6EKFDBz28cAyBq176w=;
        b=Z8n6/iQ6Ng/iumDQGn5Zu/vWC5/7pLHgLzDZnJkpoNCssZHWsOx9eC6Sb1V2fJCNzQ
         6/0govRNCPerrev9lxboz2wl/wAoCyKRc90QsEnQWwXUMfCVwjCe3hu60jurrl1OatSt
         3NHG35dR73JSUUn6+43aaOaaymCDSFhkt6Gks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ETnKDeiOpwbtdI5wfgwyS9AlH6EKFDBz28cAyBq176w=;
        b=CvT352EkPLWA7sioGwFTWLz05ZJEjfaUUr1J7z06MfbgDV+rLg2u079641K5vYmiQK
         LgYiSogj/zG66pkH8XmujEopIleLIkKm25rb79WZSqO7GHG99euo5ycASExCzuAwXGE2
         Gn13LGBBIi85QRGPmFW8qkwO/8miH3aQJfvpKOfcsw3QAImMmNyHnigdrfff+jK946H3
         XRqRv3QC9Nuy1WiD55jnMO9JQstJtEoCzrJDpOofE4m5PcZalpvWdLyL8qMXYi5LJhMO
         5nPB9hJJORywxEAs+VxDDb5L0pCk9QShCwya75tIpbQq49hNrOA+VFoGo2OPv8WllD3o
         D27g==
X-Gm-Message-State: AOAM532OOcnr/0K4SbQYzUOdTX9rghLYJTvGBOp+ER7YlBsFrhO8yjHI
	Frs+fJUrKOYQ84avgFCASi07NQ==
X-Google-Smtp-Source: ABdhPJysBLPSxyD4Zj/4RBqUVky3ecL5kEsRiYnlSK96emSeDBQdAUZPYWpHfccyeJDtLUzp7z6b/Q==
X-Received: by 2002:a17:90b:1912:: with SMTP id mp18mr10098907pjb.152.1643835204425;
        Wed, 02 Feb 2022 12:53:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p22sm24518460pfw.139.2022.02.02.12.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 12:53:24 -0800 (PST)
Date: Wed, 2 Feb 2022 12:53:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] include: drop pointless __compiler_offsetof indirection
Message-ID: <202202021253.B62C357@keescook>
References: <20220202102147.326672-1-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202102147.326672-1-linux@rasmusvillemoes.dk>

On Wed, Feb 02, 2022 at 11:21:47AM +0100, Rasmus Villemoes wrote:
> (1) compiler_types.h is unconditionally included via an -include
> flag (see scripts/Makefile.lib), and it defines __compiler_offsetof
> unconditionally. So testing for definedness of __compiler_offsetof is
> mostly pointless.
> 
> (2) Every relevant compiler provides __builtin_offsetof (even sparse
> has had that for 14 years), and if for whatever reason one would end
> up picking up the poor man's fallback definition (C file compiler with
> completely custom CFLAGS?), newer clang versions won't treat the
> result as an Integer Constant Expression, so if used in place where
> such is required (static initializer or static_assert), one would
> get errors like
> 
> t.c:11:16: error: static_assert expression is not an integral constant expression
> t.c:11:16: note: cast that performs the conversions of a reinterpret_cast is not allowed in a constant expression
> t.c:4:33: note: expanded from macro 'offsetof'
> #define offsetof(TYPE, MEMBER)  ((size_t)&((TYPE *)0)->MEMBER)
> 
> So just define offsetof unconditionally and directly in terms of
> __builtin_offsetof.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Yes please. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
