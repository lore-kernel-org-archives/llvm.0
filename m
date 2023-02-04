Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742A3217
	for <llvm@lists.linux.dev>; Sat,  4 Feb 2023 19:06:26 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id z1so8386621plg.6
        for <llvm@lists.linux.dev>; Sat, 04 Feb 2023 11:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QoMgaRBwpftZsFSUA/NaYhrGZMjYhcRy+dE+lN/6O1E=;
        b=Z4ADyFnc6fwzORH5e6z1NSAJ1n7Z6ZcIr94Kg/BqcBBkg4VqN5ztstkQB1nwZwQzL3
         /J0Zy6a8aS2eqJIjiSwguDn064p5fEtP4siewK92viBFPBWgIch+9JPpDgqDQCCDIufP
         bhxwZyAFguAcg97Bg8W0snjsSEWSW0EuF2k08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoMgaRBwpftZsFSUA/NaYhrGZMjYhcRy+dE+lN/6O1E=;
        b=s5wCbsa2KxxfJio7WRC1M/8n6Tb9Nhuufh4CaS547NxrCjpUMyHWq7+ZnJWC3a8ktR
         gvnQWEpbDEBao1Mq4tI47GwHAGgUWL2e0hPs1fvVf3goYQPHRX+Zi/ovve8m2RrELHwm
         RFUgYfA9ZnIt9gjASdn6iPs3d8AnqOmI2K2FufzgxhSZEb9tHCw+1WeDXIvjC34f4471
         NDFLjiAd4G83iaCOHHx5BF6T3N4MgI0a52K1iiulUVpm9sOi4NFkt/A9Xmaqv095nO7v
         TRg3KICTXPb9RS6zzTSY9dvGKXiN3vqbxaBuehzr/DLkdq7s1b3rpBZV1EgckV3NhUUf
         dvKQ==
X-Gm-Message-State: AO0yUKUiyn/vs0sOM/KSeT8vbYIactb79SwkEfc0JgvtUwDjpxpe6ak4
	TyK5e4ztk9lx8olSIWCeXfh/+A==
X-Google-Smtp-Source: AK7set9ig47OFDDy/8XwlY0OJoIGhW13i8inuO00m8K8SWHbrufKyM3+iZqYP60Vh/6VoQcT+qCXJg==
X-Received: by 2002:a17:902:c792:b0:198:fe02:1f94 with SMTP id w18-20020a170902c79200b00198fe021f94mr898432pla.51.1675537586367;
        Sat, 04 Feb 2023 11:06:26 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902d20300b00194c1281ca9sm3769380ply.166.2023.02.04.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 11:06:25 -0800 (PST)
Message-ID: <63deacb1.170a0220.f078.6779@mx.google.com>
X-Google-Original-Message-ID: <202302041105.@keescook>
Date: Sat, 4 Feb 2023 11:06:25 -0800
From: Kees Cook <keescook@chromium.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] randstruct: temporarily disable clang support
References: <20230203194201.92015-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203194201.92015-1-ebiggers@kernel.org>

On Fri, Feb 03, 2023 at 11:42:01AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Randstruct with clang is currently unsafe to use in any clang release
> that supports it, due to a clang bug that is causing miscompilations:
> "-frandomize-layout-seed inconsistently randomizes all-function-pointers
> structs" (https://github.com/llvm/llvm-project/issues/60349).  Disable
> it temporarily until the bug is fixed and the fix is released in a clang
> version that can be checked for.
> 
> Fixes: 035f7f87b729 ("randstruct: Enable Clang support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  security/Kconfig.hardening | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> index 53baa95cb644..aad16187148c 100644
> --- a/security/Kconfig.hardening
> +++ b/security/Kconfig.hardening
> @@ -280,7 +280,8 @@ config ZERO_CALL_USED_REGS
>  endmenu
>  
>  config CC_HAS_RANDSTRUCT
> -	def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
> +	# Temporarily disabled due to https://github.com/llvm/llvm-project/issues/60349
> +	def_bool n
>  
>  choice
>  	prompt "Randomize layout of sensitive kernel structures"
> 
> base-commit: 7b753a909f426f2789d9db6f357c3d59180a9354
> -- 
> 2.39.1

This should be fixed with greater precision -- i.e. this is nearly fixed
in Clang now, and is likely to be backported. So I think we'll need
versioned checks here.

-- 
Kees Cook
