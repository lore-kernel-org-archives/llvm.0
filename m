Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799181;
	b=R7sHpngDNwgcgcsEV5aNgmt9Q5htKFHo2l4v5sOm9uRjtiskiUA7zjNYV3+RFMpj7X4I
	 NxfGTkVNZOPGLMoBQxQu5ZzMroRr1HTGFle9TYIEmtTbak+VKDLHCE75V5h+OkV7mJUV6
	 3sW6TBE9F3Y/tXXU/nUbFswzJne2pVKo1dTm4DRLStKhiMJBG9fWn2YhdgmZBoQaj4n6H
	 1dveJydRUbDmWtcIjgJxhUUanawJRK4mu+VmJFmdnfpIpKLVYi9t+xddYlNTlApLhuQjw
	 9IU88FyZEhEboLZFjdTHNYkEW+X3Ydgi1SQoWARKcWL9W3DC5ObSit9dYxrBg5cL8qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BtUDms6tpi+nE+r7gyE10bk7/san5lmoIg9n8+3rKQU=;
	b=zYSxhiVaW/ApUHHdqItGD3C3ipIL2r2PCoH/W7zfb+EO+jLhNVvJ/PHr2ji8l8wYnm26
	 vH6Sdn5PXu9GwbSpLLka5K32iGbBZ7ccRK/GpkE57wqIznkkFDpEbwFlVBZPnezRVzIMY
	 7YxiKfv7JdO+hNv+JjNBi0EVpHKUV+WEbCMmU8ne9YrPOhsK41WRnva5aib52XwHlUyBB
	 ArRV2QJzbanVkjsQCWVZlubFCPgXyr1b/Ye/YFfkYVZoZ66ZQlust9P6A0sRSUsswdk9l
	 iH8FpZMSmb4uW8VCq9HJ/D5Xiz37dMoS8WdsF5nUwWQHY02mllE++UdSQ6DDiDexK/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKbtSXbm;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE58606A33C
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 13:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE58606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKbtSXbm
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so624512b3a.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 05:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799181; x=1794403981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtUDms6tpi+nE+r7gyE10bk7/san5lmoIg9n8+3rKQU=;
        b=YKbtSXbmLTtz21RkddkxZ+1N8exUm8ujwo7CCLUQyCfrNkMWvGH9GJFvs0br6cRb3Y
         agQPj4LJ36mzG4Ge6HfG+Vq/glOvmLFxjRARfwMmixTelV7o0uoff6WlOG1GlPwPO+v7
         kjQospQV3f1Jn0L3o/yTbN43x6L4t1b0xgoM9leM158v5sY8mXyBfYXQva93MDYUErQu
         0ri//jZypEvLAGK7JbeVB8jwRfW+8NFEqqE8TjrlIKyqCG3O5GbIWPNrlUPLwlmp3ekq
         PAiKr8PVTRijVj7p22dVn0/eua8dqw8c5O1oexU/sP5O4HiWrs6X39AhwFlzH0B9gQg1
         NnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799181; x=1794403981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtUDms6tpi+nE+r7gyE10bk7/san5lmoIg9n8+3rKQU=;
        b=wJ9pUWS/wMrj4MqcZYeZS4RnkO6z+VFs7v16CAsTC2I9f/4qRX8KSVZrsHFBAB1lbX
         wtAyBCLHk8S0l9PFPNRpnT/DWZQ6gCkwA98IQ0dqvyCv6Wc+Hv2wq1QL6dFfb1ZqI8TE
         PwaSTv77bCn9FP74gSLuxn8EvyqbnrxYdFUo/cLfBRms37wl4rIn1QxmXb95CCufwQpu
         CYWPTyHvDVPsTDGA/rn3MhbmYROdBOpGjDM1Pnkb9nZ1FTRcJ/0K5jwMepzcfsLYVqgy
         14G13AiQkxuSQiMNgW68aOX8sai9ueEOy+MtOWsMgOOJaCGtE5kUcVofO0CBy18KJ0+i
         w/og==
X-Forwarded-Encrypted: i=1; AKwUvBwen2rb5GKa3EYjg2r14Wxoj1RwHpg8oAezTAIVVzwa7AXKrJp11V8BfC7JtoXvkNZAITyi@lists.linux.dev
X-Gm-Message-State: APuU4Z/gIgtqbG2MSJQ5BBmd8QWDVWe5vz3PdkGsHmjzVM7R7m2JLtON
	rSNe9Q5YEjo8c1UXuBvFGrrb4aOYeZhdCAZewaPHGUcw7ibxkT2o8bJ3
