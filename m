Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018059;
	b=oQs2VzwYPl4ji4Iec8PivH5L9VKW8Qf1HyRdLQCgIxlvK0QUWHobVXs8B/Gb5FY7GcfR
	 jcAEx8vUiBbZyY6qTvULxmH/tP2zcX+r0vTzdgxHcCIJs1DnpTLGFLKI/X6TEHCk9Yeb4
	 P1WIYlgqRVtj6zZVtsl/4qfWoosn8euBLfxXVSAflu+mv2m7DO8Jfm8L8lg6GloDmvsDI
	 kQwuEUOyAWKXe1Ez2SVKmpdkmFo7SspA4l6/cheDraSQmfQ1guVHAXew0g+Fqx47j86Ke
	 /+KnhCQqjBiZ8JGfeweuPU8X9LCVQFmxGyVAUb+QQ2g/1wQAStEb4o12m7j5CTg6U6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=CV7oamrSYXfpp3NnleoEpP5E6f5lbD9kU3nbbqKEnc8=;
	b=WqML0/IY12ELo+Tf9LyAx7MY7pDD93hPGP4x7iRBmln2CSQrTakJDBj85hWGyQDRblgn
	 QyRyk9mrluP/wyxGKDdhzSL26K+I9/PTa9RsC46edyqOPsCFmP6OVG38/QHq1d06vPy6l
	 32K3jvMAq+NCoKZOSHAYgG73YcYj18gfTcTC2EoiTdPx+LhZbvOqkcRLjjRunAoiYUTxU
	 BVYzVN2z0sEX0n6SR96v29bpBxNa33aTxvvDuv7lJZsDEPxPi/TKI/CzUPA8BE0ujBpUw
	 224P0VCVgKJban8Al8fHeXuRxbioeDQwDWZE+/k/2RInPjxN8vKSL2d45aemZPz/iJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=frso8ZDI;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DB606A31C
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 16:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=frso8ZDI
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49429181ce9so771193fac.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018057; x=1795622857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV7oamrSYXfpp3NnleoEpP5E6f5lbD9kU3nbbqKEnc8=;
        b=frso8ZDIPM0fVorlI0ZNzCcRzovcseE6Jq9VQ+hhT5waDb7rCVo/Re3uBFac2xoB3Z
         M0Rjrhgcfy10tM602AiKYwoKZf/6kmqgT5zN6MgFKa857+VsU7NXDwoFYpwOQmnwSJOQ
         tnJjqZrLDTi3SC/7gqLLmak7up/eqL6Al3ES+Ujd/LJ0Azn+FpL6hqIqkCclG+3C3sr9
         51ZQikHmGW+uYpDFwWJL0ceC0zrjC6h6DM8CHaUbamdQ8frnlxse+l1Oa5b8V1p2CVdv
         hboQhLym7prL7jDVMcAYlFvpt/NhXZxhIrlcsbzoSYvXib5GEnBa3bL2NNBQlB1yWKZN
         PUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018057; x=1795622857;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV7oamrSYXfpp3NnleoEpP5E6f5lbD9kU3nbbqKEnc8=;
        b=n1X4eUtvJX3Sd7CjIktPqJ8ggkSS4+ng6que2Vk3lfC+M/FdDcCre9JWpe9Pal2I71
         Q5ZE4mUL5xr9RcRueQiKLhsH7oZ+Zx+kieDdRmKO36nZsGqJCDE+twd5PeM841VILoQ2
         xEYmFkhkhsAWQZPQ77/66ZvJsu/sVyVP7UmOC1UT8uuEf22dgOHnU9T2Of9TNyyGfgbf
         UhSs5MsId2X9u7zL26uBTd2zkYqdIQaVoytcJsuF9Lh+9bLJ0mh/T3ylVO1g+UXZ7+1x
         Q2ZbM6XRTDFPtRkU4wOMZJLFnPXqprmJDECyCPbo+nJIPY3nsm/KZV0FrJ4owtQhMdUM
         uVuA==
