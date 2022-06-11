Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DA7C
	for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 06:01:02 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso4889122pjb.0
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3GFcFwqnFGmcRNmokcZ6QcxITcGcLvGSBnxe2xUhRi8=;
        b=IhYK9SJrhXq+qv1WiqB9FLLyFfKRj6/LONo25ON2I+xiq7D8kxxiuRj370SIb/01Km
         4gLaz5vOJBdR/vDD8jKvcf0cfGJsH0IormapMgd6vYFQTTxeSk0C9taU8BoZGD4Jj5fa
         4u6bRx3oHK3wCWS/+jm6BcndC/WKUqku29P2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3GFcFwqnFGmcRNmokcZ6QcxITcGcLvGSBnxe2xUhRi8=;
        b=f+DJ53G4na2FEzJ2NzSzxEStSJJ38eblrxOIYv9af0TXGF7yGzHjp8mqifhGiunvvp
         RM0s4w1N/8evs7GN8IAwZYPRsAmY+AtrF83Rc2otThMZ2tJ5ocCLVloREJG0s7LYfV77
         hDLrbvflqBOoEJ9Pu/XmFWJLWSUxNJXpktv6cE+vhEyO/+WyiUNvDdOTw3nLj+XiJY56
         G9X81EUfPbXQP9riApXCPxLDvzLnHmB/lcIJfKVPOnuH6VBLqDabTyfHjxN5eewqorVA
         DLdh/0NNlJ6DS3aQw8qgIA83ZZdpYc9YUxWi6a2uGZRweLlePc8ObninDBqg0XajYwsu
         RHZQ==
X-Gm-Message-State: AOAM533VIm2GLC9IAMhqPd5RANeR5HRWSg7TlxwQitp2CPG5XwgLvZs+
	WACoqJ0XyIuy9pkuAierdmlEVw==
X-Google-Smtp-Source: ABdhPJzinXa+z54InZrO9Ii73d7aTXsD66k55pj7PtXI/jz+hh/xNWPtX9cuYHlcPAVY6EjcgVgLAw==
X-Received: by 2002:a17:902:7611:b0:168:cb95:fd27 with SMTP id k17-20020a170902761100b00168cb95fd27mr1051867pll.126.1654927261517;
        Fri, 10 Jun 2022 23:01:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709027e4700b00168b4b550f2sm726508pln.54.2022.06.10.23.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 23:01:00 -0700 (PDT)
Date: Fri, 10 Jun 2022 23:01:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v3 07/20] lkdtm: Emit an indirect call for CFI tests
Message-ID: <202206102300.26A43F5D8@keescook>
References: <20220610233513.1798771-1-samitolvanen@google.com>
 <20220610233513.1798771-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610233513.1798771-8-samitolvanen@google.com>

On Fri, Jun 10, 2022 at 04:35:00PM -0700, Sami Tolvanen wrote:
> Clang can convert the indirect calls in lkdtm_CFI_FORWARD_PROTO into
> direct calls. Move the call into a noinline function that accepts the
> target address as an argument to ensure the compiler actually emits an
> indirect call instead.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
