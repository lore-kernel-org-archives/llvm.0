Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1422157B;
	Wed, 26 Feb 2025 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579058; cv=none; b=mpO4P0Kfz2zBpoCBmhELiXTJCm2tPrmEwqmJbhz+JjPjsOked1DF0JZGXYHleU1v/45QgzyLgxE1h+GLJwdh8Y8AB3wnh/2hMzgextMT3oChLxSZMczzv1tdG2VLUWlU2SOKJGUBgU6GPmim0Cn57bpc8DbP4Gu2J91RwEaM+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579058; c=relaxed/simple;
	bh=p5A0b2LNIs2e7VqlDBvGFZUAT3KK/Kubd4zTeAjO6xw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ILVhmDEY08BYJP5yg/QLZ+1duo7OM5ZvyAlGIq8Y3yI3KVvzas2WjV+rT4YDqvwe75y9NPGLbu34f8OAG5CLI8RUgTxTmHg4m0QTU7FQDYZp/+c/54vZ+wakPoV2g1b9h6B1AkotFzelWkYJiCo0Md3kXCM7GWRvloBtyx3Ie2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FiNy0np4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JYo75WUQ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FiNy0np4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JYo75WUQ"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id DCCFA11401EB;
	Wed, 26 Feb 2025 09:10:55 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Wed, 26 Feb 2025 09:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740579055;
	 x=1740665455; bh=RHF2v90/WPwkBiriaV+tfj8UBdDPgzDA3SHp2udOdmk=; b=
	FiNy0np4HzyxE3Xxpzbx37k8YOMet7eFJ2A7Oiv3CtQ/3V1Q+ArsE/RoYZQbLqkD
	iF2UHEAuDkBdy1WeL58XnBhxzqUYA9XzhSUzs9eKPYC1ytI9tKIRvKk51OcnL8zj
	AH/vAj+MaHWRTnNtOqhVIrP4n+HBtiSjRC6Z55k9wqp7HtD/UDGwMcmo1/+Atu+/
	s9PFKN0SgsGwv5kwPderH+3kpAgQQnnIEetpn2sQ7iz6kadXV4X7ki/RqD1ZGpA+
	H5B7g8RtiQ6mAtY4f2l31lgbYDp0XiP68LDmoEUOeF8Y8oJ7URl+1OzaecO3H9s5
	tkZ1wfKI0vZEssji5WnbRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740579055; x=
	1740665455; bh=RHF2v90/WPwkBiriaV+tfj8UBdDPgzDA3SHp2udOdmk=; b=J
	Yo75WUQCjCOoHU5pA4+bhBP9UDoEyEuJIybnRYTTJl+HJa/AT/B2awi5TQSJlcM9
	kQVq7OQ6F0L1LcCJN6IDVdycHokr9HpnsFcqODxOMhlFX1616J3HPmMEBSymtk1c
	znBxZRPncAHn7878ZzYdLXzyt8OGJEolt1n7Qvm03TJAbr8p1e46GmlpakC4yl4M
	3OtMld1iQqfcrfqxCgEw0EhID2lqS50p+9kcSVrMt1XHXDtyLqUixjVsVSmPL3Od
	SEKU47PYKb2P9s2jA/8D79ffTX5YTOmF8nfNz5acdya4G2gkji87y4FQfV92KmW2
	4DwgLprLF5r2ZkX/Byh+w==
X-ME-Sender: <xms:7yC_Z71xRHbYoSkBJqaJthnP-p8bcrcETBIX16jv-jegGgs4I7FZ0w>
    <xme:7yC_Z6FXhuFgNDk9yzHmm1OPBjX4tRVyKcRgag0nGhIRdeE3fZKXqLipx1MqJY-b0
    hTGIG6lJPAvtuMyDv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghk
    phhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehllhhvmh
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgr
    lhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhuihiitggrphesrh
    gvughhrghtrdgtohhm
X-ME-Proxy: <xmx:7yC_Z75NuhYUCwlL6q8oNAtfjPXTa2SLHQad8_2addzX9hEPets0uw>
    <xmx:7yC_Zw06N8MBPovAceOvQ1xAl_-Heqgz2hSV0fG2e2iKVsEsfROk5A>
    <xmx:7yC_Z-Ep68I9plZYGHnOJ3jFaAf7YbSCg0wnJQE0zEI5vHO-ZcuCzA>
    <xmx:7yC_Zx-XE4C7eY6dqUsO0M-8tQB1uChqzoaMFVIBGXeIMdpPKjU3RQ>
    <xmx:7yC_Z7MdLMF11HBAc-0z-pg-K6twoeJE_SI3iaiJGePXBNp4qGTJnn-E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 06D872220072; Wed, 26 Feb 2025 09:10:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 15:10:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Luiz Capitulino" <luizcap@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>
Message-Id: <e5aec89c-a7d5-453a-8883-e3c025db2e5b@app.fastmail.com>
In-Reply-To: <202502261733.Ma0eUGKJ-lkp@intel.com>
References: <202502261733.Ma0eUGKJ-lkp@intel.com>
Subject: Re: [linux-next:master 5933/6583] include/linux/page_ext.h:131:20: error: call
 to undeclared function 'page_to_section'; ISO C99 and later do not support
 implicit function declarations
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Feb 26, 2025, at 10:46, kernel test robot wrote:
> commit: a2d6e9c1a867bb9f13943cb8483e2ab85b630bcd [5933/6583] mm: 
> page_ext: add an iteration API for page extensions
> config: i386-buildonly-randconfig-004-20250226 

>
>    In file included from arch/x86/kernel/asm-offsets.c:14:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:21:
>    In file included from include/linux/mm.h:8:
>    In file included from include/linux/pgalloc_tag.h:12:
>>> include/linux/page_ext.h:131:20: error: call to undeclared function 'page_to_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      131 |         iter->start_pfn = page_to_pfn(page);
>          |                           ^
>    include/asm-generic/memory_model.h:64:21: note: expanded from macro 
> 'page_to_pfn'
>       64 | #define page_to_pfn __page_to_pfn

I'm getting this on all configurations that set CONFIG_SPARSEMEM
but not CONFIG_SPARSEMEM_VMMEMMAP.

There is also a possible problem with linux/page_ext.h
including pgtable.h and mmzone.h, which I think can lead
to circular header inclusions with linux/mm.h.

      Arnd
