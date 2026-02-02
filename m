Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8F2BEFEF
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065071; cv=none; b=AQEZkoIe20mUd72mVSxTBRE5kN9E29MjjMgg4Uag6BLyf8vt6jXOYvi+L4GF46GZRrLz+ZhldxMEiogrsy543sZSps1vWRw8C0EcJ96beC0N7Hh3ffxiAh+W5y2N6UuOdUfBh74+7q2NdZyl0vCzXzcHRa1tZeiH8X7gLlvq2Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065071; c=relaxed/simple;
	bh=u2BM76GRsAk7S1MJxQmvwF0qewfyPvbiMjMGfK5x9yI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mn7kQc8GXxkRzn2BHBazmvFGJPpkUSRHDGNc2vqgZHiSx8Jqcmr1y5n75ugRhNpgNYimG/9dHx9RvV9WxGpGnpWWK/fQpocldsxv6nK6HrU+xQEtX0uhe0FC1BbgVAyAC90jxov0mRdYehM32XZXgHNvNB+bjeRZsqhsX0e38c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=p5nmoEfr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=doleNXp0; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="p5nmoEfr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="doleNXp0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D4C04EC0559;
	Mon,  2 Feb 2026 15:44:29 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 15:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770065069;
	 x=1770151469; bh=ZXGUWxC8uY9RWcgAZ2OwD0LCj9HH34Gg0ZxV1pDZZv0=; b=
	p5nmoEfrBL4bivY8dcYzSA8e0Bj0ekQg7DDfdmhSiL9n1/lwvhARb2GnTqKZEopr
	OToEDbgScPs2b/m0Za5Q9tZvBtkr2G7h5mxsPJ1Jt6u5ffw8pjGJdI3km1WaRqO6
	SqkeWi5RGUZxy8iC7n+flIiuIAttR6BZtXJnydvK5KAeCaYagfswsWC/lFxpnhxG
	VncTl7QWkP6yNwCaQwe+X3WPw+hG+4LM8pCoMkgDLxW2iK2WD/kadskwVi6DOGls
	Zp2Sx2PIO2c3CRcDZnv0F34P2j3Oenyu0utjqOrp2RUCQUOTql5fk5HmTRpedwKv
	sRdniYJoUoeITwVGDz807g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770065069; x=
	1770151469; bh=ZXGUWxC8uY9RWcgAZ2OwD0LCj9HH34Gg0ZxV1pDZZv0=; b=d
	oleNXp0AOKl8hd3PiHV6Qnc6EDRNnnyQ0CgQmTHkHsOs8ofNt/P/5ZCd37aIF3H+
	/8apU8qjDqV5E8zzJP3+gZHDWCI9YvGizKbBPTITkgxLvpgXqTnRInAjt1fqfAZY
	pjtgctxp/1CSh5OKhbJ/UC8BEAM+RKPWn2E4kKxKY/mfgIt0ksV786xRkaRYqVQj
	j/32g/znS4pSm5URESkJDII2CsJdKpXdj/BTADCqBQQhNrqY3boHXIe1yMDB+TFw
	rMMw++/bxWAmVrIZRe3ljNFL5M5FnvJC6PWPehhBdTMwPTj2qG8QI1bW3w3XqLBf
	c7A8tBv8S8du/Dhgz58Pw==
X-ME-Sender: <xms:rQyBaYDS8owMiUWLCdEanuS82iJ6E0XIYBjumUqvDu5lYM_bfVIuVQ>
    <xme:rQyBaVV0ERZDfMYEJIBDMRXVxD5bo4qqb-xtFm43KK5RtjCFV3tr29tm49L4evLIi
    VQzD9Pe3jYK9N_xIjOxubdazmpdsZkR8A8lt8onoaGt_61YoC1JBiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeekieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeguuhhtthgrughithihrgdukeesghhmrghilhdrtghomhdprhgtph
    htthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepmhhorhgsohesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshhhrghgghihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmhes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehjfhhsqdguihhstghushhsih
    honheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvth
X-ME-Proxy: <xmx:rQyBaUz7FqMwygHqKFuZguZyDJTqKiqBQkHzi1e1o0KrFd03851bXA>
    <xmx:rQyBab86ZUYW8bGZuYRb5LumTy-XYm3Byw5-nUZ_l4yfwVUhXI2sUQ>
    <xmx:rQyBae_qbH2hUrh12TtUtUN0EIMmqI2_PXT4tNTVwFmX_tQSKKKTbA>
    <xmx:rQyBaT4JR0ncxNB4GLPL-6fuziBxgXxjVYPJmEevkMIAZR31HJ9z1g>
    <xmx:rQyBaRKklxo8IJ0IYtkIMJ7iqvNDYuVtpdQAeay-MXC8oK4OUXfFXUmv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02045700065; Mon,  2 Feb 2026 15:44:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AZJ3wBr6n4EF
Date: Mon, 02 Feb 2026 21:44:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dave Kleikamp" <dave.kleikamp@oracle.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Dave Kleikamp" <shaggy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Zheng Yu" <zheng.yu@northwestern.edu>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Aditya Dutt" <duttaditya18@gmail.com>, "Roman Smirnov" <r.smirnov@omp.ru>,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <38f05cd4-6844-481a-8293-3b87f9f1a9c6@app.fastmail.com>
In-Reply-To: <fd1854c2-d3f1-4901-8b7d-c6ce944caf61@oracle.com>
References: <20260202094958.1232478-1-arnd@kernel.org>
 <fd1854c2-d3f1-4901-8b7d-c6ce944caf61@oracle.com>
Subject: Re: [PATCH] jfs: avoid -Wtautological-constant-out-of-range-compare warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 2, 2026, at 18:34, Dave Kleikamp wrote:
> On 2/2/26 3:49AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> A recent change for the range check started triggering a clang warning:
>> 
>> fs/jfs/jfs_dtree.c:2906:31: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>>   2906 |                         if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
>>        |                                            ~~~~~~~ ^  ~~~~~~~~~~~~~
>> fs/jfs/jfs_dtree.c:3111:30: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>>   3111 |                 if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
>>        |                                    ~~~~~~~ ^  ~~~~~~~~~~~~~
>> 
>> Both the old and the new check were useless, but the previous version
>> apparently did not lead to the warning.
>> 
>> Rephrase this again by adding a cast. The check is still always false,
>> but the compiler shuts up about it.
>
> I think it would be better to just drop the useless part of these tests.

Fair enough, sent v2 now.

      Arnd
