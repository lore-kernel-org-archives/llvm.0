Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581631A067
	for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761310808; cv=none; b=N0fPYFwtxBvQWtQf05ua+cqJzTx0zxDSAqvQpcAYtfGjADrFhrnb595g9D4T4Hfn8RVccDN+w6fs1VWJBUxWKAn+vfkKIJ+gw7lLOTWrmZ2/ya6/xnOwciGN7CohU3mIVp1EM/kfP+WDwfitK5/pYFfO0lk4YexV/hVWqGgbNHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761310808; c=relaxed/simple;
	bh=QfTvVbIuqmoycjiuRETlY7C9n0ihBDGSioOczwrJMCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lN2B7oCoulyPV4G7a3nwpT14UaQ4aNR2Vn5W2vgyLXPY1+h+hS1ex+EpXuTrcC3lCsXKCPSzvhIsvf3kY1sZ4ZgHdpGJx3Qab0zwpMYRpbh0rWOKJ3PlTX6UeLQY9HQUY1YpXyp3Y6ggnh00mOf/OQKBaD6MfnapT8Ho+AOr0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eop023b4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eop023b4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761310806; x=1792846806;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QfTvVbIuqmoycjiuRETlY7C9n0ihBDGSioOczwrJMCw=;
  b=Eop023b4Qh4PH3gKV+AiNl984V8om65FTMIsxdqAtPOhspt5o7cGKkjG
   vuikZFOYfvl9rRgbmfTIbG/pPgaSqWGci84OYNEpzuQHurJSQlvIk9TpU
   eoz35si79AA92eVcRIzPTtckjKmJ/9uNjTNE3Wyz2DBCQp7WM8QFj4rPa
   amjh4YsRifpXMJdHZu5LgCkKsHd4hrEQSS4pqsWKN7MjyjvZYCDFvQDm8
   8e8X0RzVAjCig34ogX4Qgi3YTFah/Rn4JmjkanNvIVMFdaJ5+3GlfyKAO
   fR8stE7K8Es0046YdXrcR7EwTVAxRB5EnAvPf1Zj4K9uDpKqLfKVtIHvc
   A==;
X-CSE-ConnectionGUID: 0rNB67uYRnOg2fyyhatsrQ==
X-CSE-MsgGUID: 7JHuzl64ROSkCP5NIh5NeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86121592"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="86121592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 06:00:05 -0700
X-CSE-ConnectionGUID: YeeKue6vRVubzaQ+hdLLoQ==
X-CSE-MsgGUID: UdyED/htTh+reGyBYB8d7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="183599458"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2025 06:00:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 266C196; Fri, 24 Oct 2025 15:00:01 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>,
	David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] x86/bugs: Remove dead code which might prevent from building
Date: Fri, 24 Oct 2025 14:59:59 +0200
Message-ID: <20251024125959.1526277-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang, in particular, is not happy about dead code:

arch/x86/kernel/cpu/bugs.c:1830:20: error: unused function 'match_option' [-Werror,-Wunused-function]
 1830 | static inline bool match_option(const char *arg, int arglen, const char *opt)
      |                    ^~~~~~~~~~~~
1 error generated.

Remove a leftover from the previous cleanup.

Fixes: 02ac6cc8c5a1 ("x86/bugs: Simplify SSB cmdline parsing")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index e08de5b0d20b..d7fa03bf51b4 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1827,13 +1827,6 @@ void unpriv_ebpf_notify(int new_state)
 }
 #endif
 
-static inline bool match_option(const char *arg, int arglen, const char *opt)
-{
-	int len = strlen(opt);
-
-	return len == arglen && !strncmp(arg, opt, len);
-}
-
 /* The kernel command line selection for spectre v2 */
 enum spectre_v2_mitigation_cmd {
 	SPECTRE_V2_CMD_NONE,
-- 
2.50.1

