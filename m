Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0472F80
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 06:28:32 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1mWBRk-00065u-FU; Fri, 01 Oct 2021 13:51:00 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1mWBRi-0007qF-UQ; Fri, 01 Oct 2021 13:50:58 +0800
Date: Fri, 1 Oct 2021 13:50:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Vladis Dronov <vdronov@redhat.com>, Simo Sorce <ssorce@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>, llvm@lists.linux.dev
Subject: Re: [v2 PATCH] crypto: api - Fix built-in testing dependency failures
Message-ID: <20211001055058.GA6081@gondor.apana.org.au>
References: <20210913071251.GA15235@gondor.apana.org.au>
 <20210917002619.GA6407@gondor.apana.org.au>
 <YVNfqUVJ7w4Z3WXK@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVNfqUVJ7w4Z3WXK@archlinux-ax161>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Sep 28, 2021 at 11:32:09AM -0700, Nathan Chancellor wrote:
>
> This patch as commit 3cefb01905df ("crypto: api - Fix built-in testing
> dependency failures") in -next (along with the follow up fix) causes the
> following depmod error:
> 
> $ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc-linux- INSTALL_MOD_PATH=rootfs ppc44x_defconfig all modules_install
> depmod: ERROR: Cycle detected: crypto -> crypto_algapi -> crypto
> depmod: ERROR: Found 2 modules in dependency cycles!
> make: *** [Makefile:1946: modules_install] Error 1
> 
> Initially reported on our CI:
> 
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/3732847295?check_suite_focus=true

That's weird, I can't reproduce this.  Where can I find your Kconfig
file? Alternatively, can you identify exactly what is in algapi that
is being depended on by crypto?

The crypto module should be at the very base and there should be no
depenedencies from it on algapi.  The algapi module is meant to be
on top of crypto obviously.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
