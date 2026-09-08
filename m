Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC658FD21
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886514; cv=none; b=rgs2aHGO93Y5MOqp/yVgR7MpGSyZLIFXXm8Bi9ZJ/6Poz2zDBVRuAmmuaI6mVhUFbcnNpx2eTcGDlAShG8zRXbq6PLznaenkS15yNi41IawUc8pOmkrerLIAjxyiPZ5qfEA8ckAahMLTDkXGemhALo0BGksubR2rmiizjxa++ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886514; c=relaxed/simple;
	bh=swnHzCzPIsazYNrb6Gr29KC3lToHtlhY/NVfFI7DlP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2Gw8NWqaWWYwknFaKPpXwhf4hUxO/GF9s0/xVcVO+m74BYrapxvy+xl86zaSlJb7h/jUVgPAxNEChP/rrbpw8jTbO/Yf/0fdDF5mkCVNfrWpi6bu1m/NmGKkXmRDf/eOWhhWkyXGD77UtPF77zHpE/xAqz/1G4CE57MySpO1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HsmYxM8s; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HsmYxM8s"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso140825e9.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886510; x=1789491310; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nw8yIRTtoZrCknqrua36GQ/CxjoMx8x/uJ+stBHvubA=;
        b=HsmYxM8srWG5e1zJfPE/ArD5+jEHn0YIYyRnk6bMSBvX247o09clSIa7U7dkEpk0Nf
         TYWH/wU5af0rPnq7t5HbodfGHIpINCWTY8Ew3n0kl2NB4hSG5IiO1GCVXqCXZI+GrZ7r
         si0zarVR+s0jc7brctDUjJZ5vZsZPGhvG7LSKwmxazJwFwHSwmkK3DAotpR5b0H60IIS
         IelEaLIdYZDFp95Kv0uVxaNzSZsJk830KgR6VDW2psRKN77me6V8fszSN9+gvTbuDHjU
         sAxbfcThyQX6/KbMax/GZrHk/y00bxRJrys3ZDUenS1OT0pTFDadlMMB7LETIx1HDg2Z
         Z5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886510; x=1789491310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nw8yIRTtoZrCknqrua36GQ/CxjoMx8x/uJ+stBHvubA=;
        b=SoA819NeUdHScfSJj0WdbXri1xGg8iLUE8+zbZ7BRycpzdZJLS1mqC8LVsuIAmh+7I
         F6LqqPN/lXcs3nhbcqUcC1lVNkFR6fFsnsrhWLumMabBamZRlXbD8KZVWohDwVp0eK6e
         SX8ptTJdUyyW2zvnkEflVKum4IYNhbivxnqeBn8FSK2oQTSWuonL/2gnLfg60zQL+koD
         lvXCafoSAgUqwhjKiu+9e2c7TlnWaf2nr/+a1KiTQeGXx9Nkjtb1BInijyEo/S98+2oS
         wSyvsC3gZVzZXnONN5dKIMc3ds6oPiev08xTNPPCxBQmJJOOSz+7QQr7YS2UbA8KfKE8
         apWw==
X-Forwarded-Encrypted: i=1; AKwUvBw2uODeeYWZ0lb3u2a+jTNUC6jCWmp1jZs2206Wh8isp3qqyDgfwz9vhr+GY6Fng+gz0/fO@lists.linux.dev
X-Gm-Message-State: AFuF++nOc4HEfYw8/zcZ8bWkK7x6dEjJQOgNFKxsBv/C+vEGhmRzR/hd
	Qm+pLznFT/Umm7Hy4VusiIcUsjnIazqaLh/Jp8lir8TmatxAqu+elUwu0EwIt+E7Og==
