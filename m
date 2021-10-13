Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363A2C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:00:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y7so3307565pfg.8
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F9f/KoKd1hYZKxslXq7WYINWiftBc0Y2sa1qu99T4yo=;
        b=mznZm6aoTrn+9fmofOmEJxUdlsC0Ctd7RPfZuHr+oV2pinF1avA3HeOGLaH6A6b4xf
         ytNOOHFFymuO6pfIhcnhuDEO+nLtOaVw3INU1sOGj/wAk3S6+DF5YTPn3x2QUDrwmS1W
         PE8YGtuj0YjAyg+6srty0MCMuldh1p8C/EXOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F9f/KoKd1hYZKxslXq7WYINWiftBc0Y2sa1qu99T4yo=;
        b=gfTztpQU0KQl+Aav3nWvJrgt6N3NTqqUzrRsLU8R2HD0XhB7ZE1Gzn3wUH4kl/HIpx
         hTM3lhXKwrpdXBTUNuSzZk4phsiqPLirKW/5jAWrNVLvjMhypnOZ/y/iRFHkpINcOZX7
         uAtuOXzB7Yq30nW6GvPNdaOWVEpq2WttDaZSJ20c8FEFxIRWxOJRWRszAGV8JMenA4N7
         768eCuTC5AzFyme2wjGLG4LOvCveQ+8xkGMt/v9HZMVWwF3nA05W89pGsGXNN7DYTD0v
         sCU+tRU22ENi6aaYkJWQjjiTaVRUwrm8jvYvTfmqTJTgGqbGGz39kYqpXrwOq5yHfd4P
         O9uQ==
X-Gm-Message-State: AOAM531b8Wn8LNBwFqv47rwV54LRnETcPXVyu14yegH+t0gwxyRAhGxW
	U7uElraTXb+CsIeZDJXVtBY3MA==
X-Google-Smtp-Source: ABdhPJzUxjWaPArdV/xc7rIFZrQW7VAbqqTyu8rROiGa4ohhyF6E9ngm+I7Cpkn/tSAsBuHJwGbm2w==
X-Received: by 2002:aa7:93d2:0:b0:44d:4a13:5267 with SMTP id y18-20020aa793d2000000b0044d4a135267mr1075576pff.52.1634151600316;
        Wed, 13 Oct 2021 12:00:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u4sm239110pfh.147.2021.10.13.11.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 12:00:00 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:59:59 -0700
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
Subject: Re: [PATCH v5 02/15] objtool: Add ASM_STACK_FRAME_NON_STANDARD
Message-ID: <202110131159.1A0BB2876@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-3-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:45AM -0700, Sami Tolvanen wrote:
> To use the STACK_FRAME_NON_STANDARD macro for a static symbol
> defined in inline assembly, we need a C declaration that implies
> global visibility. This type mismatch confuses the compiler with
> CONFIG_CFI_CLANG. This change adds an inline assembly version of
> the macro to avoid the issue.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
