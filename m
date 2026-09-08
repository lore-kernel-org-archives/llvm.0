Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7E58FD20
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886516; cv=none; b=jpaJyOhTtvpLzOXHSVVUzzC4OvVE5lGidvbdvTOZiIUL5oGDceIjSW4PRoDM0tFmh3S9ymzjwyZDdjul4ubp7kSfSyvoYC5srDlqKPWW2+SDObq0CelsgR72qyVBBqG8hzSbq+wEW7EjZOSNt6SuyzB2WfL/Bd0e+8YR56CW7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886516; c=relaxed/simple;
	bh=KM3J1uqaAuVEtjhIrPm3dpl77//Er2qflRT9ZFIQO/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/e/zpMJXsCmMcnBzVstlKfK6qlLEyOEWHBJjnOdZp3HBUYAJS81YUWNKUzTtBzOFi7qiP0JKvKalMSKlStDp/vYd4mYT4V0FSEjRk8AFkrHzPZ4iI1R+eMlz5gzvUi10ts+5cWeYkHOJ6FMN5SoPKTiokZw1II7FGWteiSZT4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eDz3JzDs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eDz3JzDs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so96925e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886512; x=1789491312; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFBHubYFY/k3KdYk9Gk7CjyW2NbP8onxJg8FRcfS+Jk=;
        b=eDz3JzDsL6WkVt2ZMiM6QFaNROWXKaN2NJxo6pReKc2QUaCcfUSNCX8NZjmZBkZ6o7
         kKEgDtXFO55kSFaTCrujfGlEzfXlI6Yj6YN/eH+5OnuaIRcKy5ECnRQjoa0L8+ICnTet
         oDJuA7a5HbjzIc2W7uXatzGTs9TUm5E9ZeSiMwF5VsjP5xd4kQjUmYzV2HUuL1xGPBsQ
         EobyolbLJkI35kdymzT5zE7GyFkfV6BOTfAeNWNnlXSIf08+u7br0eg1ZZ2/mttO8uoG
         bhNtThnTnyDFnmNsBgcWiyIXDTqyqu61F2owMBvM3Fd0oixSLooDNYjDXI/U3Ut0XjnO
         3WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886512; x=1789491312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFBHubYFY/k3KdYk9Gk7CjyW2NbP8onxJg8FRcfS+Jk=;
        b=poudpOsCH+pq4JKUL9SiJh2vSfzpVDwjU5A6fXShWStwqOLLMxXb1+ncVndExiI1Eg
         x3oa390qf9IVhJjmr4siUa8Fv7+afz5RPe5PGAoiNWAnREiUEVkr41qKpc8dsStg0qho
         7PGmp02dAK2hNcEwpv+IxOKW0/v+HFslSIhTFwEpqaO6KNyW7gRmhS/6kn6cl4gK3SgA
         NYonU2734ThXBbY5erzoj9vX4O1WWmrpwuRSJMXUA3qWhHv2kVgepr/Jri19kira2PjZ
         aZ/5MxeSnbTa6JA1TbMQkMc0nE1sRftIQDUDbc6EMO6gHTuKYUQ67kdS+Nykcwac0DRK
         NADg==
X-Forwarded-Encrypted: i=1; AKwUvBxEOSE8NMYEFFxATnMENiw27bsjoAitm6La0stmdPtti7IPu35jGDgflt4m53Th2cNoUCxM@lists.linux.dev
X-Gm-Message-State: AFuF++kJ4fMWN6dWskaF7+R6FqPuLnnA9HxRnV+/tnmJ6NZgFCV2lSEa
	6BxjEq7F+PtFM8a/TiaWR7Rq4j/UV0AoQyQrwLY/1s22Exja+vQrMlGcLpQfjRG5WA==
X-Gm-Gg: AYBFou1rGYhUYj1AyukHI8ErgfHcAjdU2r5i7YDI/+HvwiuT2tM87tnOjaFGa6iveai
	JMZniOnXAslduzg/LUDnQHlh3tJqChBpxO+kCln+j8vQfURfM9XjhNr7cvN9awbiI6F4o7L+MpE
	HDZVgxCOzl1DLPB8mJ2xL6aVLLxp3c0uTYCB0Dj67XLQlGaEK5tPhCdOvI7OwNTeH9ZJbr/Rlhl
	FnAcG+atAKU0ehIKDgtpNUzXbF8si7TX52WlEILPRRbePQZfblsZSbPBKLsMUYho1L/9OOCllxa
	DkJDEiX5GqLY8ZGVfRXQFMk5zKVxOMKF8nBpsNmtdW9k7WOzdvlLBI+jp5uPR+b1KdvT9Azi6A4
	h8YEktCiNdJPGmCgUegUKJMm4dgFPwlOPkxkdUNYUmOYnRL2I7C5yOouyazDbNP0/lg5QOop1x+
	CgidX228rHH95ydsdRXZlIKH/A/MhTp+4baUC2zRKI/Q4exz4XyABy1kbzbi5DbYaNQJynFERtW
	bo57LjvWDh2ddjgEVsntEPuuX+1/f+7OycuHS+bZF6kugbz
