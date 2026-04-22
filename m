Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA4314B62;
	Wed, 22 Apr 2026 05:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776835824; cv=none; b=t7UulYnLBYT93AoWCQkUrlNkSNWTzl9kJQVGc5RJ7iQYMdNkguBspIImloXEosUAss7l+R77uHIxYAHPsYJz+Mb1xlgcg21Jdr1m2nkZ/umlbKXcmxd//KVveVcu+RLajwNXNpWTww2jnSk3n4jSp1vjgn9BpPLUiBROEtF3DPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776835824; c=relaxed/simple;
	bh=AGWsstsjrREKBSTh+GJePoKEFjOh536dd8QSceSuyZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfmE7ukw8I/1K5TEtcKbPqfVDfV3QiuYSSm1AGYdqxj6C4V1C01j4v29Hll9+P06ibVL0kIhAWVmzwW4j3Ur8Ph7dWXQfwTJMfe3VYTmvIGEcUaCSWV87HHWlb9uon/eN5zyRYwvRRYPb9YBrCBQu0s7TgqsvLuCgH8yDazbio4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWPEqU4v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWPEqU4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEA1C2BCB4;
	Wed, 22 Apr 2026 05:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776835823;
	bh=AGWsstsjrREKBSTh+GJePoKEFjOh536dd8QSceSuyZw=;
	h=Date:From:To:Cc:Subject:From;
	b=DWPEqU4viuqu64WITCvBZvtY3Hat8stM8vBUB5YL5nj477Ady7Qq0FewHARH3EFQd
	 pB+fRT2oO9yA6fQzzSJibINxayBQuQ0EQGxF3vSVK7ukae7/R0W+1ICy11vkQILnbq
	 xl+4FJhG7/dZ1Nws/EPGRL4YmDidyydJVrWjhg/TNe7IbHmH+46UfYfjqltl3RLLrr
	 2yE6dnr5dLk+sHlj9rUp8v5h4Dib6Sr4NfdGevF7vwESlMFogqkU2Jtc3pUs/02d10
	 DOcWwXpAi4Ynqt2+fWVyt9Jg0ahjKvzp1Rr7HOrxOMHYcCTPPUr2DMeKbnoSzgyLAO
	 ZM/QCSxARElRg==
Date: Tue, 21 Apr 2026 22:30:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.4 uploaded
Message-ID: <20260422053019.GA3090128@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.4 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
