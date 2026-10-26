Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010016;
	b=Yl5zomC/DP9OGegCYFagR1uHGCA1m4wr2LMTjqeybpWyaGaFNd757Iih/jQDw1EATPkQ
	 zxwUb2afK+9UN9yAkFSWiB2T4tif5D2b4Y8oKLcKH8RWDCZpUl7tKSQfudfWEzFw9/YWU
	 lZkLnFEZs4hMIcKhkfoPdI0OBtxFDUh1QvrZxjCDJcM81PAsjFQdGAw3+d8S2Ps9dqzyR
	 Ua1kTJNuJymMGGFQrsWn9YDR5ToYIU09E+jwVsAMf4MbH6HDM24qTgbcQ5/YUYMInOfdr
	 Pa1P3i72zVzBFA5kQ9zwE59fIF23e2ZfkQfh03mKX5KlJy5spIkYZt30vUBB4koRgZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kSt0+19ZtRH8Z5jzlg5YWJl+R3gwXhIgznAOUesFi6U=;
	b=sCCJkXvHu0/GReaNeZhyizN2Z4sRnYiIIIXUI1r8efwvwyYrRyijvd2C3+m1gPbmtG0Z
	 bMncVBhhaOhwHVI5bLpQZfo4KN6EJ8Vr3ZfdBJA1FLVAk1knCVJuDwqFlBmytynhuGH1w
	 zEq8gJqqjs6n9vXS6VPayK3sR90OPaO3AhCwAoxsTGZ8/lRVsFnANmycZcdNr+M43fNnW
	 TCF44C+2duJy/blLb3fpym4MoaLhWRewm42m5xdZwPm3dTfblITmvZsOjgWI0ny79wZeH
	 LxdrjkeKJ3hd8pUXGOntPiuLxasbMj+lEGDHfygg6Pj62woQBIs1+5gRnpJcgC67fXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L2oxci4f;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219C606A325
	for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 10:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6219C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L2oxci4f
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1664948a12.3
        for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 03:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010016; x=1793614816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSt0+19ZtRH8Z5jzlg5YWJl+R3gwXhIgznAOUesFi6U=;
        b=L2oxci4fiWkv7JuI5Ul+4hgbH8BniLUyp39CnhqaBNnk/pfCtEqIgDHTTH8UM1o/QT
         7Wag2Qm2lTPba0K4i2FeBa9qOBraMw3IKLj+2uDC4FpaVjYYR+56Il7fLXjB8sjnud5e
         TEk+rc5T0fhjg/fa+03aCzSqzPES1U6AQTWzWGH6B8z7K9kxasFkMsmC48LqwswwAnQf
         B//7lUxw61Lg6qDWpdzPhj1TzQ86ylnzVreyiZcC1v1jcZ/kfsv/HWRiXnkhfm0CvBD/
         V0JOj1waczECOn3PGz/nYUaj9uG2e/PP97y+iS04KqhdTtXodEnG/8OCOcPQ1YBus4bw
         YbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010016; x=1793614816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSt0+19ZtRH8Z5jzlg5YWJl+R3gwXhIgznAOUesFi6U=;
        b=Yh/a8QXMWHJnA/aiUide1dj896btwFgimDrtxmsBOexwubdETD12AL+7KgRA6yki4l
         ciogaQKFb+vLZN8TYtVAsPKhrTIGPz3hTt+3OW6uxAljSx/T6qb5mX+qVNL1UQ9cCiwl
         gyVwkhtfdPgL/J2219tn6qZG6aQaXX41u3KdsbXY+xZTZ+Hzs22kvg2+yE1hpS9MhyR9
         Hy2f3uBRBWBq4IBQat0rsHu9hsiOKEwjDGQkLhFjMCUafMP4qoDt7VA7ejN61Mwc0emD
         9LkMPt9Z4pZFXwbCBnHicujDdYhu9YFq9BUS4KAIsnNHwfKotk8AM0DoXXeZJpq/kpHa
         15uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhhPmjzT1KO4gaZ5Y8hCHcoYdlNCqCTwga3EQy7CYAOEf/CgvVgxxzbf4zm9Odlve8wORL@lists.linux.dev
X-Gm-Message-State: AFq9FYKK+NOMusKhTZQB8raFm1R2NjKIRmLL9IzivAiJCz8BNXKd9OnK
	1TP6PO6GbCMwE0Yb2den8MuVj9fomJV4xWHdNA3CkYGGaml2C0naYYv6
