Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4E87A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 10:52:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 514991F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1646909572;
	bh=OIHzCHMj5k3sWfXIEjFNU/tLKLnLH7CCNdUZCAzV+8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=noDVc6PlWR8NHZ+flnpVaExec2uRYYw+ohrKV9EspZ+HOev+L2pQYMDxNfd23VwQU
	 zl3qV07k/Fif3WnLoFCx5GhsIKA/kAucN0A6tT1ezc9pc3qU1Deit3Pvqyi53vC3ZG
	 Aiq5pBow465nZBl9dEVtKUikTRpo+/ko2LbXP5t6MPWYI/QAVhOBOmIJpDMtMNpUz1
	 VVJ3XiJyKWJpJRHVRuZfYB2dq5E19nWV6RQF742dei02CZCa/a/tXK7RIyvIgelxJx
	 PQTNWFF9KmvrR+MJ3+gxUfQueBKbCnDP3FTi83QUERxEqoah3OgUMMi6yUHi0Swqnm
	 02oLql+r9oM1w==
Message-ID: <72b85cf8-cff2-0bd6-e0fb-d007a0a81d0c@collabora.com>
Date: Thu, 10 Mar 2022 11:52:48 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 14/22] drm/mediatek: add display merge async reset
 control
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-15-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-15-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add merge async reset control in mtk_merge_stop. Async hw doesn't do self
> reset on each sof signal(start of frame), so need to reset the async to
> clear the hw status for the next merge start.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
