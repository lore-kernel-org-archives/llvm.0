Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08FA47
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 16:32:18 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so5448679pjb.1
        for <llvm@lists.linux.dev>; Fri, 03 Feb 2023 08:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kpK6KgZXQ54pBMdUsHP+HUpnEsKdgQDEGB4BNBeZB9M=;
        b=gEmQGizGKZQHCA1ytHRM6UDGT97glHo2J7W9naosZ1VMVQbEFAURGR1sGpP6uwVbvt
         4FjCWBQ64s0+iMVMRk/Pdg87ZmByxjnhEqBvknvFlw31g48ojNq2Q0J04MnoArHb71ip
         WlF5qPrqDiZDdq6oiyt694Dpp6cDfmOXnqHQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpK6KgZXQ54pBMdUsHP+HUpnEsKdgQDEGB4BNBeZB9M=;
        b=W0uasQFhF3wFKABrpHcNvIh0LacrGyX2EhUTKQ7ETiytW8ouCUrBcX4jKGSxlWajAm
         C0JkQufcnRAGJxr0i/wqDfwyz5AA7YF1XML18unQ8W1iPjFj9e2gjRFVmEfAir80n1Ql
         +DuojqMql5Ne6xvl8p5YgdNLFrsjr42CuFFtJy58Ye6wLdzbuRIPDsZaqHa9Q4f3+YuD
         +GHiG4VjCEs5YQM7Q+SRahh0bI73YkHNer0UZK/RH9cqa+Wsr5s8V0SQ2Nsr2GxHAa3C
         Q7UVWSPfHMLPt+8TVEXShIacTitRbA/92o01dROEyq9AAZUSTUrh5tE64MIPExPwQnew
         Dg4Q==
X-Gm-Message-State: AO0yUKV23mj/AGV2BeZmy7YRvxiDJUrE/IzOkKYIP7itElARYBziG+Bt
	XToTpNlWd+qN/U7ZBPDBRLBUUg==
X-Google-Smtp-Source: AK7set8qwbVjBH5W+V+grJP9ndtfdT04u2cUvUjM4C67XgmP2kzzkMLxlD4daBx8I9135CQ3ShRNSQ==
X-Received: by 2002:a05:6a20:8bb0:b0:b8:5f00:bbdc with SMTP id m48-20020a056a208bb000b000b85f00bbdcmr10653610pzh.50.1675441937646;
        Fri, 03 Feb 2023 08:32:17 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b9-20020a1709027e0900b00198ac2769aesm1803803plm.135.2023.02.03.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:32:17 -0800 (PST)
Message-ID: <63dd3711.170a0220.c22c8.349c@mx.google.com>
X-Google-Original-Message-ID: <202302031631.@keescook>
Date: Fri, 3 Feb 2023 16:32:16 +0000
From: Kees Cook <keescook@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, John Stultz <jstultz@google.com>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Marco Elver <elver@google.com>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: Support Clang UBSAN trap codes for better
 reporting
References: <20230202223653.never.473-kees@kernel.org>
 <Y9zawkok2AWy/brZ@FVFF77S0Q05N>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9zawkok2AWy/brZ@FVFF77S0Q05N>

On Fri, Feb 03, 2023 at 09:58:26AM +0000, Mark Rutland wrote:
> On Thu, Feb 02, 2023 at 10:36:57PM +0000, Kees Cook wrote:
> > On arm64, Clang encodes the UBSAN check type in the esr. Extract this
> > and actually report UBSAN traps with some specificity when building with
> > CONFIG_UBSAN_TRAP. Before:
> 
> Really minor nit, but could we mention CONFIG_UBSAN_TRAP at the start, e.g.
> change that first sentence to:
> 
> | When CONFIG_UBSAN_TRAP=y on arm64, Clang encodes the UBSAN check type into a
> | BRK immediate, which is reported in the ESR.
> 
> I was initially confused since I was aware that there are usually direct
> function calls for the reporting.

Sure, I can rearrange the commit log.

> 
> Other than that, this looks fine to me, and regardless of the above:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks!

-Kees

-- 
Kees Cook