X-Received: by 2002:a05:600c:5919:b0:499:cfeb:4f17 with SMTP id 5b1f17b1804b1-49d1f6e6e8bmr41005e9.5.1788886511111;
        Tue, 08 Sep 2026 09:55:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm37649438f8f.21.2026.09.08.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:10 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:46 +0200
Subject: [PATCH RFC v3 06/12] kcov: introduce memory access tracing
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-6-dcbc11593e88@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=14092;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=KM3J1uqaAuVEtjhIrPm3dpl77//Er2qflRT9ZFIQO/A=;
 b=Me1BYaxa3UcH4uDWhaWlZ/p3BX9q54yIRRaeL+npmLeJNRcwA2GBISemLGmz+DgO08c4fxxTI
 WjJj57RshWJDTn4dreOozqBq5DmfNjwXiwIhFS4Vomjg5zHL+ph+9CI
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This commit only introduces tracing of memory accesses that are
instrumented at the source level with instrument_*(); a followup commit
will additionally provide data based on ASAN compiler instrumentation.

I am adding the instrumentation hook definitions directly in
include/linux/instrumented.h instead of adding separate headers; this
way the compiler won't have to read yet another header file for almost
every compilation unit.

To avoid instrumenting files that shouldn't be instrumented, reuse
KASAN's __SANITIZE_ADDRESS__.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/instrumented.h | 30 +++++++++++++++++
 include/linux/kcov.h         | 11 ++++++
 include/uapi/linux/kcov.h    | 24 +++++++++++++
 kernel/kcov.c                | 80 +++++++++++++++++++++++++++++++++++++++++---
 lib/Kconfig.debug            | 11 ++++++
 5 files changed, 152 insertions(+), 4 deletions(-)

diff --git a/include/linux/instrumented.h b/include/linux/instrumented.h
index a1b4cf81adc2..940776dff616 100644
--- a/include/linux/instrumented.h
+++ b/include/linux/instrumented.h
@@ -13,6 +13,26 @@
 #include <linux/kcsan-checks.h>
 #include <linux/kmsan-checks.h>
 #include <linux/types.h>
+#ifdef CONFIG_KCOV_MEMORY
+/* For build speed, only include this header in builds that actually need it. */
+#include <uapi/linux/kcov.h>
+#endif
+
+#ifdef CONFIG_KCOV_MEMORY
+void _kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type);
+#else
+static __always_inline void _kcov_handle_memaccess(const volatile void *p,
+		size_t size, unsigned int type) {}
+/* Discard type argument to avoid depending on kcov header. */
+#define _kcov_handle_memaccess(p, size, type) _kcov_handle_memaccess((p), (size), 0)
+#endif
+
+#if defined(__SANITIZE_ADDRESS__) || !defined(CONFIG_KCOV_MEMORY)
+#define kcov_handle_memaccess _kcov_handle_memaccess
+#else
+static __always_inline void kcov_handle_memaccess(const volatile void *p,
+		size_t size, unsigned int type) {}
+#endif
 
 /**
  * instrument_read - instrument regular read access
@@ -24,6 +44,7 @@
  */
 static __always_inline void instrument_read(const volatile void *v, size_t size)
 {
+	kcov_handle_memaccess(v, size, 0);
 	kasan_check_read(v, size);
 	kcsan_check_read(v, size);
 }
@@ -38,6 +59,7 @@ static __always_inline void instrument_read(const volatile void *v, size_t size)
  */
 static __always_inline void instrument_write(const volatile void *v, size_t size)
 {
+	kcov_handle_memaccess(v, size, MEMORY_ACCESS_RECORD_WRITE);
 	kasan_check_write(v, size);
 	kcsan_check_write(v, size);
 }
