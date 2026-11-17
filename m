Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890114;
	b=UvqyhZVGHoeW9BSV0kncrJ+qHEnHSqvIt5tsj3nftpEFT1KdDiQq4nRKIxeJIthuENJk
	 pBMcTRHrUzOgKY4vVLzy5uR4r8MMTQIcKfxpWXvamA6G9WObthTAfBySotJhCEpzNfaCg
	 0QQGYb1iRrVUbeagbxB5Bnj+3KFPxXX9NOSXym46RsK0/ezjY0oB6n1sjbOujklEIo1Qt
	 AM6QfCgecUo700rSC5sQRu9CmPiHXIayKw1H5MoWTL1s0tPW4GcVp6HFpL668u3HqNovL
	 dRw++C7g6Mmc0rWoiKQLU35Z8qAG3uoNOCWWKyM6Jgm0fj9tRclyIBBPJcDgikbVWCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8RynyEI2LjprFteeQUGQtfK5K7wcjktuY9xijGL3xwk=;
	b=FOCd0+1kup6+/ymOz8vo5Ek3cZe0TJJT8PGREhUysrC0SuMR63tC6y7Z2h61r6VwVKvd
	 KCBsP3T2RdqikzriF+G4v02PqD190EDpncSnVV2kKzIPQIOyla7D7z427uLsbKdU9AZWL
	 1410MIOz6ZXYhRqtsnKTjAFQBrrjfV5SJDUyWwOgM0spZaLg6qMFa4WKlHhlnAs2JzFQC
	 S2zTnRWMDV+V8CdoPykTdUrLVZjk7IEyJ9Ctd/CQ++mj3cCoMDKJ1Cb9gp4UIQQbyaIo/
	 uYpwpgkoP99KMNL2ZHiGWd/zdwR259VjjAkpZ2Ou1KVsqe2gos+eSsaLOSZSZmTuHew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rj8chiua;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C7606A338
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56C7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rj8chiua
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so6071090a91.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 20:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890113; x=1795494913; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RynyEI2LjprFteeQUGQtfK5K7wcjktuY9xijGL3xwk=;
        b=Rj8chiuaaFlBfs1FErnQ8ofnGvbpPyShEGbg3b2KQWcdUuxo4kpRAIVbrq61Z6lqin
         ZEfRYeoiqid0el3+e/3KbiawS7VGrTepMJi1Ptw3RksXNPuRi5O1dA4C3+6uOHjLIYmH
         eDxT9AiZmFvbPJ5HXY5yRGjax3grLTZK0YWXuZm4qAzHPxFrWTg/7N3/H0FJgMD4At8X
         nxD2MRwHHTCNJMpkBXAzCro/Pge7MCOPGPyBDTNDkxOpi72F2QYgAbH1ByMvbMeyXl4H
         8GJFAq6PW0t7Zk50pqA3aohiHtVcdKF1bTKNv/mC9eyeGw7mAAvi0auhzNQqOzDscMWr
         9H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890113; x=1795494913;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RynyEI2LjprFteeQUGQtfK5K7wcjktuY9xijGL3xwk=;
        b=ZRZNCFCVbs9INJQxtm8aDLg98Dxz2RraflXn8oIfmaF6BKe+/hnTkMqzi9cvCXYUyp
         r6bNi9Y9OFzNbzJw1QfiIUgd2FoPZDMG2HyjpB33GNO9X15t1U1u64BSwT7s+3zQ2kdL
         uIKJcAlqanXIPM7U5obAIa0Jp0792nMAMX+zd0f7PNMPpodFDSQOY4lggerwysxENt3m
         O+9VpQGCH5Mkzr+C6ABPmPw8XWqcXt+MoqiGPiql3+KgXOm4BWYHrNAxKf9aR7R3sJKK
         7rIT9/19ox74Zta55+31+Q2cwgqDbcEap+EXSetSuw+1/ab0V2pw/0yV1e7yJ/YZVvWA
         R+YA==