X-Forwarded-Encrypted: i=1; AL+hErF5niFLYYhHNUmWnSiQzpUqCmP3mIQLSV52gfMkF2k4HnOyypPmrrMIcr2NtCq9SWFCIGM6@lists.linux.dev
X-Gm-Message-State: APuU4Z/aomjFuHs3wqOafMmJ0HBYa7V62qLMYTM4QnP6gRHqqm4PQj2X
	6ZApxK+9RvwtNqbMgwA2lqsEGCsP5EtQzRPDWiWv+njfHIyBWMNnhFaGsT6j++4smMM=
X-Gm-Gg: AYBFou381MFQs9o0+ut03cxsxHHppa/cwnS/sO5gpFPqSPWmIKnIGonlaRv9ALSampo
	Ek+72gILXmAUr0ph1pmgsOyLcyzfvyGhRLiEtaIQALn4vWOHsk8wKIjYodeWl5XjnLQxTdtgfiz
	5crwzfP/3zfoatN+s6lUAeJTN5W94JJc0aRjOOvX8afn2grb/EC1oqwpvZ02/xMZJxuu5KIOhCy
	5Jdqq4hkdK6S3PnaHlpJgtQnPLuHk5rdJEu3D39l1oiTRwaHRJvhiobKX9qws/E1ADIjTQPQmhk
	ul4waXTsm7BgVWTP2zx8aJ9qibN9L9IlM6VkQW3dIMja0MFIKFAn7G0GwRK4HKk4lcw2Tw62nsJ
	ChbSRW2FsjJyggMqSlIHiYxqfcMfm0BR/W6KPqLA+TVnZQGKTD7fshcyv4O9zarE0j2OgPB64Z1
	r8xNZkepqPcs+rRlGggE0MaWNLv82ODcoTHcjZL8gFm+rhsw7Rs0nH5VyPV6dU1vs184mGT0KqB
	/BtV5pSWtGyndM7GtG12pCty31mbWWzyxqtR4dZXWw7ujMdhRy8LLKV+hijkeXgQamEgusqGF38
	nIVCOgELXm4d1/zygi80jBrS4gulgRcy01P5OZnumHpA8Rs9c7r95AK97tKuuTcdyBrqjFB5eAF
	aRRZdjJ6RQ79vWKGfKU4B2E7EPOIpYb5watLVSNwo7Ns3D07HmFM=
X-Received: by 2002:a05:6870:d285:b0:4ad:5a7a:f7e9 with SMTP id 586e51a60fabf-4b7613c52femr2613744fac.34.1795018057354;
        Wed, 18 Nov 2026 08:07:37 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20261115-blk-throttle-wunsequenced-v2-1-1d297c891b82@kernel.org>
References: <20261115-blk-throttle-wunsequenced-v2-1-1d297c891b82@kernel.org>
Subject: Re: [PATCH v2] blk-throttle: Avoid unsequenced accesses to jiffies
 in throtl_schedule_pending_timer()
Message-Id: <179501805630.17649.245726738544852847.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:36 -0700
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 15 Nov 2026 20:37:57 -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], two instances appear in
> throtl_schedule_pending_timer(), which can break the build with
> CONFIG_WERROR=y / W=e:
> 
>   block/blk-throttle.c:469:25: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     469 |                    expires - jiffies, jiffies);
>         |                              ~~~~~~~  ^
>   block/blk-throttle.c:469:25: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     469 |                    expires - jiffies, jiffies);
>         |                              ~~~~~~~  ^
> 
> [...]

Applied, thanks!

[1/1] blk-throttle: Avoid unsequenced accesses to jiffies in throtl_schedule_pending_timer()
      commit: ae1171f38098098e88c13c38e462d27babb50038

Best regards,
-- 
Jens Axboe



