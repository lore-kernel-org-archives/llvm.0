Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2962F22
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 20:42:38 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE626601BF4;
	Thu, 18 Aug 2022 21:42:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660855357;
	bh=D7Xxxq2ivM89ftLoZFcKndJliveYXABeKvga5jeIPxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn/n1YBEsHBcu+LaJsjFsogd/ABNi3DMfgFN131nKkah3nhbwwNPXWIJRNXQmPWQc
	 QI7NxHqEz4NyyCwsmZT2QS2t/kPI6BsTyznD1SReSwnehkgg02CHT+Wk6YctN0D594
	 iR68Wtm20Wb3TW4BA9pfXWr5V1rVGOfO6oSD+Y28nIHpdq0RBC81qRMksa/MA6mPcO
	 SZfvev3HUHczAAVJH763JL7VNi5fZBrFhGR5e8VtkrSPp8cTjjWbCVKRjJ8KVcdfyw
	 nrmVxwyWPErx1FknD8YmKHkJmnHtch7rQLY+olK/OhJMeoDtziOurhObeWJj9SB6mQ
	 +xBtvs2WQe/zA==
Date: Thu, 18 Aug 2022 16:42:31 -0400
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
Subject: Re: [PATCH v25 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Message-ID: <20220818204231.zvq6tipjyzen33oi@notapiano>
References: <20220804072827.22383-1-nancy.lin@mediatek.com>
 <20220804072827.22383-2-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804072827.22383-2-nancy.lin@mediatek.com>

Hi Nancy,

On Thu, Aug 04, 2022 at 03:28:21PM +0800, Nancy.Lin wrote:
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno
>  <angelogioacchino.delregno@collabora.com>

Some line-wrapping happened to your patch when sending, so it's corrupted and
won't apply:

	$ b4 am https://lore.kernel.org/all/20220804072827.22383-1-nancy.lin@mediatek.com/
	$ git am ./v25_20220804_nancy_lin_add_mediatek_soc_drm_vdosys1_support_for_mt8195.mbx
	Applying: dt-bindings: mediatek: add ethdr definition for mt8195
	error: corrupt patch at line 228

Fix whatever causes this in your setup and re-send. Tinghan also had this issue
recently [1].

[1] https://lore.kernel.org/all/96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org/

Thanks,
Nícolas
