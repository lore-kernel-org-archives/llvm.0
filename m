Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E414749E6;
	Wed, 22 Jul 2026 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742424; cv=pass; b=bYCbH22wrYkmcyjbFibQi8u3PcLcIghgGDhAonxbDPgf9yKpBo6IliBNfX/HbkhATZaVDm4kX9/mh0u3RBIcNbcaJPyowHLRbIWvZMKpxgcjx+95jjR9yTlpOxsWNB4P1did2LgNXeFfAZq1KlZ+kumNydlvkN7abf2NEXoyiac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742424; c=relaxed/simple;
	bh=XCrzWIHXMTC6vLxmZAYmJB0rVPxCp1X90KZnT66wKo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1kHYTEv5Za/mKT+/2g/vsk/qzjJ7mhbjOwPi7ADYOMFW4uYfde96UH8OJDPD3wxk6Iv2llMzEPFxcxklxTmr3kDpZBCtIv6Ah8KHmZr29FyepUtbFrw9OeB/1doMZyJtf2RFGWTcAhN6Vn6aZYX53/POx3zca4uwQ4CYk568VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoavmoshe.com; spf=pass smtp.mailfrom=yoavmoshe.com; dkim=pass (1024-bit key) header.d=yoavmoshe.com header.i=linux@yoavmoshe.com header.b=VNxQAg5B; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoavmoshe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoavmoshe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yoavmoshe.com header.i=linux@yoavmoshe.com header.b="VNxQAg5B"
ARC-Seal: i=1; a=rsa-sha256; t=1784742411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=msFSU0cXWpZHma5l8e1RgE+vsAuTgCi0+2fZtmz2bkSkCak8aCcWxqaxHD8V+IKirv3a9/hpED5T5hW57OKAVI3q7upgQEOcKgWOBQGfyIaSSwQLYjGX9nak33gsU2VKXDC7FONDF/L36DB+9c96fDvaig4/YinNeSocTDlfzBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784742411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCrzWIHXMTC6vLxmZAYmJB0rVPxCp1X90KZnT66wKo8=; 
	b=jCiSzJ7J/PinuTxMmiSZpOKV6gQZKSVlq62LfvVEtNgC62cqMi1ejyraBHr6We+KPolbvQ0CQJD1RSp9S/GA5urWCEbJHsRe59pwqEWuXLMfmbkKpbmkgNZdRoN5aB2pCrxcnxhfsKAESFbgS90Liai9UGH6x3YRoAe5xe8EjvY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784742410;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XCrzWIHXMTC6vLxmZAYmJB0rVPxCp1X90KZnT66wKo8=;
	b=VNxQAg5BokdoSQOY/uISQM8jI/tpEcYc+vHRmCnkNiGXivOucZT3kDX9OihMBQrj
	aClr0C5SbCXW7DI116JO7imxlKcYTrieUV6uxOkoX9rQW5nRSGnImtzCTIoD6Wr54eE
	552Kz3FvsvldHt5mVRFsb4TkJQ4Wv/dQikURjbP0=
Received: by mx.zohomail.com with SMTPS id 1784742407582988.2620092098992;
	Wed, 22 Jul 2026 10:46:47 -0700 (PDT)
Message-ID: <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
Date: Wed, 22 Jul 2026 19:46:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, Yo'av Moshe <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com>
 <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
 <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2026-07-22 5:00 PM, Sami Tolvanen wrote:
> Are relocations applied to this code before the function is copied?
> Because SYM_TYPED_FUNC_START doesn't embed the actual CFI hash in the
> binary, just a reference to a symbol that contains the hash, and it
> relies on the kernel to apply relocations before indirect calls are
> made to the function.
Hi Sami,

AFAICT, kernel relocations are already applied at boot before fncpy()
is called during init.

I think the issue might be a parameter mismatch: in C, the pointer is
declared as taking a parameter `void (*)(void __iomem *)`, but in assembly
`imx6_suspend` has no parameters, so Clang generates two different hashes
for them?

Best regards,
Yo'av
