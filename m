Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE62F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:43:04 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id c1-20020a17090a558100b001dca2694f23so10857844pji.3
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YlRFKx1f5LgxGYiRBStshQO2lcl0shwRTsz4d5msIg8=;
        b=eVJvq+ghFVgsLl2S9H413dqQTj8DyyaMX5Lri0ldevwz5nr6Vcgdxe0+ij/LV+qfcg
         ng+ldMyJk1bq4BG01m2rz/bktU34wNy4ejseMuCe/8j4MBVXCDe6GfufyslHYCZreNjs
         zLCBvZKrj9tb+YOYdvXa5qk9tB4rwunj+IEIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YlRFKx1f5LgxGYiRBStshQO2lcl0shwRTsz4d5msIg8=;
        b=CwuRg1G30QkEiQY6HGd2H7WKuyFAtRtdi9NwevnO9yXa+u+S27hDrIAE5EnTU8Wqhz
         YQtGNwJiHmqGzXmBRzzikdtKYtR/ZCD/Aa26uirIszwu+BOnYIy03hdBknor6mL2ZA8u
         DiORTq/rbZDwIMtPte+Y4RVKKdwLXsNnklz0uNCd5UZZpmqMj8CM/Rg03IbqTT3UiK5/
         AJeulWmWcYuUbvBh6eMUWcbKC0AHb+EcdYdiVIKrunvluTldpAXWoAksCpLIv6qAkq8q
         IxsrxydsZiazYBbfklKemgGFHkHB3vrCK7ZGFmTKvovliux68jFHTwnd9PvTNnhIJ5gL
         A/Xg==
X-Gm-Message-State: AOAM5319HXW95gjx4I+9ZEE7usTANHsRtXyJoP4spX+xff7crwx64C8t
	2AxjGYWLqi4HzvezPP3ongxZfg==
X-Google-Smtp-Source: ABdhPJwjF7T387a9POXFRR70Tq2h4uk//J7YzYRByRcEsqcopbrDpy2LgsoIKFTW6B9DZ116TxnPTQ==
X-Received: by 2002:a17:902:bcc6:b0:15e:e60e:f3e8 with SMTP id o6-20020a170902bcc600b0015ee60ef3e8mr10898049pls.174.1652564584093;
        Sat, 14 May 2022 14:43:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id io17-20020a17090312d100b0015f4b7a012bsm4078815plb.251.2022.05.14.14.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:43:03 -0700 (PDT)
Date: Sat, 14 May 2022 14:43:03 -0700
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
Subject: Re: [RFC PATCH v2 03/21] kallsyms: Ignore __kcfi_typeid_
Message-ID: <202205141443.9A3BAEAA5F@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-4-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:41PM -0700, Sami Tolvanen wrote:
> The compiler generates CFI type identifier symbols for annotating
> assembly functions at link time. Ignore them in kallsyms.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
