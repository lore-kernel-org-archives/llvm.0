Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608054;
	b=mBJGne6UAqqTUzeCcHMUpvib7/Fx8KOIXlBexmDSLKEkV/sOXBR+NDWd0YqOKXr53CMC
	 nVF+hU+A73UY9XAh+w7DlLSj7yPlKQrM4znlCkxzNl/Fg5UiAyXvSSDXNjnhva0MFKVXk
	 MW+jv64mc/Nm5vIdSgvRRK5v7j/b/jzJnVrkT7/RBEwZzDeWxMxAic5AoYJj8dqkLArtf
	 BDCRBuaViOa1Pb2LAwszvJkZwD/zEG7JBv5BCKk0WYiDKAmK1pQxKBB8QPjT55XFFcm3/
	 qaGp3mK+GTXODXPstC+2TRZiOuIRenUJXBMNT7ymKrb4QsuE6q0TV8MusWLOdUWewxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=LLJ3cebg+GMR0DqZf323f1BVgO2wgROVWBVhtbrzkjE=;
	b=wM87PAhQRYjMP1uUJ9AtBbFyRtZ2OJmXW+VN6YDR75xbnSGPyN2cIBRRl24afUMWZ041
	 X2hen0d9buSG9NVm2hr5AMbWPBtlmBAJYNwz310pU0kTlVr6mTHiSn9eq5+MR/57fdzd+
	 zu/MzG0ihkGt8J2RoL3Tf+AZq0yYIIXINqo1KPfWuQz77fCkYsDdqRkyKxHTMS1yRNb9i
	 iW/etBlvkBw5ie+qBupiDZ26bbWEOd6Ic2L73/YbBC3R/M7eJB3ck6vNMXZD58b8tzm2D
	 byW4r3pEb14QhXrP67tMVXoyW9Y3JSPtwdiRQC98/eZ8P50fKM9+EtsYU2F74cmVTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zcyna6QO;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D7A606A336
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 22:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D7A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zcyna6QO
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b63b9665so617112c88.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 14:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608052; x=1795212852; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLJ3cebg+GMR0DqZf323f1BVgO2wgROVWBVhtbrzkjE=;
        b=Zcyna6QOhNCGKJRohDSdvdgqcClqKjjqk5wIb+kQShRYCX85eL7zIreGJry565wvgM
         Exd53uWZa1fm3Bij/CzxetBlJkwa0VZ8EdypunNMWe3N7xNnSdI+WqSMNLWcDEJUBsx/
         deDXqTT7bouy8pY/FGmUcL5AUo8qfyoEQUJzXs0+eNZjkXS/szK9KBOD40ITYAes2RbZ
         l3YQRerTKVs2qPmb8EwZjIk0ML0ttUvbBPYvQBk48IFhp4ogs5oqsYLcjnyfDSpGq5gn
         ZO+SELDMWmrZZe+n4jWrTCL/9F4LRyehjQXrA1DQ9axCaxje4wITTSSnDeIVJan3KJYT
         jCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608052; x=1795212852;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLJ3cebg+GMR0DqZf323f1BVgO2wgROVWBVhtbrzkjE=;
        b=t7IYOISqsJ0JuJvNYMUW0/Ccu05I3eAK1tc0EHWZD3tEH1xBBKqupN9w1W1FmvhqEc
         nkbhXpTEWe2SfttFWeidVbUCpdZt0oNsM6RSAx/0CKNsP5jRMJrojyZGnpqjPz7JpEqd
         dRDkEQBOH6RCyikF+Cifvs8VcTjmIe1EQHINo3IjjJ0EUXi/u9C2JUTnm+6g0amB+4Ke
         k/Bx+eKLqxROQAy3d5Da3i9RvXvV2Lb5C8suMc0MBvaltUnkKfCKeBc9NR+I0JPsVkOq
         m2/0usSe8NR4Q2s3RWxgIBZ+NuhR1DhoW8Q9oxkWi0iql/7qhQYDzk9Vs4e1nURT8pJx
         4MMg==
