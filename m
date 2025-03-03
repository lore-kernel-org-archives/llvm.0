Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B589B1E4110
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 06:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740984959; cv=none; b=tBa/4NTh1i+RtpUsFfwVCOsMzY0VtLfLcmWS4NM4NURnDYPKrRkUF22BACg3QsLBw+E8yWeEXQBzUxmlhnjqTlXr1dIcu5yw2syVaCXH0PF8s76HCJt7Epw+onQSqtT5BbNEqEupbh5OALkx+1WSUgTASWa3lpv8o/1naxV14RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740984959; c=relaxed/simple;
	bh=/mOskEeuSOoI6Ik4GZTrnIyvVE91D9OQfL2ePFfqnyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/fp31aBhpPtR4uCfcVhou+b/shG3hPMjjmlRPc7eQTxQcSVN0ky5d3feFZWupxrfXyz569cNJ58G4gH55OygJcRDQA8cXBIj5Mif3R19df+EElfoW8xAOyTr3RawXwnfUnM7HSf6yC07FS89lDr5LozLgPdFfvGYsloQCTYNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afQKvZS5; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afQKvZS5"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2feb9076cdcso6432963a91.0
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 22:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984957; x=1741589757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+TPvgOYa0/i6hWJUb51m5UVXTU1tbJahC/+FJNQh8Y=;
        b=afQKvZS5eE2UIUMnV4FQDkxz7jKTrIS4szJ3uzka41h7r8xdjW+5v4U+C8JoLBIQLn
         wFQcZghJdmm4kZOcH7LNOfi9DihJKh6KcrFaWv7gquzSdWwcSCbrRT6GyDcgv0AlhS5g
         hF1IU778cyj5LqO9+mhIWkesOBMmPvhDUVRlB7SZkkorgcHxBBTRLypN+K/Ha0mJ9AID
         Bk01dIgYtHDMUbJOQvMW4ZY6rUiUB9cXbOedkQ641Sv8opkYrMRH5bFoWVIk/1Z6EKf5
         8clDTrHSTmXxjscj2/shxOqOMI+dio0rTymdG2HT1dL3K7EbEhQRk/FFHrAdSitdJvxw
         IMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984957; x=1741589757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+TPvgOYa0/i6hWJUb51m5UVXTU1tbJahC/+FJNQh8Y=;
        b=NgqhY7EyXf/1f3MMX8rHUr9Luq3G3FFN5BF08qfJdzykBSCR2+rnRAt8MdvI6TqjVZ
         4XY/LW5k5GXYm9bLL1kd6YU2TR5E0UQB+Yt+bZHmovoDiawiqs0S/+AKehTPAnF7SC5O
         3EF+aG1FeSRUnUJGSKSKqC+Bxyk5lQZQ/jmzbapRPjxUwGY+rAwQp2O8VDFJ+2Z12fTQ
         FAiEnJ4GzbkZOFUL2hdNHjGr9J/ifLSwuOX0clBDCbPmLGzgodY8sIA6NE8qmKcICMdf
         qHXVkn1UYb7d2K8ppN1tj5J02r+WzAKBZRCuFXaKI68CXWipBcUN9VOPJ3xB6v4tJ4rx
         qfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKFveRIRuJdsyZbHXHHqjVXSAtcs45/2/itXAnsRlqm+3LJMXDpihQniu5zLBkfDeuy1OQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzlcJfOzMaL1raxxIBYExUEkfc5pj5VWV3ZUERKOeAeQZyb9yVZ
	8YRNo6E7OVXekF4GBdXklJ/iwjIGMGKA/+UFFf9DjvvzmLQdtoCj
X-Gm-Gg: ASbGncu9mLj7Ed2+sA9lfZnCVdTuOy89xiIRGUuWYvZz4wy1Yn4CGz3TBQbYm21xdPP
	fpGmAzwV+1T3PquWlHX+GlUPSUwD0WwqYf5ioIQU1aeIkepApeDiMxnnbESOk7hsKPUGOTyaJHa
	XBjFERsh+n0GPry/ITMjzKmMYAeDTFetR7s5Lrcbrw5fxMW9wfezNXcayBvemr3FY2fDP0dWhN7
	r/869AYB2L00Ekk2h6cNJx4WZhpG4X5dODs/hEfM11Nax702+zMvb3DdopUYz3Qw0ckH331Glb9
	/FNEN4s5ME66Z6Ee/exhLb37vK3+2u5CaV8iH97YQtT4um/22VXBprRPE5RSDQ==
