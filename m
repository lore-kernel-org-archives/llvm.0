Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297A233FF
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 23:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB87C4339C;
	Sun, 19 Mar 2023 23:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679270181;
	bh=BWdGCWEp2yVl8tNAZDFTX192dcSZglyJrUGCKfp8zK8=;
	h=Date:From:To:Subject:From;
	b=rfs6Du/aMqUksUzpTcx5DAfEM5doC+x+ofKA9a5oe3FV4Sypo3z+LKQhjgSmYWm0Y
	 UA6Ic72XLXznyAXZ5IhdIVzyMCe7q8pHB6aEm+rRh8HuNhOFoVWav2ZNw5mpyA3Brb
	 NC+Zd8f4DX+vNvGfGdWkZ0NJGlMfpslm885Jby4j+FUssFUD9MmlE2pjy4O/SMtNCf
	 +sQDjI+2BPTjoohL0kLlHQOQjz3/oHOfxUzfAeQlPND7wIWj1dz1C8rupreyImbosZ
	 IejrtKCxZ49byqMqs0s/U0dUSHnYvi1GHSzKDQmzKM2YM+YoAbpdVnb8z9PGT7U/TT
	 8T3+Ar79eD1aw==
Date: Sun, 19 Mar 2023 16:56:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Slim and optimized LLVM toolchains for building the Linux kernel
Message-ID: <20230319235619.GA18547@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

To make building the Linux kernel with clang/LLVM easier and more
accessible to people (since distributions tend to only package one
version at a time and it may be old or have bugs that have since been
fixed), I have uploaded some slim, profile guided optimized LLVM toolchains
to my section of kernel.org/pub:

https://mirrors.edge.kernel.org/pub/linux/kernel/people/nathan/llvm/

The landing page should have all the relevant information but if I need
to clarify or expand on anything, I am more than happy to do so.

Due to benchmarking the compilers against the kernel during PGO, they
can handily beat distribution versions that have not been optimized:

https://gist.github.com/nathanchance/8d1abed70077ac92cb198ef32389072e

I aim to keep these up to date with the latest stable versions of LLVM
as they are released (so 16.0.0 will be replaced with 16.0.1 when it is
released, etc).

Cheers,
Nathan
