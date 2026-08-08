Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B33CF054
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191870; cv=none; b=hz+qgK//PkodXJ7bgTzs2++jAfwCijCDMJqJzieSPa32KUC5gXQAS/swShAhmcQU0Q0s+6S1WtJHr49WhYx5J7wzoslqOzNbKdAeZ+0IsPGYshKDV4cU4XBiQcwAgqtbNr/4plq8TH866xtLz0qFbY0y7NRDl/8Je1JQVtl6DgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191870; c=relaxed/simple;
	bh=gqunXJZJNSQd7/jBHTsC8Dd4mUBRbsmMmUIBrBXki7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W+xa30/ZFbYy+LbGa46atTXhsQtpG3QEovK/lZnxb3p2mK3c6ArqYiWfO2PynNrJeeUCdwDf6inRMDSgz+mnvbk8r0+vtnBlioxBFSVOE4tMATVZnShi/gkKUOnan9cztpP3tJrwOOUdQcf5ohCNQy0rcuQEioHZ/V+IEHEtK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hHKtH4xJyzYQv2D
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 20:23:19 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id D6BAC408E5
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 20:24:17 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgB34YjkH3dqbrhMBg--.41805S8;
	Sat, 08 Aug 2026 20:24:17 +0800 (CST)
From: Tengda Wu <wutengda@huaweicloud.com>
To: Namhyung Kim <namhyung@kernel.org>,
	james.clark@linaro.org,
	xueshuai@linux.alibaba.com,
	Li Huafei <lihuafei1@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev,
	Ian Rogers <irogers@google.com>,
	Kim Phillips <kim.phillips@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: [PATCH v4 06/23] perf annotate: Adapt arch__dwarf_regnum() for arm64
Date: Sat,  8 Aug 2026 12:23:43 +0000
Message-Id: <20260808122400.2961238-7-wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808122400.2961238-1-wutengda@huaweicloud.com>
References: <20260808122400.2961238-1-wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgB34YjkH3dqbrhMBg--.41805S8
X-Coremail-Antispam: 1UD129KBjvJXoWxArWxCFWrWFW3KryUGrWxZwb_yoW5GFW5pw
	srCw13Jr18Gr4Fqw43JF4fWFW3Gr1fZF15urs5twn7AFs7uryrJan3tF1Y9ay3Jrs7Jr1j
	vr4qgr1kXF1fCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

- Remove the 'static' qualifier from arch__dwarf_regnum() so that it
  can be reused by other architecture-specific profiling components
  in future changes.

Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 tools/perf/util/annotate.c | 14 ++++++++------
 tools/perf/util/annotate.h |  2 ++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index df70e95a8470..9d8b4d6b859b 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2472,21 +2472,23 @@ int annotate_check_args(void)
 	return 0;
 }
 
-static int arch__dwarf_regnum(const struct arch *arch, const char *str)
+int arch__dwarf_regnum(const struct arch *arch, const char *str)
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
 
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index fa08d09b80f7..11b6e4780c02 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -492,6 +492,8 @@ int annotate_parse_percent_type(const struct option *opt, const char *_str,
 
 int annotate_check_args(void);
 
+int arch__dwarf_regnum(const struct arch *arch, const char *str);
+
 /**
  * struct annotated_op_loc - Location info of instruction operand
  * @reg1: First register in the operand
-- 
2.34.1

