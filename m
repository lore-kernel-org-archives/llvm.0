Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1412FB1A
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714591661; cv=none; b=O55jIVbHvUWjU8BIQVUB0gDxDTwvup/L7L8zh/Y6kAnrHDHkR2/cfpy+jcyAypKs0O6DqpNYcBk2x9YZSDTHegAPgHkmSwqjz+/8UCnsO2KVO11EV71lLsSj2j2XMhn+ycOm+WJrIadD1WUqooIJmY7Kb+NDABMKCRZr2qmNXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714591661; c=relaxed/simple;
	bh=oQTD5dOBPZRoT6/0eImWZ1AIIrVNNjtcFO1mwR0zuCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKaD/W9tEKJYUiQOEJv8BXFmIpTqDGSzJd7KTlEfc1URaYrXrU+rQW2iLlD3JcUWpmBrU4OSnFXnVgnYIC2g/3yvsQGHG8mKBSrZhCo7uJRFmb7UbTc3ubiMo2vobiUOzr8KYOtW5FpClj9hFwUjXtwJML9udldVLAmoG8isUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EJJ921Na; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EJJ921Na"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec4b2400b6so18709435ad.3
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714591659; x=1715196459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+gDh6NM77cGHfdw7r6TvXLTNq5DARX9/1cTJfxUhiI=;
        b=EJJ921NabQAklasOsmfHiHhDane/AileL7Ny+R+xXXwk+cyBryS2a+ubWOIkQdsESR
         HjeXtdwgT0YT7aJbkfGu8g5T+KmhEYI6hbTaEdojxBvbRTdgorlHsoE8qtcHk/c90Gke
         LiuqJRFHWZaUx9FdbLw7Lpe7cP9UhKvraCQAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714591659; x=1715196459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+gDh6NM77cGHfdw7r6TvXLTNq5DARX9/1cTJfxUhiI=;
        b=J1F6mN+0WtMR0hR+4z0ortTlWzUxSKUcCKVf5zzTxYWd/d5+PMNwX3XtdfEg88/PYO
         EEEWSzcdl5TBaLPSYA1fDER3I0A7GEyvPltEwMaO0pB6M/DB9jJ9AatspP25eYG/Fjj+
         pQlYpZS6SO7RX6HEF9QWWCeyPIdmSjUf7FvSJsKw1dJZ2M/WtjgRSf9HAv0MAb0YRyPG
         EvPnUIrRFzbIkYdEPc9QtC6zaRKo+1YrQOp+1+QhcmRLGmYVgATJqbG1fWeY555ugO++
         Qbux/yZIL83kmX2IO8jM8atmqndNC1jf9kl8lEXtpsG/2awEb+z+3q+2aaD5odrwWpaV
         hXpg==
X-Forwarded-Encrypted: i=1; AJvYcCWsLrVkuKdsekrcy0T0PD1VrKeon/Z20CmMjBzv+JHumZfx5/NQCZ0gEUgBJFtvO2wWDb0oxTDPIqfnbmpJWLLddfKzkQ==
X-Gm-Message-State: AOJu0YzCLrj97m+fK11qMtweMFBdpKBIcah91Mg6eIrKJctPgQqnRnHB
	HTr17TRjjUnrg+BCSo5JQlo5D70HGlhUt8GIXAmPnLP1IlRxq75t3hhkwkjSqA==
X-Google-Smtp-Source: AGHT+IFOqiuy3jqUmROs8uWUXbDQ4LpVCOGiqzH5ePrGMAGevXpVZpwp5HMlWqxDJM6lzgjTQUJGyw==
X-Received: by 2002:a17:902:c212:b0:1eb:76ac:b4e5 with SMTP id 18-20020a170902c21200b001eb76acb4e5mr3312554pll.49.1714591659325;
        Wed, 01 May 2024 12:27:39 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b001eb17af8493sm10043502plh.184.2024.05.01.12.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:27:38 -0700 (PDT)
Date: Wed, 1 May 2024 12:27:38 -0700
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
Message-ID: <202405011217.B822CA08@keescook>
References: <20240426222940.work.884-kees@kernel.org>
 <20240430092140.GE40213@noisy.programming.kicks-ass.net>
 <202404301037.9E34D4811@keescook>
 <20240501110614.GI40213@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501110614.GI40213@noisy.programming.kicks-ass.net>

On Wed, May 01, 2024 at 01:06:14PM +0200, Peter Zijlstra wrote:
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
> 
> I thought it was game over if you could write arbitrary test anyway?

Yes, an attack having arbitrary write control over an executable memory
area is the place where CFI does get much weaker. But presently, there's
no reason to make it easier. With the hash randomization we have, an
attack needs to locate and read the kcfi_seed, otherwise everything else
is a fixed value.

In the future, when we have viable X^R kernel text, then the trade-off
becomes much more clear: we want FineIBT very very much. :)

> The whole CFI thing was about clobbering data (function pointers to be
> more specific), and both are robust against that.

Yes, if the threat model is limited to arbitrary writes to function
pointers, we're totally good with FineIBT.

-Kees

-- 
Kees Cook
