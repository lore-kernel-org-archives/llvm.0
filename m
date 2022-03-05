Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9805A3D
	for <llvm@lists.linux.dev>; Sat,  5 Mar 2022 09:33:39 +0000 (UTC)
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-09.nifty.com with ESMTP id 2259TCPV031098
	for <llvm@lists.linux.dev>; Sat, 5 Mar 2022 18:29:12 +0900
Received: from grover.. (133-32-176-37.west.xps.vectant.ne.jp [133.32.176.37]) (authenticated)
	by conuserg-07.nifty.com with ESMTP id 2259SO9S016984;
	Sat, 5 Mar 2022 18:28:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 2259SO9S016984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1646472505;
	bh=WtqUDFVKQZ2zys8nwjVIQbe1cN+xec4kuSb2ZpF2tHE=;
	h=From:To:Cc:Subject:Date:From;
	b=zW9fBL972od5EGt7igJI75Dzx4xTIlNW8pEdh06FwznqRh/iDECXiRdCwh2j0TG7u
	 rVKu3lMAzswaeXGWQ1VXY4aO55iJX1fhMcF/s3xLkGdGGFggHms4LA5UDtPYJlv+gb
	 OYi0BqVltOhZktDCLrSqnBF3MWoAVvCdWTVTpvdVWqPxyDK5xCzwfh5OhxbIix1Qv2
	 aX9hSjkPWdS9DOohNbW2m/BJb5z8ARvDLczYq3fzXpzkra2GmTRW22OlOXV1N05QG6
	 VFYpKjq1iLlZdQGKOHtR6U2qn7QJ5kIXC1Sppf5AJqXTQ7fRpUmlq9zhdTUCHscebC
	 nLkbxb2+et1zA==
X-Nifty-SrcIP: [133.32.176.37]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
        Fangrui Song <maskray@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] kbuild: add --target to correctly cross-compile UAPI headers with Clang
Date: Sat,  5 Mar 2022 18:28:16 +0900
Message-Id: <20220305092816.92114-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When you compile-test UAPI headers (CONFIG_UAPI_HEADER_TEST=y) with
Clang, they are currently compiled for the host target (likely x86_64)
regardless of the given ARCH=.

As a matter of fact, some exported headers include libc headers.
For example, include/uapi/sound/asound.h includes <stdlib.h> and <time.h>
after being exported. It is better to try to match the header search
paths to the target we are compiling them for.

Pick up the --target triple from KBUILD_CFLAGS in the same ways as
commit 7f58b487e9ff ("kbuild: make Clang build userprogs for target
architecture").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

As far as I tested on Debian, Clang falls back to /usr/include/
when libc dev package for the specified target is not installed.

For example, --target=aarch64-linux-gnu tries to include

   /usr/aarch64-linux-gnu/include/stdlib.h

, which is available when libc6-dev-arm64-cross is installed.

Otherwise, includes

   /usr/include/stdlib.h





 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 703ee034033e..19ac4b63866d 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -12,7 +12,7 @@ UAPI_CFLAGS += $(CLANG_FLAGS)
 
 # In theory, we do not care -m32 or -m64 for header compile tests.
 # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
-UAPI_CFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
+UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
 
 # USERCFLAGS might contain sysroot location for CC.
 UAPI_CFLAGS += $(USERCFLAGS)
-- 
2.32.0

