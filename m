Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A52928F2;
	Wed, 19 Apr 2023 09:27:53 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pp46F-00091g-Ap; Wed, 19 Apr 2023 17:27:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 19 Apr 2023 17:27:40 +0800
Date: Wed, 19 Apr 2023 17:27:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [PATCH] crypto: arm/sha1-neon - Fix clang function cast warnings
Message-ID: <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
References: <202304081828.zjGcFUyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304081828.zjGcFUyE-lkp@intel.com>

Instead of casting the function which upsets clang for some reason,
change the assembly function siganture instead.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm/crypto/sha1_neon_glue.c b/arch/arm/crypto/sha1_neon_glue.c
index cfe36ae0f3f5..9c70b87e69f7 100644
--- a/arch/arm/crypto/sha1_neon_glue.c
+++ b/arch/arm/crypto/sha1_neon_glue.c
@@ -26,8 +26,8 @@
 
 #include "sha1.h"
 
-asmlinkage void sha1_transform_neon(void *state_h, const char *data,
-				    unsigned int rounds);
+asmlinkage void sha1_transform_neon(struct sha1_state *state_h,
+				    const u8 *data, int rounds);
 
 static int sha1_neon_update(struct shash_desc *desc, const u8 *data,
 			  unsigned int len)
@@ -39,8 +39,7 @@ static int sha1_neon_update(struct shash_desc *desc, const u8 *data,
 		return sha1_update_arm(desc, data, len);
 
 	kernel_neon_begin();
-	sha1_base_do_update(desc, data, len,
-			    (sha1_block_fn *)sha1_transform_neon);
+	sha1_base_do_update(desc, data, len, sha1_transform_neon);
 	kernel_neon_end();
 
 	return 0;
@@ -54,9 +53,8 @@ static int sha1_neon_finup(struct shash_desc *desc, const u8 *data,
 
 	kernel_neon_begin();
 	if (len)
-		sha1_base_do_update(desc, data, len,
-				    (sha1_block_fn *)sha1_transform_neon);
-	sha1_base_do_finalize(desc, (sha1_block_fn *)sha1_transform_neon);
+		sha1_base_do_update(desc, data, len, sha1_transform_neon);
+	sha1_base_do_finalize(desc, sha1_transform_neon);
 	kernel_neon_end();
 
 	return sha1_base_finish(desc, out);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
