Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD981A38ED
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714512337; cv=none; b=NO5QhHru+TvZdizwn+EB6lYG7jqexti3WGhBcCbzb3tzBW46Jx1Dj59A9vW327AOvQQocuGoEcAF7cBo5pOv0ifCr6By9otZGqFagwd51HxY/7BU2zVt1CUlqCUtHN7NJb1Zxcj59PSLDwQThyEgBy4V2isi1AHeHER1pLrSBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714512337; c=relaxed/simple;
	bh=A2BKfjstI0QAqB/arpyjcxV2OCbaaJu3tI5uRAVc04s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TolUgD36Vcb2OGdUwsZYvRJk/0fkwrN08nJ7vavWpBRWwZdishrqYKOmNmmwdUWtX+djnlfT3OCQOgG98U1Mi8OTlje29CHmyS2Na4YTb07TU/uC9B+8R5LmPNP8jtjs8AdMA3ak9vbai6fmp0MXRxuw0/doUN/rxkN6IiZdaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H9Et9n5G; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H9Et9n5G"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f26588dd5eso5294358b3a.0
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714512336; x=1715117136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yL344saeiEHbqmyOopyOdGQH0USlm3SnC2xCq0SoJLU=;
        b=H9Et9n5G3DYm9YSfKuR1JfaWWGC45MsuVtZ9thUvLKsLIgYsCy01srDBnwB07vUVRl
         4dSFbjLVpm/4mopIxTyY9PgIOHpvNthFBLlOJt/LKeUvd+iWdN+spCKKaDuqMvgFtW3h
         7bzaBoXHbayiGI7mwAMpwEQww8jKKPfajYI6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512336; x=1715117136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL344saeiEHbqmyOopyOdGQH0USlm3SnC2xCq0SoJLU=;
        b=vitFQxqA2VVyzPaMryFWrUxQykTY1PdHIQ/tBNM146cPvpxs9aW6VtulR+TTbN90Zk
         MMrWI3KQq0azc3UxSdGnkg8lCliS3ZMGp4y/Mpg0H2LYY7DSbItxNPFWTRf2O7jZ3T83
         V29A6aojL4mObrk+CByx+mWs60S7sB8EA/36UX32xgJxQTdadKhLaGywZnZAt4wOMCVV
         g8VfUXCXcl7p+uQ3D4tK9MvYsKyRxklsnPo6KBXviNo6Eqa8byEA6I4S6cRXrFjW+FaP
         Nuw/OzXg4quck87OwhjXEQ+hWyzb0px8kNwNifNofRb31xmgi5wPDCkRBXEol9I7J7Lq
         /ZPA==
X-Forwarded-Encrypted: i=1; AJvYcCVE0kz9Mn7LrYPJCH59rqwgn0Y/YUs8UtA5SFsVWbEN6XPj2r5/QEv/vHq+DoO3BJpsPZFuFLKpFzknv8HuW/qPEPXMqA==
X-Gm-Message-State: AOJu0YwdhSWOy+p4H2zxzZ020Y9FNIfQAkWixVWtQhM1qzpLN2PT80NG
	hUjbXMA+aFH+8R5kdCO4Wbod5Vn0duKVV924m6FtSF8wMmRnRl8qEx8xd0DZxA==
X-Google-Smtp-Source: AGHT+IFIxVelglvKW5StU7tXy2dZZm6BsDNmXrzU8ELIShBXYB5SRyvBVWCFfa0CxoN7Rk5noHrHnA==
X-Received: by 2002:a05:6a21:998:b0:1af:4fd7:6c6f with SMTP id li24-20020a056a21099800b001af4fd76c6fmr545627pzb.35.1714512335948;
        Tue, 30 Apr 2024 14:25:35 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fb33-20020a056a002da100b006ed14fed3a5sm21507308pfb.154.2024.04.30.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:25:35 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:25:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hardening: Refresh KCFI options, add some more
Message-ID: <202404301424.FF88864115@keescook>
References: <20240426222940.work.884-kees@kernel.org>
 <20240430092140.GE40213@noisy.programming.kicks-ass.net>
 <202404301037.9E34D4811@keescook>
 <202404301409.D3BC98D5@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404301409.D3BC98D5@keescook>

On Tue, Apr 30, 2024 at 02:15:53PM -0700, Kees Cook wrote:
> On Tue, Apr 30, 2024 at 10:48:36AM -0700, Kees Cook wrote:
> > On Tue, Apr 30, 2024 at 11:21:40AM +0200, Peter Zijlstra wrote:
> > > On Fri, Apr 26, 2024 at 03:29:44PM -0700, Kees Cook wrote:
> > > 
> > > > - CONFIG_CFI_CLANG=y for x86 and arm64. (And disable FINEIBT since
> > > >   it isn't as secure as straight KCFI.)
> > > 
> > > Oi ?
> > 
> > Same objection I always had[1]: moving the check into the destination
> > means attacks with control over executable memory contents can just omit
> > the check.
> > 
> > But now that I went to go look I see 0c3e806ec0f9 ("x86/cfi: Add boot
> > time hash randomization") is only enabled under FINEIBT... seems better
> > if that were always enabled...
> 
> And FINEIBT actually can't be disabled... :|
> 
> And as it turns out CFI_CLANG doesn't work at all on v6.9...
> 
> [    0.587220] no CFI hash found at: __call_sites+0x339a8/0x34450 ffffffffac20cef8 00 00 00 00 00
> [    0.588226] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative.c:1182 __apply_fineibt+0x7a9/0x820
> ...
> [    0.619220] SMP alternatives: Something went horribly wrong trying to rewrite the CFI implementation.
> *hang*

Welcome to my TED talk.

I'll keep debugging this: boots fine on v6.8, but booting v6.9 with
defconfig+CFI_CLANG _does_ work, so something in my .config broke it...

-- 
Kees Cook
