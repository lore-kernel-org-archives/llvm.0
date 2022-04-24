Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E7D7C
	for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 19:16:22 +0000 (UTC)
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-10.nifty.com with ESMTP id 23OJAcRj029903
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 04:10:38 +0900
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-10.nifty.com with ESMTP id 23OJ8o5s019069;
	Mon, 25 Apr 2022 04:08:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 23OJ8o5s019069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1650827331;
	bh=fS9R10vq4IlpfOs3RJ83vefXngPWoPRwppRrtnqmMAw=;
	h=From:To:Cc:Subject:Date:From;
	b=OtBPeJ7bd9EDe1GEJXgg5mHO9N9+21LPy/axxihlM7qtLYZspwwC588qjsoNybEGb
	 S2cMP3SJDYch23nwJL6QtyhyMN/uioKiMLg4vVeMGd0OwFzP6Ho8yzKIeUPieX9OIi
	 CT+NFXE6i3ZojxDWDPdfsIaxoqtSsPfoq6sHr/6pcRkr9CjNmOm14FYh5rzAi52zO2
	 Bx9RSErmnXB5+FtQFXjK4jZyQqEztpW6iSjIeYQikpJy/2Y+INxl8tni057MElw3+z
	 qOHUTAO89Wmux7gHa5shiMzWiq5zvKUGvQO3HiSFTStCHby50+eGgOvD424W4HQbdL
	 BNhCUWoFR1lfw==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, llvm@lists.linux.dev
Subject: [PATCH 00/27] kbuild: yet another series of cleanups (modpost and LTO)
Date: Mon, 25 Apr 2022 04:07:44 +0900
Message-Id: <20220424190811.1678416-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the third batch of cleanups in this development cycle.

This weekend, I wrote up the code I have been planning.

After a bunch of modpost refactoring, I got rid of the ugly code
in Makefiles.

With this, Kbuild will get back much simpler and cleaner.



Masahiro Yamada (27):
  modpost: use snprintf() instead of sprintf() for safety
  modpost: do not write out any file when error occurred
  modpost: remove stale comment about sym_add_exported()
  modpost: add a separate error for exported symbols without definition
  modpost: retrieve the module dependency and CRCs in check_exports()
  modpost: use bool type where appropriate
  modpost: import include/linux/list.h
  modpost: traverse modules in order
  modpost: add sym_add_unresolved() helper
  modpost: traverse unresolved symbols in order
  modpost: use doubly linked list for dump_lists
  modpost: move struct namespace_list to modpost.c
  modpost: traverse the namespace_list in order
  modpost: dump Module.symvers in the same order of modules.order
  modpost: move static EXPORT_SYMBOL check to check_exports()
  modpost: make multiple export error
  modpost: make sym_add_exported() always allocate a new symbol
  modpost: make sym_add_exported() a void function
  modpost: use hlist for hash table implementation
  modpost: mitigate false-negatives for static EXPORT_SYMBOL checks
  kbuild: record symbol versions in *.cmd files
  kbuild: generate a list of objects in vmlinux
  modpost: retrieve symbol versions by parsing *.cmd files
  modpost: generate linker script to collect symbol versions
  kbuild: embed symbol versions at final link of vmlinux or modules
  kbuild: stop generating *.symversions
  kbuild: do not create *.prelink.o for Clang LTO or IBT

 .gitignore                |   1 +
 Makefile                  |   1 +
 scripts/Kbuild.include    |   4 +
 scripts/Makefile.build    | 107 ++------
 scripts/Makefile.lib      |   7 -
 scripts/Makefile.modfinal |   6 +-
 scripts/Makefile.modpost  |   9 +-
 scripts/link-vmlinux.sh   |  38 ++-
 scripts/mod/file2alias.c  |   2 -
 scripts/mod/list.h        | 336 ++++++++++++++++++++++++
 scripts/mod/modpost.c     | 529 +++++++++++++++++++++++---------------
 scripts/mod/modpost.h     |  27 +-
 12 files changed, 731 insertions(+), 336 deletions(-)
 create mode 100644 scripts/mod/list.h

-- 
2.32.0

