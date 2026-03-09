Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C2E3D7D7E
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070501; cv=none; b=cHbz0vxL/brA6spQ6PNjt/c9RER4ewcOe4D6st/aZPBaC2gqqx6ndxhz5WfHO9q6N3a0dITg5L2xlz/Ko5inar6lwuf9l2Yh9XIobE+b8YTbQHCYHTYSh9A35AmrzixLP3aX897R+j9NwMH4+VWsNYw9qNIjkypVmsdtBr+q4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070501; c=relaxed/simple;
	bh=a6G6wn6wB8ltuvjLAlw0AHaT2dZ2G/WUjD3hQ9WHQGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+dK07m9JY/aEQrR3OMEmG1hCwc2n6C1PLmXhso8TanngiDrkdxAb5EJIHjG7rtLuS+RNw0UwbZYpXhVg1eiX1iUGVhXZ17F3Ay+vPh4kIBA3zRKCG10u94lMOV+v8izHanjUymgDWQZA0GmF9xOxo6Ne4CDvWJQmJGke+1XA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE5evcx3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE5evcx3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a871daa98fso88134845ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773070499; x=1773675299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GyPGkVOEzuOj++oEdOrxAUPo+L6IspicUK5SJ/430lI=;
        b=dE5evcx3D5FdoDBwvNpUgQHuNW9OD541P7NwMTx9fnDubXPwaLz/sonmB20v3Jl02d
         MJjbC6YEEWSeoct0tYHGCOV4HkW5iOCJW/KcayXlWXByJEmvz5+YTLKsDQMHh58FkS83
         di+1omQkJmZS4AWEGcsf523uFQycQVoS7yEOlYq1NoVx27f0yR++qPmkpF9gZKnhrvox
         9qfwcXWU4OgKd6KOedgxiuQGaDMD1YaFdjOrElOpk3eFplZ9IMsYVke2vFriAmIOpks7
         HvX0lTR4LItpJqN3XtyzUUkg/F6mbHsZxxTqoTtrYOQhqevu5GH10YM14THauLvs4LUP
         sOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070499; x=1773675299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyPGkVOEzuOj++oEdOrxAUPo+L6IspicUK5SJ/430lI=;
        b=N/fOzrOuJSG5lG8DBpHgyYLUmEy4w2RPv7WSL4BsAyY8IJ4cOplOxcMExXvjpA0Hqr
         jpKVz6od4GKecrE1pLMkVin0/J3BvkFswQw2jZ24Pw/v741UK9HETcbtyiHxX8vA6Tos
         mjxS7uj4V9BOvLOz90It3dUHikeJPHfW0EQXrXpmJY6smCuJ5bzYpT/fv9VO1EUyMKzw
         sJvtULuvPfB4zvkh3qxxBq7qrwUyvg/t67HLGJE8al95zh9r3UDqGO3oOWnJPfKcMlwu
         zIlLm+1RuDXf9tgUpay5LdpaGzOh+Hgi3AnJLTXH/zBhym1sck9hgi4BptIoAA3CBhjq
         abVg==
X-Forwarded-Encrypted: i=1; AJvYcCXQKuR7/SSia4Jth4SIFpTZXOXpIr2u/tOcp7qC3K65QJnn5onyE4wWieechQRM4zxGiCBA@lists.linux.dev
X-Gm-Message-State: AOJu0YyUv1qniIi5Flz0aM7r37od49l+qvNuj3Ks4McO1BlVijM2Fz/G
	v16gDsmMPE85HUTc0dft0o/NAsyiQm1F0L66x9opjKuoPcyd00Tl5J7r
X-Gm-Gg: ATEYQzxDYb9NXn0wJXh9yIatSzqnN3b0A/pXw+P/IXSWwGFrzofPlI5EJpGkSXvcVWq
	VTYvJkBwbpFHzHTArWbK3pfsEMzuQb0A+y5641FBGJFCSYXnAeizdGjANuTqxTd0eNNzDQVeXwT
	s1bUpiGzJm7nPxmL8mXRGtBlktVF75O/Vq+zWj0et3HnomreEkqYeI/hJ9wbnAfdzfzxayWoDRt
	TLAZtrfy4CM33g+QeQHnlcghTIHSqXwTr5X4t4MufwaQZVOrAiXHcsC1wWvrIzM5KI0uwWa7/nI
	xv+R1JSMsQHSQbQMghIC6tb5zbFz+mUqpDJLo6dj1rDQ+NAlvAvuzFEykmnMm6ZfyfTfp1CM2HB
	/52Q+0TXLc73WRQ++YuVZU/g/KlBFo0fBaYdwNm6EU7FLsdaVIRAcZHnIZ4lW1MRCxkQVQCxOq6
	GJmgQ5YL4NdN3eUysdd/jJmL0lLgl4BWlFQdpiDytcNog=
X-Received: by 2002:a17:903:198c:b0:2ae:683d:12b8 with SMTP id d9443c01a7336-2ae82443b5amr113592925ad.29.1773070499404;
        Mon, 09 Mar 2026 08:34:59 -0700 (PDT)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840be379sm118342985ad.87.2026.03.09.08.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:34:58 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: rppt@kernel.org,
	david.laight.linux@gmail.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
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
Subject: [PATCH] mm/debug: optimize once judgment with clang
Date: Mon,  9 Mar 2026 23:34:05 +0800
Message-ID: <20260309153405.20130-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Port the modification to VM_WARN_ON_ONCE_PAGE(), VM_WARN_ON_ONCE_FOLIO(),
VM_WARN_ON_ONCE_MM() and VM_WARN_ON_ONCE_VMA().

Cc: Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 include/linux/mmdebug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.53.0

