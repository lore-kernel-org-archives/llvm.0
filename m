Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5568
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 10:34:24 +0000 (UTC)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F002A3F199
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637058293;
	bh=xdzOaEzowN0jMoh6RE3+pROKnNJBbC68O6pUo7WQAnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uNP40q2i8KzuRLZPr0yBwU1LB5fOGzyBv/2dTh5eeGD2pqpAadQWJ0Ft+6CGT+eqm
	 TDL9V6wJBfQ/2XY++fmmG/C5uKKcG/BB8TMyokiqN33ilR3ZCnlapcan3U/VDT9QDU
	 cK4pZqPrZFdHDLenISIgt6xjq7XCuIqwPxHZnXoZv/XyNTgJA9qW7rxTg+5/zyH0Oa
	 U5hc2yKz8Oy4NLgmn35VEAmq9wGaXVSVhGXP14PPN7uVVc3AdWaqg02eQmrUwJ3SPs
	 Ny0gd/hKz9exvCu6FirBMu+350iF/4lppM0Hymc1eIb/A1a6X6ikidGXp7qlHBvQBh
	 O9OcRoaNcDgSQ==
Received: by mail-lj1-f197.google.com with SMTP id k24-20020a2e9a58000000b00218c7914524so6069943ljj.17
        for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 02:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdzOaEzowN0jMoh6RE3+pROKnNJBbC68O6pUo7WQAnA=;
        b=vEs8UmDhS3XaxRLzO/ieJe20S1RTA4DTWstn8C8b3sAO9XYZsxScLOZXDe7caFHbnS
         2S8he58eUxycIAPvV4J4e++NK9vouGZY/8m/Y1LjY5DNBMaMY7PWD6HXwFLOZ+2cWlRe
         ABpXrj1hyGr/IIBosHJ0TbCotdb9wKmhK0L+XoCPgKknWdBhqWlu3uHnB40i6QkaH8ss
         KowsdNxZqH2L/vk7bxljF707L/jCKVR/y4PGV4KrTz2UILOKSOuxLmh6jpYHyrNcC6Qq
         BAfFSX2MMSc3yFoTLR4UPss803TGBV6yQ83WoNNZHsxPsehx0S9PDuVDVoOB8bTLwc+0
         p96Q==
X-Gm-Message-State: AOAM530Ws66qBU4Kyu68XvzXatkhiEp5D+hqGmqZWMd5Bku2xHs6aUFY
	hG0z/AHV/6V8DQjQzg47KrzjoYcF3sMlaHJw94ZwZ06lHY59bZUEKkuv0lzv03x43TRJqTApHZP
	ultr3+ypFk3bOsJVHHc1mD8aufwAhKpE=
X-Received: by 2002:ac2:4153:: with SMTP id c19mr5772030lfi.625.1637058293464;
        Tue, 16 Nov 2021 02:24:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwec5MCIeMaJIXMiZN5/vQORmItQtZQR2MyWOiTecq7LDNfdDlwu8d4GbrPq0UY5ox6v35u8g==
X-Received: by 2002:ac2:4153:: with SMTP id c19mr5772011lfi.625.1637058293289;
        Tue, 16 Nov 2021 02:24:53 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l28sm429000lfj.240.2021.11.16.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:24:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: s3c/jive: add one more "fallthrough" statement
Date: Tue, 16 Nov 2021 11:24:14 +0100
Message-Id: <163705825120.25687.2885204324289014996.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211116092053.4042799-1-arnd@kernel.org>
References: <20211116092053.4042799-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 16 Nov 2021 10:20:42 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about one missing fallthrough that gcc ignores:
> 
> arch/arm/mach-s3c/mach-jive.c:250:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
> 
> Add it here as well.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c/jive: add one more "fallthrough" statement
      commit: 7f9ec9b59c278f31b0c2c8fabcf564e6fc02d4d8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