X-Gm-Gg: AYBFou0GkUcbXYBq4rLUkSFgTUKM3zGa76lVmRVw2gb4BWP6Z0EVW3b4aoHs/ZINZkK
	sRiceeILb/cerZ2h/sgKP5UAFgswoZ1Pgd8ZYtektvaliMcILDYCNSwyI4YyZ6qR/BWcVJIuu6D
	G6QK2S5H6OrsnTqaDuFh90IuST8eCSCucxqBNltgalkW0RvLAZjRSryCcF2kdMBQGTBrdlgO5La
	LV+vEVkZe3C8wS5hXQSIXlD+oRnJmx5SirPJHbmFkyT2jtfCSzgzBaiPIJAV97nWJmW8Pu8IR4y
	2ENzEkKZf2OUenHkD7TqAarrIRphRy8UiJZHHY7cJ+vK/iA0WOmH5dmx3hls1svR4KCXJ222WSN
	XYfaWD21BrV38/8T/FKk5Srg6ptKqUnkncyJV9PQSYMvSZ98VXxiDQXvExVQ9q43CSzkVbsNryz
	792gJq9a2U8ll78YNSw5J3Jf6QexQu/nkzWfg8rxSe7gZ0mQfOYAI5qqh1dpCZYnCr4D8g25Dw1
	IBVKsNuAjWR29ipMoRrZEEGECr1dpkuZhVugl2Lym5ixQzDEsr5am1W6Z4Ftw7to2K9+rYKswc8
	iJF7hLZic1iZjaSuEjKFlYZhv1s08jwTR5bol4oveOoYxBoOBQ==
X-Received: by 2002:a05:6a00:a229:b0:8a0:76ea:36e1 with SMTP id d2e1a72fcca58-8a9ba229da4mr14126529b3a.7.1793799180837;
        Wed, 04 Nov 2026 05:33:00 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:33:00 -0800 (PST)
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
Subject: [RFC PATCH v2 08/11] objtool/klp: Include symbol identities in reference checksums
Date: Wed,  4 Nov 2026 21:31:54 +0800
Message-ID: <20261104133158.3187525-9-luolongjuna@gmail.com>
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

Hashing only the target's suffix-stripped name can hide a reference change
between different objects with the same name.

Prepare DWARF identities for checksum calculation and hash the identity
path for named references. Keep the existing checksum section format and
use suffix-stripped ELF names when no DWARF identity is available.

The three tests rejected by policy in earlier patches remain rejected.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. Only local-to-global-flip, sympos and sympos-vmlinux fail,
reflecting the linkage and duplicate-identity policies.

Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/klp-checksum.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/klp-checksum.c b/tools/objtool/klp-checksum.c
index 1a5f2fa89baa..44c0eb784e57 100644
--- a/tools/objtool/klp-checksum.c
+++ b/tools/objtool/klp-checksum.c
@@ -77,6 +77,12 @@ static bool is_const_reference(struct symbol *sym)
 static int checksum_object(struct objtool_file *file, struct symbol *sym,
 			   unsigned int depth);
 
+/* Use suffix-stripped ELF names for references without DWARF identities. */
+static const char *checksum_name(struct symbol *sym)
+{
+	return sym->identity.path ?: sym->identity.demangled_name;
+}
+
 static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 				struct instruction *insn)
 {
@@ -110,8 +116,8 @@ static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 			__checksum_update_insn(func, insn, buf, len);
 
 			if (call_dest) {
-				__checksum_update_insn(func, insn, call_dest->identity.demangled_name,
-						       strlen(call_dest->identity.demangled_name));
+				__checksum_update_insn(func, insn, checksum_name(call_dest),
+						       strlen(checksum_name(call_dest)));
 
 			} else if (jump_dest) {
 				struct symbol *dest_sym;
@@ -127,8 +133,8 @@ static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 				if (!dest_sym)
 					goto alts;
 
-				__checksum_update_insn(func, insn, dest_sym->identity.demangled_name,
-						       strlen(dest_sym->identity.demangled_name));
+				__checksum_update_insn(func, insn, checksum_name(dest_sym),
+						       strlen(checksum_name(dest_sym)));
 
 				offset = jump_dest->offset - dest_sym->offset;
 				__checksum_update_insn(func, insn, &offset, sizeof(offset));
@@ -170,8 +176,8 @@ static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 		__checksum_update_insn(func, insn, &sym->csum.checksum,
 				       sizeof(sym->csum.checksum));
 	} else {
-		__checksum_update_insn(func, insn, sym->identity.demangled_name,
-				       strlen(sym->identity.demangled_name));
+		__checksum_update_insn(func, insn, checksum_name(sym),
+				       strlen(checksum_name(sym)));
 	}
 	__checksum_update_insn(func, insn, &offset, sizeof(offset));
 
@@ -265,9 +271,9 @@ static int checksum_update_object(struct objtool_file *file, struct symbol *sym,
 						 &target->csum.checksum,
 						 sizeof(target->csum.checksum));
 		} else {
-			__checksum_update_object(sym, sym_offset, "reloc name",
-						 target->identity.demangled_name,
-						 strlen(target->identity.demangled_name));
+			__checksum_update_object(sym, sym_offset, "reloc identity",
+						 checksum_name(target),
+						 strlen(checksum_name(target)));
 		}
 		__checksum_update_object(sym, sym_offset, "reloc addend",
 					 &offset, sizeof(offset));
@@ -387,6 +393,7 @@ static const char * const klp_checksum_usage[] = {
 int cmd_klp_checksum(int argc, const char **argv)
 {
 	struct objtool_file *file;
+	struct symbol *sym;
 	int ret;
 
 	const struct option options[] = {
@@ -411,6 +418,12 @@ int cmd_klp_checksum(int argc, const char **argv)
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
-- 
2.55.0

