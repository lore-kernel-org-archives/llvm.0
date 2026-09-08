Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF95921EA
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886526; cv=none; b=Fe5Mp5/k1fSYbqIwU5MHdCYi5D4OvHdsW2+1jGDK+/TgJ1sF1wT9UQfYHlaN6Y6wNzZDE76cGkb5ETXvvfjOQAWXyzuJnyef/2M3lu/WiFhHg66AFCBCXxvWkM9Dnfr/gXTDwWzXHh202Q+Tr98KSIIK0PGy4QDmIxV2AgMZbZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886526; c=relaxed/simple;
	bh=fiAhh6XY7S2/oKBgtInnYdJWgrkgs/QDWJDpJKTlPnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwdTJjoHFEGW5ZsGJqUd2cERD3+Wob7YYoazo8KpnMaloKwP9p4DSrw/j5qpelqJZeylW+dsIZ6pTPsR1n2BewLcuo2JJHSEE5hEJAEkiiBHVStETMzYQBOhCmrh5t3ezOJKDcvuCACkUGHRPkuq0FAvTNW/ux62XSR/ih4AUaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLzlNrF6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLzlNrF6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so96985e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886521; x=1789491321; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfWxGqDuvLc58Bbxh+QJEjR9j2F/HWUPaBW7tT0fnEk=;
        b=oLzlNrF6ltQrNl+NdfV5kwN3p70eJttyvvwnBnynMcLyGxjzhXWOJUuzVmNiUT666J
         2/f2W4jvm0eEicbSt/n6N0lCm//RQm+p4Su/ofO4NnPNXFbpOOg5oexDNg7DhaHqgOJc
         g1O601rvWoVmSWpqyokMhkVcTGOgUMbIVRf+MQARs3t7mf27+g+PQZl0WoaL2TXksEbv
         m4TPBf8NuKWffEqiCz6DSjOP+dl4fk4fDqbAMkGvs/155Xap15cdaKxEW8Vr48tg15TP
         D2g+EpxcTKdfZ/5IsBveVEz7C+96ey2JKwczlR+XhhJXrniwG1ssI0Nva/CYTBaV8Swd
         JUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886521; x=1789491321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfWxGqDuvLc58Bbxh+QJEjR9j2F/HWUPaBW7tT0fnEk=;
        b=pzmsKlcqBfb1f2sfOXUkZp4KPFicdw6BrKvHkQmYWdFZwhMETZy2fFZepSa7heOaK+
         PP2HAh/1s5oMM2pYWHN3sR51JaUozKdq0qDoq0XiYM1//0FGuVN58cFAoLo15X+17E2+
         fF/9BZrP1cx3MD1gMMBBz4pnYF4gQImXgpNx5oBT51F5KWIJgMnH9aBj7obiMuhJ9/84
         MR0cNDpk4zjFwvK5w16vXQbvtWakyRmC4lJ1N3RET7xmQi0C2/7S4Bk72V+cYky4D9rL
         Ifv+uIw01KtAVofRN+0t6dMssY4QAweyKkjnxBskLCFrQODyVdaH78UMaOHjSDPsmdgU
         VviA==
X-Forwarded-Encrypted: i=1; AKwUvBzTpSiOKwx7UPh/x4soqbnIorYLc7iqyiiO3h7KpEp2tzmxinOg51652UQo2vSXWRNNJqb3@lists.linux.dev
X-Gm-Message-State: AFuF++mgqiRvqpwliidfeEsdDIkMrvXogQ6ZRBBhyhoVPur9JLwtn4qD
	YfBG33ZigDNusTDaoI1C5nRqv9//4pfNMeDKs1m0Abqrr5Ei12VBfcRCEeyzYDL+zA==
