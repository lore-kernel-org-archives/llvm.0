Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799193;
	b=hAN7eMVtFgYyNF/8G85Hh8sZnHNdnW+BQAoJpRKlljDZCLrC8o63oKpYKgiMahEoU3eq
	 UzGcd2lYsz6gjZo33+VT0nZ4KxDNCEtq0x0yydBkvcl3dxGkSeQUhUlkRw24OPRQeOlGp
	 lfDW+mOZk860KjhPbwdmRoDCOPESwmk1cJHLR+/YIEP85HjjUt8G4iLXu+Uc0LiD9UP66
	 b0syp7p7Tg7oOkE1kCFEsBqYjM4PDqwMbk8oz113PnshUp8MU46ZdnAKIpuskpadmkrtv
	 1/kMYiDz9Qjh4JodOy8fo9xU6x0PtRniYNPT9/AdpDDaF+B/KvhQbpJ8/Q/pKRS4T4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PdjCOxSuJpKoc4irjT2S/QzhdSHHf0OZ3GVf9cjg2xc=;
	b=RbKaxkbLDdGfWksmWhczQlMRkeQ2MvX38ioMBgSq/nAsb0SlHjJ42FWNIgOyTskXX6ef
	 LiYfrtjJXlkaDsKH+aP/UOF6b9NaflietELG4Tuvgur63U/PExRMtlPHmVHkg6HglhKBw
	 LDjwyinQ9v8u2oBa6cWBo3fJrno2F/b7cKRNde64ZPQjgzRyeSUtRJzp6iGdzsfkAxBYi
	 7sXmtZgxzHd5cytEASH+QCJVv4q6iaSebaUimdxLVLOaMGDfFifC4hw/VMU4miD1QSHMx
	 NGCfkjiY1l0+5mizP9sy8HmLXQbL0/lig7E6IMnpx6nr4768K5wkYYTO01oZTOpU7LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhRoMugk;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BB606D805
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 13:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36BB606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhRoMugk
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so342937b3a.1
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799192; x=1794403992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdjCOxSuJpKoc4irjT2S/QzhdSHHf0OZ3GVf9cjg2xc=;
        b=EhRoMugk/BuM1itgCy5z2F45hrxExAX2n6v12ySOs8NKMKJQXOZRw8pdumxQDDn8b9
         4ObReCYmXfCqBxqSOqaEzSeJG2aAqQJizItFzbHmvWow5RQ/z8i9DU2u9nIvFUxsj4tm
         Y0O3U6pI/NMowVtzo5lPhTz3xJoJkDlRDoEk0Z/VfY/ryWjBtF0brMQQaifP5NjKhIF9
         izUWqozrZXp2gZDz80wxSj0efbIa5f2pUfQUTIYXU//T3V1m3aT4+03ApwSa1dtGtd2K
         MgkwQXEy2QKsJAeSvijragAVcxnZwO4ia0YXK24mE+slcQ9CJCu1LUslEs8mVej4gqLg
         YtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799192; x=1794403992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdjCOxSuJpKoc4irjT2S/QzhdSHHf0OZ3GVf9cjg2xc=;
        b=EiAHea6oXrTmc68mTe4DFPavqkDWmmSJgn6g7iw3XruRMsrX09YtABg1L/gEIlTCu8
         A6jmjrNmk8Z4yrmxdTveilRMOApaYV1VNZciuWrkfL/ExF0QSXmRL00rJ6YmbB84Hlc/
         +Ai16BeM7/540NwXo93nmqkXuNUeZEPRa7I52k6cgUlEI+YXm1SL9lO1rD9tqeS/Ovco
         g84twwQ4g4LGBxnUFI5qTVwOfy+voyZpmKgE72SfOEd9+uVe2tRON1HOG/fxZ2QzLDQm
         3XGKgXAoBs3u2kojy0PcxB1ukv0OQRMjWHwJHwaEctKBpe1lg/7Glnuyx2IUpi/ukJjA
         5mCA==
X-Forwarded-Encrypted: i=1; AKwUvBy+euBZAuEat1gYnlwSobO/+5I62gegpzjwrIBzQhKS5/K9+JT1jpAjXWSyL08nYf2cy7aU@lists.linux.dev
X-Gm-Message-State: APuU4Z9V1jNECrLBUPxBa/iv4doQadV7Q19ZWZV5vqwFLI4AP514/++c
	tl3lqVP7o7IfsdHO9oUx233BXUxphQntIc9OHrIHjArvlTA6LzRu4HHe
