Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF110E4
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 17:17:33 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-692ada71d79so3834681b3a.1
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695662253; x=1696267053; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh8DqYJ2SwbIqpzzYZaUHPp5PasBm1tKXhMFi2b/M3M=;
        b=bh5fly6SRJUHbNeTk+4cLvrksAjSe2QTm0Y0MLyCa3ymjD4MSNe8LjsPzPXpNR58/X
         wF/M9345TktYeVNAwWfhR1+XD1dqxOE9Cmm6suEuWUFqbHjshpgBuFEiJUodfoBhGRQu
         2SZS4H9mlreBucdjmbcDbmYXI82IyDZoJRhgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662253; x=1696267053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh8DqYJ2SwbIqpzzYZaUHPp5PasBm1tKXhMFi2b/M3M=;
        b=wUAHEk74Gkxo1tVeD9ICrRcPOcW+jJdQZ/PeimXRmbt/2B4/U7rzzgv7lt8lHobN6x
         RvnNYHiGlgWBdJKpyFiHO5e39zNvCL9mMHmG9rVyXR9+3zgn00vUUA11fEHpHiEFJMim
         CL0ACrgSXwlgBBm5N0Fqj3HkvZFfKE5yD9ZCH6m/OuwxVVGkPgdjUy9dwN1qa8mOP90c
         e1/f5kGcwJS/BTq+uULRbXEULMNlIjeJoAYlIci5NcBQ+JFziA2hxFhpuPZcBQVWwOcS
         MKyUomrO5AdFleC5+xBy3JE0QlLG6w9ky/3dORrfYamY5Uiqqjzm2bGMYB28niJ1HFEi
         KL/w==
X-Gm-Message-State: AOJu0YyV18ziJP1XuInAnTLi5Py2o1mHBTUC7yCa+nHyE+ib/2q6Ho6D
	xOKZfgqRmN5QmyZr5RRgEI/ncA==
X-Google-Smtp-Source: AGHT+IEthMrGJUlIHLvFMqKnkR1JjLvwrAVSHFpBA55LiKKvZb2xEbera8+CZE1rcTc6k8edakLzyA==
X-Received: by 2002:a05:6a20:1593:b0:138:92ef:78f9 with SMTP id h19-20020a056a20159300b0013892ef78f9mr6679763pzj.6.1695662253260;
        Mon, 25 Sep 2023 10:17:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n26-20020aa78a5a000000b006889664aa6csm8377453pfa.5.2023.09.25.10.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 10:17:32 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:17:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: Annotate struct linereq with
 __counted_by()
Message-ID: <202309251016.DEC84A52@keescook>
References: <20230918091553.1103567-1-andriy.shevchenko@linux.intel.com>
 <ZREuqs2LkkF3jqD8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZREuqs2LkkF3jqD8@smile.fi.intel.com>

On Mon, Sep 25, 2023 at 09:54:34AM +0300, Andy Shevchenko wrote:
> On Mon, Sep 18, 2023 at 12:15:53PM +0300, Andy Shevchenko wrote:
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family                                         functions).
> 
> Kees' patch is better, please ignore this one.

Oh! I didn't get CCed so I didn't know you'd sent this. :)

Thanks for taking the initiative on this, though! (But, yes,
initialization order matters.)

-- 
Kees Cook
