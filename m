Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049FC29CA
	for <llvm@lists.linux.dev>; Fri, 31 Dec 2021 12:05:13 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1n3GBn-0004xW-BQ; Fri, 31 Dec 2021 22:35:16 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 31 Dec 2021 22:35:15 +1100
Date: Fri, 31 Dec 2021 22:35:15 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: trix@redhat.com
Cc: wangzhou1@hisilicon.com, davem@davemloft.net, nathan@kernel.org,
	ndesaulniers@google.com, yekai13@huawei.com,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] crypto: cleanup warning in qm_get_qos_value()
Message-ID: <Yc7q8yhSp+aRy1Xg@gondor.apana.org.au>
References: <20211222172923.3209810-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222172923.3209810-1-trix@redhat.com>

On Wed, Dec 22, 2021 at 09:29:23AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Building with clang static analysis returns this warning:
> 
> qm.c:4382:11: warning: The left operand of '==' is a garbage value
>         if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
>             ~~~~ ^
> 
> The call to qm_qos_value_init() can return an error without setting
> *val.  So check ret before checking *val.
> 
> Fixes: 72b010dc33b9 ("crypto: hisilicon/qm - supports writing QoS int the host")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: Add Fixes: line
> 
>  drivers/crypto/hisilicon/qm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
