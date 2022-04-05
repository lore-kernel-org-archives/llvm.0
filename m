Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323062F3A
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 14:08:11 +0000 (UTC)
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-04.nifty.com with ESMTP id 235E43YN000625
	for <llvm@lists.linux.dev>; Tue, 5 Apr 2022 23:04:03 +0900
Received: from grover.. (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-09.nifty.com with ESMTP id 235E2k8I021295;
	Tue, 5 Apr 2022 23:02:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 235E2k8I021295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1649167367;
	bh=tlKllE+DeH+owxkSzZkT6wnBC6VcqxWAXsQhSEB8rk0=;
	h=From:To:Cc:Subject:Date:From;
	b=Uv4X9S8slbNYOacfNha8LhvGPEryM5kYHXmLEzvdr5IAfZaDURgz9esyRoB04c+5C
	 hz1jkmpqUz+Ip3IV6aRBsB7/5c86PqqNgWgMijMJ0EdLZ3i2xMZoJZ1xXSqgcT6lKs
	 ugNv2u7eEhu0EDi7YKN9ckmLl7vZnWW0x2mhEqtxgqv4zUsRWlam8hVy463NOjyUlf
	 YmUqw4UJdABGIlAouutEFUA87PdtTb1qjRCFPWOGlPm8T5S7MBsTfsKLTyRBb3BNEw
	 lefAHmSe4tGn9E2m39rmd8awrAPSD3hTlaxaAD+LT2E3/95Qmfmvmgh4WNANJMxMRP
	 y7oEPJRf2fs4A==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <n.schier@avm.de>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev
Subject: [PATCH v2 00/10] kbuild: misc cleanups
Date: Tue,  5 Apr 2022 23:02:19 +0900
Message-Id: <20220405140229.2895394-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This is a series of prerequisite cleanups of my next work.


Masahiro Yamada (10):
  kbuild: factor out genksyms command from cmd_gensymtypes_{c,S}
  kbuild: do not remove empty *.symtypes explicitly
  modpost: remove useless export_from_sec()
  modpost: move export_from_secname() call to more relevant place
  modpost: remove redundant initializes for static variables
  modpost: remove annoying namespace_from_kstrtabns()
  kbuild: get rid of duplication in the first line of *.mod files
  kbuild: split the second line of *.mod into *.usyms
  kbuild: refactor cmd_modversions_c
  kbuild: refactor cmd_modversions_S

 .gitignore                  |  1 +
 Makefile                    |  2 +-
 scripts/Makefile.build      | 86 ++++++++++++++++---------------------
 scripts/adjust_autoksyms.sh |  2 +-
 scripts/gen_autoksyms.sh    | 18 +++++---
 scripts/mod/modpost.c       | 49 ++++++---------------
 scripts/mod/modpost.h       |  4 --
 scripts/mod/sumversion.c    | 11 +----
 8 files changed, 64 insertions(+), 109 deletions(-)

-- 
2.32.0

