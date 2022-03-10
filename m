Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB618D
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 18:17:08 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so5963175pjl.4
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 10:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8i9PcoBgS4Z5fTHkHhwCw2b7OCjvoaGKsCGSTw+C1tM=;
        b=FHz7R3ScT4P/6jx0UHpLjssNo+wzcUAnkAq0eNZlWWEK3aYGOxTGOxoQ/SFYQ4gitQ
         IzTn31mtdV3LRCsbXyZSNMjDZxDVwh14jEA1Mz6aZXSZSmLrPmfX8dxOIT0DkyfXgObJ
         sadA5/c2IF8P5u2OaXSS9m3nK92vT8MhshqvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8i9PcoBgS4Z5fTHkHhwCw2b7OCjvoaGKsCGSTw+C1tM=;
        b=77akU8ZkdsHIDLMmtTaI0KWPoROfF3QcNDmAHomxPSb+jmX+jwIZBEY1W4NB3+XgSe
         lsaKYEUjvpX/iCnn1zxNo7JpV8BWDNEPd/caLNja5/8ssXaJv1wIHLUhzPnt8qNXwPs7
         weDqhA2aoPinrFiupcLYrpUcZmUps8o3DbRzAJxeTEzkJ+ikRRQ2Hp24SvB5mgZxUj8B
         hPOipdcwY/rMfvqHREMo+M82OSR+GHaykdLxbFrDvIj9/6s7upqJR4xFeuxrdu10gm4c
         kbiGC6dLqvidLRUr4BYDYCd9Qv9qFcHjuAmAFUEOAiDr6rlssr1ZPGhGcibHH0U1baCe
         hQmA==
X-Gm-Message-State: AOAM531bxL9DNc6oROKpcqHCLnHDRJU+fQfp//VCqg3SIJ43MWUhNDUL
	KkA+314uhz20u6dMF71pg1gq1g==
X-Google-Smtp-Source: ABdhPJzmiruB6ATSxE49WZKgHvZiUJtMXmtRjvqxJVHf8r+8/uOrEQawYL1mjAJMJLNoP66nxh0ubA==
X-Received: by 2002:a17:902:9a4b:b0:14f:fe0b:5546 with SMTP id x11-20020a1709029a4b00b0014ffe0b5546mr6364220plv.46.1646936227861;
        Thu, 10 Mar 2022 10:17:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w5-20020a17090a4f4500b001bf3bdf39a8sm6785842pjl.4.2022.03.10.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:17:07 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: luc.vanoostenryck@gmail.com,
	nathan@kernel.org,
	shuah@kernel.org,
	mark.rutland@arm.com,
	akpm@linux-foundation.org,
	tglx@linutronix.de,
	ndesaulniers@google.com,
	linux@roeck-us.net,
	gregkh@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	Dan Li <ashimida@linux.alibaba.com>,
	elver@google.com,
	samitolvanen@google.com
Cc: Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/2] AARCH64: Add gcc Shadow Call Stack support
Date: Thu, 10 Mar 2022 10:15:37 -0800
Message-Id: <164693613561.1275052.17242543278628621803.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220303074323.86282-1-ashimida@linux.alibaba.com>
References: <20220303073340.86008-1-ashimida@linux.alibaba.com> <20220303074323.86282-1-ashimida@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 2 Mar 2022 23:43:23 -0800, Dan Li wrote:
> Shadow call stacks will be available in GCC >= 12, this patch makes
> the corresponding kernel configuration available when compiling
> the kernel with the gcc.
> 
> Note that the implementation in GCC is slightly different from Clang.
> With SCS enabled, functions will only pop x30 once in the epilogue,
> like:
> 
> [...]

I'm taking this one now so it'll make the merge window. We can hammer
out the lkdtm test after that.

Applied to for-next/hardening, thanks!

[1/2] arm64: Add gcc Shadow Call Stack support
      https://git.kernel.org/kees/c/afcf5441b9ff

-- 
Kees Cook

