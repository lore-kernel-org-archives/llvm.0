Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C87A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 10:52:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 6AC6C1F454C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1646909549;
	bh=N4fl3qvUTmmfImneM6TYMxfbc131Zodk0cnqZ2UgY0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iPmtWJrNwgUqLzVwFXEqQawHj4XRZWgoaTqyhqPR927Huz+S5f/A2WUVWq0MriyTI
	 tEdz6wee4AI0ZBq9uxzO7Yl2ef7IY649XopbAh1f7CBrJDaUo5wAsGx1jmT1g2P8Iv
	 vo6wskOclk2/ObiG7s23Fy9OjM750z4cCS8AEOmMpRik0cshQX/sD7KpIsFrMeYlrW
	 WAIzTAKhvxikjLhsmLJPGbOoE6mINyeqoNtQnXpzKg1fn9PNHGRdG4Oijh+ipdstay
	 ywXGC1SS3Kb4sVGzl1l4l2SmisFoHXgVDEorK2gOg4tZOopIDy7mDRkdeuCgN/aKb7
	 /NE+KYMlS0JZg==
Message-ID: <81720566-0f99-536b-30c7-38ef99821d92@collabora.com>
Date: Thu, 10 Mar 2022 11:52:25 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 03/22] dt-bindings: mediatek: add ethdr definition for
 mt8195
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
 <20220310035515.16881-4-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-4-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/03/22 04:54, Nancy.Lin ha scritto:
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../display/mediatek/mediatek,ethdr.yaml      | 158 ++++++++++++++++++
>   1 file changed, 158 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 
