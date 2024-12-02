Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770041DBB21
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160957; cv=none; b=PFEUI2oi+PxzSqFUg934ZAqjRUlzuOd1ljcDXuOO27OpGQZalqv3dXvjZKGFRXEHgjD3eDBOeefeZKiA9RrOFh5VabDQcab37OjMsXVFLU6x6SYWOxDpL1iw8qZz+FxHA7Q5hX2k4Ko/BcwVHdKXABN2Rbx1A9hYW3K4AG8+PzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160957; c=relaxed/simple;
	bh=MbX83DaHTWn0NvefhN4LoZ8evHYijYUUe5JWuRqBz2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EClTQ8rqS+hrUA7rND6Z2nOeSNUWy3RskYOYzKZTGz0inDIXCU78YY+eeKTpdCnH7sewGk9wYJY3uHhzNe+9Etet7ZsQfP/pBVopldmoLxSDPYoUeYCloS9Rd3oc36CCW/O018L8OrInuwPSshujtp1pPX524duwDoadzpRzbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlZYm5ez; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlZYm5ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733160957; x=1764696957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MbX83DaHTWn0NvefhN4LoZ8evHYijYUUe5JWuRqBz2M=;
  b=nlZYm5ez4w4EMl+IcAk1tSaBDz82FVUTPrm0MV+1YeScmrw1FjN/S1hP
   /EE39uS+sigiHQjthQygTBlHqSNq2CFy/658U29k3ObmZn10tdKNZLeOo
   q3et5vvqvLDSU/ETD8UYbtELcdutGIO+t1xRmwmAHg02BShiJQN6pfmz7
   cReEpJ1oK17uEdYm6PKSodOQBcRgL3XPtAonkR/+kB8pDXpJvxGLm9sLg
   Dtn8WdbOGk+9bz//j8/4Fll6ga7ltFyrYH5/fSfKUzhG1L7TrUQPA455t
   Hw8EaS9fi8ZbarqbynOCx5ypU+KtFbbWyzKlbYC08oPVOkRLfRG5hXNGW
   g==;
X-CSE-ConnectionGUID: Xe4NXgIBT4iOCRN8LqX1tg==
X-CSE-MsgGUID: l/TpBiEzQN6dMHwUHlg+bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37008719"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="37008719"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:35:56 -0800
X-CSE-ConnectionGUID: yKEWunCTTbG/I+ZbzjsVhQ==
X-CSE-MsgGUID: 2sPYZ2HPTAS9Y7gIS+EHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="94006627"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 09:35:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AFCEF3B2; Mon, 02 Dec 2024 19:35:50 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] sched/fair: Mark m*_vruntime() with __maybe_unused
Date: Mon,  2 Dec 2024 19:35:30 +0200
Message-ID: <20241202173546.634433-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When max_vruntime() is unused, it prevents kernel builds with clang,
`make W=1` and CONFIG_WERROR=y:

kernel/sched/fair.c:526:19: error: unused function 'max_vruntime' [-Werror,-Wunused-function]
  526 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
      |                   ^~~~~~~~~~~~

Fix this by marking them with __maybe_unused (all cases for the sake of
symmetry).

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: dropped applied pieces

 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index fb4ffe27d117..f51a83ccef83 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -523,7 +523,7 @@ void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec);
  * Scheduling class tree data structure manipulation methods:
  */
 
-static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
+static inline __maybe_unused u64 max_vruntime(u64 max_vruntime, u64 vruntime)
 {
 	s64 delta = (s64)(vruntime - max_vruntime);
 	if (delta > 0)
@@ -532,7 +532,7 @@ static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
 	return max_vruntime;
 }
 
-static inline u64 min_vruntime(u64 min_vruntime, u64 vruntime)
+static inline __maybe_unused u64 min_vruntime(u64 min_vruntime, u64 vruntime)
 {
 	s64 delta = (s64)(vruntime - min_vruntime);
 	if (delta < 0)
-- 
2.43.0.rc1.1336.g36b5255a03ac

