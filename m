Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1D559C95
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872758; cv=none; b=dbl2LpgaMXf01soRDWwJmInSEQB1X4qy7VoBo5+mVyKAFP8POahnx+HE5DOgt/xaKddQ5Io75vuYlUw+SmA23/uyJSgzzeeHPPhfGEJoyM/0ipQYNzJq4Sqm27Y3DHb8AXz6av5ORbXvqnDosehLfrRxTHKkxP5odrTykssfi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872758; c=relaxed/simple;
	bh=xGOORIL6QQJg7emqIr7LdMJwMV+ip5jXpjzlqznVmiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XmwECLqO3XBNLN27oFIFOHPVqrVEkBIavEcQk8SUF5ujC8yOL4yn/ywRPFFrLzbnjA4BM5Wsp9RJZ8jjQiqqU3aMFFsQZXymRA3haagY8VBPHo1w9n4naW0NIaWcaeqkUyw7KxK1vLU410J8ef9nSR8qyW8oRQoBEQusnFjP15M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hfPKv36fqzYQw42
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:04:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id E98AE40576
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:05:42 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgDHLUoeCKBqX3XjBA--.22748S10;
	Tue, 08 Sep 2026 21:05:42 +0800 (CST)
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
Date: Tue,  8 Sep 2026 13:05:11 +0000
Message-Id: <723d0c1e1261cb5b38af7ed4fda9d26ae2986319.1788872630.git.wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1788872630.git.wutengda@huaweicloud.com>
References: <cover.1788872630.git.wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgDHLUoeCKBqX3XjBA--.22748S10
X-Coremail-Antispam: 1UD129KBjvJXoW7ury3uw48Cr47ZF1DGF1Utrb_yoW8Cr1rpw
	srC343Jr10kr40qw4fXFs3WFW3Gw1fA3W5urWktwn7Can3WFyfJa1SyF1F9a17Ars7Aw1Y
	yF4qqw48WFnxAaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHCb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4
	xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20V
	AGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26rWY6Fy7MxkF7I0Ew4C2
	6cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa
	7xRxnoUUUUUUU==
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

