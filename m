Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799139;
	b=wzaclnZyO398BDDFi4gVtg7whoykrqqyzJmV8gkk02fr26TZKKRhf06jx+jUR7s56zd1
	 JS63dFI2/G7QixVzDHxpYOdVlKeyd7SH04tE+gpLcZXUcdz4jyrYCptThhTVA4n1zHjpT
	 +wwgGMRbsv1UFenD0nMtPIGzegDGW75DmHNnbPKuPzMGgTCGBPiioHCXlf5VOJqQVWfEp
	 4eplK7I0ib4c//V3Y5aHu4yY0xpGimrWB/O6rIry8i1sAvGGEvdoc8g04sMaS4FdEsmr/
	 /m2U17JbJnwOIsccLOTrqYp3z7faFKkgtdpG5UFx7QxbTlJk8VT28czHAidCyoTxykQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vuv7EyJ3FeJLmao5XoxH0RpJWoU3/L6ji2pLxjLqoaA=;
	b=0jIsSZQHj5W/KYvq9Q+YddDso3HNDYdJNpQgXgxZ3rFJnE8a37QZK9nK1UmLm4rUu+gH
	 8ZC+0XBnGeBH0CDel1SRvwLLK2/ljDle11xanTwW+aFGeQKNBP5gfrCbjvQRz0FC7j6aq
	 BSAgWHF2VSZEWSz7V3lsd+UAtPqPqR2idN7sVh3Lez90CY/s4tTza8ItpmtN+J9Jew9w2
	 oNnilirWgexA6vRuh0/9U76FFLNShsGzjFOHeinWWCE/41qWbDeFY74fUECHbVYD+sTxb
	 fYvXtuHsaRdtdSomYu5aULU8B9PXJITnc0K41fH85836cYmimn6hNfTePZ6lXph5QCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9aayxex;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46E606A329
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 13:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D46E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9aayxex
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so523614b3a.3
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799138; x=1794403938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vuv7EyJ3FeJLmao5XoxH0RpJWoU3/L6ji2pLxjLqoaA=;
        b=s9aayxexN6E/PlRLeSSMlGqbEMWlYsHNNrpygSMotnM7aON/FyNzUmad/HwHBNm+mc
         4d/UfJ6+04LMnUfn8eEgtqDBRu83wbPggZX/qslqZRXhAfKhT3cMA3DQK6mmuZQzg1o4
         Qqb8eLouE4kpacd4Uel9DoojLlCS+ji9F4ZbfLeNScC8+GvSJLjA75MWYgKkRVGlccik
         OI+FDb+l1p9Siv3tkXesJIATHOsN5CtytsBH4rlJZN8QO63q4OiTuvmjV7UdQI51vCl5
         vnviG/8Af3eeaG9LHlAqvbaENM9bm5JC9yoyJdsjgs2gGnPgxqc3L9V742Ki/HUwE9PP
         n/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799138; x=1794403938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vuv7EyJ3FeJLmao5XoxH0RpJWoU3/L6ji2pLxjLqoaA=;
        b=FcxVpt28kiFnLO+Kbpreobr1vAAf/51f3FycRqjVSeIdeDiCS2dncapKTpNF8AjbXo
         rWpc7iF+VajD6QdYna9uUuDZ05IUUyWxMrRi9xnT4IniH5yd1xCRPLZQlAStQPg1mHhI
         I/8gvmmyISSKzZ6MCBPdmTJCsZnNXHUBuqWfYaFcGgUxHycT4wE1pBY+YjAFLKjh5uNB
         yinZ9L2PaP+O8ZriUxa4cg0qF1TRueZwCFWIZLq5aPSnj7vi2ggj/d+uwqtfQtzktaV6
         SLv072lAYFYnOdrHCNhOCQglNdJxM7pB//WyZIlB83RVn21kuYRoCfALO3QfYR+xMXHB
         RVdw==
X-Forwarded-Encrypted: i=1; AKwUvBwCAuhw4NSOwSr6+i3sehSqeaMTPlS/tlV0kHM2A+DsWZymbsvVke+R1eg8MCJNa3oUoQNh@lists.linux.dev
X-Gm-Message-State: APuU4Z/czXQvFvKpY+eDni1Lria81y3vWUvztl+V55v4TFGNr6kAOeS6
	G79hjQNOEwDArVafcz8Gvy0BseVIlnAlWMUl0ByY43LSGihAdmdeyv2g
