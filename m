Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695B1552E0
	for <llvm@lists.linux.dev>; Mon, 19 May 2025 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695574; cv=none; b=AheEs/dHlCXPer5gZOygn8NvMzI6RQq0MUAQG5ckxHHyj7sfn5a0NObEKnIar578WDLQnLokkw10hWWkYdT/FH5MZpd9bclxfb7lXO6g2pUhdz6lVZXaqMvrFW5XpJUBpaPmixuaeun7bkEpmKn1tWG0YWPB8JFWzcRNrW1jY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695574; c=relaxed/simple;
	bh=8iKBEaeTULtgFafUr0Ol7MTdi0PE6fIG33lV9AUp8Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW9QzXHzPdN8qIkDUv6lwd5j9dYXPeWl+qcWQYH9KgJV09U5X7+Gjd5tNqfc6ES91qhId9YqGgKKjPmQCynE1ZuJTl4T88nlqk0UeHf11Yc4ZJCMQXwnKKZ4fjeH9JzH0HXy6z+QS04W/o/Hi4HFsiTIORoKRFVIGKRqO6sQqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PnfMhyFU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PnfMhyFU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231d4679580so31623215ad.1
        for <llvm@lists.linux.dev>; Mon, 19 May 2025 15:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747695573; x=1748300373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjbz2nd71z1cnZ9EhJ650XuasmqZlHIIfAB+H50JTUQ=;
        b=PnfMhyFUiAQZ0e6WliOJ3Fw5H0AKXIbZTLKbkxafXsvPSkiti7yzKCF8+A5kgJPMN4
         fg2I08Hd7NXmBDm6OqEcnrEdER0HSqnpmMGb0MHKj8Qyso2Mxr0no2P66BAKa0Pzm25F
         NhvEQ3FXp2x3Utlui7cTci0GZlluMAk740/80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695573; x=1748300373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjbz2nd71z1cnZ9EhJ650XuasmqZlHIIfAB+H50JTUQ=;
        b=ahWavU53JhkSS1nr84GZ1kzz1GeVctML9g+2mZ7cqt53O1iZ+14PEPdopuI0OasNYr
         vgR7Ua2dD9Fyg6/ugfSKZX1guDWkbCitgsgGHqju7aqFtdovnq+4J0JZwRo0T1e9Q4K+
         sLZJK4v0XLpcAErEgFBvMCimugXG3DYW9dhYKm4vdSeTPgUoHpVwS9oh8bXU9ryXbVTI
         QdsVkLrxs7bv5jPbQkMVahN0UVx+Yd39cObDNNGHhoAXPSzWXM5d+BDFgItBOKbmvVe6
         GrBDZkuPIkVdWTJNrXpD9/RoVvRAzYHZC2Ji5n1t/l1sa900hKe8rCJaNTNCwkY944Ho
         BaNw==
X-Forwarded-Encrypted: i=1; AJvYcCUmK7sR8kh1ghKroC1m1i/hmKHljwYd4Rja+gE3MODAqSKzh0d+PvSVjHiqf+5443pNuste@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2y03wIMwaq4NYTFwUC1MgIxDzWKL5qDnLcUlIKsFj80scHYPq
	pLObHHyZpY9uFBDY2/X7lwPZL2ocmq33LiMSGZt58RZx2scATMM4bKGwkBJdX+CF5A==
X-Gm-Gg: ASbGncur6Vx0Ese9F0goSrB6tY/1N2SZRfDg6RdKx3wOAD+Jm63yGuL66h3raZWOoFW
	1nyt2WLTHlvEgDoj3jqjk+r1z+7vc+ed9co5wAyWCDKl1fA5pSPO5VygfLgN0t0U5kJGVawbm14
	CDU3nHCOkUUXGyEYDHTGQSOiD/ZtyjDBvVsNKKAziGgbdXcnkWRfaL42FfCh0jIlKGLFcTCRyvG
	zTp8EN3dYqmfxF20KLs83MgLK2T0EJnnlaN/eAjjwWQA2ErGL2glB1EZ8NcmRH1C/HdGFci5N45
	9L/GBB1owNEfkmMWqEHRmfYfPTnGN2WWahgtBGtnq005EkLdeD6lYhO5H7GHpnCCzYM18yW+Qcx
	2qGnndQ/rIuxOBA==
X-Google-Smtp-Source: AGHT+IFKa6iooFD5GeLGECJwMU3VFaa0UYPWSz+Gr1JGX91aZOI98Hgy8lFsH9A2ZRwAhwprY6+N+A==
X-Received: by 2002:a17:903:24f:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-231d43d9c8bmr188174925ad.5.1747695572726;
        Mon, 19 May 2025 15:59:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:379b:e49d:8d8d:4983])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231d4e978e2sm65330445ad.125.2025.05.19.15.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 15:59:32 -0700 (PDT)
Date: Mon, 19 May 2025 15:59:30 -0700
From: Brian Norris <briannorris@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] genirq: Add kunit tests for depth counts
Message-ID: <aCu30rOFY5vL1AU6@google.com>
References: <20250516183213.848182-1-briannorris@chromium.org>
 <202505172307.yTjulMhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505172307.yTjulMhx-lkp@intel.com>

On Sun, May 18, 2025 at 12:13:47AM +0800, kernel test robot wrote:
> config: arm64-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505172307.yTjulMhx-lkp@intel.com/config)

Ugh, that config manages to have this combination:

CONFIG_IRQ_KUNIT_TEST=y
CONFIG_KUNIT=m

I assumed that "IRQ_KUNIT_TEST depends on KUNIT" would rule out that
combination, but I see that's not true. I feel like I relearn Kconfig's
language every time I step outside the simplest of dependencies.

> >> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
>    >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
>    >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
>    >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
>    >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
>    >>> referenced by irq_test.c:81 (kernel/irq/irq_test.c:81)
>    >>>               kernel/irq/irq_test.o:(irq_free_disabled_test) in archive vmlinux.a
>    >>> referenced 5 more times
> --
> >> ld.lld: error: undefined symbol: kunit_try_catch_throw
>    >>> referenced by irq_test.c:0 (kernel/irq/irq_test.c:0)
>    >>>               kernel/irq/irq_test.o:(irq_cpuhotplug_test) in archive vmlinux.a

I guess I'll need to squash this in:

--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -146,7 +146,7 @@ config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 
 config IRQ_KUNIT_TEST
 	bool "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
-	depends on KUNIT
+	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
 	imply SMP
 	help

I'll sit on it and send v4 eventually.

Brian
