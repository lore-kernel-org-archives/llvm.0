Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C6813C3D4
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712266009; cv=none; b=tB4xO5rWG+8AGgYl8e22zLN7KJ86+SvKXdI/1Zw6FbTuejKJ1RujtY6VfER7Y4HPwt+OaaUc9RDRii6zGsrQwILdvxj81SMV5eS6cjE4MrYPwsUFftHN1V2guIA2+jdh+U89TMbvYkBTtgCNPz56+Og4q1vyCyLJor2DYP5yNC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712266009; c=relaxed/simple;
	bh=8/OTDWwd0PkHDZVVQkIc807xoaRH+QrHOIYJhEaw7/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doLehw4d2/EKzz6igXrAO5zYfljdLpWQclC5SxoWo0MHWlcCcmlwDmq47SNox/4R3O4yKKwUlN9glSt2QCDAfhzBIldXorjyBB8fPySCFW2PI382TNGN90TejeocDMu1FdOLzDc+L5BhRC2multag8hj/GvfADdrA98O8lhFd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QZrESaY1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QZrESaY1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso1104419b3a.2
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 14:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712266007; x=1712870807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgYnGJst+ZiZfm8ZbfksoEITg37DemIHtgCmtLvGPes=;
        b=QZrESaY1Ic7FzMXOUC+ICq1itPg2VsGv1yNg7xwhlmmvZC8pyc72I3CMUxR80gwGKh
         HJYVJoY7yngJ52bgq3D7iADKoITUg83DntmqEeiwUZnBBMxgYYGJXEWETLrbl+rQBNoC
         qH9r48NN+EnE226FUYAEvit2evX8SbFzRe8/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712266007; x=1712870807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgYnGJst+ZiZfm8ZbfksoEITg37DemIHtgCmtLvGPes=;
        b=S/h2vhImZ0GjRUqoEJQOX2YSGgoRFCybXFxM0mJOxYmrtCXtQVoFVyaK45CqXVszJ3
         EyQSzTqgibh4OXE4wcvYECjb/Co1Fja64SK2EbDEqfthRhPHwJwjCKTxYTc77x+vb3BF
         h9q0bH47WWnqbiXC42BhUDAnfJgFjdnNpowpSABjRbgDLU8UaEBYDHhFvtnzskbhEKgL
         ROoZP11Oali8oo8N++WWNvvbzyvxyMxdlxw44jZjPeWg9BWUJbIb9uCDUjALa+x7JpP0
         eS65mmqtmoLrIrSe3a6MMPANbhFJGwIE4C+woDeXNAXDqY82ZzLaSl8rvZwG0gFk4Q6o
         mHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDej3ewpXYGJarkXKbHjGW9p0rotWLhoKl5nm7ijgoo9eS/qFWNJmPSJZk044TYQ4KKjaq705tUYjyfWqWYuMxFqXREA==
X-Gm-Message-State: AOJu0YwP9DiLeAigAGeFc7e+33pgAFxJoAgJN1B/koyuv8c0dcw9SKgw
	uYG+enNAJRL8eP2TzrYTQF1KOsE6Naoe0vFsqu1VM7446sVYWwCn/QpnxJAc5Q==
X-Google-Smtp-Source: AGHT+IE3VAEGnyJZjxWWizzkl8A8UqQPU05exvSE7NCf9gCPgZiPeGDco3wbRo8ROfRWHlGVbpfRGA==
X-Received: by 2002:a05:6a00:1828:b0:6ec:fdcd:18eb with SMTP id y40-20020a056a00182800b006ecfdcd18ebmr513393pfa.21.1712266007232;
        Thu, 04 Apr 2024 14:26:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id du17-20020a056a002b5100b006ecceed26bfsm93629pfb.219.2024.04.04.14.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:26:46 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:26:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 7/8] ARM: hw_breakpoint: Handle CFI breakpoints
Message-ID: <202404041426.F7AA8E92@keescook>
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
 <20240328-arm32-cfi-v4-7-a11046139125@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-arm32-cfi-v4-7-a11046139125@linaro.org>

On Thu, Mar 28, 2024 at 09:19:30AM +0100, Linus Walleij wrote:
> This registers a breakpoint handler for the new breakpoint type
> (0x03) inserted by LLVM CLANG for CFI breakpoints.
> 
> If we are in permissive mode, just print a backtrace and continue.
> 
> Example with CONFIG_CFI_PERMISSIVE enabled:
> 
> > echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> lkdtm: Performing direct entry CFI_FORWARD_PROTO
> lkdtm: Calling matched prototype ...
> lkdtm: Calling mismatched prototype ...
> CFI failure at lkdtm_indirect_call+0x40/0x4c (target: 0x0; expected type: 0x00000000)
> WARNING: CPU: 1 PID: 112 at lkdtm_indirect_call+0x40/0x4c
> CPU: 1 PID: 112 Comm: sh Not tainted 6.8.0-rc1+ #150
> Hardware name: ARM-Versatile Express
> (...)
> lkdtm: FAIL: survived mismatched prototype function call!
> lkdtm: Unexpected! This kernel (6.8.0-rc1+ armv7l) was built with CONFIG_CFI_CLANG=y
> 
> As you can see the LKDTM test fails, but I expect that this would be
> expected behaviour in the permissive mode.
> 
> We are currently not implementing target and type for the CFI
> breakpoint as this requires additional operand bundling compiler
> extensions.
> 
> CPUs without breakpoint support cannot handle breakpoints naturally,
> in these cases the permissive mode will not work, CFI will fall over
> on an undefined instruction:
> 
> Internal error: Oops - undefined instruction: 0 [#1] PREEMPT ARM
> CPU: 0 PID: 186 Comm: ash Tainted: G        W          6.9.0-rc1+ #7
> Hardware name: Gemini (Device Tree)
> PC is at lkdtm_indirect_call+0x38/0x4c
> LR is at lkdtm_CFI_FORWARD_PROTO+0x30/0x6c
> 
> This is reasonable I think: it's the best CFI can do to ascertain
> the the control flow is not broken on these CPUs.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for making this "fail closed". Looks good!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
