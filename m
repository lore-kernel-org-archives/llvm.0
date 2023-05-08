Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5621095D
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 07:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BBEC433D2;
	Mon,  8 May 2023 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683532121;
	bh=G9HdM1QJziMzpOUvCuJGpW3lxswdvThqfd4Irkdvc78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFLrL35w0Msv/Ut1ZxVUaSrWlMrdhAImX35jJa+vNdjFsaccU4K/Tmt46yGGcK/ab
	 ShGUwgzPb0DXnrbmb7y+amP1uv5G7AULBvvpwkxkCI8F/TrVO4X4k20OUy7LQhW354
	 VQpewPMkAJfEPC2bALgNFB95LK7BWdgiYlJlZMw70TcptzYNU6cjXZ08Hv2+wil21O
	 sidC919sGP4/xfCnp+E8wq+yejJrbmLzoCSv8Fv6Ym+qsqV0c+COSzCe4/6DDVgAN6
	 SxgSWWuqvXXfvXnWitxgoPYDeztdtBvZsyFeoeZX5IbsFy458+BM+3hXZi1UEKlP5S
	 A2B38BMSM4HgQ==
Date: Mon, 8 May 2023 13:18:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, chunfeng.yun@mediatek.com,
	kishon@kernel.org, angelogioacchino.delregno@collabora.com,
	nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <ZFipVfhLVyye/eud@matsya>
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya>
 <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>

On 05-05-23, 17:37, Matthias Brugger wrote:
> 
> 
> On 05/05/2023 11:28, Vinod Koul wrote:
> > On 14-04-23, 08:22, Tom Rix wrote:
> > > clang reports
> > > drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
> > >    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> > >          if (ret)
> > >              ^~~
> > > ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> > 
> > I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
> > usage in pll_calc"
> 
> Thanks Vinod, that was on my list for today as well. I was a bit puzzled
> because you took the patch that added it, but I wasn't sure if you would
> take the fix. How do you want to handle things like this in the future?

Fixes should be sent as Fixes patch

-- 
~Vinod
