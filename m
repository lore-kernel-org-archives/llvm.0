Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB33028F2;
	Wed, 19 Apr 2023 09:35:28 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pp4Cr-0009CV-6F; Wed, 19 Apr 2023 17:34:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 19 Apr 2023 17:34:30 +0800
Date: Wed, 19 Apr 2023 17:34:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [PATCH] crypto: arm/sha512-neon - Fix clang function cast warnings
Message-ID: <ZD+1phnERT6EkIUe@gondor.apana.org.au>
References: <202304081828.zjGcFUyE-lkp@intel.com>
 <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
 <ZD+1BQd8Phqk3lzv@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD+1BQd8Phqk3lzv@gondor.apana.org.au>

Instead of casting the function which upsets clang for some reason,
change the assembly function siganture instead.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm/crypto/sha512-neon-glue.c b/arch/arm/crypto/sha512-neon-glue.c
index c879ad32db51..c6e58fe475ac 100644
--- a/arch/arm/crypto/sha512-neon-glue.c
+++ b/arch/arm/crypto/sha512-neon-glue.c
@@ -20,8 +20,8 @@
 MODULE_ALIAS_CRYPTO("sha384-neon");
 MODULE_ALIAS_CRYPTO("sha512-neon");
 
-asmlinkage void sha512_block_data_order_neon(u64 *state, u8 const *src,
-					     int blocks);
+asmlinkage void sha512_block_data_order_neon(struct sha512_state *state,
+					     const u8 *src, int blocks);
 
 static int sha512_neon_update(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
@@ -33,8 +33,7 @@ static int sha512_neon_update(struct shash_desc *desc, const u8 *data,
 		return sha512_arm_update(desc, data, len);
 
 	kernel_neon_begin();
-	sha512_base_do_update(desc, data, len,
-		(sha512_block_fn *)sha512_block_data_order_neon);
+	sha512_base_do_update(desc, data, len, sha512_block_data_order_neon);
 	kernel_neon_end();
 
 	return 0;
@@ -49,9 +48,8 @@ static int sha512_neon_finup(struct shash_desc *desc, const u8 *data,
 	kernel_neon_begin();
 	if (len)
 		sha512_base_do_update(desc, data, len,
-			(sha512_block_fn *)sha512_block_data_order_neon);
-	sha512_base_do_finalize(desc,
-		(sha512_block_fn *)sha512_block_data_order_neon);
+				      sha512_block_data_order_neon);
+	sha512_base_do_finalize(desc, sha512_block_data_order_neon);
 	kernel_neon_end();
 
 	return sha512_base_finish(desc, out);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
