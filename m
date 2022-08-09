Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BE4428
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 14:22:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C02386601C58;
	Tue,  9 Aug 2022 15:22:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660054964;
	bh=gSV06NTaRpUmL9YRF3a9un69uLMMf03b1tlnBMPp1P8=;
	h=From:To:Cc:Subject:Date:From;
	b=bM5jkN0fB5HfUfZrXt8kTjWBBcmk57uKV5TBx6hvTR7ifCrdnWSDvqjm5hI4VM1kM
	 /bRDvA2+NapTqX/Tyl7RPTAy1h1RxUNbL7zLo6THhLZU25ru8Om1k60pBMlAXnKQng
	 DHGZ5i41tTLOlJlrXYqScDHGB1/ZXmaJBHYf/pwr4KZ1dNaMpKBlGYciEcFQXY9Hyb
	 GxHEKDEzYetTQrzuaXTsuNw1zPPGlV0IvbR3mkFc5sVtjAB4DFTM7GMLn+vtc+82ez
	 CBCgkoh1tQjcYtMkNnQ0TZQSSr05E/6cwzLgi/pm2ibNbCD88M3vqUTEg6sTCbUifQ
	 kV5AaTv1Zmfaw==
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] selftests: fix LLVM build for i386 and x86_64
Date: Tue,  9 Aug 2022 16:22:31 +0200
Message-Id: <20220809142231.2419274-1-guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing cases for the i386 and x86_64 architectures when
determining the LLVM target for building kselftest.

Fixes: 795285ef2425 ("selftests: Fix clang cross compilation")
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 tools/testing/selftests/lib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index b1c62914366b..cc4c443d5b14 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -10,12 +10,14 @@ endif
 CLANG_TARGET_FLAGS_arm          := arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64        := aarch64-linux-gnu
 CLANG_TARGET_FLAGS_hexagon      := hexagon-linux-musl
+CLANG_TARGET_FLAGS_i386         := i386-linux-gnu
 CLANG_TARGET_FLAGS_m68k         := m68k-linux-gnu
 CLANG_TARGET_FLAGS_mips         := mipsel-linux-gnu
 CLANG_TARGET_FLAGS_powerpc      := powerpc64le-linux-gnu
 CLANG_TARGET_FLAGS_riscv        := riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390         := s390x-linux-gnu
 CLANG_TARGET_FLAGS_x86          := x86_64-linux-gnu
+CLANG_TARGET_FLAGS_x86_64       := x86_64-linux-gnu
 CLANG_TARGET_FLAGS              := $(CLANG_TARGET_FLAGS_$(ARCH))
 
 ifeq ($(CROSS_COMPILE),)
-- 
2.30.2

