Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D52F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:43:57 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id h186so8029244pgc.3
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LLS7Qs+kiru82aH5PJhByae1JVoVq6KGrh/vD5VnTrg=;
        b=Q+18rDTK1r07EeGDwGKZz+sW2xEsYdgl6mXdAgXXAZp2VV8YQBl2ddvKiNk6+bRJE7
         WhVB9ovIuJZkleoLE8Wg/p6xtgAPHv6rJhSaKFMs7ARU/f/Pk8MJRYbv0uJDzIG9bm2j
         54NS4mNm22dOZTMg3b4zk3DeDlmGowgXLH7Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LLS7Qs+kiru82aH5PJhByae1JVoVq6KGrh/vD5VnTrg=;
        b=m13/xqDLUoJkVlmnu+ztEdXnMQCwbNkSEqJup03pzxQe386J29CeuATd1aZXsvrk6z
         VzEYqSsqYwWgJjt1luBZZaDO4R1pphCzdYrsysMPWXetku8cGsDhDLOiDtknJlnVsOBJ
         UIYIhlHEpulSL1W7uWGE9PnkhKR/5AzMTR05jAG3bBZRZ3OA+puCdqgapjHp4ZaLSH0R
         UwrkSSpC4R/Xi4Ge2wq2xFspgEeeoqN/Gw6AD/LIOI8nye1C4+ADl3XcXbnSnfITn6Gr
         9FCh22ICzfQ6qEl2EKAaMVxKz/rsmDzvPGPMtfG2sU9ha/UG6+ND4JVCsCSDYe2QjU0H
         uDPg==
X-Gm-Message-State: AOAM532v6ma40q8AJXxg770Qb28AoWoj5wyFUFwC/rtg7NVkgolt9BkQ
	nd6RloiiKIFGpUgYFSeuV761xA==
X-Google-Smtp-Source: ABdhPJy1SUg6blIfFOl9RL/kjBDiBzqJhlhen4sGbyOOl97K62dMbHT/72DOVt9RHA3FaPWdLh+KpA==
X-Received: by 2002:a65:6810:0:b0:3c6:ae78:5fd0 with SMTP id l16-20020a656810000000b003c6ae785fd0mr9467906pgt.495.1652564637046;
        Sat, 14 May 2022 14:43:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ce0a00b0015e8d4eb297sm4116507plg.225.2022.05.14.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:43:56 -0700 (PDT)
Date: Sat, 14 May 2022 14:43:56 -0700
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
Subject: Re: [RFC PATCH v2 04/21] cfi: Remove CONFIG_CFI_CLANG_SHADOW
Message-ID: <202205141443.516DD7C93C@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-5-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-5-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:42PM -0700, Sami Tolvanen wrote:
> In preparation to switching to -fsanitize=kcfi, remove support for the
> CFI module shadow that will no longer be needed.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

I like that most of this series is dropping code. :P

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
