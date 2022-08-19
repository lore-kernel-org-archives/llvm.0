Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CD44A14
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 19:48:37 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 305676601DC4;
	Fri, 19 Aug 2022 20:48:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660938516;
	bh=v4ukHqUgANwnYRYp4yTNwFONerykYlV1b7efGDnM8gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBYLScUut67BRsNAbr08FMBWj5y1mKut+5fi7CqbsV3fbH4IhBLlpdBSa5sLo422p
	 AErTVTzPBeiKgqyVqtDK35lLDf4FMKPH1m2neuh6lTPPm3cvDsjRLNruOTrISSX69I
	 vfYhvQ3b1gPT1VfTwoLky2bmSUl2f85hpnooEAczIBI9RESGrKGxpeUll2ik7t9ooK
	 AyhZWbErl1yZaitO1AbHb1yNL1zDYavE5SI08mEqRaiBvsO9anWi4ZOKC1M3mUYXa1
	 KG43Wi2isiTcAe1ye88sSJkJwlpyQmzWbOOwvTmv3pYLH99JjDX6xSmhpBaXXe6jWE
	 X4Pl7JkFxpvQQ==
Date: Fri, 19 Aug 2022 15:48:28 -0400
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
Subject: Re: [PATCH v26 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20220819194828.tuevscfdt4ayw72y@notapiano>
References: <20220819061456.8042-1-nancy.lin@mediatek.com>
 <20220819061456.8042-7-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819061456.8042-7-nancy.lin@mediatek.com>

On Fri, Aug 19, 2022 at 02:14:55PM +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Display and external display still work on mt8192 as they should.

Thanks,
Nícolas
