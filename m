Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788EEA5
	for <llvm@lists.linux.dev>; Sun, 18 Dec 2022 11:12:36 +0000 (UTC)
Received: from SOPL295.local (unknown [IPv6:2a01:e0a:a6a:5f90:5db3:4ad4:9c19:1e87])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 727245FF3F;
	Sun, 18 Dec 2022 12:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1671361954;
	bh=MZvIcX8wDL2sCtiXzzXYQSPZlAoLes/xpj9CwN5iLvk=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=J78iWl+PtoFUbkd8XVnkgciX+SkysPVkDKde61bSoIKgB/N9v6y3KhrTB8UDChnFQ
	 MrRxZtwO6dnk3OSZbfZ4307T6R1RUrN+25KMy8dWahYjD2y5WlOTl6Q4akxXNgNgV9
	 yWCJRM8ABE5O8LEl0OBu2Uxe0bYQVDPfPd+xt6RqTJPxYLjzOIkgFgG+KeVtATnTSh
	 ESkMdOdD3A1K7Gy07zjnxWy9G6UBiUtnVou2Z3kbUS5YDtQYLtajIdGh6bSYdBzC/3
	 d/dTFQ7vBSRwrzicJAmGJEKL6t7B0Uis5zpDQTjuzhhXSG5uK4g11bOsDCpZ5gzzD8
	 2oLRMBXOfrfXw==
References: <20221215160747.2173998-1-arnd@kernel.org>
 <m21qoxiw9t.fsf@free.fr>
 <9a4d34d4-f78b-49f0-a57a-b80432ad652b@app.fastmail.com>
User-agent: mu4e 1.8.11; emacs 28.1
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann
 <arnd@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, soc@kernel.org, Russell King
 <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] ARM: pxa: fix building with clang
Date: Sun, 18 Dec 2022 12:11:26 +0100
In-reply-to: <9a4d34d4-f78b-49f0-a57a-b80432ad652b@app.fastmail.com>
Message-ID: <m2wn6pge3z.fsf@free.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


"Arnd Bergmann" <arnd@arndb.de> writes:
> "MRRC is available in ARMv6 and above, and E variants of ARMv5
> excluding xP variants". I'm not entire sure what "xP variants"
> means, but we do build for ARMv5E, so I think this is actually
> correct.
Ah yes, and XScale is ARMv5TE.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert

