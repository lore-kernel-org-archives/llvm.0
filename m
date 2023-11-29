Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037B1FA1
	for <llvm@lists.linux.dev>; Wed, 29 Nov 2023 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="Dv5E5WJe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=o+ruwW4g+vXqotGBgvYVAqikIMr9ZibjwJBBiNvt/1o=;
	t=1701241032; x=1702450632; b=Dv5E5WJeffj6YFoZqiMwFH6UOk5H4jD7V3NSaK1eqHRBQGb
	C+5Ico+U4Ut03qzTZ4GGkmLM4VjzmE4/o/yXGW1bjuLwIwqE5UHrj0wgNs/v/ULukn3efzT9Jal+7
	awTi7NAnHo6j+VoxPncvLyj7B4SL4s/Bx5k3Gq2EZC68xIylcaMi5LdCaynnBdN8S8cPAaC6KO8zI
	rcwFPKC20snDkzPPJ6VhtyrSp3/YqQ/FnNRheNGZRkXdyy6BPuAqaYz6JXElmnaCkZ643nA/85r2L
	Osq3e7m5mHkE4l7GWP/gziDXPGLkZuA2fg4vTY5xThm0q1/G4axtoQQLwnQXVdCQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r8EVQ-00000008Y6r-2148;
	Wed, 29 Nov 2023 07:57:08 +0100
Message-ID: <6c7765f13b715e67637438c6dffaa5a369758519.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: sband's null check should precede params
From: Johannes Berg <johannes@sipsolutions.net>
To: Edward Adam Davis <eadavis@qq.com>, 
	syzbot+62d7eef57b09bfebcd84@syzkaller.appspotmail.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
 netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com,
  trix@redhat.com
Date: Wed, 29 Nov 2023 07:57:07 +0100
In-Reply-To: <tencent_0CCA1979CFA30DC8A5CF8DDC92365DCE5D07@qq.com>
References: <000000000000efc64705ff8286a1@google.com>
	 <tencent_0CCA1979CFA30DC8A5CF8DDC92365DCE5D07@qq.com>
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

On Wed, 2023-11-29 at 13:48 +0800, Edward Adam Davis wrote:
>=20
> [Analysis]
> When ieee80211_get_link_sband() fails to find a valid sband and first che=
cks=20
> for params in sta_link_apply_parameters(), it will return 0 due to new_li=
nk=20
> being 0, which will lead to an incorrect process after sta_apply_paramete=
rs().
>=20
> [Fix]
> First obtain sband and perform a non null check before checking the param=
s.

Not sure I can even disagree with that analysis, it seems right, but ...

> +	if (!link || !link_sta)
> +		return -EINVAL;
> +
> +	sband =3D ieee80211_get_link_sband(link);
> +	if (!sband)
> +		return -EINVAL;
> +
>  	/*
>  	 * If there are no changes, then accept a link that doesn't exist,
>  	 * unless it's a new link.

There's a comment here which is clearly not true after this change,
since you've already returned for !link_sta?

johannes
