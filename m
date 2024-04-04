Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904F13AA4D
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712266049; cv=none; b=APh9NLG2o7NZlivHMwo5V8IY6bsXjUPc1TuYNgDXAL6PRqvYne9MA2EPLdTa1O3LwTcDp7p3Lf1FWKTIAmV1jWWXfMAwYk1OVKAaONeM4EL5DiEIc4X7GY33OBIeIZQlezUttwyf6gKgX9LJDpcsVshXCZEcZqIyn2SIC6/5qdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712266049; c=relaxed/simple;
	bh=zvuYWl21FSsrhHyfcnLt8fv7pQ1nEZE2mtTQ0ru0qJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1h9EdMoeSc8T3nYeb3YhPpChDyKctb4tkSruTds3qj9RsiO1b0TpxUgeVGe8ARVC6RJnJK1JrAtaWhIXJ3Qgz/z8LSCKW+Wv+NAkUT1O34s05c3JzLQJQjUgrXRXaAYlOQpt8pQJ9FoIj8QQEiDEN09Z8PsJQFjzidBms8iIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=evbi4RQK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="evbi4RQK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e2987e9d06so13126525ad.2
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712266047; x=1712870847; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y44qs4OUh5ul6NtjE+55E8vlpwqKRAnt03mDTkQinM=;
        b=evbi4RQKUlZUlIdFLz4oG/XX9SbNsexOKbbEb0fEjEeOcFeLoLU/SXKt0luk0RtvSZ
         F/tLd8ARC59M5yoLXCv9YImH+hIA1G1D85X/VIpaejcdO8daryJnmeRL4gLVKotVmq/M
         JAK6DTgL35U6AVNnkvHMcn3yOJBr4FmovqrxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712266047; x=1712870847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y44qs4OUh5ul6NtjE+55E8vlpwqKRAnt03mDTkQinM=;
        b=rd1l68PLuR/gf/sja6CWbN+xenuhbFmhvOnGNRuBJ7ddR1IZ3FjX+nphe50iHIcCFb
         IvbxPlK1p9dKNAwm8XOkFtZcYuKMlMNRxGt0w6m8qOB41getu977CGEMrD8nzI+pwqHC
         WAz86X7WMvjggmivDQxyIGzbD9eU4OleuvUMQC8oFwtc+HRhnsPcjFH/+k8KcAS0Okkc
         Ewy7VZJA0UDJPRlJmK4zcxlcNQ9LOr3ykDyY8rVPct/uAPo+s44TxG/FIxHtNHtK45S0
         7o6e1htQ9293IJAGLScoJ9izcYwn/12ct0C0a73M4R4kBVXzNX3xCb88EAde3vYm/YtL
         6ZJw==
X-Forwarded-Encrypted: i=1; AJvYcCWxtNVT+bwDXftdFnQwQub0E17ipuTGtxMhAybI5041Nj61as8BUttsOcWzwJ+SolCdW1Yc5JpncbAILsvaoggz2dJTvA==
X-Gm-Message-State: AOJu0YzgYaWmcc88Q4h5AY3sLRObCy118I5qtD46xGuhCVP/xkQgIxsW
	TgW67msl1ZrSb3dcQ+e45PLXVhYMLOVzmWCpHIyL/mZMjBQL7rWOmkROtIk60w==
X-Google-Smtp-Source: AGHT+IHi38RDnlKmYx0khv6mZQJ7Liv0SUQJ59Uq5gOOAeCsZSf0YQQlHiQV7NO8+/ZIFA1CRlITrQ==
X-Received: by 2002:a17:902:c94a:b0:1e2:7c72:767 with SMTP id i10-20020a170902c94a00b001e27c720767mr3397197pla.30.1712266047076;
        Thu, 04 Apr 2024 14:27:27 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001dc01efaec2sm81777pln.168.2024.04.04.14.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:27:26 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:27:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 0/8] CFI for ARM32 using LLVM
Message-ID: <202404041427.E2A40D1@keescook>
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>

On Thu, Mar 28, 2024 at 09:19:23AM +0100, Linus Walleij wrote:
> This is a first patch set to support CLANG CFI (Control Flow
> Integrity) on ARM32.
> 
> For information about what CFI is, see:
> https://clang.llvm.org/docs/ControlFlowIntegrity.html
> 
> For the kernel KCFI flavor, see:
> https://lwn.net/Articles/898040/
> 
> The base changes required to bring up KCFI on ARM32 was mostly
> related to the use of custom vtables in the kernel, combined
> with defines to call into these vtable members directly from
> sites where they are used.
> 
> We annotate all assembly calls that are called directly from
> C with SYM_TYPED_FUNC_START()/SYM_FUNC_END() so it is easy
> to see while reading the assembly that these functions are
> called from C and can have CFI prototype information prefixed
> to them.
> 
> As protype prefix information is just some random bytes, it is
> not possible to "fall through" into an assembly function that
> is tagged with SYM_TYPED_FUNC_START(): there will be some
> binary noise in front of the function so this design pattern
> needs to be explicitly avoided at each site where it occurred.
> 
> The approach to binding the calls to C is two-fold:
> 
> - Either convert the affected vtable struct to C and provide
>   per-CPU prototypes for all the calls (done for TLB, cache)
>   or:
> 
> - Provide prototypes in a special files just for CFI and tag
>   all these functions addressable.
> 
> The permissive mode handles the new breakpoint type (0x03) that
> LLVM CLANG is emitting.
> 
> To runtime-test the patches:
> - Enable CONFIG_LKDTM
> - echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> 
> The patch set has been booted to userspace on the following
> test platforms:
> 
> - Arm Versatile (QEMU)
> - Arm Versatile Express (QEMU)
> - multi_v7 booted on Versatile Express (QEMU)
> - Footbridge Netwinder (SA110 ARMv4)
> - Ux500 (ARMv7 SMP)
> - Gemini (FA526)
> 
> I am not saying there will not be corner cases that we need
> to fix in addition to this, but it is enough to get started.
> Looking at what was fixed for arm64 I am a bit weary that
> e.g. BPF might need something to trampoline properly.
> 
> But hopefullt people can get to testing it and help me fix
> remaining issues before the final version, or we can fix it
> in-tree.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

For the series:

Tested-by: Kees Cook <keescook@chromium.org>

Thanks for making this work!

-- 
Kees Cook
