Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D9174D0
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:29:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b8063aa2e1so12758425ad.1
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149771; x=1690741771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZJJetuBbyHmtx8DbYztgxxDQeL5eYQA+7KCOoIY7rU=;
        b=NTgXSX4MGPhVE5xJegfe7GAIBLJ+GvIVJ7Wml0XsL2a75vwQmUVfExZ2I06bGaGF9O
         v//z0xnkr0vWAc3fDGEBV2jow7KGwqiMkqB9Z5Qa2Cdj/3nTEJaIu1Z1a9ivXbaXXeyF
         U+vxM2e9YP/FAcJMJJwc0PXgLXrCdFk62i3/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149771; x=1690741771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZJJetuBbyHmtx8DbYztgxxDQeL5eYQA+7KCOoIY7rU=;
        b=fuJR24P/dNS/YGuRWrHSwc7jfhsVLZ8V/7Z5bMVEJQuJzzGYlldU9vINL23okuGHGn
         NNavBiwgbvDps7zy0FCJ2i64sv17OHrvO1lqNmcnHsFQZZ8qv11r6uNGg15k4tq+WYxZ
         6lOfsqra+mZCxQnfxqXv9pO/ZYtN5yIM+Zwkuk+uVugFV+FHW8C4xGWUnc9Fy30tkPHL
         CH0OH743pLoe4HNHZa4g4CfumJ5y8oCvGfymhaNnAGfEN2jlb98MNhhH+DZN0PZueOQU
         ScsZrG2CLrSyi8lRQvSCdpcEH91zZ9MYyk/tgZzrmbyOJJBQIP9Jtww8wkoHN+bYiwEL
         eueQ==
X-Gm-Message-State: ABy/qLZBucVU82al3mk7nvoQi3gMl125tIUSVi9HN22dncqFnYr46nzP
	FE/1Q4UO1fJWwq2vk2EPqTZOUw==
X-Google-Smtp-Source: APBJJlHRIfSrA0ELcRqMElCfSir9t+tI7qwmR8a7LbQqmrfHbBBuUV5GDWvDH/xmKUXnXt5EqKOncw==
X-Received: by 2002:a17:90a:f484:b0:262:c414:e0af with SMTP id bx4-20020a17090af48400b00262c414e0afmr2635720pjb.31.1688149771151;
        Fri, 30 Jun 2023 11:29:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090a744600b00262d9b4b527sm9935978pjk.52.2023.06.30.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:29:30 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:29:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] riscv: Implement syscall wrappers
Message-ID: <202306301128.E8B5E51B5@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-9-samitolvanen@google.com>

On Thu, Jun 29, 2023 at 11:42:46PM +0000, Sami Tolvanen wrote:
> Commit f0bddf50586d ("riscv: entry: Convert to generic entry") moved
> syscall handling to C code, which exposed function pointer type
> mismatches that trip fine-grained forward-edge Control-Flow Integrity
> (CFI) checks as syscall handlers are all called through the same
> syscall_t pointer type. To fix the type mismatches, implement pt_regs
> based syscall wrappers similarly to x86 and arm64.
> 
> This patch is based on arm64 syscall wrappers added in commit
> 4378a7d4be30 ("arm64: implement syscall wrappers"), where the main goal
> was to minimize the risk of userspace-controlled values being used
> under speculation. This may be a concern for riscv in future as well.
> 
> Following other architectures, the syscall wrappers generate three
> functions for each syscall; __riscv_<compat_>sys_<name> takes a pt_regs
> pointer and extracts arguments from registers, __se_<compat_>sys_<name>
> is a sign-extension wrapper that casts the long arguments to the
> correct types for the real syscall implementation, which is named
> __do_<compat_>sys_<name>.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

This all looks correct to me; though I have not run tested it. I'm glad
to see another arch using this style.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
