Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089C6D18
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 15:42:55 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d24so16954144pls.4
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbHhHvdRSfNW3M6lKiiBiHsy/aZHIegD8in6WLhhzSY=;
        b=grx0sX1vyt4doXabEeN05DzVGZaktvYdcCfg6WGKYn2Um48Zgp2UMnzv9yxRjGlvDs
         s02OzcMqRXmY81P844mFxCquKl032+JyuX8aVk9fGB0kVUT/d3ioGHRtH7AHRaujNbdw
         65vnLvXCz2xWmb3ZUvb4RYrBdcrT6g2PSeo3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbHhHvdRSfNW3M6lKiiBiHsy/aZHIegD8in6WLhhzSY=;
        b=FTXz8WBwpTavr6j8wC2N5kyhHQTIvxWK3IUFWt3pE3xMyRzT8m2VRvuztPsx+OG7S1
         BxGJ+KGw1F/K6hZdc2h0uCeQKBYpzFNpyTX0r27fxMii2zTz0aZAH4OvfNadUmImOR9d
         jPJseaORMev5Le3J1AC2TlEsLR0uDWnIMHe3/G3IF+Ly0PM9R/6qvHj4XMT29sQytgLq
         QFcdqZwRKQGz9tXAPkkcJ1v73yqFs3ISVCiISsh5dEqE9qWDsJHQR4R3JdjxOvyB+WXg
         Q5grdjPUVdBQl0VXikHeJjKH6Pl5Rkc8UIuHnWGs8QvKNt4fejO2x1/aWiVbPHlcX/sm
         S4kg==
X-Gm-Message-State: ACrzQf2qKmd+8741iLzscTi3o18naWRcFL8UwZuOV54jbDwWh04RQFns
	ZCdCFxsvkjfZJEkZeXvCIxGRKA==
X-Google-Smtp-Source: AMsMyM5riCGdRLVGt8cheeiKjHf8n8+rR3sMc60dvYFpdMSefduVp5ovnjO/E9dJecAFytPwR3myDw==
X-Received: by 2002:a17:902:720c:b0:186:fb90:573e with SMTP id ba12-20020a170902720c00b00186fb90573emr25604727plb.160.1667403775155;
        Wed, 02 Nov 2022 08:42:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a15-20020a170902710f00b001885041d7b8sm47015pll.293.2022.11.02.08.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 08:42:54 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:42:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix type of second parameter in
 trans_msg() callback
Message-ID: <202211020842.8F3ECD397@keescook>
References: <20221102152540.2389891-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102152540.2389891-1-nathan@kernel.org>

On Wed, Nov 02, 2022 at 08:25:39AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:412:15: error: incompatible function pointer types initializing 'void (*)(struct amdgpu_device *, u32, u32, u32, u32)' (aka 'void (*)(struct amdgpu_device *, unsigned int, unsigned int, unsigned int, unsigned int)') with an expression of type 'void (struct amdgpu_device *, enum idh_request, u32, u32, u32)' (aka 'void (struct amdgpu_device *, enum idh_request, unsigned int, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           .trans_msg = xgpu_ai_mailbox_trans_msg,
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c:435:15: error: incompatible function pointer types initializing 'void (*)(struct amdgpu_device *, u32, u32, u32, u32)' (aka 'void (*)(struct amdgpu_device *, unsigned int, unsigned int, unsigned int, unsigned int)') with an expression of type 'void (struct amdgpu_device *, enum idh_request, u32, u32, u32)' (aka 'void (struct amdgpu_device *, enum idh_request, unsigned int, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           .trans_msg = xgpu_nv_mailbox_trans_msg,
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> The type of the second parameter in the prototype should be 'enum
> idh_request' instead of 'u32'. Update it to clear up the warnings.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
