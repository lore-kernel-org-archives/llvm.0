Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204858;
	b=SpEGyaABkGEE03T7a4/qmqBinuPqDwPWxP1ZPEihDsqfcrjBF6hsIL+SpjXCZWG3z8PE
	 A6TbLiNYiaMkFU0un6gpfEu2BO8DhyhouEBy4RCW8Q1Oi8Y7Q6hZBBZIyPq1J1SmpX9od
	 SdSwubDlxT62ku0lvB1v2LLg6c0mFkQrueI0ikCK7sgzk5pEiJuRQRRDyVCH2Vpy6sI89
	 2T+m02aU2SwHo/AJG7wIsXoaTCd4ZI+m+JTHOLPTtJ6Au4T3GN/CCvxJLyUBcTjriVD/s
	 RoHj+yr2HgKSnJjN4scrsc4n+cSXChn4Msf0LPjbW3tGG60KdY3gnV+XN23cGyrCtjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=v6MACD1sBfgK5beVMe+EiTqIGqdXAEDg9pQGTzuk0wA=;
	b=zf2ml9YsrEXR3W+BmIZJtvQ6BfBdlT+s9DucQcjHBNUl5iGDhisuMBnF7p4zBD1gsShY
	 ARArtN7IymNCAyRHPwgKoEJzM/Np+/3B4OiJbaH+opOywdmf0Fzqn2YirPZzeIVTfbWBw
	 IsBI5prabJFu9x5sJjIr3V9/8/muxoAGDQfL+XxRfen5yfTiLVuZAc0SrMPtF0iVLpB/g
	 ZO3ovculX/Oq3K4hahjTnMe7Vq8XxgiKHOgVt2bKDj+EwhQwrWZGRpYptNs8Zjm36gJ2V
	 potorZdLcS9vMUbnFPJRDfwzPUqzKlEkfD79U4zprK/qzNwfwAw1HVNni2UPhDwURVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mK26aFJL;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52DC606A6F6
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 20:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52DC606A6F6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mK26aFJL
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1626883eec.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 12:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795204856; x=1795809656; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6MACD1sBfgK5beVMe+EiTqIGqdXAEDg9pQGTzuk0wA=;
        b=mK26aFJLoegCcsiMXU1VSpQ3Ihal3KtmHGf/0/nB1oBG/zY8LUolK1kVpQpNcIwPwu
         SpNjCw0lmq2Zu4SdMHcFIRBWYb1c5qRVIqCB38JPu+afQXYOMO5jtiWuamihZHdSnSbv
         5UvWwf/BynireZBE0mlLnCFkTMxqW9pQa8Q1vUa0pqf8owpSRkoKMrlxhr4PUWgYjVq6
         +L0u5CUOdvV0yh4GC9+9OObLLTtst9iurMP5fRc7TCA5Ouz2s6BwysfCDdfH4FltseLx
         NaW7bgFI4hbylhlk1bndVWEqwh7QsAdvyvAcXpR/0DQQG+GDNDB9V9MbpIDFwiNc2WZo
         bGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204856; x=1795809656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6MACD1sBfgK5beVMe+EiTqIGqdXAEDg9pQGTzuk0wA=;
        b=mlHiN1sAQhcTTlPvXQplKWr1qs1V9yrJX1ywOJYMqBiMMm6m20T1MHSuVEmyVNpXgr
         g2qWDz2sbC9rremAkJY0xTdTU7NAttqK2ZpoW0Pi6HfaA9soHM8Kukf5zm4ZdRSGpUBz
         zo58xdQWAi3GtCMpvqJNbM2j3AktlmV4Ga9UvKMyL2NzLmb8yew2MKcv4q+YztRogJXC
         4JNbjwozH0xxdiwEnd8SAnP/lUIA4QhnX46K0o1cI8/MAiNh4v8Pj3nreOH8LfdT5P9w
         +RogIHHUsx3xyMUO2YuEiYxOkIfS8+1EYWcFkZSBOVzRyCMKJ/U/5IrRP54kMcM7yMX9
         D30g==
X-Forwarded-Encrypted: i=1; AL+hErFF3CJz5jVUApMHx1Y9reLD8bjiDOhk9PfZpMVN3SRHwbcvQiVCsCamPBAa6Gbiw1UY/76C@lists.linux.dev
X-Gm-Message-State: APuU4Z+KyvKFQeNIHcVF1hDcUAYFwGdaF+63marlgKxg6Cm9AnBKbWiB
	/d5k0WCbOMvIIINGEpJU/RIs6UPYmy30CGmF6VUhrhVXd6r0x2x1BlMmGN1QYpn+19EZHIIn2gF
	y0A==
X-Received: from dycc14.prod.google.com ([2002:a05:693c:60ce:b0:380:e54c:744c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:880d:10b0:36b:fca0:80b3
 with SMTP id 5a478bee46e88-3856fd5d0f0mr4234213eec.22.1795204855427; Fri, 20
 Nov 2026 12:00:55 -0800 (PST)
Date: Fri, 20 Nov 2026 20:00:47 +0000
In-Reply-To: <sashiko-outbox-225939@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <sashiko-outbox-225939@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120200047.2917735-1-elkin@google.com>
Subject: Re: [PATCH] serial: 8250_exar: check IS_ERR() on __xr17v35x_register_gpio()
From: Elkin Cruz <elkin@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, llvm@lists.linux.dev, irogers@google.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 07:40:04PM +0000, sashiko-bot@kernel.org wrote:

Please ignore this patch.

> The error-pointer dereference in xr17v35x_unregister_gpio() mentioned in
> the commit message was already fixed by 0353b5196588 ("serial: 8250_exar:
> check priv->gpio properly"), which checks !IS_ERR_OR_NULL(priv->gpio).
>
> Previously, GPIO platform-device registration failure was non-fatal so the
> card's UART ports would still be registered.  Propagating PTR_ERR(pdev) from
> xr17v35x_register_gpio() and iot2040_register_gpio() causes
> pci_xr17v35x_setup() to fail on port 0, which breaks out of the port setup
> loop in exar_pci_probe() at i == 0 and leaves the card with zero UART ports
> registered while exar_pci_probe() still returns 0:

Sashiko is right here - 0353b5196588 already fixed the unbind bug in
xr17v35x_unregister_gpio(), and returning an error from
register_gpio() would abort UART port setup in exar_pci_probe().

Thanks,
Elkin
