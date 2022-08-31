Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD2613B
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 22:04:22 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id c66so5470829pfc.10
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=eXEYaFnP4mOKjstNFujmxTiRRJjn9XYWqPXOjFo+1fQ=;
        b=S/NcZDY5SZ6CRMmy+D6KjP0bTurAvGghafOwYbc+nw/dwS4ozUP9sQwnkdU2qYD+X1
         8UMSc5iO5Qk+z++YNmfVFYjUcIBjFchohVKc75j5HUMkRFDUetf4U6l4sH4tLuN2RSPS
         ffiBV5V5SggAAOzfGOvkiCIpVaWQVrpea4yF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=eXEYaFnP4mOKjstNFujmxTiRRJjn9XYWqPXOjFo+1fQ=;
        b=2AHDEyAq7ri5gGCZIVks4szAkIsvnDWZVpb1tVzP3ew57kEWh/TW6CCNK99y6+74HH
         TNpcMC1Tsb34XVjIiwS3ubKjhyBcFTvIRzdDMflNne5YPiQ7MFtcODsxA60s6SMPNrI4
         47DeDLpFmsmoy62HJVFiFUTTqqgTEvUyNg9/MSqj9TL5PPJDvE6dCGMxFHZKOFroMcms
         q/nvYPh7QJ0ljoLeWKIOVW30SGdQ4LLtCkbQVDWyM+x38TilF7b5TVcgjgOC85QGrxpS
         YLjcHfAzBYnsqwAukL0aKYxkDw4BdB2cb0isKwq/5ErzC/57++eLA1rDvcktf4z6ycLW
         U6YQ==
X-Gm-Message-State: ACgBeo1moZNbcFArdCMhUB5HggbYGkxzBOEGKI2EX01Jj8ldZnpkGNH5
	nQamRSCWiGhmy4VxDlEKdMAdXA==
X-Google-Smtp-Source: AA6agR5Zz4u2SM6bdRyYRSBSx8G9I+mIKqnLqni5bLKs1f95ZDZtfZ5SgHlRdwxyL0X1H+0S1pMqCg==
X-Received: by 2002:a63:88c3:0:b0:42b:33f8:6bc2 with SMTP id l186-20020a6388c3000000b0042b33f86bc2mr23258567pgd.495.1661983462486;
        Wed, 31 Aug 2022 15:04:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a14-20020a170902710e00b0016d150c6c6dsm11999017pll.45.2022.08.31.15.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 15:04:21 -0700 (PDT)
Date: Wed, 31 Aug 2022 15:04:20 -0700
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
Subject: Re: [PATCH v4 00/21] KCFI support
Message-ID: <202208311503.62B2C1BC@keescook>
References: <20220830233129.30610-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>

On Tue, Aug 30, 2022 at 04:31:08PM -0700, Sami Tolvanen wrote:
> KCFI is a forward-edge control-flow integrity scheme in the upcoming
> Clang 16 release, which is more suitable for kernel use than the
> existing CFI scheme used by CONFIG_CFI_CLANG. KCFI doesn't require
> LTO, doesn't alter function references to point to a jump table, and
> won't break function address equality.
> 
> This series replaces the current arm64 CFI implementation with KCFI
> and adds support for x86_64.
> 
> KCFI requires assembly functions that are indirectly called from C
> code to be annotated with type identifiers. As type information is
> only available in C, the compiler emits expected type identifiers
> into the symbol table, so they can be referenced from assembly
> without having to hardcode type hashes. Patch 6 adds helper macros
> for annotating functions, and patches 9 and 19 add annotations.
> 
> In case of a type mismatch, KCFI always traps. To support error
> handling, the compiler generates a .kcfi_traps section for x86_64,
> which contains the locations of each trap, and for arm64, encodes
> the necessary register information to the ESR. Patches 10 and 21 add
> arch-specific error handlers.
> 
> To test this series, you'll a ToT Clang toolchain. The series is
> also available in GitHub:
> 
>   https://github.com/samitolvanen/linux/commits/kcfi-v4

This happily runs through all my initial testing hoops. :)

Tested-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
