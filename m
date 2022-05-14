Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B62F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:44:44 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id b12so1718496pju.3
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1kwcy74YlztxWF5D6kkYQbaOPu8Yx3i8Twa6E2rtWI4=;
        b=heJeUZ0XTY4GUls4GZuegGii5t/VwuhS1ZpQ37mLZwfCDKDm207g1xsj8JBCk2bIrS
         aNjlGwo9LlONQauWo+z/yeNmUVPWAY1F26BDhdC/o/qVf3CI2gOFdgEkH/GZhaehv6/3
         Dmfe/noGcr5iWvP/+oMw+4wEkUZvgRyFHIKFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1kwcy74YlztxWF5D6kkYQbaOPu8Yx3i8Twa6E2rtWI4=;
        b=Ly8E79KRGU9dE1v0SJfvCvDGfhe59FtcMvliabhtFBL2I/HU6a0bPE6dapUvSaDSof
         +moPZDni/4dxGbiSfPCiStjOQjB79DMNR9ky9gx77XZtoJFMIMQYrQmgh8t3tnJEAyD6
         L7nolcNJIQCmJqWaMHdNrr6Q32n0WxsxBwstcNm2wZEtcWNIH9MnCg1wXHBgafDrBGdd
         vVMMhcl9EpIBAV51agsQdkF98nW6zTL9aXWOWFWS2lP4uaZsYfyGd7aec4JD+85ppX2b
         Hia4m5uBiUxzoW/ojWc+dVv/NhCjxzYZkGsqrad+xupUpqrd2+SgQAjG0jPdIv9xfiSA
         w1Ng==
X-Gm-Message-State: AOAM531Kv3u2vGGq99wys08KElOiIbWkkNP/3BUuLsvGrMwMKsqXAkF0
	NP/l3XZM2dv0LHlfoSejihc8BjxtmNusBg==
X-Google-Smtp-Source: ABdhPJyYU70G1FRfxpgzmsNw6UDgPZOqMteS5Gy+WK+6rpMWNA2Cp5ca2EEFT2ryVSs0JXIcUkTZhQ==
X-Received: by 2002:a17:902:e746:b0:15e:b4f3:72e7 with SMTP id p6-20020a170902e74600b0015eb4f372e7mr10953716plf.8.1652564684488;
        Sat, 14 May 2022 14:44:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902a38c00b0015e8d4eb1d2sm4121582pla.28.2022.05.14.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:44:44 -0700 (PDT)
Date: Sat, 14 May 2022 14:44:43 -0700
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
Subject: Re: [RFC PATCH v2 05/21] cfi: Drop __CFI_ADDRESSABLE
Message-ID: <202205141444.0C1A3ABD1@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-6-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:43PM -0700, Sami Tolvanen wrote:
> The __CFI_ADDRESSABLE macro is used for init_module and cleanup_module
> to ensure we have the address of the CFI jump table, and with
> CONFIG_X86_KERNEL_IBT to ensure LTO won't optimize away the symbols.
> As __CFI_ADDRESSABLE is no longer necessary with -fsanitize=kcfi, add
> a more flexible version of the __ADDRESSABLE macro and always ensure
> these symbols won't be dropped.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

These macros were so fun to build, though! ;)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
