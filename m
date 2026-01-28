Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E5341AC1
	for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591844; cv=none; b=b1QHhpft63Gm823eITPtnZUayDst5FCZp0dXjkTp9N9IfV+mv/vrelyA+Cc05XVSRq3GFAQC6MvB8nUXnp7mzJ6cI4CgZcn8hOzq28ZX3STWDJQKTXC1j9ay5fAUiK14m1JonGzb31Oh9sFQC3DqPmdDA/n8LRFub3fD5E4yra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591844; c=relaxed/simple;
	bh=yO6+U0qaxUaYOUYCKg1MexH3YZt5dPEUe3lerkYdUFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GczVnzoKnwp/9RBfE7oUt+ikSzctDMTaAKyYFlG43UTuk/NHICtI09RwMYj+mgeZhynRFlNNMLmHhrp4n1I85DYtpFoGbPJyqANsXJmGvjTZSCDGUGqPjavU3KY1ABBI0J6kjWvkpznOB7c0A9eEd5pVd0MOswB2QrQQtEQfcoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B4wz4sOa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B4wz4sOa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359a302794so4159561f8f.1
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769591841; x=1770196641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/k4MsBbSp2/KH17/DEg4LJaTxhduisqFO54YsL7siAQ=;
        b=B4wz4sOatPoqTcrwMGe+Wkha/9eDA+cAqEhz3npFbHMI864UAt73qwJElBZRHc/Tq6
         jGwzLdjSCx/uHjJ20AMeaLBzDka7Ah7Ng6yiNX9TbrEh4cwO49x8gVV8hbJA02yjwe/s
         D+jueZEGIv21+HNc5r5FmdsUoaCtsZVf03Gjyx6I5k8jVFp8Edj+UiR2f/EG9PVxq5m/
         WYvho06EkSqR5fy30SNsR5vxEyGB+KyrHU8RbqHbCh1NNEJhSnP7xC1mx85aDpfchRY7
         4aPklkjR7QXwwiV7AZKcB4n9/JFKkDuiZryTQ2xFDqAzcP9Na7pznHF5UhbQzP7OdYLy
         /TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591841; x=1770196641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k4MsBbSp2/KH17/DEg4LJaTxhduisqFO54YsL7siAQ=;
        b=m6/gw2wFTeebhTU9wfbem8chyl68Wtuh/twWjTIFzHpQYULWnF1f48saVIKU65N3MD
         RpJeV6IN2l7pvqXwZX6jxW68KM91P+f9+0NqP/37+xc4rVADMgXzEBJhhAa7rGsHKhuV
         Q3sCec4DNVMEvwGPbRtGh46fYURuFm8X862M0hxRP7sRse3nZ6ZotG8ziaJV8otHB7HM
         tGIf+7GDVqOhYdBPJ1cZISk75bpBabL2hczsp5wrxdszO/Lgw6sY14EZT2iSsiKqydtN
         Vw49VIIaHuRE92ci7v4QMnPLWB+sUb/aB+GXcH1Pq2ZJhtaaAzBvuRdwDypejQnDEkSd
         G3pw==
X-Forwarded-Encrypted: i=1; AJvYcCUzX71TXJERWE4pHnMJrNPh2eabmMlTq2BsjUAnLO4XSDeUBm24up6UhrGSiUPIKKJt6rjk@lists.linux.dev
X-Gm-Message-State: AOJu0YxyXah6oBn/fZ5e6VxCRDFf/8LgL/pAKd9BcRotrH0OxsJXOrFR
	C+iAN2EL36SuUYSJ+WoZUTlsrZUY2rMsbRo1SGw8nYB+DxUBbQmvCtJoaROfBgpFGQc=
X-Gm-Gg: AZuq6aIQyVZNYADiTaYVjipD1C77EykE4v1KHH4PjiQGtE6FPE2Iq+Aky6zT+iYi2pB
	ZAMCDRf6gRo/QY4caYAb80v4JjpVlM9oiq7Ld32WL84qT33VIKtVAWL6cXWsSJMVnljOYxqYUlA
	XLr9xo3x04ZmM8QbfSGPYzNzWYOSlajyYo1spFXDYSvDHWp99UXRe3HBq6NxW9FuWByNO3KI7WH
	Z+VEIQKYu4OkzpZthzVwEp7Tv991x/C4tx5x+5ZIRro5sGo3TVs5GGdl5vfNalo+clkIHNs86hK
	T39S3tS/AlFc6u2KaG3dXoFiz6+dlmjg3jPk5I8lwWT19AhQA3MJJUua4pLsz6uZ4A61W3QCzlW
	rqqPBsdqoX0cbqtEI0szPx7an6Hgef2PMq2+MIaO/C1GS7xgVPbz8a15qbTKzgG++lHUOA53zW5
	IYS+eRfGbSrqlwdQ==
X-Received: by 2002:a05:6000:1ac6:b0:432:84f9:8c04 with SMTP id ffacd0b85a97d-435dd06e029mr5958691f8f.24.1769591840559;
        Wed, 28 Jan 2026 01:17:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm6281836f8f.15.2026.01.28.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:17:20 -0800 (PST)
Date: Wed, 28 Jan 2026 10:17:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
Message-ID: <aXnUHTu62MmNGNdy@pathway.suse.cz>
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>

On Wed 2026-01-21 11:10:08, Tamir Duberstein wrote:
> This allows the compiler to check the arguments against the __printf()
> attribute on __test(). This produces better diagnostics when incorrect
> inputs are passed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to push it right now. It took me some time to get back
    to this mail. I am a bit overloaded at the moment.
    
