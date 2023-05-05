Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D3185F
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 09:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E38C433D2;
	Fri,  5 May 2023 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683278914;
	bh=1RAXc0NiBF7f+OxPfJ6Q3iIY0ISS03O5QOmWMYZ+Rxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lp9dhKV7U+yAXz8XoM5uYwnqkHMpOJNX4AafF2rX6XK9yCWv+doTi4UXb7tvPuA10
	 KNpEYJcc5CUUlgK03TE5D+xnA6DFAISKGJiyGMQ1fIpHDx0WtWbMiILEi9dCKltMfE
	 56Za1I3RJr7hcZUswM+W3tU6MFowUECKSjxGFMjKiu79cHbLzMhQu5pfyeCN2+3JP9
	 e1kWLDtSmwvSBYQ1amkgCeE+wBlNORJn4wpB/ZX/9DneqFgbaNLwEn5mmAucnMZ1cr
	 lDtHvKC5USXt8j2jaM4vXqNiPYskuLsmL2dzeUEZQbIx4sswbzPYNHvVjz8f6Y2FF7
	 Z2swNdODgi6JA==
Date: Fri, 5 May 2023 14:58:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com, kishon@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <ZFTMPWp8LhwA9uHz@matsya>
References: <20230414122253.3171524-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>

On 14-04-23, 08:22, Tom Rix wrote:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>   'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (ret)
>             ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.

I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
usage in pll_calc"
-- 
~Vinod
