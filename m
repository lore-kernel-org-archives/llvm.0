Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CF2F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:51:36 +0000 (UTC)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-02.nifty.com with ESMTP id 24BGnJdZ003087
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:49:19 +0900
Received: from grover.jp (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 24BGlWc1031975;
	Thu, 12 May 2022 01:47:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 24BGlWc1031975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652287659;
	bh=9Q6mTn1bAGbkjgZhALJ6nTHBDHzsRRSkgxWQCfuUF6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WheXMU9GEV/CluE33iXAr7vz1iDk23lqH+YQaVG5VXYoGJV9VsQYDXFzswjBLUAPw
	 mFs/FP6orbudynGzEF6DhFFyDAdUC4HkeOnVG6lCTUjuhzXhU0njrV4QrBq33rgDtZ
	 4y495WbU1FyN5dtYcOcD3wpTnSZTVW4fehiycOakd9fMA5/NAKOqga6Jyu29QKEQX4
	 F26o2NUEU1PlHoNpfXJDOIIJlCD2cQ2K34+5d3UToBEffOgK9NdCrhjG+XthkVpjSX
	 j7hF5BsKjpC2Ha5XTE3MWL25pO+MNhAdEAV2Qg8iNoQXn+wnuBf4rBi6Uj5Py9YAUr
	 Bl6quKoN+q4mA==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org,
        llvm@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v5 06/12] genksyms: adjust the output format to modpost
Date: Thu, 12 May 2022 01:45:08 +0900
Message-Id: <20220511164514.2741934-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220511164514.2741934-1-masahiroy@kernel.org>
References: <20220511164514.2741934-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make genksyms output symbol versions in the format modpost expects,
so the 'sed' is unneeded.

This commit makes *.symversions completely unneeded.

I will keep *.symversions in .gitignore and 'make clean' for a while.
Otherwise, 'git status' might be surprising.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---

(no changes since v2)

Changes in v2:
  - New patch

 scripts/Makefile.build      | 6 ------
 scripts/genksyms/genksyms.c | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index dff9220135c4..461998a2ad2b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -165,16 +165,10 @@ ifdef CONFIG_MODVERSIONS
 # o modpost will extract versions from that file and create *.c files that will
 #   be compiled and linked to the kernel and/or modules.
 
-genksyms_format := __crc_\(.*\) = \(.*\);
-
 gen_symversions =								\
 	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
 		$(call cmd_gensymtypes_$(1),$(KBUILD_SYMTYPES),$(@:.o=.symtypes)) \
-		    > $@.symversions;						\
-		sed -n 's/$(genksyms_format)/$(pound)SYMVER \1 \2/p' $@.symversions \
 			>> $(dot-target).cmd;					\
-	else									\
-		rm -f $@.symversions;						\
 	fi
 
 cmd_gen_symversions_c =	$(call gen_symversions,c)
diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 67b23cc0df0f..f5dfdb9d80e9 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -680,7 +680,7 @@ void export_symbol(const char *name)
 		if (flag_dump_defs)
 			fputs(">\n", debugfile);
 
-		printf("__crc_%s = 0x%08lx;\n", name, crc);
+		printf("#SYMVER %s 0x%08lx\n", name, crc);
 	}
 }
 
-- 
2.32.0