X-Gm-Gg: AYBFou1cJ20XS0/ewEFy19gnIk/tS6BHCc+wSraXGK8BpWR4T7fF9MA4/Do2CzZBxyh
	gbkODhngT8coklyJr7vfRCC0ohnDlA5zRhKLhhFikf5ttjx9gtwld+O29rN1wkMcnr5ItLO9TmH
	7VndJnevx+G5mrN6Xna3teoiyjNK5wpxzE6vgKkhafAJlJ8PJfPWtIYPKR2Sq5aJq8Bi42YhRu1
	YhMLj4SC7p/AEnY4+6VLDPB7XtiiUzmBfFntBLpRz/8pnElAaXvKoOartfny6FDGaNuAIDv5C3b
	V6Hq5u7qE8gryrNiIczRL+bJkfJcwJuE4qyw+V87KVAnnIkNdPdfSXx4CyB3hcuUGr4DORMR307
	UGoOx1ldYr2uDJR0QYizATEz/+5278TA+5fFsW/QN+JDP9VaBY/uxi62E3Sj/uFK2cISqQeSLq8
	3ShFnu/YzNRANVBmzm9D16zodOoEzQ5fwgFpRoA5Lp+hHPpdYgbly5JnHM+2XYijqXrYAF1H4ip
	sgij/cxAloT45sblrbGbuEOlwlXH2+xjCeLtv+vfo9TEDg/Fv5C6TESVK8aEUFWjod+Aw0EVNoP
	JshZqtUbngaoDbk7zUPqs4H+Eg0nZV2Wt62EiAWtNKbdZcPujg==
X-Received: by 2002:a05:6a00:4fc6:b0:8a0:18bd:dd87 with SMTP id d2e1a72fcca58-8a831dbb075mr11758199b3a.18.1793799192144;
        Wed, 04 Nov 2026 05:33:12 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:33:11 -0800 (PST)
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
Subject: [RFC PATCH v2 10/11] objtool/klp: Check unmatched data references
Date: Wed,  4 Nov 2026 21:31:56 +0800
Message-ID: <20261104133158.3187525-11-luolongjuna@gmail.com>
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

An unmatched data reference can still refer to existing state. Treating
it as new can give old and patched code separate copies of that state.

For ordinary data, allow new storage only when no original identity
candidate exists. For compound literals, reuse a unique unchanged object
in both functions' references. Reject ambiguous or changed compounds;
without a source identity, additions cannot be distinguished from changes.

Report the referencing function and offset for unresolved ordinary data.
Exclude fake special-section symbols created by objtool after correlation.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. Only local-to-global-flip, sympos and sympos-vmlinux fail,
reflecting the linkage and duplicate-identity policies.

Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/klp-diff.c | 134 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index e8252e586260..19f5161420cd 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1426,6 +1426,135 @@ static int extend_twins_by_relocations(struct elfs *e)
 	return 0;
 }
 
