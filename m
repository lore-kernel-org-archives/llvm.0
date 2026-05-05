Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2372030E0D5
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972987; cv=none; b=RgIB5NPVbjhXWnHkQYGMjJJalulbz1oK8UKIYQ7w3FbBLn/h6xft+ibHlVYj+cewuVW4l2hinKEifYVTionMV4CL16XSpAy3VZsFuuWx47F9dsYbI64nJ5XAccNgNH2Mg9BxhDCSFjkP9TJudaGS9GUA15xmxd9Q6hXaYrAxB2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972987; c=relaxed/simple;
	bh=DiXOK6if7zrAf2lmNOpqScegnq2Gljg5iT+JxDXlAxk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GHPNc1v5V6aEddmtRL/c+r/CzDi6pBPsRXkdLLpczzGpwozBBSo1KJ0OPTeg0hfDEKf/HQ7lcyN4myFC0NhTicKcb40z+fikgqIgypsSINnsA2Sbj8IbQn45Qrv8JtesbKSqHfzmNKgAyVxCV98VXk1djykVzR4LTgQcWnSPdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TGahYX41; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gOE2h9we; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TGahYX41";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gOE2h9we"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DC8941D0007C;
	Tue,  5 May 2026 05:23:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 05:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777972984;
	 x=1778059384; bh=ltI30Dtv2EeBl4uh1GQDYE0C2hnH+4+UiBm7Dg38Mzw=; b=
	TGahYX415CxL5YI6WvDSnEqxlqLc3XQ7di40bpVvkxee7sbuC8kOgPCJmmmIiLDe
	SScVJQ4/gYBIm13s6mx1qjkFnBDnA9AKScfIAqQbHbCkxs7iUgO+0KwDzEwAt5c0
	YH8fF4Qf3ly4S6V1komZC6XDb3uxwEOHR0VRV6AjLMbX6FdKq7kQ5SW6lS+CQaLF
	PBB+dPNKpJS82slrQxfD6kPzBpOhoGZVBWJlsyokxTyhEzpOhPtvsmD6yyFYHgjS
	afRTgjXgzT7MKIT5AuQek6mry8OzBk+7uBmIrkBZX6Xf2vj0T5DggSYIODzFb5gA
	8eXEPVMypJvq1y5C5y9l7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777972984; x=
	1778059384; bh=ltI30Dtv2EeBl4uh1GQDYE0C2hnH+4+UiBm7Dg38Mzw=; b=g
	OE2h9weXMV3471p2mfh2QA24GdcBg/K1B/LbYMcd0bPDEVyS5RPfHpp9ygF/vUgG
	w21jOxXkZXDaD/neg3jgtsriIgjniPbPQN6qja8E0ECnwxILBT4h6kp8i4KVQZ7u
	6OLi7QW4LnfAczCfkQYwlZ6opSOxONvwYJkaRurVZLOFixk63zrUbv4aYJSTegAz
	W2y65psyiiA2jouedOkqrB7A1Q2fXUexe/2aMw/Q0k79KDBBIugjTzHt18YAzwof
	D9WPxagAskqn/cONrNU5sDoPIjwXM4CTJlOzwdYTOaMK5CLx5VDfau8BDVYTsSel
	mEARjFidTvchr393MhS9A==
X-ME-Sender: <xms:97b5aekrUe5TtO731HpJUO1T6O7V0OkgI1OmxpKqKr667lZMbchEsQ>
    <xme:97b5aQrcXcrulufEQ28qxA1yGgQQBH36ry-PxMLLiL285jupXL4JBuMjEB76Qd_qz
    BNYe0jHspEGIl7c3k10B_ofrr9pZdNikX3Djbyi4g4SruRX2A5Q1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddufeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
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
X-ME-Proxy: <xmx:97b5aXut2MOjsdhNR4grrUbo68oGM-N9PLM8XSx9Yi8Yqrwnz0TGfQ>
    <xmx:97b5aZbduuKJ1ji2iLax7SXnwkeV2R1km36VBZ-kfPNxR37S_Fof-A>
    <xmx:97b5abEimqUHs66Ze6SQTYoh9lY40aEqWwTROmE7M_4mhRcZFUv7kA>
    <xmx:97b5aUqVeSSRuFkgV_vG4DhcERLx8kQYOIDuoi8iDuQHsPx29x1F1Q>
    <xmx:-Lb5aeZ8G-Y5BKS6jU4qO-10PKjjgO6Ib5T2WK65pGWZyqPKHREEol4_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C545B700065; Tue,  5 May 2026 05:23:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A79HWrF7w_-Z
Date: Tue, 05 May 2026 11:22:13 +0200
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
Message-Id: <add152a5-09bb-4c6b-a17f-da3d817b93e9@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N_moR8bs=NLUcW054a=oHB--4i+M5XKCBNF9LskYcjAhA@mail.gmail.com>
References: <20260505010112.645361-1-rosenp@gmail.com>
 <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
 <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com>
 <CAKxU2N_moR8bs=NLUcW054a=oHB--4i+M5XKCBNF9LskYcjAhA@mail.gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026, at 10:54, Rosen Penev wrote:
> On Tue, May 5, 2026 at 1:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
>>
>> Does this happen with both ld.bfd and ld.lld? Which version of clang
>> and lld are you using?
> clang version 22.1.3
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
>
> lld the same.

Ok. I've tried to reproduce this with Nathan's llvm-22.1.3 build
from https://mirrors.edge.kernel.org/pub/tools/llvm/, but don't
see this problem on mips defconfig. Are you using a particular
configuration, or do you see this on every build?

> I don't specify lld explicitly. I assume LLVM=3D1 does that.

Yes, by default it will use ld.lld. For cross-checking, you
can try passing LD=3Dmips-linux-ld.bfd (or whereever you have
installed your cross or multiarch binutils), which should
still work just fine.

       Arnd
