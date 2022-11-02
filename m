Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC716D18
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 15:43:29 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y4so16967086plb.2
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWzb2SKkWTuON7pNcNwFRnwOMg1HNM3x+PlBBYRnE78=;
        b=b1IH6B/wne44OiQXZ9i7FSHJfVW3zIn74ViSqHYAsPnDbPDFo4b0mp4Ea/23Y8yiZp
         4Na6VVGOm+h4UD3nlKM9Rl3pFiFLTzf9UB+jUhfO+J4ZNn+X8eC78BvcBr769QMsJqUU
         WTfGJ4gwtPde3j8W3mqjzgHAHbhf+xT06ghwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWzb2SKkWTuON7pNcNwFRnwOMg1HNM3x+PlBBYRnE78=;
        b=bzUtS8Wexn28Bm6ETQg+lsVJbXfH9R4EkkgMK8MuC1upO3Gp/qtyXK6xviVER/mWjo
         /5Skbd7iqkm0IiU033hLLQcex8pi4Yot9g4jzWkJ2aQHva8GEOGliDjXBNp05+cAoytv
         i7ZIxNMRRn8bs3I01rpsQy6OXCGO5aX56ZgrC4+4Aqwh5n1Lp/ONscRWgSWiHUIKYL+f
         SSo9FBKH8ljky8aq5Igspzsm6Xv8dTz6tyLtekEmARYs9J9hVUgjMwwMF7x60xUv284C
         bH3Azv8FV6sFC2Bc6RhWldcmlNIyxC+KVhkpKiKfUhfcu6c8jEY+HvNJXmTX+0VfCLni
         CCeQ==
X-Gm-Message-State: ACrzQf1uJMAwj2/GZwNsMLKskxvYb+Lb8JGYSL2nSTN2zkow7pHo/AHE
	2PTn3L09qknQpRmhh1K0klgWqg==
X-Google-Smtp-Source: AMsMyM7PDeQil3IUTDK8DEQhhfPtLai6Y8bKaPW2tqDAKdyYKrgbMX/ec7FMD6Z/EWccGgv35ijpyA==
X-Received: by 2002:a17:903:32cf:b0:187:4b3a:15fd with SMTP id i15-20020a17090332cf00b001874b3a15fdmr2922849plr.99.1667403808948;
        Wed, 02 Nov 2022 08:43:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w10-20020aa79a0a000000b0056c681af185sm8605569pfj.87.2022.11.02.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 08:43:28 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:43:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	dri-devel@lists.freedesktop.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] drm/fsl-dcu: Fix return type of
 fsl_dcu_drm_connector_mode_valid()
Message-ID: <202211020843.A19F75B@keescook>
References: <20221102154215.78059-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102154215.78059-1-nathan@kernel.org>

On Wed, Nov 02, 2022 at 08:42:15AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c:74:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = fsl_dcu_drm_connector_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
> type of 'enum drm_mode_status', not 'int'. Adjust the return type of
> fsl_dcu_drm_connector_mode_valid() to match the prototype's to resolve
> the warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
