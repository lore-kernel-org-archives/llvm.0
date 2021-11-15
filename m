Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD18772
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 18:39:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E9F56358C;
	Mon, 15 Nov 2021 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637001563;
	bh=YzSe0P+m40ENZCo39sw8HHQr+SXp95G+GuFq3/eFA8k=;
	h=Date:From:To:Cc:Subject:From;
	b=Ikd3/hhwRUjxc4xM/BsQdL+SUDq3+dUIH4NghxmT11mZp5U5p6tDeUhm4udNlk3x5
	 bOAoc24xLhfB2McIMUUKt9MAxZnl0jg+QmVFkle22RqW9IdFNWMKyJf3Ng0taXCkQV
	 o2qIkByhc8LfW5MxZbbqmqJ0jI6YIIGo8X9La70PW6y4E5HOfnsibCXKgR9fa/Z6il
	 yZ0l2RHkI4cRznu9ZC5rIxpRg8NwJwMIM02E7IoHLYQmr4FvZBD6dcrIM79nrpVlmM
	 a3Zrf5al1u/ylvvpHy8o7MCjGEp8DI7tqcWUa1Lq4JukQ3BpwtcqlvBn7g8OxcoapE
	 xCaF/x/6JuWjA==
Date: Mon, 15 Nov 2021 11:39:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Apply a52f8a59aef46b59753e583bf4b28fccb069ce64 to 5.15 through 4.19
Message-ID: <YZKpVkYpYfYfHD50@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

There is a build error with newer versions of clang due to a broken
FORTIFY_SOURCE implementation, which has never worked:

https://github.com/ClangBuiltLinux/linux/issues/1496
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/1457787760

Please apply upstream commit a52f8a59aef4 ("fortify: Explicitly disable
Clang support") to 5.15 through 4.19 to resolve this. It should apply
cleanly.

Cheers,
Nathan
