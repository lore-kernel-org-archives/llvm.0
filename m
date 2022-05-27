Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974F31851
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 10:09:45 +0000 (UTC)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-10.nifty.com with ESMTP id 24RA3hca022965
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 19:03:44 +0900
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 24RA2hPT029808;
	Fri, 27 May 2022 19:02:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 24RA2hPT029808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653645767;
	bh=cTEaVsseOx/T6+9eTNjc+bnIPuNDfidAbsIlj5Z4+nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XpE7bhc4dasDj31nobFoqPZGgWiHTils8FMsJswF8sT3w9ijw0iw3nlSSVTozzRMi
	 5lR95zCyn+Nb62hZxhVHIqd5ZAWWXF0Ki8UEf5wX/DKFCjachHKy+d4+EMx1QH29X9
	 oB0Auu2Zn99EC92w3maEIK2Yd/bYMipg/OlwRvvXPBFznVlCCZRQlpjuNIpRGWqhTJ
	 yYD5OJZlt7Nj2wfepXpIJl4EV+2ROJWGCiqydkPK73l7GS0SbhKeNPsVdHn0TyShTS
	 C9wi5Jten3kQqzhIwYCejZtkdGYT2xGN5xyt4Licsl4OkoREvNk0Ini6mrNgcEehAh
	 Jky+sznG4p0wQ==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH v7 3/8] parisc: fix the exit status of arch/parisc/nm
Date: Fri, 27 May 2022 19:01:50 +0900
Message-Id: <20220527100155.1996314-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220527100155.1996314-1-masahiroy@kernel.org>
References: <20220527100155.1996314-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parisc overrides 'nm' with a shell script. I do not know the reason,
but anyway it is how it has worked since 2003. [1]

A problem is that this script returns the exit code of grep instead of
${CROSS_COMPILE}nm.

grep(1) says:
    Normally the exit status is 0 if a line is selected, 1 if no lines
    were selected, and 2 if an error occurred. However, if the -q or
    --quiet or --silent is used and a line is selected, the exit status
    is 0 even if an error occurred.

When the given object has no symbol, grep returns 1, while the true nm
returns 0. Hence, build rules using ${NM} fail on ARCH=parisc even if
the given object is valid.

This commit corrects the exit status of the script.

 - A pipeline returns the exit status of the last command (here, grep).
   The exit status of ${CROSS_COMPILE}nm is just ignored. Use bash's
   pipefail flag to catch errors of ${CROSS_COMPILE}nm.

 - If grep returns 1, this script should return 0 in order to mimic
   true nm. If grep returns 2, it is a real and fatal error. Return
   it as is.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=36eaa6e4c0e0b6950136b956b72fd08155b92ca3

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v7:
  - New patch

 arch/parisc/Makefile |  2 +-
 arch/parisc/nm       | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 arch/parisc/nm

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index aca1710fd658..e7139955367d 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -18,7 +18,7 @@
 boot := arch/parisc/boot
 KBUILD_IMAGE := $(boot)/bzImage
 
-NM		= sh $(srctree)/arch/parisc/nm
+NM		= $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
 
 ifdef CONFIG_64BIT
diff --git a/arch/parisc/nm b/arch/parisc/nm
old mode 100644
new mode 100755
index c788308de33f..3e72238a91f3
--- a/arch/parisc/nm
+++ b/arch/parisc/nm
@@ -1,6 +1,14 @@
-#!/bin/sh
+#!/bin/bash
 ##
 # Hack to have an nm which removes the local symbols.  We also rely
 # on this nm being hidden out of the ordinarily executable path
 ##
-${CROSS_COMPILE}nm $* | grep -v '.LC*[0-9]*$'
+
+# use pipefail to catch error of ${CROSS_COMPILE}nm
+set -o pipefail
+
+# grep exits with 1 if no lines were selected.
+# If the given object has no symbol, grep returns 1, but it is not an error.
+
+${CROSS_COMPILE}nm "$@" |
+{ grep -v '.LC*[0-9]*$' || { exit_code=$?; test $exit_code -eq 1 || exit $exit_code; } }
-- 
2.32.0