X-Gm-Gg: AYBFou1cGOr9hjVkMFBXurtz60FCP/AV7xbAcHIKPpZbTipoMbmz5T8GVQ+M53wS6OV
	UQNnvJgVoMAWFiiSZCyM7G0Ibn/txjluby6JtB4rAJSNAKhebqFNMXfIxxutDwcnK9rhUR8g6a1
	HSeXlU/t9jmkIxpffLCLzFiTU2YK3qRH9RfCGTr49qylnu6lF3fzWDkz4O40gS3W2LZcBQgUHcU
	+kIib4eWsmk23gSZ+dRZc5ZfKRd0E3968r5z6YLd56UyMlNn3Ebhk6VLQf1R0pM7UrFZWVy11Ty
	YPPjeRWgJz4g21p3lQx4aO+FB7KTmBEEAyaecQvsfDP3VL07be+oAc5BFnOwlW4wDImYIzTqy62
	k+QjM8Jn3EQriv5K5aIE/CCbtfRBPZCZ7doelChzM7/dtFDx2mmFuvJRXANUEH6tdKw88qJj8Dx
	/JxYLc/ufSccxSYSIvZk1TnJ0jIoTOpstA75ngt/5Iwh8m9YrpaW3J19qxvghW2q8SOmkLCrUux
	W3oRTAruk8E4sdtTdUdkZWf/ZeLlmYjIB6AaapRwOehAlG/
X-Received: by 2002:a05:600c:3221:b0:499:c46c:adc7 with SMTP id 5b1f17b1804b1-49d1bcfc063mr550665e9.2.1788886509269;
        Tue, 08 Sep 2026 09:55:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm304098545e9.4.2026.09.08.09.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:08 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:45 +0200
Subject: [PATCH RFC v3 05/12] kasan: refactor write/is_write arguments to
 flags
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-5-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=15697;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=swnHzCzPIsazYNrb6Gr29KC3lToHtlhY/NVfFI7DlP0=;
 b=xSzSXAvjgloPp+rdyeXvT+Khwp4gZ7hk1qn/SwJIRaO9bgCTg1ThG0i+7Wc6CCj4nbVGx9DCW
 PD+R63Jx4+VDiDlkxVhpY0o2eyGnufGo+9ITtw81h/TnsGTXLamz5CV
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Refactor the "write"/"is_write" arguments of kasan_check_range() and
kasan_report() into "flags" arguments that can contain the flag
KASAN_TYPE_WRITE.
This prepares for a following patch that introduces a second flag.

This should hopefully not change the machine code in hotpaths - both before
and after this change, the argument is either 0 or 1 at the assembly level
depending on whether the access is a write.
Only kasan_report() should have to do a tiny bit of extra work to do a
bittest.

Signed-off-by: Jann Horn <jannh@google.com>
---
 arch/arm64/kernel/traps.c |  2 +-
 arch/arm64/mm/fault.c     |  2 +-
 include/linux/kasan.h     |  6 ++++--
 mm/kasan/common.c         |  2 +-
 mm/kasan/generic.c        | 20 ++++++++++----------
 mm/kasan/kasan.h          |  6 +++---
 mm/kasan/report.c         |  3 ++-
 mm/kasan/report_generic.c |  8 ++++----
 mm/kasan/shadow.c         | 24 ++++++++++++------------
 mm/kasan/sw_tags.c        | 20 ++++++++++----------
 10 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 914282016069..9f31fe3f1660 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1069,7 +1069,7 @@ int kasan_brk_handler(struct pt_regs *regs, unsigned long esr)
 	void *addr = (void *)regs->regs[0];
 	u64 pc = regs->pc;
 
-	kasan_report(addr, size, write, pc);
+	kasan_report(addr, size, write ? KASAN_TYPE_WRITE : 0, pc);
 
 	/*
 	 * The instrumentation allows to control whether we can proceed after
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..221e39869ae6 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -365,7 +365,7 @@ static void report_tag_fault(unsigned long addr, unsigned long esr,
 	 * find out access size.
 	 */
 	bool is_write = !!(esr & ESR_ELx_WNR);
