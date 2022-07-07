Received: from relay4.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66792563
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 18:19:24 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 1E8C4203B6;
	Thu,  7 Jul 2022 17:40:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 065072002C;
	Thu,  7 Jul 2022 17:40:29 +0000 (UTC)
Message-ID: <6f5a1c04746feb04add15107c70332ac603e4561.camel@perches.com>
Subject: Re: [PATCH] net: ipv4: fix clang -Wformat warning
From: Joe Perches <joe@perches.com>
To: Justin Stitt <justinstitt@google.com>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 07 Jul 2022 10:40:29 -0700
In-Reply-To: <20220707173040.704116-1-justinstitt@google.com>
References: <20220707173040.704116-1-justinstitt@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: x68hfi6hchp93cc8y3oo9c1sywe99651
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 065072002C
X-Spam-Status: No, score=-0.55
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19a/HDLIuVNWG7/7X2HRQkb389SoTBTrZA=
X-HE-Tag: 1657215629-849573

On Thu, 2022-07-07 at 10:30 -0700, Justin Stitt wrote:
> When building with Clang we encounter this warning:
> > net/ipv4/ah4.c:513:4: error: format specifies type 'unsigned short' but
> > the argument has type 'int' [-Werror,-Wformat]
> > aalg_desc->uinfo.auth.icv_fullbits / 8);
>=20
> `aalg_desc->uinfo.auth.icv_fullbits` is a u16 but due to default
> argument promotion becomes an int.
>=20
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends using
> the promoted-to-type's format flag.
>=20
> As per C11 6.3.1.1:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
> can represent all values of the original type ..., the value is
> converted to an int; otherwise, it is converted to an unsigned int.
> These are called the integer promotions.` Thus it makes sense to change
> %hu to %d not only to follow this standard but to suppress the warning
> as well.

I think it also makes sense to use %u and not %d
as the original type is unsigned.

> diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
[]
> @@ -507,7 +507,7 @@ static int ah_init_state(struct xfrm_state *x)
> =20
>  	if (aalg_desc->uinfo.auth.icv_fullbits/8 !=3D
>  	    crypto_ahash_digestsize(ahash)) {
> -		pr_info("%s: %s digestsize %u !=3D %hu\n",
> +		pr_info("%s: %s digestsize %u !=3D %d\n",
>  			__func__, x->aalg->alg_name,
>  			crypto_ahash_digestsize(ahash),
>  			aalg_desc->uinfo.auth.icv_fullbits / 8);

