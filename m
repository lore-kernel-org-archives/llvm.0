Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40585934
	for <llvm@lists.linux.dev>; Tue,  2 Jul 2024 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719889332; cv=none; b=A1R15yJ9PThpIIENqF9TKSeLg2Jlp+SIDUeXxKehk9un8BYqpBUDZQ/RXTMARPJR3u/jPpg9dWOM2QROJHPrMZrzFcDnRACTptqG9b+WDDKxo57K/7tFly/hHOxPV6BreachTbD4xxGCHg5flD16uBqtdAuzyJ3QC7AaeQQHFIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719889332; c=relaxed/simple;
	bh=juDRxuue6BuNqcCiTQ1oRGV1+UkKo+RHyTXKiyOaT44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKtoq59N5eLu7NH24OBlWf/J/B0EoLmGNKnGfLXTk15G2BsK5kluhyPePA8qdOjkprxT4rTzIMM4r/j5YXtVNUwan7kugiCa1j5Lj8Xaaq4b6kuddt0eM7gcouZOX+oxOnCDxrAr0D1JFOu4on6iPWaqhlXSP/uJWbohJ6bwo1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=i/gRsIN3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="i/gRsIN3"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6bce380eb96so2160184a12.0
        for <llvm@lists.linux.dev>; Mon, 01 Jul 2024 20:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719889329; x=1720494129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ojm2WDT+jRVGV+bXsvRAENxh4cvFhiHctBiMqtse7vA=;
        b=i/gRsIN3m7ecAGK+Ukdo2wSqq0Dxi3y1qYiM5dsscgqHV8sLV69S7XWzFvrJStcGJQ
         OBqwIFVY5ZV8CO4H/ti6rF+QgojwQta+nsIw51N9JH9vxkfg5FskvjYtC6iK6nPTB+x+
         zTdlbQQf1isvjO6KCCmHyaeg+ETFiqS6Frx/9op6xsz/QDhPpr4VR5/QhURA7aAHNDor
         RauGOeEW7KcIk/0J3ub9oZSbzjh0sAACyuDuPuH7IYRnUnaMSUjVUuZq3aBC4v5em2tX
         y1fJOZnyF2w3+M0qFUyeO5s4f756E+NuWDhk05v5dXgLlhVNPL9WIvKTgtNG3raoCetK
         lzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719889329; x=1720494129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojm2WDT+jRVGV+bXsvRAENxh4cvFhiHctBiMqtse7vA=;
        b=ENbDjLPxce+vD1tGNq5zXoHpt4lGOTmzMOhUEi/ieN0JJX2JGl5/ppy0282hVAXVYL
         h7PvXyLzScx1fY8hi7zoRGD7/tT+DZSiohHj175UvM7Da7s5duwZfN2pkFafsP1NSL5h
         UIYAUsiEuU9NOPmLPycMxck1OfdI5M6Z2Gc3ki3vJ01XfdTuy77+WE0kZMDYOd7yvTsA
         SrIznoKV42EWo6mWAuawsSAhPx9ycO+HyIlbFhBbp0yjV0D/r85KZ1yO11TkUeVzA1PI
         UULOFac3yBcYPCziAOeKyE2dj8CGKabgrwD7YsjEUKRPz+lEz13ibt5mKQD6TCjuxX4a
         IxFw==
X-Forwarded-Encrypted: i=1; AJvYcCXGz7RldXnMeHJ7ASXLfuYi1lWhDSIiJJIpmCuApA/knKvYdO7z47QsjmUlE1GUq9YxeenVvQM6/BI+qyZn47B3TqhdHw==
X-Gm-Message-State: AOJu0Ywq4th/uHc+hGcF4vMuwmArzI0uHudmZbhevDeixie8xoNUzVfj
	2Ql1foyWRRdR22PnlLQflJ7ns0f1+QF79QLzTZjqshttN+q+Ho6Ex4vRfQsh3WM=
X-Google-Smtp-Source: AGHT+IFtzRVBgPoIZ5spdIWYcesTZAiiJeslpnCGATGmgq3SV6QGiwVYg4WyG0rOC5lcz8Vf2zmQxA==
X-Received: by 2002:a05:6a20:cf84:b0:1bd:2699:436c with SMTP id adf61e73a8af0-1bef62066c0mr6579915637.40.1719889329603;
        Mon, 01 Jul 2024 20:02:09 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538ee0sm72521095ad.149.2024.07.01.20.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 20:02:09 -0700 (PDT)
Date: Mon, 1 Jul 2024 20:02:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/4] RISC-V: lib: Add pi aliases for string functions
Message-ID: <ZoNtrXawP8nvXUds@ghost>
References: <20240701185132.319995-1-jesse@rivosinc.com>
 <20240701185132.319995-3-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701185132.319995-3-jesse@rivosinc.com>

On Mon, Jul 01, 2024 at 02:51:30PM -0400, Jesse Taube wrote:
> memset, strcmp, and strncmp are all used in the the __pi_ section.
> add SYM_FUNC_ALIAS for them.
> 
> When KASAN is enabled in <asm/string.h> __pi___memset is also needed.
> 
> Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V2 -> V3:
>  - New patch
> ---
>  arch/riscv/lib/memset.S  | 2 ++
>  arch/riscv/lib/strcmp.S  | 1 +
>  arch/riscv/lib/strncmp.S | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 35f358e70bdb..da23b8347e2d 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
>  	ret
>  SYM_FUNC_END(__memset)
>  SYM_FUNC_ALIAS_WEAK(memset, __memset)
> +SYM_FUNC_ALIAS(__pi_memset, __memset)
> +SYM_FUNC_ALIAS(__pi___memset, __memset)
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 687b2bea5c43..bc73325b2fd1 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -120,3 +120,4 @@ strcmp_zbb:
>  .option pop
>  #endif
>  SYM_FUNC_END(strcmp)
> +SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index aba5b3148621..b36325a57f6a 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -136,3 +136,4 @@ strncmp_zbb:
>  .option pop
>  #endif
>  SYM_FUNC_END(strncmp)
> +SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
> -- 
> 2.45.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

