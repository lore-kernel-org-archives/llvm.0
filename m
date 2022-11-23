Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC717E
	for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 16:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50051C433C1;
	Wed, 23 Nov 2022 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669219569;
	bh=WQYGgaE2FlHz9BgmKebu5rd6gRZbPxNH81JDfaGj06Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IRYGO/4fmWR76PpS8av15fkBwXOLOYjBCFGPQZ4CE7XXUr3d5axzamdRf64l5ziWb
	 6V0iSRY0Fma2b04hVJUWIiSMN7woWN6izXe5wARaZ49bV5d8PypGDnBky3PT23f6e6
	 oODkeUsmmcGZjMHfQpygWcjZhTz0cetJTuHhE/9UrwUm912Fmttqq2ECOAGpUPCjGR
	 TYfO+DyHLVH+RKw0Ku8wBJeZVAuDQGTC1pUOyKIxPYVjl6TV8rfkEP038gXGvE/wqn
	 Lu/nyH1EkZoeRo00sO7GOR+WpdW4jOsVr2gtaIN/58BhNU5el8ZR+iwbpDAbCEGC61
	 dJb8u88vS0n4A==
Message-ID: <9b74bde1-53e8-0435-9913-af88f626d737@kernel.org>
Date: Wed, 23 Nov 2022 17:06:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221107072243.15748-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2022 08:22, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Any reason for not CC-ing maintainers pointed out by get_maintainers.pl?

Best regards,
Krzysztof

