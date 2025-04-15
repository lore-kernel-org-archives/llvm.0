Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20A23D2BE
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 19:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744157; cv=none; b=hoJXIROneWj/GUrUDwgBvvY2l+IRgZb2NqjAzrR3N9+RdxoqY7ptD9JZiLV2obC93CcNbn5ueQEgE0gYyUlmmNYWgfq8Hv8PsNwI0DRBKOB06IUMe2b/uMpjti6Q6KQM/dyB9VHT9ppbLyN/FJPjBjADzD/bULDph79eXTrM78M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744157; c=relaxed/simple;
	bh=iRfohEKnexRWQpEc/lF2RxU0gSoH1L3ITPSEH0rjagc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ9fyqDx0j4ZJhWAAth1lzY1/7v/oFjiuKwXEeO5Mcd4ExQPJX7l+IdJsok2x72QELPgckBCHGXdWujSK0AnAWAXNkktKpKJlzgv4NSRd0HnG/CeX5kwA10s+tfqhgnTNyGRJCYmKZHAZBv72HwBaQldGAC+d0U+bV789vapajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=UnWlv7Tz; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="UnWlv7Tz"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fe9fe62295so1714427b6e.0
        for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 12:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744744154; x=1745348954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDD6/twwcqeHpDaR6ey66qD2RyK51nGP7CNi1q0RLAk=;
        b=UnWlv7TzyFLaLSGQqQpqDimlK/5kgFcIU6ThzFpUIyuqVFeWpdcHq646Cg3N9ALroZ
         v5ZdM+UoxyGvke2J9PPsNp0HS75WdGyM8Cy89GiV01l9MyuWMua78QUA8JL+iKJoaytl
         8uqqAAfPO8Cp1ZAe8mmAgMCEdHXEQwZzRSkzz48PKEGYN91usAIVNY/ObK0iBTDDVzkd
         6jVl0eZ7RPceWCRruifhiHuLNa5E1LQWJfANDwCAUzZJbr4hdK5mM91D+MASHXtEmV8v
         AJ+OxVxWIw5D3g9tO7wG31bLP4x2y9RHuD7NcfQx3cE8rP9TH2wnJSugoYEoTwZG4R0r
         jLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744154; x=1745348954;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDD6/twwcqeHpDaR6ey66qD2RyK51nGP7CNi1q0RLAk=;
        b=IQwE1stk71wKSmXP/pX/RlTplvU0UbnnFhujyzMfYmODfgSabXDFSpByjbiep9Eb4U
         FdD7RgXEUXj7wqX8a9yLvhmqZg2O3UQ6kVC0KLDA/XHqA/aicL5Dli44UfMYVn4SIjof
         uWPj8ZaY+zhLOrZvBlshWVMKaaXjd285zRUQtw10SorY+ICSlr+mYx+2Ythsd4QMJs33
         LpSonoB6qyQNkmHbmTFBBOKJQpxMyMz/rkjR0po+B5L7DvvLe+JRvkQp/xmnO8vea+Bx
         81FyHZBLJS7fmqTHGz7v5UXd7w8RR6c/nOTZxcRH7DK7aLtlTSTm2RZAd2Ir6DS/oajC
         ie7A==
X-Forwarded-Encrypted: i=1; AJvYcCX+23ZQ9RcuntkfEzPvBXzzH65nbW2pDXNLYtfgU5Q626WGEUkbj4jHhOAQ5m0xpFjxKnwq@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw7SGHkUE4ZMeOgjP/nVydSvIni861DLuYclsLM1/NR8nB2fgv
	pEdR3v5iyh3i9yTBV/VDLg96rYq38wbhPpTc93Raz+z8Mpir52bQD8eju1sM0MY=
X-Gm-Gg: ASbGnctLTrYY6IvAV5S4Y/c43NxTFyFg8szpH2mqW7435J8JPJY/qGg0nlF09YAEkoy
	x6RNpw/5xJXOe7m9RvKxWUXOa/AJ9qdH/4cZleaKFB+bdSS4wM8A5gbTVIjohbZvUJUSjetOicy
	5FEi9i/BHg3NxywJx9g+JNrz7esLoARicjRTrrbzx8+V3Wox9IgHqUpYFXTAUJeQBMAYBWCcrMi
	+FLBQyA6KgQorLDlYWScWgcjqUZnpnoFWOYayFLsOwerur8glt1+oVikUknEsPpE22F9rNJ012V
	TxpmdLfT4DjzL//3cU8KHMd6zhk8kJyz9nZbVW09FxHp
X-Google-Smtp-Source: AGHT+IHec809ILFcycahfM0VKkH+r05JKpLlCKPhNTFCZi13JrfPzVw3LdxpPb3vtYm3PumnN0HUQQ==
X-Received: by 2002:a05:6808:2027:b0:3fa:8bfd:7721 with SMTP id 5614622812f47-400acb71518mr460901b6e.27.1744744153932;
        Tue, 15 Apr 2025 12:09:13 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:10d8:195c:4f40:9213])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969b722fsm3020469fac.28.2025.04.15.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:09:13 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:09:00 -0500
From: Corey Minyard <corey@minyard.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_6uzH9DsWIh-hIz@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
 <Z_5FV65cyIwiI9rs@mail.minyard.net>
 <Z_5L1J11W-ArXcUe@smile.fi.intel.com>
 <Z_5NDNeDztC1-6vx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5NDNeDztC1-6vx@smile.fi.intel.com>

On Tue, Apr 15, 2025 at 03:11:56PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 03:06:45PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 15, 2025 at 06:39:03AM -0500, Corey Minyard wrote:
> > > On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> > > > Debian clang version 19.1.7 is not happy when compiled with
> > > > `make W=1` (note, CONFIG_WERROR=y is the default):
> > > > 
> > > > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> > > >   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> > > > 
> > > > Fix this by intermediate cast to the uintptr_t, that makes compiler happy.
> > > 
> > > Unless things have changed recently, Linus prefers "unsigned long" per
> > > https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749
> > 
> > I'm not sure I got your point. That discussion seems irrelevant to me.
> > They are talking about pointer-as-an-integer cases. Here we already know
> > that we are passing integer-as-a-pointer and this is the opposite
> > conversion.
> > 
> > > And it would match what is in the match table.
> > 
> > Match tables are tend to move to pointers, enum is usually goes to int.
> > 
> > > Is that change ok?
> > 
> > If you don't like my change, please do yours and consider this as
> > a bug report that needs to be addressed. I prefer more my solution
> > as we do that in many places for the exact scenario.
> 
> Note, the proper solution to the cases like this is to move to info-like
> structure and actually operate with the pointers instead of enums, longs, etc.
> 
> That's what's slowly moving on in IIO subsystem, for instance.

Yes, you are right, I'll probably make that change.  I'm not sure
about the uintptr thing, but I think the right change is to do an info
structure.  I never liked that code as it was, anyway.

Thanks,

-corey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
