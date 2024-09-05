Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444DB54F87
	for <llvm@lists.linux.dev>; Thu,  5 Sep 2024 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725555797; cv=none; b=ihnX3+H5oJs3xrDVW1FBfKd8WiHJZZ0eu9mRCzpKUcRSyZODj3I0qoCiRL/o3L1uW3/liiuWmAWL2FaYqNaLcEHKixqKaBAhtW+YwcPaCjqM+6aIV2ZkAZaScCFLR6BzDBbtLEF1pZTgowFsq9Ivz7YE7Z0ndqeQ+Vn3iNrLHqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725555797; c=relaxed/simple;
	bh=jBlfS9LpREMmCfI8EHARvp0EI/YS2QafWg/0wZ5hBs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hsSRG+kyUws19TlAwLf8sTvQKpO419jXON/xLzFDxQJeakjoj4bf7oqFekNc12G8SWpK6m9V5gMmx54uSa2+WsqDgW793hoJmvtu4IIYlYeTcq4mUJEuN73URofcSZ4FF0kkRDVex4uZ28I03Z57tOBCXKlEUhD1SEt8/rDwuWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDsN7LDN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDsN7LDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725555795; x=1757091795;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jBlfS9LpREMmCfI8EHARvp0EI/YS2QafWg/0wZ5hBs8=;
  b=dDsN7LDNVnb49bUEZDFi0hFfxSHDfuuYbebVWCYIhrbBMwHY7V+zwCLA
   g7HNOY1Kj4Xp65zm+0/+FhZQxTYI/4TddhtsyJppS4eGbw33sybQnzyE0
   Yfw0gnRD/xCYUlfanonI8V/jp1bFC2vAByPRjPN7kpa9rGMJ80KM/7vgM
   t9CapMbsN7hskTcH2kMdzTd2en4+i3onuNHAwsz0AatOGsd6tMKxVi4CK
   8UDiFhY91Yuttbc/7CnmQtzdOi/DJbkOY6gWBfgJEhBONGxWvu+UOjYRl
   a6OsJiA9xHl58PoJz+IY+sBKxOhVDw5ibh4eIEk2JUJtmOpo4uFrlwGEE
   g==;
X-CSE-ConnectionGUID: I3n3y4pgRMuy0ptJCPHQeg==
X-CSE-MsgGUID: +41NHgwWTvKTMn8KrOUH9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="46818497"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="46818497"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 10:03:15 -0700
X-CSE-ConnectionGUID: xikwf8/JR72y3DP+LKwr9w==
X-CSE-MsgGUID: aQyujqbUQfqNh1955k5UlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65702374"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2024 10:03:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BA71731E; Thu, 05 Sep 2024 20:03:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] x86/cpu: Mark flag_is_changeable_p() with __maybe_unused
Date: Thu,  5 Sep 2024 20:02:51 +0300
Message-ID: <20240905170308.260067-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When flag_is_changeable_p() is unused, it prevents kernel builds
with clang, `make W=1` and CONFIG_WERROR=y:

arch/x86/kernel/cpu/common.c:351:19: error: unused function 'flag_is_changeable_p' [-Werror,-Wunused-function]
  351 | static inline int flag_is_changeable_p(u32 flag)
      |                   ^~~~~~~~~~~~~~~~~~~~

Fix this by marking it with __maybe_unused (both cases for the sake of
symmetry).

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: marked both 32- and 64-bit cases
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index d4e539d4e158..4b35744ef9b2 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -287,7 +287,7 @@ static int __init cachesize_setup(char *str)
 __setup("cachesize=", cachesize_setup);
 
 /* Standard macro to see if a specific flag is changeable */
-static inline int flag_is_changeable_p(u32 flag)
+static inline __maybe_unused int flag_is_changeable_p(u32 flag)
 {
 	u32 f1, f2;
 
@@ -348,7 +348,7 @@ static int __init x86_serial_nr_setup(char *s)
 }
 __setup("serialnumber", x86_serial_nr_setup);
 #else
-static inline int flag_is_changeable_p(u32 flag)
+static inline __maybe_unused int flag_is_changeable_p(u32 flag)
 {
 	return 1;
 }
-- 
2.43.0.rc1.1336.g36b5255a03ac

