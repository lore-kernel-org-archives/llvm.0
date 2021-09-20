Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529CB72
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 07:47:31 +0000 (UTC)
Received: from localhost.localdomain (ip5f5aef72.dynamic.kabel-deutschland.de [95.90.239.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6ED0F61E5FE00;
	Mon, 20 Sep 2021 09:47:22 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	linuxppc-dev@lists.ozlabs.org,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] lib/zlib_inflate/inffast: Check config in C to avoid unused function warning
Date: Mon, 20 Sep 2021 09:46:33 +0200
Message-Id: <20210920074633.13089-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building Linux for ppc64le with Ubuntu clang version 12.0.0-3ubuntu1~21.04.1
shows the warning below.

    arch/powerpc/boot/inffast.c:20:1: warning: unused function 'get_unaligned16' [-Wunused-function]
    get_unaligned16(const unsigned short *p)
    ^
    1 warning generated.

Fix it, by moving the check from the preprocessor to C, so the compiler
sees the use.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 lib/zlib_inflate/inffast.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/zlib_inflate/inffast.c b/lib/zlib_inflate/inffast.c
index f19c4fbe1be7..fb87a3120f0f 100644
--- a/lib/zlib_inflate/inffast.c
+++ b/lib/zlib_inflate/inffast.c
@@ -254,11 +254,8 @@ void inflate_fast(z_streamp strm, unsigned start)
 			sfrom = (unsigned short *)(from);
 			loops = len >> 1;
 			do
-#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-			    *sout++ = *sfrom++;
-#else
-			    *sout++ = get_unaligned16(sfrom++);
-#endif
+			    *sout++ = IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) ?
+				*sfrom++ : get_unaligned16(sfrom++);
 			while (--loops);
 			out = (unsigned char *)sout;
 			from = (unsigned char *)sfrom;
-- 
2.33.0

