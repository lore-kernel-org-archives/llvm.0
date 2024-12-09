Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D61E9B0F
	for <llvm@lists.linux.dev>; Mon,  9 Dec 2024 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756162; cv=none; b=pkGIULKW0MubwKhEt5bHEKKV0DmA7qUa4ia3PJFEsEPZMot6xAVW3EcJcYTglwMy1qbqoxdVh8xfNFLbJ0Z3S4Bo+gs2Y9ZeRJzCn4T1t47+32GrYYrTJShS7MI5ZvgMXxyJH0DLu/Z+K3E7ELFb2zbDPhXzI7fuOMIZZEIj2h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756162; c=relaxed/simple;
	bh=I3FRB0f3Ul3o80Y1tGfQekLxwdiVRfZRtCGeLUbFp/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=el//6QcRz/YWq4cAzOCrsbJES1rhkvLSBechmonaM+QHxfQx3q+V09rf2Dxkv0qshwZcjRQD+qD3XuDL/xFlk7DG+c+OaJ+LDnrIQ8o1+6czQxuvG4vF8k+CU2yKQ+LVQ8wx6M8aqxUEH48szErKCqXeC20l5MXvjY4XNbsiIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=h6Xp44eI; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="h6Xp44eI"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-aa67333f7d2so231481266b.0
        for <llvm@lists.linux.dev>; Mon, 09 Dec 2024 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1733756159; x=1734360959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWLBKwMeMVsEMRzTUljA6Xs3Jk0dHNqB1xAY0nLaWgU=;
        b=h6Xp44eIzbZx42/hYguI1RSCVY5H9zwdcHo/r4BRYzGyaHvrzwbfthPChAOoFSVyk/
         nxnKy/8NBvwCZ8atM+y/7z0h4E4YbatzailNA4AYFKqtQzTpx9uH5/IFCh+Oy9bqySHM
         Mlo0yuUgSoDjSfpK1Umxqx17yXpnKobA/CcM5PhuUduWW1DBBouGmPHFuZjLaLyzHakb
         fgr+RbzeJaH343EHsj6O9UbwtMDvNWMovcQ8C8uRqXQLdvTcrJJljmkTZYumcyMQE+d1
         vIm0TzX5QjqtDkl2rFTxoEuXpjoG4hnGAdAVmbAPJu0ce6n9/V22aybNI2z7pfAsI+/2
         zytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756159; x=1734360959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWLBKwMeMVsEMRzTUljA6Xs3Jk0dHNqB1xAY0nLaWgU=;
        b=U948RcJlmQvhKxrjYWToLUwWFrYoiwoLH3+5Tz0xpnUi4kXZMtSMZIZotwckLXVgpQ
         XCO+g+D9E/wFmKaYtOMUeJalhD5zIkQiSWRfCHMEEpIRK2b/blajS+/qf3RJLez7sBoQ
         347OGMOlD2mY7sxhAmXhEO0QvefGqMhUibr6KI5vcT1JdWnGJ21MyKGeFSCV6Z7Zrlz/
         ANJBb4ys1jtD/J7FIemTGUA5/8E5l/SiTOX4UzLBpOM/N9kq9zLeffRXBzK4/GUocCs6
         FBjWGjuO9kJNJnULmpubYBoDEFdSKGLzlyQqGMund5SJj6/ruKwi7abm5CjbCd+FIxxN
         SexA==
X-Forwarded-Encrypted: i=1; AJvYcCVICjCDX9PEkEo4vYlrB0T4Vn4Egp+eTUZppJdb1Psg+q16x02vtnOJ1kB/3fXzz4Eeqw5e@lists.linux.dev
X-Gm-Message-State: AOJu0YwbZuYtULnOMyCZXWvXm0VCjsUodhDjaLwwphXZ/17z1e1ne4Ns
	1AHbKGOWGuUy2FIy1xHzg6hERIo0uunWkkYeMWzNxqFnEylaAKGNRLR7yxhQ0Hw=
X-Gm-Gg: ASbGncuLU3nXgD0ktruJwsGDcEaoBmfwflD+1pJAyP6wyBxwyJHBnoI+EsfJymE5SWi
	SEzlFtfp8jomNAWVUxZwfGjm/OA+sruibUT6M5dKChYuwhAMILR49ntLSRdOE7/XxLm9aKtEJWa
	K0JQ+wZHCl9q3tUwpnPtPwUNl5NCS4UgB4U58x6XAXtoPbUESARvqB20bQd1Yu/hEZX+NpMtVw7
	JRujkess/w1Qil9I8O22hNLhcuhOskq70CqXqWfMCFJouE//zRC/JGUfjfGQVjxAunJy/GS0oqi
	SYzNeOJqXaoNhLkEuQ==
X-Google-Smtp-Source: AGHT+IFcYzEYQutvhbdZHzyuCMrgWxtpReGZHH7Ct+6xnOHVpZt1OZMpqrNXjXhY0+D17GYLNEX+wg==
X-Received: by 2002:a17:907:b98:b0:aa5:1a1c:d0a2 with SMTP id a640c23a62f3a-aa69cda476emr63848566b.34.1733756158636;
        Mon, 09 Dec 2024 06:55:58 -0800 (PST)
