Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B312F2B
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 12:19:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 3438A1F440F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651580351;
	bh=Kbp3jH3G9NyAoitGMroyp0Zf93XM4dV4wjDdHF8CGw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ToWVlCnYcPMRdgabszrKxHo20uQz8lkVov1Wp0kokPeyw+LRmoCQaVpdpGDjQ8cKu
	 OtCpZn1nBUAikkFZ7fgpOYjgjI7RzIsX6x85bZ3FN+7FZAMxRMUgb6MtHPvqM03a1+
	 QplSNhCigtOnoLt+p4IuW9dba2PRHy40OA/TiErRnIV+9FUUZ5sr0Vk1bmdgU55R5B
	 iRykv74WVs42Tdjcx1ize9bmTfnZwtF8x1sqhZlZomRtcKu0LwVQM816w74F8h2tDO
	 jDTL8CdMZxZwPr969G+xOAOwF8mvH1yOVprKfTtEYJu4OWidzX+B4J84oiuCVUF58k
	 LutLhXAATe6pw==
Message-ID: <f3d7bb2e-f300-001d-868b-12da0a4ae306@collabora.com>
Date: Tue, 3 May 2022 14:19:07 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 09/25] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
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
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-10-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503102345.22817-10-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/05/22 12:23, Nancy.Lin ha scritto:
> Add mmsys for support 64 reset bits. It is a preparation for MT8195
> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> 
> 1. Add the number of reset bits in mmsys private data
> 2. move the whole "reset register code section" behind the
> "get mmsys->data" code section for getting the num_resets in mmsys->data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


