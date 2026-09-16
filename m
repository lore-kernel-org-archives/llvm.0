Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FB3AFB01
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522224; cv=none; b=Ea4jVZSzM6pRypBJfiNR/DDOU/aAoEsK5VbvcyhnZokJ2LrMFi5/ZrFJQ9TOm5NWrXtbrSeicDyjkvlwem+t8Mq6SKLLDRuEJd8tTZ/KrpDtQ24S40obesx1ueKHP1ta1pC2vMMs5PX9Q6nthF5mZWyPfnX1nFfFG9t8L9ePAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522224; c=relaxed/simple;
	bh=WYqUr/mqKlO1HaSBmbRolJ9/ErEUm5dWB2ZH8l5XqpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chQ0dz4Y8rP5ML02/xwt49dxCbBGfewJQYz+9Iasqx30n8+Bm/DLGjktS0qOiBZc15zCK47aTg4o1WNqwOkrNrA006+R8n5rIhHtjptW1GXtyIp/R9LeKrkV3UOWurzpl9tvdgdiMl3k9hc7/HUPmw+KTsJyITAUROzTtrgliKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hl1XT6KBBzYQtpr
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 09:30:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 056C24057B
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 09:30:06 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAn+CoH8alqUcjbAQ--.36458S14;
	Wed, 16 Sep 2026 09:30:05 +0800 (CST)
From: Tengda Wu <wutengda@huaweicloud.com>
To: Namhyung Kim <namhyung@kernel.org>,
	james.clark@linaro.org,
	xueshuai@linux.alibaba.com,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev,
	Li Huafei <lihuafei1@huawei.com>,
	Kim Phillips <kim.phillips@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Zecheng Li <zli94@ncsu.edu>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tengda Wu <wutengda@huaweicloud.com>
Subject: [PATCH v6 12/26] perf annotate-data: Extract invalidate_reg_state() as a common helper
Date: Wed, 16 Sep 2026 01:29:26 +0000
Message-Id: <a0278c0d5f01dc636823ffb4b5312a9ad7916d3e.1789521520.git.wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1789521520.git.wutengda@huaweicloud.com>
References: <cover.1789521520.git.wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAn+CoH8alqUcjbAQ--.36458S14
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1rJry8CF1ktr17Kr4UJwb_yoW5XrW5p3
	yDC347Gw43Gr4FgwnxJFW3XFyrur1fXa4Fk3sYy3Z2vFWIyrn3Jr92qFy5tFW7Xr93Gw12
	yw1qgr4DJayxKaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7Cj
	xVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxc
	IEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc7CjxVAKzI0EY4vE52x082I5
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr
	0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7sRNg4S3UUUU
	U==
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

The invalidate_reg_state() function is currently static and only used
within the x86 data type profiling implementation. To prepare for adding
arm64 instruction tracking support, extract it as a common helper that
can be shared across architectures.

No functional change intended.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 tools/perf/util/annotate-arch/annotate-x86.c | 9 ---------
 tools/perf/util/annotate-data.c              | 9 +++++++++
 tools/perf/util/annotate-data.h              | 1 +
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/annotate-arch/annotate-x86.c b/tools/perf/util/annotate-arch/annotate-x86.c
index 1acf31a2c759..aa381d25a63b 100644
--- a/tools/perf/util/annotate-arch/annotate-x86.c
+++ b/tools/perf/util/annotate-arch/annotate-x86.c
@@ -207,15 +207,6 @@ static int x86__cpuid_parse(struct arch *arch, const char *cpuid)
 }
 
 #ifdef HAVE_LIBDW_SUPPORT
-static void invalidate_reg_state(struct type_state_reg *reg)
-{
-	reg->kind = TSR_KIND_INVALID;
-	reg->ok = false;
-	reg->lifetime_active = false;
-	reg->lifetime_end = 0;
-	reg->copied_from = -1;
-}
-
 static void update_insn_state_x86(struct type_state *state,
 				  struct data_loc_info *dloc, Dwarf_Die *cu_die,
 				  struct disasm_line *dl)
diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index aff60a630fd0..82003d2c240d 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -638,6 +638,15 @@ struct type_state_stack *findnew_stack_state(struct type_state *state,
 	return stack;
 }
 
+void invalidate_reg_state(struct type_state_reg *reg)
+{
+	reg->kind = TSR_KIND_INVALID;
+	reg->ok = false;
+	reg->lifetime_active = false;
+	reg->lifetime_end = 0;
+	reg->copied_from = -1;
+}
+
 /* Maintain a cache for quick global variable lookup */
 struct global_var_entry {
 	struct rb_node node;
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index ca2096a9ee62..2af70e3cf73f 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -258,6 +258,7 @@ void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 				Dwarf_Die *type_die, int ptr_offset);
 struct type_state_stack *find_stack_state(struct type_state *state,
 						int offset);
+void invalidate_reg_state(struct type_state_reg *reg);
 bool get_global_var_type(Dwarf_Die *cu_die, struct data_loc_info *dloc,
 				u64 ip, u64 var_addr, int *var_offset,
 				Dwarf_Die *type_die);
-- 
2.34.1