+static int find_unique_compound_reference(struct elf *elf, struct reloc *relocs,
+					  unsigned int nr, struct symbol *sym,
+					  struct symbol **match)
+{
+	unsigned int i;
+
+	*match = NULL;
+	for (i = 0; i < nr; i++) {
+		struct reloc *reloc = &relocs[i];
+		struct symbol *target;
+
+		if (reloc_type(reloc) == R_NONE || convert_reloc_secsym_to_sym(elf, reloc))
+			continue;
+		target = reloc->sym;
+		if (!is_compound_constant(target) || target->len != sym->len ||
+		    target->csum.checksum != sym->csum.checksum)
+			continue;
+		if (*match && *match != target) {
+			ERROR("unresolved compound reference: %s matches %s[%u] and %s[%u]",
+			      sym->name, (*match)->name, (*match)->idx, target->name, target->idx);
+			return -1;
+		}
+		*match = target;
+	}
+	return 0;
+}
+
+static int resolve_compound_reference(struct elfs *e, struct symbol *sym,
+				      struct reloc *orig_relocs, unsigned int nr_orig,
+				      struct reloc *patched_relocs, unsigned int nr_patched)
+{
+	struct symbol *orig_sym, *patched_sym;
+
+	if (!sym->csum.checksum) {
+		ERROR("%s: missing compound checksum", sym->name);
+		return -1;
+	}
+
+	if (find_unique_compound_reference(e->orig, orig_relocs, nr_orig, sym, &orig_sym))
+		return -1;
+	if (!orig_sym) {
+		/*
+		 * Data changes are unsupported. With no source identity, new and
+		 * changed compound literals cannot be distinguished here.
+		 */
+		ERROR("unresolved compound reference: %s has no unchanged match", sym->name);
+		return -1;
+	}
+
+	if (find_unique_compound_reference(e->patched, patched_relocs, nr_patched,
+					   sym, &patched_sym))
+		return -1;
+	if (patched_sym != sym) {
+		ERROR("unresolved compound reference: %s is not a unique reference in its function",
+		      sym->name);
+		return -1;
+	}
+	if (orig_sym->twin) {
+		ERROR("compound twin conflict: %s[%u] paired with %s[%u]",
+		      orig_sym->name, orig_sym->idx,
+		      orig_sym->twin->name, orig_sym->twin->idx);
+		return -1;
+	}
+	sym->twin = orig_sym;
+	orig_sym->twin = sym;
+	dbg_correlate("%s(): %s[%u] -> %s[%u]", __func__,
+		      orig_sym->name, orig_sym->idx, sym->name, sym->idx);
+	return 0;
+}
+
+/*
+ * Check references to symbols without twins for ambiguity:
+ *
+ * 1. Ordinary data: allow as new only if no original identity candidates exist.
+ *    We assume DWARF identity information is stable across builds with the
+ *    same compiler.
+ * 2. Compound literals (anonymous data with static storage duration):
+ *    - delete: allowed.
+ *    - same: require a unique unchanged match in both functions' references.
+ *    - change: unsupported, to keep old and patched code's data views consistent.
+ *    - new: reject for now; it cannot be distinguished from change.
+ *      Supporting additions requires an explicit mechanism.
+ */
+static int check_unmatched_reference(struct elfs *e, struct reloc *reloc)
+{
+	struct symbol *patched_sym = reloc->sym, *orig_sym, *func;
+	struct reloc *orig_relocs = NULL, *patched_relocs = NULL;
+	unsigned int nr_orig = 0, nr_patched = 0;
+	u32 key;
+
+	if (reference_twin(patched_sym) || patched_sym->dont_correlate ||
+	    !is_object_sym(patched_sym) || is_undef_sym(patched_sym) || !patched_sym->len)
+		return 0;
+
+	if (!is_compound_constant(patched_sym)) {
+		if (!has_dwarf_identity(patched_sym)) {
+			ERROR_FUNC(reloc->sec->base, reloc_offset(reloc),
+				   "unresolved data reference: %s has no DWARF identity",
+				   patched_sym->name);
+			return -1;
+		}
+		key = identity_hash(&patched_sym->identity);
+		/*
+		 * With one old count.N and two patched candidates, the unmatched one
+		 * may still refer to old state, even if the original already has a twin.
+		 */
+		elf_hash_for_each_possible(e->orig, symbol_identity, orig_sym, identity_hash, key) {
+			if (!same_identity(&patched_sym->identity, &orig_sym->identity))
+				continue;
+			ERROR_FUNC(reloc->sec->base, reloc_offset(reloc),
+				   "unresolved data reference: %s (%s, %s, %s), old candidate %s[%u]",
+				   patched_sym->name, patched_sym->identity.source,
+				   patched_sym->identity.scope,
+				   patched_sym->identity.demangled_name,
+				   orig_sym->name, orig_sym->idx);
+			return -1;
+		}
+		return 0;
+	}
+
+	func = find_func_containing(reloc->sec->base, reloc_offset(reloc));
+	if (func && func->included && func->twin && !same_function_checksum(func)) {
+		orig_relocs = get_func_relocs(e->orig, func->twin, &nr_orig);
+		patched_relocs = get_func_relocs(e->patched, func, &nr_patched);
+	}
+	return resolve_compound_reference(e, patched_sym, orig_relocs, nr_orig,
+					  patched_relocs, nr_patched);
+}
+
 /*
  * Check if the original module already has a dependency on dep_mod, i.e. it
  * already references at least one export from that module.
@@ -1629,6 +1758,9 @@ static int clone_reloc(struct elfs *e, struct reloc *patched_reloc,
 	bool klp;
 
 	/* Reject ambiguous data references before treating them as new. */
+	if (check_unmatched_reference(e, patched_reloc))
+		return -1;
+
 	klp = klp_reloc_needed(patched_reloc);
 
 	dbg_clone_reloc(sec, offset, patched_sym, addend, export, klp);
@@ -1781,6 +1913,8 @@ static int create_fake_symbol(struct elf *elf, struct section *sec,
 		return -1;
 
 	sym->fake = 1;
+	/* Special-section entries are copied with the patched code. */
+	sym->dont_correlate = 1;
 	return 0;
 }
 
-- 
2.55.0

