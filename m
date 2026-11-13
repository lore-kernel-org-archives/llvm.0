Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608083;
	b=uPA1+re91e34jv8CMHdBXqFept09EEt3Jo5SYLFWmRCHwxt163Yqe9iMHxL2rHhjEK+n
	 ziVa9XTPrI1BvBf9rzRSiECEYF4Aqc//mRDktKwH46/ZzMZwRoB4WJXQKAnXntf+9ZeS7
	 5vL7wh/Cid89PuGN/hTaax3YH/CLOwkhFumMbqRtJIw39F/gryRimIt+pDcayXZAGBFW3
	 2QrsDBZvoa9ICyqiDqE/TEn1dNNxaXBEh2hDXuWVqi0Ui4PiVKilG+xTUVUC5c70nxpaz
	 8w5a7epZ0VljpgZLyKpzlkNwIwVuSq6Uquz3fUMQGMKCJuT0wPeDHcRmjDLdbDnJsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=inhYO7njBxxxz63wglLKDs7vlAYadf0cFHKmRlMoUnM=;
	b=CUKjcLhagjltRaXYnlpzwQyDpcDOTo3OP5hrSFQ+a0mg9GSYei1WP8vlBgxwWc3EwprR
	 1IwwpYBN+/P0e6b4mXABBbdysDmfKBpU/7qlhjRcEhTnnqVfvNXxXtdriJlG99kRPv0Kk
	 OqwpPkEsTmu8nvRJHPpM6aQgqQa2jvVMt86EruBFbIQQqOoAfnsFTFpl3xYvYvrYAM9hX
	 XkTISQpNhctcG+ML0sFugd6ukFKfr/QvWwFeOd/vc691tWOOSHeL07erjgngcRRROB4Jr
	 cvFpQHgSNLL97f4T9mp/BU6hHC6iB3YrJQ/1I8hZiS8s2j0zulBkEbKwlg5QBeJTWFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gdvMyRWg;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31CB60A2604
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 22:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31CB60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gdvMyRWg
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1867350eec.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608082; x=1795212882; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inhYO7njBxxxz63wglLKDs7vlAYadf0cFHKmRlMoUnM=;
        b=gdvMyRWg5PwnahFTwHlNHxSAkNZqgZ4st/lJrGb/EitfX4KNzhR69XfTDdUJd93fog
         ISK1V+3OEirAAASzdX/WdRMyN6MsTuOUfmQuMk/HkS8oPgQkOXyXBW31CtWtdOuAG0qP
         ih/b0QICALpeJA1qHHkdVqdSX7Xal9a+nPNvOSPGLdIBDNafJR7WI5dvwP+j/+B/VtEF
         Sab0XMt0eJJ8fsapw8fsHoI0INNKAnb+lawkeaCcBYnZLfYXf9zm7TnigxzOFM6yr4Va
         AoSU94jeGfvZ3XQLngxdDvDQOomgQEmgJPyX/0MdXfKmDqjaK/NWxLP/bmLleojkUogf
         2PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608082; x=1795212882;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inhYO7njBxxxz63wglLKDs7vlAYadf0cFHKmRlMoUnM=;
        b=Cj8jZ8vH9ac2Pad2eH3KIfZyqyDV1nkiAYnpipDuVLJDlaGTpbrR7Wc6KStTGi65f5
         dfFBCdsLCOJdnxBcW1Lcux0APUiOHOImNfkkBpMxmdDCzacvJACpv3U+czAmTDmIBf73
         hI8N+W81R/huBBqFQOrVUE/W3yZh71alLAfc7trYasI6yQ39n/j8nBeYPmVZAKgW8mvt
         ftzjKAfooGKeusUyM2TQ4BOoVp0MtA2WRaFxVQ6hrLqyMVahA4hAYGVYTh371zDkEFzF
         ZGuW/PAo8XAsvjXjYIYaAToTxcExlSv3Xw9+ep0WYOPfWuiYIEU48Pc1y/KsSLJZzRLD
         5Isw==
X-Forwarded-Encrypted: i=1; AL+hErGG5siIYdJoMdg9ddYVT6qrFaOctmjr5rMRP2t2MWN3Ri5dT2bir5ykmxl2qLuRkaNs2XhM@lists.linux.dev
X-Gm-Message-State: APuU4Z9eEZy0NteZ0EZ4BR1DXwR/s2u/b/CXUp4Jzf/Q3QNQM4YnrE9s
	oK4TRHpj0p++WqMRLzCzIklWv8BV3gZtsSdEwBvWE859Wz2CP4SD5nmShly6IOJ2tZdPds+1xMH
	Ooe/AEmRSR4V2hg==
X-Received: from dyrp21.prod.google.com ([2002:a05:693c:69d5:b0:343:520f:7a80])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:d189:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-3796628e28amr3392731eec.19.1794608081264;
 Fri, 13 Nov 2026 14:14:41 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:53 -0800
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
Message-ID: <20261113221248.3535369-19-wusamuel@google.com>
Subject: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

