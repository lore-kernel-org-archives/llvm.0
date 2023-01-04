Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C4BA3D
	for <llvm@lists.linux.dev>; Wed,  4 Jan 2023 19:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF56C43396;
	Wed,  4 Jan 2023 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672862101;
	bh=eOzKxLrRsBTq/MljE5/gHOkCQwsBUGjl8YrlO4iJnbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kvFJpgAbYewxpxa+bz2Udtm6ypeLdSpxaH/VUK6Ae27GBGBz1x2BXHUu+80G/aghj
	 49WtUUD+e0T9hoMuEoCcgIFMC2Y/h9K5PQAKmL3/LYB+Do8RjVacmx0m0HSUxetYkK
	 v57P0IcbDHxcShopAo6pIF1lpFrE8roM8/gyMPv19fc+K887/ngD5IVnxzBzGtXjKK
	 TXlFR1fQoQskj6A2bhg9Kj7YVrMQK8su4cqhcDE6ohVprx1elX99zdco/SfVrdGKp0
	 hv2uhrdHRSujCjL9dwj2sHDqvqpD4yOPWi8BBUFJPRyQI8IY4Sgcm2J8EU/aJr8agO
	 0pK3tD2m0hOTw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 04 Jan 2023 12:54:26 -0700
Subject: [PATCH 09/14] s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To: masahiroy@kernel.org, ndesaulniers@google.com
Cc: nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=nathan@kernel.org;
 h=from:subject:message-id; bh=eOzKxLrRsBTq/MljE5/gHOkCQwsBUGjl8YrlO4iJnbE=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3Y/2p92pWtCrfcjzsJJVhnNfAnBHq5/rq8sYufa5lUR
 Enevo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExE/B4jw+eK8L9yJiISoa62X1doum
 5y229/SH/HIV7eHjPJ0ua6Gwz/jPb8OprUttuTOfrCtG0f3V67BM34wv1t2amjhTcmvr5SywUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
warns that KBUILD_AFLAGS_64 contains '-s', which is a linking phase
option, so it is unused.

  clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]

There appears to be no equivalent for '-s' in GNU as; 'as --help' on
x86_64 notes that '-s' is ignored and 's390x-linux-gnu-as --help' makes
no mention of it whatsoever.

Just drop '-s' altogether, as it has been there since the introduction
of the vDSO, which means it is likely uneeded, given there would likely
have been a report by this point.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: hca@linux.ibm.com
Cc: gor@linux.ibm.com
Cc: agordeev@linux.ibm.com
Cc: borntraeger@linux.ibm.com
Cc: svens@linux.ibm.com
Cc: linux-s390@vger.kernel.org
---
 arch/s390/kernel/vdso64/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 9e2b95a222a9..a2fe9383d452 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -22,7 +22,7 @@ KBUILD_AFLAGS += -DBUILD_VDSO
 KBUILD_CFLAGS += -DBUILD_VDSO -DDISABLE_BRANCH_PROFILING
 
 KBUILD_AFLAGS_64 := $(filter-out -m64,$(KBUILD_AFLAGS))
-KBUILD_AFLAGS_64 += -m64 -s
+KBUILD_AFLAGS_64 += -m64
 
 KBUILD_CFLAGS_64 := $(filter-out -m64,$(KBUILD_CFLAGS))
 KBUILD_CFLAGS_64 += -m64 -fPIC -shared -fno-common -fno-builtin

-- 
2.39.0
