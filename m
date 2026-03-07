Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE418479
	for <llvm@lists.linux.dev>; Sat,  7 Mar 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866464; cv=none; b=uqtnhRm7DcoxAugMZ2vuTens9/PEOm21fi5Row2ZsatgBs+jBaBZ+T/oSIsyuM922rEXzDrsFjRoeBCqPxg0daJsKtvtw2aAecB741vCq+uUhxHlhq1jiqAOLg9BlRXyESMsoOynjETt/AP6a+Or9/Nt4DnvbcWQVVPNm1TcBCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866464; c=relaxed/simple;
	bh=bP6c3sT+V4RHEwFQm5V0XUbBDPOTQenKAaYyhZdLacw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewGoBfx4N1nkKysQpwfdvgqelyV4jgivh0oE36Xol3PKpJR/tzzb8WBpFOWInY2Q9xyHoVBBpZ8tkLA73O7JEr57H3U2x3kW/DqRTgGljdwa/PczinrxPv5FAY8hkz9IYjfV4809VCUIbpLuoqx4xHi5oQBOjSAjqpj6N4s4KZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMlrOQoe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMlrOQoe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae4d48dc2fso29324585ad.3
        for <llvm@lists.linux.dev>; Fri, 06 Mar 2026 22:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772866462; x=1773471262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFh5xzf9mXTWKL8wgZ/1CT8NM6bT0JUa5sch2tV0MvY=;
        b=UMlrOQoeOAGCq2H6uScpH5TRucXc7TdUFsN7JWu9p62w9aGdcil7cgzZNGTJurWLHs
         dn3JcO3vzcoEYXuumxpoHxf/DXroLe18BmQswg5/LyWmsIZFN+IqGnOaWi90qMsBKA2/
         c5KsMx0gvsZHxTKwFi5HatJNFyT4H6nnDUSpcZj+0RqMIL0rfQUIRZrJRdMeSL1qcvho
         Jgx4VvsO40GlEnMICLyAFKBFr16zrweND/K7yKLha4C+HpnwFsynZ5CKyaY/o9cVYGc6
         4n7rWWWhb5uXblrrPGEek3E6QmbyLlwYD/e5UQNBT4ipkrDjuUAreEv93J7Yc6Yh8IaZ
         b35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772866462; x=1773471262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFh5xzf9mXTWKL8wgZ/1CT8NM6bT0JUa5sch2tV0MvY=;
        b=bT/KbSYfq1nv8ifjfgDKa8p9yigP/ZUR+BfWAIV3B906Z1izca920/AAJdV9DVDzfT
         s5OVFYXpMFSmZfj07n+6b0WXtECh3Z2rf+WpYPXxHZ5a+NtgO2ASlULBUm1lM7E3h6p2
         q9HPIhf3VOAW2ebKM2SwzU1iv/YJIZ6cbUZyZ1ZzGhFq8QtysvyIwWityrPhWN/ACbdW
         qR0kuM+NdiBbOtrHqzVSovPpLSKBroqCjEmnkLH4gNEgy9dscw+WbTW8JxSusAf4IMke
         2pNiOGdx0uxJliy91kB2MUmzCB/RzhBq+y6yQu7zcZkDv9v8hso1WL3dbvuFTrDLEjO1
         3IJg==
X-Forwarded-Encrypted: i=1; AJvYcCXEFH5Qumb3MDXS+C0JfYbIJXZ4XGq+uWUGRRWCc2JL9XUJn4lnTRqXgWjYhrwUz3vLCtpF@lists.linux.dev
X-Gm-Message-State: AOJu0YxvKVCz2ldCUnl4BuBDRw9xn/B2laNKeGjYecwMsKDpSfBTWdvi
	G+5TjhtYyg/CzoHnbooaHVbdH7ERxhc0Wn+fql2tWvgv4k5g+rwfzzHD