X-Gm-Gg: AYBFou2EMotMPLw4pt6iZeF6Up4Zs4tvO8SrQwKxaolFqY8dr3JjdRKZRjKb8YR8gDY
	XKB8ZGl/6JPg1u3o16DPRhWIoFSpsWvnBBr6xbADkoTUoBYkhSjUJpX+qGkWzxSylSkoAdhs7xI
	ar2ZXz8+xVxOWgGAGuQPcpUV82bf4hyCMunxQXomuZQb/ZUdTS2UTDjYKjDXptO5KHrrZ6Dn2bA
	3HNSwaymI3JnVIbM/Jc/C52StSHYNE54hWU2591Cv5ih/zt2YxkoITmHCTQtMTOO2f62fiAqgHq
	BUQ2ypc7QoUeds+0yMwAf/lV3tBDVuggYtCAbhmeoCGfjGHvrfEX/XoptsLRLCTvQdnQNnw2cYv
	kBeIUd/YNrBtJWBQJahPKQUhamQZsWVbMjfdiIgy44Hs24dvXOgl23VKlOaWVvP6GFtlusHBse0
	bwUuvsh2bjbm37BO0c04qTSH0b1mOprRwpnbzAgmFpMdOFrsMZ/WnjUjjE1TsxrK81kcrf7vGaG
	cRmqvHbwpem5FWu1PM9H9aIOCzCAtUknpNd8Fpa1aYKkEuA1cgMtXNPj90=
X-Received: by 2002:a05:600c:2d82:b0:49c:ff18:79bd with SMTP id 5b1f17b1804b1-49d1f6f4369mr42055e9.9.1788886520243;
        Tue, 08 Sep 2026 09:55:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm24137705f8f.0.2026.09.08.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:19 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:51 +0200
Subject: [PATCH RFC v3 11/12] kcov: introduce delay injection
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-11-dcbc11593e88@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=18966;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=fiAhh6XY7S2/oKBgtInnYdJWgrkgs/QDWJDpJKTlPnY=;
 b=9NUnaVZzE20SqkvtMF2xIxZX/9C+a0Usm4XRFtN4DW2f9/WocMCXrx32DK8J9dLHg1Ab418Sn
 c7wrHpU29zqCRTWquSMnrY7cR+s/jjhqNTQYB+qwTbeckDyGDyROmY2
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Introduce KCOV-based delay injection, which is intended for
deterministically testing race condition bugs.

Preceding patches allow userspace to record a trace of function entry/exit
events and memory access events in a multi-threaded test case.

After userspace identifies kernel memory accesses that could be part of a
race condition, userspace can use KCOV_SET_DI on the participating threads
to instruct KCOV to ensure that pairs of memory accesses execute in the
desired order.

A kcov_di_stack with type DI_STACK_WAIT instructs KCOV to spin-wait for
another kcov_di_stack (normally installed on another thread) with type
DI_STACK_WAKE and with the same flagidx.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/uapi/linux/kcov.h |  45 ++++++
 kernel/kcov.c             | 380 +++++++++++++++++++++++++++++++++++++++++++++-
 tools/objtool/check.c     |   1 +
 3 files changed, 422 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 235f73e11d59..88bd11d7d108 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -3,6 +3,7 @@
 #define _LINUX_KCOV_IOCTLS_H
 
 #include <linux/types.h>
+#include <linux/ioctl.h>
 
 /*
  * Argument for KCOV_REMOTE_ENABLE ioctl, see Documentation/dev-tools/kcov.rst
@@ -23,6 +24,10 @@ struct kcov_remote_arg {
 #define KCOV_DISABLE			_IO('c', 101)
 #define KCOV_REMOTE_ENABLE		_IOW('c', 102, struct kcov_remote_arg)
 #define KCOV_GET_MEMORY_RECORD_SIZE	_IO('c', 103)
+#define KCOV_SET_DI			_IOW('c', 104, struct kcov_set_di_arg)
+#define KCOV_RESET_DI_FLAGS		_IO('c', 105)
+#define KCOV_WAKE_DI_FLAG		_IO('c', 106)
+#define KCOV_SPINWAIT_DI_FLAG		_IO('c', 107)
 
 enum {
 	/*
@@ -54,6 +59,11 @@ enum {
 /* Summarized entry/exit events that occurred in an untraced region. */
 #define KCOV_RECORDFLAG_TYPE_EESUM  0x2000000000000000
 #define KCOV_RECORDFLAG_TYPE_MEMORY 0x3000000000000000
