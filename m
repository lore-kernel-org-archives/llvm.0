Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F315C3
	for <llvm@lists.linux.dev>; Sun,  8 Oct 2023 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JLrXD/gN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-406618d0992so35551055e9.0
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696765069; x=1697369869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhou/iQjgPMNfD8wPNvACa70iSwou2YDuR+hhlISzLw=;
        b=JLrXD/gNRgLBwO9IqfYHSGloxQBiGCebMf2CnWP/GWNArhWlnJZLcNnDLyb0LBZi5q
         8xqociU0reRLaipjTIVxgejdcjwIiwofuKMh8LpRjZUrLWyhnTnmAwIuvrlO6rrNUPOf
         qUhOwVusCioh6csLnBBeXe6Fcj7ymIwf/hhCheXXgICN1vLBo7BOc37sbgyDJMuAupFD
         Q7lhnc50r9qkk7bv1ynJa0JVvm8yatvfMhaDzBPI90MdpCajLSc4gkOogQr8Qo42Gnw3
         mjk4FqQFO3+ClAkS4mUaQ9yaRHPwELQtdpV3CxVLk3JsdgENFPwyqhf/ItDsRQsy8jYj
         xbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696765069; x=1697369869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhou/iQjgPMNfD8wPNvACa70iSwou2YDuR+hhlISzLw=;
        b=Gl5gl2NqdHgVfLBnGQgMB57DQzCLKAfacdJZkmaF2WDNqox9jmo/NUu9efcV3+bVwx
         J5wvAW76u8Fv8pJJ4Y3LZQ3Eqm/kFLx8Bkbdzokp295mKvsAhXR7QnIQ3L0qCNF9xRRA
         U0uuV5eZjiqshc0SV+XzflEC91ota7ld1jr5CPHTZ8vU3wL6JA0qpIzz1EYTeAZoJEXL
         rx9g/RH7T7sAYPgT8TCWGKq7AC093fnXGam9UTR+dkW1C4xY1wffrXbRfC447CuB6+0p
         m6n2tomwVhWhMs9STvZSrdMtmTc4jgw6yYMsmaFMGXbDEZbU3thXNrwxvfw1D//5XuA1
         qbSg==
X-Gm-Message-State: AOJu0Ywdn7pqT7vOitiKbfAISdcrwnlkcpc30Z0oXYF22Qx+AgKPYQS1
	Z1R6AtI5KV/vtdU47XfGw82wng==
X-Google-Smtp-Source: AGHT+IHfU/4FonXooH8mQh6VhiaLNCGIy3nUcvXfhakX0VtM/Y+M17cRdFlbYAwKC6lTVuO4vitI/Q==
X-Received: by 2002:a05:600c:2113:b0:401:73b2:f043 with SMTP id u19-20020a05600c211300b0040173b2f043mr12078730wml.1.1696765068892;
        Sun, 08 Oct 2023 04:37:48 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bce0a000000b00405953973c3sm10577942wmc.6.2023.10.08.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 04:37:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Kees Cook <keescook@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] pinctrl: samsung: Annotate struct exynos_muxed_weint_data with __counted_by
Date: Sun,  8 Oct 2023 13:37:45 +0200
Message-Id: <169676506007.13281.4277310481310428464.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006201707.work.405-kees@kernel.org>
References: <20231006201707.work.405-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Oct 2023 13:17:07 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct
> exynos_muxed_weint_data. Additionally, since the element count member
> must be set before accessing the annotated flexible array member, move
> its initialization earlier.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Annotate struct exynos_muxed_weint_data with __counted_by
      https://git.kernel.org/pinctrl/samsung/c/4e1e21117e7e1275477ba80e634c769a511249bd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
