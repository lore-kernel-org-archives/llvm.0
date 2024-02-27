Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DA487A5
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709056902; cv=none; b=h3kIftOo2JOqq16909zaRauCQ0CyOnNXHO0XANAHDNnaiUh8JBTjqniN7jT0mt06sZG+2wnL97TvTcxBbdV0+fpOAhNVK3zuaeQYBCGZzwx5mvZecLSJvf1GgppEfpWow83D330nXFUDdYPTmmk0hKCmeCxQ3FnyYKHU5qMKMuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709056902; c=relaxed/simple;
	bh=11wohr9v0VD0eGk5bCu3/FEtkce4druZgO0DOYzAe/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohrMB/TsC/nLnKH76Lx3XhhmJm17pT/TGG8LWUbMTnkpyR1IULKJoX8BfGnpnQqsiPgZqmw4+uvmM3Z8o44mgGbg1bkF6LsbbE/hZ5WFuqgckPjdw4x67+onNrepvus5W0zLkt+0bY1hk6ZkSUgBHU898FSJVMhJaJaTiwXzVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LnMpvNxl; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LnMpvNxl"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e544f927d4so27408b3a.0
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709056900; x=1709661700; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9GXzY8wD7hiWvdgZ/hX89fgqhixPVAq/3JQfnan5DM=;
        b=LnMpvNxlvCYS/4TYk2T0DWIZ3udKw7aa17VLWV9blpmgHGtJb3ZFGxXbSvrvqsY57H
         s0N1FgLFMGygSr7E/kDDKn/RpJU37ZUV1OKRNJJ4Bj4IeRDgjhoOhlyqFbmDsoHYVCTo
         uclFaerVpfDUHIqZbwlNhC9TkK+xGSB3wsJUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056900; x=1709661700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9GXzY8wD7hiWvdgZ/hX89fgqhixPVAq/3JQfnan5DM=;
        b=EF3FI023AE9Ixb+k7yNFwwZhAlnZrzcyiQPazGaJg7y1hRzebAMVHs57CI/v3/R6Qc
         rCm89x11iHmAcqAzRzdPuRldIlrQB0/bjPn38sSxJuibLKHTjo7oVrhafS68io8z02nT
         CgFGt09Db3UtmKKFXTGa3VZBg+/lZEGhVrlqh6TSEkZtIbrJ9f2VEy6GzqoE2FAGGucz
         +e6dCZ5BewcXA8REVyYr7b7Ec6t+fRHrZLG/pwizmkyhP9JNtgeBSk+/HjI57YR7+74b
         gd7OZuCzwSLXHYbz6mnAc8leoxVAm3A7CQwXtnl7Llg38qJ8Xf0QPZaTodgxkuUFc7Xa
         +qBw==
X-Forwarded-Encrypted: i=1; AJvYcCVKKN9xExQ1+uXs2yFXGJKAdZFccyL0hiHhgbuB7UMx8wrsm08ikx7UY/6skPgIcVxzopLs746bMYqe2pR/0F2BcKqCfQ==
X-Gm-Message-State: AOJu0YyN4yHIC6bRaDpFca7wvCSmNwDCwb7ubGNuKxjPE7uXMmINfhpT
	4VtmgiSKBMbDJgRCM/Uf4qZLGmIfR6QIdy07+vcBL5J0JB7iz9Hi/zC1ZOEQFw==
X-Google-Smtp-Source: AGHT+IGXbCpSY0hW+YqJlgwhFhFoVGU0uqU5vc7aN95rVYXxdyNoW4OnDKVWbEbDMSf+RV72+HZS5g==
X-Received: by 2002:a05:6a00:9283:b0:6e5:32e9:2954 with SMTP id jw3-20020a056a00928300b006e532e92954mr92342pfb.16.1709056900576;
        Tue, 27 Feb 2024 10:01:40 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b006e4625a0f0dsm6169653pfi.169.2024.02.27.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:01:40 -0800 (PST)
Date: Tue, 27 Feb 2024 10:01:39 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
Message-ID: <202402270958.C9B4B0B3@keescook>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
 <202402261703.695B87E6@keescook>
 <CACRpkdYZsBQwUCEKsspkZ=M0Goo9omMH=LM=pWyOJ0U1WtySYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYZsBQwUCEKsspkZ=M0Goo9omMH=LM=pWyOJ0U1WtySYg@mail.gmail.com>

On Tue, Feb 27, 2024 at 02:48:13PM +0100, Linus Walleij wrote:
> On Tue, Feb 27, 2024 at 2:06 AM Kees Cook <keescook@chromium.org> wrote:
> 
> > On Sun, Feb 25, 2024 at 09:08:09PM +0100, Linus Walleij wrote:
> > > This is a first patch set to support CLANG CFI (Control Flow
> > > Integrity) on ARM32.
> >
> > Yay!
> >
> > Is CONFIG_CFI_PERMISSIVE=y expected to work with this series?
> 
> I enable that and what happens when I trigger a crash is that the
> process shell is killed and I return to login prompt (busybox).
> I guess that is expected behaviour for permissive?

No, permissive should just issue a WARN and continue running. I think
you need wire up report_cfi_failure(), see cfi_handler() in arm64.

But non-permissive is working great! :)

-- 
Kees Cook
