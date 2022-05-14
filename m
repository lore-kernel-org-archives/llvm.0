Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67072F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 22:03:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id x52so10723625pfu.11
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 15:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cv5IfzzB62q+sLnNCDbD30QBd73u3J6+zboNpO/j4RY=;
        b=VETNqwy6PZmcQN3F3QHSWlt30W22U3LCrLRvKSeesIcM9qLdix4sdzIOt/G8doxqOb
         OcoqV/LPIMHwGJxM1kBkp24tJ8lnxNfHbqvA5/XfJrtBOFx283bTamig0x1zX3ftp4Ez
         dBx+vI7MyUSpc3Sh0MhnbfuW2COnE4U2FEV4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cv5IfzzB62q+sLnNCDbD30QBd73u3J6+zboNpO/j4RY=;
        b=iO3EOKujM3i6/95GwydsIPB2oy8o2tfe9IPUS2iQWKfMkx+2KZG0yYM4uWPnC6+nMj
         bZC5ZtOedG7nNA/WGZxB/RWaIU24WYyWwnuVt4fQIqFplY9f1kWwUyBM+Zm/hhbW6HhX
         9BWleApv1QyHgN1Isq88joj7lshJrAoHM5Do7Q8VZrboF50og9TlYLBawBk77ETaWnN4
         puxiOXNICvlF6mNVj6qH1JIaqjNXDMxtS4VeYs5Fdw6XS63JGVFl1mJfuvD5Hp542x/g
         rz45B1x9U7NS5Ju+ydIVSeLuzD91JfjQ/yQ0PwLPLxkfuDqj59ZYxHA0SVnSjN/Tu5Do
         ujrw==
X-Gm-Message-State: AOAM530yZ7Q0y4CE0rfC1y377ae9J0LIoCwq/PjCV2ypxYoCjLejZPyp
	JE3T0hqu14doPL8vLYI45Y03TQ==
X-Google-Smtp-Source: ABdhPJw20gLVrovNCtH9oPgnmWWI4khPHrgIkrbw39eJj00oseNyUiPYd0WVdGDzgNKQyhd7WsWu9A==
X-Received: by 2002:a63:190f:0:b0:3db:972b:46bb with SMTP id z15-20020a63190f000000b003db972b46bbmr7963890pgl.554.1652565828255;
        Sat, 14 May 2022 15:03:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ip14-20020a17090b314e00b001d81a30c437sm3672870pjb.50.2022.05.14.15.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 15:03:48 -0700 (PDT)
Date: Sat, 14 May 2022 15:03:47 -0700
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
Subject: Re: [RFC PATCH v2 21/21] init: Drop __nocfi from __init
Message-ID: <202205141503.3D87637B85@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-22-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:59PM -0700, Sami Tolvanen wrote:
> It's no longer necessary to disable CFI checking for all __init
> functions. Drop the __nocfi attribute.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Maybe move this up after patch 11 (the arm64-wide __nocfi removal)?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
