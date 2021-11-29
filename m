Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B172
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 17:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5A0C53FCD;
	Mon, 29 Nov 2021 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638205297;
	bh=sTr/3SXb/b24sAx/2OkL4DHyUGKbgxg5aa014VK4VMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TOJO585+UT6b+TrJ3oJ+lO63KECOwdLMWztP56yB65yobnY7oE+UGU3C5+1EzGCz2
	 hWe8Mhk9UE6/wrpHUhDOl7HvoPIg3Tw3m8Unn5InOEhiFpCUWm8I8X/dFytk/BLaEQ
	 M21TBDmfXwWxwpgMTgQW6pPl1ZkhUC4n7RgbcYvribJCUtD+h/AOdbqScvopU7Dv9u
	 SQ0OTxhJ3DGTs9F8P3GQ3EnFOM2uksW6NJnLT9Cc11LY1ph1AZiwi5mOQpYFIwCPTy
	 mLYNPURRoLXashyMPrcAtO7+PUdAwcE8mYc9/+YVQ6UkgV3J+UB2iWsUWBLDc/9w3X
	 g5GWkWfin1kww==
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Tom Stellard <tstellar@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	cki-project@redhat.com,
	kernelci@groups.io,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 6/6] init/Kconfig: Drop linker version check for LD_ORPHAN_WARN
Date: Mon, 29 Nov 2021 09:58:03 -0700
Message-Id: <20211129165803.470795-7-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
References: <20211129165803.470795-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum supported version of LLVM has been raised to 11.0.0, meaning
this check is always true, so it can be dropped.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 4b7bac10c72d..e40f967dee3f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1414,7 +1414,6 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 config LD_ORPHAN_WARN
 	def_bool y
 	depends on ARCH_WANT_LD_ORPHAN_WARN
-	depends on !LD_IS_LLD || LLD_VERSION >= 110000
 	depends on $(ld-option,--orphan-handling=warn)
 
 config SYSCTL
-- 
2.34.1

