Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518CA17AD9
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 23:40:00 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6887059f121so727091b3a.3
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 16:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692142799; x=1692747599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIaRDF0hVkKVd118QxNJ2cE/XyLPoGMK6bw4OO6dAQI=;
        b=KpiC1bx2GBkkMOEUPYLOcCkfIKKrETx6xewfdKH2qxYUpAR1dH+2CCuQbTiVl1twuN
         1cgsfirNT3DznrIxn4vvefZyiC/hGImcqAFIJImFVc/XldElBR//n133wjYT1u7CvWay
         dUmrifB1r/a+Yg4dQstXSjcMasY3eh7p7zyb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692142799; x=1692747599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIaRDF0hVkKVd118QxNJ2cE/XyLPoGMK6bw4OO6dAQI=;
        b=jpbJnimuiIj9gB9PCw+Sq5cv3Zr2onLyffvDHQPKIwSnm3Bwi8rJ+Vhzj4M6BSOxQl
         zeTBQ/Wsaqw6AON+iVgdG+HeTzL7AufmGfjhz1rjabPXopNLXlOHts/dWdTvgTmk6QL2
         2nsOzsF/15nAKM02BVz35t8tiEqkxoLGbAmbAj/LYMFmSSvCOpNLGQq3LRIq3sfeTL7y
         nsfLU62ZW7WV6gjq0QipzRxCqNd4y9jHA5RVqSHxNA8TkBh2eG1ruqKBil/5nhUyf0l5
         C7JluSz2WmzJitrCefYSE2JaH1Q5jLOpVnzmbB7pin3XMhDe6pYvLbhnkj+Gtm7/dqOz
         FxMg==
X-Gm-Message-State: AOJu0YzriatVTv9/Veroj6Ad01xIKsePcSYm9qfl9q+gUo/G4nvHg6lD
	qWGGSugToPZwKQYToPA8u3HIMg==
X-Google-Smtp-Source: AGHT+IGKj1OJIbGGo8TvNIdevDKSCFtWd0N+yBBZ3SGTCWIvm7nfp5p39o9iYLxM+kzcddzCJGhj7A==
X-Received: by 2002:a05:6a20:5503:b0:13e:f5b5:48f5 with SMTP id ko3-20020a056a20550300b0013ef5b548f5mr307713pzb.27.1692142799586;
        Tue, 15 Aug 2023 16:39:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b0056420d3cd20sm10723119pgc.71.2023.08.15.16.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 16:39:59 -0700 (PDT)
Date: Tue, 15 Aug 2023 16:39:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
Message-ID: <202308151639.44FEBD10@keescook>
References: <20230815203442.1608773-8-samitolvanen@google.com>
 <20230815203442.1608773-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815203442.1608773-14-samitolvanen@google.com>

On Tue, Aug 15, 2023 at 08:34:49PM +0000, Sami Tolvanen wrote:
> On RISC-V, the return address is before the current frame pointer,
> unlike on most other architectures. Use the correct offset on RISC-V
> to fix the CFI_BACKWARD test.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
