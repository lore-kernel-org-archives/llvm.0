Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA418657
	for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708619433; cv=none; b=MeVZp7fqCJu3zHjR3eZhsK0aANsuRrLVG26slvN/J/zqZTyWKYRIrEF5UMolCyW0FeL27Eo1RaUAvzVTM2nfzIrQp4GDm3PUl5IQAqESphT+TkfGUJ9Ry5WxW7YemEwWOGCf3PzP1okz5GLEIc2lmVPLFvyGb9b0g/59knk4ELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708619433; c=relaxed/simple;
	bh=tvTl6cnHeh0Or/x0EM0sozIzmPcHql0YQqUY+KLj/s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/mHTBED0bu+eBoLXm1Y/QfbYuYQ7cgH+8wwX34sXUx/AOH8mAq3aI0+J6ETJWUufaX10ukdGwH/xI5JUazR2rPZF7Ns35W7iKIabvOYCx5PRDSgl8ivXIS4SaMjHrvA6gRcnGQVFvNphEwpZZ0zrgXalBVqaLZj9fWA/xmnN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aq5vImpt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aq5vImpt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e3ffafa708so5338647b3a.1
        for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 08:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708619432; x=1709224232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4tXYxptIN6sn70Hbug773/ZkZ9SuuIE2T60bhUM/kc=;
        b=Aq5vImptJTZahxCZx+6MN4gxwboheH2LIjx3OtkvmtMNPmibm2CgW8Bnj/QS0YArcJ
         GfS8AUrIzkrp1wiAe0UUA2MmaJqdxIaBa7cc9JmGv3ps117slnX1YGs9sDmgq1Z9XCOh
         o3A996A1bn5fQw3gygveug0zGKKTYJB2+WZCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708619432; x=1709224232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4tXYxptIN6sn70Hbug773/ZkZ9SuuIE2T60bhUM/kc=;
        b=YrD7gGlEtkQgxHVQq5LFde96jAfgj7UexqxX7VGts2Vue5ch0s5CoGhV5YlKKxf42l
         4seMLUGS7xsm9ugxZQRFQS0qL1Dtp3Su+L3k+fyHdzgDnJC4FWB0EgmS7DY0eiF0VUGm
         xJxRuZa8dK3XMnYlwLR7C/b6tisd6ZUkNeuMWNlzHTHD8kVXIS+JvMsq+2DKKRJiIOt5
         gWHvDZGkfe1CCPxbn4sA/LoNo7AEZqoeKeuQrfA8yUxN2hlc7wsXG4DtDdwSdHpbfjNe
         Y07PN5lYh4tB3Z8cvOD1vlfQ0dQKY20M4J9RZjnM5mxZmvkIVMtOdgASWDV2kSQTKENE
         NSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYtQlBC5pAHUT0UCXpGNRuLTsvTOQLv3f8A20v4Y8azhrk2HJ4XXtqFX9xiWmEmmG0gr5ljhikgOPm7V4NVSekjcL8MQ==
X-Gm-Message-State: AOJu0YxYfk2iFcphZ/0lOCFkJ7vJc1WMzQgqrjupfO6uLl2Uf5oysIs6
	1IlvgJAAC10SqyoZ5vIHb6CgnQEkoCPiuZPSb7O8qxqbF5l9QThdDg19ZqFtYg==
X-Google-Smtp-Source: AGHT+IF+SlttyWkoW2fWR8cBn7Swso3loSheNnjJ5MidjvOtmykg6loZB+iLagMLSSGm57scJMtnAg==
X-Received: by 2002:aa7:9833:0:b0:6e4:6dcd:8d88 with SMTP id q19-20020aa79833000000b006e46dcd8d88mr10571629pfl.24.1708619431651;
        Thu, 22 Feb 2024 08:30:31 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y5-20020a056a00180500b006e45daf9e89sm8874736pfa.131.2024.02.22.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:30:31 -0800 (PST)
Date: Thu, 22 Feb 2024 08:30:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Puyou Lu <puyou.lu@gmail.com>, Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Sander Vanheule <sander@svanheule.net>,
	Eric Biggers <ebiggers@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/9] fortify: Split reporting and avoid passing string
 pointer
Message-ID: <202402220829.10C6C7C@keescook>
References: <20230406000212.3442647-6-keescook@chromium.org>
 <202304061930.4Au0PASm-lkp@intel.com>
 <19930c5a-f1ed-4b04-b69a-d7259966f020@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19930c5a-f1ed-4b04-b69a-d7259966f020@app.fastmail.com>

On Thu, Feb 22, 2024 at 02:00:26PM +0100, Arnd Bergmann wrote:
> On Thu, Apr 6, 2023, at 13:19, kernel test robot wrote:
> 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: 
> > https://lore.kernel.org/oe-kbuild-all/202304061930.4Au0PASm-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> ld.lld: error: undefined symbol: __fortify_panic
> >    >>> referenced by fortify-string.h:208 (include/linux/fortify-string.h:208)
> >    >>>               arch/arm/boot/compressed/fdt_ro.o:(fdt_stringlist_count)
> >    >>> referenced by fortify-string.h:208 (include/linux/fortify-string.h:208)
> >    >>>               arch/arm/boot/compressed/fdt_ro.o:(fdt_stringlist_search)
> >    >>> referenced by fortify-string.h:208 (include/linux/fortify-string.h:208)
> >    >>>               arch/arm/boot/compressed/fdt_ro.o:(fdt_stringlist_get)
> 
> I get a related build failure from the same commit:
> 
> arch/arm/boot/compressed/misc.c:157:6: error: no previous prototype for '__fortify_panic' [-Werror=missing-prototypes]
>   157 | void __fortify_panic(const u8 reason, size_t avail, size_t size)

Whoops, thank you! This series got a refresh after you did the
missing-prototypes work and I missed this one. I've fixed it and
double-checked for any others. Hopefully this will be clean in the next
-next. :)

-Kees

-- 
Kees Cook
