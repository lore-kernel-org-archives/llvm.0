Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9133CF
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 21:14:24 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 3so10521180pga.1
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vr5U1/Tp0dWjc28cdfWtq8kpHUXGkwFcQBACPTsH4qM=;
        b=PxytvV3E8ptfSPFZPgiDl5QehMVxAMIkZegdERh6kOaI0UcS0sOA2IlLFuPxidDKQr
         B7nBcywswUREageYf5cMRc4WBMPRiWFUykq3qs6K8+W593r915ttr6+i0ifQ9NmIKFwZ
         z38MOvHH/UAkk16a1I0Gi5JIPxWxYaNAd1uoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vr5U1/Tp0dWjc28cdfWtq8kpHUXGkwFcQBACPTsH4qM=;
        b=N2kFijVozajdBym6Qu/bxQJOeMMdtBfd9bcNcj7Yv96LO9HL4bhNXNuloH/WQi+iI9
         SntR70V0yKbP3P5avYzqmwotrnhNNHMiyrqGcyM48C9kldGEF1wgSf3jZ77IY9Uo3GS8
         vcd18HGTIVvcHpWdQeGFiiM/2yR5LIgRg4roOft/pNaJyFTWJq4o9/YsMHWBQ4xnuyOE
         plfcR7w+oIcu++k7sY0N1dypTJgVT4nAc7E/42VWA/SkYJUmnuK22RF0SoPSAYe3qXoN
         hxqxahJtC5mqVWkT5obQYkucncq9GfLF5bH6IgEfR7Q2v4QhjsmIlazqbk1QGcGpt0n9
         Bmog==
X-Gm-Message-State: ACrzQf0eHZwVsJ55MFtzyTmYdLD7ES9MPYxKRz78kkp/3IVZyrUGXIKT
	Hv5CGtxITqPZtml2hsM4ZJKbcg==
X-Google-Smtp-Source: AMsMyM7G84JWu4fHxWchj8R6lVupO6711unh8QcM5a4TLwAgLSyywVnLEuq4FNDU5VXhgb7WM8Koeg==
X-Received: by 2002:a63:6b83:0:b0:43c:17e8:c2a5 with SMTP id g125-20020a636b83000000b0043c17e8c2a5mr25080332pgc.457.1664313264405;
        Tue, 27 Sep 2022 14:14:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902ca0300b00172751a2fa4sm2019681pld.80.2022.09.27.14.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 14:14:23 -0700 (PDT)
Date: Tue, 27 Sep 2022 14:14:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v3] x86, mem: move memmove to out of line assembler
Message-ID: <202209271413.314FCFC3@keescook>
References: <202209271333.10AE3E1D@keescook>
 <20220927210248.3950201-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927210248.3950201-1-ndesaulniers@google.com>

On Tue, Sep 27, 2022 at 02:02:48PM -0700, Nick Desaulniers wrote:
> [...]
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes v2 -> v3:
> * Fix bug I introduced in v1 when I changed one of temp register
>   operands for one of the two instructions performing a mem to mem swap,
>   but not the other instruction's operand, and discovered by Kees.
>   Verified KUnit memcpy tests are passing via:
>   $ ./tools/testing/kunit/kunit.py run --arch=i386 --make_options LLVM=1
>   $ ./tools/testing/kunit/kunit.py run --arch=i386
>   Fixed by using symbolic identifiers rather than open coded registers
>   for the less-than-word-size temporary registers.
> * Expand the comment about callee saved registers on i386 with a
>   reference to the psABI.

Thanks! This looks good.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
