Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230A13A3ED
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 01:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511119; cv=none; b=YFB1H/qfLLetvDAC2ZsigtLOdAvVQk+l8zX5sa9JaRDaRwv6Y4mrhWJ4pa1lOk2ivqjugdJqSbtHwEzqW6Gx8AwyZs8rzBXRzqhH2v/Swx3XUCR6X+KHYwtl7CdXR8tUl0z5Ez+9LhzB7Kc9QQ8Ga7HEx9Qi3IoG7nqo0AUU5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511119; c=relaxed/simple;
	bh=ErFyElTBld4DvSgGLbrVmJmKJFWufwhxdSlD7rQrheI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlYsyct9mEYp6R1PhwwWeQGMC9KmZ1BeAcMxnwPrH+p4Q5xq93KRAbw72J9taJLN0jC40fplQY41NjQfiei5PDJXbgODMkNWpoYjdeM50L4joWIO6zrStV28+dwf5F4mIAnqu/YNJxoPT7d44W3XsaMS12v1iOkyb52CXaxw+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=QaiCsxG2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="QaiCsxG2"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-304d9a1f198so53883521fa.0
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 17:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1737511115; x=1738115915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxyXF8Hr8QolPU/FAk8yF622zpC5hPC6gkSHqzztZZ4=;
        b=QaiCsxG2jK2Dv4lrqa0T8xmXIzw44nCS0hEsCYNJWuB8g9C8KyoyAhsg3/Sp0z4FLO
         atygPo1ni0dvYTloJ6LjPsSpdifcJtz0bFzKgAit8/SIXCKANluCRwkf9jwgZfFY1l3A
         yYKljfjqD81xSsUnOhTGr4pGTlN4BjhJ9GhLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737511115; x=1738115915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxyXF8Hr8QolPU/FAk8yF622zpC5hPC6gkSHqzztZZ4=;
        b=PNQQUMw1hCpxWUZWO68WsAqrPv9d4NnvzB90ruji9jtuO19vxaus+RMOXa89EldNfq
         +VAxl5LboxF4hXB3E9TlV5xbeYQKXCqVEW/PUWF64B4sGyCQjqEb+aYegjj71uxc1DHc
         UyzgvzY1OnN71SfcY1fs+ify1YKvqKxdPt/kVPshGFijlXaNzLWqNG4K4Y+Kbu6dpkUK
         gOlvnJBVt+RYfxBlg44iVNim8oRmVMVYTK3sy8eFm60R+DI+GFkVcnWEcgj705y9wyG3
         sYiJfnmO8Jtde2h1HXtUJjsWroQUTMwjJOyWOdNAC2u/NNJudc23FstaxxaBwszwbJdB
         pmPg==
X-Forwarded-Encrypted: i=1; AJvYcCU7SoEIf2OdHMLr+LKhGr988H9JK9kufEwq4lHcWvyxBd/d5Yo5m2BuLEi0Qjl/Mdft6E5y@lists.linux.dev
X-Gm-Message-State: AOJu0YzHytPEDwzhGjQb80OLnrvjwPYH41rthZ3mXluLGeBht2g/tYkM
	YT4EhciB6PWhSrVuxyPmTRYEUcCE2lSnc4hzCQfQKb7OZFhML19t9/9CzEeNWQ4=
X-Gm-Gg: ASbGncu7f9OsKhX/vBVnby4Y0EXpmc+sReDbj9+CWdMalK7NfEJuS16PPyIOmle+Tes
	1HvjOeIvgjklFvwu8jyDrmD5j+jtP7p9bwOhWFUElfjFuZZOD7h2vXH6UeHLGht6GNcgqsBnCZl
	2AFJUF7g3YgWu2D+xXD7czouOhMIgLvUDyG1cEcIt8X4UkZrgCzJSz589iHmQJWWsz6/gljAaXe
	JcPVWFpQG4GzFpzAuKg+KBpaJLp2C0Rgaz4UyYBtg0kGGD88fXInZ+vanJKV9sFLG7+0vCUVUdH
	RR4ucZ2hj0Kc5cMFqDqluoqiehXcTgaWrKTVvJV4l40=
X-Google-Smtp-Source: AGHT+IEbm3i2l9ctO/977rtxU4PTr1BHePcWsRUqHDQP1K8679iQ6Z1uySlSBXPdUBoeSUal2DMlMQ==
X-Received: by 2002:ac2:5541:0:b0:542:2335:c43a with SMTP id 2adb3069b0e04-5439c246321mr4899214e87.21.1737511115328;
        Tue, 21 Jan 2025 17:58:35 -0800 (PST)