X-Forwarded-Encrypted: i=1; AL+hErFWfWWME/5g9zyLb+4aU7ZIAf8oYYHLLvfYOM+YzwYyuKLG26zEtym5T3DCQaHU5hnaUY7D@lists.linux.dev
X-Gm-Message-State: APuU4Z9XYcASvJf5PmEulTxUrI/0cj6b8pf+FF9MQ/+ACV9sAwK5ReUh
	e58x+lwm7AHZkgbIpHFdZxM9HliNKOe8hBu+mlQI+DP6tltTJ0rXjtNcf8BBleK0DzrcmW1VBku
	4+EKWWg5hW3nmBA==
X-Received: from dlgj1-n2.prod.google.com ([2002:a05:7023:e41:20b0:1b2:3edb:a716])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:8148:20b0:143:8860:afa1 with SMTP id a92af1059eb24-1b50316df64mr3724641c88.46.1794608051839;
 Fri, 13 Nov 2026 14:14:11 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:48 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-14-wusamuel@google.com>
Subject: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME ioctl to /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

To find a few kernel symbols, users such as libbpf parse all of
/proc/kallsyms, which is several MB and text based.

Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name or
by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
and optionally in a single module with module_filter, or all modules by
default. Each call returns one match and its position; pos + 1 continues
the search, until -ENOENT. The output returns the address, the size, and
optional name and module buffers. A buffer that is too small gives
-ENAMETOOLONG and the required size.

vmlinux symbols are found with a lower-bound binary search on the sorted
names, module symbols in one pass, and ftrace, BPF, and kprobe symbols
with the per-index getters that read() uses.

For versioning, the struct carries their sizes, so the command does not
change when the struct grows.

The command uses 'f' 0x30; register 0x30 in ioctl-number.rst.

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 include/uapi/linux/fs.h                       |  43 +++
 kernel/kallsyms.c                             | 319 ++++++++++++++++++
 3 files changed, 363 insertions(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index fbc3537fc9ee..f5dbb597257a 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -250,6 +250,7 @@ Code  Seq#    Include File                                             Comments
 'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       conflict!
 'f'   10-11  linux/fs.h                                                conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
 'f'   13-27  linux/fscrypt.h
+'f'   30     linux/fs.h                                                procfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
 'g'   20-2F  linux/usb/g_printer.h
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index a46c33692aa2..987569dcdbea 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -674,6 +674,49 @@ struct procmap_query {
 	__u64 build_id_addr;		/* in */
 };
 
+/* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel addresses. */
+#define KALLSYMS_QUERY_BY_NAME	_IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL_MAGIC, 48, 0)
+
+enum kallsyms_query_flags {
+	/* Match query_name as a prefix. */
+	KALLSYMS_QUERY_NAME_PREFIX = 0x01,
+};
+
+/*
+ * Symbol returned by a query. Each buffer pointer and its *_len must both be
+ * set or both be 0. When set, the kernel sets *_len to the string size
+ * including the NUL, even if the buffer is too small and the ioctl fails with
+ * -ENAMETOOLONG. The module name of a vmlinux symbol is "".
+ */
+struct kallsyms_query_sym {
+	__u64 sym_addr;		/* out - start address */
+	__u64 sym_size;		/* out - bytes to next symbol, 0 if unknown */
+	__u64 sym_name;		/* in - user ptr to name buffer, or 0 */
+	__u64 sym_name_len;	/* in/out - buffer size / string size */
+	__u64 sym_module;	/* in - user ptr to module name buffer, or 0 */
+	__u64 sym_module_len;	/* in/out - buffer size / string size */
+};
+
+/*
+ * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PREFIX,
+ * in the entries of /proc/kallsyms, except undefined module symbols. vmlinux
+ * matches come first. A module_filter of "vmlinux" selects the core kernel.
+ *
+ * Each call returns one match and sets pos to its position, even on
+ * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, until
+ * -ENOENT. Use pos only with the same query. Matches can be skipped or
+ * repeated if symbols change between calls.
+ */
+struct kallsyms_query_by_name {
+	__u64 size;		/* in - sizeof(struct kallsyms_query_by_name) */
+	__u64 query_flags;	/* in - enum kallsyms_query_flags */
+	__u64 query_name;	/* in - user ptr to name or prefix */
+	__u64 module_filter;	/* in - user ptr to loaded module name, or 0 */
+	__u64 pos;		/* in/out - start position / match position */
+	__u64 sym;		/* in - user ptr to struct kallsyms_query_sym */
+	__u64 sym_struct_size;	/* in - sizeof(struct kallsyms_query_sym) */
+};
+
 /*
  * Shutdown the filesystem.
  */
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858af..29a9da04d8a3 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,6 +31,8 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/uaccess.h>
+#include <linux/cleanup.h>
 
 #include "kallsyms_internal.h"
 
@@ -922,11 +924,328 @@ const char *kdb_walk_kallsyms(loff_t *pos)
 }
 #endif	/* CONFIG_KGDB_KDB */
 
