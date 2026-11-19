Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119324;
	b=5hVLSkpZyTz/uub6aQKrTVuEiD7z1tJSIA7JmXNMKX7ywshRofvIDKTPazngWzCvr3+o
	 iWWg/fkHnlR4LtqRzZcyUfnfWWUzZcHQQWDJZkMNhvXonpyFJN9B+RYwH6LZJgSRn9K4n
	 7aHMxuiTTbI7b3llc/sTH+RV0C6IPFPGasuW+iFoxE5w1YD5oPwQn/Xj+31bo1N4C3y3L
	 VuRC3yim7jvP+zwlEKi63H0dSIMf1qoZ9YpqLgEJXxq3O87tlN46adzgbgPgmg3Art/AK
	 OAjPMMR8fwwU4vlJcIUGsGMwoz6w2g0dG0W0eLWkD1gPv4R8IW11xPUIwISxMNGiASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119324;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=P9e055f8FpXxjQzl7FGm//R08dSOJPOnTIJ1la1axUA=;
	b=1sVmC/rkPmTFLPIstmshH5k9+s13LsK76kRCV5N1JtdPEuaQ4FVmY91kVghlr6zipnxL
	 rIOPOw3CdIJJhV7DCrcIbBHAaOQA0S0aJ8sbCdJHEM7u2AUwjGfnxuNvW7pebhQZQIi4G
	 wXD/iNmOl5XAklChoyOP4YdYyUgzT1opEDTqrVyUMMjv7BreJx4acBvOJryV4K7UTuYLf
	 VvICEploOwL9OG7j+floEIbnOy/pgSB7fc31UBjlTGzgmz0UqTCEYlHrV8LZx/Q6uk/7e
	 LZXUK5LU2AGWIiDHIep/DsaamnZKK3yKMFKDRcK8ijKvLM/F0UVLlBLFPIDNpVbp6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ogf15uQg;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA1606A324;
	Thu, 19 Nov 2026 20:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFA1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ogf15uQg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P9e055f8FpXxjQzl7FGm//R08dSOJPOnTIJ1la1axUA=; b=ogf15uQgRPM94ev6Vw00jNxtTu
	m9k9AqDas+wfj47ZBC7y+u18yATP1jRtfV8PAI3sC7wgzehSU4h4p7Zi6AEe4VNdVbmNW1UZIX4ZH
	Ob2P5AkRpQepIupR58s9etK+rpUXbpsbMCxGvWgALT3XBBT24vhIoDSw39WqcnHUxmjM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU8XK-00077g-Qh; Thu, 19 Nov 2026 21:15:14 +0100
Date: Thu, 19 Nov 2026 21:15:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ian Rogers <irogers@google.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH net] tg3: Propagate PHY reset retry failures in
 tg3_phy_reset_5703_4_5()
Message-ID: <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
References: <20261119171021.1535172-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119171021.1535172-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:10:21AM -0800, Ian Rogers wrote:
> In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
> return value of both tg3_readphy() calls on continue and never checks
> err after the loop terminates. If MDIO reads fail across all 10
> retries,

If it fails 10 times, the hardware is dead, and there is no
recovery. The best you can do is make the probe fail.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

This clearly does not bother anybody.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

	Andrew
