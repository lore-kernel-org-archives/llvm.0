Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED37A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 10:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id B18281F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1646909553;
	bh=ZuWzbcW5SBzcLegidyZSDC4r4SiuQWU/WO01Zs4oE2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I3Rps/fsIu7d1mr3rhCDOZ/4fEQJVBhL7g3BK5ADv5/b6QOczc1Ncj0/LLjspJxJs
	 tHa8PgwOOs0q8HZsH7870XNBto9whyL/UTOc0Yb5z8039R/SaHPaihppgcd5XHC3Qe
	 2oekAW7j9oQR7OTuqww7ajPIiy6V8kGqBwK8kSSRqFYckdgS/+DOipnpQMwzGBSxDO
	 DlHGwAu5M5AL1Kslt4e2PVhCanrZZ4EcBv6HbvdBnqwgO9+YvKWmaC0TTk5o/iz2VP
	 L+E9+orTgEqOio/6r1TWLNOEjgu0Ezh33wlDoaAejdbxvagXfboN52wy62sCLn22bn
	 GstdLxBd9wZXg==
Message-ID: <d0b3a4f3-b54d-b0bf-a3d8-6e6123788315@collabora.com>
Date: Thu, 10 Mar 2022 11:52:29 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 08/22] soc: mediatek: change the mutex defines and the
 mutex_mod type
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
 <20220310035515.16881-9-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-9-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> This is a preparation for adding support for mt8195 vdosys1 mutex.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements,
> so change it to support multi-bit control.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 264 +++++++++++++++----------------
>   1 file changed, 132 insertions(+), 132 deletions(-)
> 