+struct kallsyms_sym_match {
+	unsigned long addr;
+	unsigned long size;
+	char name[KSYM_NAME_LEN];
+	char modname[MODULE_NAME_LEN];
+};
+
+static long kallsyms_copy_str_from_user(char *dst, size_t size, u64 usrc)
+{
+	long len = strncpy_from_user(dst, u64_to_user_ptr(usrc), size);
+
+	if (len < 0)
+		return len;
+	if (len == 0)
+		return -EINVAL;
+	if (len == size)
+		return -ENOENT;
+	return len;
+}
+
+static int kallsyms_copy_struct_from_user(void *kdst, size_t ksize,
+					  size_t min_size,
+					  const void __user *usrc, u64 usize)
+{
+	if (usize > PAGE_SIZE)
+		return -E2BIG;
+	if (usize < min_size)
+		return -EINVAL;
+	return copy_struct_from_user(kdst, ksize, usrc, usize);
+}
+
+static int kallsyms_copy_query_from_user(void *karg, size_t ksize,
+					 size_t min_size,
+					 const void __user *uarg)
+{
+	u64 usize;
+
+	if (copy_from_user(&usize, uarg, sizeof(usize)))
+		return -EFAULT;
+	return kallsyms_copy_struct_from_user(karg, ksize, min_size, uarg,
+					      usize);
+}
+
+static int kallsyms_copy_sym_from_user(struct kallsyms_query_sym *ksym,
+				       u64 usym, u64 usym_size)
+{
+	size_t min_size = offsetofend(struct kallsyms_query_sym,
+				      sym_module_len);
+	int err = kallsyms_copy_struct_from_user(ksym, sizeof(*ksym), min_size,
+						 u64_to_user_ptr(usym),
+						 usym_size);
+	if (err)
+		return err;
+	if (!!ksym->sym_name != !!ksym->sym_name_len ||
+	    !!ksym->sym_module != !!ksym->sym_module_len)
+		return -EINVAL;
+	return 0;
+}
+
+static int kallsyms_copy_str_to_user(u64 ubuf, u64 *ulen, const char *str)
+{
+	u64 buf_len = *ulen;
+	size_t len;
+
+	if (!ubuf)
+		return 0;
+
+	len = strlen(str) + 1;
+	*ulen = len;
+	if (buf_len < len)
+		return -ENAMETOOLONG;
+	return copy_to_user(u64_to_user_ptr(ubuf), str, len) ? -EFAULT : 0;
+}
+
+/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes. */
+static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
+				     struct kallsyms_query_sym *ksym,
+				     const struct kallsyms_sym_match *m)
+{
+	size_t copy_sz = min_t(size_t, usym_size, sizeof(*ksym));
+	bool too_long = false;
+	int err;
+
+	ksym->sym_addr = m->addr;
+	ksym->sym_size = m->size;
+	err = kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name_len,
+					m->name);
+	if (err == -EFAULT)
+		return -EFAULT;
+	too_long |= (err == -ENAMETOOLONG);
+
+	err = kallsyms_copy_str_to_user(ksym->sym_module, &ksym->sym_module_len,
+					m->modname);
+	if (err == -EFAULT)
+		return -EFAULT;
+	too_long |= (err == -ENAMETOOLONG);
+
+	if (copy_to_user(u64_to_user_ptr(usym), ksym, copy_sz))
+		return -EFAULT;
+
+	return too_long ? -ENAMETOOLONG : 0;
+}
+
+/* pos = (sec << 32) | idx. Sections start at 1, so pos 0 means start. */
+enum kallsyms_query_sec {
+	KSYM_SEC_VMLINUX = 1,
+	KSYM_SEC_MODULE,
+	KSYM_SEC_FTRACE,
+	KSYM_SEC_BPF,
+	KSYM_SEC_KPROBE,
+	KSYM_SEC_MAX,
+};
+
+static int kallsyms_find_name_vmlinux(unsigned int *idx,
+				      const struct kallsyms_name_query *q,
+				      struct kallsyms_sym_match *m)
+{
+	unsigned int high = kallsyms_num_syms;
+	unsigned int low = *idx;
+	unsigned int seq;
+
+	/* pos + 1 usually points at the next match, so try it first. */
+	if (low > 0 && low < high) {
+		int cmp;
+
+		seq = get_symbol_seq(low);
+		kallsyms_expand_symbol(get_symbol_offset(seq), m->name,
+				       KSYM_NAME_LEN);
+		cmp = strncmp(m->name, q->name, q->cmp_len);
+		if (!cmp)
+			goto found;
+		if (cmp > 0)
+			return -ENOENT;
+		low++;
+	}
+
+	while (low < high) {
+		unsigned int mid = low + (high - low) / 2;
+
+		seq = get_symbol_seq(mid);
+		kallsyms_expand_symbol(get_symbol_offset(seq), m->name,
+				       KSYM_NAME_LEN);
+		if (strncmp(m->name, q->name, q->cmp_len) < 0)
+			low = mid + 1;
+		else
+			high = mid;
+	}
+	if (low >= kallsyms_num_syms)
+		return -ENOENT;
+
+	seq = get_symbol_seq(low);
+	kallsyms_expand_symbol(get_symbol_offset(seq), m->name, KSYM_NAME_LEN);
+	if (strncmp(m->name, q->name, q->cmp_len))
+		return -ENOENT;
+
+found:
+	m->addr = kallsyms_sym_address(seq);
+	m->modname[0] = '\0';
+	*idx = low;
+	return 0;
+}
+
+static int kallsyms_find_name_other(unsigned int sec, unsigned int *idx,
+				    const struct kallsyms_name_query *q,
+				    struct kallsyms_sym_match *m)
+{
+	int exported;
+	char type;
+	int err;
+
+	if (sec == KSYM_SEC_BPF)
+		strscpy(m->modname, "bpf", MODULE_NAME_LEN);
+	else if (sec == KSYM_SEC_KPROBE)
+		strscpy(m->modname, "__builtin__kprobes", MODULE_NAME_LEN);
+
+	do {
+		if (sec == KSYM_SEC_BPF)
+			err = bpf_get_kallsym(*idx, &m->addr, &type, m->name);
+		else if (sec == KSYM_SEC_KPROBE)
+			err = kprobe_get_kallsym(*idx, &m->addr, &type, m->name);
+		else
+			err = ftrace_mod_get_kallsym(*idx, &m->addr, &type,
+						     m->name, m->modname,
+						     &exported);
+		if (!err && !strncmp(m->name, q->name, q->cmp_len))
+			return 0;
+		(*idx)++;
+	} while (!err);
+
+	return -ENOENT;
+}
+
+/* Find the first match at or after *@pos, and set *@pos to its position. */
+static int kallsyms_find_name(const struct kallsyms_name_query *q,
+			      unsigned int first_sec, unsigned int end_sec,
+			      struct kallsyms_sym_match *m, u64 *pos)
+{
+	unsigned int sec = *pos >> 32;
+	unsigned int idx = (u32)*pos;
+	unsigned long size;
+	unsigned long offset;
+	int err;
+
+	if (sec < first_sec) {
+		sec = first_sec;
+		idx = 0;
+	}
+
+	for (; sec < end_sec; sec++, idx = 0) {
+		if (sec == KSYM_SEC_VMLINUX)
+			err = kallsyms_find_name_vmlinux(&idx, q, m);
+		else if (sec == KSYM_SEC_MODULE)
+			err = module_kallsyms_find_name(&idx, q, &m->addr,
+							m->name, m->modname);
+		else
+			err = kallsyms_find_name_other(sec, &idx, q, m);
+		if (!err) {
+			/* A lookup that lands inside another symbol gives no size */
+			m->size = 0;
+			if (kallsyms_lookup_size_offset(m->addr, &size, &offset) &&
+			    !offset)
+				m->size = size;
+			*pos = ((u64)sec << 32) | idx;
+			return 0;
+		}
+	}
+	return -ENOENT;
+}
+
+struct kallsyms_query_bufs {
+	char query_name[KSYM_NAME_LEN];
+	char module_filter[MODULE_NAME_LEN];
+	struct kallsyms_sym_match m;
+};
+
+static int do_kallsyms_query_by_name(struct kallsyms_query_by_name __user *uarg)
+{
+	unsigned int first_sec = KSYM_SEC_VMLINUX;
+	unsigned int end_sec = KSYM_SEC_MAX;
+	struct kallsyms_query_by_name karg;
+	struct kallsyms_name_query q = {};
+	struct kallsyms_query_sym ksym;
+	long len;
+	int err;
+
+	err = kallsyms_copy_query_from_user(&karg, sizeof(karg),
+					    offsetofend(struct kallsyms_query_by_name,
+							sym_struct_size),
+					    uarg);
+	if (err)
+		return err;
+
+	if (karg.query_flags & ~KALLSYMS_QUERY_NAME_PREFIX)
+		return -EINVAL;
+
+	err = kallsyms_copy_sym_from_user(&ksym, karg.sym, karg.sym_struct_size);
+	if (err)
+		return err;
+
+	struct kallsyms_query_bufs *bufs __free(kfree) = kmalloc_obj(*bufs);
+	if (!bufs)
+		return -ENOMEM;
+
+	len = kallsyms_copy_str_from_user(bufs->query_name,
+					  sizeof(bufs->query_name),
+					  karg.query_name);
+	if (len < 0)
+		return len;
+
+	q.name = bufs->query_name;
+	q.cmp_len = len;
+	if (!(karg.query_flags & KALLSYMS_QUERY_NAME_PREFIX))
+		q.cmp_len++;
+
+	if (karg.module_filter) {
+		len = kallsyms_copy_str_from_user(bufs->module_filter,
+						  sizeof(bufs->module_filter),
+						  karg.module_filter);
+		if (len < 0)
+			return len;
+		if (!strcmp(bufs->module_filter, "vmlinux")) {
+			end_sec = KSYM_SEC_VMLINUX + 1;
+		} else {
+			first_sec = KSYM_SEC_MODULE;
+			end_sec = KSYM_SEC_MODULE + 1;
+			q.modname = bufs->module_filter;
+		}
+	}
+
+	err = kallsyms_find_name(&q, first_sec, end_sec, &bufs->m, &karg.pos);
+	if (err)
+		return err;
+
+	if (copy_to_user(&uarg->pos, &karg.pos, sizeof(karg.pos)))
+		return -EFAULT;
+	return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, &ksym,
+					 &bufs->m);
+}
+
+static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct seq_file *m = file->private_data;
+	struct kallsym_iter *iter = m->private;
+	void __user *uarg = (void __user *)arg;
+
+	switch (cmd) {
+	case KALLSYMS_QUERY_BY_NAME:
+		return iter->show_value ? do_kallsyms_query_by_name(uarg) : -EPERM;
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct proc_ops kallsyms_proc_ops = {
 	.proc_open	= kallsyms_open,
 	.proc_read	= seq_read,
 	.proc_lseek	= seq_lseek,
 	.proc_release	= seq_release_private,
+	.proc_ioctl	= kallsyms_ioctl,
+#ifdef CONFIG_COMPAT
+	.proc_compat_ioctl = compat_ptr_ioctl,
+#endif
 };
 
 static int __init kallsyms_init(void)
-- 
2.56.0.679.gc527c65306-goog

