Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A0A79D9
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 16:36:05 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id o13so5554212pjg.2
        for <llvm@lists.linux.dev>; Fri, 03 Feb 2023 08:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LZtc3hBezsFJ+JgXERdSrjKYkX6f+8fQELANbScmeYk=;
        b=mHrlZ7VUo1d79tXgLzaqxxG9hcdPrsDjmdvruc68JlP/BcPGX6egmlSPG7P7It0txU
         9dSU8O56fxinEmwWStz23VSXfaZYMa0GH4lpLKS7aLvcF5ojWn1K1ZD/aInbbKE8BbJ1
         hWhhJvJq4ELKM69xRklBE4mzVGrmH5qINRT1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZtc3hBezsFJ+JgXERdSrjKYkX6f+8fQELANbScmeYk=;
        b=im+36fkdSKa8rdW+i94UW1tRSiwxpMvbH+ELsUp/uSA5kgreDu4gAPVrKqmPTxgVvH
         h/KJGuDCfOcCB0ShN27uT9LYx5kdRauqQvIq4VM9mK6EjSC3dVLSn9vXH+ZbCYwaJBhT
         xTdIqvEl+4PfhKAN1TPHgqmeBK20NuQF+qkeLrKb26ieBD7eAs1K+/LzcB457BK/YZ31
         /urRtMm/7w2MzanqnZdwwS2i879RvlCC0s1GAJdSCAg5bNFtyuwomlfyak+SBAGJZVqJ
         0zvxpmtHIluMrTV06vhTE9167qMWFugYR0ijwRKjoxgKMxusso7i8UhmH7YRzAxXjAdn
         IqtQ==
X-Gm-Message-State: AO0yUKXGHFgaM/pXrmV06IGdZZW17zwIlMjSqfxqUfDB9l8xb5/gxsNR
	DRtW5egWiclgW9hyz4cP/9VryA==
X-Google-Smtp-Source: AK7set+3gOK3BkJ0vQrBWtI5HAPi2PUYKNh8e6pqdOUt0vJfLvEQUgDgdUfKrw4YniHqw5Fg1TUcIg==
X-Received: by 2002:a17:90b:38c2:b0:22c:15a4:62a0 with SMTP id nn2-20020a17090b38c200b0022c15a462a0mr10965335pjb.37.1675442165363;
        Fri, 03 Feb 2023 08:36:05 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gt21-20020a17090af2d500b0022c25153cf0sm1405689pjb.44.2023.02.03.08.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:36:04 -0800 (PST)
Message-ID: <63dd37f4.170a0220.9621b.27b3@mx.google.com>
X-Google-Original-Message-ID: <202302031632.@keescook>
Date: Fri, 3 Feb 2023 16:36:04 +0000
From: Kees Cook <keescook@chromium.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	John Stultz <jstultz@google.com>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Marco Elver <elver@google.com>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: Support Clang UBSAN trap codes for better
 reporting
References: <20230202223653.never.473-kees@kernel.org>
 <CAMj1kXHa=jD_YNxymjd8zQo2_QHgh104RcmCY3gZs3rp24X_Zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHa=jD_YNxymjd8zQo2_QHgh104RcmCY3gZs3rp24X_Zg@mail.gmail.com>

On Fri, Feb 03, 2023 at 12:34:38PM +0100, Ard Biesheuvel wrote:
> [...]
> > +       switch (check_type) {
> > +       case ubsan_add_overflow:
> > +               return "UBSAN: addition overflow";
> 
> It would be nice if we could avoid duplicating this UBSAN: prefix 21x times.

Yeah, agreed. I didn't see a way around it without weirdness or loss of
details. die() takes a string not a format string, so without really
odd shenanigans (re-write a single string in memory?) this is the most
straight forward. One idea, though, is to drop all the strings that'll
never happen -- i.e. wrap individual case statements in the associated
CONFIG_UBSAN_foo. I already dropped several strings that were never
implemented in the kernel's UBSAN. I could be even more picky. I'll try
this in v2...

-- 
Kees Cook
