Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C723C2768
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 05:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777960466; cv=none; b=b/8Ebnp37LuUGMdt3YQbkc8Tf+7FT0nlS/8YpUI74/Lv6LrulQDnvuewMbiQ7KE1wI1ZIfRu66pZheVExF22oRNOE2im8WpRO5t8I+/Zc3CxMtwPopxQtgKeOWXVzkKk/HtdToPDs/YZH5HBmh+FpTF2Bgpz7jsKejE4J7QfnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777960466; c=relaxed/simple;
	bh=WELzHou1vd7Ag08z3V2RPQ0A2+vj64fj1uPwKZKE4AI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sacoG8JPb7gp0uc7U9qHNj6/YR24ADSzaW+1IVb7sDXEG/JfSOJ7y8b+QG2R/LEbhMr9rFh8iDkJEo1czfpjAMH++Gs/hS+PZgrXcfHtf77lgUVK/Y40uxka4SRXhhYljNJJCwtDBNIMPI7N7AsMJxtGz5M5hGMetE63uWBnn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=u5y7ZoA9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cvfkQ8LE; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="u5y7ZoA9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cvfkQ8LE"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5C2CB7A0101;
	Tue,  5 May 2026 01:54:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 01:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777960463;
	 x=1778046863; bh=JmfJF9VZOdx6cRELR7IxehWhdMlZxoCBVCSMgdOhjE4=; b=
	u5y7ZoA9eMuhoBDaFkyut2LXUpEqlffigmhHhnF64AUhHR7cnoryMMaxmEiJ5x6U
	Bjj9bhf3wxfvrTtTq+JafgfiTZnScp2Gu1QbaLd1QYqadEU38XrlCszrf+f40Jk7
	MV6zhqVBzbkQkk2MiVMYRiFDRSU/Ga27V388Yos0mNXEvLYPMAhAhohugp8cLiu4
	uqVNzqKvXCLdtc4ZyvneysGr0B6l+OrwDUTWpOiaKMbtUS9q5W7Te+yFhh34xmsa
	bF5dtkdpPdExcTwOq6C1CxWRrMvqHchHNQCsOU/VuAbSecTd6Km3ah9WHCpKu3kl
	g8Up5VgKyxp+83DcMvtLMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777960463; x=
	1778046863; bh=JmfJF9VZOdx6cRELR7IxehWhdMlZxoCBVCSMgdOhjE4=; b=c
	vfkQ8LErF1rWwYsXdqTOd1lvL7JBRtVY3PbG6sI8WbtF72dYEyGEOoryf/PTyglS
	3mjevzN4vzc5bP8Di7/ii6qRH4Vo1+icVm8XL7wS+aUnOKsu6QZhk6P8TQP3iWS3
	J7zSawtaivti0vx7TwA1kUcJYcMHc6f8vLJy/MqVuRXNNwagRAoWeUFFkzYooY36
	stgZ7Dz9xeSFESrh0G++rHO/b/POPv2Bn4SIV/GImq9rjNq6vViPuN17j12YSxgu
	wbqw5vPZuXjwwK8ENcQAnWqnZQbh5Vv6AyZPyomYIm4K6E5E6Mn6W+Pp1VMM7JRf
	VpnXd7Mca2etHTMspOwcg==
X-ME-Sender: <xms:Dob5admH6Uv6729At1Wuwyl2GIRgJuRRweEAeyrSXSapSZrUWXtbHg>
    <xme:Dob5aTqhFmhPNScrpV1lE8Rvj5XVBDx5iDZUxWwbonQdgYNdE6YD-m1Rlde8799_r
    hR5z1jPEjRUQpN3hQPIlPN7GtbpgAS0wx7TUtCus38GPBMIxZEbmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddtleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitghkrdguvg
    hsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehrohhs
    vghnphesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgt
    phhtthhopehsuhhrvghnsgesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhirghmse
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhjsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrth
    hhrghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Dob5aWvudqQklw5FkPvca27pngxBqaXdFjB0UEmBZSsFKI9Vq7cghw>
    <xmx:Dob5acYjtLE4zyJnH8SKg7oyP4UeJuqxnX-KvRlErKVc2OxkjorIWA>
    <xmx:Dob5aSElDA-x-F3oI5bm0Z2vz4B9cS_BuW7lUnoyga17KJOr9jHLkg>
    <xmx:Dob5afo-ddfADE42I5tBWOnDtv8JNK9WojrkzHnDgJPBvNylAZNWwA>
    <xmx:D4b5aVbKQycBvvy3SX40wM6fWUfzTw41oOlAo7uI4zgMeIj2iY9VIpq2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 17BDC700065; Tue,  5 May 2026 01:54:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A79HWrF7w_-Z
Date: Tue, 05 May 2026 07:54:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>, linux-mm@kvack.org
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Mike Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "open list" <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Message-Id: <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
In-Reply-To: <20260505010112.645361-1-rosenp@gmail.com>
References: <20260505010112.645361-1-rosenp@gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 5, 2026, at 03:01, Rosen Penev wrote:
> phys_mem_access_prot_allowed is only implemented for X86. For others, it
> returns 1. Move it to header to avoid using __weak.
>
> Fixes compilation with make LLVM=1 ARCH=mips

Can you describe what exactly goes wrong here on mips?

> @@ -239,12 +239,6 @@ static ssize_t write_mem(struct file *file, const 
> char __user *buf,
>  	return written;
>  }
> 
> -int __weak phys_mem_access_prot_allowed(struct file *file,
> -	unsigned long pfn, unsigned long size, pgprot_t *vma_prot)
> -{
> -	return 1;
> -}
> -

Removing __weak functions is usually an improvement, but I think
we can go further here, see the discussion from last year at

https://lore.kernel.org/all/20250520152030.1499670-1-arnd@kernel.org/#t

     Arnd
