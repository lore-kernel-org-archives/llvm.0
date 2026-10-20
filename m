Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.249.212.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503973;
	b=caONnLLEFEaQCCkF2LCYqXI7gRSRBoGDvGqt6bZCJ6/SkQ9q4Mu7CQM0ld93mpaPnxSo
	 uw/lsITn4WTkjhMPfLhyb48jK3uNpZAL82QgL78nvjNn1iV4T05eLAqLKsMr98tTv8caj
	 BBHPusqcEqvZCAf8Mv1VgRDtTp1ZPA1gdsMNgBN+D8qhJ+2we89cmkGyECH3lmL8mIhAZ
	 u8P65ylCfRDU5WDPxo5Hzi/df2Lrb93i4OWiU58sgcvstu7ZfB6J3x5HcUZcXaesJx87Z
	 iaMPoZvvvqYtrwW5NE8TcuQz5KY2xatxv244gnS+02mVsPU7JrOyjBvBY/HSQXNqotQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503973;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=TxH9VyIk7w3qs9ARz+Fko9EdYJXgYlKmmGgYsq3ha90=;
	b=YwbRP6PfUwoCgdVuH3eOAAEbytrXMpwJwFO0kw1gZ/wobLTYWlnjLgysSvxlXvypPYOA
	 EVWnX03zxZFDaKkjh5G5mCwU6Yu7yKnXAaIakuHSQrorJYi1Yl353PJC0P2uA8qziYVAA
	 30zVIDMeXUIdvF0hzhvdPb356/3CRsHDVyjsptnEq+1hPfqbYKnuk1yH8sgLJJyZoo+C7
	 5t8A8hSZ3mFF2hdQqotbies0pIQRWO7QTbwPuUeL7ehJ/UZiN50uAzGqtQLuTWRQnFjhz
	 L3T6A1MXJA313ZcXm68SV0Z3d9Qs4jByEPlGxoPhT9WGayzbGMBS+oahayzkobBuPuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=45.249.212.51
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA801606A33A
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 13:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA801606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j8DFw5dk2zYQtwh
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 21:45:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id C26D140573
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 21:45:58 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgB3QOaGcNdq8xegBA--.22174S12;
	Tue, 20 Oct 2026 21:45:58 +0800 (CST)
From: Tengda Wu <wutengda@huaweicloud.com>
To: Namhyung Kim <namhyung@kernel.org>,
	james.clark@linaro.org,
	xueshuai@linux.alibaba.com,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev,
	Li Huafei <lihuafei1@huawei.com>,
	Ian Rogers <irogers@google.com>,
	Kim Phillips <kim.phillips@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Zecheng Li <zli94@ncsu.edu>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tengda Wu <wutengda@huaweicloud.com>
Subject: [PATCH v8 10/15] perf annotate-arm64: Support stack variable tracking
Date: Tue, 20 Oct 2026 13:45:06 +0000
Message-Id: <1915e2def1cdd0d85fe91ebc0b9ca227ef7d4851.1792411435.git.wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792411435.git.wutengda@huaweicloud.com>
References: <cover.1792411435.git.wutengda@huaweicloud.com>
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
X-CM-TRANSID:Syh0CgB3QOaGcNdq8xegBA--.22174S12
X-Coremail-Antispam: 1UD129KBjvJXoW3XryDCr45Kw4UuFWUJF1DJrb_yoWxCFWfpF
	4DGFy3Xw47Jr4S9Fs3Jr48Xr95uws7Kr1qkr90yws2yFy3tr1Ykayktayavay5Jr97Zw17
	Jw4DKr4DX3y7taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I
	80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCj
	c4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YV
	CY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY1x0264kExVAvwVAq07x20xyl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJV
	WxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRQYFCDUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

Extend update_insn_state_arm64() to track data types stored on the
stack.

The implementation handles:
1. Stack Loads: Identify when a register is loaded from a stack
   slot and update the register's type state based on the tracked
   stack content or compound member types.
2. Stack Stores: Update or create new stack state entries when
   a tracked register type is stored to the stack.

