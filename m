Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D241BCA0A
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013034; cv=none; b=DQhK7V/PzZbgk8vkixeW7j8YrEvlxRehgvvH9i6GUrUSOs06GcU4xjEyqMpmvMnTNl29vg1YHDaaCj3CEHt1FLzWtLAgQWOpCz4AdFybyrW6eRml0AMGmeh7+8SWG3hILgYjoZEVcyKBLkCTpHijqfhAuIRv2Bm4njX1SGA9k0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013034; c=relaxed/simple;
	bh=l2Qs9qtZaY8zBuJyu+2rd1IGPTQdfYws56k6k1nNtPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OooffvrkgNrG/WH/yLeGx63lSX1gP37NIb3/l283+K/WQ8eKn7TBHaj24gxS0r/aALqRHMat0UZg4B5vANJR7504y/eCmslFYlke5rPZiWX36ZcMTgPXq4ZboR1YAoVHr80srGCFJvOzQTAy3su/CvwZMxF+Zt8tIsWuNpOFNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naV0Mezd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naV0Mezd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732013033; x=1763549033;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l2Qs9qtZaY8zBuJyu+2rd1IGPTQdfYws56k6k1nNtPg=;
  b=naV0Mezd/v1HrJLFZqQBmlA8J3FR3V/Yulo2xcVLwAEazQjk9KIe7pqE
   XTiCRVNoZYLkgHHYiZxehv0vOK/JCzIlIsr1syW26Z73DE3J+ADtbrX0k
   Rm+r/eAATMXHgGfbbztQgaWBnRRtEzSJHbSIEYWffXkTNhZcjfsPavlgP
   w5Gi7sKhLihIguKVS/mByW82ucUx1FNU9vy+zd0DRBuh52TveyfWwuAzz
   Gz0vQ9h5czXfyVH+9nU+RtHXNQYy8uFekaDTIMb0+Cb3rwh4o6Da4zU6J
   jH8DXHIeUyLIpDn9NqKsECiTtRbrmCdtx6SfSpxwvdOpskSc73daBaNaC
   A==;
X-CSE-ConnectionGUID: RzyWH5TpQ4GOVIBInD5i0w==
X-CSE-MsgGUID: XthyyxewQwOItCFe5b6U3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35913978"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35913978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 02:43:50 -0800
X-CSE-ConnectionGUID: C1WrHg4cRK6NIR7EmX7PPA==
X-CSE-MsgGUID: qi7c2bReSRShyXXfeTqIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89925595"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 02:43:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5318C1C4; Tue, 19 Nov 2024 12:43:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] genirq: refactor irq_forced_thread_fn()
Date: Tue, 19 Nov 2024 12:42:33 +0200
Message-ID: <20241119104339.2112455-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq_forced_thread_fn() open codes the irq_forced_fn().
Refactor to reuse.

Andy Shevchenko (2):
  genirq: Move irq_forced_thread_fn() further in the code
  genirq: Reuse irq_thread_fn() for forced thread case

 kernel/irq/manage.c | 46 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

