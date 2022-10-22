Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345527B
	for <llvm@lists.linux.dev>; Sat, 22 Oct 2022 03:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666409307; x=1697945307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S5WdQ+X2Dl9VyjKh6IQ4k1l6UBlilbtoCi4Mqd21SG4=;
  b=n/CXCyWk3gaie2WMXbgnrBHTMplFRbHvCYQ1hDJnT6OFD1Oh7sT+joq0
   akKS9yb/5ANg09i2EoVPD9TuWM3FcBREE7wA1UV7nSeCg/AmtFOGXfKU7
   qQQ1cIlX3bquVq4xlL57LwE8xjfR1G3jclKLuFmED5QGEsuVdBxvpdfFO
   4JdW0VozJr7LEhrs5BOMNzJ1XRwj6TwzgYmWy43BS4TTfIKvWRYkTIut0
   /3S8CuOmdB8zZo8aTBY1Gmm66dxICViPimwslugg86OdsZ0292XGb7E/E
   fm612KrC6jZX12XbXpEBGKRWXfcgraYZ8tx6wIik43VIoznMvt8ZyUsj5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="393464408"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="393464408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 20:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693955256"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="693955256"
Received: from unknown (HELO fred..) ([172.25.112.68])
  by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2022 20:28:26 -0700
From: Xin Li <xin3.li@intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	x86@kernel.org
Cc: nathan@kernel.org,
	keescook@chromium.org,
	andrew.cooper3@citrix.com,
	hpa@zytor.com,
	peterz@infradead.org
Subject: [PATCH 0/1] kbuild: upgrade the orphan section warning to an error if CONFIG_WERROR is set
Date: Fri, 21 Oct 2022 20:05:18 -0700
Message-Id: <20221022030519.9505-1-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrew Cooper suggested upgrading the orphan section warning to a hard link
error. However Nathan Chancellor said outright turning the warning into an
error with no escape hatch might be too aggressive, as we have had these
warnings triggered by new compiler generated sections, and suggested turning
orphan sections into an error only if CONFIG_WERROR is set. Kees Cook echoed
and emphasized that the mandate from Linus is that we should avoid breaking
builds. It wrecks bisection, it causes problems across compiler versions, etc.

Xin Li (1):
  kbuild: upgrade the orphan section warning to an error if
    CONFIG_WERROR is set

 Makefile                          | 2 +-
 arch/arm/boot/compressed/Makefile | 2 +-
 arch/arm64/kernel/vdso/Makefile   | 2 +-
 arch/arm64/kernel/vdso32/Makefile | 2 +-
 arch/x86/boot/compressed/Makefile | 2 +-
 init/Kconfig                      | 9 ++++++---
 6 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.34.1

