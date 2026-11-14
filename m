Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662883;
	b=JQXKFqvRXUAhRYm6pLePITq23DcUknlLGCWk6Ra3y5Km2AVMrqJu7Af6Tt/9E3wxyS2Y
	 YElnJ7ftSpb1LTnzSKYJumh77uTg8/QTbFDEccKP9btlwEZ/Ddri/tlNKSXdh7Ju7Z6UN
	 sDiILZZGHuAHH1Q4DgtoIRC4nlKSPoH6MyDLQox0uM9dL5u3eRHr7deLEB1fl8qHi5NAK
	 9p/ztl/B4iF8yENC2pw8rYjlu6m8BIxJXBIoMzqCU8Hd2geZJZOH6ww9havE1q1JdhFLs
	 6x3YNZlRF0uGw6atsZZPIUdWv+1Lfnjn1oy//KVvvkIjSP0ISe0bQur0rdOn8aBfbtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:
	 In-Reply-To:References;
	bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
	b=G2JMpwPf3QvjBP7Tp4ESp5SOJJe8igrCtJHxPKfXs40irAcsVVOfD4CLVkbVodNHdfg2
	 1SKXDFtyBtDBRyfSxZppq7AiTe1AsqGlIqk+VObz8vEYNxlq4I0D3fOJNOaa1R/fNTMkx
	 q1Sv2awn91YZl37dkNcbcquiunynK+xO0gIY+wT4UVhBpsWSEAeeLAZIkUfdHehpx9BLY
	 JAPoUm5SNY0XhUl+FUgpsb7m0SGzE4qEph6IiRtWFkcuS9W8DobYKWab+9yMPUzO70PJg
	 GqyvRVXaVqq3txizjuLwyf83C3i6KPGhEJgG35oA2fMENhwZhVUQBAY4IL72x7Mh+1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U;
	arc=none smtp.remote-ip=91.218.175.74
Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD2606A333
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 13:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AD2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794662879; v=1; x=1795267679;
 b=wBAQqr1UDyU3stJVqU9DxG5eszmFIcq3qH+qxe9rHQHOh5WReHXL0sIEpiKTocxXHc/h852W
 Lv3v8ViWLsm8tfk8hsFZHv4fR78V47Jh8u7Es8iS50eMsSSsv83DbT+K8PeMZoV4iX9kMV5i5bk
 mE0u9rxlrzjmKBPSHY2Lj8Pw=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8b8a5b5b05980967;
	Sat, 14 Nov 2026 13:27:59 +0000
X-Mizu-Trace-ID: 8b8a5b5b05980967
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Sat, 14 Nov 2026 13:27:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <4427785e421caa5ceba5b64ceb7c7e4cfdb607ec@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next v20 00/15] net: pcs: Introduce support for
 fwnode PCS
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>

Am 14. November 2026 um 11:43 schrieb "Christian Marangi":
>=20
>=20This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
>=20
>=20At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.
Hi Christian

Thank you very much for taking care of this!

sorry for html mail (have not found setting to force to text in
linux.dev webmailer - if someone knows it please tell me).

@netdev maintainers:
is this now in shape enough to getting merged? or which part needs to be =
changed?

Some boards (e.g. mt7988a based) are stalled because not having network s=
upport
yet in last 2 LTS kernels due to this part is unclear/missing.

regards Frank
