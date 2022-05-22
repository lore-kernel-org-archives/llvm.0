Received: from condef-07.nifty.com (condef-07.nifty.com [202.248.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47C2F28
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 16:11:10 +0000 (UTC)
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-07.nifty.com with ESMTP id 24MG4AjT025060
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 01:04:11 +0900
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-07.nifty.com with ESMTP id 24MG222A005058;
	Mon, 23 May 2022 01:02:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 24MG222A005058
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653235323;
	bh=SzF5mYVMdGjHhfCv/rltheskX/0l5HwxsKRJxdjGT/4=;
	h=From:To:Cc:Subject:Date:From;
	b=E11fmN0qTEJgixluB454aUu8UN2EUaQLN8HJlDpVWLReICVr+Y7vxvM2CBFphWjay
	 REt3XNJHvqTFJpOz5FRdyXtmFQm5yBqJNhcFsBpCsK/tdMVH87AdJ0/K9AtnMvGagf
	 vvTK4oV62IyNVbJrwbAtbQEO1+YVDf71nQ1j5vJD+S/9nZtLyq191JXwX9DCArAFnq
	 BBDvVEEZDmrkCbW4RSC9XjhrhI4z8rpIjG8JDniJ4GPQBvaxCQ23eeX37DDfqRtSh5
	 r5M/HpGz3B9rsJY/OiHeUPpiYkJ4QoW0xy/0KMHfOg9SFIXySudLDsN/dU7ZVqnf76
	 tmDsxsaQTi79w==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org,
        llvm@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] fixup! kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
Date: Mon, 23 May 2022 01:01:17 +0900
Message-Id: <20220522160117.599023-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I will squash this into

  https://patchwork.kernel.org/project/linux-kbuild/patch/20220513113930.10488-3-masahiroy@kernel.org/

Sedat Reported an error:

  https://lore.kernel.org/linux-kbuild/CA+icZUWttwjhDNPO1VuVyiMoReH5e83nsYDd0rEoY8-Uwv6pHw@mail.gmail.com/T/#md82f561e348b7959b7270c33ac86fa3edb0d773a

__used is needed to make the combination of
CONFIG_MODVERSIONS and CONFIG_LTO_CLANG working.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/linux/export-internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index 77175d561058..c2b1d4fd5987 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -10,7 +10,8 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
+/* __used is needed to keep __crc_* for LTO */
 #define SYMBOL_CRC(sym, crc, sec)   \
-	u32 __section("___kcrctab" sec "+" #sym) __crc_##sym = crc
+	u32 __section("___kcrctab" sec "+" #sym) __used __crc_##sym = crc
 
 #endif /* __LINUX_EXPORT_INTERNAL_H__ */
-- 
2.32.0

