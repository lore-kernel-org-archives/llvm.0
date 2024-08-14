Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7737E1487EA
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625788; cv=none; b=WxrW/2KkWHeYnX4bb0yU8KPFEZufOtyRHXVxC8qtG1AU/nmdRBwqbUzFtGKLsf4Hy/bOsYKuxc7ZNArbgWzzdTBL3Ysr6DOZid0mYY2t4mulTbfYaUeXHU/1wqShJapB0HU2B8pT9yLN+LlB3hMuIO5SLGZQECgi2wkX0gHoi20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625788; c=relaxed/simple;
	bh=y57VQrw88WGtL67OnREsNbCLIoyGKBbMu8jjNLherto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRlE0CKgB4kfy9QjqMXjCqpUvotWpCdRXz/UhaE8MQ2Xcd9/H9NRrCNUqs8AM8LkLIMxSMvOQUva2IniSe2H89exgEcO2lKqhGaxO83EnJE3jR6HS6TjF0CyORhw6A3wGOBngRbicKLIAFYd7f8shlZ5vMb6OhE+sW0b4vcy/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=amcVP7z/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="amcVP7z/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fd70ba6a15so49469885ad.0
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625786; x=1724230586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr1OlloTvp35mKilBnuEZzypgigPXmCly4KSd56Q7OI=;
        b=amcVP7z/PsfMBpMgsJrCxeeGSjUhFm2uxHVORY+8kwXnlX5mryxYTk7Vboz/ddSCYL
         Yw/e81Q2yJlgid6H3yqbnwgpnxlMHVLfa1PKpHalbHd8lYXD2b5iB3wf5n/zlalZ+ejz
         jprjDOHaH0PJoDaIK6/I+ZrhYEhVPw67Jn/aWRGXPzCjU2ulAFa+Pg2uhmLfxJ7dapNj
         UYpIKowxBCMFMAa8Dc8wXLgMmNq+wTBajERQuBlQ62r4uh4eLSw9u/highLjfJVSI2Bu
         4IOq2Uj9j37N8Wn9j/oTqdJphAbQPK1mAU51OgohOjt5H87ozHtlC8G/1OnLR8vn78Oi
         L7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625786; x=1724230586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr1OlloTvp35mKilBnuEZzypgigPXmCly4KSd56Q7OI=;
        b=gRpzA5QAg3kqI54I4x4+3WMpUKnkNHcQtpMRqBGgiHGwPqhsroYQne5LEROid7L6mK
         Hd8EjiFQ8nxS7R9Lg4bUAa5B5wlUme57neSPAmNJljJMQrPVQwKqWAgV/uTKFg6CaZZb
         G2a7vATy+hVD+M8bkXSJPHy093k3r2nxbcR49kir4qraVGnb8MSLgaa9TmEzPxVw8nyo
         bN9XRDk2lOgcNqaoFjowiX0MJmYjY4Fw2LUCGA1q6vqVWai4HOBah30im8AXTqVIjJwv
         xADCme1CnnQfDT6xK0kD6XxRovFGxtTyjrQaG6lJ4NjaALJptg1GtGEDMN0Xvmr8nJbZ
         T2ZA==
X-Gm-Message-State: AOJu0YwXxVhd5DZ4AboIX3qIfj3CY2entg5m8Pml2SUcrwuRuMgcSL8t
	5gC7IaEhlHcVCyH1VKOqZaK+Wi2C8bGSaMg2PjdAcsXCi8zJ9/rb1gSU1jvXv6I/3U45Y1gAqCM
	7
X-Google-Smtp-Source: AGHT+IE20LewatO25ueMR3XW0aRNE3Ho00UvK46l5CUL7vUBX+0A3K1zUsQysbjVk0qPCHhMgq/ydQ==
X-Received: by 2002:a17:903:360d:b0:1ff:49a0:46b1 with SMTP id d9443c01a7336-201d6397db6mr25518915ad.6.1723625785721;
        Wed, 14 Aug 2024 01:56:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:25 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 3/7] kasan: sw_tags: Support tag widths less than 8 bits
Date: Wed, 14 Aug 2024 01:55:31 -0700
Message-ID: <20240814085618.968833-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow architectures to override KASAN_TAG_KERNEL in asm/kasan.h. This
is needed on RISC-V, which supports 57-bit virtual addresses and 7-bit
pointer tags. For consistency, move the arm64 MTE definition of
KASAN_TAG_MIN to asm/kasan.h, since it is also architecture-dependent;
RISC-V's equivalent extension is expected to support 7-bit hardware
memory tags.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm64/include/asm/kasan.h   |  6 ++++--
 arch/arm64/include/asm/uaccess.h |  1 +
 include/linux/kasan-tags.h       | 13 ++++++++-----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.h
index e1b57c13f8a4..4ab419df8b93 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -6,8 +6,10 @@
 
 #include <linux/linkage.h>
 #include <asm/memory.h>
-#include <asm/mte-kasan.h>
-#include <asm/pgtable-types.h>
+
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_TAG_MIN			0xF0 /* minimum value for random tags */
+#endif
 
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 28f665e0975a..56a09f412272 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -22,6 +22,7 @@
 #include <asm/cpufeature.h>
 #include <asm/mmu.h>
 #include <asm/mte.h>
+#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/memory.h>
 #include <asm/extable.h>
diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
index 4f85f562512c..e07c896f95d3 100644
--- a/include/linux/kasan-tags.h
+++ b/include/linux/kasan-tags.h
@@ -2,13 +2,16 @@
 #ifndef _LINUX_KASAN_TAGS_H
 #define _LINUX_KASAN_TAGS_H
 
+#include <asm/kasan.h>
+
+#ifndef KASAN_TAG_KERNEL
 #define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
-#define KASAN_TAG_INVALID	0xFE /* inaccessible memory tag */
-#define KASAN_TAG_MAX		0xFD /* maximum value for random tags */
+#endif
+
+#define KASAN_TAG_INVALID	(KASAN_TAG_KERNEL - 1) /* inaccessible memory tag */
+#define KASAN_TAG_MAX		(KASAN_TAG_KERNEL - 2) /* maximum value for random tags */
 
-#ifdef CONFIG_KASAN_HW_TAGS
-#define KASAN_TAG_MIN		0xF0 /* minimum value for random tags */
-#else
+#ifndef KASAN_TAG_MIN
 #define KASAN_TAG_MIN		0x00 /* minimum value for random tags */
 #endif
 
-- 
2.45.1

