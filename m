Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2292907;
	Tue, 13 Dec 2022 10:43:51 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1p52l0-006n59-GP; Tue, 13 Dec 2022 18:43:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 13 Dec 2022 18:43:30 +0800
Date: Tue, 13 Dec 2022 18:43:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Robert Elliott <elliott@hpe.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [PATCH] crypto: arm/sha1 - Fix clang function cast warnings
Message-ID: <Y5hXUlvSmHrP8PTN@gondor.apana.org.au>
References: <202211041904.f9S5gAGL-lkp@intel.com>
 <Y5FvChDBD/+uaFy8@gondor.apana.org.au>
 <CAMj1kXGkdp_cwOWeX_49Y5xTCH8Y7X-LnM8pJufCH3yw7anBWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGkdp_cwOWeX_49Y5xTCH8Y7X-LnM8pJufCH3yw7anBWQ@mail.gmail.com>

On Thu, Dec 08, 2022 at 07:05:45PM +0100, Ard Biesheuvel wrote:
>
> We can, as the BUILD_BUG() will catch it if struct sha1_state gets
> modified in an incompatible way.

Thanks for confirming!

---8<---
Instead of casting the function which upsets clang for some reason,
change the assembly function siganture instead.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm/crypto/sha1_glue.c b/arch/arm/crypto/sha1_glue.c
index 6c2b849e459d..95a727bcd664 100644
--- a/arch/arm/crypto/sha1_glue.c
+++ b/arch/arm/crypto/sha1_glue.c
@@ -21,31 +21,29 @@
 
 #include "sha1.h"
 
-asmlinkage void sha1_block_data_order(u32 *digest,
-		const unsigned char *data, unsigned int rounds);
+asmlinkage void sha1_block_data_order(struct sha1_state *digest,
+		const u8 *data, int rounds);
 
 int sha1_update_arm(struct shash_desc *desc, const u8 *data,
 		    unsigned int len)
 {
-	/* make sure casting to sha1_block_fn() is safe */
+	/* make sure signature matches sha1_block_fn() */
 	BUILD_BUG_ON(offsetof(struct sha1_state, state) != 0);
 
-	return sha1_base_do_update(desc, data, len,
-				   (sha1_block_fn *)sha1_block_data_order);
+	return sha1_base_do_update(desc, data, len, sha1_block_data_order);
 }
 EXPORT_SYMBOL_GPL(sha1_update_arm);
 
 static int sha1_final(struct shash_desc *desc, u8 *out)
 {
-	sha1_base_do_finalize(desc, (sha1_block_fn *)sha1_block_data_order);
+	sha1_base_do_finalize(desc, sha1_block_data_order);
 	return sha1_base_finish(desc, out);
 }
 
 int sha1_finup_arm(struct shash_desc *desc, const u8 *data,
 		   unsigned int len, u8 *out)
 {
-	sha1_base_do_update(desc, data, len,
-			    (sha1_block_fn *)sha1_block_data_order);
+	sha1_base_do_update(desc, data, len, sha1_block_data_order);
 	return sha1_final(desc, out);
 }
 EXPORT_SYMBOL_GPL(sha1_finup_arm);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