X-Google-Smtp-Source: AGHT+IGrORT4INWtpUNjluDwXHOnFxXU+/PjylHNkD+c6r6BnZ0CyNVYuiS0gySDL2RRjqIVNqAxlA==
X-Received: by 2002:a17:90b:3c88:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2febab2ecd6mr20664608a91.7.1740984956958;
        Sun, 02 Mar 2025 22:55:56 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:55:56 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 2/4] add per-function metadata storage support
Date: Mon,  3 Mar 2025 14:53:43 +0800
Message-Id: <20250303065345.229298-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303065345.229298-1-dongml2@chinatelecom.cn>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, there isn't a way to set and get per-function metadata with
a low overhead, which is not convenient for some situations. Take
BPF trampoline for example, we need to create a trampoline for each
kernel function, as we have to store some information of the function
to the trampoline, such as BPF progs, function arg count, etc. The
performance overhead and memory consumption can be higher to create
these trampolines. With the supporting of per-function metadata storage,
we can store these information to the metadata, and create a global BPF
trampoline for all the kernel functions. In the global trampoline, we
get the information that we need from the function metadata through the
ip (function address) with almost no overhead.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata.

Support per-function metadata storage in the function padding, and
previous discussion can be found in [1]. Generally speaking, we have two
way to implement this feature:

1. Create a function metadata array, and prepend a insn which can hold
the index of the function metadata in the array. And store the insn to
the function padding.

2. Allocate the function metadata with kmalloc(), and prepend a insn which
hold the pointer of the metadata. And store the insn to the function
padding.

Compared with way 2, way 1 consume less space, but we need to do more work
on the global function metadata array. And we implement this function in
the way 1.

Link: https://lore.kernel.org/bpf/CADxym3anLzM6cAkn_z71GDd_VeKiqqk1ts=xuiP7pr4PO6USPA@mail.gmail.com/ [1]
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v2:
- add supporting for arm64
- split out arch relevant code
- refactor the commit log
---
 include/linux/kfunc_md.h |  25 ++++
 kernel/Makefile          |   1 +
 kernel/trace/Makefile    |   1 +
 kernel/trace/kfunc_md.c  | 239 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 266 insertions(+)
 create mode 100644 include/linux/kfunc_md.h
 create mode 100644 kernel/trace/kfunc_md.c

diff --git a/include/linux/kfunc_md.h b/include/linux/kfunc_md.h
new file mode 100644
index 000000000000..df616f0fcb36
--- /dev/null
+++ b/include/linux/kfunc_md.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KFUNC_MD_H
+#define _LINUX_KFUNC_MD_H
+
+#include <linux/kernel.h>
+
+struct kfunc_md {
+	int users;
+	/* we can use this field later, make sure it is 8-bytes aligned
+	 * for now.
+	 */
+	int pad0;
+	void *func;
+};
+
+extern struct kfunc_md *kfunc_mds;
+
+struct kfunc_md *kfunc_md_find(void *ip);
+struct kfunc_md *kfunc_md_get(void *ip);
+void kfunc_md_put(struct kfunc_md *meta);
+void kfunc_md_put_by_ip(void *ip);
+void kfunc_md_lock(void);
+void kfunc_md_unlock(void);
+
+#endif
diff --git a/kernel/Makefile b/kernel/Makefile
index 87866b037fbe..7435674d5da3 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_TRACE_CLOCK) += trace/
 obj-$(CONFIG_RING_BUFFER) += trace/
 obj-$(CONFIG_TRACEPOINTS) += trace/
 obj-$(CONFIG_RETHOOK) += trace/
