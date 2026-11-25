Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567232;
	b=1ektr1b/ReDSjgGN19rkLyiraXeWTULEz5uCLwvXGxbmGY1DJuK9gsMVMUH6Mam6DSlw
	 2UACkO4VuWkbGgbqysB8FAr+w6hnYqK2xelEKT4h6CPnRpT7IO4vss/PLxGo35nzyggud
	 3WyqAG7lvVb9hwmfJkB0HxEOQbUg8cHoUQq2KnLgwTjYxxx9KKkhJcmOf3Jwop0esNZBI
	 6I9SDuycF8BcSszBJ3PQRWiocUGW949q4p+RdHJmPRQQBce59NJJEYsotgNqhiEnpyvN/
	 PHWyNBvETwX4CDsuLGoWTS14gWjEzRk3vNiK8kPo4dM8h2sG8VCHq5mKmKVSFMNRfTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
	b=np6muUD+9DiL+qVqpfHdSHDWfDzgbhKIK5WRy4gDHHuNed/BvCkhPtVlwTrJbqW3N5pX
	 k012PXJKxDDrnR6kMtWdpcWn/Kh8O/XNvLVZ4sVhQvJ5B0RN9MQU6Q2KTXJmHGTR4OLHG
	 nA6wVhq0ypJN623xDFnL4CDvRdLuIFXDc3cvNENmZRL9BJTRYNmis637xqQqXMZ5HBqIE
	 Q3xkxs8zZCC4gRL5eYmD5Zpo4uzBEgUzQh1H9kW2mbc10eRVMNX5LVmSEXnCS7gLykVeM
	 UKVQOp4uUDivEn9XyfAGa25LoRNM3FmfZtOIHgcTdMEb1tSr+9jHjGrZiefkR9B+e2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FIB5l0t3;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22008606A689
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 00:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22008606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FIB5l0t3
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b587ffea77so183654c88.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567231; x=1796172031; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
        b=FIB5l0t3yXLjy/GCj2oNb+ZqTW4pqiEfQTQ9bG13Jajqqo8RR9ZW7rVfl12p8dpjVi
         gzW5vgOXV82clFwzENMK+BcqDP249fD5jyfEdhScDSJSBzQIYpsI5k1ktloiEel/1iCk
         oZCfKgTlSuf3RTuNlmQ6u9RFcc671PbvOK6/7iPdk4QdwRTPxJmBAtWIT2zGcCLKD6B6
         wV+7cnWmUhqQNQmkKKEoGjKftU+ll/XEdUfquPWYNmnsMpJF9YTl7VcadyW84qL67tRj
         FzJ9LYO44HriWoTQ1LwKXOxGHyfdTCG7R1KS2IPqVyRPscLGDbHKsymliICgMwv3INqs
         mS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567231; x=1796172031;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
        b=1oZHf7WBIwuycnFk+/PIJeNto2ehAQMY6Q0e0VG/KibuzNeSSqreNZWIUeo2Y4Mogp
         d71dlM8aNWAbcw89gztfYaxSw5Cp+/Sc6/3i9Est/QVol9GaVf8dgbUXa+p7Vx41PBjs
         8/Kuia06l2bSpOgiieqDd0HHsSuU+S2dxyD/0UK56VVOCvvbI/pop5jXlnXD88j3HkWz
         DoMc6UPWjeKfxrMFtFT5DQhBmp7SrevQpSnj5VkTpqa6/p4iQi9QpTLHIJwqBh3Cnva/
         oGqKh6VjnxETaJgIOmJjJN5L2KLxswEvpxmAage+QX49aQyJuFjdvYdjgn2gHczFaSWS
         sbvA==
X-Forwarded-Encrypted: i=1; AL+hErFVJcKVP/UNWcvbW3bspQ0Sw+MVYjA4v5Vzc4+7M6IKAOxyK7suPLFBsgj6tQTp1DFgh69b@lists.linux.dev
X-Gm-Message-State: APuU4Z9b+09du2pjfNix20B2ctuSDRmUVN5ReZnDrITJpZ0gGf8nZ6I8
	6AltyIiMErTRAWngBUY3bHk/Tg0Y6GUwiTv2NNqvxYC1kPWVj/IWmhhVAamxLUA221dTH6PMdQ1
	jcic6bSRcng==
X-Received: from dldz13-n2.prod.google.com ([2002:a05:701b:418d:20b0:15d:6b8d:2adc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:906:b0:1a4:c892:b14f
 with SMTP id a92af1059eb24-1b556904c50mr21237934c88.29.1795567230804; Tue, 24
 Nov 2026 16:40:30 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:29 -0800
In-Reply-To: <179545553181.3135.4354699424439095142@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119170550.1517634-1-irogers@google.com> <179545553181.3135.4354699424439095142@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004029.1004901-1-irogers@google.com>
Subject: Re: [PATCH net] octeontx2-af: Fix uninitialized variables and bounds
 in MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: sgoutham@marvell.com, rkannoth@marvell.com, gakula@marvell.com, 
	sbhatta@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	elkin@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 9:38 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Low]
> Can the response array overflow described here actually happen today?
[...]
> [Severity: Medium]
> Does the requester actually see these rejections as errors?
>
> This default case and the new rsrc_cnt > ARRAY_SIZE() checks both jump to
> the exit label, which always returns 0:

Good catch on both counts - 'exit:' in rvu_mbox_handler_mcs_alloc_resources()
returns 0 (leaving hdr.rc == 0), and rvu_alloc_rsrc() already bounds
allocated IDs to rsrc->max <= 128 before writing into rsp->*_ids[].

I'll send a v2 that unlocks rvu->rsrc_lock and returns -EINVAL directly
for unrecognized rsrc_type (and rule_type) and drops the unnecessary
ARRAY_SIZE() checks so partial allocations are unchanged.

Thanks,
Ian

pw-bot: cr
