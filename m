Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659F6144
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 21:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1386C340EE;
	Mon, 21 Mar 2022 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647899573;
	bh=dyOSNsBIOAtZ7vGm89+pK75rTiVRFKBYVcdnYc/Tqyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hKYd4xyiZBkMI4yuRA/8hErx9o+PvXRfji1Z0y9/HDegqUTt0h8M1w9TK2w2QcAqf
	 W5pGZ/+zF1Nv2koHR77xl0r8J1csvPULFTmH48rBnW2vF91kC9jGMGQ/Zybvi+2hea
	 gnIC7rPWHQUIeYFQ6hHy/PGvAVSKsz1TWtDWKzkY+733oSNR6zPzkZUjBKeLie5cpL
	 SRWtfIEnhH/0BOgaa9QE60Gc+VkViKeLMOpXLLPKC72mEQAAQRE98RXlDjp1yXLQ7W
	 e0hbTnI2wOKChBUwlpB/M74HNoIm2C3GWbFh7CQp2XQ01S1Z4LTOqOkR3toxVOv04/
	 I3Af4jN1GFNfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yosry Ahmed <yosryahmed@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.16 6/6] selftests: vm: fix clang build error multiple output files
Date: Mon, 21 Mar 2022 17:52:37 -0400
Message-Id: <20220321215240.490132-6-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321215240.490132-1-sashal@kernel.org>
References: <20220321215240.490132-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Yosry Ahmed <yosryahmed@google.com>

[ Upstream commit 1c4debc443ef7037dcb7c4f08c33b9caebd21d2e ]

When building the vm selftests using clang, some errors are seen due to
having headers in the compilation command:

  clang -Wall -I ../../../../usr/include  -no-pie    gup_test.c ../../../../mm/gup_test.h -lrt -lpthread -o .../tools/testing/selftests/vm/gup_test
  clang: error: cannot specify -o when generating multiple output files
  make[1]: *** [../lib.mk:146: .../tools/testing/selftests/vm/gup_test] Error 1

Rework to add the header files to LOCAL_HDRS before including ../lib.mk,
since the dependency is evaluated in '$(OUTPUT)/%:%.c $(LOCAL_HDRS)' in
file lib.mk.

Link: https://lkml.kernel.org/r/20220304000645.1888133-1-yosryahmed@google.com
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/vm/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 1607322a112c..a14b5b800897 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for vm selftests
 
+LOCAL_HDRS += $(selfdir)/vm/local_config.h $(top_srcdir)/mm/gup_test.h
+
 include local_config.mk
 
 uname_M := $(shell uname -m 2>/dev/null || echo not)
@@ -140,10 +142,6 @@ endif
 
 $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
-$(OUTPUT)/gup_test: ../../../../mm/gup_test.h
-
-$(OUTPUT)/hmm-tests: local_config.h
-
 # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
 $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
 
-- 
2.34.1

