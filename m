Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E45012B5
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015516; cv=none; b=iqXAh2Br/Or0ZBhXqbrwuZY4+gq6RgMnkuYP19ViVkJ6M/z8ByfjHysNQOyoIkKi7WeckHc9hszaidOsZGkaCLqIhwiCEPn6tB2V/iprtByvVe9KP22nZkFY79hSYuIaHoe4bL6ZyJaAnWBNWZu2cTVAT7m+TJRM855/XjcsD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015516; c=relaxed/simple;
	bh=LSoXDOkihoTe+1aeuwkzPsOIbGrXJATfUTeqR5S99lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUl1ospBW3M7PzCZPBATP1dMCjkIzjPNpNx3Sllnuwjr1szjwJQ+HUU+YOzXDLLSURDPCBDJfcNdN98FSqwnTlMMKlvX/euzfmQu1tqmAxwGR8keuJWboKlzxOd3Kg/sB3B/7i3g5hBvhN4492/g6OcOr/143KFct72+as2vDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nejF1yvL; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nejF1yvL"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso28729301fa.0
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015512; x=1790620312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pj32bFFZvi2cnsgj5gH1ddQyBwu2DGpSO+g4f8bX3TE=;
        b=nejF1yvLCWk8BJ3foUri7pNkgiyRwUjNL9WDrN6gCRSjjblGpSpbMk5YW5pDAorJBE
         Q+MbkGPqAGjEyLo85R4RbzxCr+IrhdeXz6OrAzLHj7eQtZCbtQTwt1QjqRreZkCugD7A
         rbFETh7MoA4zA31lw9nK5Q7wsDOeM88sCtO7tFhD4HmongJJF6lErvmaMlquFU3GjgfR
         80Otaa1EkZUa0xhNmhtAR4N14wCn7mUIpq0bEOdYpUO7OlkQ4K9++TxwGX7dwnGtOZVU
         GzgpILnqe9Tv53vDoTs/rzQYU7uwtIqEbA5RHG/f441c4jmn83aQAf/wI1QY0zrQMOLU
         QlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015512; x=1790620312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj32bFFZvi2cnsgj5gH1ddQyBwu2DGpSO+g4f8bX3TE=;
        b=TQmQK4mHvQOgssQQiNJ5wXeKL4ORmJOigrKqzOq+hZqbYLoJGOJevV4d38Y67nhJdI
         RZ7qADb+20FNBSgPKYMysuwAAvlrhFgIpVON2fT6uzlxuamxK0lw7UqJiaV4zfjbgzj2
         cvGKssBYJ3qS51d26x58WyVaRcO+a530o6bFlhCaG6F79NPhlgktLGgBMpd0ep81xt4X
         MxaAuvDaqE7IH72lUCumDt++xSGsLYeJEUnK1VwBbjXFhiqTBbZ3d46sNCyU0tpxpwRP
         Pq0roGqU+KwBZGpeSpyS41qyym8JcVlBcd2mmruOS31WVWgkI8E5tsqoJZIe3y+71I3r
         SmyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtr40jNAMBa2SNs5QPtP5LJogBd/H/LM6cJdBoFXeHCZuuZfVnYy7ieTkRq35xrepNujKn@lists.linux.dev
X-Gm-Message-State: AFuF++kmryIl66Tb0Uc3SqSSIEVc3pq0I86qOUjMkj6ytxxn/XgxXV7/
	7gNCujIbCi5SPB0ln8mEOdlhKLl6WPz0eCE33c4tMb4SvNqd0HOX49CO
X-Gm-Gg: AYBFou3EFmimNq/cff1DGHUh6gjOninVem6kjA2x5o5gYb/1fUEJIaqMlL0mG1sFJze
	hnfp7LDy90kwQ+Noiia6617SvdrFD1hzBWbVv758UMFyA5shPEkTeIf8M/Bi4soq3spmx4CYyly
	AkXyK0wfgVVvtBBFCBJG1bur97Hncca7bwFDPY+fzN6KFdnorPyZDkwhfyhydPCFIZBfwfVMCTh
	cxCbIKSMmZBJC3Nr8j7MvL9hdEr7GPxphprzrWzcE/E0Ik9tTaBl4ilIJpiLGV172N+/DjOth8R
	Xpuh3lMeKkpQ0JVhnyfYkZ4P/hi9rpAQBvyu2AD83BZGAwfggcqODmkwB+2NPqiI2cvH4vg2DNp
	DRvr6WZUbcCSiKYlJ/iWVh/jDIrp1i+PP9dUMFT3WEZY1fOR+YL2kucYQlzJr98EeUu6ZIxPHUE
	Pu1pgVldgEuWRA90yMXmpzMu8jNmHHISpYStCg2qzccWoed5idqBYnoYCUsyGkyENM1ZqOmt+GO
	uOyIcaOO18VC0x/LO/p1LRCV65bT2vxuAZPLdtiSZ5zrhLP3OrqkaL0yrLRlmcuMrLPngrRuxJO
	ZTQd
X-Received: by 2002:a05:651c:a393:10b0:3a5:f06c:f897 with SMTP id 38308e7fff4ca-3a5fc0f47b3mr16606591fa.28.1790015512257;
        Mon, 21 Sep 2026 11:31:52 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:51 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v8 10/10] iio: pressure: dps310: check the lock markings with context analysis
Date: Mon, 21 Sep 2026 21:31:32 +0300
Message-ID: <20260921183132.233136-11-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__must_hold() markings added earlier in this series are only
documentation unless the file opts in, so switch the analysis on for
dps310.o.

Clean with clang 23.1.0 and CONFIG_WARN_CONTEXT_ANALYSIS=y. It does run:
dropping the lock around dps310_fifo_drain() warns rather than going
quietly.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/pressure/Makefile b/drivers/iio/pressure/Makefile
index bc0d11a20acc..4b1a05f7a0bd 100644
--- a/drivers/iio/pressure/Makefile
+++ b/drivers/iio/pressure/Makefile
@@ -3,6 +3,8 @@
 # Makefile for industrial I/O pressure drivers
 #
 
+CONTEXT_ANALYSIS_dps310.o := y
+
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_ABP060MG) += abp060mg.o
 obj-$(CONFIG_ABP2030PA) += abp2030pa.o
-- 
2.43.0