+/* these two record types have a flag index in the low bits */
+#define KCOV_RECORDFLAG_TYPE_WAIT   0x4000000000000000
+#define KCOV_RECORDFLAG_TYPE_WAKE   0x5000000000000000
+/* set in KCOV_RECORDFLAG_TYPE_WAIT record to mark that the wait timed out */
+#define KCOV_WAIT_TIMEOUT           0x0010000000000000
 
 /*
  * The format for the types of collected comparisons.
@@ -101,4 +111,39 @@ struct memory_access_record {
 	__aligned_u64 value;
 } __attribute__((aligned(8)));
 
+
+/*
+ * Delay Injection API
+ */
+struct kcov_di_stack_elem {
+	__aligned_u64 ip;
+	__aligned_u64 parent_idx;
+};
+enum di_stack_type {
+	DI_STACK_WAIT = 0,
+	DI_STACK_WAKE_PRE,
+	DI_STACK_WAKE_POST
+};
+struct kcov_di_stack {
+	__aligned_u64 elems;
+	__u32 num_elems;
+	enum di_stack_type type;
+	__u32 flagidx;
+};
+struct kcov_set_di_arg {
+	/*
+	 * Pointer to array of struct kcov_di_stack.
+	 * The array consists of function entry instruction addresses, with a
+	 * memory access instruction address at the end.
+	 * These must be addresses as reported in KCOV_RECORDFLAG_TYPE_ENTRY and
+	 * KCOV_RECORDFLAG_TYPE_MEMORY events (so they are not the addresses
+	 * where functions begin).
+	 */
+	__aligned_u64 stacks;
+	__u32 num_stacks;
+
+	int sync_bits_fd;
+	__aligned_u64 spin_limit;
+};
+
 #endif /* _LINUX_KCOV_IOCTLS_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index ef405940a2cb..318ae2c89891 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -32,6 +32,22 @@
 /* Number of 64-bit words written per one comparison: */
 #define KCOV_WORDS_PER_CMP 4
 
