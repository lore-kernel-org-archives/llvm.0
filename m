Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4163B7
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 13:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B56C433D2;
	Thu,  2 Feb 2023 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675343521;
	bh=zBEt+ydmvHBvN52hjYw69vZAZo4+rEDjKXF7/GOL6Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ddi1ar+LWs2TEOznZjmMMeRHzkxfprlNIDaooFBnbYEKmHiNgZocyMM0A9Txfc9nb
	 Hho5fGs4jYiN057Q8aG5qW7Sp2yz4HHbGWeaZRyHXjEQSttA7x6gdQ+jMkSKcSeWnT
	 JLOUHsmZqKnayHSfqiO3kVRvkr96C/dLfkpRsEsV5HXeuEjQ9WLRqM+i+KLGKm2A3S
	 FA8O5GwAr7ADrtxxYRBzi6vk/ml4HqtmYMuh82FdHIe0NnQr7hOszSVqbocnV8Q4sm
	 D4tHAIkrAISQACYrjPMvhZSmOF7Kruo8kmwgcjEPLJsC97Tfu4iaBsP09oy9vtM09j
	 NQkpGY6bohs/g==
Date: Thu, 2 Feb 2023 18:41:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v7 2/3] phy: core: add debugfs root
Message-ID: <Y9u2nTgCcb/Et60d@matsya>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
 <20230118084343.26913-2-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118084343.26913-2-chunfeng.yun@mediatek.com>

On 18-01-23, 16:43, Chunfeng Yun wrote:
> Add a debugfs root for phy class, then phy drivers can add debugfs files
> under this folder.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v7: no changes
> ---
>  drivers/phy/phy-core.c  | 6 ++++++
>  include/linux/phy/phy.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index d93ddf1262c5..2f9f69190519 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -11,6 +11,7 @@
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/err.h>
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> @@ -1204,6 +1205,9 @@ void devm_of_phy_provider_unregister(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_provider_unregister);
>  
> +struct dentry *phy_debug_root;
> +EXPORT_SYMBOL_GPL(phy_debug_root);

Please make this a member of struct phy, that way all phy drivers have access
to this and we wont need to export this!

> +
>  /**
>   * phy_release() - release the phy
>   * @dev: the dev member within phy
> @@ -1233,6 +1237,8 @@ static int __init phy_core_init(void)
>  
>  	phy_class->dev_release = phy_release;
>  
> +	phy_debug_root = debugfs_create_dir("phy", NULL);
> +
>  	return 0;
>  }
>  device_initcall(phy_core_init);
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index b1413757fcc3..c398749d49b9 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -205,6 +205,8 @@ struct phy_lookup {
>  #define devm_of_phy_provider_register_full(dev, children, xlate) \
>  	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
>  
> +extern struct dentry *phy_debug_root;
> +
>  static inline void phy_set_drvdata(struct phy *phy, void *data)
>  {
>  	dev_set_drvdata(&phy->dev, data);
> -- 
> 2.18.0

-- 
~Vinod
