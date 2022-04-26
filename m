Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8077E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 19:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1E0C385A0;
	Tue, 26 Apr 2022 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650999730;
	bh=+Rmjm5j+NVCX092c+nELx71iEIRBfHPkU0zB4Hx6TB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MnT3ltsMPJzJwza8TSRmD1SkmDvKfkCtbVsBIEp6MOKWQir1Dt2eiM/PBSvKHFG8a
	 7qJdPEtxurofVp9TleZJQQM+FJgvkwx23enixKhvG1uAldtn0przX+/3Fac316aKOi
	 FacPYFrb8qO5HdxhOfMTumoajEL/NKmi50W5k003GJ8FeGfKR4D/9mO8Nqi722+BGX
	 9mKAec5HQkNdW+31u3IziEOswuojP0jQpj6cIfheINovBbjYT9l45kR7e+671VtQeT
	 wRe3JnKQIq7f3T8SvhWDES+B/SK8sl0r15NPA0RagQ3ltKqTZOGyfhY6TtCAgwL2/j
	 5ofcNZ5fPov6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	nathan@kernel.org,
	ndesaulniers@google.com,
	msuchanek@suse.de,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.17 18/22] powerpc/perf: Fix 32bit compile
Date: Tue, 26 Apr 2022 15:01:41 -0400
Message-Id: <20220426190145.2351135-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426190145.2351135-1-sashal@kernel.org>
References: <20220426190145.2351135-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit bb82c574691daf8f7fa9a160264d15c5804cb769 ]

The "read_bhrb" global symbol is only called under CONFIG_PPC64 of
arch/powerpc/perf/core-book3s.c but it is compiled for both 32 and 64 bit
anyway (and LLVM fails to link this on 32bit).

This fixes it by moving bhrb.o to obj64 targets.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220421025756.571995-1-aik@ozlabs.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/perf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index 2f46e31c7612..4f53d0b97539 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -3,11 +3,11 @@
 obj-y				+= callchain.o callchain_$(BITS).o perf_regs.o
 obj-$(CONFIG_COMPAT)		+= callchain_32.o
 
-obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
+obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o
 obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
 				   power5+-pmu.o power6-pmu.o power7-pmu.o \
 				   isa207-common.o power8-pmu.o power9-pmu.o \
-				   generic-compat-pmu.o power10-pmu.o
+				   generic-compat-pmu.o power10-pmu.o bhrb.o
 obj32-$(CONFIG_PPC_PERF_CTRS)	+= mpc7450-pmu.o
 
 obj-$(CONFIG_PPC_POWERNV)	+= imc-pmu.o
-- 
2.35.1

