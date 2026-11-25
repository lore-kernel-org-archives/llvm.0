Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567234;
	b=T9jAa/SN2ZsweAS846NaQ7Sf+jW9ygHe1ZgsoatMPjP7kEcSg1fXwUCYQ13yL/aDofGR
	 KS7N1ufeQGWs/Vqr3Txn+W26xE+3SWovuhX5T5az1zOUXHYO7fJOk1cuCEHHH1BpWyMMX
	 kodKOn/CbahgAd0dV90MRBXDNW0KVf6O6sLQzZPYNUyrUpuddENOodJ1BM/sDxYuRuU0u
	 Nio4fpgYQHvsGyqfJlMrlTQgQZY3zHdyYbrzZ/3+6f3uT8Qgfig34IuEV76X6n91ap5uy
	 +SuO8i6GU+2/GJsQJoaioHEeLke86mg+NT8m6CUIL0CrD60L4agCAKHTpIWb5j6YGJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
	b=IiiVwWwXkLeQnJVME3AMBg/NFfAMup0wxhZZpYgQoYRT92kmOw49BulHwcDEN3RZxVqI
	 iZpfyz4BSi7s1qW42Nc1FyHX2RtW2MP95qb+quHR7ex2ut9fTQEL9U4G57pLnl/gsaF9s
	 HIoIbjS5S+Z/0HHE+HaNUpXjOyDVRXC6ZiudPfFlnrZxFKKz2WmQy8SzjVRfcMpiKeB6G
	 MvhrFimX4eUyk2KOJAOPLOAOm8PTuJom/Oz5uVYTN5Tkr/FXHUBcIYQfBI7aBRK6rOZIX
	 jKo+jNKcmgYDTnz6P5ONqFFs3AmQp30y92ZtLdAmRV0feZOQOD3xUcIcHd7NAwCuZlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IyyaxiOM;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3D1606A68B
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 00:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3D1606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IyyaxiOM
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so8079907eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567233; x=1796172033; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
        b=IyyaxiOMHOmHli9uYTCYLeec/56xvYNoAMRwP5IOsdB4Bd5GqSZWggs+rD86jeygey
         bfpufn5hMGhbK8SbDpLJ8jSb7HIt7sNDQ3V+D27bpQcaR9/jbx664dxDxalkkVspdLNV
         CzGsa1/0y6JMPg5w0L0lcSbv870oxp6L1nDLjLW2NwgoHJJaP29YDuPofDkbYhuY6fJk
         rJLIJnAkDVnGHDdUmimMU19uhuv7CR8tfijom2e7Nmq5ERyTuGU6EpOP2RAL/jHxHLQ3
         qHU33A5sZSwHsxbYK2X/oangVaD59TuvW2se42SyWzd72VtioSAf1ZN1I/8eo+YbBI0+
         dfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567233; x=1796172033;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
        b=H5RPHrJiiDYVVO8OabRO/W7gPgisXkGgC7c56ebTYQwgeRZBS/UUTooL6Rxt0H4P9B
         IaUPUrd7sF2jKZnDlkspXPpzK0QSGjzz07lubsfDn6SP1QtQZ9/urBqnx5jDhkPwz7FA
         iOBweiiGfsNzzHFvKuZZYMp4tOU8DQZQZmTAPPqKElbQOiRfFRwDS9bhJ5cruXt7qb4l
         NF8kPiB+tCHDqYM3Glhbav4dZZ3ZM1n5GgfHVJHEVjg6H23aik7QbTfjWbgUPDJI4uNO
         xqv6FOiJosbj/8O12MGcUk9JALzfUMk7lmemLMoDVBQS2cEeizdgUoSHEvp7ZIndpj0k
         BHyA==
X-Forwarded-Encrypted: i=1; AL+hErHqQ0FqIobAT7KkoDjI6+eFMjc0EDU2Re0qv+ocWa7P00PVCCLU+48lDYtEwMZO93ro8fNw@lists.linux.dev
X-Gm-Message-State: APuU4Z9vDmSNAtcVFrnyzMejdmwKPILDKYXZL0fTnOtVeDWOd5GMmnWJ
	CiVTN2kXT6oCaAA605kL5vuyP8r2HQQEVfExOknD4avEKBTneAPvHrRSij1CW7vk6sw9mQHi32+
	AwRp4X1DQ4Q==
X-Received: from dyvs10.prod.google.com ([2002:a05:693c:42ca:b0:385:6c3c:3ea1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d205:b0:36a:1f8:a56e
 with SMTP id 5a478bee46e88-3856fe564a1mr16387145eec.23.1795567232754; Tue, 24
 Nov 2026 16:40:32 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:31 -0800
In-Reply-To: <179545939880.3135.6341792822211409455@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119170729.1524516-1-irogers@google.com> <179545939880.3135.6341792822211409455@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004031.1005034-1-irogers@google.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: horatiu.vultur@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	elkin@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 10:43 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> Will this tx_dropped increment ever reach userspace? lan966x sets
> .ndo_get_stats64 = lan966x_stats_get. dev_get_stats() adds only
> dev->core_stats on top of what that callback returns, so legacy
> dev->stats is never reported.

Good point - dev_core_stats_tx_dropped_inc(dev) is needed so
dev_get_stats() reports the software drop alongside lan966x_stats_get(),
and it avoids an unlocked increment on dev->stats.tx_dropped as well.

Daniel, let me know if you'd like me to send a v2 with
dev_core_stats_tx_dropped_inc(dev) (and netdev_tx_t return types for
lan966x_port_ifh_xmit() / fdma_xmit) standalone, or if you prefer to
fold it into your upcoming lan966x PTP TX series.

Thanks,
Ian
