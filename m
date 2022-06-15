Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF37A
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 20:25:31 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 184so12355022pga.12
        for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fSbaUdWMc4ZCN4x6T7HO7Oazr6+FjS4D1nOKI+4v+qI=;
        b=eoBnV1ab6mcOB4xykNYFQaZW+Qi3dcgSQdsqak3tENQPcuOUClkzPwbUWUNWFP+QVK
         bQwrpLsOSl1k9EqZEIsTmvr6JEEssRSqiHDlJNMXVJ30VXU0dndaTEks0xtZFx1PwQpi
         jGw5dC7e0N7xdUVRy+kS0fs6FXid54A1kOOiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fSbaUdWMc4ZCN4x6T7HO7Oazr6+FjS4D1nOKI+4v+qI=;
        b=f9w8+4bTiDOCi5MAmLDutAV/JpFkzfpKsgU9CZwoku6L9dqFNQ/nzpeJY3pxK0DjH5
         X4Eeu3dEF0NGCjp5buyWpr/hCZPav6cPgQpw+dCW++iecjw1/YOau4gizojJqp2clj4v
         +lxiy/TlT5zpJPEOvqR3KrpU7B+poXmzDXRNJ4c1MGWpKKGFzESMVV6KNPT0Xg11qaHl
         sE5ygMdgf36BY0TpDTtb7k3iP+O6ooSB8BsjEJ8MybJh87eHs7wBh2StvRrn0KwdL93x
         QzhOlhE0R9FC86PwEAt+dxJJx6XY+c+FTuQJzrCOcGWtIw4i0Sp4DGQvuXFPQXwWthAN
         T01w==
X-Gm-Message-State: AJIora+igUhCg/GuhcCB2fWGwwfZKiDr769A2YEn5NdIciywiPlAGUam
	ieUFnxy4lWddUB6mp+45GjkwOg==
X-Google-Smtp-Source: AGRyM1tESwgbtAytnIPSYcv5RqPofftOKrovVEa2JmH58Vpoe8CgFFE/Ium5XvKSgg8sm3hMrzT/lg==
X-Received: by 2002:a63:135b:0:b0:3fd:876c:975a with SMTP id 27-20020a63135b000000b003fd876c975amr1347239pgt.538.1655324731197;
        Wed, 15 Jun 2022 13:25:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b13-20020a1709027e0d00b00163aba9a2a5sm40235plm.106.2022.06.15.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:25:30 -0700 (PDT)
Date: Wed, 15 Jun 2022 13:25:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Contextual conflict between kspp and rcu trees
Message-ID: <202206151323.4D78044D8@keescook>
References: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>

On Wed, Jun 15, 2022 at 12:55:53PM -0700, Nathan Chancellor wrote:
> Hi Stephen et al.,
> 
> There is a contextual conflict between commit e1d337335207 ("cfi: Fix
> __cfi_slowpath_diag RCU usage with cpuidle") in the kspp tree and commit
> dcc0c11aa87b ("rcu/context-tracking: Remove rcu_irq_enter/exit()") in
> the rcu tree, which is visible when building ARCH=arm64 defconfig +
> CONFIG_LTO_CLANG_THIN=y + CONFIG_CFI_CLANG=y with clang:
> 
>   kernel/cfi.c:298:3: error: call to undeclared function 'rcu_irq_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                   rcu_irq_enter();
>                   ^
>   kernel/cfi.c:298:3: note: did you mean 'ct_irq_enter'?
>   ./include/linux/context_tracking_irq.h:6:6: note: 'ct_irq_enter' declared here
>   void ct_irq_enter(void);
>        ^
>   kernel/cfi.c:307:3: error: call to undeclared function 'rcu_irq_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                   rcu_irq_exit();
>                   ^
>   kernel/cfi.c:307:3: note: did you mean 'ct_irq_exit'?
>   ./include/linux/context_tracking_irq.h:7:6: note: 'ct_irq_exit' declared here
>   void ct_irq_exit(void);
>        ^
>   2 errors generated.
> 
> 
> Per the above RCU commit and commit 6c5218715286 ("context_tracking:
> Take IRQ eqs entrypoints over RCU"), it appears that the following diff
> is the proper fix up. Would you mind applying it to the merge of
> whichever tree comes second if possible? I did build and boot test it
> but it would not be a bad idea for Sami and Frederic to verify that it
> is correct so that Kees/Paul can mention it to Linus :)

Ah! Thanks for tracking this down! Maybe dcc0c11aa87b should be updated
to leave an alias until the next merge window?

-- 
Kees Cook
