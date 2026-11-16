Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847105;
	b=t5LofOxFr0ABId8NhEaKb2Rn6EIwtQCT6+UqT23P0dGHy88VkZjzIdG7oGi6iauIz2xy
	 WB8W/PU+rF36AcJNXUQ3MSUNx81NJebKuazDsja9L54IMH5a7b3m4KQ7FV2uy+UQ0/nim
	 rEarrbbdTPXFTsMPo1VofIrnmWIZxuMdca+8q/HtpWMK1mIzsbFA0SBcz6LdfeqMIL97L
	 yAkLYFdJjAgecJ5kPj+9vCqQ6zKIVtHPXmu3goyiVQG2a1BNfXknpfz8ChfDzKhQvP2Aa
	 epe7VDCOfBkJM5FUCeFXu4q4D2ib5fzE1tdTETDg/JrafvsA6KEw8udZ3fBKo/dsz/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847105;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=Q8QORu66E1fOEdS0NKcfFvq27KDFeA88o7om1qczXxufCA0YbsVyTChEMeem+cB7vB0s
	 IwvnXT7UScEn4Zl+DW0bU+W5yldkiUVK7KCnhA+WaCyEmC2pkKXzDH0FdhRSTiQHj5bnO
	 oqRZ4Q5YagrHpfwz/zay6vGCjDIEOH705rwv0trIv2BggqU/KtIiyvS+4yB7DNFXXKymr
	 oOEjZZ8MhxNCZFdOEXsPpm5qYxtsXmCJF1ZmUCv13XvBa8ExlCiJ3GBX6uRsOQYMu4mf1
	 PRs9OTp9bZcP6j/t2a8vx/eWaIEZ5NL61pWoJKa8YsiWO1Q+ZvzMJ1cd4SpsO0ZY7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0u0HAhE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA4606A329;
	Mon, 16 Nov 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0u0HAhE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E541B1F000C4;
	Mon, 16 Nov 2026 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847105;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m0u0HAhE2vHgALPLyJQn+s19K15vsxWmU4r6jH6j7/FdG3DT3xHYH9Lme/VaMTazV
	 rmvImw/083eddYp/wwbVD5LtbDefvltaPDY+2xAKEhK3DLiaqnCLX7ifQmaMQPsyn4
	 r+W55iunhwOoBldsAyD8OWE6v58V/xUK6X3qtdGTYx/97Q+jJsk6fV6nprSlssfFoh
	 NwMtu1knPQTZNi8a5EfYwu8Td5a6GGNp9Xc3BmaUmunes6RCBeQP2x0iA+1+96H4Cp
	 1GuRUmgzg5vtCbXiUsiRZoq1bExOGge/EbSLXiqxX/HVXu3d5pFTVGIvl7y9kMotq6
	 rlgeZXt2OzmDw==
From: netdev-bot+sinfo@kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: 
 Re: [PATCH net-next v21 00/15] net: pcs: Introduce support for fwnode PCS
Date: Mon, 16 Nov 2026 16:38:23 +0000
Message-ID: <179484710343.3291.8760554184074768845@kernel.org>
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
