Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856235;
	b=oe+dY3p9BLGaeIRbu7AyV7RESe8oVyL9HW3z43nyP0PmC2gJEmVsyzCyUs95P8sss3WA
	 rPWbOTJTL2xCgUFMYjf6nHOreywNUYtG+LGJQ/Y43Iax5OYr36ApoKHBeIcvqZ0VfuSYq
	 F9PIDNCYUOvqFFyEBl/BVK2GElCQrXhHor1v20TELOZbt4xqPC3wEGuFtwCPiGYf2oLAd
	 7Je+jRthjF/Z/88pMxOeMrq1fYhZ61eYvg/EPbi08uBuoLgf6Tl1xQEAJbFEgk2HzR4UZ
	 dLYptErzS+Fll6Vc+1x1t1OtbD0DWElcK/djuzlvtmNfiTYW12XDACmp1T8fNccCbGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qsGE+zCIXfvkQmpr977qsb3iEFIBRg95jemFmU7wQ5Y=;
	b=gkKcgFsE7bKow5Kd5tv3bCCh4RkUPBidHGZxeOGsBAG7ua3a/lspyDIW0N3/rXCabBBv
	 VHgwGG8GrcVCTfB/IJnrmc7JswjbR22L/sx4r5pltRDwu/sAWWwHM8uNvBz1XPSeD4IYq
	 HBNbHsa9cMStS8PAMjh79izWqHwKKFKURXlfv1+76EKjalk/Rjz1TZCL9w5Lj5QV3SNWm
	 ahLsx3kC8z7uCxsaU1BPmOiAOo0ekfoJsdnNe+sjmTXPYwN7o2bDxcFw0xqKlk/xkAvc7
	 U6i3v0YjgyC5ahN5ym2LO+w+Je8cauVpxHyjiOqcWdjDHB5CFenDNrsp26crPUEwFSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mkrLKNqG;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92708606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 05:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92708606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mkrLKNqG
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so2554174c88.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 21:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793856229; x=1794461029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsGE+zCIXfvkQmpr977qsb3iEFIBRg95jemFmU7wQ5Y=;
        b=mkrLKNqGd/eT5DJqor+AD1wJa9KNeN90BoNP2Qr+8kc1L9Wwe84LQtDCD0UFt12jj3
         MHMXSCNweGX3fM9IyPUwiYQwz1mLmBaBZZt95DC6dSP0BP9AwZrS/lhUZ+M6n3J2HUEN
         JXPafylemxhTMQjT9J5al1q02Q8b9V33FgKuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856229; x=1794461029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsGE+zCIXfvkQmpr977qsb3iEFIBRg95jemFmU7wQ5Y=;
        b=aNGS8CCvdf22w0qU7EiWOIoaYHi8omDJkS36DeZU3IDoddQTslKnjNja2eOgtaRwXM
         1nIz5nL1MZYB/C3LO6vkTuSEburhEdtsSQ+UKHgrVeY5mMLG7rQ8m7v55Kg49kO3S4T9
         fgxQYEJBi7+QWFHH+uzlS5etaN+fZtTswVH616nxbq/Qg04Df1J18SPiSqxfWPO6PbKY
         tC0kf3UGAMVLNbvUV/420IC/GJz0TeUHmWz4vlY+zXwUxK9KJyOyw4NXY8C/Rn07YQ2Z
         /Qi4EHmFk6JV0fkrMkBvm69gqDCSCnyPkIKKCXBo7M9LeOGjNmlcQBV2UrPvDDpNfU8J
         MsIg==
X-Forwarded-Encrypted: i=1; AKwUvBzK/OSAForIQH2xXw2mUKk8UUxiiipwRv2FHeLdiz7lZSlPHeNfSzcHNoO+Du1csdx4OFrm@lists.linux.dev
X-Gm-Message-State: APuU4Z+uvikLfUGbllUAxD/m4eAqKeBiRNdH5LVvCtG+6RChYRUZI79I
	s4h+i5zrEtjAoZXvJ7Yi6zqPomB0ma6NkN/PgEHPZ8MbLCI1mr6Gtkt4ayRTAce/Ig==
X-Gm-Gg: AYBFou3kReZVWWd9HjWCyG+O5ALabNJB8X0bh81JE3ZEqKwE8/Oo4P6A290Hq6R8TLZ
	MknzgkHEzKR87kamV4K12uP73UiKw8ZIvDWbJlB6QAbwTQEuY/BbiJ3XG6lN9/j3SdOJzV/XUc/
	k53cShGqeByrZGHpiMa1o62QI0Q6K+PefHh8CBnH1bdGZ6FyR511zg1oLyXkG2yMw2pohHoc0Yq
	4cKE8/Ksgy86IaP/K0IW4pXhFIMnV9oPosOoXTDbF43a4UCpCPaO6c5GR0bEA7AMeTLho6DQNuS
	edJYlmUMaMvyCNGJhQJXfeL5n8sQ1Dp8lZYjcW0chX08rEdytZJlp94N8zalVe2FhRYnm2UyiwU
	uQefzak6fGLnoH2FTAiExuciMbWAPmXUiBnKJBVFiTHTv73imxE4hxR414vQ8nqGDICyNUGsV1Z
	2x1rwaLXO3/qy4JdFF65HBWqTo1j6L4LTVa1W8KnwCO1hquiPZwC6RZvjmXfjz1TgkSHk3yjpuU
	/efvwlITAt/nLJK9rx3ibZ8cdnXFNrQ4ExPglE15IJU65SCOTVIe7HnX1ihGbQUYspnhAfYRd8Y
	Um7fbhpMG4eISfyZ5UwBlJo3fqqVFp39MuTFl6kB1m1oXE6Gcux8Mq9I/h06B+RERLiR
X-Received: by 2002:a05:7022:fc03:b0:1b2:46ee:4cc1 with SMTP id a92af1059eb24-1b246ee5347mr4936175c88.43.1793856228364;
        Wed, 04 Nov 2026 21:23:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c463e9sm13218160c88.14.2026.11.04.21.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:23:47 -0800 (PST)
Date: Thu, 5 Nov 2026 14:23:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jenhao Chen <jenhaochen@google.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, liumartin@google.com, 
	benwei@google.com
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
Message-ID: <auwR7gnuLsF0lpmG@google.com>
References: <20261030121700.260975-1-jenhaochen@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030121700.260975-1-jenhaochen@google.com>

On (26/10/30 12:17), Jenhao Chen wrote:
> In zs_malloc(), the fast path (if (likely(zspage))) allocates from an
> existing zspage via obj_malloc(), while the slow path allocates a new
> zspage via alloc_zspage().
> 
> Because obj_malloc() has three call sites across zs_malloc() and
> migrate_zspage(), Clang at -O2 leaves obj_malloc() out-of-line, adding a
> function call on every fast-path allocation. Conversely, because the
> 362-instruction slow-path alloc_zspage() is static with a single caller,
> single-caller inlining under CONFIG_AUTOFDO_CLANG (e.g. with
> CONFIG_ZSMALLOC=m) inlines alloc_zspage() into zs_malloc(), growing it
> from 254 to 691 instructions.
> 
> Mark obj_malloc() and obj_free() __always_inline and mark alloc_zspage()
> noinline to keep the fast path inline and the slow-path page allocation
> out-of-line.

I suppose there is performance benefit?

I guess I don't mind in principle, one thing to note is that this conflicts
with [1].

[1] https://lore.kernel.org/linux-kernel/20261105044752.1997895-1-senozhatsky@chromium.org
