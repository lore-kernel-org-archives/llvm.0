Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984826;
	b=RNRgkI6DP9yg7K5v3Ci9kTkRwFa1CQI800U4f3Dv4lNrPkUnOCJSzdiaTShZFiAeAyfk
	 A87nNXW9r/mEjBIeh0ixHA1StTw3Son26qC/Vx2fWocwaICdjS2a/kZoGTd/eh/goVwRt
	 BPQJTNvfi04dn/DvGmWvg6Wn8F0fqQNQHl5pts1yrgzq3POUTgBl02fVUDb9XD7eljqxZ
	 sk3nKhy9V2froeNK5VTyYRp6GEdsrQzW9KYbppLXZWemGyyjJtFmzakNO2StxSDjoo0cu
	 x8z9Q7+/IRbRh8j6Lg7ii0uaDGW83KcLUUP8sMJbdqph6Z9zZlSh88ogoe2WijyBVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=GVjhvCQANPZXNUqEqrqDI2Ym3tk3LIbKMI2IcfDz/28=;
	b=bIn4vrbhKdn+D1hd+OB8JN9PDaADPx/JFMgbK6a/66PQvEf/uz6a3wk2mRHgSJK6WX7z
	 T/AoSKDjcvF3knebqPgLeXZYUoAE11C2LV3L2AjCepxRcHME7ibD6BKFPJUtqXI5GqSfq
	 kEhN7nhOdVqWUjyjeK6bz4zAQnNMCyero0UvJ9gOlUyg5N50UEcXeGWzeeo7Se3W66No7
	 Iyp038YC3yO5qs9lBEC2EwKc0Xa8q9fhZcng7kqCuvNfvwCQl3ia5UGcNsZQzALwDmIBt
	 5ZkQ9N2kGpAezUWQfjhyj4z2Qeoh34xy7mOCboyoRWE/rqWzVGPkoFUbGVIi8CXoXQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kjvi3udB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270B606A31C;
	Wed, 18 Nov 2026 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kjvi3udB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3F41F000C4;
	Wed, 18 Nov 2026 06:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794984825;
	bh=GVjhvCQANPZXNUqEqrqDI2Ym3tk3LIbKMI2IcfDz/28=;
	h=Date:From:To:Cc:Subject;
	b=Kjvi3udBU1OF2ENKInAp+PTtulYjNLZ7Jx+ky0niRrYhViYW8yizEtNQ5PQNpqpFA
	 2KqCyN8bqD6DRcpi5tyX0CjhiWd9MdE6J50KfmQMo7arPGxkpgtyIv2/Qw/hKEiYHV
	 gljhz0riFlV4F8yB3CJWuIzvGUCPkDiOxfaMoILci+0dVB+9DYgvrRD9Q0n/0kGo8A
	 ty1+vx2/zn0bYVQoiVtiqGfxNiNShQxVy2jrxFh6YqgEwHjjtO7Lpe7nu26dS83Tsf
	 k81ChTNI4DjR9ElQtNvZOJ/GvQHaUTvDPiOdml6BqkCistIb3oCbDZIlPQp89XrBc6
	 b0DkEtou3gkwQ==
Date: Tue, 17 Nov 2026 23:53:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.6 uploaded
Message-ID: <20261118065342.GA3286928@ax162>
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

I have built and uploaded LLVM 23.1.6 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 23.x
series is no longer supported.

Cheers,
Nathan
