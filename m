Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D96BA40
	for <llvm@lists.linux.dev>; Wed,  4 Jan 2023 19:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AABC43398;
	Wed,  4 Jan 2023 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672862102;
	bh=5O31/XAlnhwnQJPlhpwoSbHf+ZiDlbOC4a1CxUANeAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gQmdMK/SRWnAee27fDhmXVD5oLyGSteYXSK2Yy/Ia5/p6Ow7SmjkDWqikzVDxG80x
	 Amc2M5O7c4RZX7n/NT4dNjGoRtl0EykkYA+vHnR73JWZ7XaRlicpwSedZF3kCsxG8c
	 tEPwFo6Cg8ivTUHIFhsPJzfhFA5SEyTfVe34z7dwAH7VF92EJeoaacOtIRzkkChuVv
	 zEqrnXUJ8Si/1GrsAk98ThmSeM2vcjtG22C3agPniOczkdJejPen9wxbG+WMTZQ/RZ
	 O+oRxhX4ixadzuu4na1OVUwLumWMdnHJpcW0/InccY7CcrscQhKJmKGZ8w94JrbSqI
	 1NxyFSAZcgYIQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 04 Jan 2023 12:54:27 -0700
Subject: [PATCH 10/14] s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-10-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To: masahiroy@kernel.org, ndesaulniers@google.com
Cc: nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=nathan@kernel.org;
 h=from:subject:message-id; bh=5O31/XAlnhwnQJPlhpwoSbHf+ZiDlbOC4a1CxUANeAk=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3Y7rfl6cl9SyN2pqtnZpq3hiZ9Yjl19ddDg3F6nGU1r
 mkPudZSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJtFxg+CulI+7Yx7K0qfvWb/e9XS
 4/D2dcd/RadsPHOPOk3qqMd4KMDEcnf29fV1fU9XuV7bTbi6TWO6Qv1uboP3lbvSnv1e037HwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
points out that there is a linking phase flag added to CFLAGS, which
will only be used for compiling

  clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]

'-shared' is already present in ldflags-y so it can just be dropped.

Fixes: 2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO")
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
index a2fe9383d452..34f9542636e9 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -25,7 +25,7 @@ KBUILD_AFLAGS_64 := $(filter-out -m64,$(KBUILD_AFLAGS))
 KBUILD_AFLAGS_64 += -m64
 
 KBUILD_CFLAGS_64 := $(filter-out -m64,$(KBUILD_CFLAGS))
-KBUILD_CFLAGS_64 += -m64 -fPIC -shared -fno-common -fno-builtin
+KBUILD_CFLAGS_64 += -m64 -fPIC -fno-common -fno-builtin
 ldflags-y := -fPIC -shared -soname=linux-vdso64.so.1 \
 	     --hash-style=both --build-id=sha1 -T
 

-- 
2.39.0
