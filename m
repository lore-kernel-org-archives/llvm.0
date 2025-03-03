Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033B213220
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008639; cv=none; b=FN01AazFNEeIzr0dRZEur/ObQwoFbTK0OxgHDySuvgd0KoHo8chxAN2gZrxd907skIAetyRtWEDx1A1Fw8PbPu99F06F25Lt2Z27ZkPHMXGv5YZ4yG+9JO14XKa8a0Rto8H+D4rCKhF4SA1gz0eoJwy3X6OgTB0NBYJQUU3Who8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008639; c=relaxed/simple;
	bh=Jrm+7746S7K9yWA40dUMBKTAN0ud8hVu4FIcLZVjvE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0Ds2jrVdx7L4s4xMmai1nt9ue5+X3d3E1LHowYJcThCCfw5RAm03/hKZuEiwuo/SJJfMEuTU91onreXP0ezh2ZthIZXx4uUR4jUoxn2S/VDjXYzyUnO5Tx9HloaoyNZjdabmSH70BztHKNYA6mBo407gboZd36EocwVOZlmq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga6HffYB; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga6HffYB"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-22339936bbfso63856715ad.1
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 05:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741008637; x=1741613437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HoYAW6D8hO+aaE9DpE+f5d9KWUfqlQeSUmUL0RBP80=;
        b=ga6HffYBpoNUYe7Lyc4CwdQMToEQ4viLSRJUapRA9O/buquBTYd9pGg1X0u3o8t8p3
         puTLhcXY24ey0JgwyaejF6VTVz1qUsFNp24Eu24ORTEsSXOwDAKqMachVjZHQu+UpVmJ
         tWC6P02DcKK2eutkvM2rjKcBqh4DHg56O4Tmje0Wg+N33paLus/lRfW45NPR5SMArwkw
         dCWikhPL4XzSOe0v47YwEuosVUpuoJgRS0HdWcvbs9ttH3rgXUOnOko7nPP/4FHSWEqj
         KBGPUazj8AtKFHpsaLPa28YZ/u4bnatKuRY3VZO2dEzqhFxG6T3KUn0r+BYQUGsrO0aJ
         8IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008637; x=1741613437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HoYAW6D8hO+aaE9DpE+f5d9KWUfqlQeSUmUL0RBP80=;
        b=Lu99m/dDtDTDB1B5jvULzH9lJV9VxY/QvCh8s5lqmplS2RFP/CqI28Ha+TNsJAo6Ok
         Z12xG5s5+j6yNpI6xqOADar+dOzfibIxfb8Wx0yb+v/EFuEsvnliT5jooRyrvjDkHU21
         Q5vKFqbmdp0WAXcoyGlvcK0xy55P25WsGDhrQeFSljyrVqvZlsish8JozFK/5ZDDtmYR
         hnMSXToGHxZSbbtxwPvYbXa9qOJ1EEakQJzlFMkIvp7JZRbMe/gbNZrb2dAh5YtC1EAZ
         RBrX2Ub8MeSKsWlFANE7sY17VaKwk93pF0YWRu/xUXL1y836bhNLdzc7A5POxLdDt2Dz
         moMg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ffxaJI8srYLv03OoeU2+1weDofvsmMuFxktDAgMarr5GbEfs/le99SlW2WklaW+8pkZl@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ubXy0OzB8YRyq59yKsSdeju+K1OmKWbZNtLPvzBTiUZ4+aPK
	ozB/UkaPlZ4THO5nR02lkE3p6nioq7KivLEYUar8nv5/kQaeG/G8
X-Gm-Gg: ASbGncvhpLBiWJOVkKpS+y8e5GPrqf22HCXcqcEJmdXPxtQRatUwAEDdeNwSbb4saF4
	TmbXsiQmRtdVOmjEEaue+sqKqUPBaCL0uPduYnKvDs5V3wL8XrNx83K88uTDuThNCGdXTQw7zn1
	Ns0AzJW20V5Ip4PB/RI246YG1rhkKJb6HI9PmMOP9atCsWsTEFPWashPqBv9RLvHq0sEBNxxKaS
	QuifGUwPZW4rENw2D7WGmgccT8zpybeAt3StcnjNpHQLpeGdRw43UCAXS9t/lMDwZ6F+Qg6gfDd
	o+iJgxpJnY2DNkBz9Y+lDj5qMNPV9dpx0JoKKW5b1HTgy/4u/U21vxWLldCv5g==
X-Google-Smtp-Source: AGHT+IGA2mWJTfvekJWlfyFWg7JZnBJRMEmVPtYCpiX/IyOQcjy5rGPgwuYYTPg+xM28+Vd56S613A==
X-Received: by 2002:a17:903:230c:b0:223:7006:4db2 with SMTP id d9443c01a7336-22370064ea3mr156649035ad.31.1741008636600;
        Mon, 03 Mar 2025 05:30:36 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505359b8sm77297035ad.253.2025.03.03.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:36 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
Date: Mon,  3 Mar 2025 21:28:34 +0800
Message-Id: <20250303132837.498938-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303132837.498938-1-dongml2@chinatelecom.cn>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, the layout of cfi and fineibt is hard coded, and the padding is
fixed on 16 bytes.

Factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET. CFI_INSN_OFFSET is
the offset of cfi, which is the same as FUNCTION_ALIGNMENT when
CALL_PADDING is enabled. And FINEIBT_INSN_OFFSET is the offset where we
put the fineibt preamble on, which is 16 for now.

When the FUNCTION_ALIGNMENT is bigger than 16, we place the fineibt
preamble on the last 16 bytes of the padding for better performance, which
means the fineibt preamble don't use the space that cfi uses.