X-Gm-Gg: AYBFou0gXthg1mibdXacT/cVXhUsn7PllBEgp58UEiTmVJNX3rE+aDrJ/l2vmDiKNpD
	/9Nq4aqF8JN0s2MFpWhgus6jm3cblsWMvCpmfFTCL7xwYycPkASzxKmQb0/xwdhMSgNeD3HgcJB
	inyEsX0qaVW1CLhj9XYJtINutTXPH+UrDFRfKMUjokq0nG1Jke0sZ+ffuB1UwtForMa85BXryWs
	KyNYTOCviNj22UbjOG1EmRVR2SFnkh9NgVWh7MIdohbpLyvNqWQ4UnQaZ/mvbv5uSz6iv/lyJuT
	ExTdWTpJJI+gttMMcCmV6HneklpCEQXl4lMwzDL/k6z3/4b5F/0W84zX1eMnBNchh/aEfuaFtWb
	POtk4dJM5Zu66YElPGpVX5Z82oATUb+/yfOkGDcU9XuKXOevXTOzvS1s7LAzgAznWl8Ys54Lwut
	qW/byrDrYsJGt0xG/le69MDEkRv18G1xqbnZih7AH4Ed5Nih0LWjqHQ1OqZfH3MBjx2A5S9ZQHk
	ZSmwwgxmE2A080psCzfOXY+uytO8LZlo332FFdmGcvzxBHcQn1zL/OlJC7tPu3Y5B+794NCzAi6
	kA==
X-Received: by 2002:a17:90b:2891:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3adead488d1mr5543829a91.25.1793010015616;
        Mon, 26 Oct 2026 03:20:15 -0700 (PDT)