X-Gm-Gg: ATEYQzyJSIeX1dmouxJ3aNoakR1dKlS4rYZPEGlZ34KbqCZ/oyRHKd7f6GQMCkcjNsd
	qkOB0uZ4O++LnB5373EfWNBoLqIoZZA29E0cSFYkqXZsSDWBlj56cCtmPZbKr5VvHCj73e4UFCw
	P0KbT+j6tHPufK4YVWSsUptkTOlcC/dv2InIKXv/TOpCfLT+tEytDa6YRCBRaxmmobUICCwSa3k
	0pzUmXLRmp13XJ1c7+iNqnFmUFrJ8TjDFKlimQ9jwG724PxZeMk4oO1rdBHEM3hILSyV+ABd5eN
	jM5ZHOfWTb6KdEAM50ctldyfBNdJsEenMUIFlEgEZNIClyAuGl2J9DhlkSv3h9ghX+TxBkDM9X+
	BVZx/JLkBzCO0xWs0iIB4ZUKG2SPz9xqLAOjX6VY50hzpKePq0NjLB87CxqV4+ZxIPa+GlWzEIb
	ad9ikwnkjYOsPtUc8/4mKplbxF1M1P18121lJ4RoUAjZs=
X-Received: by 2002:a17:903:120f:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae824f4d5fmr46909505ad.34.1772866462157;
        Fri, 06 Mar 2026 22:54:22 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e77197sm41388995ad.20.2026.03.06.22.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 22:54:21 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH] mm: optimize once judgment with clang
Date: Sat,  7 Mar 2026 14:54:04 +0800
Message-ID: <20260307065405.37473-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 242b872239f6a7deacbc ("include/linux/once_lite.h: fix judgment in
WARN_ONCE with clang") helps optimize performance and size under the
clang compiler, but the modification is not complete.

Port the modification to WARN_ON_ONCE_GFP(), VM_WARN_ON_ONCE_PAGE(),
VM_WARN_ON_ONCE_FOLIO(), VM_WARN_ON_ONCE_MM() and VM_WARN_ON_ONCE_VMA().

Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 include/linux/mmdebug.h | 8 ++++----
 mm/internal.h           | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
index ab60ffba08f5..a167c5aa525e 100644
--- a/include/linux/mmdebug.h
+++ b/include/linux/mmdebug.h
@@ -60,7 +60,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 	static bool __section(".data..once") __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
-	if (unlikely(__ret_warn_once && !__warned)) {			\
+	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
 		dump_page(page, "VM_WARN_ON_ONCE_PAGE(" __stringify(cond)")");\
 		__warned = true;					\
 		WARN_ON(1);						\
@@ -80,7 +80,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 	static bool __section(".data..once") __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
-	if (unlikely(__ret_warn_once && !__warned)) {			\
+	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
 		dump_page(&folio->page, "VM_WARN_ON_ONCE_FOLIO(" __stringify(cond)")");\
 		__warned = true;					\
 		WARN_ON(1);						\
@@ -91,7 +91,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 	static bool __section(".data..once") __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
-	if (unlikely(__ret_warn_once && !__warned)) {			\
+	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
 		dump_mm(mm);						\
 		__warned = true;					\
 		WARN_ON(1);						\
@@ -102,7 +102,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
 	static bool __section(".data..once") __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
-	if (unlikely(__ret_warn_once && !__warned)) {			\
+	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
 		dump_vma(vma);						\
 		__warned = true;					\
 		WARN_ON(1);						\
diff --git a/mm/internal.h b/mm/internal.h
index 6e1162e13289..52367f52d623 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -93,7 +93,8 @@ struct pagetable_move_control {
 	static bool __section(".data..once") __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
-	if (unlikely(!(gfp & __GFP_NOWARN) && __ret_warn_once && !__warned)) { \
+	if (unlikely(__ret_warn_once) && !(gfp & __GFP_NOWARN) &&	\
+	    unlikely(!__warned)) {					\
 		__warned = true;					\
 		WARN_ON(1);						\
 	}								\
-- 
2.51.0

