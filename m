Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D14137A0;
	Thu, 23 Jul 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813446; cv=pass; b=iv+C1yD+dLrCbGDeOYFG3xunKLRgr3uAM5CwmnH6pP4xZZ8Mm33aB6gU8trwjzNVnM2XjvEQU7n4DRo03kfCg4djKSdVoo394DI7IfrgSaXT+ZABhkHxOe/Mkst2Ij26/hqZLSJAGMADZ7MNFR4Rau/W3G7Xu2wW00QVSmPPfeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813446; c=relaxed/simple;
	bh=voacHPQhxeD9BsoKj33Td7XAOKOjPDYWP6T6h9X/ss4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQsdVAUuN5jRYadRdADHYrF9iNaUVhXAHDecLN9Jyn2lX2rIsT4khB0cHdMl6aYYxNJyD5Jo658Gcj080slKzPbb6z7Bo7b48HGKOPs3NH/GmdWu6PijbhEK5jYCBmZR0Px3KAHHz33t5MeOp5aWTsSBotSEtzF7ml9AICDYmFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoavmoshe.com; spf=pass smtp.mailfrom=yoavmoshe.com; dkim=pass (1024-bit key) header.d=yoavmoshe.com header.i=linux@yoavmoshe.com header.b=ba+dGBlZ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoavmoshe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoavmoshe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yoavmoshe.com header.i=linux@yoavmoshe.com header.b="ba+dGBlZ"
ARC-Seal: i=1; a=rsa-sha256; t=1784813432; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mi7SvsuzYyJOU8mKnjdBo4xRHVdBPy6ZzGrmqFssDLxEFbbAkquLkDP4zNwSOKv7G4R99ptwpNGC9Q0th1Zu4ReAXLtFM4qb02JiyXRoQKAop0CA/59+bjINb578n4lVDa9IVWUdEaRM3RaFCqkqCLWYZ72b7AXKbQvowgbzF0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784813432; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=voacHPQhxeD9BsoKj33Td7XAOKOjPDYWP6T6h9X/ss4=; 
	b=iHYNBINAollBqVdY4JEJjoF8J/0WXzxwFgzcSpqUbJMI1EHR6aA3R4r4Zw3hu0qnwVZCW7H9hRtBwaPynxmofeNeLDv0X4NS0HtAzjfYEflxmdhjS8KWF+Amj7IFnQuHVqsw/tqHvcQwn8Y9q7LLwJBGt0MPsBhG7AILGK6Slx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784813432;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=voacHPQhxeD9BsoKj33Td7XAOKOjPDYWP6T6h9X/ss4=;
	b=ba+dGBlZtfDEbbXV7LEsIUS04v5rVq4XPn+zNMu6Ua9e9QYqwz3Z5mdKpqNMA9bH
	3D9B4bFb+gA/WPbIagPLHe6732cFeG8xQjAGMBC3rOmD8P8gAWU0FLXDMDPlJmw7kRQ
	JUXUJW2pAUAee9sZH3Cz6vUPKgzxJH5XEX7F7+Dk=
Received: by mx.zohomail.com with SMTPS id 1784813428050186.1014094452098;
	Thu, 23 Jul 2026 06:30:28 -0700 (PDT)
Message-ID: <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
Date: Thu, 23 Jul 2026 15:30:07 +0200
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
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
 <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2026-07-22 8:03 PM, Sami Tolvanen wrote:
> As long as the C prototype for the assembly function matches the
> function pointer type, the hashes should also match. Can you dump the
> hash prefix from the OCRAM and compare it to the disassembly of the
> call site?
Here is what I saw when checking the disassembly in vmlinux:

1. Call site expected hash in pm-imx6.c: 0xA488EBFC
2. SYM_TYPED_FUNC_START hash prefix in suspend-imx6.S: 0xd4d4d4d4

It looks like because suspend-imx6.S is an assembly file, Clang emits
the default assembly type ID (0xd4d4d4d4) for it, which doesn't match
the C call site expectation (0xA488EBFC).

Yo'av
