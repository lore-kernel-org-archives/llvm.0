Received: from relay3.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466E2563
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 18:01:33 +0000 (UTC)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 1B3526101C;
	Thu,  7 Jul 2022 18:01:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id E45E020037;
	Thu,  7 Jul 2022 18:01:27 +0000 (UTC)
Message-ID: <da17617717c5f6a79f58cdf4a56cd39e28c53377.camel@perches.com>
Subject: Re: [PATCH] net: ipv4: fix clang -Wformat warning
From: Joe Perches <joe@perches.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>,  Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
Date: Thu, 07 Jul 2022 11:01:26 -0700
In-Reply-To: <CAFhGd8oTybm0aQ_q60e+exf5eFO1kLiNKnmDZfVTyg=BbtgZsw@mail.gmail.com>
References: <20220707173040.704116-1-justinstitt@google.com>
	 <6f5a1c04746feb04add15107c70332ac603e4561.camel@perches.com>
	 <CAFhGd8oTybm0aQ_q60e+exf5eFO1kLiNKnmDZfVTyg=BbtgZsw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.61
X-Stat-Signature: 9hji8x14hjnfib6t8mqzghy4hgmidssk
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E45E020037
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+YCj/8yCY3yEUbxnuMVC5Ve/GvPfwKDhc=
X-HE-Tag: 1657216887-660842

On Thu, 2022-07-07 at 10:47 -0700, Justin Stitt wrote:
> On Thu, Jul 7, 2022 at 10:40 AM Joe Perches <joe@perches.com> wrote:
> >=20
> > On Thu, 2022-07-07 at 10:30 -0700, Justin Stitt wrote:
> > > When building with Clang we encounter this warning:
> > > > net/ipv4/ah4.c:513:4: error: format specifies type 'unsigned short'=
 but
> > > > the argument has type 'int' [-Werror,-Wformat]
> > > > aalg_desc->uinfo.auth.icv_fullbits / 8);
> > >=20
> > > `aalg_desc->uinfo.auth.icv_fullbits` is a u16 but due to default
> > > argument promotion becomes an int.
> > >=20
> > > Variadic functions (printf-like) undergo default argument promotion.
> > > Documentation/core-api/printk-formats.rst specifically recommends usi=
ng
> > > the promoted-to-type's format flag.
> > >=20
> > > As per C11 6.3.1.1:
> > > (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an i=
nt
> > > can represent all values of the original type ..., the value is
> > > converted to an int; otherwise, it is converted to an unsigned int.
> > > These are called the integer promotions.` Thus it makes sense to chan=
ge
> > > %hu to %d not only to follow this standard but to suppress the warnin=
g
> > > as well.
> >=20
> > I think it also makes sense to use %u and not %d
> > as the original type is unsigned.
> Yeah, that would also work. An integer (even a signed one) fully
> encompasses a u16 so it's really a choice of style. Do you think the
> change to %u warrants a v2 of this patch?

As it's rather odd output to use '%u !=3D %d', probably.

Your patch, up to you.

> >=20
> > > diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
> > []
> > > @@ -507,7 +507,7 @@ static int ah_init_state(struct xfrm_state *x)
> > >=20
> > >       if (aalg_desc->uinfo.auth.icv_fullbits/8 !=3D
> > >           crypto_ahash_digestsize(ahash)) {
> > > -             pr_info("%s: %s digestsize %u !=3D %hu\n",
> > > +             pr_info("%s: %s digestsize %u !=3D %d\n",
> > >                       __func__, x->aalg->alg_name,
> > >                       crypto_ahash_digestsize(ahash),
> > >                       aalg_desc->uinfo.auth.icv_fullbits / 8);
> >=20

