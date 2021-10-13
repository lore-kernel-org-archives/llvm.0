Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10062C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:06:00 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id om14so2958435pjb.5
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nXWn+C65G2sncjtbdtLGu+sNNu6Ws1SqzBL/4RC9QLU=;
        b=erKHCPbwnNJ+dbqyPQbIehybLasan69a6yMxEWXzryT+WjIUFwYywkEcbu3sK2q+sy
         B4xybss34Pz4s5MJQv6FtWcW/s4zV23O6TAK3lHCVve6FUWq6ON/yXJ7bVJmDYQv+KnY
         mvgU1s3Cf/SkHLYm5h2XUwvQO6CkkSvIVSm7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nXWn+C65G2sncjtbdtLGu+sNNu6Ws1SqzBL/4RC9QLU=;
        b=pK9jQsS+sLAV5cLavhcktvHQ+a3771pddoq6MXS5KWmXX/urDq1pI4E8mEue24Z6+N
         zMl+GnL1tCu1zDXLr4WiWLjDpwvLDCxt8W1bCgqn1DdDaunVqtJLIEJ0EKoV58uX52Vt
         l/qW500cnPg7QxjuwQqKQJVztVIzXXNSCIdxtUrGc0wbCyqwoWFiETCCPx8vbsen9/Hb
         yKqnbcNGuT+tb83a1djmxxHrV/TdZQLEC5M6vRsG2oGptvCXn7tEoq7Tipxb7Wk2OlkC
         9zi2ZgVLBJZ4UH15W8JtJ7dLyeZSzF3Tx5lbK7eryEbOxVs2ylJLzGx5QX/wPewCtSMi
         qc/w==
X-Gm-Message-State: AOAM533zEC9uM/1gb7QSRSnLbqfObvlg84rdeBeH8Dn6hD2IOAE5Yr6a
	/CAOpE0a4z550kcpdCT/ze3dJg==
X-Google-Smtp-Source: ABdhPJxDuBX+/M7L1lKdmAL5VUL05XQ8QINY1cDE3k+ssDyXnVzf+flLTDS1Ptu7vFglJAdHNPg/Tw==
X-Received: by 2002:a17:90a:708c:: with SMTP id g12mr15274111pjk.13.1634151960400;
        Wed, 13 Oct 2021 12:06:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o72sm235042pjo.50.2021.10.13.12.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 12:06:00 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:05:59 -0700
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
Subject: Re: [PATCH v5 10/15] x86/purgatory: Disable CFI
Message-ID: <202110131204.9978A005FC@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-11-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-11-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:53AM -0700, Sami Tolvanen wrote:
> Disable CONFIG_CFI_CLANG for the stand-alone purgatory.ro.

If there's a v6, this commit log might do well to have a "why" added. I
assume it'd be something like:

... because purgatory is not running with a full kernel mapping with
jump tables, etc...

Reviewed-by: Kees Cook <keescook@chromium.org>

> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
>  arch/x86/purgatory/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> index 95ea17a9d20c..911954fec31c 100644
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -55,6 +55,10 @@ ifdef CONFIG_RETPOLINE
>  PURGATORY_CFLAGS_REMOVE		+= $(RETPOLINE_CFLAGS)
>  endif
>  
> +ifdef CONFIG_CFI_CLANG
> +PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
> +endif
> +
>  CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
>  CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
>  
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Kees Cook
