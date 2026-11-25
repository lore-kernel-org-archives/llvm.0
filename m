Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645650;
	b=hwNHMqBFc+OU53BxK8r061wlb/wAatLSoK26iGDGJzKt8dy/e847CXc3/CBjFv3+r1ez
	 wu8HUcWoPi6mtBkaflm0Q3LQnlcsnOLW6FT5avBpMch4NKQYGAnuXupULI102lxLfUug3
	 RJ5fOE3DmgwlOfGEmsDst1Nlh1sgUGSz/K6YsTRM8U2s6IPajbU9AgZACakPOuW+BLv/K
	 95cYdI/QdxIAe2o5+VSb9CMlxzjEc8QcjazZuf6vqvKsbNly69r0/IxZNshYB3gShAEtO
	 V2BXU3bNo2LRVBQxPMRqfu7q3R7yKQ6iUxx8fLOeYYh52u+PvzJJPB4650D3oGandrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RiNM9OF5vBLtGgFl62pfxBUQi+W1VLFdVJFedeCHig4=;
	b=JjYDDksmRyv1L4AoGZZNFnPGor1ak8hMXAywdJG+q7Lf6jC6wLlyGO9ucUED4yxlOqKM
	 6o4N9jWQRiEfJ6U6MN0ZzWDfj+zqsaXNPXGUwJBpfj8ZongCOXLXmGoRV2l3F9+0/iE4G
	 VOne8uv2mdjhEWkkiZvCkuyqonK+DL9Ww4JtYKBN51uO+5tJzRnYemd25d7G0Nmr8Yr3V
	 VQHJdQ9goNDC7152G07IhjC8X0cZ3LnAFVqVSr+pFu7BkkTs8ciafnOXzO/LDeMZc6viu
	 kfG1Cyn4+5w/YZhxTODD/hbaVot+19vCMf21q0Rtv4MAZ4hJPixRC05154OcigQjurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LimCp6SU;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D7606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LimCp6SU
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so500279eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645649; x=1796250449; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RiNM9OF5vBLtGgFl62pfxBUQi+W1VLFdVJFedeCHig4=;
        b=LimCp6SUkbUXHVIF8CFdEiCm+/hzjcbuNKzmuyk2D6OJ6mHRqPIj9VSIMxMIEQT6Vg
         Hf3GXzhwXNUer4GlnvJmEeqMv7faqZ3adyxvXtloZ59NpKpkYZYIGb2uczuq6KhKvAL4
         nBooo3aN2QOTDGcwB80+CTcK2xvwvey8bGob2acQgCrTr1lwRrqOU1WFMM5R+IZxQKLu
         n1Vs2XntXz6ayFQPfqlO60iQZCYnl/wD0Eqj50mloXa7ijkHadrqtYLr/Jn2yJSgXHiL
         1beDF3R/cg8Wyx2dEVeye0L0G3QS51OszHjMZDa69VvSBEd+oNC/4b8Vfs3RbShGMeet
         dzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645649; x=1796250449;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiNM9OF5vBLtGgFl62pfxBUQi+W1VLFdVJFedeCHig4=;
        b=R/shyom5V9XN778gcg5Kw20d/zEXH7lGW+NqbZ9dMFSP4KEN40eUlhPglZEKBWC03G
         Jaxo5UjtoOy5JGaoNpanFohfNow3y7hAx4Qtg5Hv2Bg4rxcD5k25lGO46oIltWyU5P18
         sFYsWbzxJdn4uRAtsediA/UAJYLQzkhQhQLIMTdQ+dvMOzAMV/5jID/xJYLAOQ0MzM9B
         +ma/2RaRCgzTEBxN79NFHkhJUoiBgQH97nJ2eh50QAI/b2mNEPe+MGtYGlaucJqX6NJ0
         5Iny8jR5kGy6vyuY5w+W1cBAEWFZhl1rlg7O524LyuOX9em5m8q/njmz3xgk3+lGLBYF
         YgpA==
