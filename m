Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD3F7E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 19:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E34AC385A4;
	Tue, 26 Apr 2022 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650999761;
	bh=UzaHSttgxLekgrWJttDuNNC3KNvjaox2XCxdt4LdC0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QI3vajOT1YvTdZvLHeCLJ1Q9a1ZhpnsTwzLY2P224k/kmsjSKCszuPETa/5yT9oW4
	 TRKq0ypZmtq/noeBSIUdyn8KuhPVh1Yat2ezG7+ZZ47YebuE3GLwc3aNqv2hDoP4Q1
	 auQ95KnvojNJNwlzkYwTF+MRSFFUb/s93pOI2C5foCshUfXOsYAqHMSDDECfa4A9Ar
	 +rEmw6PHlhct5GLW801xVOUC0hwsj46YpMcPNEzyOD2L+jMxNG3hHTjl8OxytMQfvG
	 b3D4MkzuH8qdVCW//OuNhYhaBdcVeXn+Ps/c3MvDZqF2JZpoJNDsqyXnH7nj0ThOBF
	 j7Fqh+gSF/eFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	nathan@kernel.org,
	ndesaulniers@google.com,
	christophe.leroy@csgroup.eu,
	msuchanek@suse.de,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 8/9] powerpc/perf: Fix 32bit compile
Date: Tue, 26 Apr 2022 15:02:29 -0400
Message-Id: <20220426190232.2351606-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426190232.2351606-1-sashal@kernel.org>
References: <20220426190232.2351606-1-sashal@kernel.org>
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
index c02854dea2b2..da9f60ede97b 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -5,11 +5,11 @@ ifdef CONFIG_COMPAT
 obj-$(CONFIG_PERF_EVENTS)	+= callchain_32.o
 endif
 
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

