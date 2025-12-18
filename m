Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41E35965;
	Thu, 18 Dec 2025 05:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766034979; cv=none; b=PV7egH4LkmTJFjBrx3/8RBnzycLzmTlhDPzsN4+bWKrP1F9KEDCm51Vh+zQ9Z3Wkz1g7FI1PRJCQ7RctfngtM3GpTVmfqgSDaitJUuBZYGRqYzzO7+960yvl//2YN4NeFTC0aDMpiyRfLJQCNXYvzQoMqGBZnUyyA22GWsBGQsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766034979; c=relaxed/simple;
	bh=lAy+Txv7C3J29fzbqiueZLIx1kwr1T6NPZ/GsXmrjFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dIT1/o6Nq3Spy+Rl4V3nO/j0G9O5E2TtG3qzrzKrTKX3l0/Bgz7P+Qy9pzlEbahjCk1JCQtuAwqLxL+feGDZPVm+BwxJ7XgVaSbSkhmsNxLlSPf72jtMwUamljkHX5foCrzFRV1N65ksBv433ZaV9hdIFG6SEZPwMLdO77A55Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FA/iaxz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FA/iaxz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8043BC4CEFB;
	Thu, 18 Dec 2025 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766034978;
	bh=lAy+Txv7C3J29fzbqiueZLIx1kwr1T6NPZ/GsXmrjFs=;
	h=Date:From:To:Cc:Subject:From;
	b=FA/iaxz7VSJPR56PmY+qDfdO3HsHvgsSQAEoj+Mdn/oN4iInda/V1xkxq4C9RxyJE
	 8w1jpO3qh8oCh/+Ba6ae8SwPmjGdAetOBLLWxTB60mF8F1s5Xh5mQ0JX1D/y2tTdyZ
	 0v2247e4bpd6yqsR4ZBw3HRPw3joSqTfYxUBf35HoK66XTW7lGzPo4wmIUi1mY42JN
	 LA2xSaB66AV1oOjUoymQ5ECvOipkq55yAB3WAQM1zEqQt7z5jm09pjoF2RGwVNGUry
	 9BFX7w1JE/JkHRxg8779QcVvA5g9eVXDe3fSs3XUG8lDmp4gLB3UlqZ6ELBpCeEaj0
	 Ol/OD1Vf8L4og==
Date: Thu, 18 Dec 2025 14:16:14 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 21.1.8 uploaded
Message-ID: <20251218051614.GA2453313@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 21.1.8 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is expected to be the last 21.x release per the release
announcement:

https://discourse.llvm.org/t/llvm-21-1-8-released/89144

However, if there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main before the release/22.x branch is
created.

Cheers,
Nathan
