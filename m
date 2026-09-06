Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053D35AC10
	for <llvm@lists.linux.dev>; Sun,  6 Sep 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688979; cv=none; b=UqclQcgfcBIjU4Em1pEmxakKjV6V1BWnjahh1yFot52n5hRssrEdg0QUPF1evuAjC1ieztfTCsaRgfnwxNIKDmpCJwVVV22gqK8p9F1Wiare+qllq+WclsH9YODh49fhuh16ZuTD6RmLKwiI4xh/FYm+eoFC+SwHxsn0SUl1WFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688979; c=relaxed/simple;
	bh=IC1uCXmtgjcrdcBjucQzryI874h8wBozNrYWy3lJKGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmBp+rHoYitZXOoqCeyfx/Levljj+YDDRVX+r7ayGm8FTuymY2Cv8BCamRakU7igAS8ULoylDaX/Dm6dS8GL7TgaTvq5pZHPx5YIpTw3DdrjXFPekK0dGZ9r80ELpy0R1YYHDAp3i9HyDkCJQEV/Ty3XgtGpUlY80gBqs3uRLsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwNEt/pi; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwNEt/pi"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so3103729e87.1
        for <llvm@lists.linux.dev>; Sun, 06 Sep 2026 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688976; x=1789293776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiR9dFdTiyluo58cBb+DtMhNZ/Aaatk8gf6hWN59PoI=;
        b=HwNEt/piyRQAumj8agTrMauaYvgLdMz5RgiRcgQlPr2p1+jFcsrYH8L70PuQ3EH+jx
         TOrlr4sbEg4aRZ+kAXUzVVzjVxvFrLdoj6aiu565bU6dd2yoE02BEjH5gNsLg4YdwE6z
         CrB0I6FUClPhO79ZX4933possvAAeE3ojRS71aR0TM0Ws6036eAWsXxVjMWhpC3/5BHi
         2ZDBVujLXuC/DayCyrWukU4O5KhNfzpU0qij+BQdG14Er6iWVl2uh5ktgnrwp63MZ0fC
         fpmOeP0fpqHx2rcDASvojFcocgBZ1jBau9etIiGSY/WLmrWbKBJott8rF0SUMaOeCbj2
         c11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688976; x=1789293776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiR9dFdTiyluo58cBb+DtMhNZ/Aaatk8gf6hWN59PoI=;
        b=XBX6tKGDMEfNB7w18mQoXzNeq39bFPtIXKT8r7Lk7UOaEP9qed/QjnDxs/KV0pNhOL
         l0vFKpGz+bmGfBwNO1+xdIAEXN+DRtU70JRCD6pQPF+o2vfexS1V+pv9LhHbJ9LePPiJ
         bTEDFV1finVBaS2wdraQP0vHFe7+MR0HKpIGQEaXFiu5IzoJWoz1g042JNXIOspsn09h
         i+XLL+f5TJAKE5Sh8/vAT3OIH87aDwKtnDLXAey5GmY5KBhKShvKtNAND35PB3Z8dgy6
         XvRCRdfRbdVuSa9phpnxIWgTyzdtg3lULiuS8vu0mGElwOFWYcqDZBnIfNJp40+KTviM
         yaXw==
X-Forwarded-Encrypted: i=1; AKwUvBwaKMjiuyuSTq5iRsyPWb81ebqmONOmnk+up0+ySzfCuI77w4dBk7jyoJZLwg5dM51XV+H4@lists.linux.dev
X-Gm-Message-State: AFuF++mna62SgQQ2t3KHMg9mUCMBRi2nwF5oQzK7YV5bikrhKi8jVtcI
	Y3lOeX+PcYwPdwwrhktXmeMUg6NT1xkgao8KIqZT0Xk5OVG115fIczOQ
