Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920C3B2FDB
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558806; cv=none; b=konH+zU691MhAU6LffXzaDGN+EYUnLzwQdR00HDK4wBFYmNr/bGM8wLcYbY36uqAg0axCcpIWkKuufw1ZTwPYEobBQhFObltXvZIL25VUHZvUidzU5BWy2/o/5vWRexsFtyyeYv3a9DcC5UYLQxiJBfB1266AleFAqQaEangirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558806; c=relaxed/simple;
	bh=pHgHXJOTKzZCKGKxzLlLT1SyxRE2AW6muli8tlhQD2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=El8j50Uxj4Wqfb3GH4v9STCSCjYiOrsrbaVwewb3mV282MIU2W9phO3O0eM3LkQKwc0dudWRLEME5L20pHgF6sgPbWMFRaRGj9dMkutIXAXZ5XiC5ntas9nyOgDeo9TqfnyVV0aHHDH4J7MDkl9iSeBX8Fs2PBYVSp6ujF+k9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY++oiJz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY++oiJz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f73d9c177so1163389f8f.3
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558803; x=1785163603; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:autocrypt:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+DIcEgoppAXulH5vp8KeYvryGqkcW4+kiP+l5ButByY=;
        b=aY++oiJzDXA9fB3r+bvAM13+LlRBPa5ISR9xy5wA7WkUXYx5z2pk1ArocUe4UAskte
         pW/eVFBG0Rj/MxgHpD+3vHKtQfIUMLd/2wxdcewodXd7GXiPHM9I1w4HrLGiXqtumC4y
         gXo7nFU0PA4VLGT5ZWAAPhr3FPPnTMfVzgsxzJGCqNsJJtapNGCOxft6SwSAyqpGbxq7
         arJQMR8jG7cEVQHDDqRLfZ3vDz+EFQI2buFyBz6L4yZUBkGfFyS3bnWx7RSbd+EN+SIb
         V75AOUWcAp2dmRzZMSfdrLuDCBLcnk+guBhnN6GGR3EU/y8AZyUXzFumSgzyEBG9ZQOU
         mHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558803; x=1785163603;
        h=content-type:content-transfer-encoding:autocrypt:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DIcEgoppAXulH5vp8KeYvryGqkcW4+kiP+l5ButByY=;
        b=gEvmZTVSI8pcmCbnELbMyscb4nIXg3Ai1MiKHqPf1tW1432wJyMqaRk8gXlVq2u0VC
         hXxxc8ssUAlZZMHERjDTDhA50CzYihwYL9A8ZPCLUN0aH9DBvR4KuyyN+Zkww9G3gGw/
         P5ifMlr4Fn4qf9vWc6RmX2MYxvxn61TMP49jsstHvjLC6jm+v4REWsIKuZlFK9ERVlo6
         sYN3lBsjwNSku35ncu97+BGlqsFPqjJq5Habr4eMGfa911KR3p9jjdQqmuHmvJmzNQ5E
         5bgp+vocxkg9kJV3tfa+lAZohV4CyUG5oVms9dxnmBda3a9Jrct8uiEsz2jC8auHZ2nG
         COEg==
X-Forwarded-Encrypted: i=1; AHgh+RpFbOJFvXYKUjx3ekez79+OwqeLBhVWiWENU0ltebiDd2wBauSalsGq+MjJMw2P2dOw8VUc@lists.linux.dev
X-Gm-Message-State: AOJu0YyBPQuyqXsrP2f+08XOxzovUWgKioud3hJXZlO4Fa9+8R6IUGXO
	OdOkz5Z+4Gak84/Dhmn0zhM1/h77t+bYNQnC0F2FVHkZ0OO0OhzllID9
X-Gm-Gg: AR+sD10QXS7HrVhbwCgCRRdK2uBhfZZCo/OCa1MB0Gaf1Nx0iBu3sGjz6D0j0IiDelw
	vlK5ywVwYzJOy7B93dk3zYK2sfZy3vTHa7QyrFKTGKbe0gjk9i/PkNNHHyLsA0Mc3HyTwiiitSW
	bI3fIlefr9hg3UUL5k6Pr4RLNdee6zj5TDWTWAWteDkXTcMGNpvgcsiMmNlDsH6Nwz7bXQ7++Wo
	C70Znu3MrBP/mompSmLIhUFvaMSt5ux/t+YDOS4N2Po8VHEzlp3BwU6kFAT6nzv6nIw2VPae75D
	uKQyjf1zIVIcGL5qJ3i2pOm8cCJ3I0NPr/CW0o6MDX4MtpwLvd57a+rGb0sLy/RTi3n27L9S6Pf
	KZfizpgCgVSFECIaa3XtfYa6x+aGIrmHZhfldSpaDu0TydsWBY/SZ9LRtAz9u1quODpg1lid4Oj
	liyG5Zh3kCBz8o+R7H0w==
X-Received: by 2002:a05:6000:188e:b0:47d:ec60:6581 with SMTP id ffacd0b85a97d-47f622d612emr17290234f8f.0.1784558803067;
        Mon, 20 Jul 2026 07:46:43 -0700 (PDT)
Received: from radijator.localnet ([93.140.52.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm29579920f8f.25.2026.07.20.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:46:42 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Marvell PXA1908 SOC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Date: Mon, 20 Jul 2026 16:46:40 +0200
Message-ID: <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
In-Reply-To: <20260719214349.734351-1-rosenp@gmail.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Penev 
wrote:

[...]

> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 4b2c089f46a1..8383f9f1da51 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -130,7 +130,7 @@ obj-y					+= 
mediatek/
>  obj-$(CONFIG_ARCH_MESON)		+= meson/
>  obj-y					+= microchip/
>  ifeq ($(CONFIG_COMMON_CLK), y)
> -obj-$(CONFIG_ARCH_MMP)			+= mmp/
> +obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/

Could it be possible to select mmp unconditionally, like most of the other 
subtrees are? AFAICT, that would also require creating new Kconfig symbols for 
the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more proper 
choice in the long term.

Regards,
--
Duje


