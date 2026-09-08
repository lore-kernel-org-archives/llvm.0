Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460D54854A
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872524; cv=none; b=YlZHm1+2Dt6fx581N6bpOjNbwiUx9RkfjVD03KqSKaN1TpfBNB1WFJI9h1ynBNTmal4Jk3KmGHFZ6FTKGEPdVBdmxIfbMOMpCEAwZ8Vl7K63imoh6okyCiNxQueWgTI3mzrg7GRoI3SHSVaSW1rdTGwW4WiVNqbDiysYbYdD76I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872524; c=relaxed/simple;
	bh=V1/lLQAcdtn+hDCtPPbyRi2VQXlV/Q7PaQaL7rKvNq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LjS9nUuARwtE6m85QYP2U3m/e+79wKmZN5sDmHYaqpY5TjzGEGzvZJHSGlEHiBSuJSmRxA2Ve1nT6j22yKx/zFJAXS/pErRT17kY3iBe5xWv6ZDWacFwxpsNZaMLk/XNdZb000xTWTTbnOweIw6+5zjwplwlUA/OITMIBeUVz8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hfPFV1vykzYQvSx
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:01:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C0D5740576
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:01:53 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAni5gpB6BqC9rlBA--.34632S9;
	Tue, 08 Sep 2026 21:01:53 +0800 (CST)
From: Tengda Wu <wutengda@huaweicloud.com>
To: Namhyung Kim <namhyung@kernel.org>,
	james.clark@linaro.org,
	xueshuai@linux.alibaba.com,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev,
	Li Huafei <lihuafei1@huawei.com>,
	Ian Rogers <irogers@google.com>,
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
Subject: [PATCH v5 07/26] perf dwarf-regs: Adapt get_dwarf_regnum() for arm64
Date: Tue,  8 Sep 2026 13:01:03 +0000
Message-Id: <20260908130122.633500-8-wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908130122.633500-1-wutengda@huaweicloud.com>
References: <20260908130122.633500-1-wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAni5gpB6BqC9rlBA--.34632S9
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyxGrW7tFy3Xw1UCry7trb_yoW5Cw48pF
	srC347Jw4UW3WakwnxAF1fWF1rJw48Zr1FyrW0yw47CrsruF1UZw1fKr1j9F45X3yDJw10
	kayDKr18Gr4rJF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRGMKuUUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

The current arm64 DWARF register lookup relies on 'aarch64_regstr_tbl',
a static string table. While this works for kprobe-tracer where register
names start with '%', it is insufficient for parsing register numbers
directly from raw instructions (e.g., extracting '6' from 'x6' or 'w6')
during annotation.

Since get_dwarf_regnum() is currently used only by 'perf annotate' and
does not affect kprobe-tracer, replace the limited table-based lookup
with a programmatic implementation in __get_dwarf_regnum_arm64(). This
allows resolving arm64 register names (x0-x30, w0-w30, sp, etc.) directly
into their corresponding DWARF register numbers.

Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 .../util/dwarf-regs-arch/dwarf-regs-arm64.c   | 22 +++++++++++++++++++
 tools/perf/util/dwarf-regs.c                  |  2 +-
 tools/perf/util/include/dwarf-regs.h          |  1 +
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
index 593ca7d4fccc..720c863d1869 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
@@ -1,5 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
+#include <ctype.h>
+#include <stdlib.h>
+#include <string.h>
 #include <dwarf-regs.h>
 #include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
 
@@ -10,3 +13,22 @@ int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum)
 
 	return perf_regnum;
 }
+
+int __get_dwarf_regnum_arm64(const char *name)
+{
+	int reg;
+
+	if (!strcmp(name, "sp"))
+		return 31;
+
+	if (*name != 'x' && *name != 'w')
+		return -ENOENT;
+
+	name++;
+	if (!isdigit(*name))
+		return -ENOENT;
+
+	reg = strtol(name, NULL, 10);
+
+	return reg >= 0 && reg <= 30 ? reg : -ENOENT;
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 797f455eba0d..bacf5c13c3bc 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -114,7 +114,7 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags)
 		reg = _get_dwarf_regnum(arm_regstr_tbl, name);
 		break;
 	case EM_AARCH64:
-		reg = _get_dwarf_regnum(aarch64_regstr_tbl, name);
+		reg = __get_dwarf_regnum_arm64(name);
 		break;
 	case EM_CSKY:
 		reg = __get_csky_regnum(name, flags);
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 46a764cf322f..a25f038bbff2 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -105,6 +105,7 @@ int __get_dwarf_regnum_x86_64(const char *name);
 int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
 
+int __get_dwarf_regnum_arm64(const char *name);
 int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
 
-- 
2.34.1

