Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5EA926;
	Sat, 19 Jul 2025 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752944801; cv=none; b=ciDd3ENKbYv+QfgCf+UK6U/WNqugh/CPEk1yHxu2C0SR/4mEyolM9sIAoNBe4XkHZQx9DLm2083nbEU2CKJ8bppTGb1zYzgxBJLIND/f3DZn3E0GJFqmjd+E2ZjHbXJVj5tJlovu9AF5TJFLhXfcijVmjuu5R7ixdiT1+FT/iic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752944801; c=relaxed/simple;
	bh=cWZc5UfWhXbfgug9pQFdx0kQ1T/a5KG+5OsxJNnqaGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bs2K6+WTHY4+YLOZfJ/AAQ53RDkeNN/6zB2lapH+yBiDkKfjZ1i+2WY0oN5ZhZ7jPfIxZbvLq1ni2Lhm2gabVU5dbd0LqB9x+oA4gi2PSarpPIezyecDE25wO7LqNoBvzyrTIt1XVskW4/SUG8zN72+iztasyo/zeKBDjW38T58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZ5+Nvmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZ5+Nvmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D10C4CEE3;
	Sat, 19 Jul 2025 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752944800;
	bh=cWZc5UfWhXbfgug9pQFdx0kQ1T/a5KG+5OsxJNnqaGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZ5+Nvmmgt5dC8CXL5vbXu6Tv37A51MjP26Xr41EAfbiomH1fa7M2jhYeS1dejV4i
	 EBN99oBqs6RPDiPLKHhFZAomgeShjjduHBTmDnE1ZFIJXFoDosQgil6m0318S7vyGX
	 OA6/zaCTwCJaPkQLEa9aqscdcjgCVfgtgTrYjqvpJ2BERNgVtgFrCubIXUxbCIVW9Y
	 kfXIg56Zp9tSaTHS9blMoFC9x8g6co7gVSW2ybgNt5/oyvMQXskb4lHrjsNmo2gcOQ
	 aoSnZWDJ2OqA7SHBW3M1a6CL765ck/mPXrx5z25vNgdCFiT+SZOe+41+gIm5cj7cbF
	 uwa81VuQWGzwA==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 52/104] mm/memory.c:6046:3: error: call to undeclared function 'damon_report_access'; ISO C99 and later do not support implicit function declarations
Date: Sat, 19 Jul 2025 10:06:38 -0700
Message-Id: <20250719170638.64999-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202507192010.91NbXIjJ-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Sat, 19 Jul 2025 21:05:04 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   587ffe894dbc4bdb791e375c50e446a32fba081a
> commit: cd52442f08196fc17179dc9a95b097df531203b7 [52/104] mm/memory: report fault information to DAMON
> config: i386-buildonly-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507192010.91NbXIjJ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192010.91NbXIjJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507192010.91NbXIjJ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/memory.c:6046:3: error: call to undeclared function 'damon_report_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     6046 |                 damon_report_access(&access_report);
>          |                 ^
>    mm/memory.c:6176:5: error: call to undeclared function 'damon_report_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     6176 |                                 damon_report_access(&access_report);
>          |                                 ^
>    2 errors generated.

Thank you for this report!  I just pushed below fix as
http://git.kernel.org/sj/c/5559267d916c.


Thanks,
SJ

===== >8 =====
Author: SeongJae Park <sj@kernel.org>
Date:   Sat Jul 19 09:58:13 2025 -0700

    mm/damon: implement static inline fake damon_report_access for !CONFIG_DAMON

    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202507192010.91NbXIjJ-lkp@intel.com/
    Signed-off-by: SeongJae Park <sj@kernel.org>

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 8f6d370754c7..96f9d8c6fe0c 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -977,6 +977,13 @@ void damon_report_access(struct damon_access_report *report);
 int damon_set_region_biggest_system_ram_default(struct damon_target *t,
                                unsigned long *start, unsigned long *end);

+#else  /* CONFIG_DAMON */
+
+static inline void damon_report_access(struct damon_access_report *report)
+{
+       return;
+}
+
 #endif /* CONFIG_DAMON */

 #endif /* _DAMON_H */
