Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83B33FF
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 17:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCCAC341CA;
	Mon, 27 Jun 2022 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656352669;
	bh=SGbAEy3fdHeEVcjI4t9OH0aKVgiRmHRRIPZJQ6tnnTU=;
	h=Date:From:To:Cc:Subject:From;
	b=uwtmygiZxs5dgALOqGgQQEF6+RkhJVOEmnk/7H2x297pjUtNjP1uUQXM8AI1U6/wp
	 TMhIGZ9M+Mb1Eqc4B8ox/faWrAoBZkMavVLeH59W67zeaKRjUmpyt4jLSad2u/4DEw
	 p8usEU6lZboMXUxUWovbi0YTh6mu6O7a7nN7E8y7pjZn1Rp6Y4+Itr3zDMMxiJl9LY
	 ejfrtirswesU1lP0tKqTN9rheFVTw1I1uC0Sq6GZFVj/b5nDZIKNO6YHWvNBWzdiEm
	 l/Bsr5NOtUTPVQLHi0TY4q+HxnNiI8lDFsN2jCXASAd6BssIi9sVpCc9PyJC3qag5U
	 WInd07GB8W9nA==
Date: Mon, 27 Jun 2022 10:57:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Apply 1e70212e031528918066a631c9fdccda93a1ffaa to 5.18
Message-ID: <Yrnvm6mwtaiKu6Rj@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please apply commit 1e70212e0315 ("hinic: Replace memcpy() with direct
assignment") to 5.18. It fixes a warning visible when building arm64 and
x86_64 allmodconfig with clang 14 and newer (and possibly other
architectures but I didn't check). This will allow CONFIG_WERROR to
remain enabled when building arm64 and x86_64 kernels with clang on 5.15
and 5.18 (other architectures and newer versions are getting there).

This change shouldn't be problematic in older kernels but the warning it
fixes won't be visible without the new FORTIFY_SOURCE changes that
landed in 5.18, so I wouldn't worry about backporting it further.

Cheers,
Nathan
