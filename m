Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC62C11E8
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011640; cv=none; b=uvtNf7iodPnPpDZvLJamaz8WDALSRVBuNxYPPovqawEpYXFgYYHubz2Gi5wyPVdFJlzSHXNPH2yfsSwRRvAmIFHeGE32GChCdH7WNzCn/frADp7Dy4lCL73yw0uyi8V4eGSpul+7DoJtCaHxYF7IiN1yWMY0lZNlBY8B+Y1lmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011640; c=relaxed/simple;
	bh=R8j2uJWCuPQF4jnyFmqkM+Jyum5uRWUwD37pUrqBtog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YplSRpom7IkoLoZM7KpSnGM//cJysyakA5WObWAUfV427XKqtAsZIEZcT8c+cl78BIhuYdIx9Gig+tL6swMx3izReOvJ6gjEWe6viLqccXVtRTVgtGs8/kS+kXTEicE8iRoGlEWGBJT8dUyzBMCQdUZzKQDrNJf1bG6PoKTMDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cZ61vySY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cZ61vySY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4153106f8f.2
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 08:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769011636; x=1769616436; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wg40ewCl+D/97ANr1h+YLqT6oKOLJb+xdwWdPiyglqQ=;
        b=cZ61vySYiZmYU2PQuFdpg2zx1XyWEiM2RE4jBJj/niG+Z7VGUKeA6pvfEbKQ/OWW3P
         q4RyM3+TfmrxKA/KKBxMVSIwJVkLfeTCfNevKHt5R5BRNT2PEf0L7e+eE8X26DfWUAs7
         Ffk2tzpz//1LrjiV6510tpJm/0aAkiSS8gV4r8NZwI3sBFXykYcKpCReGhRE99hybKtz
         ddPx3S4+31JElaMWLr+ksCIgkogJjGaknyxDRw6uGNCzZNybdPnb8+jVVgswnZbgHgYM
         ln4wH7ZmDAlqj5AQEiecHP0vlmW4s6HalMhhxGfdYr65URE0XND9jBmTXjOHgwBiPVCH
         VCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011636; x=1769616436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wg40ewCl+D/97ANr1h+YLqT6oKOLJb+xdwWdPiyglqQ=;
        b=D0mA99isXk1ACOxirdyoBt7lCIsO1ipEAUe+JnrLknmZQz7oO5/fJIHY9904tRdzmB
         LIut8FZl4WthV6JPhzk7+kqXnWdVtzVX2hUToBfNtjmrbV4oCMLf8zJ/ockVptdU1iM4
         2pmED8SRShhDNowaQ05IkKSYSUYNEVlU+NgVkPacLiDKG4vaPAr2s4iqNfbyFYgNKcbB
         Kot78eQrgaSp403TcNWwvgKml3q1lL1pWPpPEwwtoSuhJDO5qsSsQOYoskMghflm3GEj
         6uH8uu/rXXqBw1DtsHfQtMIG02fsOpw6cULfsukAou3GktmTdsENRQ/oYFOEp/N7rNc4
         vdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2gF2UnkP0CApx/GQ3D/UY9eJj4JrusXw6farCFC2VoTbFx/25B+TF+yPnotmBB2I++edc@lists.linux.dev
X-Gm-Message-State: AOJu0Yy66zyuAaa3WSi6MIvohEEoutrG0QQ/5P0nJ1VX88n9caWNZC8B
	cVsaB2r6LPDMuJ5N+W2JuyEFZq4ui3PhWV1lpjLu4Cp4UcnEDc9TEmnRjcU8XPM03Mo=
X-Gm-Gg: AZuq6aJHwQnqO9VVkfaRl+CeuscUFyisP7il+VlmKVQZrMtt5PJzGkYC/Vx7lhhCj5y
	ew/LIQ/4H1QARpd/LIoISb3u5dsSdPwUKlYYx0HGHl4cj1hRkt1qtrI0prvYtSNuWYN9/QCBgAO
	8LgkZ1Kv7igJa32tfUtpPa9fvtLlKuYrhCZpPwg2FNXWH+n8iLP9vg4KM58SNOFLWg+vZunuZnJ
	I9nRphWpM0coPcL7UZt+bSLwV76hro0Ktqp2YvP6fmWh9nU2MYy3Plz01Rp7K0d+xQxyN/RH6wY
	nMsXg1YN5dHxVFdriYVSaUm87iH3yhiKxE73nMzcBacodTiQRtwmgcidtQkYjQSBPclaKhrC34C
	H1cBUuWvB6y/QdmjZk6RmtKPkB/5blv431ZvpzkO21YIJaqpPHL+1U3wQhhmmMfON6vrb47QBP8
	3vbSU=
X-Received: by 2002:a5d:5f94:0:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-43569972d22mr24018615f8f.7.1769011635930;
        Wed, 21 Jan 2026 08:07:15 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm38511033f8f.2.2026.01.21.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:07:15 -0800 (PST)
Date: Wed, 21 Jan 2026 17:07:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] printf: convert test_hashed into macro
Message-ID: <aXD5sNXwhnU5ycam@pathway>
References: <20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org>
 <aW3pgf4FQHFCC9Bm@smile.fi.intel.com>
 <CAJ-ks9kOpAVq=-b2AXp02F2gJEAmJZxKE=UAGa5ypsVE_an3pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9kOpAVq=-b2AXp02F2gJEAmJZxKE=UAGa5ypsVE_an3pQ@mail.gmail.com>

On Tue 2026-01-20 10:50:09, Tamir Duberstein wrote:
> On Mon, Jan 19, 2026 at 3:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jan 16, 2026 at 11:27:03AM -0500, Tamir Duberstein wrote:
> > > This allows the compiler to check the arguments against the __printf
> >
> > __printf() since it takes parameters, OTOH it's an attribute at the end,
> > so I have no strong opinion on how to spell it.
> >
> > > attribute on __test. This produces better diagnostics when incorrect
> >
> > __test()
> >
> > *This is reference to a function.
> >
> > > inputs are passed.
> >
> > ...
> >
> > > +/*
> > > + * This is a macro so that the compiler can compare its arguments to the
> > > + * __printf attribute on __test. This cannot be a function with a __printf
> > > + * attribute because GCC requires __printf functions to be variadic.
> >
> > As per commit message remarks.
> >
> > > + */
> > > +#define test_hashed(kunittest, fmt, p)                                   \
> > > +     do {                                                             \
> > > +             char buf[PLAIN_BUF_SIZE];                                \
> > > +             plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE); \
> > > +             test(buf, fmt, p);                                       \
> > > +     } while (0)
> >
> > Make sure you used tabs to indent the \:s.
> >
> > ...
> >
> > The downside of a macro is a killing of compile-time type checks.
> 
> This macro still bottoms out in __test() which is a function, so I
> believe it preserves (and enhances, per the commit message)
> compile-time checks.
> 
> I'll send v3 with the changes you requested above.

JFYI, I am fine with this approach.

Best Regards,
Petr
