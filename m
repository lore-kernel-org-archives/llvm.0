Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455C14F67
	for <llvm@lists.linux.dev>; Wed, 29 Nov 2023 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="FdWAsARF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=eQwJTZYRx3LOEKLgH4dhH9QWBCcY6L5CkgMzMJz45eY=;
	t=1701249308; x=1702458908; b=FdWAsARFT9yxhCYICfY3rBwi0zfIQ4/UXetVXp/iSh2Nq1D
	tGbZlA7fUXEu31cCuiQLPcqdY9cUuIYMAd3W3GN8wX5OK8dS5yv7hJ78sKDWDnhHwXXt3Sd7eNT8I
	82YUaQnd0PYe343bsoY0Ob47K6bBbrXISQ8fAkx6Nr9M4RpusLsdTahLBxGJSA0K2BN156Ga6dP+u
	OLfyXH2SFeiMg0R5l1dxV/CuV1aeUMPd4C/qkKoxu5zeCxulh6sjXWmSw0wzBLW7sa/VOepujjIoV
	adXcyd6mPXeHNWzVrvLLFoCa5pN1LqTbycIMXwxFkg+82KFEE5YhJxQqo1RcMutw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r8Gev-00000008bo2-0c7n;
	Wed, 29 Nov 2023 10:15:05 +0100
Message-ID: <52e6ba0affb1648edd3ffd25fb6d8199a39a2f51.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: sband's null check should precede params
From: Johannes Berg <johannes@sipsolutions.net>
To: Edward Adam Davis <eadavis@qq.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, 
	syzbot+62d7eef57b09bfebcd84@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Date: Wed, 29 Nov 2023 10:15:03 +0100
In-Reply-To: <tencent_6E9CA7EF46E452C90650899D2ECFEEFE4C06@qq.com>
References: 
	<56d8b3b9099d3935a7b53e976fa998f06fbfd9a5.camel@sipsolutions.net>
	 <tencent_6E9CA7EF46E452C90650899D2ECFEEFE4C06@qq.com>
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

On Wed, 2023-11-29 at 16:48 +0800, Edward Adam Davis wrote:
> On Wed, 29 Nov 2023 09:33:23 +0100, Johannes Berg wrote:
> > > > > [Analysis]
> > > > > When ieee80211_get_link_sband() fails to find a valid sband and f=
irst checks
> > > > > for params in sta_link_apply_parameters(), it will return 0 due t=
o new_link
> > > > > being 0, which will lead to an incorrect process after sta_apply_=
parameters().
> > > > >=20
> > > > > [Fix]
> > > > > First obtain sband and perform a non null check before checking t=
he params.
> > > >=20
> > > > Not sure I can even disagree with that analysis, it seems right, bu=
t ...
> > > >=20
> > > > > +	if (!link || !link_sta)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	sband =3D ieee80211_get_link_sband(link);
> > > > > +	if (!sband)
> > > > > +		return -EINVAL;
> > > > > +
> > > > >  	/*
> > > > >  	 * If there are no changes, then accept a link that doesn't exi=
st,
> > > > >  	 * unless it's a new link.
> > > >=20
> > > > There's a comment here which is clearly not true after this change,
> > > > since you've already returned for !link_sta?
> > > No, after applying my patch, it will return due to !sband.
> > >=20
> >=20
> > Right, OK, but the way I read the comment (now) is that it wanted to
> > accept it in that case?
> >=20
> > That said, I just threw the patch into our internal testing machinery
> > quickly (probably has more MLO tests than upstream hostap for now), and
> > it worked just fine ...
> >=20
> > Maybe we should just remove the comment?
> Do you mean to delete the comments below?
>    3         /*
>    2          * If there are no changes, then accept a link that doesn't =
exist,
>    1          * unless it's a new link.
> 1800          */
>=20

Right, it doesn't seem correct any more?

johannes
