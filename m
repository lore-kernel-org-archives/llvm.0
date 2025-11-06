Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0EE2DAFBF
	for <llvm@lists.linux.dev>; Thu,  6 Nov 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426215; cv=none; b=JGcNcytlJ3bE39mdnp6RNyaRef6Qk8de1uJT9CubUCjSBTvO51engd0/Y+z9QhqK5ajJfkFcXZ+bdGR76YG2HkRDUSjk3QJCXqJtdc7jt5Zj0R+TZK86gVa2GvFYEWVfLQHjDTJr5ZgKCLxf0FdFmy2I6Q78/AFvaIuryeFVf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426215; c=relaxed/simple;
	bh=5JetFE+gcVoZwYrmSvCyH+NsvkC4E69mgdSuLH2QOoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyExLva95iJEDgpqh5OnTdwdSRE+dst9ZK8uueRDDg8uDKTNe0FACsoZfzpCeIgGtzWC+/ovM2Iq7gc1ClFjh/NbvqO7jedwJQtBsmXVWTC2wObMEOTEckFRqpoWIarjOSEKg7j41wecq8+H+G6BtZERI9LTuyCj4UAv4YedS4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/81D0L3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/81D0L3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762426214; x=1793962214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5JetFE+gcVoZwYrmSvCyH+NsvkC4E69mgdSuLH2QOoY=;
  b=Q/81D0L3nfv94KbiVnErqmUDC7eKul9HQUa0GqzlGVdhVBPi/fDIGKVs
   STrSn7bmWI3ZqGLWEIt2bn7QXrmmuq2zsNQxOqLwoU7HDgHvWdYHad0zJ
   EY/zeEXLO88p4Ki5NHamSNezfrBFqdZq+cZJu99uZike81BtH1WgaorYQ
   HOvXotPwxxL5Y8AvEFxJekPYncOuxyEVkIDZvxngWnR7gpETAvpcVtsZh
   pcljQ6IGPw2ihCTYjgHVpqki5tAfu51g7vWjQayjPx+lNDncl5wRak8zv
   fv4XGA9DbSbI9loAici2LsUxc1IkgwLd3un7S6uh7NLhMQjvsb8gm9f0l
   g==;
X-CSE-ConnectionGUID: h11gqMTwRwqrsTw96zJYHQ==
X-CSE-MsgGUID: 0lcRnH23RDO9SVXH+WduNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52125671"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="52125671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 02:50:14 -0800
X-CSE-ConnectionGUID: 58B3z4/CSEWdMksFdrA2xw==
X-CSE-MsgGUID: 7EYk24eySOGpNbWoyDW6sg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2025 02:50:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7E61995; Thu, 06 Nov 2025 11:50:10 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] compiler_types: Warn about unused static inline functions on second
Date: Thu,  6 Nov 2025 11:50:00 +0100
Message-ID: <20251106105000.2103276-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>

Per Nathan, clang catches unused "static inline" functions in C files since
commit 6863f5643dd7 ("kbuild: allow Clang to find unused static inline
functions for W=1 build").

Linus said:

> So I entirely ignore W=1 issues, because I think so many of the extra
> warnings are bogus.
>
> But if this one in particular is causing more problems than most -
> some teams do seem to use W=1 as part of their test builds - it's fine
> to send me a patch that just moves bad warnings to W=2.
>
> And if anybody uses W=2 for their test builds, that's THEIR problem..

Here is the change to bump the warning from W=1 to W=2.

Fixes: 6863f5643dd7 ("kbuild: allow Clang to find unused static inline functions for W=1 build")
Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/compiler_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 59288a2c1ad2..575a03643fa1 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -253,7 +253,7 @@ struct ftrace_likely_data {
  * for W=1 build. This will allow clang to find unused functions. Remove the
  * __inline_maybe_unused entirely after fixing most of -Wunused-function warnings.
  */
-#ifdef KBUILD_EXTRA_WARN1
+#ifdef KBUILD_EXTRA_WARN2
 #define __inline_maybe_unused
 #else
 #define __inline_maybe_unused __maybe_unused
-- 
2.50.1