X-Gm-Gg: AYBFou01vpsKaHrfrGAj7qcz2p+xbXiQHj2gd/8EeP5Gl7XOZvQmLTQbL0OiSggiYR5
	buyp3gb0O6PqbjPvzmunyH5FBklnsd7r1bUBLgKtYnpRvcJPItNS6vZsw+7kB5q5wPIa7cZMd0H
	qmz1yOlJHZBENuy54eZViL2daSWvoy7QT+1hNwZkQAqp/221u2vHg338l5zPmD7E6EXJloJVI+K
	OQbMFr/NO/cAacBTf1O4LHmuAXSn0YMaUutWUJ/jzpWjyhwuYf8xQU3ArFFMMSqS41+pAfElTcD
	ck+9IlSc5mGwyUA/W20VRxvxXdF/MvWdcg9A0UA9ly2VIxexvzshYH9fPoBOCEhzH3zcn++2sHV
	NMTbPRfnWM83pSJPusspa0X7VzkEhbma8rY1O5N6RmIekOSugyu0kaghuTDFqGKYTb6Qj+TFaYC
	hAzlJD3Y8xZOzdoEiG7r7CETEn4AQFEtc8/xX6X3duWq2C3IPw7kZBs9cXQgZ/irD+D7E2xXo9T
	1btewnWBp1NHl+GFsQ/aPZ+JsuubB/ht69II+AqmzjjQ/Rokl/RThMbCXoh6EeywsigJ32DronU
	Ujdr8dpIJnuY79NfAEi2hOQUWKBGKeevU4U/j1LiEu3HzurJcg==
X-Received: by 2002:a05:6a00:140f:b0:89e:f8e9:205e with SMTP id d2e1a72fcca58-8a9bf71c0f3mr13345178b3a.40.1793799137622;
        Wed, 04 Nov 2026 05:32:17 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:32:17 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 01/11] objtool/klp: Fix checksums and copying of wide strings
Date: Wed,  4 Nov 2026 21:31:47 +0800
Message-ID: <20261104133158.3187525-2-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SHF_STRINGS sections can contain elements wider than one byte. Using
strlen() truncates their contents at an embedded zero byte, hiding
changes and copying incomplete strings into the patch.

Find the terminating zero element using sh_entsize. Use the resulting
length for both reference checksums and copying, and propagate errors
through checksum calculation. Keep single-byte string handling unchanged.

Add a test for two- and four-byte strings, including references from data.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. No failures.

Fixes: 0d83da43b1e1 ("objtool/klp: Add --checksum option to generate per-function checksums")
Fixes: dd590d4d57eb ("objtool/klp: Introduce klp diff subcommand for diffing object files")
Fixes: 873a2208ea31 ("objtool/klp: Calculate object checksums")
Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/elf.c                           | 29 +++++++++
 tools/objtool/include/objtool/elf.h           |  1 +
 tools/objtool/klp-checksum.c                  | 44 ++++++++-----
 tools/objtool/klp-diff.c                      | 14 ++--
 .../tests/generic/fixtures/identity/common.h  | 15 +++++
 .../generic/fixtures/identity/wide_string.c   | 36 ++++++++++
 .../generic/test-checksum-wide-string.sh      | 39 +++++++++++
 tools/objtool/tests/identity-lib.sh           | 65 +++++++++++++++++++
 8 files changed, 223 insertions(+), 20 deletions(-)
 create mode 100644 tools/objtool/tests/generic/fixtures/identity/common.h
 create mode 100644 tools/objtool/tests/generic/fixtures/identity/wide_string.c
 create mode 100755 tools/objtool/tests/generic/test-checksum-wide-string.sh
 create mode 100644 tools/objtool/tests/identity-lib.sh

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index a791f4ea6ec1..71f1a272e468 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1382,6 +1382,35 @@ struct elf *elf_create_file(GElf_Ehdr *ehdr, const char *name)
 	return elf;
 }
 
