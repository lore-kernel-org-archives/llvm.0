Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCF29A8
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 21:03:23 +0000 (UTC)
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 226E06602946;
	Thu,  3 Nov 2022 21:03:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667509401;
	bh=V56w4IKznjfuluhA6fSqo5+nAAWn0dApHy/TY9w79jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBDxFm4mr3csQUybIFz6G8NVG3xGYl5esnOpE/eqWpP9gCja7xQavnK4b5gi1XIUc
	 7NnK3ZmYRS8LblLRQQnY/MCmj6IT7TBhpaxZO0VOJTZGQYbNZsReicy0HO/YiPVM0f
	 BukU7YNF8lWGC4g97/IxrFWtMGj56uH4a+fLrRWddhmjcRrSTeFFiy4IJwUYlbUWaB
	 yPIQ/OUvDxt7PCkarmBvnKioNvpgUEXSGanRypyDIr1evtuXZmyZS0urJtkgmB0fkg
	 FvA9xFkb3m/2wZ5Nnr1YTYcktbMqqAE3Af66MWebop77thtljgybt5r2ATLu56Z7P/
	 f8A+qx4NTc1rw==
Date: Thu, 3 Nov 2022 17:03:15 -0400
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
Subject: Re: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Message-ID: <20221103210315.lm2d3n4uolra44no@notapiano>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-3-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103032610.9217-3-nancy.lin@mediatek.com>

On Thu, Nov 03, 2022 at 11:26:05AM +0800, Nancy.Lin wrote:
[..]
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
[..]
> +void mtk_ethdr_unregister_vblank_cb(struct device *dev);
> +void mtk_ethdr_enable_vblank(struct device *dev);
> +void mtk_ethdr_disable_vblank(struct device *dev);
> +#endif
> +

As warned by git when applying the patch, you have an extra new line at the end
here.

Applying: drm/mediatek: add ETHDR support for MT8195
.git/rebase-apply/patch:454: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
