Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95622145B16
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 03:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759203128; cv=none; b=Dy6ONa+jkxNjVJ9/6MZ5AI2/CfZhEh/MSC0HFv5qgk3kioe00zQQpzJino+H48HJXkLUAHcmzLLNMzJ9ofoPax/vreFcMsNkn4ktCuYvzg4URSMyn5XxnyWGZQav1bWAU2s2J1FrBi6+C1RqOze0XXTlRulE+gUkYdREUcocGxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759203128; c=relaxed/simple;
	bh=Y+lQgfVtEaVz7kZQiydB7t0gpe+2jiEEcUOe7R2jlA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juHbnfgTZmKt6mHssKiBJX+jRzLsXjl3JNVvfaDUgZ7GeooM5JI7UeSsNgWQ4u7m5AO8Ei0n4k4ZYif72HhPh6fOj24jMdIs8GAWwmXECPg6N6UGt9Ewh3HMLKzIfI7P/5EuzrJjDDFqT9EQ6JstaPVWgStQRI+FgKioOqMC1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiVVoxIe; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiVVoxIe"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3260611b3a.2
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 20:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759203126; x=1759807926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ipg2xSQ+y9eG+cY+ycWtarKVzuOf0KH86wwLmftXUAk=;
        b=YiVVoxIeXlYkxLafO67EyHDkOBXIymUsVWEiYfuIoLkXc2SoFrnOIWekYbpWcxU3hN
         zpOJb0VBDHvVaKN3zjlkuIIXaDaA23gi4Y7g38iAQeDyGzb9Zvtmv3h1XyEDiHg+qwdL
         xsF+rNeSKNP8NLIZZszZyyAUoFCpt4YpGeG5vxl3isF1xX7+YSb52KKrTQJCNGiTFBVh
         YXpV9nBhsFo3kSDbZbmPTytANT1plyuzbIS4tX1fQLhFyJldqYIgDv0cQbCGmo+ha4ch
         z16fYUk5cxZ9ewwwhj4g8uIgrV7F3fEFqLHQgyxaBZEDx+R3rhiRf90VHnrYU6cvdXyj
         AMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759203126; x=1759807926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ipg2xSQ+y9eG+cY+ycWtarKVzuOf0KH86wwLmftXUAk=;
        b=gJXXdmYu6rRfTgQLu3bZdDoYVoFziaboGwFJ8R+HgBZOIdUoyDlwgQHy7PylC8Q7tr
         nP6YxFuKi+uWp6DZ8MYta9ERQ5Kz/kw0kY4b683n+WTcTIeqXUxdL4j4aVM+UGfkGEV4
         JMP3SSDpSBVlb3IbFutanG+hjHPVbN4RHCjG6FmTabBqjiL1ltHdaBQfif3VeVe4ydoi
         meuZsx1y6FgzLk5cYoHXwv5ldLKo3hRaqXrFdHoGvCywS7m3m2JjGzk3xJLdmyMGl+/v
         oL3O28vkY+O6kzhTApAOHsfUELoZ3LRrWXtrrf1xlDR68tvTqYA+fmnwsSsaK2BgCqZO
         0OgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGqY/yu3LL/YAk433LlRxs8f1aBKvnKxAjPt+kP0M9wG6ma+BsgvZTFK/VWC+X2CxkGlLf@lists.linux.dev
X-Gm-Message-State: AOJu0Yywxx33srmLAbIm1H9+eLXclfnmwufUQfGObbrEqaBt3jHXT1FI
	h9snh9GU/+nnv8FwIPrDux1+9+UxqVop3uB3L5nXC+vp2e7Cb0WQiCXw
X-Gm-Gg: ASbGncvXHyY40UpYBHfxjcBkUYnH2jIJTznMn2CQXi6mn8hyzQbtR/LxL842N+AUe9f
	kWbK2+cbwcfIbsfXesLc1iWTHzTPiAH9dDWOM8IA+EW7S156rbePcfLG/vwTi1Oko/hj7W8TcPx
	Rh8fKQyIeerdbCNWyabOnc1+Yp3rhEPYzICQF22TDDmQU6HV0in700t0YLj/qza6Yuksl5/8v1y
	raA/OUjXj2k2UL/T+rkeKVKdVmR7DFC3in+nEqJwG+TLwIbSRuAbI+M5Cm+DdT7blMXNYM5d+B3
	68pyfx5ERlEooNT8XsqUIURbclC22fM3j0ChWwEggQ+W6Bc3Pg4bnLEUrH1oFYfJxiI2xQ6eacC
	aidMcd+moHjbXF6X2VIT1h6mMIXXs9BRT61904CC3O8ORMvb6tctiGVZVyCwiNwksuWyYlgVgMx
	sUkp0=
X-Google-Smtp-Source: AGHT+IH6LhWbk9ue158EeoJf03eqT7m8bYm+d7vM0ErLdQPaLK8hlGYtsJv7ZK2fU0mzhBBLUHqIUg==
X-Received: by 2002:a05:6a00:b53:b0:77d:6a00:1cd1 with SMTP id d2e1a72fcca58-780fce27f29mr20086588b3a.12.1759203125932;
        Mon, 29 Sep 2025 20:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:8900:7cd:1d59:4483:ece3:c019:40f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23634sm12557741b3a.66.2025.09.29.20.32.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 20:32:05 -0700 (PDT)
From: lianux <lianux.mm@gmail.com>
X-Google-Original-From: lianux <lianux@lianux.local>
To: sj@kernel.org
Cc: david.hunter.linux@gmail.com,
	hannes@cmpxchg.org,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nphamcs@gmail.com,
	shuah@kernel.org,
	sidharthseela@gmail.com,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH v1] selftests: cachestat: Fix warning on declaration under label
Date: Tue, 30 Sep 2025 11:31:11 +0800
Message-ID: <20250930033111.63465-1-lianux@lianux.local>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929172724.75108-1-sj@kernel.org>
References: <20250929172724.75108-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wang lian <lianux.mm@gmail.com>

Reviewed-by: wang lian <lianux.mm@gmail.com>

> Fix warning caused from declaration under a case label. The proper way
> is to declare variable at the beginning of the function. The warning
> came from running clang using LLVM=1; and is as follows:
> --
> -test_cachestat.c:260:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>   260 |                 char *map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
>       |
> 
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>

Best regards,
wang lian