+#define NUM_SYNC_BITS 64
+
+struct di_stack_elem {
+	unsigned long ip;
+	unsigned long parent_idx;
+	unsigned long cur_parent_idx;
+};
+
+struct di_stack {
+	struct di_stack_elem *elems;
+	unsigned int num_elems;
+	enum di_stack_type type;
+	unsigned int flagidx;
+	unsigned int nomatch_depth;
+};
+
 /*
  * kcov descriptor (one per opened debugfs file).
  * State transitions of the descriptor:
@@ -78,6 +94,18 @@ struct kcov {
 	int			sequence;
 	int			suppressed_stack_delta;
 	int			suppressed_stack_mindelta;
+
+	/* delay injection */
+	struct {
+		DECLARE_BITMAP(sync_bits, NUM_SYNC_BITS);
+		struct di_stack		*match_stacks;
+		unsigned int		num_match_stacks;
+		u64			spin_limit;
+		unsigned int		stack_used;
+		unsigned int		shared_nomatch_depth;
+		unsigned int		pending_sync_bit;
+		struct kcov		*syncbits_owner;
+	} di;
 };
 
 struct kcov_remote_area {
@@ -252,12 +280,53 @@ void notrace __sanitizer_cov_trace_pc(void)
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 
 #ifdef CONFIG_KCOV_EXT_RECORDS
+static void notrace kcov_di_enter_slowpath(struct kcov *kcov, unsigned long ip)
+{
+	unsigned int i;
+	bool no_matches = true;
+
+	for (int need_increments = 0; need_increments < 2; need_increments++) {
+		for (i = 0; i < kcov->di.num_match_stacks; i++) {
+			struct di_stack *dis = &kcov->di.match_stacks[i];
+			struct di_stack_elem *next_elem;
+
+			if (dis->nomatch_depth || kcov->di.stack_used >= dis->num_elems-1) {
+no_match:
+				if (need_increments)
+					dis->nomatch_depth++;
+				continue;
+			}
+			next_elem = &dis->elems[kcov->di.stack_used];
+			if (next_elem->ip != ip)
+				goto no_match;
+			if (need_increments == 0)
+				next_elem->cur_parent_idx++;
+			if (next_elem->parent_idx != next_elem->cur_parent_idx-1)
+				goto no_match;
+
+			/* going a step down in the di_stack */
+			no_matches = false;
+			next_elem[1].cur_parent_idx = 0;
+		}
+
+		if (likely(need_increments == 0 && no_matches)) {
+			kcov->di.shared_nomatch_depth++;
+			return;
+		}
+		/* do second pass and increment individual nomatch counters */
+	}
+
+	kcov->di.stack_used++;
+}
+
 void notrace __sanitizer_cov_trace_pc_entry(void)
 {
 	struct task_struct *cur = current;
-	unsigned long record = canonicalize_ip(_RET_IP_);
+	unsigned long ip = canonicalize_ip(_RET_IP_);
+	unsigned long record = ip;
 	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
 	bool ext_format;
+	struct kcov *kcov;
 
 	/*
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
@@ -267,7 +336,7 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 		return;
 	if (kcov_mode & KCOV_IN_CTXSW) {
 		cur->kcov->suppressed_stack_delta++;
-		return;
+		goto handle_distack;
 	}
 	ext_format = (kcov_mode & KCOV_EXT_FORMAT) != 0;
 	if (ext_format)
@@ -278,12 +347,25 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 	 * enabled
 	 */
 	kcov_add_pc_record(cur, record, ext_format, (unsigned long)__builtin_return_address(1));
+
+handle_distack:
+	if (IS_ENABLED(CONFIG_KCOV_MEMORY)) {
+		kcov = cur->kcov;
+		if (unlikely(kcov->di.num_match_stacks)) {
+			if (likely(kcov->di.shared_nomatch_depth > 0)) {
+				kcov->di.shared_nomatch_depth++;
+			} else {
+				kcov_di_enter_slowpath(kcov, ip);
+			}
+		}
+	}
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
 	struct task_struct *cur = current;
 	unsigned long record;
 	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
+	struct kcov *kcov;
 
 	/*
 	 * This hook is not called at the beginning of a basic block; the basic
@@ -300,10 +382,31 @@ void notrace __sanitizer_cov_trace_pc_exit(void)
 		if (kcov->suppressed_stack_mindelta == kcov->suppressed_stack_delta)
 			kcov->suppressed_stack_mindelta--;
 		kcov->suppressed_stack_delta--;
-		return;
+		goto handle_distack;
 	}
 	record = (canonicalize_ip(_RET_IP_) & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_EXIT;
 	kcov_add_pc_record(cur, record, false, 0);
+
+handle_distack:
+	if (IS_ENABLED(CONFIG_KCOV_MEMORY)) {
+		kcov = cur->kcov;
+		if (unlikely(kcov->di.num_match_stacks)) {
+			if (likely(kcov->di.shared_nomatch_depth > 0)) {
+				kcov->di.shared_nomatch_depth--;
+			} else {
+				unsigned int i;
+
+				if (kcov->di.stack_used)
+					kcov->di.stack_used--;
+				for (i = 0; i < kcov->di.num_match_stacks; i++) {
+					struct di_stack *dis = &kcov->di.match_stacks[i];
+
+					if (dis->nomatch_depth > 0)
+						dis->nomatch_depth--;
+				}
+			}
+		}
+	}
 }
 #endif
 
@@ -458,6 +561,17 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 			unsigned int size, void *area, unsigned int mode,
 			int sequence)
 {
+	int i;
+
+	if (IS_ENABLED(CONFIG_KCOV_MEMORY)) {
+		/* delay injection */
+		kcov->di.stack_used = 0;
+		kcov->di.shared_nomatch_depth = 0;
+		kcov->di.pending_sync_bit = UINT_MAX;
+		for (i = 0; i < kcov->di.num_match_stacks; i++)
+			kcov->di.match_stacks[i].elems[0].cur_parent_idx = 0;
+	}
+
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
 	t->kcov = kcov;
 	/* Cache in task struct for performance. */
@@ -547,6 +661,15 @@ static void kcov_get(struct kcov *kcov)
 	refcount_inc(&kcov->refcount);
 }
 
+static void free_di_stacks(struct di_stack *di_stacks, unsigned int num_stacks)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_stacks; i++)
+		kfree(di_stacks[i].elems);
+	kfree(di_stacks);
+}
+
 static void kcov_put(struct kcov *kcov)
 {
 	if (refcount_dec_and_test(&kcov->refcount)) {
@@ -555,6 +678,11 @@ static void kcov_put(struct kcov *kcov)
 			kcov_remote_reset(kcov);
 			vfree(kcov->area);
 		);
+		if (IS_ENABLED(CONFIG_KCOV_MEMORY)) {
+			free_di_stacks(kcov->di.match_stacks, kcov->di.num_match_stacks);
+			if (kcov->di.syncbits_owner && kcov->di.syncbits_owner != kcov)
+				kcov_put(kcov->di.syncbits_owner);
+		}
 		kfree(kcov);
 	}
 }
