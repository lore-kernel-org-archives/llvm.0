Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD22C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:04:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 21so2454383plo.13
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aGF0syKET/14pAZ283IwwssrcdQD4oceHIsj+/z6tks=;
        b=LnqQnYl3SGc8N9da5oJ7HSa9JQluc0g0UMXaBb59l0VvGm3rZTsDEJ3cWkzZmxjid/
         YJNnC+reIBHb27GLFgvmXO/GujmCskpdflq1rRdb/vMqb8PA26FHlXzR+mnQSz8fnRGI
         UrA48mlhSXLYQxTJEcuJCIvV3bQ4XLqFKLR54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aGF0syKET/14pAZ283IwwssrcdQD4oceHIsj+/z6tks=;
        b=ciGdmQ7q9uhMjFz8FSGlcMm/36JxF8aBJmNpBASzFaRqF7YmIShjvYSUgOa2yuNnqc
         8reiVt1Qit0YbpbgY+oii/Z2eWvk/tZYgZH7i5ThjdOpLmC9niYbEO69Dq1fsyxWZNJT
         sRtiVWE2XJAtFalvosAcwd80+iqzxQpSoz0HMgcYTxWIwDDIR8xmvSJ5ZYvXkYOxrlz0
         Xki5J2tlIm/cxci5eDpqYCBDNvQ4EsRGioov9rSkZtOrWZ76AZws4RUwbljGMjEOJ+mG
         XptpGo4NszDvU94yOL3nq9UF3h0ghDBieOA88/G6y5uqekFZ06ywmAsA9yftoPvtDrBV
         VbOw==
X-Gm-Message-State: AOAM5301UIc3VG+iB7AJ3Vhu8c+14OmciEGjXYPDp6etQwAI/WlPG8MD
	1D3GKt5wA0yYnIuaxtFfOW3jEQ==
X-Google-Smtp-Source: ABdhPJx5pfyX8v7LhaYjRI5CoTPdMyHqAmlRIlZV4O0fS14bFrkrUzbhDoAM/N5JvBN2YmHRPA8MzQ==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id mw11mr1137541pjb.135.1634151848679;
        Wed, 13 Oct 2021 12:04:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l4sm248494pga.71.2021.10.13.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 12:04:08 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:04:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 06/15] ftrace: Use an opaque type for functions not
 callable from C
Message-ID: <202110131203.2BA230B8@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-7-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:49AM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler changes function references to
> point to the CFI jump table. As ftrace_call, ftrace_regs_call, and
> mcount_call are not called by C code, but are trampolines injected
> as calls replacing the nops at the start of functions added by the
> compiler, use DECLARE_NOT_CALLED_FROM_C to declare them.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Looks right to me...

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