X-Forwarded-Encrypted: i=1; AL+hErHH2uxEjsgW7NG3Ze6eJ79iHnuecdJM6zQQoGREar4PSDzn89FYcAnGLcQXPBB926LUW4Kn@lists.linux.dev
X-Gm-Message-State: APuU4Z9CBU++m7MW5aQ3BC7MMuk5VRsuwDw9XJSYxJdff96XQCDRfS9l
	utUIk8vlHvWIpkLNgvhgxoVso76AORC5U2rOdzYehCvLi1Dh2NlGESKOWJ1YrOplWv2yKETZQPa
	e9mMPub/BIAj/TURGoXhtaborWA==
X-Received: from pgbx10-n1.prod.google.com ([2002:a05:6a02:63ca:10b0:cdd:9fea:8409])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a43:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b1b0a3c0dbmr12627639a91.43.1794890113043;
 Mon, 16 Nov 2026 20:35:13 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:56 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-5-dylanbhatch@google.com>
Subject: [RFC PATCH 04/12] arm64, unwind: parse .eh_frame into .lr_unwind
 entries in gen_lr_unwind
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Define the .lr_unwind_fde and .lr_unwind_ranges binary format in
<asm/lr_unwind.h> and implement parse_eh_frame() in
scripts/gen_lr_unwind to classify each FDE instruction range into one of
three exception-boundary unwind modes derived from DWARF CFI:
  - LR_UNWIND_LIVE: x30 holds the live return address and x29 holds the
    caller's frame pointer.
  - LR_UNWIND_FP:   the {x29, x30} frame record resides at [x29].
  - LR_UNWIND_SP:   the {x29, x30} frame record resides at
    [sp + sp_off], handling fixed-frame GCC functions and Clang
    epilogues where CFA uses SP before or after x29 is updated.

Functions with non-standard x30 spills (e.g. frameless leaf functions
spilling x30 without x29) are omitted so the unwinder treats them as
unreliable.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/lr_unwind.h | 111 ++++++++++
 scripts/gen_lr_unwind.c            | 318 ++++++++++++++++++++++++++++-
 2 files changed, 425 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/include/asm/lr_unwind.h

