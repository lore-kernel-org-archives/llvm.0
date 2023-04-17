Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1F2C2E3
	for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 07:39:08 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 291FA6602F91;
	Mon, 17 Apr 2023 08:39:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681717141;
	bh=EiNOtPE+lhG3aPoSAyOgtZ67mh+dWMxFs/Uq9B0YnJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lU0itS7YxkQVm5YQFoUgsqWn6Vd06iFLiHynBxqblggbo2MEPzBT9spA2Zqfk4UFJ
	 Cbn6jnVbdcE6SP9XuzTJUpIa+a26j8PNE5v1HgXyYTB7WakjfRLirje5oUn7+TtKnd
	 bLcSHcZvINymW6HM5iAOoi/D+yz/GJAGpB4jOX8Zjk4TD0ZZ2renr3eNnM2c+Al26Z
	 eoq+f8VLGcbey/5VL4MV2Tbg+sprTWOj8W89BZyma/PlYpbTWa/J1mV/8LqvmAAXVV
	 9ekNPLBtSrrSH9BW4YLhf3RIVVkMKjoBceZ393ExGtxsz1AYo0+QFBRYctCQPodwsw
	 Wea+5pJxYXv8A==
Message-ID: <447c1e8a-b3cd-0515-3998-edf3d2f5d476@collabora.com>
Date: Mon, 17 Apr 2023 09:38:57 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, matthias.bgg@gmail.com, nathan@kernel.org,
 ndesaulniers@google.com, granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/04/23 14:22, Tom Rix ha scritto:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (ret)
>              ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


