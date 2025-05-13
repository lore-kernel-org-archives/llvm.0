Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136828D82C
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165346; cv=none; b=CPfsHiGAzuAQ4FFB7+T7NBpSybFd2U9y/9i2d1Qs0rypmgLdZeiwZ6vdusvGX4Ul01NimgyDGilXeUxhMpH6klcSSHgoY64+PwFHtx/PSXEJuGuvdhZSgOzcRLAzdYiUiUpRdsLdkwOoUgr8CWzsJ+E3isUd+x0LwFadO00K784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165346; c=relaxed/simple;
	bh=TRBqo8LA6b8wJf4/AtzcmDPcX7P1Y/FB92kc6kCe82I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pVVA1bcCbpRGOEsgai1uDIKRI07wKXEnsfrLe52oK++WjIsZUOi/4w/6jefaq5K9VRdDDijdg6gHTDBmzrwmUSEtwfFOTdwv+Cvatf7E3LOqcujYB3mR3aPtcujXft8K6cNg40/pCWpvbMKA5rDkfHCeJrAl3sr1DXIuBejSW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cxLMPGYW; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cxLMPGYW"
Message-ID: <7ac6c796-cf4e-47ba-bde3-0f8c6203fea0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747165329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oORfCjjMp0fnf0bcbRrrnwFPePQZmNvhaaRtgbRBFe0=;
	b=cxLMPGYWVPzTxFMRw78DNhHqfwOH3hxsXpMukZ4w8AqwLDGm3QNvqpFXuCYpUPl8Ye4YHw
	D9q800LclkE2zLFSqN1vKgNYLywjbcPtFStoJFUWpGqZlOsWDzKC4Eky3H/KZLoExeAsBE
	t6rTt50Rl0eNCU1ijMLdKJnfD61xUMk=
Date: Tue, 13 May 2025 15:42:04 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 03/11] net: phylink: introduce internal
 phylink PCS handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-4-ansuelsmth@gmail.com>
 <5d004048-ef8f-42ad-8f17-d1e4d495f57f@linux.dev>
 <aCOXfw-krDZo9phk@makrotopia.org>
 <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
Content-Language: en-US
In-Reply-To: <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 15:23, Sean Anderson wrote:
> On 5/13/25 15:03, Daniel Golle wrote:
>> On Tue, May 13, 2025 at 02:18:02PM -0400, Sean Anderson wrote:
>>> DSA drivers typically have different PCSs for each port. At the moment
>>> these are selected with mac_select_pcs, allowing the use of a single
>>> phylink_config for each port. If you need to pass PCSs through
>>> phylink_config then each port will needs its own config. This may prove
>>> difficult to integrate with the existing API.
>> 
>> This might be a misunderstanding. Also here there is only a single
>> phylink_config for each MAC or DSA port,
> 
> My point is that while this is the case at the moment, it would not be
> the case with a "generic" select pcs. You would need to modify the
> config for each port to ensure the right PCSs are passed in.

I reread dsa_port_phylink_create and I think I missed the ds/dp
distinction the first time around.

--Sean

