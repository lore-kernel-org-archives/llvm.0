Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362644;
	b=aTkGxWfsSLCb5flTB5m2KLa66cEmTNsQ5q5vN6GfTTi047ZQQ4hdcLRdcKe6KkPEvrJT
	 3gnxK5+Fj3y+S22oY7SIh4WHerwrjsZfk+x60O5ES5+ju3UoLExK+dmQGFmMjaW7jL71T
	 a/orJZz10LkDncqiV7hzEk9r7Eifs6RBtVX3rJXPDZmM5xWhPKOcsFGl9xiTl8xVuiBnL
	 sCux5m6YyzxINatrvQ34DUZRxkUaIBbbJbUI926aZSDRkVOzQ//xV4peEnCrEiVOYOLmt
	 +M0pqbCo9ptTNSyWsh4zaiyTMaKiojrI8qBy+fsbTxYjS4JHe+3B2DktZoh0qGw1eOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HpxrkdHX+pHoxS8QiLrmBd8NFzaZIUXGXtbQN2oLq54=;
	b=uyndSUgKmr37vuCL0DeYEbKoYlvcJLYHHIBky2PiTgQGYYe2pY02Dq0ab0myjmbU4pTg
	 4+hkOBMXlavW4RU1kPGPYnqE1CFm99+I9nTaobBBDIUVssLDml8zYsTBSXRAZoRUYNUCC
	 D0mVZ22k1yDqcJ51hL1OjU0TX+cfgQWVjcCn3S2qvMp1mJETtOtyg0pFOS61CLGTyYbVR
	 9T5006dZss3M+GdD4IljP0LzLWRr7T85aa3CEcsQGg+U4S73w/YkqNfbzMNzqh7orAemd
	 6HyNTz7L/dM9Hz1hUCY9vAoDzmiABGsJYoWBfiYkIsLcO/PnP0TAiswyZMy2UhjlQ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H8h0Xx5I;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C38606A31C
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 12:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H8h0Xx5I
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so491755a91.0
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793362643; x=1793967443; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpxrkdHX+pHoxS8QiLrmBd8NFzaZIUXGXtbQN2oLq54=;
        b=H8h0Xx5ItX6J19xT/Zvrjqr8aUKfw4LC9F4vZCCqsZC1Kr4j8kzvuSwvoWVSsoMdAi
         Tv7Wz+GR2lcX63e49qKvKuUsnad4OnHeT5cn5CFG47IM5NujZQbdLECrrxpd7zzu7njq
         itJ2+jUc7EqpwvAnDJebtrdt5fGpWx4RKef7EUJQbp2pDR7qv56cad1y06B4qZSHTtPL
         Yn/C9qHsf97T3uxXpFTfaK9JBqVYdrjiS5bY5Yrx55YG+AfWkFaWGZR/P0KvoUpfSVm2
         VZjlkNGxLECIA4hJsmu57VDUGiqNFuiYR8aSzGeDRN+opo9kPUoMZRUTbnRkAXQaXDZq
         upWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362643; x=1793967443;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpxrkdHX+pHoxS8QiLrmBd8NFzaZIUXGXtbQN2oLq54=;
        b=bLXInJpXsgaai/qoPTDOK95RGWCaA4oU2lpFrKOPe4MIXlNbRMiWsn2AkLtxH/ShO9
         u/3BfVlVI7dc1YImM9K65J6LwYEYRqKU14c/WF+jBACQrJpT4YXwKaubTe1X+Nt7+Ybt
         Gpu6EeI+PRjZVLqv0wQttbyZA7ASSqnLv8XKFpI+QKDwCuCg1EuFDYpLqWsEKgj+E5l1
         xzDAZGJOaXy6Giv6IDm9yJT0zoFOaZIHfzBPXT1kXk4yZrhN+JdhzNItA1opO4LWTMTb
         oKrGFfQtwjNdYtk1N/T3jtnwzV9EjD+ufl8ygki5oYwkCjzcQxrGJQM6nycbMqx0nZSk
         mozw==
X-Forwarded-Encrypted: i=1; AKwUvBxfaTgMSVN7wX763GCE6Bx1Iw4jA2ogm0rFgVW1/nzNj3R664fXzLGbQRk1kn7p427YtNlc@lists.linux.dev
X-Gm-Message-State: AFq9FYI2nBi+ZBa4szzuR6npo1BApcMs5obdwBN3I5da1/NJeO480Ml9
	ZjvoA08ySGbj5FSS0QiBDJXI0GigubLmcRLxlBHvpuBS51sQIC693K0kYg9YpXLVj44Pmklpbiy
	b+JtlRSjoFVn4jnI6J4msbQ==
X-Received: from pgby23-n1.prod.google.com ([2002:a05:6a02:6517:10b0:cc7:4919:5ed9])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5106:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3ae8983c798mr1659513a91.42.1793362643165;
 Fri, 30 Oct 2026 05:17:23 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:17:00 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030121700.260975-1-jenhaochen@google.com>
Subject: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
From: Jenhao Chen <jenhaochen@google.com>
To: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	minchan@google.com, liumartin@google.com, benwei@google.com, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

In zs_malloc(), the fast path (if (likely(zspage))) allocates from an
existing zspage via obj_malloc(), while the slow path allocates a new
zspage via alloc_zspage().

Because obj_malloc() has three call sites across zs_malloc() and
migrate_zspage(), Clang at -O2 leaves obj_malloc() out-of-line, adding a
function call on every fast-path allocation. Conversely, because the
362-instruction slow-path alloc_zspage() is static with a single caller,
single-caller inlining under CONFIG_AUTOFDO_CLANG (e.g. with
CONFIG_ZSMALLOC=m) inlines alloc_zspage() into zs_malloc(), growing it
from 254 to 691 instructions.

Mark obj_malloc() and obj_free() __always_inline and mark alloc_zspage()
noinline to keep the fast path inline and the slow-path page allocation
out-of-line.

Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 mm/zsmalloc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 6258a4f5e9fce..5d3443f14a48f 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -960,9 +960,9 @@ static void create_page_chain(struct size_class *class, struct zspage *zspage,
 /*
  * Allocate a zspage for the given size class
  */
-static struct zspage *alloc_zspage(struct zs_pool *pool,
-				   struct size_class *class,
-				   gfp_t gfp, const int nid)
+static noinline struct zspage *alloc_zspage(struct zs_pool *pool,
+					    struct size_class *class,
+					    gfp_t gfp, const int nid)
 {
 	int i;
 	struct zpdesc *zpdescs[ZS_MAX_PAGES_PER_ZSPAGE];
@@ -1209,8 +1209,9 @@ size_t zs_huge_class_size(struct zs_pool *pool)
 }
 EXPORT_SYMBOL_GPL(zs_huge_class_size);
 
-static unsigned long obj_malloc(struct zs_pool *pool,
-				struct zspage *zspage, unsigned long handle)
+static __always_inline unsigned long obj_malloc(struct zs_pool *pool,
+						struct zspage *zspage,
+						unsigned long handle)
 {
 	int i, nr_zpdesc, offset;
 	unsigned long obj;
@@ -1321,7 +1322,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
 }
 EXPORT_SYMBOL_GPL(zs_malloc);
 
-static void obj_free(int class_size, unsigned long obj)
+static __always_inline void obj_free(int class_size, unsigned long obj)
 {
 	struct link_free *link;
 	struct zspage *zspage;
-- 
2.56.0.317.g454f8302e1-goog