Received: from anatasluo-Precision-5560 ([2408:820c:d29:db90:8486:5157:635e:e0f0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm8477565a91.2.2026.10.26.03.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:20:15 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] objtool/klp: Include symbol identities in reference checksums
Date: Mon, 26 Oct 2026 18:19:15 +0800
Message-ID: <20261026101916.3823942-3-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026101916.3823942-1-luolongjuna@gmail.com>
References: <20261026101916.3823942-1-luolongjuna@gmail.com>
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

A call or data reference can switch to a same-named symbol without
changing the target's demangled name. Hashing that name alone can miss
the change, even when the symbols have been correlated correctly.

Prepare identities before calculating checksums and hash the target's
source/scope/demangled_name path. This distinguishes TU-local and
external targets while allowing compiler suffixes to change. Keep the
single-object checksum command and its on-disk format unchanged.

Tested with GCC and Clang, including same-named call/data targets,
function-pointer tables, and four full-kernel vmlinux.o build pairs.
This patch introduces no new test failures. The three policy
rejections from the identity correlation patch remain; sympos and
sympos-vmlinux now fail earlier, in klp checksum, because identities
are prepared there.

Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/include/objtool/klp-identity.h |  1 +
 tools/objtool/include/objtool/klp.h          |  2 ++
 tools/objtool/klp-checksum.c                 | 25 +++++++++++++-------
 tools/objtool/klp-diff.c                     |  2 +-
 tools/objtool/klp-identity.c                 |  7 ++++++
 5 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/include/objtool/klp-identity.h b/tools/objtool/include/objtool/klp-identity.h
index 0c7be8cfd49b..8483ce92f2e5 100644
--- a/tools/objtool/include/objtool/klp-identity.h
+++ b/tools/objtool/include/objtool/klp-identity.h
@@ -14,6 +14,7 @@ struct identity {
 	const char *source;		/* physical defining TU path, or "" */
 	const char *scope;		/* slash-delimited enclosing scopes */
 	const char *demangled_name;	/* suffix-stripped symbol name */
+	const char *path;		/* source/scope/demangled_name */
 	bool external;
 };
 
diff --git a/tools/objtool/include/objtool/klp.h b/tools/objtool/include/objtool/klp.h
index c57775d78c71..564890cd1d5f 100644
--- a/tools/objtool/include/objtool/klp.h
+++ b/tools/objtool/include/objtool/klp.h
@@ -51,6 +51,8 @@ struct objtool_file;
 struct elf;
 struct symbol;
 
+bool dont_correlate(struct symbol *sym);
+
 int klp_create_symid_sections(struct objtool_file *file);
 
 int klp_sympos_init(struct elf *orig);
diff --git a/tools/objtool/klp-checksum.c b/tools/objtool/klp-checksum.c
index 1f1b5f068168..54b89c3e6d1b 100644
--- a/tools/objtool/klp-checksum.c
+++ b/tools/objtool/klp-checksum.c
@@ -98,8 +98,8 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 			__checksum_update_insn(func, insn, buf, len);
 
 			if (call_dest) {
-				__checksum_update_insn(func, insn, call_dest->identity.demangled_name,
-						       strlen(call_dest->identity.demangled_name));
+				__checksum_update_insn(func, insn, call_dest->identity.path,
+						       strlen(call_dest->identity.path));
 
 			} else if (jump_dest) {
 				struct symbol *dest_sym;
@@ -115,8 +115,8 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 				if (!dest_sym)
 					goto alts;
 
-				__checksum_update_insn(func, insn, dest_sym->identity.demangled_name,
-						       strlen(dest_sym->identity.demangled_name));
+				__checksum_update_insn(func, insn, dest_sym->identity.path,
+						       strlen(dest_sym->identity.path));
 
 				offset = jump_dest->offset - dest_sym->offset;
 				__checksum_update_insn(func, insn, &offset, sizeof(offset));
@@ -158,8 +158,8 @@ static void checksum_update_insn(struct objtool_file *file, struct symbol *func,
 		offset -= sym->offset;
 	}
 
-	__checksum_update_insn(func, insn, sym->identity.demangled_name,
-			       strlen(sym->identity.demangled_name));
+	__checksum_update_insn(func, insn, sym->identity.path,
+			       strlen(sym->identity.path));
 	__checksum_update_insn(func, insn, &offset, sizeof(offset));
 
 alts:
@@ -227,9 +227,9 @@ static void checksum_update_object(struct objtool_file *file, struct symbol *sym
 			offset -= target->offset;
 		}
 
-		__checksum_update_object(sym, sym_offset, "reloc name",
-					 target->identity.demangled_name,
-					 strlen(target->identity.demangled_name));
+		__checksum_update_object(sym, sym_offset, "reloc identity",
+					 target->identity.path,
+					 strlen(target->identity.path));
 		__checksum_update_object(sym, sym_offset, "reloc addend",
 					 &offset, sizeof(offset));
 	}
@@ -325,6 +325,7 @@ static const char * const klp_checksum_usage[] = {
 int cmd_klp_checksum(int argc, const char **argv)
 {
 	struct objtool_file *file;
+	struct symbol *sym;
 	int ret;
 
 	const struct option options[] = {
@@ -349,6 +350,12 @@ int cmd_klp_checksum(int argc, const char **argv)
 	if (ret)
 		goto out;
 
+	for_each_sym(file->elf, sym)
+		sym->dont_correlate = dont_correlate(sym);
+	ret = prepare_identities(file->elf);
+	if (ret)
+		goto out;
+
 	ret = calculate_checksums(file);
 	if (ret)
 		goto out;
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 957e589b6603..b86886c41950 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -425,7 +425,7 @@ static bool is_metadata_section(struct section *sec)
  * These symbols should never be correlated, so their local patched versions
  * are used instead of linking to the originals.
  */
-static bool dont_correlate(struct symbol *sym)
+bool dont_correlate(struct symbol *sym)
 {
 	return is_file_sym(sym) ||
 	       is_null_sym(sym) ||
diff --git a/tools/objtool/klp-identity.c b/tools/objtool/klp-identity.c
index 627eda694389..ca8e65d5d392 100644
--- a/tools/objtool/klp-identity.c
+++ b/tools/objtool/klp-identity.c
@@ -156,12 +156,19 @@ int prepare_identities(struct elf *elf)
 
 	for_each_sym(elf, sym) {
 		struct identity *identity = &sym->identity;
+		char *path;
 
 		/* Default to STT_FILE and "/" for missing DWARF information. */
 		if (!identity->external && !*identity->source && sym->file)
 			identity->source = sym->file->identity.source;
 		if (!identity->scope)
 			identity->scope = "/";
+		if (asprintf(&path, "%s%s%s", identity->source, identity->scope,
+			     identity->demangled_name) < 0) {
+			ERROR_GLIBC("asprintf");
+			return -1;
+		}
+		identity->path = path;
 		if (!sym->dont_correlate)
 			elf_hash_add(symbol_identity, &sym->identity_hash, identity_hash(identity));
 	}
-- 
2.53.0

