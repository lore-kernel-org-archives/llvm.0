Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DFD2D3EF2
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777942892; cv=none; b=TV8AdmWlXj+WEgMF5lunkmeTXMTLLh8occw/BaVZ214cFufi5IYO6RKZfYinxvLZKIuDXv2Y2E5tL+0tDQBfF9pcvI3YdGhcOPb2iv3WVT9eKIThFDfQssw+ho+24uFQhh7mXVgTtVz15FHr5JahvYYfVqmeizGVYri8uISfx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777942892; c=relaxed/simple;
	bh=JLDq8fKlyzO6XwZL/iqJWzUDcls7oo47Eus+TVmGyZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjgUOxfl8yyP0kgEtnCV6rgSmgdnRHDgvlQdUVuD2ui0A3SYGnhR8Tb6iUMUl9kdyDNtUswSqqSS3TXQotM711ke4llEf0oI8HdvBfFD85ZSf+sUyjxJgYPP0yaahYkE3hD61cEiTAoNaba7ztuUrxeThtlwT7kqHB0SJOT4NSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWyRcyGB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWyRcyGB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so2762319a91.0
        for <llvm@lists.linux.dev>; Mon, 04 May 2026 18:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777942890; x=1778547690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=noRB/3k3PKvhvGq4d2i3S6nAV184FSHocbhdsDyNxPc=;
        b=dWyRcyGBzJGsakF3F7kGpRshfioyBtBIXADDaOFKBo7XYQyEfPLeIxXn7reSlUkZ0p
         pXi6jDMP5xQIbcDtmHXdbNDrdwqeNeCMU0DXrWkv7tZAdrFlVumWOVn+38M2UjF77Smj
         xinPRVw4+gzikB5ePO5DNtJB1+8H9S5GpVoIkyJkkrOfaxUij3rCWz6FkOzL6MMJ2SrB
         SC4Q2TYIR/9JEYIGNFMHKfrVLSFt3vKhofrdbRcSN0ZiX37G5mjRO+Iv60GNkaT1RBA/
         7ajnIpGjAl7WQbDYfi/4TCAKHr1jsmX9d5OfMskToaMw7X3lCsg6aLEQiNOp9aCvFyfO
         /3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777942890; x=1778547690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noRB/3k3PKvhvGq4d2i3S6nAV184FSHocbhdsDyNxPc=;
        b=HjphoHEAEagnCLVvLFYX1cdApKV6F67pItGkABZrGX5Pthd4uqO7n9jn55YUkAQjES
         9OKMvzAgwlhKuRHimZv2pckSthZThz6iH1nDlTG/yGql/dxGB5sKm8e4vA/sts6m47h1
         T8pFgsfzFbTbCtekk+J7X/W9Uxg8qoGXS3izop/mEyjkZz4MvpCc4cyykuI0gnKtfr9j
         rYqqbdiHMa+wyw1EsfqIagw4/CCmkLBQk4x6diy9PzHqGvs1DbkDdNTI9QYD8aVnGrbE
         NsGhVqBHo+zXKIPei3iu966nWwHT9EKTBK0FLNx3wofHaxoblxWqxvjNGfxp6LBm0MQJ
         gUvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QbKV1xK9k2H2bDeCxX3V79BVQxwLYRYIKs3I8i8KWN3peuTZPgWoYU7YKZaJ8O2e9ETcP@lists.linux.dev
X-Gm-Message-State: AOJu0YyKQwKZQQWJDwXhcLd++E0k4YfkfInLUZx7uTJQzlLOD6Th7VD4
	OKM67LaVzej2mIQE97Z/27tJNjsfjJcmnnAwNwBCZtx4vlbW40iF3PXU
X-Gm-Gg: AeBDievmdr1hUJE4ms0gEBDJmvEIgWEOo+pPq9mg8zLJyD8fWBkN4VUFs0CO6NBotwP
	rU9PMdji3QPxYt2E9g5KrE7ilN1jXkV9u3IR/jHuC+e9HCwaDXg/ZlxzaIGPPthbgXVZgbsQOyD
	hUZRWmEvv2KoD6ngtGLPRQHHFGiHb/6SfNc9TiIXNFilmnZhknmnQGlkS30Kv/zw3keHK55zqYv
	LjIqX+7lIzJAybRA3ImaP8jBKrOkmkjhoH7hWL4KDviDgQvYKRewbCo1M2WssrSZLaUSUxwmPuo
	Ddl8DLF6cOV4cqRqsY3thGvpx5W4/3bV7Khod/tnKmeripF84UrEMXkv5/jTl4blhyWp8LBZCPs
	wjha9Clwbouvq3GaqkkgKbwdYqsQow19xwW5oTAl/ttaYSFi2I9QchjMhNzPX2N12fuJgCffiqG
	psEsTVhXLaYuk/7miQ8QfIzfxOSeb/hmP2viMYuVc383q7lqhmkWN3QaF+lGjGfcCgVLoL9Xzlg
	/VnMYHqssXBO/iaWA9vIEL6pHqkv1gPrhi6NvH8do0fUQ==
X-Received: by 2002:a17:90a:d443:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-3657287d45bmr1268764a91.13.1777942890198;
        Mon, 04 May 2026 18:01:30 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba1c451d9bsm53830935ad.1.2026.05.04.18.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:01:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mm: move phys_mem_access_prot_allowed to header
Date: Mon,  4 May 2026 18:01:12 -0700
Message-ID: <20260505010112.645361-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phys_mem_access_prot_allowed is only implemented for X86. For others, it
returns 1. Move it to header to avoid using __weak.

Fixes compilation with make LLVM=1 ARCH=mips

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/char/mem.c      | 6 ------
 include/linux/pgtable.h | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 5fd421e48c04..ae8449674f46 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -239,12 +239,6 @@ static ssize_t write_mem(struct file *file, const char __user *buf,
 	return written;
 }
 
-int __weak phys_mem_access_prot_allowed(struct file *file,
-	unsigned long pfn, unsigned long size, pgprot_t *vma_prot)
-{
-	return 1;
-}
-
 #ifndef __HAVE_PHYS_MEM_ACCESS_PROT
 
 /*
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a..72a7fa388e88 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2154,8 +2154,16 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 #endif
 
 struct file;
+#ifdef CONFIG_X86
 int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 			unsigned long size, pgprot_t *vma_prot);
+#else
+static inline
+int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
+			unsigned long size, pgprot_t *vma_prot) {
+	return 1;
+}
+#endif
 
 #ifndef CONFIG_X86_ESPFIX64
 static inline void init_espfix_bsp(void) { }
-- 
2.54.0

