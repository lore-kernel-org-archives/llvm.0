Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222BD396D15
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522218; cv=none; b=tkwmNcTNn5PpnUy4CQJEE0m0nSg5k897XAUhi4pAo/kLVMxv06zDU8rdlS8fkw3PM0tP3fEaGmk0iOOnL+EzcbpXbOh9izyIg3Bs3UD1DqMus2VUJlDy5mOcGzqC+JW93k9/WlIIIvyCBMo96l9R/Kyr5gMzD0uuRpmfI0Rf5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522218; c=relaxed/simple;
	bh=L43fAWvi1JW9a7ix+z5PjQrdj7t6r8ko5qEIQZt4YE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C42RVHBzuwepsnCrC5LVM+lLr8ypzdh8tohN3gJRgMEQHe/F8XEPxo5StL2cfIs5glW7qv/8BFCewvmYrv8XjPE1gGSCpYxW12qb4qWjCykXr/JraFcWdk/fSJ180hweIoD9GC8a2KD8ub1EQTAKvyFOXGREks3p0T0x1ajihBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hl1XH30mMzKHMRP
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 09:29:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 103CE4056E
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 09:30:05 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAn+CoH8alqUcjbAQ--.36458S4;
	Wed, 16 Sep 2026 09:30:04 +0800 (CST)
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
Subject: [PATCH v6 02/26] perf llvm: Fix arm64 adrp instruction disassembly mismatch with objdump
Date: Wed, 16 Sep 2026 01:29:16 +0000
Message-Id: <63d15af66450065329b08f41794738c2e8c811ab.1789521520.git.wutengda@huaweicloud.com>
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
X-CM-TRANSID:gCh0CgAn+CoH8alqUcjbAQ--.36458S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWryxGryUCF1fWF1rWw1xZrb_yoW5uF43pr
	ZFkayrXryUAr1fZ39IkF47WFn8trZ2gF4Yg3y3A3yvkr4xtFyxC34xGF129F1UXryqq3y5
	CrWqvFyUGF1kArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6x
	kF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkF7I0Ew4C26cxK6c8Ij28IcwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRQL00DUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

The operands of 'adrp' instructions parsed by libllvm are currently
represented as raw immediates rather than the "address <symbol+offset>"
format used by objdump. This inconsistency causes arm64_mov__parse()
to fail when parsing these instructions during post-processing.

Example of the mismatch:
  Current: adrp  x18, 8014
  Objdump: adrp  x18, ffff800081f5f000 <this_cpu_vector>

Fix this by manually extracting the target address from the raw adrp
instruction via symbol_lookup_callback(). The address is then converted
to a specific symbol during symbol__disassemble_llvm() and formatted
to match objdump's output, ensuring compatibility with existing
parsers.

Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 tools/perf/util/llvm.c | 52 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index a0deb742a733..a78845689aa1 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -9,8 +9,10 @@
 #include "symbol.h"
 #include <errno.h>
 #include <fcntl.h>
+#include <string.h>
 #include <unistd.h>
 #include <linux/zalloc.h>
+#include <linux/bitops.h>
 
 #ifdef HAVE_LIBLLVM_SUPPORT
 #include "llvm-c-helpers.h"
@@ -108,6 +110,16 @@ symbol_lookup_callback(void *disinfo, uint64_t value,
 		storage->branch_addr = value;
 	else if (*ref_type == LLVMDisassembler_ReferenceType_In_PCrel_Load)
 		storage->pcrel_load_addr = value;
+	else if (*ref_type == LLVMDisassembler_ReferenceType_In_ARM64_ADRP) {
+		uint64_t adrp_imm;
+
+		/* immhi (bits 23:5) and immlo (bits 30:29) */
+		adrp_imm = ((value & 0x00ffffe0) >> 3) | ((value >> 29) & 0x3);
+		adrp_imm = sign_extend64(adrp_imm, 20);
+
+		/* Calculate the target page address */
+		storage->pcrel_load_addr = (address & ~0xfffULL) + (adrp_imm << 12);
+	}
 	*ref_type = LLVMDisassembler_ReferenceType_InOut_None;
 	return NULL;
 }
@@ -228,12 +240,42 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 			}
 		}
 		if (storage.pcrel_load_addr != 0) {
-			char *name = llvm_name_for_data(dso, filename,
+			char *name;
+
+			if (arch__is_arm64(args->arch)) {
+				/*
+				 * For arm64, replace the immediate operand with
+				 * the resolved address to match objdump's output.
+				 *
+				 * Example conversion:
+				 *   From: adrp  x18, 8014
+				 *   To:   adrp  x18, ffff800081f5f000
+				 */
+				char *s = strchr(disasm_buf, ',');
+
+				if (s == NULL)
+					goto err;
+
+				s++;
+				*s = '\0';
+				disasm_len = strlen(disasm_buf);
+				disasm_len += scnprintf(disasm_buf + disasm_len,
+							sizeof(disasm_buf) - disasm_len,
+							" %"PRIx64,
 							storage.pcrel_load_addr);
-			disasm_len += scnprintf(disasm_buf + disasm_len,
-						sizeof(disasm_buf) - disasm_len,
-						"  # %#"PRIx64,
-						storage.pcrel_load_addr);
+			} else {
+				/*
+				 * For other archs, append the resolved address
+				 * as an inline comment.
+				 */
+				disasm_len += scnprintf(disasm_buf + disasm_len,
+							sizeof(disasm_buf) - disasm_len,
+							"  # %#"PRIx64,
+							storage.pcrel_load_addr);
+			}
+
+			/* Append the resolved symbol name if available */
+			name = llvm_name_for_data(dso, filename, storage.pcrel_load_addr);
 			if (name) {
 				disasm_len += scnprintf(disasm_buf + disasm_len,
 							sizeof(disasm_buf) -
-- 
2.34.1

