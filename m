Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAF3C9447
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 20:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774299425; cv=none; b=PV7pvU9K4ERexnlfU9Y4dwDmDwY1lqZyKlMahxNJXZ4SJbf/cOGjcWJE2fO0FKOfKoMkGW9Gju/B69qc2Kx/4X1MrBv5gix6dv3UUCWO9dbZYgdQVmriCat1xgx/KMMosqZQt4FuBt+j0ydcjwjqEHALa4c9rjLcXJlYFfoWVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774299425; c=relaxed/simple;
	bh=k82pXJV/uzk96wJ1JJTyg+KqVmS0eDwcq6CaW/9nFpk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=o/apCQd0i41aJY0gEs/3udgnTglRqTa2SEeOfc07cDpLDbCJp61WPLVXqJBadYhOWutPaGLi4MHfeDE7CCfeAR0bZyjjUJEztI6jPQRkKdIbV85mLA/gnuFv7+FMgQbpeMSx9e+qA7Iuqj5gFtraUlLdmD5PVTivcgmzcnUThok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fAWmhyPP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RJ8LeThG; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fAWmhyPP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RJ8LeThG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 86C0B1D00232;
	Mon, 23 Mar 2026 16:57:02 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 23 Mar 2026 16:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774299422;
	 x=1774385822; bh=TRWIBf5HsVBc2olfebxe3KUbaRju4KcZcgxVm0YE1QI=; b=
	fAWmhyPPDcN60rFVP+ZIn+mu6n06vPP43Oe+tl38MCf+RhIiwcicqR8sAXP2R4D6
	AsEFZ8SP7s2jSeUBS3e4tnSxYIBfdC5Q/iZ3A9YKGezYZ9g7CbteXBxr5SSUAmV8
	0cPoyUjd5AS5AXrxbj/t353y5DmuMvHN6XcrNSPmAcJkkgWXa92AlJ7cZq2UvxJr
	Cz7pKFSub1LXAlyZ5ra++5XzAPpyJLtDAOqMn1+f7LmBiJOvIxYm1dNTG3zxtxIq
	i1xyu/7/pVtPFe+jARJA8k13RRo9nR0Gnw/3rqiexva7kEppoaYsS8akOHbdQs+n
	lzHFEavV3vneF8lYdPgrcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774299422; x=
	1774385822; bh=TRWIBf5HsVBc2olfebxe3KUbaRju4KcZcgxVm0YE1QI=; b=R
	J8LeThGtP2wsVeg1lz7igchWsZSjyYPhk0cCK8V9U/y+nvDfWqV0x6RRalhDsVPI
	AlKomSfjGeRkD31ueBcg6VkNhobf9GVkhnm2b9hCcTpR4+1oopmC6DnlGSq9JqYy
	9XBXLYI9q89wcWjR6oV6y5Cw+NTFW7XsU6pdXuinEJM/QY/gr7rnnrIyt6LrRvDC
	2pIJFnJicb7qDEyugh1uHYSJW1wM2mdGfeVv54T61aTKf2qhCkbKT7xUiXLFMenw
	mzpoDz11SVrhpz9gYmn7fbT/li63vgdkm15WrhT+3Yns83B2KqyosBVoeu4kQFlc
	SMMPa8/ze8rqkNPNkIwFg==
X-ME-Sender: <xms:HanBaXK2lc_Z2W9cb-JYdDm70UIOM9uSWK7Sq37SWA3gN6fJ0Dn8zw>
    <xme:HanBaV_uT8132lXZWdmfEx4P-moqW7StIL5R2l55dwXNC8Gt5RoHhyMyFLIuOo-_a
    -J_RKQPiWATbHASwflE1z9zwyPPs97hlBNBrIIM02b_xY74q9T2l9GY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudeljeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitghkrdguvg
    hsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjrggt
    khhmrghnsgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtth
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhm
    pdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:HanBaTFqtRYEc-uRmwngmSLrn2Lul4WSlUieWGDXwdDsnYs7o5L73Q>
    <xmx:HanBaWu7PF4w2ynHsQf9t-8ZJNeHgMtUlGBPd9_F0KjWNEh0m9hVbQ>
    <xmx:HanBaRYQ0r3YgSKEBAl4TGt3-_8KeX8ptHrg-WX88PswWNt1xi8ZWw>
    <xmx:HanBae48mtpd_04q1B2tvjyN9jW1JJEjcqrdm__vsZWHwQ1HE9OA1w>
    <xmx:HqnBaRySk-OsNKgED5eBhkklU6zhF1-4Bu4PxcGsiLUr5CGB119_YlUk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8DBB3700065; Mon, 23 Mar 2026 16:57:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AuIeNFRcSw9w
Date: Mon, 23 Mar 2026 21:56:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Brendan Jackman" <jackmanb@google.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Message-Id: <ca8b75f5-c342-469e-b596-510177863272@app.fastmail.com>
In-Reply-To: <20260323134540.5de3cf098cc9858486462f08@linux-foundation.org>
References: <20260320211528.2474389-1-arnd@kernel.org>
 <DHA3U3U4ZZXQ.2RPHOFNQJ70JQ@google.com>
 <cf40b3d8-9a69-40b7-b885-aff87e85de68@app.fastmail.com>
 <20260323134540.5de3cf098cc9858486462f08@linux-foundation.org>
Subject: Re: [PATCH] bug: shut up format attribute warning for clang as well
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 23, 2026, at 21:45, Andrew Morton wrote:
> On Mon, 23 Mar 2026 16:38:14 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:
>
>> On Mon, Mar 23, 2026, at 11:54, Brendan Jackman wrote:
>> > On Fri Mar 20, 2026 at 9:14 PM UTC, Arnd Bergmann wrote:
>> >
>> > There is actually a superior fix for this warning that Andy Schevchenko
>> > posted here (mine just happened to get merged first):
>> >
>> > https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u
>> >
>> > Should we just switch over to that? Looks like it should work for both
>> > compilers.
>> 
>> Right, I tried that again and it works. I had confused it with the
>> similar logic to disable the warning on va_format(), which is
>> not that easy to avoid.
>> 
>
> What I think I'm hearing is that we should revert Brendan's
> d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
> then apply Andy's
> https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u,
> yes?
>
> Could someone please prepare a suitably changelogged and tested patch
> for that?

I now sent the version that I had in my tree already as a v2
of my patch. I tested this with gcc-16 and clang-22 in random
configurations.

     Arnd