+/* Wide strings, such as the u16 PSR setup table, end at an all-zero element. */
+ssize_t elf_string_len(struct section *sec, unsigned long offset)
+{
+	size_t entsize = sec->sh.sh_entsize, size, len;
+	const char *str;
+
+	/*
+	 * FIXME: GCC's range_string() uses a one-past-end string pointer.
+	 * strlen() reads past the section; preserve the string base and addend.
+	 */
+	if (entsize == 1)
+		return strlen(sec->data->d_buf + offset);
+
+	if (!entsize || offset >= sec_size(sec)) {
+		ERROR("%s+%#lx: invalid string offset or character size", sec->name, offset);
+		return -1;
+	}
+
+	str = sec->data->d_buf + offset;
+	size = sec_size(sec) - offset;
+	for (len = 0; size - len >= entsize; len += entsize) {
+		if (!memchr_inv(str + len, 0, entsize))
+			return len;
+	}
+
+	ERROR("%s+%#lx: unterminated string", sec->name, offset);
+	return -1;
+}
+
 unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str)
 {
 	unsigned int offset;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index a82517a76a0f..5d7ddadf9471 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -179,6 +179,7 @@ struct symbol *elf_create_section_symbol(struct elf *elf, struct section *sec);
 void *elf_add_data(struct elf *elf, struct section *sec, const void *data,
 		   size_t size);
 
+ssize_t elf_string_len(struct section *sec, unsigned long offset);
 unsigned int elf_add_string(struct elf *elf, struct section *strtab, const char *str);
 
 struct reloc *elf_create_reloc(struct elf *elf, struct section *sec,
diff --git a/tools/objtool/klp-checksum.c b/tools/objtool/klp-checksum.c
index ebe25f9c5260..efaf083c03a1 100644
--- a/tools/objtool/klp-checksum.c
+++ b/tools/objtool/klp-checksum.c
@@ -67,8 +67,8 @@ static bool is_anonymous_const_data(struct symbol *sym)
 	       (is_sec_sym(sym) || strstarts(sym->name, ".LC"));
 }
 
-static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
-				 struct instruction *insn)
+static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
+				struct instruction *insn)
 {
 	struct reloc *reloc = insn_reloc(file, insn);
 	struct alternative *alt;
@@ -77,7 +77,7 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 	static bool in_alt;
 
 	if (insn->fake)
-		return;
+		return 0;
 
 	if (!reloc) {
 		struct symbol *call_dest = insn_call_dest(insn);
@@ -135,10 +135,13 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 	offset = arch_insn_adjusted_addend(insn, reloc);
 
 	if (is_string_sec(sym->sec)) {
-		char *str;
+		ssize_t size = elf_string_len(sym->sec, sym->offset + offset);
+		const void *data;
 
-		str = sym->sec->data->d_buf + sym->offset + offset;
-		__checksum_update_insn(func, insn, str, strlen(str));
+		if (size < 0)
+			return -1;
+		data = sym->sec->data->d_buf + sym->offset + offset;
+		__checksum_update_insn(func, insn, data, size);
 		goto alts;
 	}
 
@@ -180,19 +183,22 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 			__checksum_update_insn(func, insn, &alt_group->feature,sizeof(alt_group->feature));
 
 			for (alt_insn = alt->insn; alt_insn; alt_insn = next_insn_same_sec(file, alt_insn)) {
-				checksum_update_insn(file, func, alt_insn);
+				if (checksum_update_insn(file, func, alt_insn))
+					return -1;
 				if (!alt_group->last_insn || alt_insn == alt_group->last_insn)
 					break;
 			}
 		} else {
-			checksum_update_insn(file, func, alt->insn);
+			if (checksum_update_insn(file, func, alt->insn))
+				return -1;
 		}
 
 		in_alt = false;
 	}
+	return 0;
 }
 