diff --git a/arch/arm64/include/asm/lr_unwind.h b/arch/arm64/include/asm/lr_unwind.h
new file mode 100644
index 0000000000000..81c743994c4d5
--- /dev/null
+++ b/arch/arm64/include/asm/lr_unwind.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Binary format definitions for .lr_unwind_fde and .lr_unwind_ranges.
+ *
+ * Each function (FDE) is described by an 8-byte struct lr_fde containing a
+ * 32-bit PC-relative start_offset and a 32-bit range_desc encoding instruction
+ * ranges and how to unwind across an exception boundary at each range:
+ *   - LR_UNWIND_LIVE: return address is live in x30; caller FP is in x29
+ *   - LR_UNWIND_FP:   frame record {caller_fp, caller_lr} is at [x29]
+ *   - LR_UNWIND_SP:   frame record {caller_fp, caller_lr} is at [sp + sp_off]
+ */
+#ifndef __ASM_LR_UNWIND_H
+#define __ASM_LR_UNWIND_H
+
+#include <linux/bits.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+enum lr_unwind_mode {
+	LR_UNWIND_LIVE	= 0,
+	LR_UNWIND_FP	= 1,
+	LR_UNWIND_SP	= 2,
+};
+
+struct lr_fde {
+	s32 start_offset;	/* PC-relative offset from &fde->start_offset */
+	u32 range_desc;		/* Inline (bit 31 = 1) or OOL (bit 31 = 0) */
+};
+
+/*
+ * Out-of-line range entry:
+ *   [15:14] mode (2 bits): enum lr_unwind_mode
+ *   [13:0]  len (14 bits): length in 4-byte instructions (1..16,383)
+ */
+typedef u16 lr_range_t;
+
+#define LR_RANGE_LEN_BITS	14
+#define LR_RANGE_LEN_MAX	((1U << LR_RANGE_LEN_BITS) - 1)
+
+#define LR_RANGE_MAKE(mode, len) \
+	((lr_range_t)((((u32)(mode)) << LR_RANGE_LEN_BITS) | \
+		      ((u32)(len) & LR_RANGE_LEN_MAX)))
+#define LR_RANGE_MODE(r)	((enum lr_unwind_mode)((r) >> LR_RANGE_LEN_BITS))
+#define LR_RANGE_LEN(r)		((u32)((r) & LR_RANGE_LEN_MAX))
+
+/*
+ * Common range_desc header bits (both inline and out-of-line):
+ *   [31]    inline flag (1 = inline, 0 = out-of-line)
+ *   [30:26] sp_off (5 bits): frame record offset from SP in 16-byte units
+ */
+#define LR_FDE_INLINE		BIT(31)
+#define LR_FDE_SP_OFF_SHIFT	26
+#define LR_FDE_SP_OFF_MAX	0x1fU
+#define LR_FDE_SP_OFF_BYTES(d)	((((d) >> LR_FDE_SP_OFF_SHIFT) & LR_FDE_SP_OFF_MAX) << 4)
+
+/*
+ * Inline range_desc layout (bit 31 == 1):
+ *   [25]    body_sp (1 bit): r1 mode (0 = LR_UNWIND_FP, 1 = LR_UNWIND_SP)
+ *   [24:20] r0 (5 bits):     prologue LR_UNWIND_LIVE insns
+ *   [19:8]  r1 (12 bits):    body LR_UNWIND_FP / LR_UNWIND_SP insns
+ *   [7:4]   r2 (4 bits):     epilogue LR_UNWIND_SP insns
+ *   [3:0]   r3 (4 bits):     return LR_UNWIND_LIVE insns
+ */
+#define LR_INLINE_BODY_SP	BIT(25)
+#define LR_INLINE_R0_MAX	0x1fU
+#define LR_INLINE_R1_MAX	0xfffU
+#define LR_INLINE_R2_MAX	0xfU
+#define LR_INLINE_R3_MAX	0xfU
+
+#define LR_INLINE_MAKE(sp_off, body_sp, r0, r1, r2, r3) \
+	(LR_FDE_INLINE | \
+	 (((u32)(sp_off) & LR_FDE_SP_OFF_MAX) << LR_FDE_SP_OFF_SHIFT) | \
+	 ((body_sp) ? LR_INLINE_BODY_SP : 0U) | \
+	 (((u32)(r0) & LR_INLINE_R0_MAX) << 20) | \
+	 (((u32)(r1) & LR_INLINE_R1_MAX) << 8) | \
+	 (((u32)(r2) & LR_INLINE_R2_MAX) << 4) | \
+	 ((u32)(r3) & LR_INLINE_R3_MAX))
+
+#define LR_INLINE_R0(d)		(((d) >> 20) & LR_INLINE_R0_MAX)
+#define LR_INLINE_R1(d)		(((d) >> 8) & LR_INLINE_R1_MAX)
+#define LR_INLINE_R2(d)		(((d) >> 4) & LR_INLINE_R2_MAX)
+#define LR_INLINE_R3(d)		((d) & LR_INLINE_R3_MAX)
+
+static __always_inline void lr_fde_unpack_inline(u32 desc, lr_range_t ranges[4])
+{
+	enum lr_unwind_mode body_mode = (desc & LR_INLINE_BODY_SP) ?
+					LR_UNWIND_SP : LR_UNWIND_FP;
+
+	ranges[0] = LR_RANGE_MAKE(LR_UNWIND_LIVE, LR_INLINE_R0(desc));
+	ranges[1] = LR_RANGE_MAKE(body_mode, LR_INLINE_R1(desc));
+	ranges[2] = LR_RANGE_MAKE(LR_UNWIND_SP, LR_INLINE_R2(desc));
+	ranges[3] = LR_RANGE_MAKE(LR_UNWIND_LIVE, LR_INLINE_R3(desc));
+}
+
+/*
+ * Out-of-line range_desc layout (bit 31 == 0):
+ *   [25:6] idx (20 bits): starting index into .lr_unwind_ranges
+ *   [5:0]  cnt (6 bits):  number of lr_range_t entries
+ */
+#define LR_OOL_IDX_MAX		0xfffffU
+#define LR_OOL_COUNT_MAX	0x3fU
+
+#define LR_OOL_MAKE(sp_off, idx, cnt) \
+	((((u32)(sp_off) & LR_FDE_SP_OFF_MAX) << LR_FDE_SP_OFF_SHIFT) | \
+	 (((u32)(idx) & LR_OOL_IDX_MAX) << 6) | \
+	 ((u32)(cnt) & LR_OOL_COUNT_MAX))
+
+#define LR_OOL_IDX(d)		(((d) >> 6) & LR_OOL_IDX_MAX)
+#define LR_OOL_COUNT(d)		((d) & LR_OOL_COUNT_MAX)
+
+#endif /* __ASM_LR_UNWIND_H */
diff --git a/scripts/gen_lr_unwind.c b/scripts/gen_lr_unwind.c
index 1b52662838653..118f995b2c48b 100644
--- a/scripts/gen_lr_unwind.c
+++ b/scripts/gen_lr_unwind.c
@@ -16,6 +16,18 @@
 #include <sys/stat.h>
 #include <unistd.h>
 
