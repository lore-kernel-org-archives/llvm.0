Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11866468A
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:22:56 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 78so698849pgb.13
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=I/i5jIe0pyAtTiwLTepRVRpt6gmHv8ChBfodrmmozEo=;
        b=eSmUjyzYgre0PZ1K00Cfc8tvsDugBnadfNSIUOuoe+VuxkBIDN4sFvali/8YxpY2Yy
         JIo1eombL289lhqWvm4w90+7iwbQTGS8DQI4bTYvXQ2UGf4oRT2v6ha0ViH5ugWvQM94
         yweXGcDiRcyk17EsCOuWNdrpHURxwoyHfpaC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=I/i5jIe0pyAtTiwLTepRVRpt6gmHv8ChBfodrmmozEo=;
        b=zz8CLVWfYy4r4O6fT0r6AeXYk8KlfbTl+gjcoiBKZ4HqYB70fgZxidspFDXnaTZPmR
         /MhYtoQkVA73ZIyWZvi1xo/5VFN8L+mkjMUWHacMxggZf3b0QwRSmvvu6sr+Oohm8h17
         4WJcl9EN5gEwWUoIxeW1DzXKyfLGGmxFeCn7+kFyVr1WVBteNRrJBBOJ0mHEOrXlkwvN
         STfkuIdh4+SuG4XWmHQznGs+XCStNlTYhh4iFAR5G6uBdPq6tjM7rvqdcunFuDbbCWIP
         +UbgxQxMhnUhwGpUfuD/rxjVe2nCkbQpKTmdbL/hD3b7ltMA1rw8eCgTSCP9/wOoQRN0
         Odpw==
X-Gm-Message-State: ACgBeo3Jo6zVqT2icU5szAsfq43pmMvT4YPfmVpqsDKJWCOFU24Xota8
	o800k8XderoHsucOW5l+DRgECA==
X-Google-Smtp-Source: AA6agR4SBpLEuXeN8GNzl9PJ01BUjf3qaampgOd1NHZi1cFWVwtFCQRkYKzxOrJcywDgmWTUMxK8Ag==
X-Received: by 2002:a63:91ca:0:b0:42b:4847:90dd with SMTP id l193-20020a6391ca000000b0042b484790ddmr22369351pge.28.1661970176454;
        Wed, 31 Aug 2022 11:22:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z15-20020aa7990f000000b0052c849d0886sm11627704pff.86.2022.08.31.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:22:55 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:22:55 -0700
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
Subject: Re: [PATCH v4 08/21] psci: Fix the function type for psci_initcall_t
Message-ID: <202208311122.FA0ECD5782@keescook>
References: <20220830233129.30610-1-samitolvanen@google.com>
 <20220830233129.30610-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830233129.30610-9-samitolvanen@google.com>

On Tue, Aug 30, 2022 at 04:31:16PM -0700, Sami Tolvanen wrote:
> Functions called through a psci_initcall_t pointer all have
> non-const arguments. Fix the type definition to avoid tripping
> indirect call checks with CFI_CLANG.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
