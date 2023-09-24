Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0851368
	for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 12:10:02 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso815873266b.0
        for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 05:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695557400; x=1696162200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSaR+L6f1m7u+tcvmJlO+a3NVKKfrp8TzdBW1XZxETg=;
        b=KD+KPjVGaOcb1ZEr9cMFHpazsXo8/3WFOCdBXklSjqKLpM7bZRb1pKETpo8alRGW+I
         k+PfXRU1xJWkJjuuM23K7CFcqbedEcz3QAQh3owrXQtTcqn2eR4vKZlfWHuDpu8WXUsZ
         J3kft8p4kICfM567qgUNGi6QH1aQxfK/4pDacXokRPVdAsM91qZo+hFxkejoRIXtkCej
         ux1vpMd7PpYF/sp8MUNTTxrgA4eZ8sGl4b07EJDLWV/bXcgfigsnEfh40RiZD5l441wZ
         cZG/lC9uhhSaAO7jmRdGChybjUw+AjWUuSXiN7FKS0nJ5Y2jVh7ZkOCgN20lai1xA4KM
         HQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695557400; x=1696162200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSaR+L6f1m7u+tcvmJlO+a3NVKKfrp8TzdBW1XZxETg=;
        b=tzdpzbtqsvkjYbefSSv2SYCoxnlpqFj/uNHdSh7OGHOawuVAh0dpjFIqFJeilJieUq
         7wewOMkVqAUpfDrLGGKNNoZqS5i/hde1SPJUHuK1JlOX3yMH5F819MEZt2LAdd8jqPHX
         YTGf9ZhYizimG4MaM1vYce3FGZi8mUvJIfSvAVF/f31PAgBX5DBycTF3HoI5R7R6JPnk
         ut1EvMj7qCrhtbinAy8cPchOj2qVW+HqrcHOZS8gPX56LGnOe3tbCVGRVc/n57RuLUwk
         38HxN/64epTJfaJbWM4faL1puJc0CiWNMQDaNNP7GnwGCd40WVOwE27Tyg9H/xAPelV5
         TXkA==
X-Gm-Message-State: AOJu0YwF2paCyKwIGhH4wflEGmHYABSfzMuBx5n28DYXDhwMfJMpo2U7
	Rtph+CB74DUXkxYiDfbXvoW8Nw==
X-Google-Smtp-Source: AGHT+IESYrCzZQvTB73XFlkulKwL+gvntMR0RunpUbasR1i4r6vxyq92UsW0nCePWlX+r7XuUyXHwA==
X-Received: by 2002:a17:907:6e8a:b0:9ae:3768:f0ce with SMTP id sh10-20020a1709076e8a00b009ae3768f0cemr11340922ejc.0.1695557400559;
        Sun, 24 Sep 2023 05:10:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id fy20-20020a170906b7d400b0099bccb03eadsm4908664ejb.205.2023.09.24.05.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 05:09:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kees Cook <keescook@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] memory: atmel-ebi: Annotate struct atmel_ebi_dev with __counted_by
Date: Sun, 24 Sep 2023 14:09:56 +0200
Message-Id: <169555739436.7093.14241184537444848139.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175215.work.122-kees@kernel.org>
References: <20230922175215.work.122-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Sep 2023 10:52:15 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct atmel_ebi_dev.
> 
> [...]

Applied, thanks!

[1/1] memory: atmel-ebi: Annotate struct atmel_ebi_dev with __counted_by
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c1f2c81631df7654c249a457b7a54bbc36042248

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
