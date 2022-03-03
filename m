Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B947C
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 07:49:20 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0V66arbm_1646292822;
Received: from localhost(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0V66arbm_1646292822)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 03 Mar 2022 15:33:48 +0800
From: Dan Li <ashimida@linux.alibaba.com>
To: akpm@linux-foundation.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	ashimida@linux.alibaba.com,
	gregkh@linuxfoundation.org,
	linux@roeck-us.net,
	keescook@chromium.org,
	luc.vanoostenryck@gmail.com,
	elver@google.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	nathan@kernel.org,
	npiggin@gmail.com,
	ndesaulniers@google.com,
	samitolvanen@google.com,
	shuah@kernel.org,
	tglx@linutronix.de,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/2] AARCH64: Enable GCC-based Shadow Call Stack
Date: Wed,  2 Mar 2022 23:33:40 -0800
Message-Id: <20220303073340.86008-1-ashimida@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Shadow call stacks will be available in GCC >= 12, this series makes
the corresponding kernel configuration available when compiling
the kernel with the gcc and adds corresponding tests in lkdtm.

Dan Li (2):
  AARCH64: Add gcc Shadow Call Stack support
  lkdtm: Add Shadow Call Stack tests

 arch/Kconfig                            | 19 +++----
 arch/arm64/Kconfig                      |  2 +-
 drivers/misc/lkdtm/Makefile             |  1 +
 drivers/misc/lkdtm/core.c               |  2 +
 drivers/misc/lkdtm/lkdtm.h              |  4 ++
 drivers/misc/lkdtm/scs.c                | 67 +++++++++++++++++++++++++
 include/linux/compiler-gcc.h            |  4 ++
 tools/testing/selftests/lkdtm/tests.txt |  2 +
 8 files changed, 91 insertions(+), 10 deletions(-)
 create mode 100644 drivers/misc/lkdtm/scs.c

-- 
2.17.1

