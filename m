Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC53BE654
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280346; cv=none; b=bo2liqpeeHwcCAhtFv1hnmqaZ7M+kFw93Cy/nHYj20dJG5a7Yvf1cjj9Xqlp2bVVTZIWNVc7wtzPDC+KEjiMcVAgDSxHKf2/RiDCs8f/aHZjWzTpPxRWCc4F2wZ2Yp1Xz1pxoWc3hsUO0NgoIZVqobJRQMraD9O22Xy7izbLKAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280346; c=relaxed/simple;
	bh=b4v8HDtN+Yy8TiJM9E0QDOhCsM+VBy8jx0P7y+tR2t4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TCZqaTekTxiJKdBfILwIMRydBTDFM9cDvLEbezpWUy+KaMvG3wA+e5+hl1ix+yNF5EJX9q2Sntl3iaQl49826fK08RyfVkNL4JTD91wcAs7on2qTuLDhPWoosobLbMmmEwN2+ZlL040X2nf3iIZKHKnPxM+cX2OQ+xcXz2AncGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Lc+ro7TK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qatokyL4; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Lc+ro7TK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qatokyL4"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 271A6EC01F6;
	Mon, 23 Mar 2026 11:39:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 23 Mar 2026 11:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774280345;
	 x=1774366745; bh=WmO42/HL8Y/ekMAK9BOwO6mohdqq0YHPPrKCz6wjCAw=; b=
	Lc+ro7TKbZwSNYAAZ6ZHiqN+ORU3vwfNJFbQzPPGTjBd51rkO364JrjUVHRA0FyE
	HLuCNqTueWyU2HYHxY2hgl8E7p62B+TiDvor6M5dL7gac4FPLpQT7kX4Bx0SQeXW
	TemZRUJdFk7ovCT+2hTHuUL4wHeWjmBhgBzxPqV+TytfRkg1MIQCdukNB2dJp8XN
	CECsgX/CDAV+evl0rJd+lvz8gka5O54pRqJRkPH2udml6YLORp06KvA4Qz3gt7HV
	f+tZWTio7cRkdLqQfXltf2KnRmNdxJ2O+sc4chT69Lb2Z+8QTVG2j/tr0Ti+nDLH
	nNPYII8PWuzbRK02JfWhZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774280345; x=
	1774366745; bh=WmO42/HL8Y/ekMAK9BOwO6mohdqq0YHPPrKCz6wjCAw=; b=q
	atokyL477pvcYfSk8Xjy2KvpHQo0/gMWD4ra/BLN1TVjdTVNR2PFy/e2FefwYsKC
	grufotNB4HOVNEenQSrdgaKxYf6TYC/TWgH2gFG+Z73bnMRtTfRuwpsWirmH8Q0P
	9tt2CO1wwWnJ+LlO8uk9kzEfCQoYbW7rkQJmbj4ioit5tfKZVYO6Fr2IXRks9Ki7
	GC6tdleylCoMfbjZbZHTKVOUPN5PNJUudXIuiUkq9I5GuvZyGg08myl7efF5lhTk
	p9Ga9FZm+JwhpsjUKmZlxQFFyvMUiSbAq1M6sZ1JJDeSkrPcXZOKUWK0lZklzays
	20Dwna4nltJcUhtMdrIYQ==
X-ME-Sender: <xms:mF7BaaFrZj-ORfMDpt_zucQJb1-YZlage89AbgK5OfPOELmGT1ceqA>
    <xme:mF7BaWJNSbX1kYXjk8FgwrBIDNZdqdoeMyP4_fi1_EQb5x-Avc9tM86T8horbAkrR
    CoyJFgPM-ax4j3HQ1DSyYA8brubtsrfDE_0Aq67VT8C6ibf0LtOc7VK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudeltdelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mF7BaSDQ-z0ucu2jgh-jOejdqIP37xoUATUW9fr0OVYxIan9jtgZZg>
    <xmx:mF7BaS7cHpFAkLhUjMVHbN6Of4qdIvLAMCNGyMkp6CXFkn3oGwCqtw>
    <xmx:mF7BaR01Td8jKJDikKxbD7_XMTSUi5KusNnz8dBZJFYzt7Imyb1IKA>
    <xmx:mF7BaelKwfP6F7mGnBSo37vKdZEfgoIcubQHWcnuuTLK-1q3Vbosdw>
    <xmx:mV7Bafcz0rFAMCBxa6YD0ZrhUU2LIipL4HQ1wJyl8T8wtT6fxa-p_qJ7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BD0A700065; Mon, 23 Mar 2026 11:39:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AuIeNFRcSw9w
Date: Mon, 23 Mar 2026 16:38:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brendan Jackman" <jackmanb@google.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@kernel.org>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 andriy.shevchenko@linux.intel.com
Message-Id: <cf40b3d8-9a69-40b7-b885-aff87e85de68@app.fastmail.com>
In-Reply-To: <DHA3U3U4ZZXQ.2RPHOFNQJ70JQ@google.com>
References: <20260320211528.2474389-1-arnd@kernel.org>
 <DHA3U3U4ZZXQ.2RPHOFNQJ70JQ@google.com>
Subject: Re: [PATCH] bug: shut up format attribute warning for clang as well
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 23, 2026, at 11:54, Brendan Jackman wrote:
> On Fri Mar 20, 2026 at 9:14 PM UTC, Arnd Bergmann wrote:
>
> There is actually a superior fix for this warning that Andy Schevchenko
> posted here (mine just happened to get merged first):
>
> https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u
>
> Should we just switch over to that? Looks like it should work for both
> compilers.

Right, I tried that again and it works. I had confused it with the
similar logic to disable the warning on va_format(), which is
not that easy to avoid.

    Arnd
