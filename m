Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4972F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:54:03 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 137so10681259pgb.5
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gDVhI2zku2qZKvaq49DPvnyS72Uf7FU9KhCkFrjajU8=;
        b=S1011jnyYAkqBEEDMxT9syvIhh2zSvV8Zkh+bBVbAiJUkWvxnx5G4QQmkCufpwGOcQ
         /VZM22i7sKGtdqrpwsp9Ytbo3kro9y+f2Y0MIR5yMMRIu0uPZUtRoPywyBZYtRbMJDcu
         uQQpImYc+cjK3PovHb0YXltkeyKprRSzXdKAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gDVhI2zku2qZKvaq49DPvnyS72Uf7FU9KhCkFrjajU8=;
        b=qT/+X9WwpxRTECRSRGUQ2FmsvIA/J4Q4RlldhqjbqrO/FJM9dbrJJfwRVdz+Zoq/FL
         BGumFpXGFfktQS+NRfSEjeWvGTUnmysfkkiYvS3OGSnwgzwQOPO+JIpYXN97gs6l87YT
         OciS1SCVm0cEFIf/Der+L4jN1yv32Fce4bw78ZQ9U/5XsHNmXMXWGBIFpwotsKGixG5G
         NtIYIapbY66cZi58AA9i8dwb9EfUL2bGhfzlI5owKNUmkY7KeX+cXQVJcH6M0P1d/I4o
         RUupWD1Gv07WrcWAAlUcsuRAlLVrWUiQz6wABEBGKjiDESpH/5W8yGbBIjsR7iJj7p3y
         2lIg==
X-Gm-Message-State: AOAM531b/5Bc1g5BnE82cVQdqlTDhm27QWcNGVk59xeBhS1mmv2EcbKA
	JjwKrL2o8UAMLry0t5IcwnrRuA==
X-Google-Smtp-Source: ABdhPJy8U7RbEud+2dU/6vQphGcmECzPHMeX+WfFdiNBbxRS9BySOYWWpcCZo0DnGxsttLazJB4nAg==
X-Received: by 2002:a63:f046:0:b0:3c6:a37b:1613 with SMTP id s6-20020a63f046000000b003c6a37b1613mr9503013pgj.168.1652565242585;
        Sat, 14 May 2022 14:54:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b7-20020a170903228700b0015e8d4eb1f8sm4186116plh.66.2022.05.14.14.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:54:02 -0700 (PDT)
Date: Sat, 14 May 2022 14:54:01 -0700
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
Subject: Re: [RFC PATCH v2 11/21] arm64: Drop unneeded __nocfi attributes
Message-ID: <202205141453.44171359E3@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-12-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-12-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:49PM -0700, Sami Tolvanen wrote:
> With -fsanitize=kcfi, CONFIG_CFI_CLANG no longer has issues
> with address space confusion in functions that switch to linear
> mapping. Now that the indirectly called assembly functions have
> type annotations, drop the __nocfi attributes.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

It looks like there are still other cases that continue to require
__nocfi, yes? It looks like after this series, it's still BPF?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
