Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38D17FF
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 01:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708995972; cv=none; b=VmKjdLJPLs31SY2yVPArVdBR8Y6x3YKJtbZzm3sw5Biie14W4lHbTOV/XncxZhHs5WkzbIkIzaWg2UGUA1RV4diJcfc10e20jrqe76hKRTg/8mrlvSbKlOMHYC8qGSs7xsRYQYXGog2LFTFCK+8m9/nJtFDBKyx0K/3p1AewqP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708995972; c=relaxed/simple;
	bh=gT90LYQkAogDUb21whG1pqvBFZBtCaEBGaMP2ERFauc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SijevhreQNydnPiY4krDIe3Hr9umMEzo6z0IAYZydmyHuXkuSyGtrX5V7efeCyDcB/O65lXCblHAlodR4EU6FlC0vSSmD486po68bH2DBi65N+feyDVBzen9EfWjgD52blXFUaqEoy1nOC2KGDX1AfSciXAExBGhfGvw8nU5ZtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U0YOOK7A; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U0YOOK7A"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso3533618a12.3
        for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 17:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708995970; x=1709600770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ilxSVtXwJEiNKpvZECeMq2I239dM0LKzAV2B07SGDl8=;
        b=U0YOOK7AzAg5/1Fmq74LC17/cmp90FCTpfX0S+CiTffTrBLGYic0lK8U968dDUNR2X
         LPOk5rBzlZr9Iz7wPpKpWUz9WBEzQODjv/g46zwnELNiQM6++IILG2RolGPPvaTYgTmP
         bgIhBDtrG8Z+PuwUesVySnWtNICTW0kJgAb9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708995970; x=1709600770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilxSVtXwJEiNKpvZECeMq2I239dM0LKzAV2B07SGDl8=;
        b=MmAOmkrbtn5nN3f0JDzume//Hgy3T0iziRDHKThvkCS9Dr9T9PZO8/+rpFi11BUCFn
         b8/cZQZ/07VfTcu6mRZa3E74pxi8CJeQpKMe8ARsQ5ejUd3ok6jSVwbSZGqIhGG5/328
         X8vyPHC+cNj1GNjuqj+6nY1nfkfAjddvzDAEFtwULqURZCUxhALeqn4XO1JUs7ekBNEN
         baogg1uklgvd89oO6exzylcoLa4LHYKktvytd3IrHNjFb3bTF1srFn1UWWXPM/Du1CiH
         MNNg3v2PZveFCh5IemhRVesvsoiqfsBomvh5wP2TgnH+uqL4rm/TL75BA1e/lsEIXmnA
         2y7A==
X-Forwarded-Encrypted: i=1; AJvYcCUXNCHf1ibWXkbbm1XEkSeInZ91Rb1wLS+F6EmlqtN+LofR/2Tt+duhhs0wSiOz8X3W9dDploeDK/gLa5z79EQlJUBBAw==
X-Gm-Message-State: AOJu0YzLesE5OkL7skJUNXKfWr9wHDWx4DoQAZ8wMYqxTAO4Wkx4EdMG
	qal+e1yDY2KVvPXBMEApuonKVqo/SPSHQPQAbSHkOycRVtVWX9KnKx7XIAp8EQ==
X-Google-Smtp-Source: AGHT+IFHlG+XM9sREVaFA5RCt/za8tb+jnlOMihqGl4vJ7sjJTIzn7SVfADXnIBmqZg/YVWZbU/69A==
X-Received: by 2002:a17:90a:4c85:b0:29a:8c78:9a7 with SMTP id k5-20020a17090a4c8500b0029a8c7809a7mr5874927pjh.40.1708995970351;
        Mon, 26 Feb 2024 17:06:10 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jx18-20020a170903139200b001d9773a1993sm288268plb.213.2024.02.26.17.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:06:10 -0800 (PST)
Date: Mon, 26 Feb 2024 17:06:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
Message-ID: <202402261703.695B87E6@keescook>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>

On Sun, Feb 25, 2024 at 09:08:09PM +0100, Linus Walleij wrote:
> This is a first patch set to support CLANG CFI (Control Flow
> Integrity) on ARM32.

Yay!

Is CONFIG_CFI_PERMISSIVE=y expected to work with this series?

I wasn't able to build with CONFIG_FTRACE=y; I got this link error:

ld.lld: error: undefined symbol: ftrace_stub_graph

(FWIW, I'm building against v6.8-rc2, maybe I need a different base?)

But yes, I can boot and prototype mismatches are caught. Whee! :)

Tested-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