Similar to loads, stores also support saving one or two registers
(in the case of 'stp'). Therefore, propagate_store_reg_state() is
introduced.

With these changes, the instruction tracker can now follow data types
as they move between registers and memory, specifically for function
local variables and compiler-spilled values on arm64.

Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 .../perf/util/annotate-arch/annotate-arm64.c  | 153 +++++++++++++++++-
 1 file changed, 145 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/annotate-arch/annotate-arm64.c b/tools/perf/util/annotate-arch/annotate-arm64.c
index e0bb37d8b353..e97a0cbe02fc 100644
--- a/tools/perf/util/annotate-arch/annotate-arm64.c
+++ b/tools/perf/util/annotate-arch/annotate-arm64.c
@@ -624,6 +624,8 @@ static int propagate_load_reg_state(struct type_state *state,
 	u32 insn_offset = dl->al.offset;
 	int sreg = src->reg1;
 	int reg_offset;
+	int fbreg = dloc->fbreg;
+	int fboff = 0;
 
 	if (!has_reg_type(state, dreg))
 		return -1;
@@ -633,12 +635,57 @@ static int propagate_load_reg_state(struct type_state *state,
 	tsr->lifetime_active = false;
 	tsr->lifetime_end = 0;
 
+	if (dloc->fb_cfa) {
+		u64 ip = dloc->ms->sym->start + dl->al.offset;
+		u64 pc = map__rip_2objdump(dloc->ms->map, ip);
+
+		if (die_get_cfa(dloc->di->dbg, pc, &fbreg, &fboff) < 0)
+			fbreg = -1;
+	}
+
 retry:
 	if (arch_get_reg_offset(dloc->arch, src, sreg, state, false, &reg_offset))
 		goto load_non_regoff;
 
 	reg_offset += mem_spacing;
 
+	/* Check stack variables with offset */
+	if (sreg != -1 && (sreg == fbreg || sreg == state->stack_reg)) {
+		struct type_state_stack *stack;
+		int offset = sreg == fbreg ? reg_offset - fboff : reg_offset;
+
+		stack = find_stack_state(state, offset);
+		if (stack == NULL) {
+			return -1;
+		} else if (!stack->compound) {
+			tsr->type = stack->type;
+			tsr->kind = stack->kind;
+			tsr->offset = stack->ptr_offset;
+			tsr->imm_value = stack->imm_value;
+			tsr->ok = true;
+		} else if (die_get_member_type(&stack->type,
+					       offset - stack->offset,
+					       &type_die)) {
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_TYPE;
+			tsr->offset = 0;
+			tsr->imm_value = 0;
+			tsr->ok = true;
+		} else {
+			return -1;
+		}
+
+		if (sreg == fbreg) {
+			pr_debug_dtp("%s [%x] -%#x(stack) -> reg%d",
+				     dl->ins.name, insn_offset, -offset, dreg);
+		} else {
+			pr_debug_dtp("%s [%x] %#x(reg%d) -> reg%d",
+				     dl->ins.name, insn_offset, offset, sreg, dreg);
+		}
+		pr_debug_type_name(&tsr->type, tsr->kind);
+		return 0;
+	}
+
 	if (!src_tsr || !src_tsr->ok)
 		return -1;
 
@@ -757,18 +804,108 @@ static bool is_standard_store_insn(const char *name)
 	       !strncmp(name, "stp", 3);     /* stp */
 }
 
+/*
+ * For store insns: propagate type from @sreg to the memory location referenced
+ * by @dst, applying @mem_spacing to account for multi-regs stores (e.g. stp).
+ */
+static void propagate_store_reg_state(struct type_state *state,
+				      struct data_loc_info *dloc,
+				      struct disasm_line *dl, int sreg,
+				      struct annotated_op_loc *dst,
+				      int mem_spacing)
+{
+	struct type_state_reg *tsr;
+	u32 insn_offset = dl->al.offset;
+	int dreg = dst->reg1;
+	int reg_offset;
+	int fbreg = dloc->fbreg;
+	int fboff = 0;
+
+	if (arch_get_reg_offset(dloc->arch, dst, dreg, state, false, &reg_offset))
+		return;
+
+	reg_offset += mem_spacing;
+
+	if (dloc->fb_cfa) {
+		u64 ip = dloc->ms->sym->start + dl->al.offset;
+		u64 pc = map__rip_2objdump(dloc->ms->map, ip);
+
+		if (die_get_cfa(dloc->di->dbg, pc, &fbreg, &fboff) < 0)
+			fbreg = -1;
+	}
+
+	/* Check stack variables with offset */
+	if (dreg != -1 && (dreg == fbreg || dreg == state->stack_reg)) {
+		struct type_state_stack *stack;
+		int offset = dreg == fbreg ? reg_offset - fboff : reg_offset;
+
+		if (!has_reg_type(state, sreg) || !state->regs[sreg].ok) {
+			stack = find_stack_state(state, offset);
+			/* Preserve compound states when only a member is overwritten. */
+			if (stack && !stack->compound)
+				delete_stack_state(state, offset);
+
+			return;
+		}
+
+		tsr = &state->regs[sreg];
+
+		stack = find_stack_state(state, offset);
+		if (stack) {
+			if (!stack->compound)
+				set_stack_state(stack, offset, tsr->kind, &tsr->type,
+						tsr->offset, tsr->imm_value);
+			/*
+			 * If it's a compound type, it means attempting to
+			 * write to a member value of the compound type without
+			 * changing the compound type itself, so do nothing.
+			 */
+		} else {
+			findnew_stack_state(state, offset, tsr->kind, &tsr->type,
+					    tsr->offset, tsr->imm_value);
+		}
+
+		if (dreg == fbreg) {
+			pr_debug_dtp("%s [%x] reg%d -> -%#x(stack)",
+				     dl->ins.name, insn_offset, sreg, -offset);
+		} else {
+			pr_debug_dtp("%s [%x] reg%d -> %#x(reg%d)",
+				     dl->ins.name, insn_offset, sreg, offset, dreg);
+		}
+		if (tsr->offset != 0)
+			pr_debug_dtp(" reg%d offset %#x ->", sreg, tsr->offset);
+
+		pr_debug_type_name(&tsr->type, tsr->kind);
+	}
+	/*
+	 * Ignore other transfers since it'd set a value in a struct
+	 * and won't change the type.
+	 */
+}
+
 static void update_store_insn_state(struct type_state *state,
 				    struct data_loc_info *dloc,
 				    struct disasm_line *dl,
+				    struct annotated_op_loc *src,
 				    struct annotated_op_loc *dst)
 {
-	/*
-	 * Ignore transfers since it'd set a value in a struct
-	 * and won't change the type.
-	 *
-	 * Needs to update the pre-index and post-index addressing
-	 * modes for the destination register.
-	 */
+	int mem_spacing = 0;
+
+	if (!has_reg_type(state, dst->reg1))
+		return;
+
+	/* Handle the first source register */
+	propagate_store_reg_state(state, dloc, dl, src->reg1, dst, mem_spacing);
+
+	/* Handle the second source register (if any) */
+	if (src->multi_regs) {
+		mem_spacing = arm64__reg_size(dl->ops.source.raw);
+
+		if (mem_spacing >= 0)
+			propagate_store_reg_state(state, dloc, dl, src->reg2,
+						  dst, mem_spacing);
+	}
+
 	adjust_reg_index_state(state, dloc, dl, dst);
 }
 
@@ -793,7 +930,7 @@ static void update_insn_state_arm64(struct type_state *state,
 		update_load_insn_state(state, dloc, dl, src, dst);
 	/* Register to memory transfers */
 	else if (is_standard_store_insn(dl->ins.name))
-		update_store_insn_state(state, dloc, dl, dst);
+		update_store_insn_state(state, dloc, dl, src, dst);
 	else
 		invalidate_unhandled_insn_regs(state, dl, src, dst);
 }
-- 
2.34.1

