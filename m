Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B50EBE
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm9B7Xc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA24C433C8;
	Tue, 17 Oct 2023 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697568257;
	bh=HHWmZex85cU8yXPYiJDJZTnRVlsuP4p/QwDdyX/F9hA=;
	h=Date:From:To:Subject:From;
	b=jm9B7Xc8CDGRUzkaEt6w0STR/qaTwK6wPyk4fvatOulGsl4OtJ36PcdD4X28IHmD4
	 pCWNzcDkTNEKbP4BB/TPED05FhI4/DFiQ+CVm5gg9WwjCST8Aw8HCbERya7Lb7pJPG
	 E2oJR5RxWCe6/6d+ZxGsyAPg8oOOpmu+lLBeypYrKL9O0wOg/mGwbXMJjCChdszwZ5
	 vvCxQxKH/EApI/9tBs9sTKwjmw6aDXxvVuaSaNheqb1AhG1BrlomMjlk6ozerIVKt2
	 10cfAPFFCJpBdYb1mJ/4UD2+xoEwy9NgNctIwZov2oYPi1HWwfmB7xfgG5/RdoQbw4
	 X3q/lQqe9yHxg==
Date: Tue, 17 Oct 2023 11:44:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 17.0.3 uploaded
Message-ID: <20231017184415.GA1667503@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 17.0.3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via
email or https://github.com/ClangBuiltLinux/linux/issues/new, so that we
have an opportunity to get them fixed in main and backported before the
17.x series is no longer supported.

Cheers,
Nathan