-	kasan_report((void *)addr, 0, is_write, regs->pc);
+	kasan_report((void *)addr, 0, is_write ? KASAN_TYPE_WRITE : 0, regs->pc);
 }
 #else
 /* Tag faults aren't enabled without CONFIG_KASAN_HW_TAGS. */
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index bf233bde68c7..03c7ac79345d 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -33,6 +33,8 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 #define KASAN_VMALLOC_PAGE_RANGE 0x1 /* Apply exsiting page range */
 #define KASAN_VMALLOC_TLB_FLUSH  0x2 /* TLB flush */
 
+#define KASAN_TYPE_WRITE 0x1
+
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 
 #include <linux/pgtable.h>
@@ -526,11 +528,11 @@ static inline void *kasan_reset_tag(const void *addr)
  * kasan_report - print a report about a bad memory access detected by KASAN
  * @addr: address of the bad access
  * @size: size of the bad access
- * @is_write: whether the bad access is a write or a read
+ * @flags: bitmask, can contain KASAN_TYPE_* flags
  * @ip: instruction pointer for the accessibility check or the bad access itself
  */
 bool kasan_report(const void *addr, size_t size,
-		bool is_write, unsigned long ip);
+		unsigned int flags, unsigned long ip);
 
 #else /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
 
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index b7d05c2a6d93..1ab77ac9719c 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -571,7 +571,7 @@ void __kasan_mempool_unpoison_object(void *ptr, size_t size, unsigned long ip)
 bool __kasan_check_byte(const void *address, unsigned long ip)
 {
 	if (!kasan_byte_accessible(address)) {
-		kasan_report(address, 1, false, ip);
+		kasan_report(address, 1, 0, ip);
 		return false;
 	}
 	return true;
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 2b8e73f5f6a7..9efd6fbbb7c3 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -173,7 +173,7 @@ static __always_inline bool memory_is_poisoned(const void *addr, size_t size)
 }
 
 static __always_inline bool check_region_inline(const void *addr,
-						size_t size, bool write,
+						size_t size, unsigned int flags,
 						unsigned long ret_ip)
 {
 	if (!kasan_enabled())
@@ -183,21 +183,21 @@ static __always_inline bool check_region_inline(const void *addr,
 		return true;
 
 	if (unlikely(addr + size < addr))
-		return !kasan_report(addr, size, write, ret_ip);
+		return !kasan_report(addr, size, flags, ret_ip);
 
 	if (unlikely(!addr_has_metadata(addr)))
-		return !kasan_report(addr, size, write, ret_ip);
+		return !kasan_report(addr, size, flags, ret_ip);
 
 	if (likely(!memory_is_poisoned(addr, size)))
 		return true;
 
-	return !kasan_report(addr, size, write, ret_ip);
+	return !kasan_report(addr, size, flags, ret_ip);
 }
 
-bool kasan_check_range(const void *addr, size_t size, bool write,
+bool kasan_check_range(const void *addr, size_t size, unsigned int flags,
 					unsigned long ret_ip)
 {
-	return check_region_inline(addr, size, write, ret_ip);
+	return check_region_inline(addr, size, flags, ret_ip);
 }
 
 bool kasan_byte_accessible(const void *addr)
@@ -252,7 +252,7 @@ EXPORT_SYMBOL(__asan_unregister_globals);
 #define DEFINE_ASAN_LOAD_STORE(size)					\
 	void __asan_load##size(void *addr)				\
 	{								\
-		check_region_inline(addr, size, false, _RET_IP_);	\
+		check_region_inline(addr, size, 0, _RET_IP_);	\
 	}								\
 	EXPORT_SYMBOL(__asan_load##size);				\
 	__alias(__asan_load##size)					\
@@ -260,7 +260,7 @@ EXPORT_SYMBOL(__asan_unregister_globals);
 	EXPORT_SYMBOL(__asan_load##size##_noabort);			\
 	void __asan_store##size(void *addr)				\
 	{								\
-		check_region_inline(addr, size, true, _RET_IP_);	\
+		check_region_inline(addr, size, KASAN_TYPE_WRITE, _RET_IP_); \
 	}								\
 	EXPORT_SYMBOL(__asan_store##size);				\
 	__alias(__asan_store##size)					\
@@ -275,7 +275,7 @@ DEFINE_ASAN_LOAD_STORE(16);
 
 void __asan_loadN(void *addr, ssize_t size)
 {
-	kasan_check_range(addr, size, false, _RET_IP_);
+	kasan_check_range(addr, size, 0, _RET_IP_);
 }
 EXPORT_SYMBOL(__asan_loadN);
 
@@ -285,7 +285,7 @@ EXPORT_SYMBOL(__asan_loadN_noabort);
 
 void __asan_storeN(void *addr, ssize_t size)
 {
-	kasan_check_range(addr, size, true, _RET_IP_);
+	kasan_check_range(addr, size, KASAN_TYPE_WRITE, _RET_IP_);
 }
 EXPORT_SYMBOL(__asan_storeN);
 
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fc9169a54766..c833bd44e3cc 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -339,11 +339,11 @@ static __always_inline bool addr_has_metadata(const void *addr)
  * kasan_check_range - Check memory region, and report if invalid access.
  * @addr: the accessed address
  * @size: the accessed size
- * @write: true if access is a write access
+ * @flags: bitmask, can contain KASAN_TYPE_* flags
  * @ret_ip: return address
  * @return: true if access was valid, false if invalid
  */
-bool kasan_check_range(const void *addr, size_t size, bool write,
+bool kasan_check_range(const void *addr, size_t size, unsigned int flags,
 				unsigned long ret_ip);
 
 #else /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
@@ -379,7 +379,7 @@ static inline void kasan_print_aux_stacks(struct kmem_cache *cache, const void *
 #endif
 
 bool kasan_report(const void *addr, size_t size,
-		bool is_write, unsigned long ip);
+		unsigned int flags, unsigned long ip);
 void kasan_report_invalid_free(void *object, unsigned long ip, enum kasan_report_type type);
 
 struct slab *kasan_addr_to_slab(const void *addr);
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e804b1e1f886..cfe00ebb98ec 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -568,13 +568,14 @@ void kasan_report_invalid_free(void *ptr, unsigned long ip, enum kasan_report_ty
  * user_access_save/restore(): kasan_report_invalid_free() cannot be called
  * from a UACCESS region, and kasan_report_async() is not used on x86.
  */
-bool kasan_report(const void *addr, size_t size, bool is_write,
+bool kasan_report(const void *addr, size_t size, unsigned int flags,
 			unsigned long ip)
 {
 	bool ret = true;
 	unsigned long ua_flags = user_access_save();
 	unsigned long irq_flags;
 	struct kasan_report_info info;
+	bool is_write = (flags & KASAN_TYPE_WRITE);
 
 	if (unlikely(report_suppressed_sw()) || unlikely(!report_enabled())) {
 		ret = false;
diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
index f5b8e37b3805..445183e2f4d3 100644
--- a/mm/kasan/report_generic.c
+++ b/mm/kasan/report_generic.c
@@ -364,14 +364,14 @@ void kasan_print_address_stack_frame(const void *addr)
 #define DEFINE_ASAN_REPORT_LOAD(size)                     \
 void __asan_report_load##size##_noabort(void *addr) \
 {                                                         \
-	kasan_report(addr, size, false, _RET_IP_);	  \
+	kasan_report(addr, size, 0, _RET_IP_);	  \
 }                                                         \
 EXPORT_SYMBOL(__asan_report_load##size##_noabort)
 
 #define DEFINE_ASAN_REPORT_STORE(size)                     \
 void __asan_report_store##size##_noabort(void *addr) \
 {                                                          \
-	kasan_report(addr, size, true, _RET_IP_);	   \
+	kasan_report(addr, size, KASAN_TYPE_WRITE, _RET_IP_);	   \
 }                                                          \
 EXPORT_SYMBOL(__asan_report_store##size##_noabort)
 
@@ -388,12 +388,12 @@ DEFINE_ASAN_REPORT_STORE(16);
 
 void __asan_report_load_n_noabort(void *addr, ssize_t size)
 {
-	kasan_report(addr, size, false, _RET_IP_);
+	kasan_report(addr, size, 0, _RET_IP_);
 }
 EXPORT_SYMBOL(__asan_report_load_n_noabort);
 
 void __asan_report_store_n_noabort(void *addr, ssize_t size)
 {
-	kasan_report(addr, size, true, _RET_IP_);
+	kasan_report(addr, size, KASAN_TYPE_WRITE, _RET_IP_);
 }
 EXPORT_SYMBOL(__asan_report_store_n_noabort);
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d286e0a04543..a24f1225dd88 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -28,13 +28,13 @@
 
 bool __kasan_check_read(const volatile void *p, unsigned int size)
 {
-	return kasan_check_range((void *)p, size, false, _RET_IP_);
+	return kasan_check_range((void *)p, size, 0, _RET_IP_);
 }
 EXPORT_SYMBOL(__kasan_check_read);
 
 bool __kasan_check_write(const volatile void *p, unsigned int size)
 {
-	return kasan_check_range((void *)p, size, true, _RET_IP_);
+	return kasan_check_range((void *)p, size, KASAN_TYPE_WRITE, _RET_IP_);
 }
 EXPORT_SYMBOL(__kasan_check_write);
 
@@ -50,7 +50,7 @@ EXPORT_SYMBOL(__kasan_check_write);
 #undef memset
 void *memset(void *addr, int c, size_t len)
 {
-	if (!kasan_check_range(addr, len, true, _RET_IP_))
+	if (!kasan_check_range(addr, len, KASAN_TYPE_WRITE, _RET_IP_))
 		return NULL;
 
 	return __memset(addr, c, len);
@@ -60,8 +60,8 @@ void *memset(void *addr, int c, size_t len)
 #undef memmove
 void *memmove(void *dest, const void *src, size_t len)
 {
-	if (!kasan_check_range(src, len, false, _RET_IP_) ||
-	    !kasan_check_range(dest, len, true, _RET_IP_))
+	if (!kasan_check_range(src, len, 0, _RET_IP_) ||
+	    !kasan_check_range(dest, len, KASAN_TYPE_WRITE, _RET_IP_))
 		return NULL;
 
 	return __memmove(dest, src, len);
@@ -71,8 +71,8 @@ void *memmove(void *dest, const void *src, size_t len)
 #undef memcpy
 void *memcpy(void *dest, const void *src, size_t len)
 {
-	if (!kasan_check_range(src, len, false, _RET_IP_) ||
-	    !kasan_check_range(dest, len, true, _RET_IP_))
+	if (!kasan_check_range(src, len, 0, _RET_IP_) ||
+	    !kasan_check_range(dest, len, KASAN_TYPE_WRITE, _RET_IP_))
 		return NULL;
 
 	return __memcpy(dest, src, len);
@@ -81,7 +81,7 @@ void *memcpy(void *dest, const void *src, size_t len)
 
 void *__asan_memset(void *addr, int c, ssize_t len)
 {
-	if (!kasan_check_range(addr, len, true, _RET_IP_))
+	if (!kasan_check_range(addr, len, KASAN_TYPE_WRITE, _RET_IP_))
 		return NULL;
 
 	return __memset(addr, c, len);
@@ -91,8 +91,8 @@ EXPORT_SYMBOL(__asan_memset);
 #ifdef __HAVE_ARCH_MEMMOVE
 void *__asan_memmove(void *dest, const void *src, ssize_t len)
 {
-	if (!kasan_check_range(src, len, false, _RET_IP_) ||
-	    !kasan_check_range(dest, len, true, _RET_IP_))
+	if (!kasan_check_range(src, len, 0, _RET_IP_) ||
+	    !kasan_check_range(dest, len, KASAN_TYPE_WRITE, _RET_IP_))
 		return NULL;
 
 	return __memmove(dest, src, len);
@@ -102,8 +102,8 @@ EXPORT_SYMBOL(__asan_memmove);
 
 void *__asan_memcpy(void *dest, const void *src, ssize_t len)
 {
-	if (!kasan_check_range(src, len, false, _RET_IP_) ||
-	    !kasan_check_range(dest, len, true, _RET_IP_))
+	if (!kasan_check_range(src, len, 0, _RET_IP_) ||
+	    !kasan_check_range(dest, len, KASAN_TYPE_WRITE, _RET_IP_))
 		return NULL;
 
 	return __memcpy(dest, src, len);
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index c75741a74602..af77b642ede7 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -72,7 +72,7 @@ u8 kasan_random_tag(void)
 	return (u8)(state % (KASAN_TAG_MAX + 1));
 }
 
-bool kasan_check_range(const void *addr, size_t size, bool write,
+bool kasan_check_range(const void *addr, size_t size, unsigned int flags,
 			unsigned long ret_ip)
 {
 	u8 tag;
@@ -83,7 +83,7 @@ bool kasan_check_range(const void *addr, size_t size, bool write,
 		return true;
 
 	if (unlikely(addr + size < addr))
-		return !kasan_report(addr, size, write, ret_ip);
+		return !kasan_report(addr, size, flags, ret_ip);
 
 	tag = get_tag((const void *)addr);
 
@@ -109,12 +109,12 @@ bool kasan_check_range(const void *addr, size_t size, bool write,
 
 	untagged_addr = kasan_reset_tag((const void *)addr);
 	if (unlikely(!addr_has_metadata(untagged_addr)))
-		return !kasan_report(addr, size, write, ret_ip);
+		return !kasan_report(addr, size, flags, ret_ip);
 	shadow_first = kasan_mem_to_shadow(untagged_addr);
 	shadow_last = kasan_mem_to_shadow(untagged_addr + size - 1);
 	for (shadow = shadow_first; shadow <= shadow_last; shadow++) {
 		if (*shadow != tag) {
-			return !kasan_report(addr, size, write, ret_ip);
+			return !kasan_report(addr, size, flags, ret_ip);
 		}
 	}
 
@@ -137,12 +137,12 @@ bool kasan_byte_accessible(const void *addr)
 #define DEFINE_HWASAN_LOAD_STORE(size)					\
 	void __hwasan_load##size##_noabort(void *addr)			\
 	{								\
-		kasan_check_range(addr, size, false, _RET_IP_);		\
+		kasan_check_range(addr, size, 0, _RET_IP_);		\
 	}								\
 	EXPORT_SYMBOL(__hwasan_load##size##_noabort);			\
 	void __hwasan_store##size##_noabort(void *addr)			\
 	{								\
-		kasan_check_range(addr, size, true, _RET_IP_);		\
+		kasan_check_range(addr, size, KASAN_TYPE_WRITE, _RET_IP_); \
 	}								\
 	EXPORT_SYMBOL(__hwasan_store##size##_noabort)
 
@@ -154,13 +154,13 @@ DEFINE_HWASAN_LOAD_STORE(16);
 
 void __hwasan_loadN_noabort(void *addr, ssize_t size)
 {
-	kasan_check_range(addr, size, false, _RET_IP_);
+	kasan_check_range(addr, size, 0, _RET_IP_);
 }
 EXPORT_SYMBOL(__hwasan_loadN_noabort);
 
 void __hwasan_storeN_noabort(void *addr, ssize_t size)
 {
-	kasan_check_range(addr, size, true, _RET_IP_);
+	kasan_check_range(addr, size, KASAN_TYPE_WRITE, _RET_IP_);
 }
 EXPORT_SYMBOL(__hwasan_storeN_noabort);
 
@@ -173,6 +173,6 @@ EXPORT_SYMBOL(__hwasan_tag_memory);
 void kasan_tag_mismatch(void *addr, unsigned long access_info,
 			unsigned long ret_ip)
 {
-	kasan_report(addr, 1 << (access_info & 0xf), access_info & 0x10,
-		     ret_ip);
+	kasan_report(addr, 1 << (access_info & 0xf),
+		(access_info & 0x10) ? KASAN_TYPE_WRITE : 0, ret_ip);
 }

-- 
2.55.0.979.g7e5102b832-goog

