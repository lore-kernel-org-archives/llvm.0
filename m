Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F4148D0
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 13:43:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 22AA81F433C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1646746993;
	bh=kSUI2BRp2JNG5LsOGU9IRITk5p6tBa0tvOC+DAN6vH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q17/LXQEF1Xjh+aRlsNdjnnsHqr21WtQKV55Zg0+Gie1vBzNWqbspKyuzxJGQggds
	 FpmVkV2N8dx2CQ6XBB85sHQ/Jc9emmJ8hgK8hBKCTY7MiM/DYCYP+LaF9yIgYSpeoI
	 TTjC63wCGpDBfYPEEcbFXek3QHGn8Pso+VW7FtSNquuOuLBPqVo7U3EOOeBOcUo6es
	 CKHcCasSUH4BrjSfrtAz0EsfymVDtAziRJ2MQZV87nccB2uLprZ0JzWcWWOowr6YG8
	 50ZVWoJt2+O5aszZoxUiF9NZEzTowqD4CiAH6R8pk6sar49wsDKaZneTz3rUhmPKKZ
	 /05k2uL5pyCWw==
Message-ID: <9f794d5f-49ad-d2f2-b1ea-6beaa1d5912c@collabora.com>
Date: Tue, 8 Mar 2022 14:43:09 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RESEND v13 22/22] arm64: dts: mt8195: add display node for
 vdosys1
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
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-23-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308093018.24189-23-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/03/22 10:30, Nancy.Lin ha scritto:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 
