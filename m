Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A215A4
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 02:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E902C385A0;
	Sat, 23 Apr 2022 02:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650679285;
	bh=mrOPhWLuAIUxSoj+v6MDLwHfuvPmqtwovzfv/A80gNE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JShmaSoog00ktcZWVyCeeeRXc4TOBoCUdltifsplVJo0hlLCA9mIiOeLvgLg832DC
	 +bUn00nVuYccRZtaHS7g0lbrbFaM3ca8W3ic/i+r9IkOWUd6Q0YQvyriLMH4s0ACZQ
	 JUHh16tpm/IxsVt+35u4o4NYWRRQq5ZfYnzAipBuVo/DzdBOcEIkD3BiqdvFNiKqsP
	 79vQ5hISAzH6sF3k5cWm0wUDJaQeK8Q5BgtoYO1PyLQo+KnSF26e+MVxsZNUoU0kqe
	 P4dGGqxD92++BGd6yoQI5vI0LAtEx/Mvh8CZqRmxSM9Jhcka8m5Wh0SfcVohJPwOAT
	 Hg/JFcgj9eDWA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220418141537.83994-1-colin.i.king@gmail.com>
References: <20220418141537.83994-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] clk: actions: remove redundant assignment after a mask operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
To: Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Colin Ian King <colin.i.king@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date: Fri, 22 Apr 2022 19:01:23 -0700
User-Agent: alot/0.10
Message-Id: <20220423020125.3E902C385A0@smtp.kernel.org>

Quoting Colin Ian King (2022-04-18 07:15:37)
> The assignment operation after a & mask operation is redundant,
> the &=3D operator can be replaced with just the & operator.
>=20
> Cleans up a clang-scan warning:
> drivers/clk/actions/owl-pll.c:28:9: warning: Although the value
> stored to 'mul' is used in the enclosing expression, the value is
> never actually read from 'mul' [deadcode.DeadStores]
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied to clk-next
