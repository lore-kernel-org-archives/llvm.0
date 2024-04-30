Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0617584
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714455306; cv=none; b=VMhAacRSKsYqd342d/nDYxSq11sq7czE85RaVE9KcGK9m0dQQCTapiQAcASFGRcW6IenXEdROMTnkpf3+aOS7s5a6XXwI50IdiBs6l8pNizTfkxha4M7Q4o02Ro22MZAPYkZ6ABKruw8aglugpoD3Nc7ElkeYwaeXYlt9M/vG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714455306; c=relaxed/simple;
	bh=0lANZJBk2q8qyeCEkyiuDs1ISrEWT6/wJvz29MPlTds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0DOO2GG41Y46ecQ5BZyS6/OSzqMVL+muEYsgxjYiosbqgRl0MjEV9vozW9XN/+Zr5NAsvxYTOmNBJ+crbAifq2VvNWWYinyfV4QIKe44pA5WI/NG2H9HYlpJuD8xM/tPxZP5OHv2yBIlwEPvCLqzu62T+tk2rFUGQ3aPqbeYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H2KfQMIT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H2KfQMIT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so30808465ad.1
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 22:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714455305; x=1715060105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C86TkJMefuwLFYqPDfjsQaXZDgvqLvjIZeQbeqShpoI=;
        b=H2KfQMITS6t98muwCctHxwv0h7k4n5Xz+W5EkAIHzkK5K6wn6V8KZnaKdoZ9iZu6lw
         Ogoes3UStY5391sBwWhfS7zIklXxQQQRSeg5W/uD4DbNO0PMXmb3UGXvXB9DiFsXMJZD
         QlBvjSyzNcWMNirL2G4PUfYhXbIIwkffFmdEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714455305; x=1715060105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C86TkJMefuwLFYqPDfjsQaXZDgvqLvjIZeQbeqShpoI=;
        b=gadHdyMfrJH3W7SgE1FEpXg3FMyDVMEk+H+Z9bM5hzNDRzKcNwKlU6a4V/X8snApxH
         z3yp7/N+9/zvWxV9bOKFXGEqTlRs8qrr4kA9MrzSUKlq40Xw7X1dY1iT1IZ1b/aAGpbF
         lxV1uhn23M8jBqmRejsI5pYl4TvPKjelCUpomzTWAde6Gl1sokZudK+ireoyM0bln7Ox
         lrI4vQwgTy8zkuPLF9p0KJmiJRfLJAvGScIMUmZcgUj3h4DPW45tfaWdgH+O7hl5A3/Z
         mBCKrpQ2rbYiwq7RMHxuOCW2deaCI/EoNJ/mQoOFN9toMiso4B5MNQqPwmrc1luBlmnw
         Aviw==
X-Forwarded-Encrypted: i=1; AJvYcCXmH6OlBFAv/paidvNuQAekYb0urpXNIcxdUxP//JOENrEuUvLYBbFjz+6WdqmKDeYgplhG8FidGTgCPyj0Dt26AFXh/g==
X-Gm-Message-State: AOJu0YznVNUQHX118B0Cp08tc5PI7fcn6VIccnD/MY6/q3EDx9R9hz4I
	XCYcUef/n6EZNM27N0cNhNfxfoMKNW1qRTZM4c9bSIkXHaBVeeLSHbN+IYCf9A==
X-Google-Smtp-Source: AGHT+IExYVGtME+b7bsTki80m/529C/WFpqN5LWnzvSEWxibnamEqrs4aXGKwGyaazB7ViSXdQpIYA==
X-Received: by 2002:a17:903:41ca:b0:1eb:1240:1aea with SMTP id u10-20020a17090341ca00b001eb12401aeamr16493520ple.20.1714455305039;
        Mon, 29 Apr 2024 22:35:05 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902edc400b001e29c4b7bd2sm21410591plk.240.2024.04.29.22.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:35:04 -0700 (PDT)
Date: Mon, 29 Apr 2024 22:35:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hardening: Refresh KCFI options, add some more
Message-ID: <202404292233.9A98A7C@keescook>
References: <20240426222940.work.884-kees@kernel.org>
 <20240429221650.GA3666021@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429221650.GA3666021@dev-arch.thelio-3990X>

On Mon, Apr 29, 2024 at 03:16:50PM -0700, Nathan Chancellor wrote:
> On Fri, Apr 26, 2024 at 03:29:44PM -0700, Kees Cook wrote:
> [...]
> > +# Enable Kernel Control Flow Integrity (currently Clang only).
> > +CONFIG_CFI_CLANG=y
> > +# CONFIG_CFI_PERMISSIVE is not set
> 
> Should this be a part of kernel/configs/hardening.config because RISC-V
> supports it (and 32-bit ARM will soon too)?

Probably yes. I was worried it might be "noisy" for archs that don't
support it, but frankly if someone is using "make hardening.config" they
probably want to know about unsupported options. :)

-- 
Kees Cook
