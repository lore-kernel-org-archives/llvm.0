Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875190;
	b=ztmt27y2ZsZpfG3SbSH89i0Oy/UDNgv93YwbJoeNfyVI/6EcxPhi+ERi2lA4KACQtufK
	 ByVEjoIXkKsuxBV6WaLVASUHBaIWW8eTOJhOHYXchTsGoHjjwNBUwhtPeNV1FLg5v/yoX
	 sIpCxCZgCvy7q/kjc27kcjg2UfpXVsFYUR2AIUNZs2ni6CY8eE2KMsx4DBO7XhQHssY47
	 j3prcdTCCO5IKpZzB0Xt3k2Kuyee9cLTWpKs/zPZxWkNLO3+r7iuQKoe1mYyZ852cHGF6
	 tbkr3phPVLXmLYlqhODwEI73pPNJWwtnoEFnm9MwJQBAYClU/AO9pOTujcfR9nx+4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uFIhQY+79JG5rknzOWA6767gSvTCQmC5gGZYO/Mt64s=;
	b=2oEBL8hgSaxRQmu3erIvk8PYqaEDRNb9/B+cRmKUgceQF1qS5fszSfYMtHD83Qf++FJa
	 /sYzKo7pvibRy3QhovOQL2knVeDbt/awfoq0iBQmHuky/OexjJFzPRq/s7M0Fq4ka3KiP
	 O2IemVvQoKKkfiRgwBVfQUnpUBTgCSNnBKnBYfMTiAg7E772oZ5i2xnSfMJV1RFVmKTUl
	 E5wFjFs6IrzFhdhy2F4kLZA+FXPQ/ppDk9hNbA+wTuTxX3HFYx99/Ghjogsjfgwdb3uoA
	 p79o5ixNwsbfAIhJF67+d9EtmYxlc52GlODlbP6LtCFKwD3MkKfc5IeLvuyR/cD1z+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="FWKEsQA/";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB5606A32F
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 10:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AB5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FWKEsQA/
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso17454845ad.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793875189; x=1794479989; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFIhQY+79JG5rknzOWA6767gSvTCQmC5gGZYO/Mt64s=;
        b=FWKEsQA/jhfd3B+C2dVsAXTpct2/eg5YnjPj+9HvrgJoatfI4R72ziQOGtbA9BErFE
         NUnkvWmMxC9lDrZgCiJZhWEnqf9d8aliIK1MnQw8NTphjQAZjNZPVkXNoFwsNIWfvPvX
         X3foToXqcAkVztMsmpLZx53s2OUd1GOwbEDS8sS+uKArphSwciXOQCU8M1yKQV5EdoD5
         EKzUgaRu5SACM+fWr2Q3LtgwtxrLIlIyImR3sTH/1Fp/dXLZzCNqu2/yBCjRBZK/EBSY
         g8IrQNQxyCnYA66LM4FEa5lr6EnC6IgzvBhF8iCeb98tj0D0OXQiZ6j1iQ0YBOhyjW41
         oQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875189; x=1794479989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFIhQY+79JG5rknzOWA6767gSvTCQmC5gGZYO/Mt64s=;
        b=mf2a/PlVPWdYxoyNIYprwrGnQ8qJbEzn0XSGcFnY23iK/DM5RN61GDXm1wLi7LaVUO
         UV3J0lkhU6jYH+DETvsbLIORFuD8ULDizENkFC3JokRpen+BAWLV0R4nDIm2xIEmA/4p
         zC0gwUgb+dUVVnWT+e8KnySZNRLHwtoqG+ctkQAdXhA7cAcQnD98nCu5TsQG0GoKdo8Y
         wjGV6Uxb+LRq33F7iPlUrtc4Z4aGnGnj1It2zzks3tyD57pGYllrGWXKihH26mvzdLOQ
         bQp5r6xPKqnS4X6SrJaOMPzTlbjt+SP9d+WgqH/SVupjSy1mYEnbrbM+zxsW1rD+CRpL
         ptQA==
