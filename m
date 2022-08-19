Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D44A14
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 19:46:54 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B725C6601DC4;
	Fri, 19 Aug 2022 20:46:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660938406;
	bh=sRXwaDjYZwFvMt0JXRUXrrOwoE4Qoa92zFqWgUdECMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAIUksXIZu2+Lr+PB/54wM3eHvY6NsWHwHAc3TqizdU7gNTDTyx/70X0fuOcjNaVl
	 rjHb9iJX4BjZAP3sYxSS7exR+W5sSqLlTP2jSOeCzzyJmw62Yeb0ZYNvB5t1Cx6Nsh
	 ZhuQXMmyCGiOwxjvwvVjNO3hK2Lg1+h4KoRphJqgPCb/vQqXWra5pyMvLOpl4bXfp1
	 bz5iEOWesxg7+rARRLDfFBWibj6+P29aEEsh+pDdRHlPT5ZF8ZqBg3ImdioGa6d+9m
	 BRITgtCIdF650K4uecRC48QaLCJZDQkQyLZBqS3dII96+s/wAJ3oX3SVhueDE31OIm
	 a2PLtdJoaSIRg==
Date: Fri, 19 Aug 2022 15:46:39 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v26 5/7] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
Message-ID: <20220819194639.tiyiiucgdknmjiew@notapiano>
References: <20220819061456.8042-1-nancy.lin@mediatek.com>
 <20220819061456.8042-6-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819061456.8042-6-nancy.lin@mediatek.com>

On Fri, Aug 19, 2022 at 02:14:54PM +0800, Nancy.Lin wrote:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Display and external display still work on mt8192 as it should.

Thanks,
Nícolas
