Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D173F4AE
	for <llvm@lists.linux.dev>; Tue, 24 Oct 2023 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e4JHUonw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1caad0bcc95so32762035ad.0
        for <llvm@lists.linux.dev>; Tue, 24 Oct 2023 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698182350; x=1698787150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnI8XGGBa5Ged2dlOjjAPxHj4mUm8WGd6bk+tJs2a3o=;
        b=e4JHUonwmA5meSi/QsvGbtVe58AOgdw0nt1pU0TEO0VCRZnys6WPjeN2OZB6LrD0us
         Nc5vnoelb15g/Gz3G65tYSzCnaK38v7SNG+6T1HRxtL/ZsloBscRVQRn8ApSoBNQYRWN
         X0F+M1a+x1RX/g3Yrmo5n26vFFjec8KExyU9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698182350; x=1698787150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnI8XGGBa5Ged2dlOjjAPxHj4mUm8WGd6bk+tJs2a3o=;
        b=A8kUX7PJirrcp3388fW7bdNKDgkKza9VZihYvwPfMqnHLJjAT4hkXpnqZZXSE0Ywyc
         uk/Wjzn6frt2S9j5VhzUo0+kACSn7rcWWCx0hMkrsAbjipkd2XeMJ4JzZBd4Tr04GZ8F
         SO/DPPwOJNN22oaw2X3SawTMTpgligGuHdoKz1uWydMS9KzPFLYYR3Czk3k8WJBuOf0R
         45N8UP6aL4yebCoFWPEpOONs6Jb1x2kcl5cxQfvdJOjx+kttk6N68MynkumP4plCIWhw
         zXgYbKEJqBfoZmKIF983gqAa13YN6MJtN8uOdFWAwKdcn4SLfpjShCW6/wPBXrJ8G7L6
         BWgw==
X-Gm-Message-State: AOJu0YyDYiTwi2U4cdO1lhMZrZiU/wGiVZ64SxnwbmhgLkK2RRHJy1+A
	bhTpu35u/7PDlTsqXfkFlby45Q==
X-Google-Smtp-Source: AGHT+IFLiNPphz9TGJutCgbcHvP4j//UbtA+4B8E1BmP+ZRyb2spD6/OWsEDhqeuX4bWNmF8o1WI2A==
X-Received: by 2002:a17:902:e747:b0:1c9:bca1:d70b with SMTP id p7-20020a170902e74700b001c9bca1d70bmr14578120plf.39.1698182349784;
        Tue, 24 Oct 2023 14:19:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bdb85291casm7807107plg.208.2023.10.24.14.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:19:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] reset: Annotate struct reset_control_array with __counted_by
Date: Tue, 24 Oct 2023 14:18:55 -0700
Message-Id: <169818232966.2100071.9153679108451026314.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175229.work.838-kees@kernel.org>
References: <20230922175229.work.838-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:52:29 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct reset_control_array.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] reset: Annotate struct reset_control_array with __counted_by
      https://git.kernel.org/kees/c/fed2ef7abaeb

Take care,

-- 
Kees Cook