+obj-$(CONFIG_FUNCTION_METADATA) += trace/
 obj-$(CONFIG_IRQ_WORK) += irq_work.o
 obj-$(CONFIG_CPU_PM) += cpu_pm.o
 obj-$(CONFIG_BPF) += bpf/
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 057cd975d014..9780ee3f8d8d 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_FTRACE_RECORD_RECURSION) += trace_recursion_record.o
 obj-$(CONFIG_FPROBE) += fprobe.o
 obj-$(CONFIG_RETHOOK) += rethook.o
 obj-$(CONFIG_FPROBE_EVENTS) += trace_fprobe.o
+obj-$(CONFIG_FUNCTION_METADATA) += kfunc_md.o
 
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 obj-$(CONFIG_RV) += rv/
diff --git a/kernel/trace/kfunc_md.c b/kernel/trace/kfunc_md.c
new file mode 100644
index 000000000000..7ec25bcf778d
--- /dev/null
+++ b/kernel/trace/kfunc_md.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/slab.h>
+#include <linux/memory.h>
+#include <linux/rcupdate.h>
+#include <linux/ftrace.h>
+#include <linux/kfunc_md.h>
+
+#define ENTRIES_PER_PAGE (PAGE_SIZE / sizeof(struct kfunc_md))
+
+static u32 kfunc_md_count = ENTRIES_PER_PAGE, kfunc_md_used;
+struct kfunc_md __rcu *kfunc_mds;
+EXPORT_SYMBOL_GPL(kfunc_mds);
+
+static DEFINE_MUTEX(kfunc_md_mutex);
+
+
+void kfunc_md_unlock(void)
+{
+	mutex_unlock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_unlock);
+
+void kfunc_md_lock(void)
+{
+	mutex_lock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_lock);
+
+static u32 kfunc_md_get_index(void *ip)
+{
+	return *(u32 *)(ip - KFUNC_MD_DATA_OFFSET);
+}
+
+static void kfunc_md_init(struct kfunc_md *mds, u32 start, u32 end)
+{
+	u32 i;
+
+	for (i = start; i < end; i++)
+		mds[i].users = 0;
+}
+
+static int kfunc_md_page_order(void)
+{
+	return fls(DIV_ROUND_UP(kfunc_md_count, ENTRIES_PER_PAGE)) - 1;
+}
+
+/* Get next usable function metadata. On success, return the usable
+ * kfunc_md and store the index of it to *index. If no usable kfunc_md is
+ * found in kfunc_mds, a larger array will be allocated.
+ */
+static struct kfunc_md *kfunc_md_get_next(u32 *index)
+{
+	struct kfunc_md *new_mds, *mds;
+	u32 i, order;
+
+	mds = rcu_dereference(kfunc_mds);
+	if (mds == NULL) {
+		order = kfunc_md_page_order();
+		new_mds = (void *)__get_free_pages(GFP_KERNEL, order);
+		if (!new_mds)
+			return NULL;
+		kfunc_md_init(new_mds, 0, kfunc_md_count);
+		/* The first time to initialize kfunc_mds, so it is not
+		 * used anywhere yet, and we can update it directly.
+		 */
+		rcu_assign_pointer(kfunc_mds, new_mds);
+		mds = new_mds;
+	}
+
+	if (likely(kfunc_md_used < kfunc_md_count)) {
+		/* maybe we can manage the used function metadata entry
+		 * with a bit map ?
+		 */
+		for (i = 0; i < kfunc_md_count; i++) {
+			if (!mds[i].users) {
+				kfunc_md_used++;
+				*index = i;
+				mds[i].users++;
+				return mds + i;
+			}
+		}
+	}
+
+	order = kfunc_md_page_order();
+	/* no available function metadata, so allocate a bigger function
+	 * metadata array.
+	 */
+	new_mds = (void *)__get_free_pages(GFP_KERNEL, order + 1);
+	if (!new_mds)
+		return NULL;
+
+	memcpy(new_mds, mds, kfunc_md_count * sizeof(*new_mds));
+	kfunc_md_init(new_mds, kfunc_md_count, kfunc_md_count * 2);
+
+	rcu_assign_pointer(kfunc_mds, new_mds);
+	synchronize_rcu();
+	free_pages((u64)mds, order);
+
+	mds = new_mds + kfunc_md_count;
+	*index = kfunc_md_count;
+	kfunc_md_count <<= 1;
+	kfunc_md_used++;
+	mds->users++;
+
+	return mds;
+}
+
+static int kfunc_md_text_poke(void *ip, void *insn, void *nop)
+{
+	void *target;
+	int ret = 0;
+	u8 *prog;
+
+	target = ip - KFUNC_MD_INSN_OFFSET;
+	mutex_lock(&text_mutex);
+	if (insn) {
+		if (!memcmp(target, insn, KFUNC_MD_INSN_SIZE))
+			goto out;
+
+		if (memcmp(target, nop, KFUNC_MD_INSN_SIZE)) {
+			ret = -EBUSY;
+			goto out;
+		}
+		prog = insn;
+	} else {
+		if (!memcmp(target, nop, KFUNC_MD_INSN_SIZE))
+			goto out;
+		prog = nop;
+	}
+
+	ret = kfunc_md_arch_poke(target, prog);
+out:
+	mutex_unlock(&text_mutex);
+	return ret;
+}
+
+static bool __kfunc_md_put(struct kfunc_md *md)
+{
+	u8 nop_insn[KFUNC_MD_INSN_SIZE];
+
+	if (WARN_ON_ONCE(md->users <= 0))
+		return false;
+
+	md->users--;
+	if (md->users > 0)
+		return false;
+
+	if (!kfunc_md_arch_exist(md->func))
+		return false;
+
+	kfunc_md_arch_nops(nop_insn);
+	/* release the metadata by recovering the function padding to NOPS */
+	kfunc_md_text_poke(md->func, NULL, nop_insn);
+	/* TODO: we need a way to shrink the array "kfunc_mds" */
+	kfunc_md_used--;
+
+	return true;
+}
+
+/* Decrease the reference of the md, release it if "md->users <= 0" */
+void kfunc_md_put(struct kfunc_md *md)
+{
+	mutex_lock(&kfunc_md_mutex);
+	__kfunc_md_put(md);
+	mutex_unlock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_put);
+
+/* Get a exist metadata by the function address, and NULL will be returned
+ * if not exist.
+ *
+ * NOTE: rcu lock should be held during reading the metadata, and
+ * kfunc_md_lock should be held if writing happens.
+ */
+struct kfunc_md *kfunc_md_find(void *ip)
+{
+	struct kfunc_md *md;
+	u32 index;
+
+	if (kfunc_md_arch_exist(ip)) {
+		index = kfunc_md_get_index(ip);
+		if (WARN_ON_ONCE(index >= kfunc_md_count))
+			return NULL;
+
+		md = rcu_dereference(kfunc_mds) + index;
+		return md;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(kfunc_md_find);
+
+void kfunc_md_put_by_ip(void *ip)
+{
+	struct kfunc_md *md;
+
+	mutex_lock(&kfunc_md_mutex);
+	md = kfunc_md_find(ip);
+	if (md)
+		__kfunc_md_put(md);
+	mutex_unlock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_put_by_ip);
+
+/* Get a exist metadata by the function address, and create one if not
+ * exist. Reference of the metadata will increase 1.
+ *
+ * NOTE: always call this function with kfunc_md_lock held, and all
+ * updating to metadata should also hold the kfunc_md_lock.
+ */
+struct kfunc_md *kfunc_md_get(void *ip)
+{
+	u8 nop_insn[KFUNC_MD_INSN_SIZE], insn[KFUNC_MD_INSN_SIZE];
+	struct kfunc_md *md;
+	u32 index;
+
+	md = kfunc_md_find(ip);
+	if (md) {
+		md->users++;
+		return md;
+	}
+
+	md = kfunc_md_get_next(&index);
+	if (!md)
+		return NULL;
+
+	kfunc_md_arch_pretend(insn, index);
+	kfunc_md_arch_nops(nop_insn);
+
+	if (kfunc_md_text_poke(ip, insn, nop_insn)) {
+		kfunc_md_used--;
+		md->users = 0;
+		return NULL;
+	}
+	md->func = ip;
+
+	return md;
+}
+EXPORT_SYMBOL_GPL(kfunc_md_get);
-- 
2.39.5

