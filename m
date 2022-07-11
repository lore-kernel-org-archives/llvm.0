Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB052F33
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 20:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E464C34115;
	Mon, 11 Jul 2022 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657571701;
	bh=H3ZMMu+n8X0deD4cYrrflgTwCGdWr0F0+bwRd+0O5Z0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oxj7bwuGiZA6nllzA9QD7jkeglajNlfVZL0H0o7zi5LKxWZmyQGpwLOr40DPzAQk8
	 453qQrf4cvFrhnPu7+uojeHCTwZI7HC5uJ3hxZGzD1RGlZrk1E3UmGiOVYX5nisMef
	 VFF2bq3sLJtiiZFwLU+viQLn4Ux8wev2eyHpAeReCZTHGr9S72rDTmYNK04vGub/iw
	 RJxcqi5zSPZUsmyV1gKg/UZsbcOJy1J0F80ULQbLntPGRJhyVdZ56JDHHQwM2ogvU1
	 UqF/piISWhlp+qioz8MvkVjTI4STnnCxQfWmPes6/0JPbIhxRthBZ9/oCX1ZPQOWUU
	 j7Y/+SZzXfJjg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220711174004.3047516-1-nathan@kernel.org>
References: <20220711174004.3047516-1-nathan@kernel.org>
Subject: Re: [PATCH v2] clk: qcom: gpucc-sm8350: Fix "initializer element is not constant" error
From: Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>, Michael Turquette <mturquette@baylibre.com>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Robert Foss <robert.foss@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Jul 2022 13:34:59 -0700
User-Agent: alot/0.10
Message-Id: <20220711203501.4E464C34115@smtp.kernel.org>

Quoting Nathan Chancellor (2022-07-11 10:40:05)
> When building with clang or GCC older than 8, errors along the following
> lines occur:
>=20
>   drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is no=
t a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is no=
t a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   2 errors generated.
>=20
> The C standard allows an implementation to accept other forms of
> constant expressions, which GCC 8+ has chosen to do, but it is not
> required. Just inline the initializer to resolve the error.
>=20
> Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1660
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