X-Forwarded-Encrypted: i=1; AKwUvBw+lPD/yezr7ydJxqSPdr5XdPSvI9YDZ0fsyEKWBD6V2oUMhUaAHk1xLdjrpDqffeGC3g6L@lists.linux.dev
X-Gm-Message-State: APuU4Z8r0JKMZ0JsTvGbRKG/tl3WTcAxERe6HakGBSZyTOGcVVJvSKDI
	WxT1tBXetldSccRaq4A3fRGmBcH5678b+UP/tafxMhHFs3jkHQ3oo4Yslw6dTnYIAF1y2VeGXQn
	lj7YhRY79X7nSoFzOL03mBQ==
X-Received: from plao13.prod.google.com ([2002:a17:903:300d:b0:2ea:775d:de30])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ec3:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2eb364025a8mr173003765ad.5.1793875188940;
 Thu, 05 Nov 2026 02:39:48 -0800 (PST)
Date: Thu,  5 Nov 2026 10:39:47 +0000
In-Reply-To: <auwR7gnuLsF0lpmG@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261030121700.260975-1-jenhaochen@google.com> <auwR7gnuLsF0lpmG@google.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105103947.7521-1-jenhaochen@google.com>
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
From: Jenhao Chen <jenhaochen@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, 
	liumartin@google.com, benwei@google.com, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On (26/11/05 14:23), Sergey Senozhatsky wrote:
> I suppose there is performance benefit?
> 
> I guess I don't mind in principle, one thing to note is that this conflicts
> with [1].
> 
> [1] https://lore.kernel.org/linux-kernel/20261105044752.1997895-1-senozhatsky@chromium.org

Hi Sergey,

Yes -- in a steady-state microbenchmark of paired alloc+write and free
operations across 8 compressed object size classes (384..3136 B):

1. On current mm-new (zs_malloc + zs_obj_write + zs_free):
   - Clang 22 -O2: -7.7 (arm64) / -11.8 (x86_64) retired instructions
     per pair (-3.2% cycles on x86_64).
   - Clang 22 -O2 + CONFIG_AUTOFDO_CLANG: -13.0 (arm64) / -17.5 (x86_64)
     retired instructions per pair (-4.8% cycles on x86_64), while
     shrinking zs_malloc() from 2,872 B to 1,828 B on arm64 (-36%) and
     2,088 B to 1,474 B on x86_64 (-29%).
   - GCC 15 -O2 (x86_64, without AutoFDO): GCC leaves both obj_malloc()
     (306 B) and obj_free() (120 B) out-of-line while inlining the
     single-caller slow path alloc_zspage() into zs_malloc(); the patch
     saves -23.7 retired instructions per pair and shrinks zs_malloc()
     from 1,738 B to 1,441 B (-17%).

2. Rebased on top of [1] (zs_store + zs_free):
   In [PATCH 6/7], the new static obj_write() helper has two call sites
   in zs_store(), so both Clang 22 -O2 (360 B on arm64, 219 B on x86_64)
   and GCC 15 -O2 (obj_write.isra.0, 229 B on x86_64) leave obj_write()
   out-of-line as well. In the zs_store() fast path, obj_malloc() packs
   (m_zpdesc, obj, zspage->class) via location_to_obj(), and the
   out-of-line obj_write() immediately unpacks obj_to_location(),
   recomputes offset_in_page(class->size * obj_idx), and re-checks
   !ZsHugePage(zspage).

   If we also mark obj_write() __always_inline alongside obj_malloc()
   and obj_free() (with noinline on alloc_zspage()), the compiler CSEs
   those redundant operations across the fast path:
   - arm64 (Clang 22): -31.3 (-O2, -4.0%) / -34.7 (-O2 + AUTOFDO, -4.5%)
     retired instructions per zs_store() + zs_free() pair (vs. -8.4 for
     obj_malloc() alone), shrinking zs_store() under AUTOFDO from
     3,144 B to 2,448 B (-22%).
   - x86_64 (Clang 22): -26.6 (-O2) / -31.8 (-O2 + AUTOFDO) retired
     instructions per pair (~4.0-4.5% latency reduction).
   - x86_64 (GCC 15 -O2): -37.1 retired instructions (-5.1%) and -5.3%
     latency (-5.5% cycles) per pair, while keeping zs_store() slightly
     smaller (1,997 B -> 1,943 B).

Would you prefer that I send v2 rebased on top of [1] (including
__always_inline on obj_write()), or send v2 against current mm-new
first?

Thanks,
Jenhao
