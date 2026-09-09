Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623A23C4F3;
	Wed,  9 Sep 2026 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925716; cv=none; b=SbL3td5aKIgYfOjblPkwR+0a6C0zWlAE6eVw1qXjsoiJV5I/8Sz5xIAM34DxNivkSqgNVQfcqzYr8cDz9+UM6KrzOwMtmeAvM2w0DfFlddSVY4cPNJIz1WsaM1CDlxbhI9/G2L3gsU7fp6aRkeBGSvaYvypvmI6GfbcRVBMwseg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925716; c=relaxed/simple;
	bh=jMl79+f9NqfwnhyA4IrjV3KtrtzX06Ynl3cdO0eBOuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0nFNNIRwVCdY/Pk6/TD6HjDi5Zy96Q7pIC/md4QRAJop4+esI26h2LzDbvQHfY15Jeu39MjlwqYVGd3cYjeFNL0vNn4mbj+RsfzAt5GBLn5X7SyzUe4qSchyb791UTwCs4OXbZXt7Ha8Zs3uOiUf1ayKwmeEfKFDn4LVbMahKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyOkiPuW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyOkiPuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A871F00A3A;
	Wed,  9 Sep 2026 03:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788925715;
	bh=jMl79+f9NqfwnhyA4IrjV3KtrtzX06Ynl3cdO0eBOuA=;
	h=Date:From:To:Cc:Subject;
	b=gyOkiPuWin+P8khKQvWgYanACMdGIQ8uer9rgZ13azjZUhe5c+5cGVFPMMczsgwfK
	 5qRvXimC1s8gf3nHbA45VsDltbU9/yK6fVLzRUD54+Vf/fBfnyAgM1kGfWUleLQ5k/
	 wVBI3u4Xr7LgVvMYqb8AOSRw6tIkPKGSkA8qbKjfHB4sNYFlJVWeZRiPVNl766o9y9
	 Hd45t9K4uZfs0TGeWqS+C0/N5yPtulzjS7QCjHDNy7rlygc2ZJ674XdsbMvSpRGq+F
	 9HoU79mO5OSC/76ravO7wboPKKtvNMxYGqIGNjvFdxIkgT8jrjkYpQORzvtcicyONx
	 M4mgwhD53j4xw==
Date: Tue, 8 Sep 2026 20:48:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.1 uploaded
Message-ID: <20260909034832.GA748182@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 23.x
series is no longer supported.

Cheers,
Nathan
