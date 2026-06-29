Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46963D6CC7
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718120; cv=none; b=O8we0+jRtyFZx8B1A16yH31FCq1ysW/qyVCtZd50mq3z/XOOO3YANSyRVn7N4iF7V1wD4tSjbIJwn1YBGsZT9r2zLDzVzBUNjGuNCg2PKsfYBB7jFMTyEfiOItmC+CAQ8asTFihJhYl1vdAfshnsXqaGsR3dFXCZ0Nv1fBPLpLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718120; c=relaxed/simple;
	bh=rZvz0aou+WZ6xfcW7DezVt52N1axyhsLIrxTaxT5eWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJNuVOTig8ADYlGbPU9ykiDOvHKcL4yCRt9x9hU+bfms5SOHQViiAGd78gfNBoJ+HX7tUElXXUE0tMrF7whatZWypX80GEEkuLkB3fbsa0jK1UP3qvEUCpSP+tzbfBrj7vS1hF+8641Cgc5yANqvL+XTE6wOm9aTATcGzkcl/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uJzRZS/e; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uJzRZS/e"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A0E1F1A0C9B;
	Mon, 29 Jun 2026 07:28:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 684445FF96;
	Mon, 29 Jun 2026 07:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60445106F1504;
	Mon, 29 Jun 2026 09:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782718113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rZvz0aou+WZ6xfcW7DezVt52N1axyhsLIrxTaxT5eWc=;
	b=uJzRZS/e5R+g0fsbl5WTvQKTKVP43DQ+Fv4j4TKDsgOU03SLdpkMV/v/dIA5Ic3OLuSXl4
	jStlfqA4nT5HzgjPB5OzmeZ8UOlDgwJr2ZW1jfw9G2xQjPjZSd6mFulSBLZq8aU8LG+Y58
	jvMQi1v7a26BOOnPUZHJvRVr6+7Mq56EPv//Z1knFTFGzxgb6XV7w0Y43h94fndPuac8cj
	n71jYXg7dbiuVaavrBCRORkBtZrSZW0aUp/s0ZRcbALbE5Zs721ShQIHjGC9SusDZsHrRR
	Xs9sWzc5aOHJ02GwWiC5LkR19929fMNP1ZJdo4SgYzXHPDg46qqsXYoRWbrgpA==
Message-ID: <af735626-e376-453e-b215-6d0eddd5868e@bootlin.com>
Date: Mon, 29 Jun 2026 09:28:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
 <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
 <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
 <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>
 <6a421c2d.1e0bfc4f.b2eb6.06fb@mx.google.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <6a421c2d.1e0bfc4f.b2eb6.06fb@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 6/29/26 09:18, Christian Marangi wrote:

> Nobody stops from implementing custom parser in fill_available_pcs and
> return a PCS pointer created directly by the MAC. (In such case late and
> release won't be needed as everything is present when phylink_create is
> called)

Ah alright :)

So my only request then would be to update the phylink porting guide to at
least point to the PCS documentation you're adding to say that the select_pcs()
op is deprecated :

https://docs.kernel.org/networking/sfp-phylink.html#rough-guide-to-converting-a-network-driver-to-sfp-phylink

Thanks,

Maxime

>
