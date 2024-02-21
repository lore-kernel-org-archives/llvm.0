Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7C3A1DD
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499861; cv=none; b=iTeGxW+QS/jTZZBAeZd6YAuGJdo0h+p7kxuR6pDI2LwVEpVJsNMtZOX3B8gJx1JBOlF/JT699UTumJQ187b8M4losOWbpua418FRChCxac7XWZ9QXwDvqMQzUlPLf7SXFoBSIKJNDi+Vk1u6C+sI/IsCknbKHCvkESNamARIGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499861; c=relaxed/simple;
	bh=BizncbHOJu53xMldBTXky3VBzNOrGSOrbUjAHdhSMz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t7MC5rxiMUyQ1hRFYyZAhz85SYZplGv5JtA6DG0bN3/tQbnbccdqC1CYNP33EG9M0geJ+FWeJZt7HsP0c8jLIDTv3Ii5SECAxTSXtNeY8M0LYfcy7fq7+OP9nFY40LpgSryPxImDqa+gwIn+J1BFsZTe5Me2JcpQhTZLBhR+5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqnpnFqp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqnpnFqp"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512c4442095so2195365e87.2
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499857; x=1709104657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDwdGzlFA6tuZPbulz/VQAvLOcdCb4uMPbhP3kDR05Q=;
        b=KqnpnFqpZ5ARVPBO5WDQLvksE8qCuYZ/Fk6j+GtqnvRbjIQ+DiGPLMIFLu8nj5mp+R
         w7/5/xVIXOgFMLT7xLDitnXQ9mODsfFVd8DoXQcGIhcpaZmTrg++MfLJJWmzsVdfV0Se
         TCy7Ccom2uRAxxCMrp6fzEAKCpZJBoAnsBos243USWjmFikzhDf6Y3/Wm/clHzwxHLL2
         vyjqQnSzYapmJ8NuiwTXRXp/cdOK5fBE005AdevfPa+M90xFD+xHNiGT+xeizrLKTbqC
         F6G3689G41rmy9Lhn2NMNY5KFeaSn6FCniuQfffgckyM+YDLNW1WF0X9wxtAZxqazU+v
         1yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499857; x=1709104657;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDwdGzlFA6tuZPbulz/VQAvLOcdCb4uMPbhP3kDR05Q=;
        b=aUJMJAtFjC58A/tAg86A0/92SYb1AdaWBDRS9nnxD2UfJrxe+ouh3VHDfyiImz55O8
         JpHfArm5iImQoqHFks4SmxzcFJ5TF2bf3a66JURnMqngHJ+1EatpMDppDe9MWsuDRTB9
         j443YLloCG8MPKLkSo+sVo8epzkOHUvwhIH34AqKEvlO2BrVwpxC2kQj/AzTXCPMHTh+
         3pw+xWU+py64mOE+SSESmlTlPCQr//EUDoU+VeBB4h4lZb/6WTuhadDpLExj2eBitE3n
         gtQyxSQA/51eoR97DHcrcJMxZbIjtazmLi41jikOCaLUtq/i1DJyiMLHx/AsXD5etnLr
         Netg==
X-Forwarded-Encrypted: i=1; AJvYcCVw7xbX67yU/3kzSkofIqdejeVgE7son77ospLbjsuzznxzHIb+2U5qdwqwMdtfb3PyPc49F01JU5S3MZutFaSlja9qnQ==
X-Gm-Message-State: AOJu0YxYJUDTvWAGRxNx8CaGq1xj+CtzkGatZcteNxdMAK+cVeaRYiPW
	x7WVwfJFBjiEvcEFbm2k/3G3rZVUMylDjhCSIcovtGaU64z+TBOAYUyvI/1UaQ+OCUCLmhNn4y1
	j
X-Google-Smtp-Source: AGHT+IGqkGtQA0L2uq9EpwXq/4XZe8OGGMFaJYlXvE9PH1RKEoAlc2YmPJMRPCXfm76f6tpYvUvrKA==
X-Received: by 2002:a05:6512:3f06:b0:512:8d30:6dce with SMTP id y6-20020a0565123f0600b005128d306dcemr12181479lfa.52.1708499857438;
        Tue, 20 Feb 2024 23:17:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c248100b0041061f094a2sm1459212wms.11.2024.02.20.23.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:17:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20240213142831.3069049-1-jbrunet@baylibre.com>
References: <20240213142831.3069049-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2] nvmem: meson-efuse: fix function pointer type
 mismatch
Message-Id: <170849985550.23383.15344631998215438769.b4-ty@linaro.org>
Date: Wed, 21 Feb 2024 07:17:35 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 13 Feb 2024 15:28:28 +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
> 
> drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    78 |                                        (void(*)(void *))clk_disable_unprepare,
> 
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
> 
> [...]

Applied, thanks!

[1/1] nvmem: meson-efuse: fix function pointer type mismatch
      commit: 6b475e23544a560b4bf2acfab8dc54c4e7b1749e

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

