Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B233F0
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 19:33:17 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t2so6115626pld.4
        for <llvm@lists.linux.dev>; Tue, 31 May 2022 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qLnO+C+7aAaygh9ISd9fqM/CxUjR2eNvo4QNuIGbJZA=;
        b=boMI0TK9q4PyvjtopalHQWwQg+bwzLBRwVt6usogBOZo3y4I8sKugmGj5gClYVZIxe
         mJtAz63KQilTzVNL4OA8rKPoxtUf7t/0N+htvxB4rLMHTsUT/L8eYocX/sTMBGP69k9J
         hHlqdyKpju41+NFSn1AEajrNwShiXnnIwCd7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qLnO+C+7aAaygh9ISd9fqM/CxUjR2eNvo4QNuIGbJZA=;
        b=E2OIAqyEIyobSsekMEyG808rstAW2E9esv2X7yJO2HROIacGSkeMQKed17iFovxmqf
         d6P3PHwXHwz93/jnLMuX4z4yDYPCY9Hb14oTYns/cgY5UX/bcvSzkj55sRassNWViMdd
         oO9kEBhs0pijqtCNjLY1MOaSI0xT1QbdgEybr51F1rHUwkLEKMx1wjWFFQZZg5Px4Erz
         YcudPOcS7UeNage02PVSBgsU35hIWLnyL2WKfgZ0GdN3k6qtsxeflSRBnJ1jJsCX13vz
         QtYnbKBnHeMJXIzUfn1Td57VMVrsdr/DajoLvhbOW5dQfudIVu76vHuoovXbf9MYyNv/
         K7yw==
X-Gm-Message-State: AOAM5316K/n6TBVeTpCt2Sm13cNXuuZ5bgh+lM2TU2BvdC0JBKxlZFAs
	KElkWKw2XjKCm1tb9f6pw+lB/w==
X-Google-Smtp-Source: ABdhPJxEX0i59aiuonva/AZ0z4sLGv/51uRnZGQv2TTxl6uYErLESuNj+NFjN+PrT3ZZCR1WloaQhg==
X-Received: by 2002:a17:90b:1e01:b0:1e3:1f4c:dd71 with SMTP id pg1-20020a17090b1e0100b001e31f4cdd71mr8943018pjb.168.1654025597202;
        Tue, 31 May 2022 12:33:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u9-20020aa78489000000b0050dc76281a4sm11071718pfn.126.2022.05.31.12.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 12:33:16 -0700 (PDT)
Date: Tue, 31 May 2022 12:33:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cfi: Fix __cfi_slowpath_diag RCU usage with cpuidle
Message-ID: <202205311231.C26F6E4E@keescook>
References: <20220531175910.890307-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531175910.890307-1-samitolvanen@google.com>

On Tue, May 31, 2022 at 10:59:10AM -0700, Sami Tolvanen wrote:
> RCU_NONIDLE usage during __cfi_slowpath_diag can result in an invalid
> RCU state in the cpuidle code path:
> 
>   WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613 rcu_eqs_enter+0xe4/0x138
>   ...
>   Call trace:
>     rcu_eqs_enter+0xe4/0x138
>     rcu_idle_enter+0xa8/0x100
>     cpuidle_enter_state+0x154/0x3a8
>     cpuidle_enter+0x3c/0x58
>     do_idle.llvm.6590768638138871020+0x1f4/0x2ec
>     cpu_startup_entry+0x28/0x2c
>     secondary_start_kernel+0x1b8/0x220
>     __secondary_switched+0x94/0x98
> 
> Instead, call rcu_irq_enter/exit to wake up RCU only when needed and
> disable interrupts for the entire CFI shadow/module check when we do.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  kernel/cfi.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/cfi.c b/kernel/cfi.c
> index 9594cfd1cf2c..08102d19ec15 100644
> --- a/kernel/cfi.c
> +++ b/kernel/cfi.c
> @@ -281,6 +281,8 @@ static inline cfi_check_fn find_module_check_fn(unsigned long ptr)
>  static inline cfi_check_fn find_check_fn(unsigned long ptr)
>  {
>  	cfi_check_fn fn = NULL;
> +	unsigned long flags;
> +	bool rcu_idle;
>  
>  	if (is_kernel_text(ptr))
>  		return __cfi_check;
> @@ -290,13 +292,21 @@ static inline cfi_check_fn find_check_fn(unsigned long ptr)
>  	 * the shadow and __module_address use RCU, so we need to wake it
>  	 * up if necessary.
>  	 */
> -	RCU_NONIDLE({
> -		if (IS_ENABLED(CONFIG_CFI_CLANG_SHADOW))
> -			fn = find_shadow_check_fn(ptr);
> +	rcu_idle = !rcu_is_watching();
> +	if (rcu_idle) {
> +		local_irq_save(flags);
> +		rcu_irq_enter();
> +	}
> +
> +	if (IS_ENABLED(CONFIG_CFI_CLANG_SHADOW))
> +		fn = find_shadow_check_fn(ptr);
> +	if (!fn)
> +		fn = find_module_check_fn(ptr);
>  
> -		if (!fn)
> -			fn = find_module_check_fn(ptr);
> -	});
> +	if (rcu_idle) {
> +		rcu_irq_exit();
> +		local_irq_restore(flags);
> +	}
>  
>  	return fn;
>  }
> -- 
> 2.36.1.255.ge46751e96f-goog
> 

Thanks for the fix! It looks like these tags could be added, yes?

Fixes: cf68fffb66d6 ("add support for Clang CFI")
Cc: stable@vger.kernel.org

Also, to improve the commit log, under what situation was this problem
encountered?

-- 
Kees Cook
