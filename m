Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0A3491CF
	for <llvm@lists.linux.dev>; Sat, 10 Jan 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057801; cv=none; b=C9DMoDgoOevQvBgLI8hY4bbxr+6ETUEaAOcCE1Yd9TGqxS/x3FTEZze9RAYjT1yM7WE0JMNlFqHioJq8Zvn5Bk9mX26PS+D5rchiR2HeXL8VsyiB97oYWy6Kja8zpsfDxE8AjFtyDAEkHWoBTUI2ilADnoHybeZtOCbNkwWF4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057801; c=relaxed/simple;
	bh=veOrw/m8cCXNOzS0YhBEMZHiqb+wrCM+D/j1ZadzRgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjqOnZYGIQy5z43Xp3cusE3bjjjJbZV/xF8PHMCeM678OReEe7FKjbnZ4ODKBN7E4e4VGezxrZdsSLuRPpfqOPrknqKYU6g1Y9iVLX/j9gtlM3OnT5ibdqCTciG8P6WOrZMa2JdNGOIQFP30lZ9yb9HslOXvwHT+riG9rpdjEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MdKsCVVg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MdKsCVVg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2589647f8f.3
        for <llvm@lists.linux.dev>; Sat, 10 Jan 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057784; x=1768662584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=MdKsCVVgQso3xlBMS7ds9u4uTK4wxOFop+voOovGEdygzHGSYKYkpdIIxnHzgIGhvK
         lP8Dm1jUVZzkOwpgrL7RGNhE8LN0fqgrzpu+cZGNpCjLVIf/aEwRS2cIZkgxyw33j/DI
         3URAp1xvrwMbTxC/kTJMeUZE0r3S5/7XwFZnjNTXovjGcXhhYieYiGa4pZFXXQbcF2R8
         DiW5kDa5GmSzyYzSLQN8q0XUrAU5EiXrZIstj76V5w7XlFKYaH1PIpMOuPFFXYr97fYl
         nqj6/QPMT0CpvwHxSs7d3onvsnHRUNx86VogsUtpjgLwd+gcxMYCJvcwb1Tlzmku7G/b
         3Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=syZllNxW9exRegdh08tnv8fKB4p4rHWz5XxB5LEKrlR3L/4iMUiSdhoRVRau3WaPTf
         D30gzo050vAKQqPs3JZfp6yYv5XW4CEHHROdMg0bVO/EGVv2oeyrNTWirrbb/FzRIRTL
         8M8fArwYFEArxV8m7A8qHvsj4JSxnPdnH+vdzL51DKACvzjPqisaqePMvRUS3euK53Md
         aINtog+sasxcgt3shmYaOZiO4/prjBCCpihz4nm6J5GOs3BiBoK184NBZjmavgbY1xHu
         XbfGawcFBFGFD7fdKsS5YLGbauEbhN3QBJEV0I845QJrsybWvUvzguWqY3HYKAIylEjC
         VnJg==
X-Forwarded-Encrypted: i=1; AJvYcCWqnpMZmu4E81FZ5P86rusKtIXaD5zi8XVo1h4pp2kgautMnU2jm/uo0Rrgt896mGfG/Ij0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ktdzEyvN/X3wOWuJ7GTtK+1aEGia6W47140GvAn5gFtIUMJG
	kole+I1herPdr/EUzzbaFDTb77l9bbvxfVgXmBZPuPY+LXDPZVf+8ZGxir+ov78JPWI=
X-Gm-Gg: AY/fxX6h7d5W8OSMULXJVnxi9v157BrbiqIOlRGTUsGztFv2SM8JMbilbVc4oBxEbMT
	bPJ1P9AUTZe4EWB3tdnpgW+dsXcl0CUEPl//kuUkoolL+Ndujp89LU4Z0c2bYub0BND9M55E6Z4
	qHIy3R4UouZ+AC2eiKKeTJ5uaus6yxysEURXON60hqG+hf2aI8gFvs3YiIAVNcgl1b+M9Dl9P6B
	uXpb1GRAGqmggEJ7jnO48v5RoaAHpUOkPtmhIYONOlyYMEtHgt4I3GNc7+bfqKidw0wlzEWNBit
	QMCTJt0sujUWzfNBFwp0VtW2+ToxDNMBS/t4t8KPe/2ty6gX/ksShdCAwTCEiTYXtUc4T9GlPYn
	4urnyLmquLr5iiRugoyeDegv5Og5b+dR7iH2+y73Ai2SPsVDZM4bNpuEBIpN9ZdHD2LYf8rSjBt
	5txjWRnggeeKIw0KRuIrWEIDePREWt
X-Google-Smtp-Source: AGHT+IHwvRNK+qwBLjP9mJj148RzU5png6+Rsy9u3J7EYhE07UUYa3vVSxYXarlT5BZGC6AC5xVP2w==
X-Received: by 2002:a05:6000:40da:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-432c3760d02mr14529601f8f.45.1768057784134;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm28208208f8f.16.2026.01.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
Message-ID: <6c2612f9-97de-49e4-a7c2-eacea2d33f51@tuxon.dev>
Date: Sat, 10 Jan 2026 17:09:40 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF
 child loop
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
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/26 18:57, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