@@ -825,9 +953,180 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 	}
 }
 
+static const struct file_operations kcov_fops;
+
+static int kcov_set_delay_injection(struct kcov *kcov, unsigned long arg_uaddr)
+{
+	struct kcov_set_di_arg arg;
+	struct di_stack *di_stacks;
+	int i, j;
+	int ret;
+	unsigned long flags;
+	struct file *syncbits_owner_file;
+	struct kcov *syncbits_owner;
+
+	if (!IS_ENABLED(CONFIG_KCOV_MEMORY))
+		return -ENOTSUPP;
+	if (copy_from_user(&arg, (void __user *)arg_uaddr, sizeof(arg)))
+		return -EFAULT;
+	if (arg.num_stacks > 128)
+		return -ERANGE;
+
+	/*
+	 * This feature *intentionally* allows forcing the kernel to spinloop
+	 * for a long time, including in contexts in which that would normally
+	 * be a terrible idea.
+	 * To prevent the user from causing a persistent system hang with this,
+	 * cap the number of spinloop iterations.
+	 */
+	if (arg.spin_limit > 10000000000)
+		return -ERANGE;
+
+	di_stacks = kmalloc_array(arg.num_stacks, sizeof(struct di_stack), GFP_KERNEL|__GFP_ZERO);
+	if (!di_stacks)
+		return -ENOMEM;
+
+	if (arg.sync_bits_fd != -1) {
+		syncbits_owner_file = fget(arg.sync_bits_fd);
+		if (!syncbits_owner_file) {
+			ret = -EBADF;
+			goto out_freestacks;
+		}
+		if (syncbits_owner_file->f_op != &kcov_fops ||
+		    syncbits_owner_file->private_data == kcov) {
+			ret = -EBADF;
+			fput(syncbits_owner_file);
+			goto out_freestacks;
+		}
+		syncbits_owner = syncbits_owner_file->private_data;
+		kcov_get(syncbits_owner);
+		fput(syncbits_owner_file);
+
+		/*
+		 * Ensure that the syncbits_owner does not, and can never,
+		 * point to yet another KCOV instance.
+		 */
+		spin_lock_irqsave(&syncbits_owner->lock, flags);
+		if (syncbits_owner->di.syncbits_owner &&
+		    syncbits_owner->di.syncbits_owner != syncbits_owner) {
+			spin_unlock_irqrestore(&syncbits_owner->lock, flags);
+			ret = -ELOOP;
+			goto out_put_syncbits_owner;
+		}
+		if (!syncbits_owner->di.syncbits_owner)
+			syncbits_owner->di.syncbits_owner = syncbits_owner;
+		spin_unlock_irqrestore(&syncbits_owner->lock, flags);
+	} else {
+		syncbits_owner = kcov;
+		kcov_get(syncbits_owner);
+	}
+
+	for (i = 0; i < arg.num_stacks; i++) {
+		struct kcov_di_stack __user *user_stackp =
+			((struct kcov_di_stack __user *)u64_to_user_ptr(arg.stacks)) + i;
+		struct kcov_di_stack u_di_stack;
+
+		if (copy_from_user(&u_di_stack, user_stackp, sizeof(struct kcov_di_stack))) {
+			ret = -EFAULT;
+			goto out_put_syncbits_owner;
+		}
+		if (u_di_stack.num_elems < 2 || u_di_stack.num_elems > 32 ||
+				u_di_stack.flagidx >= NUM_SYNC_BITS) {
+			ret = -ERANGE;
+			goto out_put_syncbits_owner;
+		}
+		if (u_di_stack.type != DI_STACK_WAIT && u_di_stack.type != DI_STACK_WAKE_PRE &&
+		    u_di_stack.type != DI_STACK_WAKE_POST) {
+			ret = -EINVAL;
+			goto out_put_syncbits_owner;
+		}
+		di_stacks[i] = (struct di_stack) {
+			.elems = kmalloc_array(u_di_stack.num_elems, sizeof(struct di_stack_elem),
+					       GFP_KERNEL),
+			.num_elems = u_di_stack.num_elems,
+			.type = u_di_stack.type,
+			.flagidx = u_di_stack.flagidx
+		};
+		if (!di_stacks[i].elems) {
+			ret = -ENOMEM;
+			goto out_put_syncbits_owner;
+		}
+		for (j = 0; j < u_di_stack.num_elems; j++) {
+			struct kcov_di_stack_elem __user *user_elemp =
+				((struct kcov_di_stack_elem __user *)u_di_stack.elems) + j;
+			struct kcov_di_stack_elem user_elem;
+
+			if (copy_from_user(&user_elem, user_elemp, sizeof(user_elem))) {
+				ret = -EFAULT;
+				goto out_put_syncbits_owner;
+			}
+			di_stacks[i].elems[j] = (struct di_stack_elem) {
+				.ip = user_elem.ip,
+				.parent_idx = user_elem.parent_idx
+			};
+		}
+	}
+
+	spin_lock_irqsave(&kcov->lock, flags);
+	if (kcov->t) {
+		ret = -EBUSY;
+	} else if (kcov->di.syncbits_owner && kcov->di.syncbits_owner != syncbits_owner) {
+		ret = -EBADFD;
+	} else {
+		/* load config */
+		free_di_stacks(kcov->di.match_stacks, kcov->di.num_match_stacks);
+		kcov->di.match_stacks = di_stacks;
+		kcov->di.num_match_stacks = arg.num_stacks;
+		kcov->di.spin_limit = arg.spin_limit;
+		if (!kcov->di.syncbits_owner) {
+			/* Avoid reference loop. */
+			if (syncbits_owner != kcov)
+				kcov_get(syncbits_owner);
+			kcov->di.syncbits_owner = syncbits_owner;
+		}
+
+		ret = 0;
+	}
+	spin_unlock_irqrestore(&kcov->lock, flags);
+
+out_put_syncbits_owner:
+	kcov_put(syncbits_owner);
+out_freestacks:
+	if (ret)
+		free_di_stacks(di_stacks, arg.num_stacks);
+	return ret;
+}
+
+static int notrace __kcov_spin_wait(struct kcov *kcov, unsigned int flagidx)
+{
+	while (!test_bit(flagidx, kcov->di.syncbits_owner->di.sync_bits)) {
+		u64 spin_limit = READ_ONCE(kcov->di.spin_limit);
+
+		if (spin_limit == 0) /* spin timeout */
+			return -ETIMEDOUT;
+		WRITE_ONCE(kcov->di.spin_limit, spin_limit - 1);
+		cpu_relax();
+	}
+	return 0;
+}
+
+/*
+ * Look up kcov->syncbits_owner in a way that is safe is @kcov is not active on
+ * the current task.
+ */
+static struct kcov *get_syncbits_owner(struct kcov *kcov)
+{
+	guard(spinlock_irqsave)(&kcov->lock);
+
+	if (!kcov->di.syncbits_owner)
+		return NULL;
+	kcov_get(kcov->di.syncbits_owner);
+	return kcov->di.syncbits_owner;
+}
+
 static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 {
-	struct kcov *kcov;
+	struct kcov *kcov, *syncbits_owner;
 	int res;
 	struct kcov_remote_arg *remote_arg = NULL;
 	unsigned int remote_num_handles;
@@ -862,6 +1161,29 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		kcov->mode = KCOV_MODE_INIT;
 		spin_unlock_irqrestore(&kcov->lock, flags);
 		return 0;
+	case KCOV_SET_DI:
+		return kcov_set_delay_injection(kcov, arg);
+	case KCOV_RESET_DI_FLAGS:
+	case KCOV_WAKE_DI_FLAG:
+	case KCOV_SPINWAIT_DI_FLAG:
+		if (!IS_ENABLED(CONFIG_KCOV_MEMORY))
+			return -ENOTSUPP;
+		if (arg >= NUM_SYNC_BITS)
+			return -EINVAL;
+		syncbits_owner = get_syncbits_owner(kcov);
+		if (!syncbits_owner)
+			return -EINVAL;
+		if (cmd == KCOV_RESET_DI_FLAGS) {
+			bitmap_clear(syncbits_owner->di.sync_bits, 0, NUM_SYNC_BITS);
+			res = 0;
+		} else if (cmd == KCOV_WAKE_DI_FLAG) {
+			set_bit(arg, syncbits_owner->di.sync_bits);
+			res = 0;
+		} else {
+			res = __kcov_spin_wait(syncbits_owner, arg);
+		}
+		kcov_put(syncbits_owner);
+		return res;
 	case KCOV_REMOTE_ENABLE:
 		if (get_user(remote_num_handles, (unsigned __user *)(arg +
 				offsetof(struct kcov_remote_arg, num_handles))))
@@ -1254,9 +1576,56 @@ void notrace __kcov_handle_memaccess(const volatile void *p, size_t size, unsign
 	struct task_struct *t = current;
 	struct memory_access_record *record;
 	unsigned int kcov_mode = READ_ONCE(t->kcov_mode);
+	struct kcov *kcov;
+	int di_wake_idx = -1;
 
 	if (kcov_mode != KCOV_MODE_TRACE_PC_AND_MEM || !check_kcov_context(t))
 		return;
+
+	kcov = t->kcov;
+	if (IS_ENABLED(CONFIG_KCOV_MEMORY) && unlikely(kcov->di.num_match_stacks)) {
+		if (unlikely(kcov->di.pending_sync_bit != UINT_MAX)) {
+			set_bit(kcov->di.pending_sync_bit, kcov->di.syncbits_owner->di.sync_bits);
+			kcov->di.pending_sync_bit = UINT_MAX;
+		}
+
+		if (unlikely(kcov->di.shared_nomatch_depth == 0)) {
+			/* similar to kcov_di_enter_slowpath */
+			unsigned int i;
+
+			for (i = 0; i < kcov->di.num_match_stacks; i++) {
+				struct di_stack *dis = &kcov->di.match_stacks[i];
+				struct di_stack_elem *elem;
+
+				if (dis->nomatch_depth || kcov->di.stack_used != dis->num_elems-1)
+					continue;
+				elem = &dis->elems[kcov->di.stack_used];
+				if (elem->ip != ret_ip)
+					continue;
+				if (elem->parent_idx != elem->cur_parent_idx++)
+					continue;
+				if (dis->type == DI_STACK_WAIT) {
+					unsigned long wait_record = KCOV_RECORDFLAG_TYPE_WAIT;
+
+					wait_record |= dis->flagidx;
+					if (__kcov_spin_wait(kcov->di.syncbits_owner, dis->flagidx))
+						wait_record |= KCOV_WAIT_TIMEOUT;
+					kcov_add_pc_record(t, wait_record, false, 0);
+				} else if (dis->type == DI_STACK_WAKE_PRE) {
+					kcov_add_pc_record(t,
+							KCOV_RECORDFLAG_TYPE_WAKE | dis->flagidx,
+							false, 0);
+					set_bit(dis->flagidx,
+						kcov->di.syncbits_owner->di.sync_bits);
+				} else {
+					/* DI_STACK_WAKE_POST */
+					di_wake_idx = dis->flagidx;
+					kcov->di.pending_sync_bit = dis->flagidx;
+				}
+			}
+		}
+	}
+
 	if (!kcov_get_memaccess_record(t, &record))
 		return;
 	*record = (struct memory_access_record) {
@@ -1287,6 +1656,9 @@ void notrace __kcov_handle_memaccess(const volatile void *p, size_t size, unsign
 		break;
 	}
 handle_fault:;
+
+	if (unlikely(di_wake_idx != -1))
+		kcov_add_pc_record(t, KCOV_RECORDFLAG_TYPE_WAKE | di_wake_idx, false, 0);
 }
 
 void notrace _kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type)
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 08ebfe1f3fac..30d748249b1c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1222,6 +1222,7 @@ static const char *uaccess_safe_builtin[] = {
 	"__kcov_handle_memaccess",
 	"__sanitizer_cov_trace_pc",
 	"__sanitizer_cov_trace_pc_entry",
+	"kcov_di_enter_slowpath",
 	"__sanitizer_cov_trace_pc_exit",
 	"__sanitizer_cov_trace_const_cmp1",
 	"__sanitizer_cov_trace_const_cmp2",

-- 
2.55.0.979.g7e5102b832-goog

