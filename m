Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BDD4A3F34
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642633; cv=none; b=VGJYt/I6knPOiTiVzSdTCbKTtFi/HwfyTgf/8uKYDGIJCMMlB+bilxYdLJ4DhmsKiXZn1ZRtcuO1+VDFPEAMNlbHzoDL2LCitGooCGQmQia4L7j/MjgCLlHXCePy6dGZ7UHAGqgQs5OBRMVbxuWsTjr8Y7XY/r+4v+2ZKh1AfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642633; c=relaxed/simple;
	bh=kTyOPd6sbaAaSQGfySTZuG3Q9c4EjZEa+S4p9EOIzrc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MncIfmg/sx9f06Tw6Q75UBiFV+howiJLQ9nmRZPUieWjdsTKU8iFEQfywD6WKOuIIZjbc6cYwS/sKWUP7TsJBCCgWCWHgxYcL3SMqy2fFPQOp5/wpgsHFuC894cXTewBzpHGC6nHnj90uQBCDeFb3owFb5RDrhLCFxWnjGM9X5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gMjmK/fw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iLhmRthQ; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gMjmK/fw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iLhmRthQ"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 033401D000AB
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 10:30:29 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 10 Oct 2026 10:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791642617;
	 x=1791729017; bh=0CmHHOOqX+1xiZjtZ5DWDZbtI4XzSSaR1wpGb5qLQP4=; b=
	gMjmK/fwNMCVh2Ls31/FUtQU4K6wi15Xd4TwcHZDn2UKi6wxNBjmGUNfO8Q/zGNp
	MuOFLP95dD4ejE0BE1jEG4PPxGGd3ex7OCvvj2JVd9zS/Rehk9Nm/VWS552sMajg
	HFrHKNgv6x4EKrPiIZmEeIMuQuWg6LAeMQvlPcsTUft5ACOAtKgJ10OF9mD1BCVM
	tjW4FtpHrZehJ3sztWMUhmq740LosVKhZdkELz5pHm7XL7o/SHVu74KGP2vdcGnv
	1KtYcV3SyBIXXBqACb3HUmg5XjXI8/0JMfhPyypzRJRoxHYMG70Ozyt3RoMdgogT
	6PL8IyW2t89KFuFWbq5tzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791642617; x=
	1791729017; bh=0CmHHOOqX+1xiZjtZ5DWDZbtI4XzSSaR1wpGb5qLQP4=; b=i
	LhmRthQ6DQxkp4LY0LfhZoUmNpl/AYB4qhFOJtCs4jcAiyD5RArDa/UwSt3e9LzH
	tuVV4SjNHnCHQBvKUqrIVyWGXG0Ekj0TgBP8eeVeVKxsMGKTesC5p5a4WIUTWOZ6
	gcGBHC4vWrLvFcu0g+IuZZN9wY4DDp6C/BB/b/FisbQ9w1Dc62lvUvgJDn6oPRQM
	xtpOwKbZrQ/13pckCRb5aR9UgrQCWCX/Lsc4ahj2XRunfnTnk/WXP259RXge8jx8
	pm2dAeubd+21CzGkW/a507WeNS/isgjaopKl1w/pghaoUsvtI+Q1bHYwwpocegh0
	IsF+DiiF/VBkiuAW8SJ1A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791642617; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:OC7sDDIYtuD+ru5gsND5t3ctLGmAm/Y73LmH+Qx1ard/7vK
	82tm2loINFvw1SUqrxGyrB6+Mpw+FEso37rHlit60ApNtyqT6b6Z9H9h2blTNLEt
	u+BLTFnYr/TH2OCBXKYjEc1GTNh+ZIe8u5fFMwRvAZHgqdtV6RIXckIHjj6fr5tT
	r7XsMVlrYwX+EjpEIqK6G/g2AhPfOArLMdW/ReHok7Ja3rXGOskYPsAeuj7XOuL3
	87XCRa2Gu+l1MSS2LlXZiBx1Kfl0hthU7esSFR9x/xJccxKavHiS0NKnBcssWpWm
	Y6TxfhEFoC2LnfkGp4oFBAz3P1LvxMrrGzUD3MA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FCcUwALsvQPD3s++e8KnBI5uHlN28iyXWaXFw9GfpwU=:kTyOPd6sbaAaSQGfySTZuG3Q9c4EjZEa+S4p9EOIzrc=;
