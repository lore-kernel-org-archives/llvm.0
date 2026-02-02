Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5642F2918
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 19:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060503; cv=none; b=av8pSvXqFtb0MndKsY0tQeimZozPoWtufUJJrY3reV/5bFJSx9I+m2oK8Qe5eiIaowNXiZjh/V8aA4D7voWaAQ3tMM2+AIl3Dh+vEdMGEW/B7P2yZxEaweRl17KkP9TohsHHQ76u93Ll+YdWRGSOjBaVvOQ4ONq5SCXUBktIXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060503; c=relaxed/simple;
	bh=VszuXjQtmIOYBDmlcYgEcvY7XY1PCK4liqJOvnCIMV8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pvm+oIEW3ukV/YeINkf98rhTbKjoJVkEBgp9ex8btkkv9SX3GsHG148HYgew0U8+U2+HK1jIuLZ35S9NDazcPmO5OAWt8hWEJfsA2iyehDHweir9bBsF4qKQIgXTyWT6mKnWfBSGx9sYLBdLRuvpy/aPkQopUMnNahDJmp2ai+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuFL4l+r; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuFL4l+r"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so35573885e9.3
        for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 11:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060500; x=1770665300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e73Tql6+b24rgf2gDbimCQdFoje6dSGN+5ui579isE=;
        b=HuFL4l+rKyLvFXoB+90RR9Rl+37a8z8R1cxgkNLoCACHpkkOfyTYUVX5VHCLW47lgt
         7Si/8HgQehowi3GxbdgCGAkUtmazKT0L0oQEbtxQjB7lMHngKUjm/joKiE3cm0Q20YRC
         prZRkwYwaASLIE20HsyzXipTZ93HOh6J+9LsY2gKyJeTRKOk1q89hH4izkKjz0VHl6LQ
         oj/nFMvG1yyD9Gxepw2luPNnH5AQxL5jHFPMFzLGhpOzSUsgy8tG6+QkxU9yVPIm2aiD
         2FAAkvZ9Xttueo4PwUTvmBPD9IAlsfEHwV31yfbX6EswOTk1CgAL0KcO2GoiGMoRHnS4
         Tqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060500; x=1770665300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1e73Tql6+b24rgf2gDbimCQdFoje6dSGN+5ui579isE=;
        b=OBItmeD/6eqVVDACw0/groX+UE2MZ8HeN6l9TfDvhk1t/AvUOp3u2NnzttNuho6Ngv
         cQEQSLP6GC6fad6Oi3g2Fg+0qxoSF5R4vsasjkbYqo++kaMhM3squJHk91InAHf7HEa8
         EVU1/uU0T/BJ7TzLHTs0oRPevxfO3bUJ1tW/9Tuhu2qDUguoNdnKC+kZURqJ8dLzcuE0
         U5FBXH1sH+32f7xeoKh8jzyF0m7q63vrHsoTRkr0OUxuqYFS7KH0RiP0utAbe1ED8bBH
         yjQgrcgrDbC7qZ9ubv977sVBifj5fAQYOxoc0oOMINiznqYg1swqQIj5tlE7YxKhGVCx
         +KIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP8UUfQWVruffJmMUfaeedUqhklXf+dMcMrDEfo4PIFRnAKghfSp2CdtX5qRFCK0I05bda@lists.linux.dev
X-Gm-Message-State: AOJu0YwhzkZmYPh/m/jiMFc8Rrg/cT9aQBCSp/XWDTa8pdrcd+gYAkOr
	SMqdre+z6TKpigIxwe++GYMM5v2yuOamVS+vxo1Tg95f74gx20j3mrtU
X-Gm-Gg: AZuq6aKbE0pyhDBOe1JZjNvxXjKrXN405n6Jd9O9g/zceWh/ZsdHjcRZb9aln+72YH3
	jPQWb8lf+B1i8SOrcIpGPMuF6VOg8Gpd0eBnuF2g9qwvIDvqTVQ71VUl+LcC/jOmZfLOZN4az4Q
	h0w/jJ9m3lpng2pZDUUU2DnXzdLjlpM9xWqb52mdsbHndhQtr8wkXDO1Vw24cFomv6y2LvbNjhz
	nYPWXU5rSQfJAL+EqtlfGpKy+5WOj1/J/tLL4tKPG58ypxw2xwnrS98ay8cfqDRF4dpBIuJbNf0
	1hJeqZ8eyhR8KWdZgNsWCG5rUcK6mrMjADY/YWcv6o8x5u/ktIJXcGFloK87TkwzyxS0Su+b/CV
	+aRTCaJFkGzZL1tcKF2bCthoMD6DeN4S5gBBkRwCAlnjY+9wJPHSbQjpn499YvnwaSI7zt72od/
	UVnFVWVk0bqhN7/y6xE8dw1pwotbGYpSspaASISCVbPaAGWL/kkSB1
X-Received: by 2002:a05:600c:1f8e:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-482db447b14mr158848135e9.2.1770060499792;
        Mon, 02 Feb 2026 11:28:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051626c1sm8323325e9.13.2026.02.02.11.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:28:19 -0800 (PST)
Date: Mon, 2 Feb 2026 19:28:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260202192818.3002fe7a@pumpkin>
In-Reply-To: <aYDEiOutq3_O8irP@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-3-elver@google.com>
	<aYDEiOutq3_O8irP@willie-the-truck>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Feb 2026 15:36:40 +0000
Will Deacon <will@kernel.org> wrote:

> On Fri, Jan 30, 2026 at 02:28:25PM +0100, Marco Elver wrote:
> > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
...				\
> >  	default:							\
> > -		atomic = 0;						\
> > +		__u.__val = *(volatile typeof(*__x) *)__x;		\  
> 
> Since we're not providing acquire semantics for the non-atomic case,
> what we really want is the generic definition of __READ_ONCE() from
> include/asm-generic/rwonce.h here. The header inclusion mess prevents
> that, but why can't we just inline that definition here for the
> 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> we use that to implement __unqual_scalar_typeof() when it is available?
> 
> I fear I'm missing something here, but it just feels like we're
> optimising a pretty niche case (arm64 + LTO + non-atomic __READ_ONCE())
> in a way that looks more generally applicable.

Is that path even needed?

I'm sure I've built an x86-64 allmodconfig with it being an error.
If you look back in the history it used to be an error.

Anything to simplify READ_ONCE() will noticeably speed up build times.
Even on x86 just removing the check that the size is 1, 2, 4 or 8
makes a measurable difference - and that check doesn't need to be done
on every compile.

I'm not setup to do arm builds - never mind LTO ones.
(Yes, I know, it 'just' involves downloading the toolchain.)

	David
