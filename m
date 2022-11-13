Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71F1110
	for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 11:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199D1C433C1;
	Sun, 13 Nov 2022 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668338137;
	bh=0BWR+k4vde+hdnMhCvTCNRM3S941nfBNnKWokjYMvoI=;
	h=From:To:Cc:Subject:Date:From;
	b=g3v4XrBYQzbpcklFq2O/aUWqt6+XVpEeUtpZHED7bHf80JDFzRNJRdIYyjco+Etng
	 h2sFG5kWhtTC4wSK8/35ZGgeMMTp5miBKGNb1xjkEh+D106WqSsilOInIMa1a1h0Kl
	 jglclLMAfvBJfV76URqk9x33RRAFgWsRXTsKxRQzaXhY1Yr7EMrMQcGzxeBbb+ymce
	 82XA3+jf+n3L+rfKlBQm6fAZyfFvwMYypefKP9K5iYB3AjiaUm2YXEcJQqGtRgV5ND
	 s8VT9pS3qJoBUDeKqKYhAqQZnASB+vqHAa3jXWdkfCTBLkqjUSyM5qMqJIwYd8IKQV
	 tDO4e0KPOD6jQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev
Subject: [PATCH 0/3] kbuild: detect objects shared among multiple modules
Date: Sun, 13 Nov 2022 20:15:22 +0900
Message-Id: <20221113111525.3762483-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Commit 637a642f5ca5 ("zstd: Fixing mixed module-builtin objects")
only fixed zstd, but similar potential issues are remaining treewide.

My plan is to merge the first two in the next merge window
(to block new breakages), the last one after fixing warnings.



Masahiro Yamada (3):
  kbuild: add kbuild-file macro
  kbuild: warn objects shared among multiple modules
  [pending] kbuild: make forbid sharing objects among multiple modules

 scripts/Kbuild.include       | 5 +++++
 scripts/Makefile.asm-generic | 6 +++---
 scripts/Makefile.build       | 6 +-----
 scripts/Makefile.clean       | 5 +----
 scripts/Makefile.dtbinst     | 2 +-
 scripts/Makefile.lib         | 8 ++++----
 scripts/Makefile.vmlinux_o   | 5 +----
 7 files changed, 16 insertions(+), 21 deletions(-)

-- 
2.34.1

