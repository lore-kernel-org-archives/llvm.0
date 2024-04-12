Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EA241E2
	for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712907518; cv=none; b=aDnLBpUU7mctO/pfbhk3IjvhjvktTYdE0xkxGl2F3VeZoAugkaqOeNF7BxwZ/jP0J0veZUhP8ySb6JAi7nzgRSS5hMpwABDJYnietCxjc6NNu1VC0rj+cFgX718UYbYvRnMG2stuw+CfOvcAJNc9kVOiLPBcMTQx6bZk/MSVfvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712907518; c=relaxed/simple;
	bh=oRSfboRrbHW9kvKlRZgzLqzHXG6ELy1IaaIIovuc+zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsUfYBCZU0BThxRU0kmOGorgADJ9H+4q8xsefXUt9RlYb8xAwSkOC5o6Lf+ylbUjc7crK8yQvKs9fyt+yRWPnfgPMwF6rMZ9MZnOvgwyJNkbDsAcnmJBZZuOE6/21AvVWkk61FVcy/fSpfV24kHq9+ZrYoFCczIhYIXAYjPNpcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbEMa1fZ; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbEMa1fZ"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so650994276.0
        for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712907515; x=1713512315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRSfboRrbHW9kvKlRZgzLqzHXG6ELy1IaaIIovuc+zE=;
        b=EbEMa1fZSHgwNmMdcomkgwHHZLZPKUtovJdk3gOQDSn34HE01FrFez3M39zDp1w3Jy
         l96ROGvB2NMF/VkeedQLTLqBjRw3m/TEYkLOW3y/TrP7/IguUCYyb4cG9DSJnQMNaBE3
         H1V1mtE92Jt88B33Vp/vYEqg1Y1DbwPX7Xlpg5djFntGv9pedcP1WNIIAV0U1tx6BE7h
         LeQzKB1w4yiuy6ezPjPuwZRKWbkdPNrZHOgD9kw+uUmlMw/IuzeW6k1GgDGQ+gxWL6/X
         JRhastASMUpBrfi6TjlDBVq4wTrgAq+p1Cq4SwtpJXpge9UY8xTS85SmD8nGCqZ41bMN
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907515; x=1713512315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRSfboRrbHW9kvKlRZgzLqzHXG6ELy1IaaIIovuc+zE=;
        b=llfIYJxomQXxJIkZDvnviZiOliyBfOCc8w/KWHcIGbaBAGTaaq+K7ZW5rEjoRqrAF7
         pxlLkI4GzZuvYgYD4TJfff+VJIw/PhIdH+YkAofjcNpM0atacyZC44kHI4WO7sb5R4tu
         B7BqAXOJ5PckDQSC8XIFCoQyBpPutawoSv3hSOPf6vm5hlLLhdp32gALiO93XSmZX61b
         zEuYaE/nvB0CqZcq4NctNV7OBq82AIRGdEVWm5ZxqcWzxzI3ZH9fqR2RYWOlsoeV2d6d
         hfplQvy0pGpFOLutzLe29/u/hKZIga4b5ql3g//uv6NnsXJ2oYQ4SZ4ZBxGJtg9OoBfl
         8TWw==
X-Forwarded-Encrypted: i=1; AJvYcCWENV/r0lM3exXKq1RX4UANhDrnZ+JAQ5ahgX7eYoe7uPSQstdnN4FPm5dHM+C1oPER/lrodybpzZGOfVCQza22KElsRQ==
X-Gm-Message-State: AOJu0YxljLrUB+YKRtvPjeYDsgKnZbdtzmoGwU+nG67VCdyut/OhuHMU
	rmKOnY3Nzw8wCHX4gAMDK1NhtMhjzr31zx/ttnBoknO92JxV8syuW54CblZqprA7yGbNLfKHX1z
	/fqGF4OUC10Nv5m4pPbNOIwjO8FXArObw8ZkLKQ==
X-Google-Smtp-Source: AGHT+IH4tGOq0yrEAn3isjSet/vpq2+NocJuHgj0zxaRI/x6E+M/1/V7QRoN9ZEEM0Z+Fz1qC9LqDwN72y41kIYuYBY=
X-Received: by 2002:a25:86c1:0:b0:dcd:4878:1f9 with SMTP id
 y1-20020a2586c1000000b00dcd487801f9mr1857001ybm.8.1712907515636; Fri, 12 Apr
 2024 00:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
In-Reply-To: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 09:38:24 +0200
Message-ID: <CACRpkdYW-8gC7rGtt-jg8Huv_smB_4Dze4NYgeRL53YczzzDNQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] CFI for ARM32 using LLVM
To: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 9:19=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This is a first patch set to support CLANG CFI (Control Flow
> Integrity) on ARM32.

Not much reaction to this apart from Kees' ACK and I think
most patches are pretty straight-forward so I'll soon put them
in Russell's tracker, I can always update them if there is some
issue.

As mentioned, there will be some rough edges (e.g. eBPF)
but a slew of machines boot fine with it and it should be able
to provide additional hardening on a slew of embedded use
cases.

Yours,
Linus Walleij
