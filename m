Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FB932D0FC;
	Wed, 22 Oct 2025 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131628; cv=none; b=cw0+aoj1ZuM94QQYJwy+ZoKrbPoe8b2OMG/TjcSkS4DI98W0yf8HT3OLklDble1WQ9dEfs+z70bbN4+nMTxLmZCdoHBHE9ed2p6GUWmQwjLgcvJhMiTGZLbDWNR5Tc9sR44WQ+rxBXfg6K0tOtmIYtbp7lOShfqaWCD0NuUQf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131628; c=relaxed/simple;
	bh=9JkqHbXtWKEBzKWtvut+xcrPkmaGyAQi2qgKw3sS3OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDqcCO/g8tqQaO44uAuzZRRpkmUp+NxKskXAhb36gXAtS4XPFM9zJX71LZBk5fyIez0gBNwfZrlHSAkHCcd+MWBRQ7lAW6mRCBd6gbyKTriJ961us2CSrfw5VCklzWDL1ctP0d88H4Pa0WlkCa7PqKmEyxN3gCX/9vzmXQtnRDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTW1M6oU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTW1M6oU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682EDC4CEE7;
	Wed, 22 Oct 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761131627;
	bh=9JkqHbXtWKEBzKWtvut+xcrPkmaGyAQi2qgKw3sS3OE=;
	h=Date:From:To:Cc:Subject:From;
	b=YTW1M6oUVzOB6nL61BQsQqax0tIXI0AdorzkPGjuq2Hp4EJge8m+zyDGDAxddLOgY
	 /c+UtrEb7fk/Pv8vlO4bdHTUves9hJbVby5v0tMul/34qqPTktvJm9lwGbLo1vbdET
	 iky5LBIRFd+NZfd+MD3sOtnKKSVb9LcAFOqSpj65zJFbesSgpIskj6Nea1F6GGergm
	 x7E++iFftDbqv5wWlV4OivlYGcf+B9GeMBeY8V6E+pQlQZDs7dB5BA2rKeJLAvxNPI
	 MKxVzx4cLcMlZ5L5LLk1/OmpD38/FqX/ZsHpvzzPmNRipvoDPPJtfQLImr8DzgsCjJ
	 P/YYD4nr0+e4Q==
Date: Wed, 22 Oct 2025 13:13:43 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 21.1.4 uploaded
Message-ID: <20251022111343.GA3803433@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 21.1.4 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 21.x
series is no longer supported.

Cheers,
Nathan
