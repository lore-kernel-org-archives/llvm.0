Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690434;
	b=NushuybI64HKKMvg/WeKj+rEPnFT5BNek+LOy5OjbuLCnHhGTInqn9Yrxe4WZGhNMhkL
	 d3iuu4PHZn1jdCGlu1cKJQBaoqlHaMW4VFZoIFuBRor+LYJdSXqVC+IB63BWa9V5qEpaC
	 rLHl+S0Tfs1pYcw6D2F/ebQovbMCDqiBVBGrBJMJuOlGJrgRKD8HFBapT6WjjuePZRyVo
	 DcJBTIdCrUMrd7brZZoDadCJlBun1trxHX96qlf9y1OaTAmt2mX0dzp0wYAPOcp5RITFa
	 BSMRaESwWB67E4Peak4eNRkF2hDElRQ1sy6DZFeVF+9X/yeHn2ylVMrRfhh1G48vOhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLWKll3wpoHUCYYXUcYjGv3MdRIE3PcigYZXM4He/NA=;
	b=d4ZzN0+xUVSsjiupN5wu8fw6KKbquhio5MkUo7WH16I1+BjymrFuW+pFoV88bRDxrnn9
	 HfAeDWuMtqJx6tNyXGFqaPON2PCpjMXkpc8kKUVpo5LN1t2JYhkFWDIYeX5YdjrbWa0e9
	 QihENBbdkPyCJ5nMJlZybGt1oBVxYi0i65KbZ0P8O3/nRiSB4A1j0FwFCNUw91mj5GiPy
	 RzsXK7AU0iMNmnoJEmFINB0pxAWagFSzSPlJi5LngOnvm03ndKNdwfpwDMO8RjGKT0Xla
	 MCO5dgUxXAsUHF9WKhq1NvUzJaZ/mryRJhwsPS/TpSIOxfe2MMDhxIX29D7jSGd7DUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWXENKMz;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DF606A31E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 10:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWXENKMz
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2895396a91.3
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 02:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690432; x=1796295232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLWKll3wpoHUCYYXUcYjGv3MdRIE3PcigYZXM4He/NA=;
        b=iWXENKMzb8ugwHbRX6nQjB+PFqXFXEUrQsVxbfb/lKXSlItuQlv6mHxvPdoQz0XiGf
         /idmDubscposjRkqz8Pa572/sF1ovVYOCaaOKF8t/oBNJODZM9mHIcyhp1cpUplCDY7r
         hFZhcknsGNRU/ks59NsHUt+FxkzfTMiLYiYfnpA6ah30GqGouGoDmFufW7rfhCAbflfX
         Vs++/P2W+VHzQJgDmmbdDjtArkNstC3BIuw3gTJkV9430i6FTsgT/DTHEPZTpbHen5C2
         8RBBFtDrLGjLZ1X3PRcNESglHvgMm1l+9wmNhpviZMTAEdk6LjdD6tej+ySa1xtWD7Ic
         aE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690432; x=1796295232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLWKll3wpoHUCYYXUcYjGv3MdRIE3PcigYZXM4He/NA=;
        b=eaES7dwBWalonq9vihdaRRDuWWsWXmr841mBrelPLtIt+hcl8pGbsd1XXRG/zff1G6
         dXol9LzG5u3+pghdP6+UaDvrOB83eSL/T67IFXLEZLkNr6NZ90oqo5kZ+pv4RtJ9vVaF
         ArXgV/OVcMEUJxbRy+KPlnY30rxKyURb9bfohFZoR771x5jPEvPNxJIBzJjv2sqTRy89
         RW0RAReBxFYq3/ahg0YdUFfVr0A+l1Wae4D20Pga/2kX5so3wmc16VJ7sQidkaw1L232
         rul7xY5ItQo2ZJ6KW+VR2wKw1NlfL41bqwL4O9M1Dwd25SS3nyDUU+RFJHYQkIoCdXyF
         OJpA==
X-Forwarded-Encrypted: i=1; AL+hErE106rfHiyFFbwUqEZ30YXrIw/Xen7l3ov6bBq5KjrTyXRpPEqRzGGZgbCnTu+hk8aBGi4u@lists.linux.dev
X-Gm-Message-State: APuU4Z+ACggFEpBDw8AkN3Eg+vqh/sLGtPGdHmPc6GKA/PPMkpgNPhAz
	cRPlxfisRWoSu4DFfhdZEUZ//bW/ro4J4CYoUGWyYbN7/jtfAP/snGwwnDomahJ47gQ=
