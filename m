Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757613;
	b=k7Qr20q0xmQSJ7FBZqjxkx1F/q3ctqW3pkvnBzViIJaoXtUnComaJMq4vQR+W3Au8gh7
	 w301jrXswkPVbXtasdm8cZHQS+MG5KPLIzkLBJfDN5ajg4MyeC8dgM/4R8g5OD6ExDFQv
	 sBT5ekWBeBGRwd+rPzJBxYWu37bCkwFoGKxnmQaroHVrx5sJqREB+95vNBmm9PlOZ0HWx
	 ZQRqpxMB+BB0j5bqyQ6mHdT6xNz20fJdrljAR2OV+JWUatkC1Spxnf5ja/yOj9vmaOmHo
	 1xwmJyFcNgz82FkBesA1IQFjNoh1r675N+edGiql6GggKAHmT2p/gfaovX+gk3tfH5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757613;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=KqZFJVzZDoe22sBUycO6i0gndHXD7hUTAHTWis9WdNk=;
	b=fMapkiaUvvDDxzA5y6538c6Qd59MqdJur3hFlvUFYMirAKoVQrMMXHTgZIbBI458v3DM
	 pucu6+Riw/KwsTYnDTkkM7dpo/8uY0soy+bCViDEAYGv2ZMSMtGA0OLPDDyTu9OpwZx5Q
	 H8u/dGv0XeFmBB1OzmQseaWcAtRA+UV9Zi6HuSDBKIoq7+TdvnS5TqO+X3FtSM9SgvE4k
	 +5b8Dcuubac7ermBxHnSPRGidhTNQ8UctYdOQL/gC341sNDeq1hHO8SReS/8pgGyj4QPx
	 1Br/Eihqee24/5U4QAbyM4omHyT4lRSEuBJMPhwI7slX8whdXQDWPv4CGt7aGzGdilQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aX5v9Qy5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAF3606A326;
	Wed,  4 Nov 2026 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aX5v9Qy5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B031F00919;
	Wed,  4 Nov 2026 02:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793757613;
	bh=KqZFJVzZDoe22sBUycO6i0gndHXD7hUTAHTWis9WdNk=;
	h=Date:From:To:Cc:Subject;
	b=aX5v9Qy5o6RMCsJmsOcB8Ookjliw4FLw/CaugUWikdhj0oQ57icOdCl8Btoc2qc+T
	 0NxMNoXu7QKWGwLF2Pq363egSXTCLdz5jtwwRhlNF/B77CbVHq553TI+oiEZBKFQoY
	 ck5KbM+KjB5mMPtR5z03/YEQkht4xs3Imavw4zHMnbiyiRgJ4OdFe1JtnzUfkTILhC
	 ouGlMU4e8CKqp34CecLzhxwXTwrg1xiCdb1+vwhgcsU0VSaqzC1SsgoHs7cS67exX3
	 IxgnwBHXjiFr3pl2O4TVrZ80Lz3DN44MgiED8G3Vf2y+UJJ4vyzlxppTMSg/4HLnLf
	 0MGCHVrFkk9Nw==
Date: Tue, 3 Nov 2026 19:00:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.5 uploaded
Message-ID: <20261104020009.GA999555@ax162>
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

Hi all,

I have built and uploaded LLVM 23.1.5 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 23.x
series is no longer supported.

Cheers,
Nathan
