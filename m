Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252992;
	b=blUwaICBELBDdnXzlKGx+OlPgz91v5lZXU8uXaeybaqp3k3uGk3F0WkeowwmPGBHPdXA
	 BzNkkduNut31FWrqyLnpcMvd/ueswaq/WbjQ+x8uiymgGty4bDQRbuwUEvduq7iJK00we
	 tlF7nIu5wtdutzcEGvkJTHuvoqCD1cTmDWvySVXVY7pBmgrH4C92lHh8sBuflqmmVeWvT
	 W/RcproiSmTfTBCgTgvFo6auvYZY7JGzKtl/aIcv49dq2MR0R6FaR4Uym4glzVsqnc8li
	 pef15/YxOPfa4xzKBbrs/15u/O/QSnJaL2TeuykdNJOS4QcwilO21M6nW7BkB+JfhYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252992;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=D1ac/wkjmqQ2BHhV67erTJFRXbNfNgVPH+OMTmkt05M=;
	b=f5KgZw6vPEWGRdhnFFdHwHQxiaOea1ZOiQdZ6/8uLN9dfUrSqHxu7RoUO90XhNNw2d8h
	 WkdVlE6P8VirnJkyN8lIq0PKm3IhDIKZlUUtIL4FYPBlN2FsdTrDjPLzIedFmU2n3SBUK
	 fSh0l2t2kU2NrqAMeVjKu5zldzQY/O0Sk6t1HSzNGQD44vFjZIZgJD+sIH8l9FXSiUAkH
	 m/bFreEAP64TFL8PDgw9hSgHFASVN0XKsvEXlHrMTGFwvflRnYyMkjqRVDRf2lg6YsiPu
	 LrK3qowSTw4iNOlbPlHStXOnK2azZ3nhMSY7XAzyl25MaVAqRw38NWdLjnjd6E6HtRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wolber.net;
	spf=pass smtp.mailfrom=wolber.net;
	dkim=pass header.d=wolber.net header.i=@wolber.net header.a=rsa-sha256 header.s=fm1 header.b=GXaTKQn2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Eq7lzYFQ;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB21606A31A
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 05:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB21606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wolber.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolber.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wolber.net header.i=@wolber.net header.a=rsa-sha256 header.s=fm1 header.b=GXaTKQn2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Eq7lzYFQ
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A6640140013C
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 01:49:45 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-03.internal (MEProxy); Thu, 29 Oct 2026 01:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolber.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793252985;
	 x=1793339385; bh=D1ac/wkjmqQ2BHhV67erTJFRXbNfNgVPH+OMTmkt05M=; b=
	GXaTKQn2JzEuUeJoPT/zSEzlcOtMhx+akHwrWHTeWrkSRpV7CPrgW2wbOZUiuKOb
	L7VIBuHb1fwHLYEo1Eya6g3fG2Ply9k25eKX2kf5s7JhEisaKKUobazk/a1f4iFR
	U0nUYgS/mzQHtZD5E0Jf4Gn1WI3xkxS53HWGhHkys/MUss0GHYjs8rsUSf/zYs1J
	fqwlnKg4JCbzRSncY32fswg1ojL1J7kByWi6tcnEhTd/7bwV7NpAUmrMOZMrapsH
	NDG5EVDdxLYDHauRulrTBqzaXwnfsSlNL1agN0JODevx/aveAGW3Ee59/QVZ5CPN
	x46WcfSoPk0FANNv4DTUmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793252985; x=
	1793339385; bh=D1ac/wkjmqQ2BHhV67erTJFRXbNfNgVPH+OMTmkt05M=; b=E
	q7lzYFQBgXaHVv0RKJUZCfhLvKhzRJmrp2gpMQbLjOwdtj8qO1f2OuWTeXUa17Bs
	mnFL+y3unmwSjRbyHGZsLYM9+DLqvZJABI8cqSmZdtc0BFkZNBI5J/M7URO3n8eO
	6AB8hQox9+ZgKPfTCVZbOxPg+HEkpUGgXs3Gd7bulJaILwQLo4YXoM8jQGwqlvK4
	PJ33ZS5KMZHvHe/y3ojiUOICLXnvXmUse0KV/N7v+gA3tLDUWje9BU1eLzWnv5DW
	UglI/Bd3x7WLlDbC1LuBdgvXunadtrfRKifR7iawe6HrT6L70BywN1BINqIndrzG
	i+w1iFeAVWOIv15Co2z3A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=wolber.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793252985; d=wolber.net;
	mf=PGNodWNrQHdvbGJlci5uZXQ+;
	rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:Mpgurgy6DahzrpNJdc7FVbOZfnvlpDPfHPiVCVN2Mev30PN
	VZrzXIkrVOm5DDal4JVNX/2dx4a5QQ8ci3rxbTijm2kYg+LAMwKt7Ru9uESSSAyK
	gtFxd/U6BuNmmRF2HGd/G9rtjDZAnY9RBpizIl6QHU++WY8iggpUqdHp+DExqJgj
	OE+v/dSaQoPQmDoF4HIM2nv0RPS9MFhJDTkz89eiVl+7w5Q3bLFyNojpLt6SCzcz
	gPqQ3jPDKtS1VVz9HAxFIkxRu0EXwJy2VSvbId6UCXEozy5QQXoyj/tUpqfqkPOD
	q3Ov3L63NWpHAN74/6UpXIt3Sf8jBXMaF9kZh3w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PDCQrjEtRcrM4lcNqKDQDN9385PHH5uGr7FrVZcz+FU=:D1ac/wkjmqQ2BHhV67erTJFRXbNfNgVPH+OMTmkt05M=;
