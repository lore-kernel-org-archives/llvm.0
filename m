Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4001494D6
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 08:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625794; cv=none; b=UGo75k54vN7dWteIGc9yY99fSAb6zvk8LlwZ24+XHxvWpDWOYpySUbn0h900AmZVBHKBXxZnDKozs2gJy4bvZLjUUOM11G2FJiIc44VBlmiyoBCiPtVQFTTTbfaJqRLt22459fbcwP3EAdjte28kvdmpBGmD+OpbtO5DGdampZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625794; c=relaxed/simple;
	bh=geArp4vYpOuxeLfSy4kt6ZtrgC6/R3zfTRXVcdxhuWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsSu9VOEIDTohZJ/q022VuohelfYk55vKlX0Cgqz0czc2qijOTE2M29RFtIaQC2Rz7Zycl6BWIoHLHQkQv+yXHdoXmw7BNGa54CqmfEpwln+lEpS10X6sNXqodtngff58X0YVc4p9B7hGMvpOMOxGI6XIJuem00Uyzqey99rcfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SFgzPTYF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SFgzPTYF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc5296e214so61386825ad.0
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625793; x=1724230593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hz49lwxt/ore9sEZ/uYZptf0bZHlG9fVMF8g6BZbdk=;
        b=SFgzPTYFNW+L/WSuoNhN3RgsWNsD6c775NVHXbIKzWZoPMkVPaDiBtUqPVCg1iIOPg
         Y5+WXhIRBOTtS+xUVmBiNKeiP9cFGJ/Nb4Y65/yLmrZiA9P4QlmfCFZmVqcMAhEXrWpX
         OtradfjvzRowvMlpBHSg3UNudzDfRvxNTyqZ67HJfq+GNgyS04VWOHji6HR9oPX9Mh7f
         8YbGS+QqyEsMrJZssqJxHzqb71U00sXqsmwHM52scO5J3HrLWIexPV0kpNBHLsfzmuEY
         Vox2PeJbb1l5tpxAGFbjSXE6o1jjxsDPnXb1x7Wia6euOqncTeV5Yi+5c3oYwqsy4sVG
         RVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625793; x=1724230593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hz49lwxt/ore9sEZ/uYZptf0bZHlG9fVMF8g6BZbdk=;
        b=esJHJKldc6BE/S65tlNpCRDib2z2DsGnIBDrFnDY89d69pJH+y+EPiHd4FBt2gjuCa
         1sozAcfA9oUIKpe7vh00Ydiw2xY0zjph39WLhdlPGN4YG0gCvsQbQqu4zB/3zyHbZ/dL
         gSLiaq0Wn/UdjAd254cofrqiJfYyoBGuCSq+FprIpjAjlIG/e8Fuj3kdP8CXpq6s5fTn
         y3ly3ID6Jcq+POmosLg7a283SQSorcp2qq9YiUsenyNcARuvk53qJ6+Rt5l4EqWpHb29
         rhjj+iPAXA/no72VTaLFOD/I+/ghJOEjavo/3RhoVr/eGqWmAsD46FhVFQIb3uujcj9w
         czFQ==
X-Gm-Message-State: AOJu0YwrfKxC7tmYhrWQPADHbz6B+p/khvjixnUMWBuXlEjDlv+niUdp
	zyjFM8LGxkI33X9Tr5QrQQIFCEhS3pX7kQhxT0nVTP1sXzQYFzUssGGlqtVXRoY=
X-Google-Smtp-Source: AGHT+IEjBmXCU7mNTlJDHLEXVaA9qjlxh2UbxM2PLdod3xVt/jyJ0BnNxQ5PpAdVoFfN1q2eB+NLCQ==
X-Received: by 2002:a17:903:1c9:b0:1fc:2ee3:d46f with SMTP id d9443c01a7336-201d638d797mr29420295ad.11.1723625792838;
        Wed, 14 Aug 2024 01:56:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:32 -0700 (PDT)
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
Subject: [RFC PATCH 7/7] kasan: sw_tags: Support runtime stack tagging control for RISC-V
Date: Wed, 14 Aug 2024 01:55:35 -0700
Message-ID: <20240814085618.968833-8-samuel.holland@sifive.com>
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

This allows the kernel to boot on systems without pointer masking
support when stack tagging is enabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 mm/kasan/kasan.h       | 2 ++
 mm/kasan/sw_tags.c     | 9 +++++++++
 scripts/Makefile.kasan | 5 +++++
 3 files changed, 16 insertions(+)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fb2b9ac0659a..01e945cb111d 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -630,6 +630,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
 void *__asan_memmove(void *dest, const void *src, ssize_t len);
 void *__asan_memcpy(void *dest, const void *src, ssize_t len);
 
+u8 __hwasan_generate_tag(void);
+
 void __hwasan_load1_noabort(void *);
 void __hwasan_store1_noabort(void *);
 void __hwasan_load2_noabort(void *);
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index 220b5d4c6876..32435d33583a 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -70,6 +70,15 @@ u8 kasan_random_tag(void)
 	return (u8)(state % (KASAN_TAG_MAX + 1));
 }
 
+u8 __hwasan_generate_tag(void)
+{
+	if (!kasan_enabled())
+		return KASAN_TAG_KERNEL;
+
+	return kasan_random_tag();
+}
+EXPORT_SYMBOL(__hwasan_generate_tag);
+
 bool kasan_check_range(const void *addr, size_t size, bool write,
 			unsigned long ret_ip)
 {
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 390658a2d5b7..f64c1aca3e97 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -73,6 +73,11 @@ ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
 CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
 endif
 
+# RISC-V requires dynamically determining if stack tagging can be enabled.
+ifdef CONFIG_RISCV
+CFLAGS_KASAN += $(call cc-param,hwasan-generate-tags-with-calls=1)
+endif
+
 endif # CONFIG_KASAN_SW_TAGS
 
 export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
-- 
2.45.1