-static void checksum_update_object(struct objtool_file *file, struct symbol *sym)
+static int checksum_update_object(struct objtool_file *file, struct symbol *sym)
 {
 	struct reloc *reloc;
 
@@ -211,11 +217,13 @@ static void checksum_update_object(struct objtool_file *file, struct symbol *sym
 		offset = reloc_addend(reloc);
 
 		if (is_string_sec(target->sec)) {
-			char *str;
+			ssize_t size = elf_string_len(target->sec, target->offset + offset);
+			const void *data;
 
-			str = target->sec->data->d_buf + target->offset + offset;
-			__checksum_update_object(sym, sym_offset,
-						 "reloc string", str, strlen(str));
+			if (size < 0)
+				return -1;
+			data = target->sec->data->d_buf + target->offset + offset;
+			__checksum_update_object(sym, sym_offset, "reloc string", data, size);
 			continue;
 		}
 
@@ -233,6 +241,7 @@ static void checksum_update_object(struct objtool_file *file, struct symbol *sym
 		__checksum_update_object(sym, sym_offset, "reloc addend",
 					 &offset, sizeof(offset));
 	}
+	return 0;
 }
 
 int calculate_checksums(struct objtool_file *file)
@@ -256,13 +265,16 @@ int calculate_checksums(struct objtool_file *file)
 
 		if (is_func_sym(sym)) {
 			checksum_init(sym);
-			func_for_each_insn(file, sym, insn)
-				checksum_update_insn(file, sym, insn);
+			func_for_each_insn(file, sym, insn) {
+				if (checksum_update_insn(file, sym, insn))
+					return -1;
+			}
 			checksum_finish(sym);
 
 		} else if (is_object_sym(sym)) {
 			checksum_init(sym);
-			checksum_update_object(file, sym);
+			if (checksum_update_object(file, sym))
+				return -1;
 			checksum_finish(sym);
 		}
 
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 34da55e45609..6321f691adbb 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1548,12 +1548,18 @@ static int clone_reloc(struct elfs *e, struct reloc *patched_reloc,
 	 * version of the string section.  Now copy the string itself.
 	 */
 	if (is_string_sec(patched_sym->sec)) {
-		const char *str = patched_sym->sec->data->d_buf + addend;
+		ssize_t len = elf_string_len(patched_sym->sec, addend);
+		const char *str;
 
-		__dbg_clone("\"%s\"", escape_str(str));
+		if (len < 0)
+			return -1;
+		str = patched_sym->sec->data->d_buf + addend;
+		if (patched_sym->sec->sh.sh_entsize == 1)
+			__dbg_clone("\"%s\"", escape_str(str));
 
-		addend = elf_add_string(e->out, out_sym->sec, str);
-		if (addend == -1)
+		addend = ALIGN(sec_size(out_sym->sec), out_sym->sec->sh.sh_addralign);
+		if (!elf_add_data(e->out, out_sym->sec, str,
+				  len + patched_sym->sec->sh.sh_entsize))
 			return -1;
 	}
 
diff --git a/tools/objtool/tests/generic/fixtures/identity/common.h b/tools/objtool/tests/generic/fixtures/identity/common.h
new file mode 100644
index 000000000000..d0f56751fcd9
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/identity/common.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com> */
+#ifndef KLP_TEST_IDENTITY_H
+#define KLP_TEST_IDENTITY_H
+
+#ifdef __clang__
+/* Use noinline on Clang to keep calls visible in these tests. */
+#define NOIPA __attribute__((noinline))
+#else
+#define NOIPA __attribute__((noipa))
+#endif
+#define MODINFO static const char modinfo[] \
+	__attribute__((used, section(".modinfo"))) = "name=vmlinux"
+
+#endif
diff --git a/tools/objtool/tests/generic/fixtures/identity/wide_string.c b/tools/objtool/tests/generic/fixtures/identity/wide_string.c
new file mode 100644
index 000000000000..4b25781e1827
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/identity/wide_string.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com> */
+#include "common.h"
+MODINFO;
+
+#ifdef WIDE32
+#ifdef PATCHED
+#define TEXT U"\x014a\x0113\x00dc\x00a5\x006e\x0038"
+#else
+#define TEXT U"\x014a\x0113\x00dc\x00a5\x006e\x0037"
+#endif
+#else
+#ifdef PATCHED
+#define TEXT u"\x014a\x0113\x00dc\x00a5\x006e\x0038"
+#else
+#define TEXT u"\x014a\x0113\x00dc\x00a5\x006e\x0037"
+#endif
+#endif
+
+#ifdef OBJECT
+struct descriptor {
+	const void *text;
+};
+
+const struct descriptor descriptor = { TEXT };
+
+NOIPA const struct descriptor *target(void)
+{
+	return &descriptor;
+}
+#else
+NOIPA const void *target(void)
+{
+	return TEXT;
+}
+#endif
diff --git a/tools/objtool/tests/generic/test-checksum-wide-string.sh b/tools/objtool/tests/generic/test-checksum-wide-string.sh
new file mode 100755
index 000000000000..426adc42337a
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-wide-string.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com>
+# Wide strings contain zero bytes before their terminating zero element.
+. "$(dirname "$0")/../identity-lib.sh"
+
+wide_section()
+{
+	in_sections "$1" | sed 's/^ *\[[ 0-9]*\] *//' |
+		awk -v width="$width" '$7 ~ /S/ && $6+0 == width { print $1; exit }'
+}
+
+setup
+for width in 2 4; do
+	flags=()
+	[ "$width" = 4 ] && flags=(-DWIDE32)
+	build_pair identity/wide_string.c "${flags[@]}"
+	input="$(wide_section patched.o)"
+	[ -n "$input" ] || fail "missing $width-byte string section"
+
+	assert_checksum_differs target
+	run_diff
+	assert_patched target
+	output="$(wide_section out.o)"
+	[ -n "$output" ] || fail "wide string was not copied"
+	$OBJCOPY -O binary --only-section="$input" "$workdir/patched.o" "$workdir/expected.bin" ||
+		fail "cannot extract input string"
+	$OBJCOPY -O binary --only-section="$output" "$workdir/out.o" "$workdir/actual.bin" ||
+		fail "cannot extract output string"
+	cmp -s "$workdir/expected.bin" "$workdir/actual.bin" || fail "wide string was truncated"
+	partial_link "$workdir/linked.o" "$workdir/out.o" || fail "wide-string output does not link"
+
+	build_pair identity/wide_string.c "${flags[@]}" -DOBJECT
+	assert_checksum_differs descriptor
+	run_diff 255
+	assert_diff_log 'changed data: descriptor'
+done
+
+pass "wide-string checksums and copies cover every element"
diff --git a/tools/objtool/tests/identity-lib.sh b/tools/objtool/tests/identity-lib.sh
new file mode 100644
index 000000000000..fc7014a88bc8
--- /dev/null
+++ b/tools/objtool/tests/identity-lib.sh
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com>
+# Shared build helpers for the multi-TU identity fixtures.
+. "$(dirname "$0")/../lib.sh"
+
+FIXTURE_CFLAGS="$FIXTURE_CFLAGS -fno-pie -fno-pic"
+
+# build_identity_pair <none|thin|full> <extra-cflags> <fixture.c...>
+build_identity_pair()
+{
+	local mode="$1" cflags="$2" side file i
+	local CC="$CC"
+	local flags=() parts=() patched=()
+	shift 2
+	if [ "$mode" != none ]; then
+		clang_only "LTO fixtures require clang"
+		find_thinlto_toolchain || probe_skip "no matching clang/lld pair"
+		flags=("-flto=$mode")
+		CC="$THIN_CC"
+	fi
+	orig_obj=orig.o
+	patched_obj=patched.o
+	for side in orig patched; do
+		patched=()
+		[ "$side" = patched ] && patched=(-DPATCHED)
+		parts=()
+		i=0
+		for file in "$@"; do
+			build_one "$file" "$side-$i.o" "${flags[@]}" "${patched[@]}" $cflags
+			parts+=("$workdir/$side-$i.o")
+			i=$((i + 1))
+		done
+		if [ "$mode" = none ]; then
+			partial_link "$workdir/$side.o" "${parts[@]}" || fail "partial link failed"
+		else
+			"$THIN_LD" -r "${parts[@]}" -o "$workdir/$side.o" || fail "LTO link failed"
+		fi
+	done
+}
+
+# identity_relocs <object> <relocation-section>
+identity_relocs()
+{
+	# readelf prints the section name in single quotes.
+	in_relocs "$1" | awk -v sec="'$2'" '
+		/Relocation section/ { active = $3 == sec }
+		active && $1 ~ /^[[:xdigit:]]+$/ { print }'
+}
+
+# The fixture's function references one static in .bss, .data or .rodata.
+identity_object_for()
+{
+	identity_relocs "$1" ".rela.text.$2" | awk '
+		$5 ~ /^\.(bss|data|rodata)\./ {
+			sub(/^\.(bss|data|rodata)\./, "", $5); print $5; exit
+		}'
+}
+
+# After post-link, check the reference to the original symbol, not just its presence.
+assert_original_reference()
+{
+	identity_relocs out.o ".klp.rela.orig..text.$1" |
+		awk -v n=".klp.sym.orig.$2," 'index($5, n) == 1' | grep -q . ||
+		fail "expected '$1' to reference original '$2'"
+}
-- 
2.55.0

