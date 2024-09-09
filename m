Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C0191
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879215; cv=none; b=elW1kZ1GWxYR+WRrcroz7M0OTrDy21mKzHmM/kJUYMAM2fpYz3cHbDhIL8RxzZFzUN09sBN3vTCWg1HP4HWOavR2amIlROo6vkraAdL5Oq6uPf5lqNx9hjfsG7hEEQ2rydB3wfHyAqRJzTSyEui4fEHPjNdWaY1KLx26HzefuFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879215; c=relaxed/simple;
	bh=L8zTApnftuKIPWF/1of8D45op0E0msf9CkZIUtmNpFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mnvx6/O0ncf16z0hFb7JT7PAO8Zq8Ye+DMVQ+bjituz2qLaNVdLspZ6ar5AIeHjZ8oqPsvdl+wHAcUp1WO5sDVQuNnYSnCYSOk+eP7l6hRCEDQA3dtNprmaWOlIFECoFV7bmn49Uv96ZkHd4sPyM0A19NDI7JmU/0IxnXAZ6K0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmXpqmqH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmXpqmqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725879214; x=1757415214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L8zTApnftuKIPWF/1of8D45op0E0msf9CkZIUtmNpFs=;
  b=dmXpqmqHwwclCxKZpSEcJzmtTmdTWvw18/4wnXhzISrl25ZLlb9imPjn
   8zHcOxwB9hZME49N+QD1UTnj8m4lEe6x9D7DHjmQ8acKiu83rpT5fRii/
   1NzydyxWb00gngL2RZ9C+4UHfpOdqmL5dOQmxFHH6LLFlENq2jBPuuVbw
   CbDjoiTVlUa185csuC5EIWvc2FT0zIg1zjMt0TKuun5h/wNpmQQz3EHAe
   tc3aJHvrWyRiB4uaGWeE15iymwFOUZzrVYuCC9J3m5MHbDO+NGpLDV8cL
   j2nPDO9Yrba/lgaj2DpSkvjhTt7m5RnVhf7UZK93j8JcKyJ2SlsMBByhi
   w==;
X-CSE-ConnectionGUID: +2e2PluHS0O9JpXmwrjPcg==
X-CSE-MsgGUID: n1Z9cF12SuyDn/aK0bk8hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24433124"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24433124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 03:53:34 -0700
X-CSE-ConnectionGUID: Cz/m6/G4QZ2LE+eZo4SCbg==
X-CSE-MsgGUID: +xWHHtMaR3iJ6nkWb8mwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="70744672"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2024 03:53:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3A6AB321; Mon, 09 Sep 2024 13:53:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] tracing: Drop unused helper function to fix the build
Date: Mon,  9 Sep 2024 13:53:14 +0300
Message-ID: <20240909105314.928302-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A helper function defined but not used. This, in particular,
prevents kernel builds with clang, `make W=1` and CONFIG_WERROR=y:

kernel/trace/trace.c:2229:19: error: unused function 'run_tracer_selftest' [-Werror,-Wunused-function]
 2229 | static inline int run_tracer_selftest(struct tracer *type)
      |                   ^~~~~~~~~~~~~~~~~~~

Fix this by dropping unused functions.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/trace/trace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index edf6bc817aa1..c3b2c7dfadef 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2226,10 +2226,6 @@ static __init int init_trace_selftests(void)
 }
 core_initcall(init_trace_selftests);
 #else
-static inline int run_tracer_selftest(struct tracer *type)
-{
-	return 0;
-}
 static inline int do_run_tracer_selftest(struct tracer *type)
 {
 	return 0;
-- 
2.43.0.rc1.1336.g36b5255a03ac

