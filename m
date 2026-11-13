Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608048;
	b=BppaUhn2O5zon4kwSQD/n+CwSPqJxRwF7nKl03QREr61TWsuD/lVJeAECmCcaTZjwbvr
	 1G7CwZw1dCgnQtK3jOyTjy12rPuTmcLzULuJKwrpRKU9zSwvCcqs/OVd7f6n2BMRbx55o
	 dHrt0LfobRt6agbQyJCU9tmutNyRpQOXmXZCfH4tmSDZG2GVj8cFMhUNcGggPVCxFjbnY
	 ziPAO3GNCRqxYM11q3AV9JZ2BhVRnFvUNCsnLA6Com1BsCw9NTg/08A4Zp8OXwLblSZCa
	 cOcbm/PuA+rZSNfRmH4euc1lAKArIDtIYlgDnlvQ+qMWcuvOo1tE0Wf154AtJ3b/ocQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xRGclsVYgihn8KXrg7MdwsYc+zBVAwEON65aAassTFM=;
	b=FhjQlqtCTGsiDPGC8k49p/DHKQAiEPV5VNH14Ezl4uEzRhLFz1Bj90pLvNwneDLm0bIZ
	 6gsIxqVh7bSDRYJ2yYiFxVbG8P1YspzAiXFQL1vjnyBrnSKqcPuRE+kvAsq7is6Md1HwJ
	 p+lwHfrMBMPJxeJ8o3QMS5GoBRrDrNBlGrzWXMH/+DMxjT+UQ0+1ZYUDZ3Lh4ObRDzUEf
	 8j7twCYox+Ee9ngga4lP6HzR2+hK4DEuxYDGRKhKajFwwkom5B1pr2QHOSGf+CMotCEzd
	 Jfo7PXbJJBPjDYViaEGZ860ZZ9bJNYWpOoN8eE/ogkNnPI70fjBZiTbp6qtA3VREBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iu6wdlAn;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C3606A890
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 22:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 796C3606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iu6wdlAn
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-458326d2d9aso1826068fac.2
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 14:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608046; x=1795212846; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRGclsVYgihn8KXrg7MdwsYc+zBVAwEON65aAassTFM=;
        b=iu6wdlAnkopc5UB6j6ttdd3RiCGTSCPJahwmiJoGRZqBu08lhjQXnvf6cUdHJyXayx
         LdohTtostxtzy493eL1f0NGXfjzQVHbTxRvtlaVt6aLrGICNdMpdapM7KpMOSNuDDgTF
         DFtvqLiOORJhrGwfwLdVUAEsWB/CEMVv0tXvkerWtljBYBhfCuCNmiZczsHMynoP1zWg
         upcLKJ2Erub5iyFuq2HZ6Z58sInfeGbMx0mSiM/r5GF2/Wb0WMnBteeidgNE288bmhxf
         5CmNlGOW8PhaI0PX1f4DKpV0jD3wnI+b1DyzIcpGGMQNIRq/heqL1sJqT41c0QZkcBl+
         yGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608046; x=1795212846;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRGclsVYgihn8KXrg7MdwsYc+zBVAwEON65aAassTFM=;
        b=l6WKzhEoxgi/M66xIYW112RvaDwCzjnUZbRzNS9BWGa4TsJuy4x+OMq/Pfghs6CqpK
         9FAxIll4hMRbomgCyEJv98dgrm3A2MXkh6JZcu+dswAP9iHCw6YtnKEhAKxbkltHd2sI
         9LiDNspdGL1GL2ay/BKERiveWtjFD7k2TJSRpdjpJySroivi1M41LVnD9khQVVbBX1Gn
         n0srWuRS7fR/ZjUuYtxvHc7Wo2wpmNnRgui7oOzTdWwupKdC4Qfs0+3DGVigOyylHW85
         887nyDJ9P1eMKYrStjwvdP6jJJi6Z/WSw8+YxxJyuPJBSS1OqlTQb1tebkOJElDTgITY
         258A==
X-Forwarded-Encrypted: i=1; AL+hErF0XJGKF1lJ96ps1+q0IT09OfF75G4pqWzt8wQ83Cax0q3pyY4lnk2sVkRyKgrwTNk838MK@lists.linux.dev
X-Gm-Message-State: APuU4Z8pFYLmSqW5FtjIFByzYZhBhu92FLOmheITMMHrnxbAC+RrtyOG
	oDt+u1Tl4Uc6OKnSmR1b0vURxg7mUPGEnzwMvGG088GGS7X/vZ4V4xP29uFH4OLvsU9wP2Frm95
	8icMhp/NE4XRP3A==
