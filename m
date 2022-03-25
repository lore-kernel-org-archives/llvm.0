Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CA23DA
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 15:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4764DC340E9;
	Fri, 25 Mar 2022 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648221682;
	bh=fZLSxkTLgAiK9WvG/RQ0cuXLjxC/5xxA+lzUtuM4vbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5Pr1ZZivo0GKdqsTwQFKfIXZ4ecCjak/7T2iCGT4MofX3nAXY/l6i2lzSogxDS6q
	 53yg2BmTDLsypt60JV/wlPHvNCKxF7x0kEkMFm6I0Din0rI2/llOni42XCch1X2juu
	 gT0xMrelTdPWZH8ha1FT6P8ZuCG5K+V0NwCiwH1i8I8Z677HtCguQrkAJmha2OCeSZ
	 ZX/GJt7vLr7CDFMKDPusEtwIcJ8GBzi3o6P98lZ5Iu/rAMaajteJ6C+9boROuHqyhN
	 BhHikS5GS6CZ8pHG5C5O6fRoyhZo0fVvNTsnfXrkAb7ccNHCpXuE9qwHcuUTAzEoa0
	 N7MhAsDICTMGg==
Date: Fri, 25 Mar 2022 16:21:17 +0100
From: Christian Brauner <brauner@kernel.org>
To: Axel Rasmussen <axelrasmussen@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] selftests: fix an unused variable warning in pidfd
 selftest
Message-ID: <20220325152117.mxp35mdfxcgsow6a@wittgenstein>
References: <20220324223929.1893741-1-axelrasmussen@google.com>
 <20220324223929.1893741-2-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324223929.1893741-2-axelrasmussen@google.com>

On Thu, Mar 24, 2022 at 03:39:29PM -0700, Axel Rasmussen wrote:
> I fixed a few warnings like this in commit e2aa5e650b07
> ("selftests: fixup build warnings in pidfd / clone3 tests"), but I
> missed this one by mistake. Since this variable is unused, remove it.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> ---

Looks good,
Reviewed-by: Christian Brauner <brauner@kernel.org>
