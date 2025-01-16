Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488EB22BAC9
	for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043672; cv=none; b=OdP2CDIiQ/HHsqyM18IGuxjS0MoEMcousE/SiW6VZrGgQKR+DD0Lvz7SI0gpGXqotC83B5+4iAh1zqxboeHUNom7lqyGzJFC/VyjXuBVKRM+PaONuYO4fZJ7I9rHrAn2MGgpNqNymoyoHC4TDU4WM569joST8KR307QbhyY5lYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043672; c=relaxed/simple;
	bh=IV9vvNN02Low+JW0KLrqn3VHCizq83zC8CcHTwx6xvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oSPJPJSBvf7ADlXoSNTpDlk8A0MIhvfalkqo7upUTObCq0EMhXIZp00jMARylLESQ6c+M9oNGU7qVslcCnX6VG3RnaAmoZedm2W8k9l3jCeDWEUWXTWzrxwaLpsJk/0VvkvkN77XT3yirMmLXSIXRdMwm3bCPp/+GfX21g32CN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnxDHBUC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnxDHBUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737043671; x=1768579671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IV9vvNN02Low+JW0KLrqn3VHCizq83zC8CcHTwx6xvA=;
  b=CnxDHBUCtUPxG2UR3san6GzaG7EycJCkCMFk5JROLt8hrZ5XtRECnCBu
   YGXYMpSR2eoyIlvzhPR5CL3mw3R2GP2WA850qBiWDVGfdGg4G3zjBWRf/
   O/0Ducn3dCdmenbmE56eejFYtfAbXjHPtBIQrylmhhjcoyQUv/K/8a0io
   C3oim3uzHIABRqSFtjQ42w8mvzGLjEv333MqSWRy2/pqfBucWyAKv7+TR
   +r5JDLjBi2+GTX319bHfHB3wPuBdZWDq0umiYGR+TJmyXsmCfqzRj3Wqs
   RlOpN+4oES8VToC7aCbTPFMThh96OeEzE79kjIm1w09o3ODnY44JFbqnS
   g==;
X-CSE-ConnectionGUID: DhP7OrD1SO67rV0a5b5KJg==
X-CSE-MsgGUID: qplrSPKyRsC7suLGHqx5cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36651128"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36651128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 08:07:51 -0800
X-CSE-ConnectionGUID: PntF8R4YRyyvbrYqHphzGg==
X-CSE-MsgGUID: qORDLl7SRQyYvY2vGdiigg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128783603"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2025 08:07:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4D49E39C; Thu, 16 Jan 2025 18:07:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] hrtimer: Mark is_migration_base() with __maybe_unused
Date: Thu, 16 Jan 2025 18:07:45 +0200
Message-ID: <20250116160745.243358-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When is_migration_base() is unused, it prevents kernel builds
with clang, `make W=1` and CONFIG_WERROR=y:

kernel/time/hrtimer.c:156:20: error: unused function 'is_migration_base' [-Werror,-Wunused-function]
  156 | static inline bool is_migration_base(struct hrtimer_clock_base *base)
      |                    ^~~~~~~~~~~~~~~~~

Fix this by marking it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/time/hrtimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 80fe3749d2db..0a2b90f99412 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -145,7 +145,7 @@ static struct hrtimer_cpu_base migration_cpu_base = {
 
 #define migration_base	migration_cpu_base.clock_base[0]
 
-static inline bool is_migration_base(struct hrtimer_clock_base *base)
+static inline __maybe_unused bool is_migration_base(struct hrtimer_clock_base *base)
 {
 	return base == &migration_base;
 }
@@ -275,7 +275,7 @@ switch_hrtimer_base(struct hrtimer *timer, struct hrtimer_clock_base *base,
 
 #else /* CONFIG_SMP */
 
-static inline bool is_migration_base(struct hrtimer_clock_base *base)
+static inline __maybe_unused bool is_migration_base(struct hrtimer_clock_base *base)
 {
 	return false;
 }
-- 
2.43.0.rc1.1336.g36b5255a03ac

