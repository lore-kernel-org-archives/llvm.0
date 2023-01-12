Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBD847C
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 19:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4754C43398;
	Thu, 12 Jan 2023 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673553149;
	bh=ICx+HpIiOzKXWwzoSA2cqLawt3Xl+ru72A7xtP7W+TE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WF7lQj6QfR9mCeU3KNbxa00ixi29nLbkHEig9oxDsaAr0FdI4BcYqcbxHFlf1TDvI
	 A5IC6rvcVpGFytrxXl3baAyQ7JC5tIkXP0jYA7BfRGEUWdeUu3HoiodpEyXNby1wb0
	 ltBTyewDPHv9tuB0+4oCFBlMALCbLwidiz6QQEHbQ+I7xznGg0kdjwEgyz5ALSJmEo
	 IoWy1G4BVGki4RnQGICdf+cUUckBZcG+Pb45NObyf1kG60e6E/jjXLvE9iVwC7MXwI
	 ONpTwU7Xkp09D2x+t+hzst0tQMDfOoqkEmsTIb9LXa+ZbVbYw3wuz8qQnBrLLFkB8F
	 kElqhkz6Pz76w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 12 Jan 2023 19:51:52 +0000
Subject:
 [PATCH 6/6] kselftest/arm64: Remove spurious comment from MTE test Makefile
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230111-arm64-kselftest-clang-v1-6-89c69d377727@kernel.org>
References: <20230111-arm64-kselftest-clang-v1-0-89c69d377727@kernel.org>
In-Reply-To: <20230111-arm64-kselftest-clang-v1-0-89c69d377727@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ICx+HpIiOzKXWwzoSA2cqLawt3Xl+ru72A7xtP7W+TE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjwGTsWNGGWScK+qgi2htLnu3tdBn9KAu5AdQrMhHr
 AfaKf6iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY8Bk7AAKCRAk1otyXVSH0MsdB/
 96aT8zdvFD9mXGi3MABvxk1I0jrSNXBwDkydqEddqdCLaAPefZ/nRWjTma+Kvfsl5p8WTb9EuUjFNS
 bWlVUXZprYcpOO2O0+M48SofgglVTkvNmQXN9j4R6dTrs1E5e0vaQIOMiOt0wjllaQ3TysvLb8pE6B
 l+IWl5Hpl7zqG5jRES04bbeocgXL72B3NOqQZ/N6OBfYqEeQe5KXJTxvU6J2Cl0GCsk0gqpCAHsj+N
 gfLjEEj/worbYSFSH8sdMxW1bjtt0RREpC52FHMbx2E2o93EWPWOZVD5D/bl+/lfTW707OTxmO+twB
 UsVi0ecJdVY3n9aBlDSHFw0r+UX7Gd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

There's a stray comment in the MTE test Makefile which documents
something that's since been removed, delete it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/mte/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/Makefile b/tools/testing/selftests/arm64/mte/Makefile
index fdb9acdca42b..0d7ac3db8390 100644
--- a/tools/testing/selftests/arm64/mte/Makefile
+++ b/tools/testing/selftests/arm64/mte/Makefile
@@ -28,7 +28,6 @@ ifeq ($(mte_cc_support),1)
 # Generated binaries to be installed by top KSFT script
 TEST_GEN_PROGS := $(PROGS)
 
-# Get Kernel headers installed and use them.
 else
     $(warning compiler "$(CC)" does not support the ARMv8.5 MTE extension.)
     $(warning test program "mte" will not be created.)

-- 
2.30.2
