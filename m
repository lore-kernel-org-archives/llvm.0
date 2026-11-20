Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216810;
	b=WRAdxrqLq9hmu4+9b7u0RSOQPnEUNyTEsRLZNFcJFYRBhql/FVNlQI7bpTZLR9g2kkai
	 cR3hi9zHDEIoHSx+PuOfuIdy7XSSEmu0A13uzgl5GBdXgZMsxW4HFws8+u6trgabU+EjK
	 sQHWq/nTQm7rJr9z9x31qNJAVl9WS75seTZ6wwXJ7QT6IMPr/xD7ZIJh5VSfTQ0qB26EL
	 /xtO85fiY6TXVoRTMzXbw0eDjyiPmgaYJJYxZGZAyKF1QYrqPjxCKnPoD95BaVedGGYRu
	 AfSBTxAYqeXnkJiV0FDDMlZMy+J1dxPlK/9mVGwyoDGuaxOlqsv0R3tkFQaLp9hfPIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216810;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=waf/QP8UbP0Yf6ba0MmK6P56Sl8Bk3zDX2bpvJGLf3c=;
	b=ndqGp98tmQ4X89s6JdsnT8qjhJyHfO38IUTCk0aCLZQFBsJe/iqycZ+VkOWBCYvZxdec
	 DlLVzub2ewZ/5fZUfxjW5cTjud8uSbAUJt652AJn5mWloY0W9ubA03PDnBxpTrp1WGCCl
	 BLSaiYY4IFE8h3vcd1VjyGfI3kKi5XvWsj4LZEPBEU5/jE2Nm3zuXRzAudwbKp2SpleHI
	 UAvdZmiGx/XBpZ1it9+nMMEY2+GosWBK5detkzZWiTkBYSJQ+0UOOqvbM+AFHh3Sr8OCk
	 dLvf0dJTIwx1cOlCsQG+cEFP5gjK0JuB/U1mcpSB8bIQSqs/vGMXJF0hP4yYswZQBsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uN1EsryE;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B220606A6A6;
	Fri, 20 Nov 2026 23:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B220606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uN1EsryE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=waf/QP8UbP0Yf6ba0MmK6P56Sl8Bk3zDX2bpvJGLf3c=; b=uN1EsryED8C3smN1UCouGn6lhk
	2ow0hbiE/rS4yaUiCPUJUrlsccukhqrI78V8SdTpKbGPa3ksTU/2/3Rxht9bm3YIbzioGYcGNDssw
	8P0BeoUloAta5M0LvRMCikxZArM1hNB5R/vRPIL1XdFJ/OhjAJ3ScsmFD/++saiHUYEc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUXtg-000O9j-Tv; Sat, 21 Nov 2026 00:20:00 +0100
Date: Sat, 21 Nov 2026 00:20:00 +0100
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
Message-ID: <0e7f236d-f85e-4890-9f39-62547a305e39@lunn.ch>
References: <20261119171021.1535172-1-irogers@google.com>
 <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
 <CAP-5=fX3AE_XyUbiZx+7umZGH0ER_hjJwGs+g+Afxk4A8JuyLA@mail.gmail.com>
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
In-Reply-To: <CAP-5=fX3AE_XyUbiZx+7umZGH0ER_hjJwGs+g+Afxk4A8JuyLA@mail.gmail.com>

> Would you take this for net-next without the Fixes: tag

Yes.

	Andrew
