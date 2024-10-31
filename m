Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A919CC26
	for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378611; cv=none; b=rXZZSCY5B6EBzFtL85b6IURA2GzGlous49WF3dyx7EIbPl6NRk58XVHEEOv0vsyzCFEdePzJF2UtmiiGI5bdDMzMTSkA/gHVQbvQghgpQLlBF2xGnSVKX7+KRLCQ52N26dw/iCqGm17p+wnPdF6BFVBAI3r1Iem6WIi+3+oL8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378611; c=relaxed/simple;
	bh=UN0TCpzuzjXzpuD/YbvswwIqzUFPFchbJ0W2UC09I5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5Zx7LKpl8fRR8CLX6DUcbMWqEkzHRi4exj9LA3SJ8pZMpluyI4hWWUiknavony01wxNUSuqsw5tGiN0qm4XdEGdblfxKXntPcKccO/eOKg2K/tUOUhcXF6AaAIeSRUDPGkrDHSDHqhJsZKetn44EUgv1aLz3t1ok5vJdcCQhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uMmRDz6S; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uMmRDz6S"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431695fa98bso6806075e9.3
        for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378607; x=1730983407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NvAiEcmr3Bkqwa+x+z3wqEtD01j06Ynm63RukDU9ec=;
        b=uMmRDz6Sww2cen7SRQtLy4lOsss14dcv7SmMeuRoGCMOkjiuMZXPiWVXtsUxhlzC4H
         x4z26UQ/hrO7HH+FrUpkyQ3WduCuWXmoHGaYdkfiE6I01NL9nDRzXabwOXYGIrigMwx7
         uwwSbCP4IeBofJeKEmzduxh05snjlkIP7JjgSF7aA1kkz0zyiPDZUzILJaxhS57eJrEW
         f/nfAVtyutOzDkawvMUEW5gBLmxwv1cG+5uF913PDcGhy1jFtC/JkHLMuAbE6vkshfn5
         YVIUvImPqtE4qkWrmCdsIxtRx/QWR+PYMF+67tUZPuKAThb+npyhwO9ifbXMYN4ofJF4
         oRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378607; x=1730983407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NvAiEcmr3Bkqwa+x+z3wqEtD01j06Ynm63RukDU9ec=;
        b=gOPqi3RKC+sxyaBJINzonpYsvrxnVn0YS5sMoURsrazzCc/NDNSv7UVsKe+FcTYAP9
         Nlwi821o7PDELL6F+d59LfGNqj9y1d24Ezb4iqAGPCW5R8q3Ri/Z2OCzvSbUSGId02wY
         ql6/FhpMtb44O6Ol+y0qlRAHwxXgTz0hML64GizHoJR8c6+ctc1G+6nAT/ZEKDkW7qVS
         JPI8ycims41ySXab1L6OTGFLQFCLxFaziPqOTvE3aVWBXiC7LD9HHtV5G1QxRWamaQ5Z
         TfQQ9Ya3WQjqfqfyLR24aTOGAYb41PUrEVT3W4qqpi7s7SLoRwQFm8zRHDuls8FjuOU+
         A99w==
X-Forwarded-Encrypted: i=1; AJvYcCVsCRuKzn1aGDre6yJMQu0gcfH8a5Wa0goI6xvNNRLSuQGdlpUBFoZaz4TZewDoLXsQ6V0N@lists.linux.dev
X-Gm-Message-State: AOJu0YxlvY0ddG2xvazcWnt5Z9UepVG7gUDbI58G39lrbzc9wfYDcI7H
	78Ul8fMR+7kbvv/i7vcwT5h4Yg4pbJHcnooS6qLyNz8gHA2jKGZztalT/mjnk3o=
X-Google-Smtp-Source: AGHT+IF30i6ka1elJWPx3EArTq7Yjb50xuHjDZ5vtObnKFlbrvUrpV5QCfQF5TFFmJk617XgpXk/Vw==
X-Received: by 2002:a5d:4441:0:b0:374:c56e:1d44 with SMTP id ffacd0b85a97d-3806121fdf9mr12656862f8f.48.1730378606974;
        Thu, 31 Oct 2024 05:43:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a6bc:32f9:21fc:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm1999195f8f.112.2024.10.31.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:43:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] gpiolib: avoid format string weakness in workqueue interface
Date: Thu, 31 Oct 2024 13:43:25 +0100
Message-ID: <173037860284.7463.3619742464937960411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028142152.750650-1-arnd@kernel.org>
References: <20241028142152.750650-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Oct 2024 14:21:46 +0000, Arnd Bergmann wrote:
> Using a string literal as a format string is a possible bug when the
> string contains '%' characters:
> 
> drivers/gpio/gpiolib-cdev.c:2813:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>  2813 |         gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
>       |                                                       ^~~~~~~~~~~~~~~~~~~~
> drivers/gpio/gpiolib-cdev.c:2813:48: note: treat the string as an argument to avoid this
>  2813 |         gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
>       |                                                       ^
>       |                                                       "%s",
> 
> [...]

Applied, thanks!

[1/1] gpiolib: avoid format string weakness in workqueue interface
      commit: a22c9dc26d6fc522357b73858b13e29c58f49d64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
