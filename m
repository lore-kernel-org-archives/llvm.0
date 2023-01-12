Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DAA2105
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 20:35:30 +0000 (UTC)
Received: from leknes.fjasle.eu ([46.142.98.230]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MBll6-1pS7TU0SeC-00C7tX; Thu, 12 Jan 2023 21:32:28 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id D255B3C1B9; Thu, 12 Jan 2023 21:25:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1673555117; bh=YmIZVCrUzmJ3voRqFlLqoXaouv4xbA9tW2X5/h1G53Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPUd0RV5hVLE1NxB8lv5M5aDvoMp4WTEPJWtcXRXTbYqz2MWQ/x1/QibJhljE9e6k
	 V7u5TNR6o8m1TcRcb6ds9fwBtXY3tax4sMd6/PNnhTIe/TLSNe8IBGS8IqSUTz90lu
	 KRjQuhmDx9M77b08F7RcIZV06fFFc3sSXIxRkrGM=
Date: Thu, 12 Jan 2023 21:25:12 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Ian Rogers <irogers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Stephane Eranian <eranian@google.com>,
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v3 1/3] objtool: Install libsubcmd in build
Message-ID: <Y8BsqN/HfOf+vKZP@fjasle.eu>
References: <20230105090155.357604-1-irogers@google.com>
 <20230105090155.357604-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8looZPJ63KG3fDin"
Content-Disposition: inline
In-Reply-To: <20230105090155.357604-2-irogers@google.com>
X-Provags-ID: V03:K1:o+I3bQzy9JooLqMSzdIi0Ns+aMeXJU2ZXJFUD3V3ByY6t5ShNNr
 Rj4hGij4tdf8GeV20vQPHqIkMo9WWcqm9REd5+8ru7Y6bLgO1gEw2druRCZFswpCVFRPasU
 /hoO7PnjXHBivmR5i141DawV5vG9ZVyObHfka+i6U87ZJNJBt8ke6mk60JLZmYV3hC/EXaS
 7BkxqyNlbbKqqBc8LiY3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fl8kltTiBww=;fAuHNYKuZi+WG9hYMQY3XJkXO/v
 PxgPHE9BvGYZxdfwlnbeaNI2P5fk9meCoScO+B+DtEvwYyVV16XMf0EPidRqDgox0r6UKNBBB
 8YyiV2ykhYq4rYPQWM1f5JT9+mAM25mewMg0rouWhVkxJLgT+pSXKzIMlFVDD7AZ6hZkIWQD3
 GNJvXiUyRP1OWW7yJnJZosu1AdUb8aeMphls+eUOMJSTmwHwiW8WvPYIymOVBVMi0FYyMyIgH
 dpifpm1eScEIbQhCD5/Ade/qX2vaN2dO6QO9Q6sW0PhuIjil6CMY2RvTNlenyK5p38dWfnO1S
 qwF4vfap9Y1KadMfpPfcWq+UwFKe3lR9pmqrhzQAKFBSECag7az9kpCMTEyRwXa5/YlPCZoRk
 G6cf5FRi8kKJW5YXjHZHbdNpIxWXl+RmWeQF+I4SNtvpd71naaOBKPxHyFGeqsnor1vTt15/T
 CtJp4KXMzgm5VKKmO/WfVNwtK1rd5RHM0Vf2+t5LrRISrh5jy3MSmcpSYXbgZVqAby96loWQf
 82g+TzsjgSSaCCToBRvssB8lvhPcBuF32AwGwIR0bxpm9srnUZ+XhTnIcFEvkfyMcg2QkyM/1
 P6C0p0tsE2YDgrjVSu/1sCRUBe18dzbxV4UXjI4rWqMZlWI1DMnOwKOkyRLq9rupkIFvGRT3u
 ujHG9tWmVM+IiPfuKNQqOEfvglqf53dr/8CHPRxeWw==


--8looZPJ63KG3fDin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 05, 2023 at 01:01:53AM -0800 Ian Rogers wrote:
> Including from tools/lib can create inadvertent dependencies. Install
> libsubcmd in the objtool build and then include the headers from
> there.
>=20
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  tools/objtool/Build    |  2 --
>  tools/objtool/Makefile | 33 +++++++++++++++++++++++++--------
>  2 files changed, 25 insertions(+), 10 deletions(-)
>=20
[...]
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index a3a9cc24e0e3..fd9b3e3113c6 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -12,9 +12,15 @@ srctree :=3D $(patsubst %/,%,$(dir $(CURDIR)))
>  srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  endif
> =20
> -SUBCMD_SRCDIR		=3D $(srctree)/tools/lib/subcmd/
> -LIBSUBCMD_OUTPUT	=3D $(or $(OUTPUT),$(CURDIR)/)
> -LIBSUBCMD		=3D $(LIBSUBCMD_OUTPUT)libsubcmd.a
> +LIBSUBCMD_DIR =3D $(srctree)/tools/lib/subcmd/
> +ifneq ($(OUTPUT),)
> +  LIBSUBCMD_OUTPUT =3D $(abspath $(OUTPUT))/libsubcmd
> +else
> +  LIBSUBCMD_OUTPUT =3D $(CURDIR)/libsubcmd
> +endif
> +LIBSUBCMD_DESTDIR =3D $(LIBSUBCMD_OUTPUT)

Hi Ian,

Is there a reason for distinguishing between $(LIBSUBCMD_DESTDIR) and
$(LIBSUBCMD_OUTPUT)?

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

--8looZPJ63KG3fDin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmPAbKcACgkQB1IKcBYm
Emlg6RAArhy5v5jFKm2z0C+qMHu3Ye8QswcakcArwsZxIfFdqQuvidU2XncQvrLc
gCjLGABUjRCOedbYJKhA11zwG32QmC/GMaembjV3X1M3qwDKDl8K+LTZBBK1smfa
q95ZDMb6Mr59Cuart0quno5RCSEuQ5NXnS4MU41g9FqT7+YUkT8x0GF96MeydVq5
avexNnfU4AWQXBPBVKdGODg0ez6WFtNc6uqc4yjo6qcrR8dfQl5lHVqJZAPL7Ml5
ts9ppjcyx9Vfjj1RVcKc4UiQQGGf75Enx3CDEKblEVLdaHrRvwLtRFjf4G1HR18q
bVZGX/QOIo1XEZf7aBotsxVBmla6wIySarskK+5FlIwOw29Ts1X1UiwWF5DsQO66
j1idqxyrcejJ8+JWioPxVNOL/oy4Qv0BLVbCJFrgJ/suufACaQo6cQdkvFf4VlKV
uwjd8C1qrm0TnjZznAXP+jwKgJckJfE+BxfT3rbqwrhekZwefxQJtY+a+/8ySryr
s81sL1Zo5lQdZpBxvu+Vt2y3EFSvnOeQ9VGanH/7MqflkmkjphbogHOHVgUlGBxs
LhrPPz7XFaQQq1IS30UAHh+AH9yBLDBvT/SQ04IgI3mE+Q+MiRq++Pnpx9f3cXPn
WYyQBm9rI4i7C5PShPdaHLLCP/z3irkFKaZv2sKNwY7n+j5K3pY=
=aHjG
-----END PGP SIGNATURE-----

--8looZPJ63KG3fDin--
