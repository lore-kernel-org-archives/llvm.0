Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95602BCF5
	for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 02:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756346545; cv=none; b=HYKZsot4QpW4Nla4ymYojQn9oavDjobHjYGeooteZR2Q9ZxdMwJSsHweycUcZ17QepR1KLGUnbqtlK457LZCkdXM2+DrieyPT3j1NF3X65hBb4RaXeqLZ58cVOGN6Jhpl6oE0L8SubqjJQLHbSpsjnP9OXikaLLhFLt/bSJxPzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756346545; c=relaxed/simple;
	bh=vsfhv3Gr7aPA9DerCN7CntWRlP3vsCWyOX62qut/PpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NdxBiZT9b3MN7YtLYIFt/q1yRUVjlCLv0n8n1FBQh4VBzgctMN2LWysrUziX1z0e/LOXdRErI6Ys6ld1HTs4fxWh159iiX3EbAH+LBZKlf+xCgj9lE2BOoskBhuJX7gzzXliwR7BWL1oAoM2iIcff+uG1+taA+x7L7p2FR8vIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kQG/Le85; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kQG/Le85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OC
	PqRs8ymz/48v/kbOviYYdt13c7ovX3tb/1u5IzY5o=; b=kQG/Le850NIFk5U8k/
	rjYOVs3cyLtvg2+HveeRz1XgvBb70po5NLdGAJ0lIg5fPMI9Zulmaj3ay/ZURPeV
	X6etzSBaj6+I6ZXjqJr9WOlp6eQ8Gksll+rP/x56NOtHgKq/EiosmHE11saEjWjO
	VUwzjtJY+dDrBDk3i/cHVvRbQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wA3NVB_uK9o16VVEQ--.1167S2;
	Thu, 28 Aug 2025 10:01:37 +0800 (CST)
From: Feng Yang <yangfeng59949@163.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 bpf-next] selftests/bpf: Fix the invalid operand for instruction issue
Date: Thu, 28 Aug 2025 10:01:35 +0800
Message-Id: <20250828020135.248869-1-yangfeng59949@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3NVB_uK9o16VVEQ--.1167S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww48WrWxZFyxWry7Cr4rXwb_yoW8XF15p3
	W8W3s0qF1Sgr15XF47Jr47WF4rGFs3Xr48Cw40ywsrAF15Cr97JryxKrWYgr9xWa93ur4f
	ZFn7tr4a9F4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMc_hUUUUU=
X-CM-SenderInfo: p1dqww5hqjkmqzuzqiywtou0bp/1tbiYxi3eGivsoPJhQAAsO

From: Feng Yang <yangfeng@kylinos.cn>

The following issue occurs when compiling with clang version 17.0.6:
progs/compute_live_registers.c:251:3: error: invalid operand for instruction
  251 |                 "r0 = 1;"
      |                 ^
<inline asm>:1:22: note: instantiated into assembly here
    1 |         r0 = 1;r2 = 2;if r1 & 0x7 goto +1;exit;r0 = r2;exit;
      |                             ^
1 error generated.

Use __imm_insn to fix this issue.

Fixes: 4a4b84ba9e453 ("selftests/bpf: verify jset handling in CFG computation")
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
Changes in v2:
- Use __imm_insn, thanks: Eduard Zingerman.
- Link to v1: https://lore.kernel.org/all/20250827031540.461017-1-yangfeng59949@163.com/
---
 tools/testing/selftests/bpf/progs/compute_live_registers.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/compute_live_registers.c b/tools/testing/selftests/bpf/progs/compute_live_registers.c
index 6884ab99a421..01d73ad76faf 100644
--- a/tools/testing/selftests/bpf/progs/compute_live_registers.c
+++ b/tools/testing/selftests/bpf/progs/compute_live_registers.c
@@ -249,11 +249,13 @@ __naked void if3_jset_bug(void)
 	asm volatile (
 		"r0 = 1;"
 		"r2 = 2;"
-		"if r1 & 0x7 goto +1;"
+		".8byte %[jset];" /* same as 'if r1 & 0x7 goto +1;' */
 		"exit;"
 		"r0 = r2;"
 		"exit;"
-		::: __clobber_all);
+		:
+		: __imm_insn(jset, BPF_JMP_IMM(BPF_JSET, BPF_REG_1, 0x7, 1))
+		: __clobber_all);
 }
 
 SEC("socket")
-- 
2.43.0

