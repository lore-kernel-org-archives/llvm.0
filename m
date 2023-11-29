Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4669125A6
	for <llvm@lists.linux.dev>; Wed, 29 Nov 2023 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="HolRzC/x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=iL44Hr2Utbt8Rb40hYFfR3Yl3GOU2Y+nYu/SSloZ/X0=;
	t=1701246809; x=1702456409; b=HolRzC/xyyhPD6IocMaYZpNFfmF+155NP0EfjwPXIeFoI1u
	MovAwRJfSoCgCv6SJ4gygc9EBivdAYrNfjfDRbk3Nc851qx7D7lTDECXF8KNk7tICJHckbLHkzwsY
	cCYDOi0d8w8EjdXWjgPYxK4Z5Jn5TZoQp2/TC5O43g8I+72f42h2/qjdNyCXbB41U2a2wwplPx2It
	vaxD0j+6UF7pLeVdD7dlR3dRinwK3VehD6maTjgX5RUIxOalSuVCxbA4CTomh4q+TSNGaL8ealNUo
	8GoBhccmy+Pt0gMAF1hisZ9idBcV5l8QNcBb+fAebJqwupibJnhQoHX3x84u0KGQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r8G0b-00000008abj-0RXH;
	Wed, 29 Nov 2023 09:33:25 +0100
Message-ID: <56d8b3b9099d3935a7b53e976fa998f06fbfd9a5.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: sband's null check should precede params
From: Johannes Berg <johannes@sipsolutions.net>
To: Edward Adam Davis <eadavis@qq.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, 
	syzbot+62d7eef57b09bfebcd84@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Date: Wed, 29 Nov 2023 09:33:23 +0100
In-Reply-To: <tencent_DE78F66DB82F496F9894B8E826EC8ACE0C0A@qq.com>
References: 
	<6c7765f13b715e67637438c6dffaa5a369758519.camel@sipsolutions.net>
	 <tencent_DE78F66DB82F496F9894B8E826EC8ACE0C0A@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2023-11-29 at 16:18 +0800, Edward Adam Davis wrote:
> On Wed, 29 Nov 2023 07:57:07 +0100, Johannes Berg wrote:
> > > [Analysis]
> > > When ieee80211_get_link_sband() fails to find a valid sband and first=
 checks
> > > for params in sta_link_apply_parameters(), it will return 0 due to ne=
w_link
> > > being 0, which will lead to an incorrect process after sta_apply_para=
meters().
> > >=20
> > > [Fix]
> > > First obtain sband and perform a non null check before checking the p=
arams.
> >=20
> > Not sure I can even disagree with that analysis, it seems right, but ..=
.
> >=20
> > > +	if (!link || !link_sta)
> > > +		return -EINVAL;
> > > +
> > > +	sband =3D ieee80211_get_link_sband(link);
> > > +	if (!sband)
> > > +		return -EINVAL;
> > > +
> > >  	/*
> > >  	 * If there are no changes, then accept a link that doesn't exist,
> > >  	 * unless it's a new link.
> >=20
> > There's a comment here which is clearly not true after this change,
> > since you've already returned for !link_sta?
> No, after applying my patch, it will return due to !sband.
>=20

Right, OK, but the way I read the comment (now) is that it wanted to
accept it in that case?

That said, I just threw the patch into our internal testing machinery
quickly (probably has more MLO tests than upstream hostap for now), and
it worked just fine ...

Maybe we should just remove the comment?

johannes