X-Received: from oaoo3-n2.prod.google.com ([2002:a05:6870:c443:20b0:4ae:45bb:afee])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:c0a:b0:494:7af4:954a with SMTP id 586e51a60fabf-4afdf1706bdmr3442581fac.8.1794608045968;
 Fri, 13 Nov 2026 14:14:05 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:47 -0800
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
Message-ID: <20261113221248.3535369-13-wusamuel@google.com>
Subject: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
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

KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
symbol name or prefix across module symbols in one pass.
module_get_kallsym() walks the module list from the head and runs an
export bsearch() for every symbol index.

Add module_kallsyms_find_name(), and put the shared query struct in
linux/kallsyms.h, so we have a more efficient linear walk.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 include/linux/kallsyms.h |  7 +++++
 include/linux/module.h   | 13 +++++++++
 kernel/module/kallsyms.c | 57 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index d5dd54c53ace..d31f2f436159 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -24,6 +24,13 @@
 struct cred;
 struct module;
 
+/* Exact or prefix name query, optionally in one module. */
+struct kallsyms_name_query {
+	const char *name;
+	size_t cmp_len;		/* bytes to compare; includes NUL if exact */
+	const char *modname;	/* NULL matches any module */
+};
+
 static inline int is_kernel_text(unsigned long addr)
 {
 	if (__is_kernel_text(addr))
diff --git a/include/linux/module.h b/include/linux/module.h
index 76f4f3596477..07d5a74ecfcc 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -42,6 +42,7 @@ struct modversion_info {
 
 struct module;
 struct exception_table_entry;
+struct kallsyms_name_query;
 
 struct module_kobject {
 	struct kobject kobj;
@@ -978,6 +979,10 @@ int lookup_module_symbol_attrs(unsigned long addr,
  */
 int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 		       char *name, char *module_name, int *exported);
+int module_kallsyms_find_name(unsigned int *symnum,
+			      const struct kallsyms_name_query *q,
+			      unsigned long *value, char *name,
+			      char *module_name);
 
 /* Look for this name: can be of form module:name. */
 unsigned long module_kallsyms_lookup_name(const char *name);
@@ -1016,6 +1021,14 @@ static inline int module_get_kallsym(unsigned int symnum, unsigned long *value,
 	return -ERANGE;
 }
 
+static inline int module_kallsyms_find_name(unsigned int *symnum,
+					    const struct kallsyms_name_query *q,
+					    unsigned long *value, char *name,
+					    char *module_name)
+{
+	return -ENOENT;
+}
+
 static inline unsigned long module_kallsyms_lookup_name(const char *name)
 {
 	return 0;
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index 1ff8ce857d92..72006c9bad42 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 	return -ERANGE;
 }
 
+/**
+ * module_kallsyms_find_name - Find a module symbol by name or prefix
+ * @symnum: in: index to start at; out: index of the match. The index
+ *          counts the symbols of the searched modules in list order.
+ * @q: name query; if @q->modname is set, only that module is searched
+ * @value: set to the symbol address
+ * @name: set to the symbol name (KSYM_NAME_LEN bytes)
+ * @module_name: set to the module name (MODULE_NAME_LEN bytes)
+ *
+ * Undefined (SHN_UNDEF) symbols are skipped.
+ *
+ * Return: 0 on a match, or -ENOENT.
+ */
+int module_kallsyms_find_name(unsigned int *symnum,
+			      const struct kallsyms_name_query *q,
+			      unsigned long *value, char *name,
+			      char *module_name)
+{
+	unsigned int start = *symnum;
+	unsigned int sym_base = 0;
+	struct module *mod;
+
+	guard(rcu)();
+	list_for_each_entry_rcu(mod, &modules, list) {
+		struct mod_kallsyms *kallsyms;
+		unsigned int i = 0;
+
+		if (mod->state == MODULE_STATE_UNFORMED)
+			continue;
+		if (q->modname && strcmp(q->modname, mod->name))
+			continue;
+
+		kallsyms = rcu_dereference(mod->kallsyms);
+		if (start > sym_base)
+			i = start - sym_base;
+		for (; i < kallsyms->num_symtab; i++) {
+			const Elf_Sym *sym = &kallsyms->symtab[i];
+			const char *symname = kallsyms_symbol_name(kallsyms, i);
+
+			if (sym->st_shndx == SHN_UNDEF)
+				continue;
+			if (strncmp(symname, q->name, q->cmp_len))
+				continue;
+
+			*value = kallsyms_symbol_value(sym);
+			strscpy(name, symname, KSYM_NAME_LEN);
+			strscpy(module_name, mod->name, MODULE_NAME_LEN);
+			*symnum = sym_base + i;
+			return 0;
+		}
+		if (q->modname)
+			break;
+		sym_base += kallsyms->num_symtab;
+	}
+	return -ENOENT;
+}
+
 /* Given a module and name of symbol, find and return the symbol's value */
 static unsigned long __find_kallsyms_symbol_value(struct module *mod, const char *name)
 {
-- 
2.56.0.679.gc527c65306-goog