X-ME-Sender: <xms:ed7iaj_lbutMFJJkR8aGD-2uDHsJBEseQqbZ0r3kbObgTtrJYuEYaA>
    <xme:ed7iaqgJ0bNSwRXld3RRvgEIRoz4afpxsa7GQ35jnsp95SRB6OiEVPnSFeWGjL4VG
    IavfBFOqLnOypa9YUgzTfFaXcBV_CpY6vrDTxXZXNq-fC3KsNfWg2Be>
X-ME-Proxy-Cause: dmFkZTFi47UfBS3qtin2EOCAnLXWgDTgYqNWZh2+4k0MPu07+mRUMRnWVqjM07Gy9aqxen
    sbcbfFAmwAoBnCxPB34CZcdieECYJIs/fOGcJEFx0bWy62+lF6VHtvLdyav0DePRL7QZG2
    68t4tUbRn0qEtwBU1NUdMwWkQ07k/VJvfNuyH61UExn69DfFlh0jgzZh57oKFzwDUeNuN7
    /BjlGMr63RTgfE4tUKe1cewV0prry6id2fPJsbWCky2R62Tcc9pZCfQlnH2OKvwN7Ti+2R
    qNlRdLDYBki8Ms9zYvaNyf2FKgAad74wtx8OW7gHTayxwJku9z9uLuZyQYVfwkKTDKZ8AM
    YdmiPF08dZwWgy+CXZCCLqbSDN8eNC2gSkNB4de9e7XCsmMUREzgzJqpyPfQdon+Fev0S5
    JBZUUDl+FbO3aJDS65ekV1NOaksjonLr0wOU6UDz1zI1kRSIV0AjNG12loBO+0fj5t/Cvm
    ppFwqUCOw49/nfA+tX6watX6qteQL+5lT/SKa/lGo4Ocx+aYMNNg64AB+30iAdqr2XjXhI
    f98dUSrhDqaBUqHHQQZu2D2Rr04jIrr+g9OZt/IOHC9yXxrgMX7lUldryUgzUF9WPO2s1R
    vShRQSjtHD0W5lb8/KDZVV6uzzQvJX9kVOmem0RNdTYUzgy3lRyBMTncnkoA
X-ME-Proxy: <xmx:ed7iaviR-_6OYCH3WUTV6NvxqSwl5V88ab9dCo2ECWY3IpSOem7q3w>
    <xmx:ed7iasdpjGp9fY3ySQxo5Lc3rAxhGNZOP0kMEaFHFKKxEwZ5Vk90kQ>
    <xmx:ed7iau1DKfumNrRyv7Bf2mm_oqdMN-Phgip7zg9lcg0pOndsOytWFg>
    <xmx:ed7iaoqppn5_63varWgnIvXWJY4J5KoWj7fMSrnQRN5ljj8MI_45yQ>
    <xmx:ed7iavA_QMSps5FP5hyZgjr7rdzQdKLl6MK1yYAa5cycyXq656O6rm4b>
Feedback-ID: i5cf64821:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1358518E006C; Thu, 29 Oct 2026 01:49:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ADl5zPqKnVsk
Date: Thu, 29 Oct 2026 05:49:24 +0000
From: "Chuck Wolber" <chuck@wolber.net>
To: "Sasha Levin" <sashal@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev,
 "Marco Elver" <elver@google.com>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Thomas Gleixner" <tglx@kernel.org>, wentaoz5@illinois.edu,
 chuck.wolber@boeing.com, "Josh Poimboeuf" <jpoimboe@redhat.com>
Message-Id: <1f0ca403-551f-48c5-8e5b-1e07d3227f34@app.fastmail.com>
In-Reply-To: <20261028164556.1610305-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
 <20261028120034.871983-5-sashal@kernel.org>
 <20261028135140.GR2668564@noisy.programming.kicks-ass.net>
 <20261028140118.GB2669272@noisy.programming.kicks-ass.net>
 <20261028164556.1610305-1-sashal@kernel.org>
Subject: Re: [RFC PATCH 04/20] compiler_types.h: Don't instrument __always_inline
 functions for coverage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 28, 2026, at 4:45 PM, Sasha Levin wrote:
> On Wed, Oct 28, 2026 at 02:51:40PM +0100, Peter Zijlstra wrote:
>>This is pretty vile. But also, since people were trying to use MC/DC
>>for validation efforts and the like, how does this impact them? If I
>>understand correctly their previous emails on the topic, this means
>>they have to go manually audit every single __always_inline function.
>
> Yes, the __always_inline helpers join noinstr code as something that
> has to be justified separately rather than covered by tests. Steve's
> answer to your noinstr question in 2024 [1] was that this is workable
> as long as the number of distinct categories stays small, and this
> adds one (556 functions and 445 MC/DC conditions for the config in the
> changelog).
>
> Chuck, Steve, does that match what you'd expect on your side?

Yes, this is correct.

And "small" is a relative term that should not be a factor that holds
back this patchset. Perfect is the enemy of good and we can always
improve on the level of coverage over time.


>>Still, I'm left wondering if these tools should be fixed. For
>>instance, while the front-end emits this instrumentation, the backend
>>could easily remove it again when it finds itself in the context of a
>>noinstr function after inlining.
>
> Yup, we should do that. Both GCC and Clang add the counters before
> inlining and let always_inline win over the attribute mismatch, so
> neither can do it today. We can look at improving them, but it's
> probably outside of what this series can do.

Agreed. This is a good example of how the level of coverage can be
improved.


..Ch:W..
