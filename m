Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757569;
	b=Xzv2varmFr6AJnczm4AuPImVRVt1+AiXYqjXMxWpyAmnxUaMRzX+wgR/1HmH+gkd5rs1
	 Hu3dsTmzoicAdazaSjWQQbCuRlP6Ztdm16UvBrIHIl/FvOiN7T10blyL3cIgKJLfklP1Y
	 Yf8v3bgbRjDBwGHGUtvBGCQ8ZBHUychKvSadm/TSC8bH6ZJOlddxa5/7GUflmX6iZ174M
	 IX8uzvN8XEv29Agc6/PoGu0ajRR8H41dRzVuZ75JXRM+Yb826ka9PFl1M44oMDQRn/B5z
	 lRPJnUlIAeRtkBIp8GOkBfhP8f0cSzzepuOwjmyNN4mmJhEVJodaKP6PtRhlbBTEYcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=5Tb+/CVAcY5SOeTTU6JB0JtDtCzoK11pcXkmRemeQxQ=;
	b=lHbdYOqEYzRHY29tFO6M11AKMJzulj4t4e9JkaY2frsIxj9+xCdcbVjqrlhUwslDnF43
	 HIyGvvLs2xZIQVa1T2vVnyR+ssXHNm6ZxjmuxEVvobe94jp6UXLOaRxLrpYU4jDFVUp0q
	 wp9jdcIBFtxH55Zh9mq0Ij6wPKMESZbFmT8Qu95a6AgPf5HFxGwl/0ppmGWJ+I5pIg7Ma
	 dXff5t7Zjp6UKRJcl4IlHX046k9cjQOUncrwxS/qhSji8YzIiAJ+ETWxcKfnviTI1IFAk
	 ImwR++INbkMn6CVZpPhyjy6C6H04tLJjirJqdD8TSTWONA9RqgOpMgUpF9lm9+Foapg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=uh5f1b+Z;
	arc=none smtp.remote-ip=185.125.25.10
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6BD606A31B
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 12:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E6BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=uh5f1b+Z
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jB22t2K5bzJVD;
	Fri, 23 Oct 2026 14:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792757557;
	bh=5Tb+/CVAcY5SOeTTU6JB0JtDtCzoK11pcXkmRemeQxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh5f1b+ZbD5b6QU7YiELqZMVlC8XKhjucGaizjaffPKtmGAD9fxrhC8Ya1/UAfycG
	 dO+hZi83WI3mju3r+VPSYWqVI4m06cyXiKQD4KMYkGLccQsk5X5ZEET76oOcWN+lId
	 X2Fc2/o78BSY9T6pcsT/NGwPS0MmUPOm+FAlg1V4=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jB22r3TQnzKqR;
	Fri, 23 Oct 2026 14:12:36 +0200 (CEST)
Date: Fri, 23 Oct 2026 14:12:27 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jann Horn <jannh@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Christian Brauner <brauner@kernel.org>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Haofeng Li <lihaofeng@kylinos.cn>, Paul Moore <paul@paul-moore.com>, Tingmao Wang <m@maowtm.org>, 
	Wang Yan <wangyan01@kylinos.cn>, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [GIT PULL] Landlock update for v7.4-rc1
Message-ID: <20261023.oHeec1uh0ael@digikod.net>
References: <20261021162538.1852602-1-mic@digikod.net>
 <CAG48ez3Rptvjvt=t_YEcBHHwYGD4zmPtc6tk+gPLtorZY7WEFg@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3Rptvjvt=t_YEcBHHwYGD4zmPtc6tk+gPLtorZY7WEFg@mail.gmail.com>
X-Infomaniak-Routing: alpha

On Thu, Oct 22, 2026 at 06:45:59PM +0200, Jann Horn wrote:
> On Wed, Oct 21, 2026 at 6:28 PM Mickaël Salaün <mic@digikod.net> wrote:
> > Jann Horn (1):
> >       cred: clarify that task_struct::cred is only for the current task
> 
> FYI, that already is in mainline as
> https://git.kernel.org/linus/b030ffaedc1d638f232f6992406cdcdcc82d5602,
> it went through the LSM tree.

Yes, that's the same commit, but I needed to include it with a merge
commit to get a consistent PR.
