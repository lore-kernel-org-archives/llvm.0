Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BB4EB864
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734268; cv=none; b=enKjFTAAomG27AsClLmOTJFY3um7yTBEOxOSOgdLgq7Bte4mj9U9Ibstr+tH6jN/kSd3Nmt7a8vQA5oudSk7htNGrcypCGuXICnCkWCIebhXejGnvrggr0Qp0IOxC6FMmQVDD4wSnHt5NmAdqu8z2scOsw8W3BqU0Ve8Lxgv26Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734268; c=relaxed/simple;
	bh=0EUv+GanEqAn1JfFtrxNqUFwolRcvTRXOT2sLEu+pVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS8ulQaoUrH+VDe/YgFcK/C+QveEsEVGWToLlbpnSE+6O2E1vIfi/narSwjF6AKHl85MkUMXNxntKdMbeXmZK4VsHBXVfEAAPKURKKwQUmnhr6WmdmXG6FSOqLHVvxLTjrdc8rjp3rLma3xCvVqRjHHy/pvGQfrRTHWqF/hKrEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7Qe2dl7; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7Qe2dl7"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so4671051fa.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734264; x=1790339064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXA5dsmKNEnAug+zqks6Fez66gO7qKGJLh9NGBSeS+Q=;
        b=a7Qe2dl7zp17xYvfFTYqTbAO7MMeKTzmUCS5xVwiVJGJNTOeeoV7g6USVz1bEoYITY
         zl5P26Kau8jMgcR6nH8Te0cEK9W1gX07174MHe/9niM6nGYdMCdzVeHIAYcb8RpbMf3k
         Yz+Njimp/NvO+nJfr5ADSg0A9Fy10ZSHsuaWxKzykuRP6u8a+r09QI+OIluzPpj7sfFk
         BbtUBHYNKVR9oFXeJbgn+L4nQmK6a+Xv5ZdbDtVTohVWfdxtREYZ/hbrxuYg6f78NvBy
         B3QZ8WvpkzzkyHqTPcaNzgcwnZSgTE+LNW/MAK88JTlVRPa48lbY4LdVBXcZ9iMkJNN6
         BPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734264; x=1790339064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXA5dsmKNEnAug+zqks6Fez66gO7qKGJLh9NGBSeS+Q=;
        b=Ig+rDlU7fWyUbl4oUE4p/pgm51Vq0wYkQl0H+khuhzsVDMT55cQcdNP8la73E1SED0
         SlxR/IAvDja3G5R9GFuYff4fF9R4CsqB49MR6iFtzLsU9PB+Vsq3SB62nzRc6jFj4LAz
         wA1sDrbNldUuBGNP7cBHhl7QmpjbiOskj0p689vFCFfCInIcX0dUGaS0I7dsU+8ZBjut
         hOSFuQ8DDQTCUYsqjmj7dmv8oNwGq0M1ZWzDJUZTpE+A6O/7ItLQ6ee65gPySGrJIJA0
         TvBarAwlr09acmxryVUfhWg3wBHcSKAMRspRe2ptsjMNbcbpJqNefMjDwI0XQ8jKZj3a
         +JNg==
X-Forwarded-Encrypted: i=1; AKwUvBygTNy3Id+47wpR+wMYa0P2oinw68zdLCWQV4bp2Q+znVCSEWByGJ3ldNog1u6vwX18LR4s@lists.linux.dev
X-Gm-Message-State: AFuF++nTUwYnrnwptO5ItBJQDIdMTfkjAuzBtv34pREl1+JlyS500fH5
	MlurgEF3kGUXkSA6AWmgmBu0wN0YMG4h8/dT9b2Rmj7v0FN5T6Bwt6BT
X-Gm-Gg: AYBFou2xYZt5Yu240a04vmOLrvTNVzuHNIxoQhZv2eZaWALZdbIAKVY2k5MltacMzNZ
	cPN7DhxlTyOvqD2bqPWO0s2XTuFBYRDbbMO4m/f2xD3WV+80HirbgINl3x6VPsoTT9Ph9KQgNn6
	K3RE8KuYmjPEQ6FWuaypYB79Tfi1d80rcjOW9U1t8oNvKdGIJOh/ex46wMLeU97stqTgmGS+b8S
	O487axdRSVI0Qzf249yTCwd5iSFVDt2RGnRua7WVFDMz4BWzAGLCZajGVevb6qZSEqXcAI+DjIx
	PZLr3ccQxMhAkpCJuTuFrXrqC/TjLEnzHm3UkRsJRj6tJTg7XRMQhUqK7lR8xX2RNJ/lZh4p1Yt
	Br+Al0GKeLL3jz3ahQGjJMRaBEZIUfgH/B1vIWwu6auvtgYuHyL5MOck4pk/vM8TGETXNrrCNtl
	Cc8vhg7VzG9BYJ6m/vfmRuiUnLuvsXxpdE9ltOSxqtCR0VBpsR/jokoRr28AEP3lIgKNri+Ox5V
	qay6xoTP+UFIdBlBEmjhzwLWg4OMaIRer7rCO2O+ypH4Be957TuSpKdZnAtS+rhu2SbOw==
X-Received: by 2002:a05:651c:2113:b0:3a5:db7a:23b0 with SMTP id 38308e7fff4ca-3a5fbfd830amr4870991fa.22.1789734264223;
        Fri, 18 Sep 2026 05:24:24 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5fd7b7248sm4526681fa.10.2026.09.18.05.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:24:23 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
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
Date: Fri, 18 Sep 2026 15:24:22 +0300
Message-ID: <20260918122422.375244-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178813888151.2788519.16547013180884814648.b4-review@b4>
References: <20260824201203.396651-1-zoone.rupert@gmail.com> <20260824201203.396651-6-zoone.rupert@gmail.com> <178813888151.2788519.16547013180884814648.b4-review@b4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 02:14:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> As before I'd have the structure locally here. I really want to be
> able to see what it looks like.  Don't worry about the small amount
> of duplication this will entail.

The FIFO path refuses the timestamp channel now, so the two channels are
all that is left. It is a plain s32 channels[2] there rather than a struct
with a dead timestamp member. The trigger handler keeps the struct.

Rupesh