libbpf parses all of /proc/kallsyms to resolve typeless ksyms.

Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
prefix matches. Ambiguous matches at different addresses fail the load.
A missing strong extern still fails and a missing weak extern is 0,
without a text scan.

On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall back
to the text parser.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 44134421bd7d..f3f3475a64d3 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -59,6 +59,34 @@
 #define BPF_FS_MAGIC		0xcafe4a11
 #endif
 
+#ifndef KALLSYMS_QUERY_BY_NAME
+/* 'f' is PROCFS_IOCTL_MAGIC */
+#define KALLSYMS_QUERY_BY_NAME	_IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0)
+
+enum kallsyms_query_flags {
+	KALLSYMS_QUERY_NAME_PREFIX = 0x01,
+};
+
+struct kallsyms_query_sym {
+	__u64 sym_addr;
+	__u64 sym_size;
+	__u64 sym_name;
+	__u64 sym_name_len;
+	__u64 sym_module;
+	__u64 sym_module_len;
+};
+
+struct kallsyms_query_by_name {
+	__u64 size;
+	__u64 query_flags;
+	__u64 query_name;
+	__u64 module_filter;
+	__u64 pos;
+	__u64 sym;
+	__u64 sym_struct_size;
+};
+#endif
+
 #define MAX_EVENT_NAME_LEN	64
 
 #define BPF_FS_DEFAULT_PATH "/sys/fs/bpf"
@@ -9421,8 +9449,75 @@ static int kallsyms_cb(unsigned long long sym_addr, char sym_type,
 	return 0;
 }
 
-static int bpf_object__read_kallsyms_file(struct bpf_object *obj)
+static int query_ksym_by_name(int fd, struct extern_desc *ext, bool lto_prefix)
+{
+	struct kallsyms_query_sym sym = {};
+	struct kallsyms_query_by_name q = {
+		.size = sizeof(q),
+		.query_flags = lto_prefix ? KALLSYMS_QUERY_NAME_PREFIX : 0,
+		.query_name = ptr_to_u64(ext->name),
+		.sym = ptr_to_u64(&sym),
+		.sym_struct_size = sizeof(sym),
+	};
+	char prefix_buf[512];
+	int n;
+
+	if (lto_prefix) {
+		n = snprintf(prefix_buf, sizeof(prefix_buf), "%s.llvm.", ext->name);
+		if (n < 0 || n >= sizeof(prefix_buf))
+			return 0;
+		q.query_name = ptr_to_u64(prefix_buf);
+	}
+
+	while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
+		if (!ext->is_set) {
+			ext->is_set = true;
+			ext->ksym.addr = sym.sym_addr;
+			pr_debug("extern (ksym) '%s': set to 0x%llx\n",
+				 ext->name, ext->ksym.addr);
+		} else if (sym.sym_addr != ext->ksym.addr) {
+			pr_warn("extern (ksym) '%s': resolution is ambiguous: 0x%llx or 0x%llx\n",
+				ext->name, ext->ksym.addr,
+				(unsigned long long)sym.sym_addr);
+			return -EADDRNOTAVAIL;
+		}
+		q.pos++;
+	}
+
+	return errno == ENOENT ? 0 : -errno;
+}
+
+static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
 {
+	struct extern_desc *ext;
+	int err = 0;
+	int fd;
+	int i;
+
+	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		err = -errno;
+		pr_warn("failed to open /proc/kallsyms: %s\n", errstr(err));
+		return err;
+	}
+
+	for (i = 0; i < obj->nr_extern && !err; i++) {
+		ext = &obj->externs[i];
+		if (ext->type != EXT_KSYM || ext->ksym.type_id)
+			continue;
+
+		/* Check exact name and then LTO .llvm.<hash> prefix */
+		err = query_ksym_by_name(fd, ext, false);
+		if (!err)
+			err = query_ksym_by_name(fd, ext, true);
+	}
+	close(fd);
+	if (!err || err == -EADDRNOTAVAIL)
+		return err;
+
+	/* Other errors (e.g. -ENOTTY, -EPERM): parse the text file */
+	pr_debug("KALLSYMS_QUERY_BY_NAME failed (%s), falling back to /proc/kallsyms\n",
+		 errstr(err));
 	return libbpf_kallsyms_parse(kallsyms_cb, obj);
 }
 
@@ -9699,7 +9794,7 @@ static int bpf_object__resolve_externs(struct bpf_object *obj,
 			return -EINVAL;
 	}
 	if (need_kallsyms) {
-		err = bpf_object__read_kallsyms_file(obj);
+		err = bpf_object__resolve_typeless_ksyms(obj);
 		if (err)
 			return -EINVAL;
 	}
-- 
2.56.0.679.gc527c65306-goog

