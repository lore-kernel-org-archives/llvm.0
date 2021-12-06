Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599C2C80
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 16:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3964C341C1;
	Mon,  6 Dec 2021 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638807880;
	bh=/Mgs7YPYx7IVvg5XnoT0obYV6pV6FY0D0V7pAeb6GV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEdhsDg8m2b6Va5Q4bppyuJTX/3PmskkYjp0saqWfdXZn6rZIy38tYjaMXqgEUHK6
	 G/V4SBaTMsxZDQjczI5+fe42pi/rc2h3izqs/A5U9gFWLrUM8rj5dm54UWQkLzwH2B
	 4nmAeKK0+WcsR7Or2lsXUGswtdIcXNjWG6vF243J99kYYuqxfTZKv6xk3wjnc8flQg
	 2FWL7qDivkWki7uxAmrZEjMStS1lTEEWM53xH5yh/FqPtoziNRBT62vUlKH5dlpzsM
	 NiHfEiquztMSih5WPCQ/oXysEITYSi6bnveDt98/Po0OC3OpWbh3sRbxyuBtbt739o
	 7mv2An+jF3oFQ==
Date: Mon, 6 Dec 2021 09:24:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] selftests: vDSO: parse: warning: fix assignment as a
 condition
Message-ID: <Ya45Q9hLPIaociYW@archlinux-ax161>
References: <20211206102931.1433871-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206102931.1433871-1-anders.roxell@linaro.org>

On Mon, Dec 06, 2021 at 11:29:31AM +0100, Anders Roxell wrote:
> When building selftests/vDSO with clang the following warning shows up:
> 
> clang -std=gnu99 -Wno-pointer-sign vdso_test_gettimeofday.c parse_vdso.c \
>       -o /tmp/kselftest/vDSO/vdso_test_gettimeofday
> parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
>                 if (g = h & 0xf0000000)
>                     ~~^~~~~~~~~~~~~~~~
> 
> Rework to a parentheses before doing the check.

This part of the commit message does not line up with what you are
actually doing now.

> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

With that fixed:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> v1 -> v2: fixed checkpatch warnings
> 
>  tools/testing/selftests/vDSO/parse_vdso.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
> index 413f75620a35..fdd38f7e0e43 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -62,7 +62,8 @@ static unsigned long elf_hash(const unsigned char *name)
>  	while (*name)
>  	{
>  		h = (h << 4) + *name++;
> -		if (g = h & 0xf0000000)
> +		g = h & 0xf0000000;
> +		if (g)
>  			h ^= g >> 24;
>  		h &= ~g;
>  	}
> -- 
> 2.33.0
> 
