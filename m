Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D4AF83F9D5
	for <llvm@lists.linux.dev>; Thu,  5 Sep 2024 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527593; cv=none; b=dMdHMGUyz+hD+fh2iO7erJw+UcpnHiKNMXbxGbAyRMpAhbIVMoEVzA8wWkhdtvQZgCFmhvH61ydPb9Qv6peo74Fu2niYkn3SB2TKlotVt47LWdCYQNgtsCFv6dzVncDCws/yoYtSkUeMQNqU06GHi1+hAk3zMrvRlLH5N5JlvIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527593; c=relaxed/simple;
	bh=l482FcwAKIbf3f2AZAY2M8QuK+XWEKdTtapEqd+G24U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y7/dCHiqCYe4b8e+s+feE7ckuH0dy57vN+R4jigoDda4PWr5vJuE7QKG1Bc1fCBFib8aohiBpRuK97c4OV7M0P1/Ed0IFNm4o0N9MdIM8Tk2elLlhHH/RliGLrJW9ingF0LdxVHEhbRLUWjxbGQtQ9x768NX6hkfMbBLBGGrwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id C12986052BD9D;
	Thu,  5 Sep 2024 17:12:52 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] sched/headers: remove useless code in mm_cid_get()
Date: Thu,  5 Sep 2024 17:12:24 +0800
Message-Id: <20240905091223.2350061-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
In file included from kernel/sched/core.c:88:
kernel/sched/sched.h:3501:2: warning: Value stored to 'cpumask' is never read
 3501 |         cpumask = mm_cidmask(mm);
      |         ^         ~~~~~~~~~~~~~~

'cpumask' has never been used before, delete it to save some space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 kernel/sched/sched.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4c36cc680361..d4088f1b8984 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3494,11 +3494,9 @@ static inline int __mm_cid_get(struct rq *rq, struct mm_struct *mm)
 static inline int mm_cid_get(struct rq *rq, struct mm_struct *mm)
 {
 	struct mm_cid __percpu *pcpu_cid = mm->pcpu_cid;
-	struct cpumask *cpumask;
 	int cid;
 
 	lockdep_assert_rq_held(rq);
-	cpumask = mm_cidmask(mm);
 	cid = __this_cpu_read(pcpu_cid->cid);
 	if (mm_cid_is_valid(cid)) {
 		mm_cid_snapshot_time(rq, mm);
-- 
2.30.2

