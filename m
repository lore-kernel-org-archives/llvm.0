Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4E7E583
	for <llvm@lists.linux.dev>; Sat, 17 Feb 2024 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708200325; cv=none; b=dfMaXrZGV4Ac4sDheJXvh7Qa2Y0hIQ6rSwfqb4/bL4WWu10/3t6OyN/Aa56B0em315RjEeWhINS4dx71LE7ufgk+uTpDeGUQDM9/EjTJ396qMSQNOur+1eKqlLooheYPYzylEB7Y0FUVutUGRyo/6u1+eJ5mm2vecjp3QdiJcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708200325; c=relaxed/simple;
	bh=TJdzeUtr+awh8X9OUPF8QnJyL+sOs/4y8vVXqvD1zE4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=huTDsDHUsR8Bysfet9V63gl8kU/xUIiCZ5qdowNqHRYZDE4M3yeWrhJ8dYqsX1LhgxghqbMOfDy7HY0p12VVcrKSeLGvqtXWw7TjRwKgWqAm5vy0IzS16c7TwLSVaWRjiDpmPW3BCGzhpLx5It1hz4x17njgvrpY5OIrQ1AWCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkVgYMKE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkVgYMKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C733BC43390
	for <llvm@lists.linux.dev>; Sat, 17 Feb 2024 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708200324;
	bh=TJdzeUtr+awh8X9OUPF8QnJyL+sOs/4y8vVXqvD1zE4=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=SkVgYMKE0rYPeyo24J9CUKy7I5TXaRN+5qujxdo/iBDHT8mTJeeotyaSqNQmVEb8z
	 lG0k/A23aTVjHiSD/mQkLufXqIuklOs3Jw7KPjSv5UQHLo/8HqbFMJixsRTfeGrgNI
	 cbETrEGscUyJnfoZAcJ9/YWIuj8wy9DeRDIXCef9osdL/Odw/N9uUtC5wGThKiffHj
	 WaweCPR02/JVDZAXQIkT1ADJy36p6gLQnrMSMbwKe50rIodB8zBJ/zAk6g9teKXZhM
	 vr8jTEUuIGoKjaaKVyYXmRi3CkDuM8yMTZxZ25xYX+wcS2XvmPW6Nnb65I04p9dd+D
	 /N89eKHAcdDYg==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id B74061200064;
	Sat, 17 Feb 2024 15:05:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 17 Feb 2024 15:05:23 -0500
X-ME-Sender: <xms:ghHRZVrID0dQLGhkr9Vw9tcIQrWqrLXbrVlWOqwN63arpWZ3T-ying>
    <xme:ghHRZXpGp3ZM-66p3nb2zAtM1Z02GJYS-4ZoLNNGXqMhtBrdN6HtchnEk5D0oY1td
    rHIurjhn6SMH12PLdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepudeifeetfefghfeuueeuudevvdekudduvddthefhjefgjeeijedtheeu
    geevleffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehud
    ejtddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgu
    sgdruggv
X-ME-Proxy: <xmx:gxHRZSP2YopyJmmodF2sDdWm9m9jrhTLF0VYpLTUCkXFJYbeMJMRZQ>
    <xmx:gxHRZQ6rbVwzA3hTrLlhmY1t_Rr1Ys-WRklMj1GAya0V2ukbbOkdkg>
    <xmx:gxHRZU4tjPMar8AAWvYFkCMmCl-7ClEj3vbLtP9akAhlGGn7Zl-Ehg>
    <xmx:gxHRZUFWRjDxyQAr0KniaF8VeBy1YF_uJeSxompP8PdIyK8x0nPiufqVqzA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E10D6B6008F; Sat, 17 Feb 2024 15:05:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <7e9c8f49-4f95-4dcb-a038-36bb5c895b20@app.fastmail.com>
In-Reply-To: <202402180019.a2GWUA60-lkp@intel.com>
References: <202402180019.a2GWUA60-lkp@intel.com>
Date: Sat, 17 Feb 2024 21:05:02 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "kernel test robot" <lkp@intel.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v6 19/19] lib/iomap.c:81:23: error: call to '_inb'
 declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
Content-Type: text/plain

On Sat, Feb 17, 2024, at 17:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git 
> has_ioport_v6
> head:   0cc26afe6244fe307926528550a4de09c1e5846e
> commit: 0cc26afe6244fe307926528550a4de09c1e5846e [19/19] 
> asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
> config: hexagon-allnoconfig 
> (https://download.01.org/0day-ci/archive/20240218/202402180019.a2GWUA60-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 
> 36adfec155de366d722f2bac8ff9162289dcf06c)
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20240218/202402180019.a2GWUA60-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202402180019.a2GWUA60-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> lib/iomap.c:81:23: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
>       81 |         IO_COND(addr, return inb(port), return readb(addr));
>          |                              ^

It looks like hexagon just needs to stop selecting CONFIG_GENERIC_IOMAP.

     Arnd
