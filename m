Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.75.19.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810630;
	b=iAZMrFUqBa9zyBKpT+UT9eu+7bt5S5qjwzEUTPQ6MA85GzI4hKlPBV4+6Y603mdWDqsY
	 PfkG/4k7MPF9656v2fswM9uyAExn+HBAA16Z3ccM709TTnBABdplLVfNTqJDzJYNONGUD
	 rR/zHIoL5qVuwlZMUzjhEZH5l5fmrQPlbUdLYrqEam+OcTfuIU+JBm9xY8S/TFB22jYEQ
	 WwTPnZlfGDTbFcCp7OwC+rRY1qjditwhhrhX4iOrHlGMSE0Gfkp3xk6zGrUkIrdKo39Ws
	 CT07yb5BLZM95qgP0tMErHUUtCrGCSa1HVMWznYlYLChHJeIIMI3LjomFEa0HiUFuzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810630;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=d2rlFPMn4FSWmLQ5qbUFGzJZoe7UzLFThA0r34II3cw=;
	b=yG7qJTEnzsqwrKLb0FVq1vmaeEBbIKBAoSdNAU8zmQZOszCPHfXNiQbVIwi0jyQcX1jo
	 lbmL/AHlgHsrnGQfHKeBElk6h1Eawhnlx0tkg8cRWSqDGer3C+5ZBygi9sx9cLfnKflbB
	 0ORpAg7twMzpL24zqPzcloc4JAd5726Xb96hBI8dq4ta1VJX7EVMDCK7jykWafHf5KRnx
	 6moxwD8fkwiREq2+4qhaRTxVbMKmSSagtS1kZWJRXjqvqeUmn4kln5YJM6lbrJeuL7fml
	 9csbTsavVmfQ6nplQb2UVyYAKfqgPy0MZTzKyVBclB0LB3aDPjZ8QGy1UwQHG7rM35w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=remlab.net;
	spf=pass smtp.mailfrom=remlab.net;
	arc=none smtp.remote-ip=51.75.19.47
Received: from ursule.remlab.net (ursule.remlab.net [51.75.19.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08129606A31F
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 20:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08129606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remlab.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remlab.net
Received: from ursule.remlab.net (localhost [IPv6:::1])
	by ursule.remlab.net (Postfix) with ESMTP id 3F47DC006B;
	Fri, 27 Nov 2026 22:17:01 +0200 (EET)
Received: from basile.remlab.net ([2001:14ba:a082:6301:c5d2:3c3d:3f09:1404])
	by ursule.remlab.net with ESMTPSA
	id 8ryDCD3lCWuxfAkAwZXkwQ
	(envelope-from <remi@remlab.net>); Fri, 27 Nov 2026 22:17:01 +0200
From: =?UTF-8?B?UsOpbWk=?= Denis-Courmont <remi@remlab.net>
To: Remi Denis-Courmont <courmisch@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Elkin Cruz <elkin@google.com>
Cc: Simon Horman <horms@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, irogers@google.com,
 Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH net] phonet: fix use-after-free in can_respond()
Date: Fri, 27 Nov 2026 22:17:00 +0200
Message-ID: <IJCtsfWGQROQ4yf6qjbzpw@remlab.net>
Organization: Remlab
In-Reply-To: <20261125221627.1419412-1-elkin@google.com>
References: <20261125221627.1419412-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Le torstaina 26. marraskuuta 2026, 0.16.27 It=C3=A4-Euroopan normaaliaika E=
lkin=20
Cruz a =C3=A9crit :
> In can_respond(), ph is cached before pskb_may_pull(skb, 5). When
> ph->pn_res =3D=3D PN_PREFIX and pskb_may_pull() reallocates skb->head,
> the check `if (ph->pn_res =3D=3D PN_COMMGR)` dereferences the dangling ph
> pointer before the code re-acquires ph =3D pn_hdr(skb).
>=20
> Check for PN_COMMGR before calling pskb_may_pull() to avoid accessing
> the potentially invalidated header pointer.
>=20
> This issue was found while trying out new Clang static analysis checks for
> kernel bug classes. The finding was triaged and fixed, and this commit
> description was drafted with the help of AI, then verified by code
> inspection and compile-tested against linux-next (not reproduced and not
> runtime-tested on hardware).
>=20
> Fixes: c3a90c788b74 ("Phonet: do not reply to indication reset packets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Elkin Cruz <elkin@google.com>

Acked-by: R=C3=A9mi Denis-Courmont <courmisch@gmail.com>

=2D-=20
=E3=83=85=E3=83=8B-=E3=82=AF=E3=83=BC=E3=83=A2=E3=83=B3=E3=83=BB=E3=83=AC=
=E3=83=9F
https://www.remlab.net/



