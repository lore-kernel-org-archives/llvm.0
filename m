Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.249.212.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503973;
	b=ybGCyHKSqRScfgS7jPwxKZBmIqh3p0D5XGeuAfoGG/g2lpAhsXh3mb4VfSZeDKlcHIyZ
	 LzUTzR1X3fSdnEiVQb7OOrPe5ZGcoV+wuvFNnXzzcfP/ZEDLOMO/svsh8oeuMC4ds3PGF
	 dK/XyVIgwkOm/8o5o8bHZ5xdYm47VpWj2+1saftgT7BRvd4bLjtuyuzglb+07YnxBC9o8
	 fn8ei5gYXkOnAyGMXn4sBTVnZUA6SODbOvTUa2iu//BE0RPuD+mfK8ydTTyPt9Z3HKIBT
	 DlX/NP5dBiy+x8Nkhzc698xyJmz+NLiEs7k+C5duGFN3cK0W6sCWkH7s/X+gjWqUpwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503973;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=tRHSWDdGx1RljX9EM8BDaKzy/46Kg+Yx6xsg2aJ5dic=;
	b=CKYQ2wWxA397Shd/g7f7J4U594HgEhvb/BhXwavhID0RvjHM5s+lDCR3PhpS0jrG3s+q
	 8/wUIdjSXrYtQHbHwuMexI8jMP2VKO9MGePzFon+S4n5NatBNOnIrA//qNBAFLrbfSr8g
	 RJfdMCquLYNgt1ZFLvPc3a/iLjgFz7tDJWatdfoM7/b0u1BfXtNL/mnej2gt90ZCiu3tn
	 euWLTivLoXAzyzcv0jC+ItKpixGwTEa0/RMWZQ5PTEQGBcqGwGiHrWtWjqhepGUYuBcio
	 6SG76Ha/bQF5oSxw0ZWPlNaSuVGUhbI+8gxkncA/2ZF9vIL8zvrtuB4dsuIc6mDKFiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=45.249.212.56
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F2606F46A
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 13:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999F2606F46A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j8DFm3HWMzKHMZV
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 21:45:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 6409540A4A
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 21:45:58 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgB3QOaGcNdq8xegBA--.22174S9;
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
Subject: [PATCH v8 07/15] perf annotate-data: Expand type_state_reg imm_value to u64
Date: Tue, 20 Oct 2026 13:45:03 +0000
Message-Id: <66343ad84d8a95ca695b2f716969ac4c2de0b7a8.1792411435.git.wutengda@huaweicloud.com>
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
X-CM-TRANSID:Syh0CgB3QOaGcNdq8xegBA--.22174S9
X-Coremail-Antispam: 1UD129KBjvJXoWxJr18try5GrW7ZF1DCr4kZwb_yoW8Zw18p3
	90k34UJw1UWr4YgrnxtFWrZFyruF13Za4fG3s8Kw1fZFWfXrn3tryIqF4YyFW8X3s7Cw1U
	Jwn0qr4Dt3ykGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJV
	WxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRQYFCDUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

The arm64 'adrp + add/ldr' instruction pair involves global variable address
calculation and passing, which requires storing the 64-bit address in
type_state_reg. Currently, there is no field in type_state_reg that can
hold such an address. The most likely candidate for reuse is imm_value,
but it is defined as u32, which limits the size of values it can carry.

To address this, expand imm_value from u32 to u64. Also update related
compilation warnings and fix the sign-extension issue introduced by this
change.

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 tools/perf/util/annotate-arch/annotate-x86.c | 4 ++--
 tools/perf/util/annotate-data.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/annotate-arch/annotate-x86.c b/tools/perf/util/annotate-arch/annotate-x86.c
index aa381d25a63b..f5e40cef08ab 100644
--- a/tools/perf/util/annotate-arch/annotate-x86.c
+++ b/tools/perf/util/annotate-arch/annotate-x86.c
@@ -536,11 +536,11 @@ static void update_insn_state_x86(struct type_state *state,
 
 		if (src->imm) {
 			tsr->kind = TSR_KIND_CONST;
-			tsr->imm_value = src->offset;
+			tsr->imm_value = (s64)src->offset;
 			tsr->offset = 0;
 			tsr->ok = true;
 
-			pr_debug_dtp("mov [%x] imm=%#x -> reg%d\n",
+			pr_debug_dtp("mov [%x] imm=%#"PRIx64" -> reg%d\n",
 				     insn_offset, tsr->imm_value, dst->reg1);
 			return;
 		}
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 453efdf6afa6..12b5b6db5f57 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -182,7 +182,7 @@ extern struct annotated_data_stat ann_data_stat;
  */
 struct type_state_reg {
 	Dwarf_Die type;
-	u32 imm_value;
+	u64 imm_value;
 	/*
 	 * The offset within the struct that the register points to.
 	 * A value of 0 means the register points to the beginning.
-- 
2.34.1

