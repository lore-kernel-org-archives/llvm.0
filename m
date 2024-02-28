Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9D15DBB6
	for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709142509; cv=none; b=ExYTuWCsF6xKH4+6efUvGJbYM7hJ5+6MfT1J/7a/VufacqnE31yNyWTJx48hnNF9Y3lnUE+kyDlVhU/GbSdpY0HjsDcNfirOncUMw06XBoXPIUu6jkprTG9FgrCl94ljXMyzGjYRdOzH+31miWftjzvtqxyh7jAi/moQrKuN348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709142509; c=relaxed/simple;
	bh=dXvYAhmkYcjGWARl7hgbthDBAfsGWyz70D4tvgd/LGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3xZLB06+zZU9jv3pB+C22X93Ep+n5cQwKgwIraUA2ZOdJG/k4cAStp2nYux+lJVPyXfwD5hCFUabKHuzjYuxFKylTdvFn1YljOTsp/zugU9ymadfqh4zW4F7SXQN2d2V/s2l0PRPbUoprZM+Dpg+UGD1JrTdeR9GmYrniOODWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n4omfxCd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n4omfxCd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc0e5b223eso505145ad.1
        for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 09:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709142507; x=1709747307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WM/LnzzYMg9VooSl3tyFbgZCCVmVnx60g53OBbQ0+k=;
        b=n4omfxCdh9x9Rc32IRQJ4g+D1uTu2iF/6k8Rq1IR4MRrDnP3YPqgP5ekcBTwO6gd1P
         fWc42sSL6MGzF/DvHMooDIPjsZqKaEvxtkDr+jlhZ8ZLer+TvZtBZbT8WgFugg4/DP+M
         ncg0piBAfcOKn/nGhARXkZgrMDXuaGh/nB92Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142507; x=1709747307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WM/LnzzYMg9VooSl3tyFbgZCCVmVnx60g53OBbQ0+k=;
        b=Yfy7J47gdvDA5gUNlY64OZugS/97Bl0ovCEwpoiZuNXbhL16yY43WMNitDYYEoha3g
         0K3RekzVE8AlveB42H6nZnhh6OgQkwdn6nEmeD1CZr4Seqj4aTh3NXry8gf61sJeQxxi
         iFiY7upw0Bxf2vY2y2QB7nmWw/Egp49KsCJfcfBA2Bv3kNbDCXPTdle+AGHw1BbKe7+B
         mB24Q+WQxVok9j14KoK9RS+z8I3CaoKBZ0VxwAeOZWRm+KoqU+4lDOy5y+tzASVPupat
         FJMy1kavwJYuhkmgvHwMl/nTYBuyl6xQFTZ+p7cTrkE8by3kb6AZmAihfqKS4MfqD7UL
         PChA==
X-Forwarded-Encrypted: i=1; AJvYcCXHIpupvynE6WjLBz6tMNqhLo2hlmjjkjxMJ1PTh7i4tX1hpsrx2YKRIBYmzbT4H9iESinAaAktNCf1ZX9I5c1/Ob2rmw==
X-Gm-Message-State: AOJu0YyptPdHZ9TnruOsBPOZc7czlQ4hBXDbmdsRsTNhsCdv5WVPgcfg
	j2YDkr7huew8TD9zEBLEpfatAElPVD4GhrecrRaAocQDDvqAgQ4tE75iDsTQJw==
X-Google-Smtp-Source: AGHT+IESP0EHYAJw+XKsHw0+0gEOxsKXhQ4JPqQc7jTcHPqGl3oRdKut0HWB7EJyZ5KfIQrOtGCd4w==
X-Received: by 2002:a17:903:110d:b0:1dc:1ff2:c6d6 with SMTP id n13-20020a170903110d00b001dc1ff2c6d6mr248654plh.22.1709142507278;
        Wed, 28 Feb 2024 09:48:27 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ba6-20020a170902720600b001db604f41dcsm3564350plb.103.2024.02.28.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:48:26 -0800 (PST)
Date: Wed, 28 Feb 2024 09:48:26 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, rui.zhang@intel.com,
	gustavoars@kernel.org, morbo@google.com, justinstitt@google.com,
	stanislaw.gruszka@linux.intel.com, linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] thermal: core: Move initial num_trips assignment before
 memcpy()
Message-ID: <202402280944.CE26D81@keescook>
References: <20240226-thermal-fix-fortify-panic-num_trips-v1-1-accc12a341d7@kernel.org>
 <6a6be01d-3453-4268-8b2e-0279cc20835d@linaro.org>
 <CAJZ5v0h87k6xoi-9V0Cfb2rHQcr-STfG_bNWpzfoj4Dy46U0Lw@mail.gmail.com>
 <f81af0ae-7458-47d3-90ae-71d5217ee7dd@linaro.org>
 <202402270816.0EA3349A76@keescook>
 <bbc65508-eb0e-4d63-921b-85d242cc556f@linaro.org>
 <202402270852.E46A5268@keescook>
 <3ed4ad69-1229-4834-95b7-9397364ea401@arm.com>
 <20240228165651.GA2158263@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228165651.GA2158263@dev-arch.thelio-3990X>

On Wed, Feb 28, 2024 at 09:56:51AM -0700, Nathan Chancellor wrote:
> On Wed, Feb 28, 2024 at 08:41:07AM +0000, Lukasz Luba wrote:
> > Hi Nathan and Kees,
> > 
> > On 2/27/24 17:00, Kees Cook wrote:
> > > On Tue, Feb 27, 2024 at 05:47:44PM +0100, Daniel Lezcano wrote:
> > > > Ok my misunderstanding was I thought sizeof() was calling _bdos under the
> > > > hood, so when calling sizeof(flex_array), it was returning the computed size
> > > > inferring from the __counted_by field.
> > > 
> > > Yeah, sizeof() has a very limited scope. __builtin_object_size() has
> > > more flexibility (via the 2nd argument, "type"), but it was still
> > > compile-time only. __builtin_dynamic_object_size() was added to bring
> > > runtime evaluations into the mix (initially to support the alloc_size
> > > attribute, and now includes the counted_by attribute too).
> > > 
> > 
> > Thanks for your earlier emails explaining these stuff.
> > Do you have maybe some presentation about those features
> > for the kernel (ideally w/ a video from some conference)?
> 
> I think Kees's 2022 and 2023 talks at LPC are a good place to start:
> 
> https://youtu.be/tQwv79i02ks?si=Nj9hpvmQwPB4K3Y4&t=452
> https://youtu.be/OEFFqhP5sts?si=u6RnOP641S8FkouD&t=614
> 
> https://outflux.net/slides/2022/lpc/features.pdf
> https://outflux.net/slides/2023/lpc/features.pdf

I've also got a write-up on the entire topic of array bounds, which ends
with some discussion of "the future" (which is now) involving the use of
the "counted_by" attribute:
https://people.kernel.org/kees/bounded-flexible-arrays-in-c#coming-soon-annotate-bounds-of-flexible-arrays

-- 
Kees Cook
