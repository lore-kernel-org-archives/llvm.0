Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF1194136;
	Mon, 14 Oct 2024 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903471; cv=none; b=i6BfwEA6Pwwd1HhnUyBETf2tmzg/PP0kEVNWbfLGYlZ9M1Ljh+mCKreZd0hBEs9YfseIAEaaGesjNKqhhY+1crDsgvtGS1DoVrXSrNHDoauMgrrZ061myFf1jmhLh6KKz6I3m91G+fJl1tcM7LmphJj1QqFVfC6Eo4jIq9GcOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903471; c=relaxed/simple;
	bh=WHogghD46wGkUbr4KsXX6nEhwyIaa0/APKpE1+Qk/aU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=i1dJixcItBZUEbaVbgU60qpITAsBX0H6Wr6AlLaWWYM8B4ddqgLRHooZzKuqVP7nfYNufffcrSQF5bQ+imQt3FmqTXvrm36JJQTmng8mMkPU59+YDxcNppaY5oBwF7BkS8PsCTLCE2NWBN6F+UaniB459f1cc22aMql/2rE+/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ANXBgz7M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l2erLWUO; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ANXBgz7M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l2erLWUO"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4137D11401C7;
	Mon, 14 Oct 2024 06:57:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 14 Oct 2024 06:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728903468;
	 x=1728989868; bh=Bv/TLNZRgpfIOvPe6ygAQOU1Awwm7f5igX2cR6hXyUE=; b=
	ANXBgz7Mr04kJN+GkoNlC9aiXZ3xltz66M+oEdsdbAqXoDOyqQFKq2L0Dbp9wIeL
	GkVbKc6zWcJKWHH1RdcS6HQNM/i12CelD300ZsBgtSaVAA8WzTDTdatH/vTrJh6s
	2NBI4ePomUOFvhsbF5PqwBtdbQV2OxUKNuyIqzUQ6dKswHwWBoBYnB6UkZJK9mH2
	WglpihY6MldYq6sGhPsrHwPd3TyW+JGp7f0uZWOg+BHqcDC/q/c44cd01UZsU4OG
	qAw50WXbYOITZNmjKEURkDifqNdzRg443WeD5SsdWnr1S3wsQV3ZjO3feksVD8sF
	zJUOb6rjYoAHr6QQl98p0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728903468; x=
	1728989868; bh=Bv/TLNZRgpfIOvPe6ygAQOU1Awwm7f5igX2cR6hXyUE=; b=l
	2erLWUO0Plwh5WamB1gGfz7GbrOSBljvv9/AUGSytE6uaUtQM4tMfnaYW+J6N1sc
	qYAy95D1luy3hERDb+NhZ1UsTfyGuUB13+pqvgv07eV3GvJ3VeY7gltDum0+RT91
	4Libajsw9XYWZsGjjAvIlx0vRafaUnGWUozRJ1G3a5/5OdVUi7/glMXcOYmujjtk
	pjoyuPV7lwXX7eKHPWrg5UKF2HgoyJ2C76mgm6JOETf/RMd7g4afEmD2HtpijigV
	m6a1UiXdvdmFj6Ef676l41iEXgW4/r00rnpPTQg8FuEmXZkx8BbaIK9Opy7yCnaI
	P6u8zcwoZkqLpIuItQNqw==
X-ME-Sender: <xms:LPkMZzNF2mtG26muiZXN06TkzNshmgCkzAa2bH-7l_97WWWCxkh5nA>
    <xme:LPkMZ99kFVPnOzQ6YbQZaCFMEp81QS96aMKPklnmm16Mv4z6BF5224WLDvExovOVL
    1gc4tYFLQpnaqeVxuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprh
    gtphhtthhopehstghhnhgvlhhlvgeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthho
    pehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuh
    hilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:LPkMZySlsO9z58kOXuolNp6C3o-LATmYwg8FiZpQcRmzyW79U49ueA>
    <xmx:LPkMZ3sUqHybS9N2JozAKtJUDX6Z3S49iKeiV0Rpyo9FA950AqsVCQ>
    <xmx:LPkMZ7f-nt3M51m8RZyfsBMh6R2RKiuENdl3Zo8s9grcwyHM0c1_Mg>
    <xmx:LPkMZz16JTkohLP4Fyg47x3h0aE4BSVzWbVSMQjmKqEKWoUmQ7fLUQ>
    <xmx:LPkMZ34KOhi-kALp9NJAk8TuVdPGC5nFrdcnUX1LxV02wQkXb8GgtUbG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 030242220071; Mon, 14 Oct 2024 06:57:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 14 Oct 2024 10:57:27 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Message-Id: <31b71656-3061-403b-b66f-231bd523190d@app.fastmail.com>
In-Reply-To: <05f57955648080267d8b6ebda80edc0d36069e22.camel@linux.ibm.com>
References: <20241008-b4-has_ioport-v8-5-793e68aeadda@linux.ibm.com>
 <202410120803.PveI3ZXV-lkp@intel.com>
 <05f57955648080267d8b6ebda80edc0d36069e22.camel@linux.ibm.com>
Subject: Re: [PATCH v8 5/5] asm-generic/io.h: Remove I/O port accessors for
 HAS_IOPORT=n
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 14, 2024, at 08:44, Niklas Schnelle wrote:
> On Sat, 2024-10-12 at 09:11 +0800, kernel test robot wrote:
>
> This one is a case of UML causing an x86_32 dependency to not be
> sufficient for I/O ports. I've just created a new commit[0] adding
> explicit HAS_IOPORT dependencies to both SBC8360 and replacing the !UML
> dependency for SBC7240. It's tagged as fixing the watchdog HAS_IOPORT
> change. Should I send this separately or a v9 of this series with that
> one included?

Please send it separately at first so we can get an Ack on that.
I also just tried if there are any other instances of this problem
in 32-bit UML allmodconfig without HAS_IOPORT, but SBC8360 seems
to be the only one. 

It's a bit weird that UML selects X86_64 or X86_32 (one of the
two for any config) but not X86. There are many drivers that use
port I/O that depend on X86, just not a lot that depend on X86_32.

     Arnd
