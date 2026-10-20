Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.249.212.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503969;
	b=gHgNYQOqYSqwBWV3ahe1NU4dZ34g04lt4evYvMDWo7gm3qjqjRfyedQHHet1qj2Ra8FM
	 dPE+fAE0kCL9qhQBpl4nCTz60/lFB97nPhSS8tPTFCuOKNOfC20FJWZ0EpbMk1kZG7mSp
	 Dq3SBsHznFXKatJSyUfbrSEu4L4lTVAdfLCePas6r9lN9SqfMALZxOTCSuMpXXgfetCA0
	 +TnYKU2E8llMs+3brygQtRg40IaUGw7z7rGLjfSELBNP9TzeqGfFA38K+gGDCWwB5ruuG
	 BT2v3lL/32ydO2/XkgUtaXU3/rDnqpLeX91Zqvgw/fWOhqL1zaAupekbvKhiONcyTkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503969;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=tGpDjmMjZ/UWPYa9zXQtpyzSm087sPQLoSSQvaF1qVU=;
	b=XTnzbdjFcknvvcg2zfrtgZP/2uk2Uki+BWkDdfrVGlJKz4D4auVDNK5byqhbWCYMKcYK
	 jjjXnLW+hBrt5GgcRLpku10WvGDXmYEN6U/2e2mdR9rkpynSByG4xHaWHnjNlOjw/IDwv
	 uE2iQZA6m9gdLFY1WYJ6IYDoS3brv+1CYoFKisIhWIHTIBpHGzwKtHyZUaf3NPbxLOhav
	 HyB/leTMkqF9R7qaKoO6G1XvOFDBElaiyoB6FSJ1wKAS0hhpM6TtkywpzIFhzL2O6PgMu
	 F9KL+UP86Ae130UOmLHh6rqjXdA7glJkmaQFFq1NVAL1cQbgfEROQhW8e/Be0wJVHUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=45.249.212.51
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04AC606F45E
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 13:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04AC606F45E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j8DFv4WZtzYQtvG
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 21:45:55 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 9B3024056B
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 21:45:57 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgB3QOaGcNdq8xegBA--.22174S3;
	Tue, 20 Oct 2026 21:45:57 +0800 (CST)
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
Subject: [PATCH v8 01/15] perf annotate-data: Extract invalidate_reg_state() as a common helper
Date: Tue, 20 Oct 2026 13:44:57 +0000
Message-Id: <6edcf683883edd9191b36ab4880fb64ce79a5821.1792411435.git.wutengda@huaweicloud.com>
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
X-CM-TRANSID:Syh0CgB3QOaGcNdq8xegBA--.22174S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1rJry8CF1kuF1Dur1UGFg_yoW5Wr4fpa
	yDC347Ww13Gr4FgwnxJF43ZFWrur1fXa4Fk3sYywn2vFWIyrn3Jr97tFWrtFW7Xr93Kw12
	yw1qgr4DJayxKaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x
	02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY1x0264kExVAvwVAq07x20xyl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRHmhFDUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

The invalidate_reg_state() function is currently static and only used
within the x86 data type profiling implementation. To prepare for adding
arm64 instruction tracking support, extract it as a common helper that
can be shared across architectures.

No functional change intended.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
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
index 19a6ecd67f28..32af1be4e451 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -748,6 +748,15 @@ struct type_state_stack *findnew_stack_state(struct type_state *state,
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
index bbf4fd35c1d7..d0dc056fb13a 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -267,6 +267,7 @@ void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 				Dwarf_Die *type_die, int ptr_offset);
 struct type_state_stack *find_stack_state(struct type_state *state,
 						int offset);
+void invalidate_reg_state(struct type_state_reg *reg);
 bool get_global_var_type(Dwarf_Die *cu_die, struct data_loc_info *dloc,
 				u64 ip, u64 var_addr, int *var_offset,
 				Dwarf_Die *type_die);
-- 
2.34.1

