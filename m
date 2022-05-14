Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE72F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:49:38 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id h24so5367505pgh.12
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s6gyFIzNx3uPs0E9QTdHeabUUHOLCiS5BRmtEkTrJ0M=;
        b=c7bt5Yyim6jXKVU+nad9I6JP2/SU4szhm6beG8K9aijDODZgSy0Agoa/TRIPhM8F1M
         rmYwZd8/LYOr0N85MfiL1hP82YXqGevzNXXADwKiS+C2Z1EidmmFYt0rEWxDNpDTeDfz
         isXaa8uHnFoI1HAe6xmc8AxSjWofOHnUnKFTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s6gyFIzNx3uPs0E9QTdHeabUUHOLCiS5BRmtEkTrJ0M=;
        b=zuaKyOFPMsoVch7Ax/7qmL5K39iQW8MIYxhcer0l+8ZDpipSJg2iZX8B5dg7SlGj5l
         oiJZApFVpTW1/F9Mlc56OQAXbuxUWo7mffk/kiJyh+DFGjX3pIZ6V1fHUXMJPGJJtDFD
         0fKhbVwQU4xp6mHi0PVuAJXmYsorJbdh4COfT5oPqf1TXkmSkvQVAOrXTIzdAL7gjRfr
         W8qzsat9yk0sFCIe5XrMiyI4dOvBQiHucQp0v/loRAqKT5ltkyvoVBI1LvGOmH7Ijz3D
         lVTbDsRpEvpSTsZL82LEXzgQlOTPXDUWzqOwLhNdFggPtuhVuRt7VkH3+MoQraYRqCRc
         TVzw==
X-Gm-Message-State: AOAM530yTHb141/VScgE7j7mBT0j6K4V7eebyzy3LMzqSkzg7P+SAubY
	+SoPd5w7e4dy4iexU6KSxRcMJQ==
X-Google-Smtp-Source: ABdhPJwk8CcBX6QnXuAE6iXMXjeE8Vq7UImMhCQwh4Vg8IjNOXTMawTzaFXfXJRgS9HCVdGKlVDekA==
X-Received: by 2002:a65:4ccd:0:b0:3c2:428d:d13b with SMTP id n13-20020a654ccd000000b003c2428dd13bmr9330640pgt.425.1652564977729;
        Sat, 14 May 2022 14:49:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902ff0100b0015e8d4eb26asm4114685plj.180.2022.05.14.14.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:49:37 -0700 (PDT)
Date: Sat, 14 May 2022 14:49:36 -0700
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
Subject: Re: [RFC PATCH v2 07/21] cfi: Add type helper macros
Message-ID: <202205141447.E3B5A29@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-8-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:45PM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, assembly functions called indirectly
> from C code must be annotated with type identifiers to pass CFI
> checking. The compiler emits a __kcfi_typeid_<function> symbol for
> each address-taken function declaration in C, which contains the
> expected type identifier. Add typed versions of SYM_FUNC_START and
> SYM_FUNC_START_ALIAS, which emit the type identifier before the
> function.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

And the reason to not make this change universally (i.e. directly in
SYM_FUNC_START) is to minimize how many of these symbol annotations get
emitted? (And to more directly indicate which asm is called indirectly?)

What happens if an asm function is called indirectly and it doesn't have
this annotation? (Is this case detectable at compile-time?)

Regardless:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
