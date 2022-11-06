Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594963209
	for <llvm@lists.linux.dev>; Sun,  6 Nov 2022 17:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE45EC433C1;
	Sun,  6 Nov 2022 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754386;
	bh=Ro3jmQCuet4MClUW3KXWYs/VxUoSGhfRGKBKBMjlpho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGkbaxCI8SV5c2wkUS7zHaE39IXNT9vkaDJ0sgbnRC9aSkHiZWjtK/Ue7wD7isX8h
	 wZdMSXpqh+uS5lvHbsoMedRwxbgKIyIYfI2TYkC98swEJUPyHyqslKwHXkwhYKTFZ5
	 gT4+oHVmCfXSz52UULRj2EH+cAJF6bZoi5QX9FdCefqBE5UXXr63MUVyGC5w+Yhfk/
	 4RWjoete3y2P+yIyW/61abqshqDYZmcYfI9pxCtlV4ycUJi51FIjqyejVfl6pF7ZiH
	 bRkzgHRq081EGIvPVX4qnvM8BQBOofP6nmAsryPWSC84olUArprUpCkdNnKyv1VlsK
	 ntNUcdgvofaog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	mingo@redhat.com,
	shuah@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	usama.anjum@collabora.com,
	guillaume.tucker@collabora.com,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 12/16] selftests/futex: fix build for clang
Date: Sun,  6 Nov 2022 12:05:49 -0500
Message-Id: <20221106170555.1580584-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170555.1580584-1-sashal@kernel.org>
References: <20221106170555.1580584-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

[ Upstream commit 03cab65a07e083b6c1010fbc8f9b817e9aca75d9 ]

Don't use the test-specific header files as source files to force a
target dependency, as clang will complain if more than one source file
is used for a compile command with a single '-o' flag.

Use the proper Makefile variables instead as defined in
tools/testing/selftests/lib.mk.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/futex/functional/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index 23207829ec75..6a0ed2e7881e 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -3,11 +3,11 @@ INCLUDES := -I../include -I../../
 CFLAGS := $(CFLAGS) -g -O2 -Wall -D_GNU_SOURCE -pthread $(INCLUDES)
 LDLIBS := -lpthread -lrt
 
-HEADERS := \
+LOCAL_HDRS := \
 	../include/futextest.h \
 	../include/atomic.h \
 	../include/logging.h
-TEST_GEN_FILES := \
+TEST_GEN_PROGS := \
 	futex_wait_timeout \
 	futex_wait_wouldblock \
 	futex_requeue_pi \
@@ -21,5 +21,3 @@ TEST_PROGS := run.sh
 top_srcdir = ../../../../..
 KSFT_KHDR_INSTALL := 1
 include ../../lib.mk
-
-$(TEST_GEN_FILES): $(HEADERS)
-- 
2.35.1

