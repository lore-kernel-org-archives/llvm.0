Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF62F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:51:48 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 137so10678856pgb.5
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KJbcM6BaGnVsc+lH7+1M1k2jbZydRk22NNewGkDa1NU=;
        b=e4BoHA9WL9qeZc71RDo+gwHI/WVGlF9ihGMZvl3GjCTnYqbpdgT6ARC97V0Sx005vk
         CVBefGzFOPkHSpdQU0IONguMIhpytTi32o8F4sAZ9Hu6oN0VZfc4WwF5S47maDqlHjGa
         9VthZjOMjNu86ZiHEs9AjxoajYC5HNqWD/Eqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KJbcM6BaGnVsc+lH7+1M1k2jbZydRk22NNewGkDa1NU=;
        b=pjT78vqPg/ylGGS+08Xymh5X3xkGmOLsalsrVRbvXR+mfjcymEHl6wxhwN7sE9RTVO
         bho49RB6OWMcU/IV4fdYemTZHI0L4HndoNh1JGUMdX9sLgjln+TBor1FycQnGAfwalnW
         tbY/isWmxs/sC18/yEdTO0rCikD3ybAtH3Nsinh4AxQRWE+nxuDBbzI0Q3ZpHa7jaIj6
         gnfULCf6mVUw2nZV5rOUAprpPyy0GIOp9HoHQe1DNGhWhgUGssc/ACDT4SlzqK5sNgA0
         2+QToPDc5JrdmDKveGzuM+iP7i7JTZuGckCnRCNe2/2t5QhAyeqiyus3bF1adoj6U8SW
         +17A==
X-Gm-Message-State: AOAM5338ZVX21/+oN0hSWJtwb9Iux714vlcWhluoBbonLQXg9ns4ur+4
	+xAcbg657Yiz1bb1OS6VlcdnDw==
X-Google-Smtp-Source: ABdhPJzVcwxnf5BHi4PD4v22PQexaSGjmN/U7xVBOR3pb4vN2IMRcgUsw+BYxfv+bMDVujgoNZB/uw==
X-Received: by 2002:a63:f0a:0:b0:3c6:e825:2431 with SMTP id e10-20020a630f0a000000b003c6e8252431mr9189653pgl.166.1652565108504;
        Sat, 14 May 2022 14:51:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s13-20020a17090302cd00b0015e8d4eb244sm4117847plk.142.2022.05.14.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:51:48 -0700 (PDT)
Date: Sat, 14 May 2022 14:51:47 -0700
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
Subject: Re: [RFC PATCH v2 10/21] arm64: Add CFI error handling
Message-ID: <202205141451.AABEE8B@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-11-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-11-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:48PM -0700, Sami Tolvanen wrote:
> With -fsanitize=kcfi, CFI always traps. Add arm64 support for handling
> CFI failures. The registers containing the target address and the
> expected type are encoded in the first ten bits of the ESR as follows:
> 
>  - 0-4: n, where the register Xn contains the target address
>  - 5-9: m, where the register Wm contains the type hash
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

It might be nice just to include an example exception Oops in this
commit log.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