The FINEIBT_INSN_OFFSET is not used in fineibt_caller_start and
fineibt_paranoid_start, as it is always "0x10". Note that we need to
update the offset in fineibt_caller_start and fineibt_paranoid_start if
FINEIBT_INSN_OFFSET changes.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v4:
- rebase to the newest tip/x86/core, the fineibt has some updating
---
 arch/x86/include/asm/cfi.h    | 13 +++++++++----
 arch/x86/kernel/alternative.c | 18 +++++++++++-------
 arch/x86/net/bpf_jit_comp.c   | 22 +++++++++++-----------
 3 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/cfi.h b/arch/x86/include/asm/cfi.h
index 2f6a01f098b5..04525f2f6bf2 100644
--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -108,6 +108,14 @@ extern bhi_thunk __bhi_args_end[];
 
 struct pt_regs;
 
+#ifdef CONFIG_CALL_PADDING
+#define FINEIBT_INSN_OFFSET	16
+#define CFI_INSN_OFFSET		CONFIG_FUNCTION_ALIGNMENT
+#else
+#define FINEIBT_INSN_OFFSET	0
+#define CFI_INSN_OFFSET		5
+#endif
+
 #ifdef CONFIG_CFI_CLANG
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
@@ -118,11 +126,8 @@ static inline int cfi_get_offset(void)
 {
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
-		return 16;
 	case CFI_KCFI:
-		if (IS_ENABLED(CONFIG_CALL_PADDING))
-			return 16;
-		return 5;
+		return CFI_INSN_OFFSET;
 	default:
 		return 0;
 	}
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 32e4b801db99..0088d2313f33 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -917,7 +917,7 @@ void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end)
 
 		poison_endbr(addr);
 		if (IS_ENABLED(CONFIG_FINEIBT))
-			poison_cfi(addr - 16);
+			poison_cfi(addr);
 	}
 }
 
@@ -980,12 +980,13 @@ u32 cfi_get_func_hash(void *func)
 {
 	u32 hash;
 
-	func -= cfi_get_offset();
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+		func -= FINEIBT_INSN_OFFSET;
 		func += 7;
 		break;
 	case CFI_KCFI:
+		func -= CFI_INSN_OFFSET;
 		func += 1;
 		break;
 	default:
@@ -1372,7 +1373,7 @@ static int cfi_rewrite_preamble(s32 *start, s32 *end)
 		 * have determined there are no indirect calls to it and we
 		 * don't need no CFI either.
 		 */
-		if (!is_endbr(addr + 16))
+		if (!is_endbr(addr + CFI_INSN_OFFSET))
 			continue;
 
 		hash = decode_preamble_hash(addr, &arity);
@@ -1380,6 +1381,7 @@ static int cfi_rewrite_preamble(s32 *start, s32 *end)
 			 addr, addr, 5, addr))
 			return -EINVAL;
 
+		addr += (CFI_INSN_OFFSET - FINEIBT_INSN_OFFSET);
 		text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
 		WARN_ON(*(u32 *)(addr + fineibt_preamble_hash) != 0x12345678);
 		text_poke_early(addr + fineibt_preamble_hash, &hash, 4);
@@ -1402,10 +1404,10 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end)
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
 
-		if (!exact_endbr(addr + 16))
+		if (!exact_endbr(addr + CFI_INSN_OFFSET))
 			continue;
 
-		poison_endbr(addr + 16);
+		poison_endbr(addr + CFI_INSN_OFFSET);
 	}
 }
 
@@ -1543,12 +1545,12 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_FINEIBT:
-		/* place the FineIBT preamble at func()-16 */
+		/* place the FineIBT preamble at func()-FINEIBT_INSN_OFFSET */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
-		/* rewrite the callers to target func()-16 */
+		/* rewrite the callers to target func()-FINEIBT_INSN_OFFSET */
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
@@ -1588,6 +1590,7 @@ static void poison_cfi(void *addr)
 	 */
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+		addr -= FINEIBT_INSN_OFFSET;
 		/*
 		 * FineIBT prefix should start with an ENDBR.
 		 */
@@ -1607,6 +1610,7 @@ static void poison_cfi(void *addr)
 		break;
 
 	case CFI_KCFI:
+		addr -= CFI_INSN_OFFSET;
 		/*
 		 * kCFI prefix should start with a valid hash.
 		 */
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 72776dcb75aa..ee86a5df5ffb 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -415,6 +415,12 @@ static int emit_call(u8 **prog, void *func, void *ip);
 static void emit_fineibt(u8 **pprog, u8 *ip, u32 hash, int arity)
 {
 	u8 *prog = *pprog;
+#ifdef CONFIG_CALL_PADDING
+	int i;
+
+	for (i = 0; i < CFI_INSN_OFFSET - 16; i++)
+		EMIT1(0x90);
+#endif
 
 	EMIT_ENDBR();
 	EMIT3_off32(0x41, 0x81, 0xea, hash);		/* subl $hash, %r10d	*/
@@ -432,20 +438,14 @@ static void emit_fineibt(u8 **pprog, u8 *ip, u32 hash, int arity)
 static void emit_kcfi(u8 **pprog, u32 hash)
 {
 	u8 *prog = *pprog;
+#ifdef CONFIG_CALL_PADDING
+	int i;
+#endif
 
 	EMIT1_off32(0xb8, hash);			/* movl $hash, %eax	*/
 #ifdef CONFIG_CALL_PADDING
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
+	for (i = 0; i < CFI_INSN_OFFSET - 5; i++)
+		EMIT1(0x90);
 #endif
 	EMIT_ENDBR();
 
-- 
2.39.5

