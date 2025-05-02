Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463352609D7
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204945; cv=none; b=qwhMQOlHdU2FmOOJ+MhIbSm6A9rMh84H4VqT9UX5ZIV+39DYr5xlAU2W3FD3SOBOT9bk7jMaJUoJDXj4juQGu7YT9CA0f59Fop0GB1qtXM99bqHxFC/01lNC05hl82FgIcUtidZwNH4Yl2bV1kM32o4PoOqNq3XjZBgt4h+H290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204945; c=relaxed/simple;
	bh=GNeGhze/d0IqBd35rQ7wW2xNehKHCmBz16mnzFHVYoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmRN3LWCqcqcUkn0fygXE8+42CuhlMjjMMSpR3kxrF/XbOuhtCTY77hK8ej1YKgfOsU+ZcqZhx6YhdhBn6oKfuYYxMbKqsvqL3Hq2zPogoWYSXrQmGx6lb896AZOsl8/bOSSokM0nFuKjTRTnxf25HURwvl+FhxfOasHw/h6e0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx37bq3w; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx37bq3w"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2254e0b4b79so35888365ad.2
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 09:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204942; x=1746809742; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql3U/ewtiWig9aIL+QxIB2EPrqmH+OkPP9/cyas0+6M=;
        b=jx37bq3whheRYQh8pgL51P06oHdz90THum1POu7R0+4U29+DbGo6U9/CXPqmEjwpwV
         fUMGNPudcHOoGKN4TDEOMDyN4uQfi1EqRjZpFVlF3JLZ9ZalfIOcIQyDCYuqIvK+uZiP
         NO6fxhmsZzcyvl42T3fQTUHDwXQJGsgHERbPKsLF85+cLz54v3uYlPakca2gTZnbyCrq
         rpPLqHRwsD6Iszj416oZvTff+tP9mlWGxXty/ojOHZrdj8k7Ck640tXIlocbEYQr8xjs
         NWUQFSYUZdmweioZIsJqwCPPmfAV/jC5nW4oBeVvyDc3SgWC/KjMo7UGFHHZ69HczLj3
         4Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204942; x=1746809742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql3U/ewtiWig9aIL+QxIB2EPrqmH+OkPP9/cyas0+6M=;
        b=VeBDp6X9sZWJKCcM2tIgvwRYASqSJK1i9UiraQMdcgvritwbSXCRO7FOI3cwmlXodF
         hz6yZbbK8FSk9dub8fEIvkfXq0epeFtG1o5uJhmo1ujTGQumzZtkXq8WmEQPBdUbHaNZ
         y5HOGgAhts6lTPBSTH06Uy3Mn/9L0WvfPH5ClQvxjw40YJW1WfCLu6ZQM8tZjrw4Y/qd
         xi/oc/HV2kFgPMR7fU3Hb2Gi5EhD8WRNNVoSXpz4fBndcZdPpj9ycINALsouhfHa8Pf/
         owhHUYfdk9PJwqQUqjOt3C3jhfeCsGaP0/i01md5h0jJzbtz2XzHWMTWRfigBOaoYKe6
         T68w==
X-Forwarded-Encrypted: i=1; AJvYcCVv8GG/8E8qggQzeq9MpXb+QlkUtGWMG6zIYqhUOz7Sto/NtjAJRQuXFiX+NE+Bvw+Y9O6Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzLFzvHog9xwapze/0JzzunpPPinlxtuKcjJBePHyxY0M3124Wg
	l/cBbeEnnnejajdSzXKf7xg8X0KgsjBwSALpjWzIbt8HDC3CahU0
X-Gm-Gg: ASbGncvG25clanPLJ+fgi3iEKN6OIetYm3O0z42m/1S43H38C4CQxzoZwnfkNTsmTRF
	a4pZEEOYoDI1Lyh3jGni5bHHw0ulMYAUi2iQh8Evl/dwVOym6rNy7aujF4eMQYggRDTekYkYk9X
	DISE/STQhR/VkRYNP5AXJzNTQtFEDSK57/IAsRGmCLaAwlyVyAd+pbvUUCD2lRRKbqettnmLRbu
	r3Hp7oSeCpc8Zy4sCQKeNPaLv/lUXFV3cJNRVdUkq98XcTkypx73itbgx+fglYS9sbTgkXC3QZ3
	PTiFvU01/JxHvfFvNCtWX8iKY9nc3jO8dTKxOAKC
X-Google-Smtp-Source: AGHT+IFrgZtiF8mQ5Tt0e/TqukoCBkkID1wBp1Z9l7z0z8ByiPbU3GT3h0ptI6jfahNlhQtIGVLrww==
X-Received: by 2002:a17:902:da89:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22e10340202mr50409875ad.39.1746204942276;
        Fri, 02 May 2025 09:55:42 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152293casm9868055ad.205.2025.05.02.09.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:41 -0700 (PDT)
Date: Fri, 2 May 2025 12:55:39 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
Message-ID: <aBT5C81se-z-eQMe@yury>
References: <20250430171534.132774-1-irogers@google.com>
 <20250430171534.132774-3-irogers@google.com>
 <aBTs6yvKlCYYgU2O@yury>
 <CAP-5=fXqLh7RdUok5oqVwyGOWCH3fktmVeECdi4ENBWnEHeJYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXqLh7RdUok5oqVwyGOWCH3fktmVeECdi4ENBWnEHeJYQ@mail.gmail.com>

On Fri, May 02, 2025 at 09:43:12AM -0700, Ian Rogers wrote:
> On Fri, May 2, 2025 at 9:03 AM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Hi Ian,
> >
> > On Wed, Apr 30, 2025 at 10:15:31AM -0700, Ian Rogers wrote:
> > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > inadvertent truncation. In some instances this truncation can lead to
> > > changing the sign of a result, for example, truncation to return an
> > > int to fit a sort routine. Silence the warning by making the implicit
> > > truncation explicit. This isn't to say the code is currently incorrect
> > > but without silencing the warning it is hard to spot the erroneous
> > > cases.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > >  include/linux/bitmap.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > > index 595217b7a6e7..4395e0a618f4 100644
> > > --- a/include/linux/bitmap.h
> > > +++ b/include/linux/bitmap.h
> > > @@ -442,7 +442,7 @@ static __always_inline
> > >  unsigned int bitmap_weight(const unsigned long *src, unsigned int nbits)
> > >  {
> > >       if (small_const_nbits(nbits))
> > > -             return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
> > > +             return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
> >
> > This should return unsigned int, I guess?
> 
> Hi Yury, I don't disagree. The issue there is that this could break
> printf flags, etc. reliant on the return type. I've tried to keep the
> patch minimal in this regard.

Not sure I understand... 

I mean just 
        return (unsigned int)hweight_long(...);

because the bitmap_weight return type is unsigned int. Do I miss
something?
 
> > Also, most of the functions you touch here have their copies in tools.
> > Can you please keep them synchronized?
> 
> Yes, I do most of my work on the perf tool in the tools directory and
> these patches come from adding -Wshorten-64-to-32 there due to a bug
> found in ARM code that -Wshorten-64-to-32 would have caught:
> https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/
> The most recent patch series for tools is:
> https://lore.kernel.org/linux-perf-users/20250430175036.184610-1-irogers@google.com/
> However, I wanted to get the kernel versions of these headers agreed
> before syncing them into the tools directory.

Yes, I'm in CC for that series, but I didn't find the changes for
bitmap_weight(), fls64() and other functions you touch in this series.
Anyways, it would be logical to sync tools with the mother kernel in
the same series.
