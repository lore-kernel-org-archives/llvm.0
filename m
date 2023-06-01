Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EB47017
	for <llvm@lists.linux.dev>; Thu,  1 Jun 2023 18:28:12 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b041cceb16so10330875ad.2
        for <llvm@lists.linux.dev>; Thu, 01 Jun 2023 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685644092; x=1688236092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZLQgV5OTogJ1ylkCDiOjxfc1T+CJXFQFeKoN9hX3ug=;
        b=ac+D7llpyM/BXxwdJaEuWvmMQMeui0FxZcRRZfnSpxqEIcArtXlCuZLwdqvfE3qGok
         4YJ2vXhKuTgstjkSaUUfSn4yhgRW5lkYVmqdpxgsomkqIhx3z9M67ufAL1kVHNnkKSkr
         AnBhc03iHLRfh7oBDG/8KKFHGAinTY75WMNeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685644092; x=1688236092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZLQgV5OTogJ1ylkCDiOjxfc1T+CJXFQFeKoN9hX3ug=;
        b=KEr5VgvFH1mhAg0hC4aRhp+fU4d+UOYUhvMSHEnslbq1saxjcXH/1DndT+8xBU6Wku
         OrAP117vTxyxHoNQosN/R5eds/pxYHUXr5053tnWipyDfELT4z8qGIRQeByLFz4F6Znt
         B9mGw0W+XWQwumfhLHuSev9VAz+55stcvwXybRkhbLhXbcH15ltZW155M2W1eprFRogt
         begmQEXo/Y1yNJJzpTB5S/6diJvIoPYdXBfDyteRVa6ChnCC/5mlVPe4lTuA2MFATiuO
         cZw3D+b3xFUULsQtZZypzYq3k0vl/z4nlTknU2mr0O7jMLnsB2YT9nsx14ggJR0AmZqB
         8u5Q==
X-Gm-Message-State: AC+VfDxlegDUTcSvWg9K0KkYaY3UpyoWw19nT/UQ9avEcSiltkMHvcPE
	Lazo58f/anT5sHHehc6J8vTHuA==
X-Google-Smtp-Source: ACHHUZ6VsAWG8Oi4STZkNdzz+9GCCgAqrG0b/8X2yp5U2lZsp1m4pLUb6tcFZsc1F6+QClxMAWQwkQ==
X-Received: by 2002:a17:903:2286:b0:1b0:1036:608c with SMTP id b6-20020a170903228600b001b01036608cmr261752plh.25.1685644092279;
        Thu, 01 Jun 2023 11:28:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001ac4e316b51sm3833178plh.109.2023.06.01.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 11:28:11 -0700 (PDT)
Date: Thu, 1 Jun 2023 11:28:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>, linux-media@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [RFC] ubsan: disallow bounds checking with gcov on
 broken gcc
Message-ID: <202306011127.B801968@keescook>
References: <20230601151832.3632525-1-arnd@kernel.org>
 <202306010909.89C4BED@keescook>
 <f6fcae8a-9b50-48e4-84e9-c37613226c63@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6fcae8a-9b50-48e4-84e9-c37613226c63@app.fastmail.com>

On Thu, Jun 01, 2023 at 07:50:38PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 1, 2023, at 18:14, Kees Cook wrote:
> > On Thu, Jun 01, 2023 at 05:18:11PM +0200, Arnd Bergmann wrote:
> >
> > I think more production systems will have CONFIG_UBSAN_BOUNDS enabled
> > (e.g. Ubuntu has had it enabled for more than a year now) than GCOV,
> > so I'd prefer we maintain all*config coverage for the more commonly
> > used config.
> 
> Fair enough, I can send that as v2, but let's see what the others
> think first.
> 
> >>  config CC_HAS_UBSAN_BOUNDS_STRICT
> >>  	def_bool $(cc-option,-fsanitize=bounds-strict)
> >> +	# work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110074
> >> +	depends on GCC_VERSION > 140000 || !GCOV_PROFILE_ALL
> >>  	help
> >>  	  The -fsanitize=bounds-strict option is only available on GCC,
> >>  	  but uses the more strict handling of arrays that includes knowledge
> >
> > Alternatively, how about falling back to -fsanitize=bounds instead, as
> > that (which has less coverage) wasn't triggering the stack frame
> > warnings?
> >
> > i.e. fall back through these:
> > 	-fsanitize=array-bounds (Clang)
> > 	-fsanitize=bounds-strict (!GCOV || bug fixed in GCC)
> > 	-fsanitize=bounds
> 
> From what I can tell, -fsanitize=bounds has the same problem
> as -fsanitize=bounds-strict, so that would not help.

Ah, did something change with GCOV? This (bounds vs bounds-strict) is
the only recent change to CONFIG_UBSAN_BOUNDS...

-- 
Kees Cook