@@ -52,6 +74,7 @@ static __always_inline void instrument_write(const volatile void *v, size_t size
  */
 static __always_inline void instrument_read_write(const volatile void *v, size_t size)
 {
+	kcov_handle_memaccess(v, size, MEMORY_ACCESS_RECORD_RMW);
 	kasan_check_write(v, size);
 	kcsan_check_read_write(v, size);
 }
@@ -79,6 +102,7 @@ static __always_inline void instrument_atomic_check_alignment(const volatile voi
  */
 static __always_inline void instrument_atomic_read(const volatile void *v, size_t size)
 {
+	kcov_handle_memaccess(v, size, MEMORY_ACCESS_RECORD_ATOMIC);
 	kasan_check_read(v, size);
 	kcsan_check_atomic_read(v, size);
 	instrument_atomic_check_alignment(v, size);
@@ -94,6 +118,7 @@ static __always_inline void instrument_atomic_read(const volatile void *v, size_
  */
 static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
 {
+	kcov_handle_memaccess(v, size, MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACCESS_RECORD_ATOMIC);
 	kasan_check_write(v, size);
 	kcsan_check_atomic_write(v, size);
 	instrument_atomic_check_alignment(v, size);
@@ -109,6 +134,7 @@ static __always_inline void instrument_atomic_write(const volatile void *v, size
  */
 static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
 {
+	kcov_handle_memaccess(v, size, MEMORY_ACCESS_RECORD_RMW|MEMORY_ACCESS_RECORD_ATOMIC);
 	kasan_check_write(v, size);
 	kcsan_check_atomic_read_write(v, size);
 	instrument_atomic_check_alignment(v, size);
@@ -126,6 +152,7 @@ static __always_inline void instrument_atomic_read_write(const volatile void *v,
 static __always_inline void
 instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
+	kcov_handle_memaccess(from, n, 0);
 	kasan_check_read(from, n);
 	kcsan_check_read(from, n);
 	kmsan_copy_to_user(to, from, n, 0);
@@ -143,6 +170,7 @@ instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
 static __always_inline void
 instrument_copy_from_user_before(const void *to, const void __user *from, unsigned long n)
 {
+	kcov_handle_memaccess(to, n, MEMORY_ACCESS_RECORD_WRITE);
 	kasan_check_write(to, n);
 	kcsan_check_write(to, n);
 }
@@ -176,6 +204,8 @@ instrument_copy_from_user_after(const void *to, const void __user *from,
 static __always_inline void instrument_memcpy_before(void *to, const void *from,
 						     unsigned long n)
 {
+	kcov_handle_memaccess(from, n, 0);
+	kcov_handle_memaccess(to, n, MEMORY_ACCESS_RECORD_WRITE);
 	kasan_check_write(to, n);
 	kasan_check_read(from, n);
 	kcsan_check_write(to, n);
diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 357f4de8790a..e4b818df189e 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -23,6 +23,7 @@ enum kcov_mode {
 	KCOV_MODE_TRACE_CMP = 3,
 };
 
+#define KCOV_ENABLE_MEMORY (1 << 28)
 /*
  * Modifier for KCOV_MODE_TRACE_PC to record function entry/exit marked with
  * metadata bits.
@@ -31,6 +32,7 @@ enum kcov_mode {
 #define KCOV_IN_CTXSW	(1 << 30)
 
 #define KCOV_MODE_TRACE_PC_EXT (KCOV_MODE_TRACE_PC | KCOV_EXT_FORMAT)
+#define KCOV_MODE_TRACE_PC_AND_MEM (KCOV_MODE_TRACE_PC_EXT | KCOV_ENABLE_MEMORY)
 
 void kcov_task_init(struct task_struct *t);
 void kcov_task_exit(struct task_struct *t);
@@ -109,4 +111,13 @@ static inline void kcov_remote_start_usb_softirq(u64 id) {}
 static inline void kcov_remote_stop_softirq(void) {}
 
 #endif /* CONFIG_KCOV */
+
+#ifdef CONFIG_KCOV_MEMORY
+void __kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type,
+		unsigned long ret_ip);
+#else /* CONFIG_KCOV_MEMORY */
+static inline void __kcov_handle_memaccess(const volatile void *p, size_t size,
+		unsigned int type, unsigned long ret_ip) {}
+#endif /* CONFIG_KCOV_MEMORY */
+
 #endif /* _LINUX_KCOV_H */
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 75c582784055..7d7147e7b427 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -22,6 +22,7 @@ struct kcov_remote_arg {
 #define KCOV_ENABLE			_IO('c', 100)
 #define KCOV_DISABLE			_IO('c', 101)
 #define KCOV_REMOTE_ENABLE		_IOW('c', 102, struct kcov_remote_arg)
+#define KCOV_GET_MEMORY_RECORD_SIZE	_IO('c', 103)
 
 enum {
 	/*
@@ -41,6 +42,8 @@ enum {
 	 * (KCOV_RECORDFLAG_*).
 	 */
 	KCOV_TRACE_PC_EXT = 2,
+	/* Extended PC coverage mode with tracing of memory accesses. */
+	KCOV_TRACE_MEMORY_ACCESS = 3,
 };
 
 #define KCOV_RECORD_IP_MASK         0x00ffffffffffffff
@@ -50,6 +53,7 @@ enum {
 #define KCOV_RECORDFLAG_TYPE_EXIT   0x1000000000000000
 /* Summarized entry/exit events that occurred in an untraced region. */
 #define KCOV_RECORDFLAG_TYPE_EESUM  0x2000000000000000
+#define KCOV_RECORDFLAG_TYPE_MEMORY 0x3000000000000000
 
 /*
  * The format for the types of collected comparisons.
@@ -74,4 +78,24 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __u64 inst)
 	return subsys | inst;
 }
 
+/*
+ * Data format for memory access tracing mode.
+ * This is an extensible struct (it can be extended by appending elements);
+ * userspace can query the struct size used by the running kernel with
+ * KCOV_GET_MEMORY_ACCESS_RECORD_SIZE.
+ */
+#define MEMORY_ACCESS_RECORD_TYPE_MASK 0xf
+#define MEMORY_ACCESS_RECORD_TYPE_ACCESS 0x0
+/* flags for MEMORY_ACCESS_RECORD_TYPE_ACCESS */
+#define MEMORY_ACCESS_RECORD_WRITE 0x10
+#define MEMORY_ACCESS_RECORD_RMW 0x20
+#define MEMORY_ACCESS_RECORD_ATOMIC 0x40
+struct memory_access_record {
+	__aligned_u64 ip_address_and_kcov_flags;
+	__aligned_u64 data_address;
+	__u32 size;
+	__u32 flags; /* MEMORY_ACCESS_RECORD_* */
+	__aligned_u64 time;
+} __attribute__((aligned(8)));
+
 #endif /* _LINUX_KCOV_IOCTLS_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 712f0f744ec5..83e05aa61728 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -235,7 +235,8 @@ void notrace __sanitizer_cov_trace_pc(void)
 {
 	struct task_struct *cur = current;
 
-	if ((READ_ONCE(cur->kcov_mode) & ~KCOV_EXT_FORMAT) != KCOV_MODE_TRACE_PC)
+	if ((READ_ONCE(cur->kcov_mode) & ~(KCOV_ENABLE_MEMORY|KCOV_EXT_FORMAT))
+	    != KCOV_MODE_TRACE_PC)
 		return;
 	/*
 	 * No bitops are needed here for setting the record type because
@@ -258,7 +259,7 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
 	 * basic block; it should still emit a record even in classic kcov mode.
 	 */
-	if ((kcov_mode & ~(KCOV_EXT_FORMAT|KCOV_IN_CTXSW)) != KCOV_MODE_TRACE_PC)
+	if ((kcov_mode & ~(KCOV_ENABLE_MEMORY|KCOV_EXT_FORMAT|KCOV_IN_CTXSW)) != KCOV_MODE_TRACE_PC)
 		return;
 	if (kcov_mode & KCOV_IN_CTXSW) {
 		cur->kcov->suppressed_stack_delta++;
@@ -281,7 +282,7 @@ void notrace __sanitizer_cov_trace_pc_exit(void)
 	 * So unlike __sanitizer_cov_trace_pc_entry(), this PC should only be
 	 * reported in extended mode, where function exit events are recorded.
 	 */
-	if ((kcov_mode & ~KCOV_IN_CTXSW) != KCOV_MODE_TRACE_PC_EXT)
+	if ((kcov_mode & ~(KCOV_ENABLE_MEMORY|KCOV_IN_CTXSW)) != KCOV_MODE_TRACE_PC_EXT)
 		return;
 	if (kcov_mode & KCOV_IN_CTXSW) {
 		struct kcov *kcov = cur->kcov;
@@ -663,6 +664,8 @@ static int kcov_get_mode(unsigned long arg)
 #endif
 	else if (arg == KCOV_TRACE_PC_EXT)
 		return IS_ENABLED(CONFIG_KCOV_EXT_RECORDS) ? KCOV_MODE_TRACE_PC_EXT : -ENOTSUPP;
+	else if (arg == KCOV_TRACE_MEMORY_ACCESS)
+		return IS_ENABLED(CONFIG_KCOV_MEMORY) ? KCOV_MODE_TRACE_PC_AND_MEM : -ENOTSUPP;
 	else
 		return -EINVAL;
 }
@@ -803,6 +806,10 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
 		return 0;
+	case KCOV_GET_MEMORY_RECORD_SIZE:
+		if (!IS_ENABLED(CONFIG_KCOV_MEMORY))
+			return -ENOTSUPP;
+		return sizeof(struct memory_access_record);
 	default:
 		return -ENOTTY;
 	}
@@ -1171,7 +1178,8 @@ void kcov_remote_stop(void)
 	 * and kcov_remote_stop(), hence the sequence check.
 	 */
 	if (sequence == kcov->sequence && kcov->remote)
-		kcov_move_area(kcov->mode & ~KCOV_EXT_FORMAT, kcov->area, kcov->size, area);
+		kcov_move_area(kcov->mode & ~(KCOV_ENABLE_MEMORY|KCOV_EXT_FORMAT),
+			       kcov->area, kcov->size, area);
 	spin_unlock(&kcov->lock);
 
 	spin_lock(&kcov_remote_lock);
@@ -1194,6 +1202,70 @@ struct kcov_common_handle_id kcov_common_handle(void)
 }
 EXPORT_SYMBOL(kcov_common_handle);
 
+#ifdef CONFIG_KCOV_MEMORY
+static notrace bool kcov_get_memaccess_record(struct task_struct *t,
+					      struct memory_access_record **recordp)
+{
+	u64 *area = (u64 *)t->kcov_area;
+	/* The buffer was allocated for t->kcov_size unsigned longs. */
+	u64 max_pos = t->kcov_size * sizeof(unsigned long);
+	u64 count = READ_ONCE(area[0]);
+	u64 start_pos = sizeof(unsigned long) + count * sizeof(unsigned long);
+	u64 end_pos = start_pos + sizeof(struct memory_access_record);
+
+	if (unlikely(end_pos > max_pos))
+		return false;
+
+	/* See comment in kcov_add_pc_record(). */
+	WRITE_ONCE(area[0], count + sizeof(struct memory_access_record)/sizeof(unsigned long));
+	barrier();
+	*recordp = (void *)area + start_pos;
+	return true;
+}
+
+/*
+ * Memory ordering doesn't matter a lot here because timestamps aren't
+ * collected atomically with memory accesses anyway.
+ * The important things are that the clock access has to be uaccess-safe,
+ * notrace, and have high granularity.
+ */
+static notrace __always_inline u64 kcov_get_time(void)
+{
+#ifdef CONFIG_X86
+	return rdtsc_ordered();
+#else
+	return 0;
+#endif
+}
+
+void notrace __kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type,
+		unsigned long ret_ip)
+{
+	struct task_struct *t = current;
+	struct memory_access_record *record;
+	unsigned int kcov_mode = READ_ONCE(t->kcov_mode);
+
+	if (kcov_mode != KCOV_MODE_TRACE_PC_AND_MEM || !check_kcov_context(t))
+		return;
+	if (!kcov_get_memaccess_record(t, &record))
+		return;
+	*record = (struct memory_access_record) {
+		.ip_address_and_kcov_flags =
+			(ret_ip & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_MEMORY,
+		.data_address = (u64)p,
+		.size = size,
+		.flags = type,
+		.time = kcov_get_time()
+	};
+}
+
+void notrace _kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type)
+{
+	__kcov_handle_memaccess(p, size, type, _RET_IP_);
+}
+EXPORT_SYMBOL(_kcov_handle_memaccess);
+#endif /* CONFIG_KCOV_MEMORY */
+
 #ifdef CONFIG_KCOV_SELFTEST
 static void __init selftest(void)
 {
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6ddf58692b09..5de427ccc42d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2217,6 +2217,17 @@ config KCOV_ENABLE_COMPARISONS
 	  These operands can be used by fuzzing engines to improve the quality
 	  of fuzzing coverage.
 
+config KCOV_MEMORY
+	bool "Enable memory access trace collection by KCOV"
+	depends on KCOV
+	depends on KCOV_EXT_RECORDS
+	help
+	  Provide a KCOV mode which records memory access operations and allows
+	  userspace to inject execution delays to impose constraints on the
+	  order in which multithreaded execution happens.
+
+	  This is mainly useful for testing race condition bugs.
+
 config KCOV_INSTRUMENT_ALL
 	bool "Instrument all code by default"
 	depends on KCOV

-- 
2.55.0.979.g7e5102b832-goog