X-Gm-Gg: AYBFou1UtShQs9NZGn7Q/bmH4/qUYlBcfPLjx3FYYskeip4qA5++FiaL5Mt7ES9f7u7
	Bz+jXtjFxbW/Nh34YF4m8coM0mlUAvg3uNvNfBk5AXjSFCKJrD1LSCO5LDoBLkTpy8/vgTr0oiO
	UxPjua+eCJwkZo32OqUzZzRx1TU02dKAMuFXD+JTu3e/6XN9lbLrL1dvb5MVUFMKXqlKFrLdzge
	T9/Py9PZthkfj/695rROnCEarxdXDxHHgwgRvlGxyepAzefoFW9Ll6ZhK/yDgtRwB1n890yxAy1
	a5YdonX3tFxF/Q48/wRqZ+zLAowCNNk1KMykSW31NIJEYp6R6Xw5dq+uYGlrwp3b+ZMEs0WVGdd
	SeW48QEQoaNn6Z8D9ngoDz931nkRSLstj+aJkWniyRvFfHC2YKbh7kq3xdouTBdMc4cVhZmrCGc
	Khf075HcP8j3HkFOm+gPmAnQIOkHiZUnxCEZR2j7iCl2vA7bRE2T/Zysu4m4L+BbMXIIsFXYhFv
	KvwKHMDyyJ9CZXN2Z33utEUBt8VpvLsCyxDKdxCESxYwKu63/K+PNw+Ns0=
X-Received: by 2002:a05:6512:104f:b0:5b4:a798:2630 with SMTP id 2adb3069b0e04-5b60e6a536bmr3218881e87.3.1788688975659;
        Sun, 06 Sep 2026 03:02:55 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b616700006sm1548665e87.57.2026.09.06.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:02:54 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
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
Date: Sun,  6 Sep 2026 12:45:04 +0300
Message-ID: <20260906094622.433243-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178813888151.2788519.16547013180884814648.b4-review@b4>
References: <20260824201203.396651-6-zoone.rupert@gmail.com> <178813888151.2788519.16547013180884814648.b4-review@b4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 02:14:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Dropping data rather defeats the point of the fifo.  Can we avoid it
> by holding them locally until we will definitely have seen a useable
> temperature?

The temperature is dropped too. dps310_fifo_drain() sets fifo_temp_valid
only in its second pass but returns at "if (!scans)" first, and FIFO reads
are destructive, so a batch that pushes nothing loses the temperature it
read. With pressure enabled, only a batch holding one ahead of a pressure
entry gets through.

DPS310 on a BeagleBone Black, pressure only, 32 Hz and 1 Hz, 3 s per trial:

  watermark 1  (31 ms drain):   4 of 6 enables produced nothing
  watermark 32 (484 ms drain):  0 of 6

Other runs gave 3 of 8 and 3 of 6. Silent, nothing in dmesg.

Seeding instead of holding, one temperature read in postenable, fixes it:
0 of 16. But TMP_RDY is cleared on read, so after a sysfs read the seed
waits for the next conversion. Buffer enable took:

  temp 1 Hz:   661, 781, 802 ms
  temp 32 Hz:  148, 151, 151 ms   (period is 31 ms, so this is the floor)

Timeout is 1000000/rate, and on timeout dps310_ready() reinits, putting
PRS_CFG and TMP_CFG back to defaults. Not something I want in a buffer
enable.

Hold across batches as you suggested, since a 31 ms batch usually has no
temperature in it at all, or a non-blocking dps310_refresh_temp_locked()
seed plus a validity flag?

> For initial patch just reject starting the buffer if timestamps are
> set to be captured.

No sanctioned way that I can find. buffer->scan_timestamp is private and
kept out of the scan mask: active_scan_mask reads 2 with in_timestamp_en
set, and validate_scan_mask() sees the same. indio_dev->scan_timestamp is
reachable and iio_enable_buffers() sets it before postenable:

	if (ACCESS_PRIVATE(iio, scan_timestamp))
		return -EINVAL;

but it is __private, used only there and in
iio_push_to_buffers_with_timestamp(). That, a helper, or drop the soft
timestamp channel for now? Triggered-path timestamps are real, so I would
rather keep those.

Rupesh
