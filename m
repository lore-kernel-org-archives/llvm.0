Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF893C0A0D
	for <llvm@lists.linux.dev>; Thu,  4 Jun 2026 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780551815; cv=none; b=FNhMZY3XKlgfJLllNCvy1g0VDJuW4Zc4XsQuo70MMG4KtPtl9zmd3O882lCGzNGi368XPSWgifJC3w0PTXwyvuFmBmEu4OmhtBQo/ihHkSmsH3ot+lfbqXng29HWYpoAdbDSWf3G6cl9+hjtuCmFfsA5A7ysT9Az/Siq3tQR/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780551815; c=relaxed/simple;
	bh=AEhMerSE061sddegxts/S9Yhziuy8j0ynoTHFqr9dPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFIkzal7mr6c8qTZK9vT+LOx5Fw6/RFeZGtzdkq65SBkoKZjVQ0/qY65bdxueqX/CXKLMedqzvFJ8wN9FTP18oKWa3m3evyySCN498EBus4gabWkJ/tJFSEChvtXb9Z7jDNgeoaK3TwER+ETcdhP7TpYSj17LQ1kb4i6+g0YRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAp4rMtg; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAp4rMtg"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-485ecc0f2dfso257722b6e.3
        for <llvm@lists.linux.dev>; Wed, 03 Jun 2026 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780551812; x=1781156612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=;
        b=tAp4rMtgW4akyxyJ5xMc1AS5I9FbmUPDbcENQpX4V81mkitsW1cHKttFoS2whnTvRC
         9OunO5fpsTJHHgQpgQ8itT18BQgLdreFApuBiYgnsaF8mddHFFTwTFxhORuaypRDweGU
         b6TWcBGmNLWkwXfZscN96bsTQ0BcyHJm9eLRavMQfY9cDjJQzuqn+70IhdDJjputWmIo
         IRezM0aIG4fmm+/wYKDTCC6ml5FfOXSnt0E6gNC8eWvEyznXsPPsZ3c+8qVnbPpNBesg
         7BSBEnrktEfwjw41s8CIuEbPaDFZzA45DUkvxU2+ADXxjavofIw/+m9WCylaBwqn0kui
         4nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551812; x=1781156612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=;
        b=aiIFg5uDnKsZyy24ujdiqqXagXqCmZ6hsnRdTwheMIktDq2l5nnJbpN9p0oxoeCkkn
         m7NOvNjZkfuNx0PblJb2gtupiev8jBB5PpUFYSPHVMqgE9PB4wfdPQLCk80HcEmPKEnc
         5u+GxvD1DmWbX++VBJSL4eOA5H1X/BvEnL7ZXw0NjEcoWDNEGJspfIV+eXJXVZGc1V9o
         kB5t5EXNBXsud85VH4ry90Iej4O03aktJGbb9vo1TJUmuIk/sO8YyOS2C9tzDQiPA3MH
         3fzNiJfwmJBHM2AuVLbV1nubLQ9Y2a6ph/3WmZ88MSNkiVil4Qb+cKCgiG+Y0SOyxyln
         j9CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B32LMiV0cnj8mRNRVKuq4CEMhaRIn09IU5BxR+L5cUeytBv7PNxh0jsTppoEhP0r10ZTW@lists.linux.dev
X-Gm-Message-State: AOJu0YwdPSzb5ik77wL+xdYZWUPAVkm5IpmLJJR0uAtAT0BZro801A2M
	v8YZ8bpmDRgfuzkABL9bPNJhCa+smuKigK1QKa+QkFyPKQuGlJ+EJRzJ
X-Gm-Gg: Acq92OH6X8egF2mKsMrJOUe2X69ajuHSE5iOth3nVngr3bIsc/Bp/tbpdOJM+dHvcOe
	hIgGVjecv/k9+mZZUypIklauaxsXyFvtWY3LxwtiFOyFUvrac6Fqjie4tu3nOPZUPZcLq4loznK
	slRLkR1745l2Bkla6goTqXDM8FNq7ZllRW/csZd7LUFeolFkcjxpKO4YoSnq2jLEdxoA+teG1yK
	wAXD56GhUY1ab/Aq8UW/NIIg+/J9Uq6IubBKRbVumiXYu4fyMMIP1ZwrP3QX1X7uCcUD6zc3tko
	ZXaDYjOv8AkmMVOhy7IwNCdVeFKVNlOcvz/RK8HPSm8HUk2UUOUj63nPGB6iF/XRyKvYpXX8LGk
	cINKtofJ3mGaFgOvKWX6fG0vk2QkXlc/d44Al8tJvmsLzODCLq/+ACO4F2y35i5LXmcM2JlOzJZ
	E/TcsDB6a4UOHzqZBwH4R6I72FKMmz1ejhsJJ87ftX/y080bAoHnsX3vnLN6W9t/LY7470QllIQ
	hVC1Ykq72uGuNPqu7Jkj1VVYSzXpRTAI3Hbtzy4CYwVMdjM4wM1wtQInUtdPc4mMyFbyA==
X-Received: by 2002:a05:6808:d48:b0:486:4892:d562 with SMTP id 5614622812f47-4865a9a50b5mr3872126b6e.1.1780551812279;
        Wed, 03 Jun 2026 22:43:32 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e75c5495sm3197548a34.10.2026.06.03.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:43:31 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: nathan@kernel.org
Cc: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	bavishimithil@gmail.com,
	kees@kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@armlinux.org.uk,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	rogerq@kernel.org,
	samitolvanen@google.com,
	tony@atomide.com
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Wed,  3 Jun 2026 22:43:29 -0700
Message-ID: <20260604054329.19450-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525165527.GA18457@ax162>
References: <20260525165527.GA18457@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> are both pointing out that cfi_types.h needs to be included in
> arch/arm/mach-omap2/sleep44xx.S for SYM_TYPED_FUNC_START to always be
> expanded properly. I tested adding
>
>   #include <linux/cfi_types.h>
>
> as the first include line and both issues were resolved.

My apologies, I was switching systems and seem to have lost this somewhere
in the process. Sent a v3 with the include, thanks a lot!

Best,
Mithil Bavishi