+#include "../arch/arm64/include/asm/eh_frame.h"
+#include "../arch/arm64/include/asm/lr_unwind.h"
+
+#ifndef R_AARCH64_PREL32
+#define R_AARCH64_PREL32	261
+#endif
+
+struct lr_run {
+	enum lr_unwind_mode	mode;
+	u32			len;
+};
+
 struct lr_unwind_ctx {
 	const void	*map;
 	size_t		map_size;
@@ -24,15 +36,308 @@ struct lr_unwind_ctx {
 	const Elf64_Shdr *rela_eh_sec;
 	const Elf64_Shdr *fde_sec;
 	unsigned int	symtab_shndx;
+
+	const Elf64_Rela *eh_relas;
+	size_t		nr_eh_relas;
+	size_t		rela_cursor;
+
+	struct lr_fde	*fdes;
+	Elf64_Rela	*fde_relas;
+	size_t		nr_fdes;
+	size_t		cap_fdes;
+
+	lr_range_t	*ranges;
+	size_t		nr_ranges;
+	size_t		cap_ranges;
+
+	struct lr_run	*runs;
+	size_t		cap_runs;
 };
 
-static int parse_eh_frame(struct lr_unwind_ctx *ctx)
+static int append_fde_entry(struct lr_unwind_ctx *ctx,
+			    const Elf64_Rela *eh_rela,
+			    s64 byte_off, u32 desc)
 {
-	/* TODO: Parse CIEs/FDEs from .eh_frame and .rela.eh_frame */
-	(void)ctx;
+	size_t idx;
+
+	if (ctx->nr_fdes == ctx->cap_fdes) {
+		size_t cap = ctx->cap_fdes ? ctx->cap_fdes * 2 : 1024;
+		struct lr_fde *fdes = realloc(ctx->fdes, cap * sizeof(*fdes));
+		Elf64_Rela *relas;
+
+		if (!fdes)
+			return -1;
+		ctx->fdes = fdes;
+
+		relas = realloc(ctx->fde_relas, cap * sizeof(*relas));
+		if (!relas)
+			return -1;
+		ctx->fde_relas = relas;
+		ctx->cap_fdes = cap;
+	}
+
+	idx = ctx->nr_fdes++;
+	ctx->fdes[idx].start_offset = 0;
+	ctx->fdes[idx].range_desc = desc;
+
+	ctx->fde_relas[idx].r_offset = idx * sizeof(struct lr_fde);
+	ctx->fde_relas[idx].r_info = ELF64_R_INFO(ELF64_R_SYM(eh_rela->r_info),
+						  R_AARCH64_PREL32);
+	ctx->fde_relas[idx].r_addend = eh_rela->r_addend + byte_off;
+	return 0;
+}
+
+static int append_ool_range(struct lr_unwind_ctx *ctx, lr_range_t entry)
+{
+	if (ctx->nr_ranges == ctx->cap_ranges) {
+		size_t cap = ctx->cap_ranges ? ctx->cap_ranges * 2 : 65536;
+		lr_range_t *tmp = realloc(ctx->ranges, cap * sizeof(*tmp));
+
+		if (!tmp)
+			return -1;
+		ctx->ranges = tmp;
+		ctx->cap_ranges = cap;
+	}
+
+	ctx->ranges[ctx->nr_ranges++] = entry;
 	return 0;
 }
 
+static int push_run(struct lr_unwind_ctx *ctx, size_t *nr_runs,
+		    enum lr_unwind_mode mode, u32 len)
+{
+	if (*nr_runs == ctx->cap_runs) {
+		size_t cap = ctx->cap_runs ? ctx->cap_runs * 2 : 64;
+		struct lr_run *tmp = realloc(ctx->runs, cap * sizeof(*tmp));
+
+		if (!tmp)
+			return -1;
+		ctx->runs = tmp;
+		ctx->cap_runs = cap;
+	}
+
+	ctx->runs[(*nr_runs)++] = (struct lr_run){ .mode = mode, .len = len };
+	return 0;
+}
+
+static bool encode_inline(const struct lr_run *runs, size_t nr_runs,
+			  u32 sp_off, u32 *desc_out)
+{
+	u32 r0 = 0, r1 = 0, r2 = 0, r3 = 0;
+	bool body_sp = false;
+	size_t k = 0;
+
+	if (k < nr_runs && runs[k].mode == LR_UNWIND_LIVE) {
+		if (runs[k].len > LR_INLINE_R0_MAX)
+			return false;
+		r0 = runs[k++].len;
+	}
+	if (k < nr_runs && (runs[k].mode == LR_UNWIND_FP ||
+			    runs[k].mode == LR_UNWIND_SP)) {
+		if (runs[k].len > LR_INLINE_R1_MAX)
+			return false;
+		body_sp = (runs[k].mode == LR_UNWIND_SP);
+		r1 = runs[k++].len;
+	}
+	if (k < nr_runs && runs[k].mode == LR_UNWIND_SP) {
+		if (runs[k].len > LR_INLINE_R2_MAX)
+			return false;
+		r2 = runs[k++].len;
+	}
+	if (k < nr_runs && runs[k].mode == LR_UNWIND_LIVE) {
+		if (runs[k].len > LR_INLINE_R3_MAX)
+			return false;
+		r3 = runs[k++].len;
+	}
+	if (k != nr_runs)
+		return false;
+
+	*desc_out = LR_INLINE_MAKE(sp_off, body_sp, r0, r1, r2, r3);
+	return true;
+}
+
+static int emit_fde(struct lr_unwind_ctx *ctx, const Elf64_Rela *eh_rela,
+		    size_t nr_runs, u32 sp_off)
+{
+	size_t start_idx = ctx->nr_ranges;
+	s64 byte_off = 0;
+	size_t total_ool;
+	u32 desc;
+
+	if (encode_inline(ctx->runs, nr_runs, sp_off, &desc))
+		return append_fde_entry(ctx, eh_rela, 0, desc);
+
+	for (size_t k = 0; k < nr_runs; k++) {
+		u32 rem = ctx->runs[k].len;
+
+		while (rem > 0) {
+			u32 chunk = rem > LR_RANGE_LEN_MAX ?
+				    LR_RANGE_LEN_MAX : rem;
+
+			if (append_ool_range(ctx, LR_RANGE_MAKE(ctx->runs[k].mode,
+								chunk)) < 0)
+				return -1;
+			rem -= chunk;
+		}
+	}
+
+	total_ool = ctx->nr_ranges - start_idx;
+	for (size_t pos = 0; pos < total_ool; pos += LR_OOL_COUNT_MAX) {
+		size_t slice_idx = start_idx + pos;
+		size_t slice_cnt = total_ool - pos;
+		u64 slice_insns = 0;
+
+		if (slice_cnt > LR_OOL_COUNT_MAX)
+			slice_cnt = LR_OOL_COUNT_MAX;
+		if (slice_idx > LR_OOL_IDX_MAX)
+			return -1;
+
+		desc = LR_OOL_MAKE(sp_off, slice_idx, slice_cnt);
+		if (append_fde_entry(ctx, eh_rela, byte_off, desc) < 0)
+			return -1;
+
+		for (size_t j = 0; j < slice_cnt; j++)
+			slice_insns += LR_RANGE_LEN(ctx->ranges[slice_idx + j]);
+		byte_off += (s64)(slice_insns << 2);
+	}
+
+	return 0;
+}
+
+static int classify_cfi_state(const struct eh_frame_reg_state *r,
+			      enum lr_unwind_mode *mode, int *sp_off)
+{
+	s64 disp;
+
+	if (r->fp_rule == EH_REG_UNSUPPORTED ||
+	    r->lr_rule == EH_REG_UNSUPPORTED)
+		return -1;
+
+	if (r->lr_rule == EH_REG_UNMODIFIED) {
+		if (r->fp_rule != EH_REG_UNMODIFIED)
+			return -1;
+		*mode = LR_UNWIND_LIVE;
+		return 0;
+	}
+
+	/*
+	 * When LR (x30) is saved on the stack, require a standard arm64 frame
+	 * record {x29, x30} with x30 at fp_addr + 8. Functions that spill x30
+	 * without x29 (e.g. leaf functions using x30 as a scratch GPR) are
+	 * omitted so the unwinder treats them as unreliable.
+	 */
+	if (r->fp_rule != EH_REG_OFFSET || r->lr_off != r->fp_off + 8)
+		return -1;
+
+	disp = r->cfa_off + r->fp_off;
+
+	if (r->cfa_reg == AARCH64_DWARF_FP) {
+		if (disp != 0)
+			return -1;
+		*mode = LR_UNWIND_FP;
+		return 0;
+	}
+
+	if (r->cfa_reg == AARCH64_DWARF_SP) {
+		if (disp < 0 || (disp & 0xf) || (disp >> 4) > LR_FDE_SP_OFF_MAX)
+			return -1;
+		if (*sp_off >= 0 && *sp_off != (disp >> 4))
+			return -1;
+		*sp_off = disp >> 4;
+		*mode = LR_UNWIND_SP;
+		return 0;
+	}
+
+	return -1;
+}
+
+static int process_fde(struct lr_unwind_ctx *ctx,
+		       const struct eh_frame_fde_iter *it, u64 fde_off)
+{
+	s64 raw_range = it->use_sdata8 ? it->fde->range64 : it->fde->range;
+	struct eh_frame_cfi_state st = { .reg = it->cie_reg };
+	const Elf64_Rela *eh_rela;
+	size_t nr_runs = 0;
+	int sp_off = -1;
+	u32 range_bytes;
+	u32 prev_loc = 0;
+	const u8 *opcode;
+	int size;
+
+	while (ctx->rela_cursor < ctx->nr_eh_relas &&
+	       ctx->eh_relas[ctx->rela_cursor].r_offset < fde_off + 8)
+		ctx->rela_cursor++;
+
+	if (ctx->rela_cursor >= ctx->nr_eh_relas ||
+	    ctx->eh_relas[ctx->rela_cursor].r_offset != fde_off + 8)
+		return -1;
+	eh_rela = &ctx->eh_relas[ctx->rela_cursor++];
+
+	if (raw_range < 4 || raw_range > U32_MAX)
+		return 0;
+	range_bytes = (u32)raw_range;
+
+	if (eh_frame_fde_opcodes(it->fde, it->use_sdata8, &opcode, &size))
+		return -1;
+
+	for (;;) {
+		struct eh_frame_reg_state span_reg = st.reg;
+		bool done = (size <= 0);
+		u32 clamped, insns;
+
+		if (done)
+			st.loc = range_bytes;
+		else if (eh_frame_step_opcode(&opcode, &size, it, &st))
+			return -1;
+
+		clamped = st.loc < range_bytes ? (u32)st.loc : range_bytes;
+		insns = clamped > prev_loc ? (clamped - prev_loc) >> 2 : 0;
+
+		if (insns) {
+			enum lr_unwind_mode mode;
+
+			if (classify_cfi_state(&span_reg, &mode, &sp_off) < 0)
+				return 0;
+
+			if (nr_runs && ctx->runs[nr_runs - 1].mode == mode)
+				ctx->runs[nr_runs - 1].len += insns;
+			else if (push_run(ctx, &nr_runs, mode, insns) < 0)
+				return -1;
+			prev_loc += insns << 2;
+		}
+
+		if (done)
+			break;
+	}
+
+	if (st.stack_depth != 0)
+		return -1;
+	if (!nr_runs)
+		return 0;
+
+	return emit_fde(ctx, eh_rela, nr_runs, sp_off < 0 ? 0 : (u32)sp_off);
+}
+
+static int parse_eh_frame(struct lr_unwind_ctx *ctx)
+{
+	const u8 *eh_base = ctx->map + ctx->eh_sec->sh_offset;
+	struct eh_frame_fde_iter it =
+		EH_FRAME_FDE_ITER_INIT(eh_base, ctx->eh_sec->sh_size);
+	int ret;
+
+	ctx->eh_relas = ctx->map + ctx->rela_eh_sec->sh_offset;
+	ctx->nr_eh_relas = ctx->rela_eh_sec->sh_size / sizeof(Elf64_Rela);
+
+	while (!(ret = eh_frame_next_fde(&it)) && it.fde) {
+		u64 fde_off = (const u8 *)it.fde - eh_base;
+
+		if (process_fde(ctx, &it, fde_off) < 0)
+			return -1;
+	}
+
+	return ret ? -1 : 0;
+}
+
 static int emit_lr_unwind_sections(const char *fname, struct lr_unwind_ctx *ctx,
 				   unsigned int orig_shnum,
 				   unsigned int shstrndx)
@@ -124,7 +429,8 @@ int main(int argc, char *argv[])
 	}
 
 	if (!parse_eh_frame(&ctx) &&
-	    !emit_lr_unwind_sections(argv[1], &ctx, shnum, shstrndx))
+	    (!ctx.nr_fdes ||
+	     !emit_lr_unwind_sections(argv[1], &ctx, shnum, shstrndx)))
 		ret = 0;
 	else
 		fprintf(stderr, "gen_lr_unwind: failed to generate .lr_unwind for %s\n",
@@ -133,5 +439,9 @@ int main(int argc, char *argv[])
 out:
 	if (ctx.map)
 		munmap((void *)ctx.map, ctx.map_size);
+	free(ctx.fdes);
+	free(ctx.fde_relas);
+	free(ctx.ranges);
+	free(ctx.runs);
 	return ret;
 }
-- 
2.56.0.679.gc527c65306-goog