X-Gm-Gg: AZFdTZc1EpRHkpWb7Uc2vx+96gAD78o2bOf6dL7oeH7/2vbk7OIeTCYQgzZ2B50clf7
	b/h20S1MqfGYWPjW2HJImGVl9iAqFJqf3J46SWg9dQdTowCe206ksJegANvo8OTOALHia027NHB
	r9BrKD3uo6mG9xUBH8zffSadACC2oKpLgvQzaB/ZBkcbvxHPBY2JxvUEVJj2FB5nkXri625SKl/
	oyJ13SNzQS70BFlIIM6gJ5vFJ661up88ngg5+r54XWO7qeTeTqFCH6BqJfQJzChITuht9jvKCg7
	yrnKa3BYETfUtgLdj9bpmaEO5r2qEQStESg0wgtlCxeez5ykbm5d3IDmKps93+VrOGwpcPZbDB3
	Ce+lxvyDWg+DR+itomXAnS7yGz0r1arv/aypSodhoK3mT14wigb7YdaI/knelbpbl9Q1Yzq8obp
	CRV/IraF6BzAaJVK4saTAQNpVOUmD6IdVkW6dRVb4MwmNEVtgQjGh/BxE5AccFVHnzW7Yj4D63j
	gqdE1GQcQyZUxzr37ByU1kn0OrQ7MxgKWFpxdRNoZJ3lmnee9XYbCUuTgAUHB/l7A2OblJyXEAW
	5+NO6eASxMYytGl3lkQJlttfKx7MfyD6eAK2oF5nBw3ERP+Zltg=
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr18727345a91.26.1795690432434;
        Thu, 26 Nov 2026 02:53:52 -0800 (PST)
