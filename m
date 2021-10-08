Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A02C88
	for <llvm@lists.linux.dev>; Fri,  8 Oct 2021 12:24:02 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1mYouc-0003bC-UL; Fri, 08 Oct 2021 20:23:42 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1mYouW-00085i-Da; Fri, 08 Oct 2021 20:23:36 +0800
Date: Fri, 8 Oct 2021 20:23:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Gilad Ben-Yossef <gilad@benyossef.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] crypto: ccree - avoid out-of-range warnings from clang
Message-ID: <20211008122336.GB31060@gondor.apana.org.au>
References: <20210927121811.940899-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927121811.940899-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Sep 27, 2021 at 02:18:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang points out inconsistencies in the FIELD_PREP() invocation in
> this driver that result from the 'mask' being a 32-bit value:
> 
> drivers/crypto/ccree/cc_driver.c:117:18: error: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         cache_params |= FIELD_PREP(mask, val);
>                         ^~~~~~~~~~~~~~~~~~~~~
> include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
>                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bitfield.h:52:28: note: expanded from macro '__BF_FIELD_CHECK'
>                 BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
>                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This does not happen in other places that just pass a constant here.
> 
> Work around the warnings by widening the type of the temporary variable.
> 
> Fixes: 05c2a705917b ("crypto: ccree - rework cache parameters handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/crypto/ccree/cc_driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
