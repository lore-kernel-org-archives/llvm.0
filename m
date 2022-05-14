Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4392D2F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:42:41 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id a19so10472200pgw.6
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=23xyQlazTAPWzzday3S3EoO5Wm7fZvGvsyQkqyX645Y=;
        b=TMkRhl/wkoxlOPIUjWFpDEdYryjRLo1aur2RO+svl712U8by/JGzX+5ItuVlWn03tA
         KgpiOLWAc0epLFPuSyHy+n6EnTesI6a5Crv6i50DYOfevDec6pWiGr/qo7ei40Il/CZF
         9DlqRR/GnjNe/MZg9aFcb3rMM559MvTBwPk+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=23xyQlazTAPWzzday3S3EoO5Wm7fZvGvsyQkqyX645Y=;
        b=uqFsBiWCMpJOWMAajZ4Ko3r/aEC/CSw1dQLKc4Hdh4Ct7XhADhyiWzqKIn7Qv+D1S8
         STkC95oKGZ0Nb+kvh6XhQI1DdYGsvD3DM72Db0Ifny0wyh04M8NinEBsQUwI7BzC1XLH
         1Z3Aiwer2W+aOMdrUMBaEZdyg0+M54Ifhp9OKULd8Pgl332zGRhCNQUBMlory5lmlbDe
         CrX1Bt0AulnQDrv3igO3kQi2+apoyZseNjIn8QVnFO+cS2WUmUwA0N9ab/F/Fx7ZfPBL
         rrsgzOe5dZy7p13gkcEXpFX6Yw6j8Sa/AKJZ+J/Q4j6xjyyewL61V8oC3qsxDcLdZaGd
         v4jQ==
X-Gm-Message-State: AOAM531Cn2PDJI9/kjBqCwJr58Ocmxlm3IArONqShh2i0PnB1xcD7yzQ
	eVhml5nZfY4doPYXkBf6+rAnng==
X-Google-Smtp-Source: ABdhPJzM6sSqhlRvKZoHaTHCB67LhQRuHcOSpewjHrxQxN3l5+JJ6IuUuizN+MmH7IWYXI6gsxrCog==
X-Received: by 2002:a05:6a00:c91:b0:510:73d6:a890 with SMTP id a17-20020a056a000c9100b0051073d6a890mr10685973pfv.42.1652564560673;
        Sat, 14 May 2022 14:42:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h20-20020aa786d4000000b0050dc76281a5sm4083831pfo.127.2022.05.14.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:42:40 -0700 (PDT)
Date: Sat, 14 May 2022 14:42:39 -0700
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
Subject: Re: [RFC PATCH v2 02/21] arm64/vdso: Filter out CC_FLAGS_CFI
Message-ID: <202205141442.9DBF84F15C@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-3-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:40PM -0700, Sami Tolvanen wrote:
> Explicitly filter out CC_FLAGS_CFI in preparation for the flags being
> removed from CC_FLAGS_LTO.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