X-ME-Sender: <xms:8UvKaud9UPAeZo0SUNXCBv-xitLm8uE-Z_ItsPIztCwnGNZYJsagXQ>
    <xme:8UvKajD55eG9_1eG_q_6IH_ZK16AXovLFay79jr2hWgmY01DRSfXQ36EAucnE49Fn
    f937Xejcycsr8l7oqtabOa8DKmszzAKODGA1pLlppLmpB88igIYF_s>
X-ME-Proxy-Cause: dmFkZTF4Y9Jpn4smgjHjjJaLUEX5km7VArfjakyh/rS/HxayXIDGX6XwBgWL2nNPJeORLV
    kN1T+O3NxkMrs/Bt7/kAl5iYFPrLFMA8o+5995r+lhyUxiAFJ/7MxBadEFMNcWO4/YHCiU
    cTmo+QAy9/pybqXrSDfZbttd8jmIBeghrYwkNVYgAFAiKjnzKoF0/njU3lFZk7DC51Zljx
    483DEzAYYpf3mAlilXBxRNWRtWaFFGumKANspl647AiglokZXmAW3tgjsyOcTJAXPraX/W
    694MS5Vda9p5JzxD1BqxsIxFq0Brta5NSXZYVzsQUgV2s8sXBMFJLCqrgkhYDZbQHlMfEo
    HjEXWfXU6ZLnvg4gluDtigOrYh9zGswAh+fvNJZGS3dwJkG0tut75+jh1JOa1gzhW90yBX
    LM/FSxZVv+R5FRP733Kkqoj+7nZ3Hxpvq3vFrIzBWLdEkWsY/JKinIJcVnVwOMrXEWqaFh
    CIXZarxZ55fjTv+HCWn2F1kN+/w6calR/XEWhaf4rK62eQ63YFPW3fbU7WNAf2ffH54OZu
    Z2Q/dF/FFLLiDC9RC8sKZ7Gw9KPiFILP5RwTY3P9ioSIrpTX+ztTpHsnfTa5lpPMMSsdQi
    3pP0G/aNaNrsvjEzim72/QMP0NZcK/QoLVyCraUZE8q+OcyVdRMtPJlmTABA
X-ME-Proxy: <xmx:9UvKalm2LAjxPmO3reRHWdAMHyQus5HMywmzvFmieaqV8f069_epSA>
    <xmx:9UvKaqcdNWumm2a80B6aL-jaRjObZENu0CJLG-yv0wosYonOGRt2iw>
    <xmx:9UvKavERm7IXSdk3IBdLifNogQBoUZAoWHZfPN7KQKdFhZBy7YXxWQ>
    <xmx:9UvKascJWVQwVHzYUZPnzh1JM9-qg1ms8IjsvPvxJCmBTf5CZhhgPQ>
    <xmx:-UvKahhRCWmUvF7IIllKchB7epjuQO4x8N2syTQEbLhhD7etKPNOgNPA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AAA7E32A008E; Sat, 10 Oct 2026 10:30:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AYDIbhfDD_9F
Date: Sat, 10 Oct 2026 16:29:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Linus Walleij" <linusw@kernel.org>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Bradley Morgan" <brads@mainlining.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <19b80262-a7f2-42d5-a44b-60a36a1ba373@app.fastmail.com>
In-Reply-To: <ashAuRn5eT2iiMAk@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
 <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net> <ashAuRn5eT2iiMAk@gmail.com>
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 9, 2026, at 03:21, Karl Mehltretter wrote:
> On Thu, Oct 08, 2026 at 11:08:52AM +0100, Gary Guo wrote:
>> > +=============  ================  ======================================================
>> >  Architecture   Level of support  Constraints
>> > -=============  ================  ==============================================
>> > -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
>> > +=============  ================  ======================================================
>> > +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
>> 
>> Can we say "ARMv4T or above" or something similar?
>> 
>
> Plain ARMv6 (CPU_V6, ARM1136r0) and ARMv7-M stay excluded, so "or above"
> alone would cover too much. It could be
>
>   ARMv4T and above except plain ARMv6 and ARMv7-M, Little Endian only.
>
> That is longer than the list. I can change it if there is a preference
> for this form.

I think your current list is fine. I'm still not sure about ARMv8-A and
would not list it either as explicitly included or excluded here. It probably
works but this seems hard to guarantee since ARMv6 and ARMv8-A are normally
not compatible with one another.

     Arnd
