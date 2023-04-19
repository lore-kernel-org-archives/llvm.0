Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E928F2;
	Wed, 19 Apr 2023 09:32:00 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pp4AG-00096b-QR; Wed, 19 Apr 2023 17:31:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 19 Apr 2023 17:31:49 +0800
Date: Wed, 19 Apr 2023 17:31:49 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [PATCH] crypto: arm/sha256-neon - Fix clang function cast warnings
Message-ID: <ZD+1BQd8Phqk3lzv@gondor.apana.org.au>
References: <202304081828.zjGcFUyE-lkp@intel.com>
 <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD+0DJq1NHmMSSja@gondor.apana.org.au>

Instead of casting the function which upsets clang for some reason,
change the assembly function siganture instead.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm/crypto/sha256_neon_glue.c b/arch/arm/crypto/sha256_neon_glue.c
index 701706262ef3..ccdcfff71910 100644
--- a/arch/arm/crypto/sha256_neon_glue.c
+++ b/arch/arm/crypto/sha256_neon_glue.c
@@ -21,8 +21,8 @@
 
 #include "sha256_glue.h"
 
-asmlinkage void sha256_block_data_order_neon(u32 *digest, const void *data,
-					     unsigned int num_blks);
+asmlinkage void sha256_block_data_order_neon(struct sha256_state *digest,
+					     const u8 *data, int num_blks);
 
 static int crypto_sha256_neon_update(struct shash_desc *desc, const u8 *data,
 				     unsigned int len)
@@ -34,8 +34,7 @@ static int crypto_sha256_neon_update(struct shash_desc *desc, const u8 *data,
 		return crypto_sha256_arm_update(desc, data, len);
 
 	kernel_neon_begin();
-	sha256_base_do_update(desc, data, len,
-			(sha256_block_fn *)sha256_block_data_order_neon);
+	sha256_base_do_update(desc, data, len, sha256_block_data_order_neon);
 	kernel_neon_end();
 
 	return 0;
@@ -50,9 +49,8 @@ static int crypto_sha256_neon_finup(struct shash_desc *desc, const u8 *data,
 	kernel_neon_begin();
 	if (len)
 		sha256_base_do_update(desc, data, len,
-			(sha256_block_fn *)sha256_block_data_order_neon);
-	sha256_base_do_finalize(desc,
-			(sha256_block_fn *)sha256_block_data_order_neon);
+				      sha256_block_data_order_neon);
+	sha256_base_do_finalize(desc, sha256_block_data_order_neon);
 	kernel_neon_end();
 
 	return sha256_base_finish(desc, out);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
