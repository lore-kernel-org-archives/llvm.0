Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567230;
	b=dxiHcce2C7N18GxAC/1sLO82yP9DuksQj7s269euQ3Lk6UlmqBMEGjvYCTDoTE5rZFHG
	 p24ro7A6H/rPk0oodi3TEK04CR9hfRD6+weo/QZSG7bWcfBAbWHdeE2AGLlXpUCMDUR/0
	 caMzv0I1caEn2HMI/9AJ8joSDNqrBuegOVL2kLrWme3bQS4YJsBsGc36SgAZX9A6ZXEvO
	 XzZEB289VwLLlSI8aVZ0/bn7b14Yx6Df4dFEBSftNP2DRTYsvZ5UjuKzKrnfeGqk7rMzO
	 c2COg61ZX2KfcSjZRuQehzz0PgWPfC3W5Vr9xMYS9m9pYiCgiQycRhLiPW/bAha9d1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
	b=WbjljaLuZzPDAimE05yKXfI8/EQ9kBMjy1vFzMd2bE1sFLpKIOdyQiuhS43/OolD+Bij
	 DaHtm6vjIYlBeWivtFLPCSzEeAFVDfkEOWJaZKalqY2fE1ALtUMnPRgphoHc0zgyZ5J1C
	 z7ovjO12BCc75CUJH6q7RBlfTCvpLRaedXmihNKczXyPLFXJvo5sWRX3GCsGfrfxVUD8e
	 kDzQWnSz/HS86clJ2uMJBVGJBgASuFGeTE24XKGdFTFChmU3KzXpSYVrq3cm20N8eTpxh
	 58aJ2V74hzy+dySGzTUzqXqkRgjyI1j7YkU2bx6G4ew/h1oKi9hpDUtzsrLdWDgpKpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0HDge6e;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DD606A339
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 00:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75DD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0HDge6e
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so6683485c88.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567229; x=1796172029; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
        b=b0HDge6eY8CXVFndgJKC5sSxxtuLuqspouy/FxwKqeXFrP5WYkID9iAxlm/ThqhpzL
         kov9gS1CTBfju8SqCSh6mjIocuLexYekdOUbp5soPlwSK9OWkA4YR/Xv05qq9/YLoRxw
         9JSg3aSuUocQGnvY8YwD6RdQ7RgEicRBruVRMrC48v1ByEF97/W5ZtOJtfQHiZ0Ii6tD
         fAo/f6fZrNUONOKUL+S/H9dRhq9z4y0AeiPd4Tt8/n9wX9n7QucJc8wSYoGr3wrsGMiK
         JeSMfSok60U0CddAlHv77az0D3TcRypiaakIzzYONhBpOvL8RhTw90rAioGdQZj64TRD
         T1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567229; x=1796172029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
        b=jIpWSs5Zyb5Ur0JXlK93tk6/NoGmxYcKMynldu4XiR+CgWzJ/eHH2lJReJRM8Vfd3P
         UDtGbgoYYnp0J597mJVwwf2Fznc9XDDss6qChf6wVTda3XBtdZiI8y4v9fMqAxi4wHmn
         mnl/ACYygvHVWROPNuOQKDSrqibysOYT/0MIpFm1Zseue+Ene1JGW8FkH9xzqSsFtLFR
         ZnH9TCj4v6YSmHcFf+11RrZDTFJdN8032VnnjlZafOSAdleNfLcmw4X9yPqbAGmSN3uN
         1LfLBQUwtAaiaWk5f/zr0ZYUX/beuTc64WY3+skBkxwDF/EiRdo3bNawRrhsCbqd+BIK
         TF2Q==
X-Forwarded-Encrypted: i=1; AL+hErFqyuUZyChAz3LOFHIDMOg/poyF5bduIJvxY1xaReQn2VJMj7DVxSLALQv34JYX4KfRm2I7@lists.linux.dev
X-Gm-Message-State: APuU4Z9JA8hXwDTEVGrz302HW1v/0Or88MLpdVsyL/IJkHGktXjnAWjo
	QGCPC9T7ThP+KYpTO2/aZkU/exEXy2X1ZHDS/ituiDH0HxCobnvx1GfT3wzbarZs1vy80sPwxtj
	FfmkrWLX76A==
X-Received: from dleb8-n1.prod.google.com ([2002:a05:701b:4248:10b0:1a4:c892:b166])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:1b2:6a01:f55e
 with SMTP id a92af1059eb24-1b56f39c712mr7629241c88.34.1795567228466; Tue, 24
 Nov 2026 16:40:28 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:27 -0800
In-Reply-To: <179545903032.3135.12672409534586940438@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119170623.1519909-1-irogers@google.com> <179545903032.3135.12672409534586940438@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004027.1004762-1-irogers@google.com>
Subject: Re: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 10:37 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> With this write in place, niu_init_hw() now unmasks all six TXC sources
> for the port:
>
> niu_init_hw()
>     niu_txc_set_imask(np, 0);
>
> Those sources are SF_CE, SF_UE, RO_CE, RO_UE, REORDER_ERR and PKTASM_DEAD.
> niu.h defines TXC_INT_STAT and its per-port bits, but nothing in niu.c
> reads, decodes or acknowledges that register.

Good catch. Because niu.c has no TXC_INT_STAT handler (unlike ZCP, which
masks all sources via ZCP_INT_MASK_ALL), unmasking TXC_INT_MASK = 0
would route even hardware-corrected ECC events (SF_CE / RO_CE) into
niu_device_error() -> -ENODEV and disable all interrupts on port 0.

Since I don't have Sun Neptune hardware to test TXC interrupt handling,
please drop this patch.

Thanks,
Ian

pw-bot: cr
