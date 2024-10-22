Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EF13A256
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562364; cv=none; b=C7DUnFM0yUzoUzcxI1Eta0g4gWR4eW3f+PJOqBrtmjfAz1exILa2qPAuuklmK37jaxQn5uItiBjyA4fmaGeOubL8tdVIwE9zVN9JdiH7lQWrLbLOII8wR5AWjx6CmYfEBiagK9+ucyP6nrN1SX9T/fGqjXP9J9CiBg7GqNtl2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562364; c=relaxed/simple;
	bh=S3WW3tHhxyvl0epyEFgv/DG+AYg+CTrcC41pnvrmNh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h782YrzekubZrJ+dfNOFRjW2QmTFU0G7RVore6YVwnuWRtQdBEU0lq5a7V21ZJbUftxH3Cm6FNFS4e36PYnkQG3yEtHCx9r4DT8uk2jL+Ulw9YWk+iLfx+Vd1VYTXwb24zEmsiQWUeJ/3i+HN49Kfjw+/PaVLwXNmUdvBgtfw2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=MXZ5/feP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MXZ5/feP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7eb0bc007edso25130a12.3
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562362; x=1730167162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FnCjcC1/gsDOd6L8rx/6dcUkVYp18eK0+PNRkpMvb8=;
        b=MXZ5/feP1bKhj0C8lnakrmr7Zbpo17/LGZzSP5tkSPb0AkIvtKU9PW6gbfMDXnyj9o
         ZhWFsN/JCV9UhhSkABJNdbTjLhyR6TKHgpZsNVOo7xiGi4VkLOpHBU8ktw8gQA1OBEbs
         957JVMTUkRLnuozfjbnRYznH7XeikdfbAWMRCpMid+QkWlnmJCRXtdxvESJ7hzvaWwjj
         qbnponWfOsxwwNOn4JCMGVB5hkUiZ0TkiB9Fnilqr0TdvirEhsDPiEns1foH/dbMnZmk
         sA9uLkXmidT26UYC/Q0VU5TBimDBKO05whiSsviEvEWfHNN+fvaa91ZzCBAaooZt7MbQ
         h09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562362; x=1730167162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FnCjcC1/gsDOd6L8rx/6dcUkVYp18eK0+PNRkpMvb8=;
        b=SzBjvfDPUfMdu5lNbZZ3Bud4jxGicYciEVc607QXRpVy8g+q0NCTM4j+Z6fk/iSIfN
         sOYuktA1e+L/yNnAm2TSd6ZGSFc+Hgx2uUo3/rmKRQd+hQko7Q1TaeA0hfx247BFFQmI
         qPWHyEZYl6cHxTrsPT8YLJX+mEUByRRqW4lVoA9PQ8vIitHfRgYiCn90ILC4JbhqGGFS
         J1Li1CaWLY1snGP7MzGZhO78mRn073AzbWI47tsP6fs1PqBoRyeVMlqse8uiFObLIim1
         z8b8PWxewK4ZYqrayzzeNNyWaYT1K/gT4Zi1//WE9V4dtMIit7tjRhcNYNdyD8Kl6NKX
         UKSQ==
X-Gm-Message-State: AOJu0YyFBYAHqn6gcP0wsS1XmT3Y5QknWn8PGp4MpbuwH+psR0j+eP9o
	yv0NGIjpJ0YKrOTmkAWbzzKNQMdVouk5qRFUbPvEO/+T+rPu4YZOdUjkUf5UiqE=
X-Google-Smtp-Source: AGHT+IFrGG6oMYUOck7CBYXToXMnxG+Lx4oLmbcg4j3FeL+zQkCHcoYgP+J0xW6HIU5j3POtBJfPHg==
X-Received: by 2002:a05:6a20:43a4:b0:1cc:9f25:54d4 with SMTP id adf61e73a8af0-1d96df0ed05mr1060384637.38.1729562361689;
        Mon, 21 Oct 2024 18:59:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:21 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 3/9] kasan: sw_tags: Support outline stack tag generation
Date: Mon, 21 Oct 2024 18:57:11 -0700
Message-ID: <20241022015913.3524425-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows stack tagging to be disabled at runtime by tagging all
stack objects with the match-all tag. This is necessary on RISC-V,
where a kernel with KASAN_SW_TAGS enabled is expected to boot on
hardware without pointer masking support.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Split the generic and RISC-V parts of stack tag generation control
   to avoid breaking bisectability

 mm/kasan/kasan.h   | 2 ++
 mm/kasan/sw_tags.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index f438a6cdc964..72da5ddcceaa 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -636,6 +636,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
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
-- 
2.45.1

