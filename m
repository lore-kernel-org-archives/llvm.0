Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F48604B7;
	Mon, 26 Feb 2024 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949813; cv=none; b=MUaltJ5BKbPpN+EcegDA4R3BCJ925bYTJfqKmrbf/btRgJwqrSrRrJdMhuAcFb+BF4QgtoAjO9BosGm5lmiQQCMHiYS5lS9BzV52K/mw4PryOoWtEjqiiJ4HO1nKrOnQzDrLXIkMyi1l7Q2DbC38mQGinvHAYYZzutPQryE7amk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949813; c=relaxed/simple;
	bh=1ekMycTtyRegpljwcVmhW8UjMqj/zF0d6fHe6uDawoE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=AYROYNdBIDSdZu0k1tqnVFUriIJF67RrNavKthuqfxeFdUo1djKCgzYErPrbITP1l53VZ+tVnYKl3S60skaPwlsQe1yNUyfCdGoetHgEbht/5vzSDKtRzcs78SKd3cttZG5e0s8qrQOK3LhqsFRJueez6MFZ23DhYJID+VwtZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Bp6X4CPS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bd0w9LMe; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Bp6X4CPS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bd0w9LMe"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id D2D3913800CD;
	Mon, 26 Feb 2024 07:16:50 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 26 Feb 2024 07:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708949810;
	 x=1709036210; bh=om9v02WUOxT/6wSOXj1wRFUKUxVw9Bxh5IjOiYeK8ag=; b=
	Bp6X4CPStEKXPAoT8r4odk5fLJ1ngm/v09FCV416B4MiM7+kn1ynb6MBYfhTblVp
	yQzmAsD5mxhbGbuSAvxs0dXvvAYAgWCbTkCosuco0wDqlZkMZ0GG2TDVcEgpZO2R
	DmaAtlt27wdwSVdLievkz+JyeSvVbZqn7uEnQp0cjD6ODUSsBUMnUxDexHpDoPd5
	Ih8FdumuNVrAu3Aj0o27qVu0WAenO/kmS2/4oXkOzbCOpkWqRmuFzpl88JxZO4AB
	v18ohEceIRB6KNsHZLZLd3c+71zzsO6SfjR/TwqMvRRewCI4wi+tX9DvFoMFk9NI
	rm5RWY6EB5kwAYbwrDV1zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708949810; x=
	1709036210; bh=om9v02WUOxT/6wSOXj1wRFUKUxVw9Bxh5IjOiYeK8ag=; b=b
	d0w9LMeTq/X61Vvn229Lievr0gP162Vowt4j6J214V6BTnbhEdAJO3E9chITwaVc
	1VEINXAsJpxa7v+Gcc2cR6kwHxM6TSNuR6Kf3o6+CzrmpEG6Bk1Wg+mvgsLxm+9m
	Q1m4gMvmKxdCQFJKK9X9cmPnh6xe+wIX3Ugk23lGczxSiOrNiqB08kMCME/bSles
	CulXAv7jkHo1feG94k7cZ1QxQB5RBq48YzyMHoKDAXyuyRRjF+bwfnCAGrdxtWbK
	mLXkzlQNw266sRUDme9vlmb03ifI2aPZjAb3snS6WTgJlinkyG0HwlljZEOL7HPy
	DTSp57IFs4i+q1xg6AFCw==
X-ME-Sender: <xms:MoHcZe-rf8kMlc5GvQdygs4BbjMJKM1_gXvnqgEPnwLwPc5pj4nGcQ>
    <xme:MoHcZesKH4rSDeYlLmod6_iNsAcGX45ryiuxZjXFWZfAp-9jHTBGNK9DMNmnhv7lm
    Ppx3HJy8U-8l4LUsME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgedvgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepueegteeggfdtueduteefjeeghfehfeeukeekgfdttddufeeuieejudeujeff
    iedtnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:MoHcZUAgC4W3gqsFcbUPCwutKR03h20xyeGOU7CeChR6Q28H9XT3PA>
    <xmx:MoHcZWenmSQhvvO5v5tQe99YjPyHPT4tbnVECmxmd0RQpmqH0AmuZA>
    <xmx:MoHcZTOVCoNMxLuDflLrZOhtTlW8fUxUAHl3YNfS6wtplqilOG7FJA>
    <xmx:MoHcZYqbV2f6fbzKi6yyuMUsoxm3EAApSPOj9l1saLAw2HPdYkIBtA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4777EB6008D; Mon, 26 Feb 2024 07:16:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <0fd0b1b6-f14c-4bc9-9d6d-0b6288e139b1@app.fastmail.com>
In-Reply-To: <4da3ece6-e2da-98cf-5d21-8e6bf296519f@huawei.com>
References: <202402261559.cYtMOkIn-lkp@intel.com>
 <4da3ece6-e2da-98cf-5d21-8e6bf296519f@huawei.com>
Date: Mon, 26 Feb 2024 13:16:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Richard Weinberger" <richard@nod.at>
Subject: Re: [rw-ubifs:next 19/33] fs/ubifs/find.c:86: warning: Function parameter or
 struct member 'arg' not described in 'scan_for_dirty_cb'
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024, at 09:19, Zhihao Cheng wrote:
> =E5=9C=A8 2024/2/26 15:16, kernel test robot =E5=86=99=E9=81=93:
> Looks like [1] imported a compiling warning, because the functions'=20
> comments(on parameters) are missed to update. Do you have time to send=
 a=20
> patch to fix it? Thanks.
>
> [1]=20
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20240213095412.45=
3787-2-arnd@kernel.org/
>>=20

Thanks for letting me know, sent a fix to go on top now.

     Arnd
