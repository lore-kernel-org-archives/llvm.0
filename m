Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C553E49E4
	for <llvm@lists.linux.dev>; Sun,  6 Sep 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689265; cv=none; b=hoQmse8HrVU45JXnFUI38C9+MmZPWd+msQdtRXEkpaFJ95mrsH5CHl5saQsTw5n+7HuCCZWotoHhJiH2JugBPxRoc5isd7ajuIZyft3MwyV4qbI8ARBaPD40wQs68i9pvXVmfpJ3c9A283arqFDK5gg5iYNeLHdsyw2dn7a0btY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689265; c=relaxed/simple;
	bh=RnAEc+I+Cqq4lUTdx0Q5kkcBBZ8MAk4TasWgEbgmbEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seof5Fqf+tE1czxtd1Xr2cLQKDjMW3h8NV2woYJBIMoSFWp6dhBgYjMcCYyPuiSRJSbDIfk3t6VFSmvtOqT3LSmaMDffF76bRah/SXtGPw7J41k1cQ1k7xDOwSkeJEpDn2Zhqy4o7MasBEmkwLqjQmPzvBYUSJU9Fpva3h2ABh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz+ciKLj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz+ciKLj"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39ca300db70so20068971fa.2
        for <llvm@lists.linux.dev>; Sun, 06 Sep 2026 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689258; x=1789294058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mv5PZ/MVDDOKzC7mTafEfq3SK5tNJ8cn62CE8cNiWXg=;
        b=Vz+ciKLjKHr4gfiGinh7RzMgCss7Pn//4sl7XpUjQZ1gJspMLPfTWVixcoEhUU/zvt
         qL6QPT3nG/fr5U5traqvPPwc5a1j5EIK2TtG76TBEjRGxGsjzEBXUiApdr+csu7MYzlh
         OYS4io+fsx/dpa3TAaAUF0NxAWeStewA+h9+9rltFZizVvSxJxRJnb3Kx8UiuAHyDWIp
         eAzzZEKhWfXp80AnEdwxA+Nw7jxwnn0D58QhSDsLRkG7sR66oxG7PtnsQ4ZPnk+PnkA1
         4el98oUvAnfk5th1d2hWQ4kjt8zeLNmGUuSMYGa8Qu/j6EQ+pzHid0kxfYhnVE+XKNDG
         dfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689258; x=1789294058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mv5PZ/MVDDOKzC7mTafEfq3SK5tNJ8cn62CE8cNiWXg=;
        b=EpAPUDRDugkbTLwxki7zTNfzj5ldcNeAwlYul8W/HNHSF/pq7Xb8bEfpyi/vIZwCcQ
         tQmtzNh1QfNRCKx5iP7GPYD0HgAOrswHTvcrCuqq4wONox48cIpGM5ymuALeGHgfU+8V
         CKsgMEBKZpKwQA9TNoootlfRde5vdzhcEsa48h680D/M9ztsOmPswn3028b1kEdncAXg
         qK3SAYJbjFU4rDNWdcDkOwS+960bQjxSMrlVPAt2clNHKBTpVRUqiXfOHjCxgXVIY8ur
         yPOR9BzwMpk9ICMCDvVnyW5UcQX+h6tqlHtu4qAe4NiLNPEEJahQnuk8r03iTHdTRMSJ
         YB+A==
X-Forwarded-Encrypted: i=1; AKwUvBw17sLN0YhCYtCZavQz0VlqQ61RhFLM/KfnJKu37lYDlEqs4h+OYqhyTLDH4d1r3zSsNsV5@lists.linux.dev
X-Gm-Message-State: AFuF++l75aOvrm2OOjdprHzRke0uH/xu1aTyQw7AcFj5NnXLZDlLwkwK
	KUZYND2LrZSlF644pIJGtRd3lrR4MyAWrsKeS8vRzzLbp1LGYnvX+EGj
X-Gm-Gg: AYBFou1jv8wjn5spLBgeHq/YyA4rVV5CXOnkQ66yRMe+xr2GLYTtcunWWpOHuQJAiI8
	pclY2NpKeTJt8aC37M5fpNuBzQC9EPGoyGP3+eiiq3vMfU/H4IMVijB9U7BkwUyHA4CcqsVV2PZ
	F1P3iDgatqdJ6S1fCG8FpST+oIs1PIYcVdCrruu8jr0+emldCHFalfr9GMrUpbLPDn+dFmBJ9Tl
	NRdsfkK9vim6xewnE0bjOLdPlg4YIVNW20Z9GQqSWxg8yMyCO5Be/33ecT837nA/mdt+33bRCTh
	WhsE//HspWcEpWVk5BNgaLSfzEZMbkaLe6L/zl13OJGvbHpRuael0r9101gkbdVzaG+jnR+nwTx
	SKgLna8JADwlJ4fdRRPRKnu01cwh9m4vjAlOsJvCS3ZO3cAe8dy+HyHJaFUecVuF60fSu6TGjgQ
	w+aBO8IvcRs+Yazs5h+Qoq4YRQpFJ0dm0ZFyW3cQgsR0+NBL9GgpnIBPUZ/2tnYfCuOcO+Eahzf
	FQ1UMog6Op8iUYoIwWgsgLDUjueGKx3np8GDo8OYmx8+SfDsslAhSqEixo=
X-Received: by 2002:a05:651c:552:b0:3a3:74b9:8a78 with SMTP id 38308e7fff4ca-3a374b98afamr15556071fa.17.1788689257905;
        Sun, 06 Sep 2026 03:07:37 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705a9b4asm21482421fa.31.2026.09.06.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:07:36 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Sun,  6 Sep 2026 13:07:29 +0300
Message-ID: <20260906100733.435411-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ao1i3hKEpAgHLICz@ashevche-desk.local>
References: <20260824201203.396651-6-zoone.rupert@gmail.com> <ao1i3hKEpAgHLICz@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 12:39:42 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> I stopped here, I think you should understand what this code is all doing. Now
> it's an AI mess. Split this patch to a few smaller ones each of them you understand.

v7 splits this one into three:

  read buffered samples from the hardware FIFO
  derive the drain interval from the watermark
  implement .hwfifo_flush_to_buffer()

The timestamp estimation goes entirely, which Jonathan asked for. With 3/6
split as you asked, v7 is nine patches.

Retesting on the BeagleBone turned up a bug here: the drain discards the
compensation temperature when a batch pushes nothing, so a capture can fail
to start at all. 4 of 6 buffer enables produced nothing in 3 s at 32 Hz
pressure and 1 Hz temperature. Numbers in my reply to Jonathan on this
patch.

> Can _rate:s be negative?

No, both getters return BIT() of a three-bit field, so 1 to 128. Errors
come back through the return value.

> 30 * USEC_PER_MSEC

Pre-existing, like the min_t(s64, ...) from July. Both are in the cleanup
series rather than here.

Rupesh
