Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E453594F;
	Wed,  3 Dec 2025 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729896; cv=none; b=E21C+g/u3PAnNL9KoZd8D7nxXe4mu0TTCKbzrfoMLzd9Mh6rGOF7Blh7XFw57NnGAUxz9xZHDH9HgS70GYDrTmqFNMAudvIT7LW0GO1qQhQllOrVbLkCMWjdx0meSblJYR1RAIRt+dDxwL+6LbzKW6fzvVUwqqZBCLoellVnb1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729896; c=relaxed/simple;
	bh=RSkJHKbl0YtMziLlzfgGvIXAd9ydfgac5vKrB1AABA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ggl2P5/DFvQGpx1zaYj+DV7jwpBejRHItGUNuMprP2bm3I8ilUPNZIsUxFLqImIlBNoJB60+BefR0gKaP/SfpEdTsF2QzJnt4QRpYiEP1DZq/LQmwDHT+0h1GH6XK+QLULPXw3TlRF0cs9s+AYe6Tj7mjLOdDvABE2EdRiLaRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQcQ6lIr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQcQ6lIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E755C4CEF1;
	Wed,  3 Dec 2025 02:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764729895;
	bh=RSkJHKbl0YtMziLlzfgGvIXAd9ydfgac5vKrB1AABA0=;
	h=Date:From:To:Cc:Subject:From;
	b=iQcQ6lIrWd6688GFH3YbWiZgjD+1B7Z1zjiSPMDFNC0lDpM7YHkuJDyKpOJBICR5q
	 m3xP3D7S6lsEDuYn9xbcjjyUfOakAI5IUwhlFJo0HjDpuSiOSxIM8U/LFFhyQvMqHb
	 mrwZF/Q+zXIoN5Klb+o/hJDbC/b5+3hhLX176UHiw4DgNfTbQRIlTutSLvNxbZXAlq
	 /1WPpV08queUAv2qLcOf02+tw04uShwBTz2x87oCXPEPVt7Lbc+cMtLFjYJJqwciGF
	 aoAyWa87r6Wlx7B2kb/1WZqJn9CqHVjSxRtNllJkTn9mV5Hk5ciTHP71U3UP35KZ2Q
	 uQE1hBlTPGGMA==
Date: Tue, 2 Dec 2025 19:44:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 21.1.7 uploaded
Message-ID: <20251203024451.GA1766218@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 21.1.7 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 21.x
series is no longer supported.

Cheers,
Nathan
