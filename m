Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E24FB9AA
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015472; cv=none; b=GFHHv5+CJw+jCf11e1WT69BcjfssaBuLmfxt2IP3XGXI/Bdu2lWXubTu3sc0YqUBnOaweuyyckFn/m5fSWEXTtrebq/nKnKQSnR3Mgqy2d/FLb9m7cANuHmD+WKdpUqPPjSRbCwMo+iCY4NX28tWITWnXw+PLsUO8t+yikJQU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015472; c=relaxed/simple;
	bh=aw6CVi2nbRv8fPDaXOaXSEjR9geXXb4sm8diUOqavKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6ysM88P7X6W7ATMmZMwsPLRVH7SkUfyjtPvkCdzz65HsLL77XFSZgWcdDo2Nk3+/OwYM2W8IuGPxEQLi24SnphcbPTKo87t0fI42ru1liZ3ED/4rzuLd09PYsrPWA7U7OqWOjtl58kzIdQcVx3YeyniCCgGqf6+YS63wLOp2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhFOnegb; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhFOnegb"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so1824851fa.1
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015468; x=1790620268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eVGrW6waYffaGCq/np4EMOiip9V2YcfYQGrJdZIZj0=;
        b=mhFOnegbe38DPxatcwesjyKkATPgiiRv0E2VAtn4lG8uFvWe5ATTbl9gTGdDS9mTCI
         HCbBaacXbMpY9RsbrEoy0IDjBAObXCf8Pig4zNj5rYpVV/8AWYVM5DXmlPeqJlbcMPxx
         xBUclXQ62gI/Xo7WmLP/kKgtFjh93ArvwuQwiFxZ0sNfAEr32p4109mkD7xTYVyE6VtN
         Dy21VovbjS9jfx8EFyQaLEFu+pt1podNVF5l8M91YV6UdG0zAl1y1Y24yKN+EG5idgHB
         Dj+ZBhWT+jCut1qyiTq81vvaoSuPAExBbnf9vbCTLebu87yTKXybnjys7dxlcy1lHvET
         1WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015468; x=1790620268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4eVGrW6waYffaGCq/np4EMOiip9V2YcfYQGrJdZIZj0=;
        b=AWghtidVraap3JXBsvFAwLoHHxSi46mS7zFGQNOjtJStN74Q51/ai6xRFTVu4KFzYF
         CukpQPLWM8OYvUoU1AtC4yLN0U4mGjjLfcdKQSwxL1WT8lFvl2LTiHTRgVZeh9nFNW7L
         bNj8bJj5dmy+sgX+SQZpGSfvknwJ7Cin8Lp+vlSp/rdKpaDT18fwSgSI0PldSE1q5brd
         PtQ10LqZLKMJLmC42aAKBJOOGuxl6I9QYeVxb22Sx4AX0BZaPDCl0Nn+veR0NzHIzSZf
         +98nlGCNiut4aAt2SS8MYa9rFmZ8RoUKZUPJOgb8lNmQJJ/TB40ECmx1D/TPkPnixBFX
         by2g==
X-Forwarded-Encrypted: i=1; AKwUvBy39cDM/nYVTN9YTRv3N3r9/AOHAphYD/RgPrrVdnd2+Q5HVtuxoiqjaNwYsq++gvCtk6tX@lists.linux.dev
X-Gm-Message-State: AFuF++nBg77Q1IAKLjXSP81yAc7k8cM8XdJyp03/6+rbrz50L5bQstx2
	Fncd6y80EKyJmxlE27OJPnbL47g0T0gTvkVqqEY9JCNfB6DwApn0AU3l
X-Gm-Gg: AYBFou1O9myV2e37vQhSLKwXhgCJelFGzEeMrbxmDkcYoAita7+xxkKBrUCZzrGgJh6
	p6MuI1fPHFRhPVfM9/pdm6Ts4aHfv21LHmlO/p5Ab/PqlnaOeN7mw2CP6XkxZPIH4FaMuA7SEQZ
	oxOcXqsA3z4ZkHsKfXXFQS7bkRJ6JAoMTcSju48IIsfskXVPPbvSrq9oBB+L16gu8qye0PI95yT
	HbywAYvoErcJPrc2VtYWYB6cTZPQjjxvSnNYP4suTiBR4UNxpdgMFBGaLdUgQOa41a0LIcuhc7i
	Gt74GFrqMQMgndfOEfDbksgF0H6H3twpevsPKDQzo7xmycouTyVrhnAXjlbRo0QRDGKCbLbmsHn
	u948iMP8tqj9ca7oRccI5EAo7I9cPUupJwbRi1E5ewtrOwDDQ+3/aVbJVba2P7NrDwl2lFQyH0/
	wOFkWJ/x8BKfB+N0tdem7+SLU6K9MyrjLWWwgQa7Bp9DY4fc7rhAWh+N1uHR5vSGYzrupnsJwET
	SMYcEiqo5TaT46V0l+VifWI0fAorww79pZWjmjPTyJ4GjsUced7u+x7Dmkd5uEn9Jpv/A==
X-Received: by 2002:a05:651c:a332:b0:3a3:61ec:43c0 with SMTP id 38308e7fff4ca-3a624d968c7mr1134591fa.17.1790015467447;
        Mon, 21 Sep 2026 11:31:07 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6075e3522sm26102611fa.21.2026.09.21.11.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:06 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 09/10] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Mon, 21 Sep 2026 21:31:06 +0300
Message-ID: <20260921183106.231972-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178992913316.706584.1446996024286841775.b4-review@b4>
References: <20260918122517.377565-1-zoone.rupert@gmail.com> <20260918122517.377565-10-zoone.rupert@gmail.com> <178992913316.706584.1446996024286841775.b4-review@b4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 19:32:13 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> As talked abotu above, I think iio_device_claim_buffer_mode()
> will do the job here as it stops the IIO core transitioning between
> modes until afte this is done with the active_scan_mask.

It does, but patch 10 then warns on it:

  dps310.c:1233:2: warning: releasing mutex 'iio' that was not held
                   [-Wthread-safety-analysis]

clang 23.1.2, CONFIG_WARN_CONTEXT_ANALYSIS=y. There is a
DEFINE_GUARD_COND for direct mode but none for buffer mode, so clang
cannot follow the conditional claim. v8 holds the same lock over the
same span with IIO_DEV_GUARD_CURRENT_MODE() and the mode check that was
already there. If you would rather have the named API, say so and I
will add the buffer mode guard and ACQUIRE macro to the core first.

Rupesh
