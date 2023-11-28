Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0835273
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVRZfQyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA540C433C9;
	Tue, 28 Nov 2023 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701200952;
	bh=0qWlYEm567iXs2eilOwywh8HaHw/1Ci10DOobagq90w=;
	h=Date:From:To:Subject:From;
	b=uVRZfQyNaIY1fO+CxL69EMBilKbmSRNS4PeKDEu/nfose8V4S6AXiNSMapCSNNnzk
	 BPc1dq5kaFAcN/dSRkN3W1QkXhMJ+uUPJkaeoDBstvAHnbDi1S4cYUjkxcuhSYD8wW
	 q/3E9wCYqLoloKlW3YdRjamsIBJgsqTcRg3GKLJ53qpU6h0rWfKBq4Z2pNqwJKCKth
	 CHaFi0t+kMYBkzbm4LRad7Kz1FNpFzjnsXbhRW62La4PWxc/HJ8G+Mi5UF+KaQDZ5Q
	 TKon4Fo/JeobuWmY8tWT9Qnhy/yy4reA1WNy31CEwDKYSGImyz5nTTA1xe7/NLAbnu
	 f0Mf9rt+EXl1A==
Date: Tue, 28 Nov 2023 12:49:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Prebuilt LLVM 17.0.6 uploaded
Message-ID: <20231128194910.GA3062541@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 17.0.6 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new. 17.0.6 will be the
final 17.x release before 18.0.0 in a couple of months, unless there is
some critical issue uncovered between now and then.

Cheers,
Nathan