Received: from simagnan-ThinkPad-X1-Carbon-Gen-10.. ([87.13.127.164])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm189281266b.73.2024.12.09.06.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:55:58 -0800 (PST)
From: Simone Magnani <simone.magnani@isovalent.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	simone.magnani@isovalent.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v2] bpftool: Probe for ISA v4 instruction set extension
Date: Mon,  9 Dec 2024 15:54:39 +0100
Message-ID: <20241209145439.336362-1-simone.magnani@isovalent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209102644.29880-1-simone.magnani@isovalent.com>
References: <20241209102644.29880-1-simone.magnani@isovalent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new probe to check whether the kernel supports
instruction set extensions v4. The v4 extension comprises several new
instructions: BPF_{SDIV,SMOD} (signed div and mod), BPF_{LD,LDX,ST,STX,MOV}
(sign-extended load/store/move), 32-bit BPF_JA (unconditional jump),
target-independent BPF_ALU64 BSWAP (byte-swapping 16/32/64). These have
been introduced in the following commits respectively:

* ec0e2da ("bpf: Support new signed div/mod instructions.")
* 1f9a1ea ("bpf: Support new sign-extension load insns")
* 8100928 ("bpf: Support new sign-extension mov insns")
* 4cd58e9 ("bpf: Support new 32bit offset jmp instruction")
* 0845c3d ("bpf: Support new unconditional bswap instruction")

Support in bpftool for previous ISA extensions were added in commit
0fd800b2 ("bpftool: Probe for instruction set extensions"). These probes
are useful for userspace BPF projects that want to use newer
instruction set extensions on newer kernels, to reduce the programs'
sizes or their complexity. LLVM provides the mcpu=v4 option since commit
"[BPF] support for BPF_ST instruction in codegen"
(https://github.com/llvm/llvm-project/commit/8f28e8069c4ba1110daee8bddc4d5049b6d4646e).

Changelog:

- v2:
  - moved BPF_JMP32_A macro after BPF_JMP_A in filter.h for consistency
    with include/linux/filter.h, noted by Quentin Monnet <qmo@kernel.org>

Signed-off-by: Simone Magnani <simone.magnani@isovalent.com>
---
 tools/bpf/bpftool/feature.c  | 23 +++++++++++++++++++++++
 tools/include/linux/filter.h | 10 ++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/bpf/bpftool/feature.c b/tools/bpf/bpftool/feature.c
index 4dbc4fcdf473..24fecdf8e430 100644
--- a/tools/bpf/bpftool/feature.c
+++ b/tools/bpf/bpftool/feature.c
@@ -885,6 +885,28 @@ probe_v3_isa_extension(const char *define_prefix, __u32 ifindex)
 			   "V3_ISA_EXTENSION");
 }

+/*
+ * Probe for the v4 instruction set extension introduced in commit 1f9a1ea821ff
+ * ("bpf: Support new sign-extension load insns").
+ */
+static void
+probe_v4_isa_extension(const char *define_prefix, __u32 ifindex)
+{
+	struct bpf_insn insns[5] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_JMP32_IMM(BPF_JEQ, BPF_REG_0, 1, 1),
+		BPF_JMP32_A(1),
+		BPF_MOV64_IMM(BPF_REG_0, 1),
+		BPF_EXIT_INSN()
+	};
+
+	probe_misc_feature(insns, ARRAY_SIZE(insns),
+			   define_prefix, ifindex,
+			   "have_v4_isa_extension",
+			   "ISA extension v4",
+			   "V4_ISA_EXTENSION");
+}
+
 static void
 section_system_config(enum probe_component target, const char *define_prefix)
 {
@@ -1029,6 +1051,7 @@ static void section_misc(const char *define_prefix, __u32 ifindex)
 	probe_bounded_loops(define_prefix, ifindex);
 	probe_v2_isa_extension(define_prefix, ifindex);
 	probe_v3_isa_extension(define_prefix, ifindex);
+	probe_v4_isa_extension(define_prefix, ifindex);
 	print_end_section();
 }

diff --git a/tools/include/linux/filter.h b/tools/include/linux/filter.h
index 65aa8ce142e5..bcc6df79301a 100644
--- a/tools/include/linux/filter.h
+++ b/tools/include/linux/filter.h
@@ -273,6 +273,16 @@
 		.off   = OFF,					\
 		.imm   = 0 })

+/* Unconditional jumps, gotol pc + imm32 */
+
+#define BPF_JMP32_A(IMM)					\
+	((struct bpf_insn) {					\
+		.code  = BPF_JMP32 | BPF_JA,			\
+		.dst_reg = 0,					\
+		.src_reg = 0,					\
+		.off   = 0,					\
+		.imm   = IMM })
+
 /* Function call */

 #define BPF_EMIT_CALL(FUNC)					\
--
2.43.0

Many thanks Quentin for the feedback!
Updated changelog in the commit message with v2, moving the macro after BPF_JMP_A.
Also, adding in cc other maintainers as you suggested.
