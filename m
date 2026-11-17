Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919419;
	b=rS/GdHGFuM283nr4LwN0b4EuJWJEQvrByC5CwyVQVq2J22HWOLQ4zXePE3XDGi5FaK++
	 Uw2zGVPz7YQf8DlwVXIVsSMEjvNPGmw7KPIDiD+k2WrDf5Us7UgXah35sSJvMRALvFhDK
	 XlY4rU4lcNcjGYCwp7eDnS4TuUVknM40Cnfv4w2zUKZzkKN2PiBpKaNEAkEdWObPwEQ1/
	 3vw+aKrdXFUC2whEsNEKIFYnB2fdlQM9kGQSWfipbxk1uXd5OpmZdpzEWhiMTMx6toKAw
	 GBE+By/FDNeLVPFKcYFVhwlXipFGFBXqaS3/YZJTrJ5H94E5IaWpn+4oSn1L8oj4diQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919419;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=XaUQ+Hz7LWKdW7tww8BU5TIlSCF9jq9TzJDir8QTBvgFHBsuq1L+3jLQpU1S9XXW2oml
	 qh8MhjTk8hI0K/KqWqW9Y0xYRLvrl6RKSjgPfh6fyWyBKRQMNNc1XUfqDm003mCUlNTAr
	 JNj45LxbY1Nlc+hEuuXuarw5qEyDi5BrUQsF+CdYppdTtKecZYQV0/mutRXqNFge/+vTV
	 SXUHTWR6OA9I9J64O68/DeEoFBmfa5Bgap2JxKbRCXraZT/CsTJ4w/fq9/KZCr4UfEIo7
	 iwh9CZZAU3H7fGsfwyE7OK1jwyOLjwuxkWy+9iKoqDez1gS1wmLsJ/gh/t1uVq6BzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0ZJZSxj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22993606A31C;
	Tue, 17 Nov 2026 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0ZJZSxj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531451F000C4;
	Tue, 17 Nov 2026 12:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919418;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F0ZJZSxjVOeL7JI36iP3N5KmCRyTdKxGy4h01DD0QtpjhX38HONSEFdXyV0KyHRZJ
	 kWrsnpi2pzMhgPlK/V2c0eO6aaf5WyUhuK62ERJdt5L7cPzxZjTbXW5ZjVLMM4nfee
	 PRuhR/Ywc72hQV/m9h4Kge6Jw1rRgPFAaUpdu7rHq7K3mzfBdeK+OohYwNHXCp+h+w
	 ySKZcj+G8WYbxgO7DgepXgNdP97DMaD7AlYMjW3dY5+aAwoh2sVNhWNFmF1yNObUiz
	 rDNuEETZY5ikvWQHgjMnGmBqgW2P9GrDqenOGzgkvWoiJDrDc/BWAPS5Crf98cesYe
	 8hk9wsBmDsVrw==
From: netdev-bot+sinfo@kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: 
 Re: [PATCH net-next v22 00/15] net: pcs: Introduce support for fwnode PCS
Date: Tue, 17 Nov 2026 12:43:36 +0000
Message-ID: <179491941687.3291.11313796890436002644@kernel.org>
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