Received: from anatasluo-Precision-5560 ([2408:820c:d29:db90:58ff:756e:834a:9b39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm35469676a91.2.2026.11.26.02.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:53:52 -0800 (PST)
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
Subject: [PATCH 2/2] objtool/klp: Fix string sentinels referenced through .L labels
Date: Thu, 26 Nov 2026 18:53:25 +0800
Message-ID: <20261126105325.2521938-2-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126105325.2521938-1-luolongjuna@gmail.com>
References: <20261126105325.2521938-1-luolongjuna@gmail.com>
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

String relocations can be used for string loads or sentinel checks.
For example, with GCC 16, range_string() in lib/vsprintf.c uses .LC22 + 8
as a loop bound. Treating a sentinel as the start of a string can cause
objtool to read past the end of the referenced string.

Encode each string reference as [byte offset, whole string] in the
checksum to distinguish references at different offsets.

Keep the symbol-based form for sentinel-related relocations to preserve
their offsets from the same string label. Then handle them as normal
data references.

With GCC and Clang, moving the bound from +7 to +8 changes the checksum
even though the string stays the same.

Fixes: 0d83da43b1e1 ("objtool/klp: Add --checksum option to generate per-function checksums")
Fixes: dd590d4d57eb ("objtool/klp: Introduce klp diff subcommand for diffing object files")
Fixes: 873a2208ea31 ("objtool/klp: Calculate object checksums")
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/klp-checksum.c                  | 43 ++++++++++++++-----
 tools/objtool/klp-diff.c                      | 42 +++++++++++++++---
 .../tests/generic/fixtures/checksum_insn.c    | 15 +++++++
 .../tests/generic/test-checksum-insn.sh       | 21 +++++++--
 4 files changed, 101 insertions(+), 20 deletions(-)

diff --git a/tools/objtool/klp-checksum.c b/tools/objtool/klp-checksum.c
index 2547e142794b..05437c52c26a 100644
--- a/tools/objtool/klp-checksum.c
+++ b/tools/objtool/klp-checksum.c
@@ -67,6 +67,36 @@ static bool is_anonymous_const_data(struct symbol *sym)
 	       (is_sec_sym(sym) || strstarts(sym->name, ".LC"));
 }
 
+/*
+ * Encode a string reference as [byte offset, whole string]. This can express
+ * differences in either the offset or the string.
+ *
+ * - For a string sentinel, the compiler uses this relocation for a boundary
+ *   check without reading from the referenced address.
+ * - The referenced part stays the same but the whole string changes, for
+ *   example when the code uses &s[1] and s changes from "kfree" to "vfree".
+ */
+static void checksum_update_string(struct symbol *sym, struct instruction *insn,
+				   struct reloc *reloc, s64 offset)
+{
+	struct symbol *target = reloc->sym;
+	unsigned long start = is_sec_sym(target) ? offset : target->offset;
+	s64 addend = is_sec_sym(target) ? 0 : offset;
+	const char *str = target->sec->data->d_buf + start;
+	size_t len = elf_strlen(target->sec, start);
+
+	if (insn) {
+		__checksum_update_insn(sym, insn, &addend, sizeof(addend));
+		__checksum_update_insn(sym, insn, str, len);
+	} else {
+		unsigned long sym_offset = reloc_offset(reloc) - sym->offset;
+
+		__checksum_update_object(sym, sym_offset, "reloc addend",
+					 &addend, sizeof(addend));
+		__checksum_update_object(sym, sym_offset, "reloc string", str, len);
+	}
+}
+
 static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 				 struct instruction *insn)
 {
@@ -135,11 +165,7 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 	offset = arch_insn_adjusted_addend(insn, reloc);
 
 	if (is_string_sec(sym->sec)) {
-		char *str;
-
-		str = sym->sec->data->d_buf + sym->offset + offset;
-		__checksum_update_insn(func, insn, str,
-				       elf_strlen(sym->sec, sym->offset + offset));
+		checksum_update_string(func, insn, reloc, offset);
 		goto alts;
 	}
 
@@ -212,12 +238,7 @@ static void checksum_update_object(struct objtool_file *file, struct symbol *sym
 		offset = reloc_addend(reloc);
 
 		if (is_string_sec(target->sec)) {
-			char *str;
-
-			str = target->sec->data->d_buf + target->offset + offset;
-			__checksum_update_object(sym, sym_offset,
-						 "reloc string", str,
-						 elf_strlen(target->sec, target->offset + offset));
+			checksum_update_string(sym, NULL, reloc, offset);
 			continue;
 		}
 
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index dd5c4d604be3..c32054bff84e 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -923,6 +923,7 @@ static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym
 
 	if (data_too && !is_undef_sym(patched_sym)) {
 		struct section *patched_sec = patched_sym->sec;
+		size_t sym_size = patched_sym->len;
 
 		out_sec = find_section_by_name(elf, patched_sec->name);
 		if (!out_sec) {
@@ -935,7 +936,12 @@ static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym
 				return NULL;
 		}
 
-		if (is_string_sec(patched_sym->sec)) {
+		/* String at the label will be copied as normal data. */
+		if (is_string_sec(patched_sec) && !is_sec_sym(patched_sym) && !sym_size)
+			sym_size = elf_strlen(patched_sec, patched_sym->offset) +
+				   (patched_sec->sh.sh_entsize ?: 1);
+
+		if (is_string_sec(patched_sec) && is_sec_sym(patched_sym)) {
 			out_sym = elf_create_section_symbol(elf, out_sec);
 			if (!out_sym)
 				return NULL;
@@ -946,7 +952,7 @@ static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym
 		if (!is_sec_sym(patched_sym))
 			offset = ALIGN(sec_size(out_sec), out_sec->sh.sh_addralign);
 
-		if (patched_sym->len || is_sec_sym(patched_sym)) {
+		if (sym_size || is_sec_sym(patched_sym)) {
 			void *data = NULL;
 			size_t size;
 
@@ -957,7 +963,7 @@ static struct symbol *__clone_symbol(struct elf *elf, struct symbol *patched_sym
 			if (is_sec_sym(patched_sym))
 				size = sec_size(patched_sym->sec);
 			else
-				size = patched_sym->len;
+				size = sym_size;
 
 			if (!elf_add_data(elf, out_sec, data, size))
 				return NULL;
@@ -1258,6 +1264,26 @@ static bool klp_reloc_needed(struct reloc *patched_reloc)
 	return true;
 }
 
+/*
+ * String relocations can be used for string loads or sentinel checks.
+ * For a string sentinel, we must keep its offset from the string's start.
+ * To achieve this, keep both relocations relative to the same string label
+ * when it can be identified.
+ */
+static struct symbol *find_string_label(struct reloc *reloc)
+{
+	struct symbol *sym = reloc->sym;
+	struct section *sec = sym->sec;
+
+	if (!is_string_sec(sec) || !(sec->sh.sh_flags & SHF_MERGE))
+		return NULL;
+
+	if (is_sec_sym(sym))
+		sym = find_symbol_by_offset(sec, arch_adjusted_addend(reloc));
+
+	return sym && is_local_label(sym) ? sym : NULL;
+}
+
 /* Return -1 error, 0 success, 1 skip */
 static int convert_reloc_sym_to_secsym(struct elf *elf, struct reloc *reloc)
 {
@@ -1290,6 +1316,10 @@ static int convert_reloc_secsym_to_sym(struct elf *elf, struct reloc *reloc)
 	if (sym && sym->len == sec_size(sec))
 		goto found_sym;
 
+	sym = find_string_label(reloc);
+	if (sym)
+		goto found_sym;
+
 	/* No dedicated section; find the symbol manually */
 	sym = find_symbol_containing_inclusive(sec, arch_adjusted_addend(reloc));
 	if (!sym) {
@@ -1327,7 +1357,7 @@ static int convert_reloc_secsym_to_sym(struct elf *elf, struct reloc *reloc)
 
 /*
  * Sections with anonymous or uncorrelated data (strings, UBSAN data, Clang
- * anonymous constants) need section symbol references.
+ * anonymous constants) normally use section symbol references.
  */
 static bool is_uncorrelated_section(struct section *sec)
 {
@@ -1348,7 +1378,7 @@ static int convert_reloc_sym(struct elf *elf, struct reloc *reloc)
 	if (reloc_type(reloc) == R_NONE)
 		return 1;
 
-	if (is_uncorrelated_section(sec))
+	if (is_uncorrelated_section(sec) && !find_string_label(reloc))
 		return convert_reloc_sym_to_secsym(elf, reloc);
 
 	/* Everything else: references should use named symbols. */
@@ -1599,7 +1629,7 @@ static int clone_reloc(struct elfs *e, struct reloc *patched_reloc,
 	 * "offset is outside the section".
 	 * So for this case, create temp symbol to use symbol-based relocation.
 	 */
-	if (is_string_sec(patched_sym->sec)) {
+	if (is_string_sec(patched_sym->sec) && is_sec_sym(patched_sym)) {
 		long str_off = arch_adjusted_addend(patched_reloc);
 		const char *str = patched_sym->sec->data->d_buf + str_off;
 		struct section *out_sec = out_sym->sec;
diff --git a/tools/objtool/tests/generic/fixtures/checksum_insn.c b/tools/objtool/tests/generic/fixtures/checksum_insn.c
index 70c2e9106f8a..5e794df2c7de 100644
--- a/tools/objtool/tests/generic/fixtures/checksum_insn.c
+++ b/tools/objtool/tests/generic/fixtures/checksum_insn.c
@@ -50,6 +50,21 @@ void set_priv(int i, int v)
 #define MESSAGE "original"
 #endif
 
+#ifdef STRING_END
+int walk(const char *start, const char *end);
+
+int range_string(void)
+{
+	const char *p = "[range ";
+	const char *end = p + sizeof("[range ");
+
+#if defined(MOVE_END) && !defined(PATCHED)
+	end--;
+#endif
+	return walk(p, end);
+}
+#endif
+
 int target(int x)
 {
 	int r;
diff --git a/tools/objtool/tests/generic/test-checksum-insn.sh b/tools/objtool/tests/generic/test-checksum-insn.sh
index 692ab1b174b2..08b9dafc2088 100755
--- a/tools/objtool/tests/generic/test-checksum-insn.sh
+++ b/tools/objtool/tests/generic/test-checksum-insn.sh
@@ -4,9 +4,10 @@
 # What a function's checksum has to cover beyond its instruction bytes.
 #
 # checksum_update_insn() hashes the raw bytes, and then what any relocation on
-# the instruction refers to: a string section contributes the string's
-# contents, anything else the target symbol's name and the adjusted addend,
-# with a reference to a static resolved back through its section symbol first.
+# the instruction refers to: a string section contributes the byte offset
+# within the string and its full contents, anything else the target symbol's
+# name and the adjusted addend, with a reference to a static resolved back
+# through its section symbol first.
 #
 # None of these show up in the bytes.  A rel32 operand is zero in the object
 # and supplied by the relocation, so every change below leaves the encoded
@@ -64,4 +65,18 @@ if $READELF -h "$workdir/patched.o" | grep -q 'Machine:.*X86-64'; then
 		fail "wide_string() lost its PC-relative string reference"
 fi
 
+# Place MESSAGE after "[range " to catch hashing the next literal at the loop bound.
+string_flags=(-fno-pic -fno-data-sections)
+build_pair checksum_insn.c -DSTRING_END -DSTR_CONTENT "${string_flags[@]}"
+assert_checksum_matches range_string
+
+# Move the bound from the terminating NUL to one past it.
+build_pair checksum_insn.c -DSTRING_END -DMOVE_END "${string_flags[@]}"
+assert_checksum_differs range_string
+run_diff
+section_relocs .text.range_string | awk '
+	$5 ~ /^\.L/ && $6 == "+" { base[$7] = $4 " " $5 }
+	END { exit !(0 in base && 8 in base && base[0] == base[8]) }' ||
+	fail "range_string() lost the common base of its two references"
+
 pass "instruction checksums cover reloc targets, addends and string contents"
-- 
2.53.0

