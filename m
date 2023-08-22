Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F0E2018C
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 21:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872C2C433C8;
	Tue, 22 Aug 2023 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692738021;
	bh=9s7d2BlKpZfct9MmU2wqCDuBw+XrUhkUrnIos303LfA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hvpt+kxzz0ZoaJrECshCxIerc37f8pYNEAIIYQnyWEFxV5w++w+KFfIxVIdGypplB
	 uxMHXMnP6hx8Qon2mpG6S4cIjShfEfgg2ZExDqzpU0ymiBzwsfn6UupEaAWhPeG8as
	 QguGu470K5zYs6+5hDBfrUOR28VOphNHyxiFhErYEdgA4iNz5rcztlKF1T1USPtj/z
	 tryWxDwFuuk/6DDl7EoYHJl0RoA8f2HnmDmD2UaUM1d7c+LdOdpmP7M7qo9GHhNTpx
	 QQfbMimFnzV75VOk/0PkrI+p7/v8tRiLt2/oulMiYEOApzN26XC5/+hBi9OYOPaWlU
	 YT6RdUhJ4e3rw==
Message-ID: <9c82fe377e9d778d3a5a3de967a3706e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817202941.never.657-kees@kernel.org>
References: <20230817202941.never.657-kees@kernel.org>
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: Annotate struct spmi_pmic_div_clk_cc with __counted_by
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Kees Cook <keescook@chromium.org>
Date: Tue, 22 Aug 2023 14:00:19 -0700
User-Agent: alot/0.10

Quoting Kees Cook (2023-08-17 13:29:42)
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct spmi_pmic_div_cl=
k_cc.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Applied to clk-next