X-Forwarded-Encrypted: i=1; AL+hErHA7U+xISEruPZzn1yGUJtkdcj6/1uVxxAJdYlcVFXip8Kx3TYulyoIbNZUENJVE2bVweEw@lists.linux.dev
X-Gm-Message-State: APuU4Z9hrROG6WA1q9TTYZH/AQLvtxLjI3yJCBpWqFQZHi9ybw1g/ibi
	Y+hkuj0YNb9USg3b7prtMrukRblGgM2FIZIMhPAsfa3hwHh96HGmf5A+pMnBOp4MfLgpXZlDAjw
	Akg==
X-Received: from dyp12.prod.google.com ([2002:a05:693c:65cc:b0:381:fb4c:34e1])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4710:b0:378:314:4042
 with SMTP id 5a478bee46e88-385702587c5mr17876713eec.14.1795645648594; Wed, 25
 Nov 2026 14:27:28 -0800 (PST)
Date: Wed, 25 Nov 2026 22:27:13 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222713.1450385-1-elkin@google.com>
Subject: [PATCH] mm/migrate_device: use locked folio in migrate_device_{range,pfns}()
From: Elkin Cruz <elkin@google.com>
To: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

migrate_device_range() and migrate_device_pfns() read a speculative
folio pointer via page_folio() prior to taking a reference or lock in
migrate_device_pfn_lock(). If the page splits or changes compound state
before lock acquisition, folio_nr_pages(folio) inspects stale state and
the nr > npages - i error path calls unpin_anon_rmap(), folio_unlock(),
and folio_put() on the unowned speculative pointer while leaking the
reference and lock on the folio actually locked by
migrate_device_pfn_lock().

Return the referenced, locked folio directly from
migrate_device_pfn_lock() and skip unlocked entries cleanly.

Fixes: dc41e961a269 ("mm/migrate_device: avoid out-of-bounds writes for compound folios")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 mm/migrate_device.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a953e7acbea6..a599d5baa340 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1416,11 +1416,13 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long pfn,
+					     struct folio **foliop)
 {
 	unsigned long src_pfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 	struct folio *folio;
 
+	*foliop = NULL;
 	folio = folio_get_nontail_page(pfn_to_page(pfn));
 	if (!folio)
 		return 0;
@@ -1436,6 +1438,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
+	*foliop = folio;
 	return src_pfn;
 }
 
@@ -1464,18 +1467,18 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 	unsigned long i, j, pfn;
 
 	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
-		struct folio *folio = page_folio(page);
-		unsigned int nr = 1;
+		struct folio *folio;
+		unsigned int nr;
+
+		src_pfns[i] = migrate_device_pfn_lock(pfn, &folio);
+		if (!folio)
+			continue;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
 		nr = folio_nr_pages(folio);
 		if (nr > npages - i) {
-			if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
-				unpin_anon_rmap(folio, src_pfns[i]);
-				folio_unlock(folio);
-				folio_put(folio);
-			}
+			unpin_anon_rmap(folio, src_pfns[i]);
+			folio_unlock(folio);
+			folio_put(folio);
 			memset(&src_pfns[i], 0,
 			       (npages - i) * sizeof(*src_pfns));
 			break;
@@ -1508,18 +1511,18 @@ int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
-		struct folio *folio = page_folio(page);
-		unsigned int nr = 1;
+		struct folio *folio;
+		unsigned int nr;
+
+		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i], &folio);
+		if (!folio)
+			continue;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > npages - i) {
-			if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
-				unpin_anon_rmap(folio, src_pfns[i]);
-				folio_unlock(folio);
-				folio_put(folio);
-			}
+			unpin_anon_rmap(folio, src_pfns[i]);
+			folio_unlock(folio);
+			folio_put(folio);
 			memset(&src_pfns[i], 0,
 			       (npages - i) * sizeof(*src_pfns));
 			break;
-- 
2.56.1.839.g22a8290db9-goog

