Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512338F927
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969792; cv=none; b=Zlf5qDa08NEkdQhk3bZXm0FwTpa3dtLmeP9YCX6KWWL4cpBpgyT1JlZ1MYTNrteCqwy+ZXVY0LFBXPzXqIa+knqFflS5b7Vn7eUNQZJhkr6+Lc1fgcD2utyBOHmQetUecobxQ9S8BpVFON15y6WSb+YjZpA5LEQrTiNuOSgwpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969792; c=relaxed/simple;
	bh=4hlnTYhlKR/5dJMoOQMZ2bw2J0O91KpiM6eR1lnjpeQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dk4oEjxAszxoQYw+cnuO36XDY6VzlAOVkX0kd145uuEKPSNrT+qZ8i2qnY1+qBHihKjntez12WFcxoYv3rCWuXM1hrH+fWE9eCrfpu20Mc90ROx4aiTiZYz+uqQ7b8ez75u5D8rHuCXBR+Ua5XLI9YxNe3gWvc7Hz4LIxCJEVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GMZ+zsyv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B7HPcpA5; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GMZ+zsyv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B7HPcpA5"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 87E411D0009F;
	Tue,  5 May 2026 04:29:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 04:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777969789;
	 x=1778056189; bh=qUBPJ0urDcUnlsX6r89qO1KciLnxPJvMDkann39OrDs=; b=
	GMZ+zsyvzU9xA3J7cWCCRaI0gDhZR2Tw1FSueTgTNcYtSToYtVDEnwgFUOxoSYI8
	VgnqpBjE5I7N7uPLs3sHE/Q1TqXUgjGZyDH9NWruIkJW+oyoy72NQAamAYvp3A4H
	+Iaz8tXuLE1pz+xIZ8c+5eUGYRA852/pNgF+LsuXpGyFbR1G1OJ+5ZVfco5KSVBl
	hnxLxJIVIW2eiTtD5NVQmPc3Spc5I+lUJheCcwAEDWuukIhC0GQCqUqA+spnk+qh
	lQjL4t0K/2GrzX+YsgGly4LlGwJxjzaF2eq8Yg+kZtTQA2daTkGwTc1F2dKG4VYC
	lfL3nM4sTbeX5XV3/8Tqrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777969789; x=
	1778056189; bh=qUBPJ0urDcUnlsX6r89qO1KciLnxPJvMDkann39OrDs=; b=B
	7HPcpA5DZ1msZO5GgfSa1at8VYqhtBAlxqewaEmHYcw2IPRPHTD3uqRItnkxALvw
	zb+ewQO0NWd+28GkMdJ4L2BHqEC8LXY7wrWAqbzCZQTj4tCEEcfvxn/wQUevQkVv
	VM/e1uLnFtygVRwilIYPHgTttdCVpBqqkOfqkfh1Q1Kc6zIJMVEUmI8vu7fBHYYb
	Z6DSOuqDw91Gkiogk0HC4pvx3NAPeoPoJX1vR+ZjbTZuo3le1nJd/c2SBIyOJXkS
	NylZfCWF0TaETepRsyj/hzV23wHN4RIclcSku00R0BNcD1utBKbpab8RLXiWV41o
	LxezAENaHGFO/LdmEinMA==
X-ME-Sender: <xms:fKr5aSR4i0LKn96Ts2wPMZBTJicmUDEQza8pPEi2fg2evgvyipuaEw>
    <xme:fKr5aSlTEXhSgiErd_l1ElbwMj6nu-asqtWTVcT3rgNNyz15IdJe74J3X11EQksH7
    lIaqz4pt-oYJHY__8---roprV299HC094O4H97cCedCavkzU3nVRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrih
    hlrdgtohhmpdhrtghpthhtoheprhhoshgvnhhpsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorh
    gsohesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehlihgrmhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehljhhssehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fKr5aUb5ovd7P5XcuHC_V93o9oyEYJYoKMgqeUniGX-9CCJw2JyvYQ>
    <xmx:fKr5aQWFGZnJ-8-rTb5kQaoIGU9PKbKYcmylRlmMNuQjBuLdKF-ubw>
    <xmx:fKr5afQmqfKgv2NwBcpG8eghLVORqTLSgW0HIIrK0G6mflCtuAngnA>
    <xmx:fKr5adGXdnlQse6xej0imfVIhZXbm6SGI1WU3lD5ndL1sF4UoHs43w>
    <xmx:far5aeohjOqLMDmlUwjRvw9CSi6hVi_AL7kfCiYRD2b4US0XU5j6usdn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8337B700065; Tue,  5 May 2026 04:29:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A79HWrF7w_-Z
Date: Tue, 05 May 2026 10:29:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-mm@kvack.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
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
Message-Id: <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
References: <20260505010112.645361-1-rosenp@gmail.com>
 <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026, at 09:47, Rosen Penev wrote:
> On Mon, May 4, 2026 at 10:54=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>
>> On Tue, May 5, 2026, at 03:01, Rosen Penev wrote:
>> > phys_mem_access_prot_allowed is only implemented for X86. For other=
s, it
>> > returns 1. Move it to header to avoid using __weak.
>> >
>> > Fixes compilation with make LLVM=3D1 ARCH=3Dmips
>>
>> Can you describe what exactly goes wrong here on mips?
> Cannot find symbol for section 4: .text.phys_mem_access_prot_allowed.
> drivers/char/mem.o: failed
>
> It's full of similar errors in drivers/pci/ as well. clang on MIPS
> doesn't seem to like __weak.

This certainly feels like a toolchain bug. I would not mind having
the PCI code converted away from the __weak functions, but it should
not just fail with a linker error like this.

Does this happen with both ld.bfd and ld.lld? Which version of clang
and lld are you using?=20

      Arnd