Received: from stratofortress.vigil.i.intelfx.name (vigil.intelfx.name. [193.106.93.116])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60ba9sm2079110e87.113.2025.01.21.17.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 17:58:33 -0800 (PST)
From: Ivan Shapovalov <intelfx@intelfx.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ivan Shapovalov <intelfx@intelfx.name>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Rientjes <rientjes@google.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Joel Granados <joel.granados@kernel.org>,
	Sourav Panda <souravpanda@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Konstantin Khlebnikov <koct9i@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
Date: Wed, 22 Jan 2025 04:57:15 +0300
Message-ID: <20250122015818.3308696-1-intelfx@intelfx.name>
X-Mailer: git-send-email 2.48.1.5.g9188e14f140
In-Reply-To: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Spose so.  One always suspects that adding a typecast is a sign that we
> screwed things up somehow.  The relationship between enums lru_list and
> node_stat_item is foggy, and I'm unsure whether this is the place to
> make the transition it.  Perhaps lru_list_name() should take an
> `unsigned int' arg instead.

All of these *_name() functions do seem to expect arguments in range of
the corresponding enums, so perhaps keep those args typed as a form of
self-documenting code, and do this instead?

---
From f8960df01b7f4fdc8d09a366886563385aed7f18 Mon Sep 17 00:00:00 2001
From: Ivan Shapovalov <intelfx@intelfx.name>
Date: Wed, 22 Jan 2025 04:10:59 +0300
Subject: [PATCH] mm: fix more clang compiler warnings

In the similar vein as 30c2de0a267c ("mm/vmstat: fix a W=1 clang
compiler warning"), fix several more sites that generate warnings
with clang 19.1.7:

./include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  505 |                            item];
      |                            ~~~~
./include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  512 |                            NR_VM_NUMA_EVENT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~~
./include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  525 |                            NR_VM_NUMA_EVENT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~~
3 warnings generated.

Similarly for mm_inline.h:

./include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
      |                                    ~~~~~~~~~~~ ^ ~~~
./include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
      |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
2 warnings generated.

Additionally, change the lru_list_name() and mm_inline.h sites to use
the same `(int)ENUMERATOR + ...` idiom to match the three first fixes
above for consistency. Everywhere else is's semantically more correct
thing to do because we are not really treating any of these enums as
other enums but rather treating all of those as indices.

Link: https://lore.kernel.org/all/20241212213126.1269116-1-bvanassche@acm.org/
Fixes: 9d7ea9a297e6 ("mm/vmstat: add helpers to get vmstat item names for each enum type")
Fixes: 30c2de0a267c ("mm/vmstat: fix a W=1 clang compiler warning")
Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
 include/linux/mm_inline.h | 4 ++--
 include/linux/vmstat.h    | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 1b6a917fffa4..5a2328728b21 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -44,9 +44,9 @@ static __always_inline void __update_lru_size(struct lruvec *lruvec,
 	lockdep_assert_held(&lruvec->lru_lock);
 	WARN_ON_ONCE(nr_pages != (int)nr_pages);
 
-	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
+	__mod_lruvec_state(lruvec, (int)NR_LRU_BASE + lru, nr_pages);
 	__mod_zone_page_state(&pgdat->node_zones[zid],
-				NR_ZONE_LRU_BASE + lru, nr_pages);
+				(int)NR_ZONE_LRU_BASE + lru, nr_pages);
 }
 
 static __always_inline void update_lru_size(struct lruvec *lruvec,
diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index 9f3a04345b86..545568a4ea16 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -501,27 +501,27 @@ static inline const char *zone_stat_name(enum zone_stat_item item)
 #ifdef CONFIG_NUMA
 static inline const char *numa_stat_name(enum numa_stat_item item)
 {
-	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
+	return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
 			   item];
 }
 #endif /* CONFIG_NUMA */
 
 static inline const char *node_stat_name(enum node_stat_item item)
 {
-	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
+	return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
 			   NR_VM_NUMA_EVENT_ITEMS +
 			   item];
 }
 
 static inline const char *lru_list_name(enum lru_list lru)
 {
-	return node_stat_name(NR_LRU_BASE + (enum node_stat_item)lru) + 3; // skip "nr_"
+	return node_stat_name((int)NR_LRU_BASE + lru) + 3; // skip "nr_"
 }
 
 #if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
 static inline const char *vm_event_name(enum vm_event_item item)
 {
-	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
+	return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
 			   NR_VM_NUMA_EVENT_ITEMS +
 			   NR_VM_NODE_STAT_ITEMS +
 			   NR_VM_STAT_ITEMS +
-- 
2.48.1.5.g9188e14f140

