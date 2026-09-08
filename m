Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CDB5476D7
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872524; cv=none; b=pqQJ+ev87aYCFFrcDNPdi3iUUeiJ4tdJEd0fKcW+3JJVPLDP6ztHvHW9qWysph9zTkoac5VsCu+jQfHN8brwEGg7UQiTfydZVp/+c3aQXSmpsK3ND5h3G4fzUWXRhyJ0sLsw9WUe/ViEjvWzFtPQbA8E7QcnCLz3wwonlkpvUXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872524; c=relaxed/simple;
	bh=xGOORIL6QQJg7emqIr7LdMJwMV+ip5jXpjzlqznVmiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j0L8ILfKJmYkEds1WT235QCIe18t4jBqsEDXaEHMzZXlgxB+HBDWXnuo1+YmPfL+ODBnsklVIQ/MZ5lWDYcvoQN/GfCi9hNoIALZxcGr+CEYS1N2xykM229l9L62DS+FoVLUlq3tcxHU44UbHTWu23C1p3TNdiNdcI6CTjNBr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hfPFV2YY4zYQvT0
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:01:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D3CF64057D
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:01:53 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAni5gpB6BqC9rlBA--.34632S10;
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
Subject: [PATCH v5 08/26] perf annotate: Adapt arch__dwarf_regnum() for arm64
Date: Tue,  8 Sep 2026 13:01:04 +0000
Message-Id: <20260908130122.633500-9-wutengda@huaweicloud.com>
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
X-CM-TRANSID:gCh0CgAni5gpB6BqC9rlBA--.34632S10
X-Coremail-Antispam: 1UD129KBjvJXoW7ury3uw48Cr47ZF1DGF1Utrb_yoW8Cr1rpw
	srC343Jr10kr40qw4fXFs3WFW3Gw1fA3W5urWktwn7Can3WFyfJa1SyF1F9a17Ars7Aw1Y
	yF4qqw48WFnxAaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Currently, arch__dwarf_regnum() assumes that all architectures use a
register prefix character (e.g., '%' for x86) defined by
arch->objdump.register_char, and uses it to match register names in
objdump output. However, this assumption does not hold for arm64,
where assembly syntax uses bare register names like 'x0', 'w1'
without any prefix.

As a result, arm64 builds may fail to correctly recognize register
names from objdump disassembly, leading to incomplete or incorrect
annotation output.

To address this:

- Make the register prefix check optional, allowing architectures
  without a prefix character to be parsed correctly.

- Extend the delimiter set in strpbrk() to include the closing square
  bracket ']'. In arm64 assembly, memory operands often use bracketed
  syntax such as '[x1, #16]' or '[x2]'. Adding ']' ensures clean
  extraction of register names like 'x2' without trailing characters.

Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 tools/perf/util/annotate.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index a3d48cf88dad..710a67980cea 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2474,19 +2474,21 @@ int annotate_check_args(void)
 
 int arch__dwarf_regnum(const struct arch *arch, const char *str)
 {
-	const char *p;
+	const char *p = str;
 	char *regname, *q;
 	int reg;
 
-	p = strchr(str, arch->objdump.register_char);
-	if (p == NULL)
-		return -1;
+	if (arch->objdump.register_char) {
+		p = strchr(str, arch->objdump.register_char);
+		if (p == NULL)
+			return -1;
+	}
 
 	regname = strdup(p);
 	if (regname == NULL)
 		return -1;
 
-	q = strpbrk(regname, ",) ");
+	q = strpbrk(regname, ",)] ");
 	if (q)
 		*q = '\0';
 
-- 
2.34.1

