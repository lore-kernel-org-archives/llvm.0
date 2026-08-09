Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A2D230BD5
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 01:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786239904; cv=none; b=Vr/fWsYsJBDCeqnLdt0TNpn6dbUDUTKVuaqATCS6LR/EUS3jIjeDNJQADXPAfYvDhz/FMAq3zw2nYR2FI84choqdeybHbqINfXvx/dh0GgyNpe2BIwPUY1q7dhu4o4f/HfPIdfOHu6tlxSfQBwYhVI16SNzhhwVz7by+RhNiDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786239904; c=relaxed/simple;
	bh=rZRfFdKn5ZeDJ2welL+LeLeoqqxzO8nk63PZPlAWJ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMf7hUukhP9UOHsRbvEycFjr+eOLWkkuGjCdV3x61OYQKn9Ur/TsO0cVl0128XXtLhbdU9xz/+BgbvSKiz473vIMVohDvVIp7ndAUZKQ71C/j0IoGxCbNPy9AlK+Ay9NBK/JNoyd6t7JWnT6sqrM+24Bvd7JSCV34Fn3hi3w4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYTPMmhH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYTPMmhH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20363107f4so72444566b.2
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 18:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786239901; x=1786844701; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3u5rsUSFhTfhPe8GhsmZTZBY8QySwMvot5AxopxwNk=;
        b=TYTPMmhH2I7dQhbO0WrhJV0+DIBCN2D4pthnbl/7gF5j3yGRsbWuoMkw9OD6qiQYke
         jJhPoyRDiAKusFmn+yPKgr2PnMarCQMha26F0t/8YrLG39M1dvUvNq0lCsuTvKmz7Tqb
         6lOPEcuZ1NIAic3nGGKdAcg09kbsTHe9CxnGVYvztZHj+qwN4Diq7sJ1kv3r59J9x+ly
         xVSNZu8AIZQwGw5ZU8FyBtHqb2JtjDjCPv7ORSctMrdLJO8UHLZgkMO5rTMivf4FzIVH
         T4dNuYTbCTYKi6FxO3+fKQ/oCc4gsHmoOtglbj3hrNThVe6eXA3DjXYp+Ht8QAMT757J
         YObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786239901; x=1786844701;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I3u5rsUSFhTfhPe8GhsmZTZBY8QySwMvot5AxopxwNk=;
        b=IIx/exHBVXc6ePNYWWlLPP4eeL5VHe7WrTIZkqkAze6c1jBl7XxOYORkHeTS3xUxfM
         crpBeM9RudP2gMhlojvbEeF2s13oHlFngcycV+0Qs78dOw75zfocSUbaiiCFH1zdsFrj
         E8mxEO68jEfcejRNjVvipd63iwzgSYlWvLiTxnkABU3DYieYwvcrq+RV8lF+Gj24EWRs
         EzpgomI2BZYHYRQzW4RF1+8DJKWvSGoOTgoJod0RmTA1ALsTvpBC1iBF1Tyt9MD3R2yy
         ap9SLQxWjRTw9UpKmik9/5oF0Yv//xrg+VdjXxsaH5OIQEFyOvV8WmK81dgp/eXdn4qF
         qGiw==
X-Forwarded-Encrypted: i=1; AHgh+RpACOAGurXR9NyTj1S5p2z1RwRtdM51zCzB51Hr1kbWAIsIjOrnsGkyWI7tO9p/EgLn3h1M@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz4+5ZTx97cM7rKQFOZmr2pl0P1xPvL/+tfKLuzo6f2GflmKj0
	Sf1LYFX/JkZUPvEQWULVymB84vQLF4uXD6bpssobcPNZ732xPgNKj2Kp
X-Gm-Gg: AR+sD11ypFZrJPVFAOYvjD3w5tr/H5PI8LMy/OSpn2txpuglzUlYpndfIZDPGqQJNSf
	BnrjJ+KPOK5jLKcxVOBK+wSNhrN+VsCe3gWhY1RrznWvrOROvQGGqprhirm3fQo7AGm7zl103jG
	PugDWehwhau4H1TABrhVqAjLKkjggVlsqcURhSvngGWlEB6w2g4kTg/BR0S44xUfFtgIUReublB
	L7mjq1Xu1RUxCM4AEkv9FF8ao7c/gMUcoUBUGYPBOlAePsZWjsVwvs6noo4JcaxjKlEUyz8VhHB
	gIqIaFLKPXpCvkOy7KmnSD3Q8IKBmboNBE8+4js7vHqqObuxXT9w/eDrOfAQ8qt58UTv9qSCbcY
	4wipZJbc9qeczrJTIbzXWTp9xzN38IkymCgrI5mYYfeAfGD77XSAMPk+zBuaC/bw219jBsd+0mb
	WFnZ2wHJsl0lBGSKHB52wjtEI3PjJwMUuhnKcD3p2HNlW6pl4w8GbZefNY9/w=
X-Received: by 2002:a17:907:3e10:b0:c15:ca27:5818 with SMTP id a640c23a62f3a-c2039f6e7f8mr1627969866b.28.1786239900597;
        Sat, 08 Aug 2026 18:45:00 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a743ffsm207864166b.23.2026.08.08.18.44.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Aug 2026 18:44:59 -0700 (PDT)
Date: Sun, 9 Aug 2026 01:44:58 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] lib/interval_tree: fix allocation warning messages
Message-ID: <20260809014458.b4bqt2t6sx5s4rrl@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260808123608.73613-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808123608.73613-1-kmehltretter@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sat, Aug 08, 2026 at 02:36:08PM +0200, Karl Mehltretter wrote:
>WARN_ON_ONCE() takes a condition, not a message. The string literals
>are always true, so the warnings still trigger but the messages are
>never printed.
>
>Use WARN_ONCE(1, ...) instead to print the messages and keep the
>once-only behavior.
>
>Found with a Coccinelle script. Clang's -Wstring-conversion also flags
>such calls but is not enabled in kernel builds.
>
>Fixes: 82114e45131f ("lib/interval_tree: add test case for interval_tree_iter_xxx() helpers")
>Assisted-by: Claude:claude-fable-5 coccinelle
>Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Oops, thanks for fixing it.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> lib/interval_tree_test.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
>index eba2d3e28980..b0b07270ce7c 100644
>--- a/lib/interval_tree_test.c
>+++ b/lib/interval_tree_test.c
>@@ -140,13 +140,13 @@ static int intersection_range_check(void)
> 
> 	intxn1 = bitmap_alloc(nnodes, GFP_KERNEL);
> 	if (!intxn1) {
>-		WARN_ON_ONCE("Failed to allocate intxn1\n");
>+		WARN_ONCE(1, "Failed to allocate intxn1\n");
> 		return -ENOMEM;
> 	}
> 
> 	intxn2 = bitmap_alloc(nnodes, GFP_KERNEL);
> 	if (!intxn2) {
>-		WARN_ON_ONCE("Failed to allocate intxn2\n");
>+		WARN_ONCE(1, "Failed to allocate intxn2\n");
> 		bitmap_free(intxn1);
> 		return -ENOMEM;
> 	}
>-- 
>2.39.5 (Apple Git-154)

-- 
Wei Yang
Help you, Help me
