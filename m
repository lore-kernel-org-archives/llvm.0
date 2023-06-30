Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035917724
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:25:14 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3909756b8b1so1319603b6e.1
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149513; x=1690741513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kyMHPqgFkqrCLjrfJwzZAICfyuA66R9v5BF7rbPVGX0=;
        b=MI6CfwF1+eJVWXjXK7CR+OIYgxY+N1GRO+e/xgPwtHEJQyPVUhxTk4Y9C54iU8f0+z
         ay/X77swuw7F68CSZe5aL5aiwPsTPwx6br1922syGJNYPEN5svfu2HZEuxh00cN7w1Zw
         pJ3JDDUxLmza1gMe7we3AVEIN1nIvxAnZhTDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149513; x=1690741513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyMHPqgFkqrCLjrfJwzZAICfyuA66R9v5BF7rbPVGX0=;
        b=SkFHnTITgyFXmRP8EqVDi6Wt1dJC3M0+yHGMUEo6ocBhdlTxGk2yh2OWkuksG0qGCf
         WMT09SuXDYPZ6+qAsLO3/8rhnkfxQgP5AMxiRa9s3D8Fk854IE0zLaS2lxZJAWjFEG7c
         HxFRHqwZ0Lp+p5xhiyRt6YpS/7+YOSkRx1lFVXyUasp2G0MJDOd1IssnXqzbb1mgcg+i
         ME+ugIKtllZ5KJuO4DCJtpGNrxSO085bh5yIhh0X1Vhn0+RqNtm0N+pQr3TjYiTNaUk2
         rQzoOmgF1gsCgjTi2tEXmtgJk/TUFhkDXm20Npb0F5hipwd245qSTu2c3Dzo72OZT/vl
         +POw==
X-Gm-Message-State: AC+VfDwYBEBGGjHiHPytiNpjXYBTFxdhH2CFVYncNxp1jz7+L/3YkXsj
	JGxNEYLhi3aXQkU9ZqqOyRE+ig==
X-Google-Smtp-Source: ACHHUZ4eIjI6ILzn5IHdnhn6/8uGaeOlIGsrOXUs9ILUhXM6HRgK78y9vpFuktGOCts3Mvge7PXhPg==
X-Received: by 2002:a05:6808:1b23:b0:3a3:6113:ce79 with SMTP id bx35-20020a0568081b2300b003a36113ce79mr3297214oib.40.1688149513722;
        Fri, 30 Jun 2023 11:25:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fe21-20020a056a002f1500b0066ebaeb149dsm9530556pfb.88.2023.06.30.11.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:25:13 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:25:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] riscv: Add types to indirectly called assembly
 functions
Message-ID: <202306301125.B58257BE4B@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-10-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-10-samitolvanen@google.com>

On Thu, Jun 29, 2023 at 11:42:47PM +0000, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, assembly functions indirectly called
> from C code must be annotated with type identifiers to pass CFI
> checking. Use the SYM_TYPED_START macro to add types to the
> relevant functions.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
