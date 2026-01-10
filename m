Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F618D636
	for <llvm@lists.linux.dev>; Sat, 10 Jan 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768056545; cv=none; b=ZBtBJ/KHP9phw2lS9Wn6A49LBmtfiq6j2SsZpTZsgKNUd61KfMAG+aLlXc1UsYkuymVG1xa11WC/kKRjNPCoQ9G2MjN6SKdTVJF53xh2s4gbtJgx9im3ZTYSULBY8VcmL9dUddT+rnJAjmbKY2LY8zLc/dWxvzcU8zAlvvsE4vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768056545; c=relaxed/simple;
	bh=8cZF88ZHHeswEWIoZ1XSpuokeFUHz2t/rDtmfT1Fb54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1Hz5hu6OZT5XvTOWvYTaTYDcY+tfaZ2bnXg30/93MGXWKB01dwx+QPYgDjslQ5IOjweAELqk8Jg0eKJkl9tVznFxoDyYPeBEGV65UbB1x++3ge9G7SRKscBoy60rQostB1rAxMO1p1xrmFbpOcA3WtEnLULbRwdxTks5tGlCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VJQOKxQh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VJQOKxQh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327555464cso2977712f8f.1
        for <llvm@lists.linux.dev>; Sat, 10 Jan 2026 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768056540; x=1768661340; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=VJQOKxQhoOnvhNvaY/aTr0tGIw/X8PCJwqiPHVYWEOsduw1dwc3JVaXgKyG4Udtzph
         2BtvrzoJCtV0LKXerd1I0LmxFskmG1/QnNdHh2bLzSn3PeLrS98fuhe5wavC1Y+Ya8RX
         kq5OQEIMle4RR9A3K1ERW6Od3mbahVWoTP2EgrRV2M6LprguzrzWySyZzyIXLlEsmKUH
         b5teekPFVT4Q40KXna7dMjw3+hxd7fSk2Ufv6V4/1YXV53c15K9PpWQsEYtXUGu1Ya8Z
         w4t13xp3RqjLHSni4K+KlONUdce3Zyy3UKFYkmsSa9c09GS4KTOWKf0oQ3qgwoDsNPnq
         7wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768056540; x=1768661340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=FEX8ddLUnGWHRaw2on8e6auKOzkFsU5o4By6npxLbMyFhHbMdl/10JlsBdbVCDpZrh
         aw1xBWwrwk8rS2UM3mNLTvNjCBEkAUa/03FRLDHCCOwQLVIKRV9cpmBBYhhA471PBU7+
         cEdXbaZsGvvdsHguGH+buoCHnNAw2FO+yRRdhWaAzrv2SR7+vWUSR9JuHukQIa971/Qz
         65ARKP9P5Q6GRj4KPgPGJY4GD0CLIrqNDGJ/2GQKIpYl97FjII3pK86cP0ukYBomy1wF
         D4nAg2tobpz68PsHlAhPxzvY4pi42T0E4IrObShW3THXeY60G0YunAviKFvnI3lcGw0x
         nDog==
X-Forwarded-Encrypted: i=1; AJvYcCUtVNQtUa2hrGCCMDhTqwL8mru9qTbWTyaJ4/dwhUSKD+T9wdUK1uCSbYkP7+kE+xFRZTUa@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2PA72X6Y9aBRZUPpZiIpVkYk/Aj51zaDyJ7h5Ek5yZTSkEVNH
	BviqIx/XW3oFSyZVqls5RsWwGgXvC24AHcQ0yiKHvWSCWPq00d8Tpn4Kj4g9S8nbzJ4=
X-Gm-Gg: AY/fxX68a9cFQ0GMd1MMiCv481vR6msDz7+NGQ99oAvSfOKFS1MFBClG6I0627tGRC+
	a13hR/b5F1B0fwed7fHJz3fP5rPyed4Z3mINQIhm2dW/D+i9VWq8gXYiPpLjLKjWPxGU6KrDUOf
	dXOp5n5lMJoYyvR2RYiq4FMa0AuN5UySe9V6grYryXDiNg0IucKIleMOwAewtql9HbajSJ6tX/k
	+8CuA7Lp2GOSFjW1NH8UPBbXT7meZohn3/PE20/iRAHwUnqIVP4HPzeJ20tAa6mUTbGf6e/VrBb
	Dn/9yTN+vOu/cjGrcEzWiylnWOF9V2JpeiVy3xxQykSJ7iJfxF9p0PHFWxyiUAZ8emHx+yx+7zy
	ml52anQd34tVD0XcYNqlQqQpb8uHjDpZWcbxJPnttjLzIxuXhqpc62jaqvVYG38Z920bUsuDMKu
	k0TJFvQAhBNbyIVJWac0bYiwKUmBCV
X-Google-Smtp-Source: AGHT+IExDiyl6+cMqnLU0OScR46v/DhXxaFlI7KfbIz5c0gjBYd8wiO/Eo5iH1Cn00OMlkpwekH3Hg==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:866f with SMTP id ffacd0b85a97d-432e00b8b14mr2891143f8f.60.1768056540373;
        Sat, 10 Jan 2026 06:49:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm27764794f8f.4.2026.01.10.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:48:59 -0800 (PST)
Message-ID: <b0dec3fb-51df-4bcd-ba13-c2049695266e@tuxon.dev>
Date: Sat, 10 Jan 2026 16:48:55 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/5/26 15:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
