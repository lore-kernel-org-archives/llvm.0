Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC753A1E89;
	Mon,  5 Jan 2026 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610379; cv=none; b=hdSD0HEoyL1bJGfaZxImX8zlxTI03kW7KGBB/TIKSJbRG98xzIJThtIx7dMh2PGLRV91aVgQiRSXClsZEfL63Xqkzk6H8tGDI30L7OpKDpAJ9Jd0r6NXz051AOinhsNRpnPUMn0uUwiIcu/EbwlN65PSBz60rTnuchNNykC7558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610379; c=relaxed/simple;
	bh=Q2P69CQwyZPVXD08je39Ji5HIqSbRTNQlcSkwdK+RKM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k5uN98KrTXoIoaASGkHtGJU8WhTbqXr+Y+86IUDwN7AnyQXXYv3DZOIeq+tDcvBSr/nLza40lu2XqAm3ehIMm+EnGz9P80ok0HyyiutWsIHQ9SCFUC21XiF/1+tbEqLXS3uyrZNysMCTndVucIa/t2x2g8sQAo6TCQ5kv9bHdcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlB230nTyzJ46hp;
	Mon,  5 Jan 2026 18:51:55 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 579F840539;
	Mon,  5 Jan 2026 18:52:55 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:52:54 +0000
Date: Mon, 5 Jan 2026 10:52:52 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	<linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH 1/3] ata: ahci-dwc: Simplify with scoped for each OF
 child loop
Message-ID: <20260105105252.00003b5a@huawei.com>
In-Reply-To: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri,  2 Jan 2026 13:50:41 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

A whilst you are here suggestion inline to make it a bit simpler.

> ---
>  drivers/ata/ahci_dwc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
> index aec6d793f51a..bfd24772ee67 100644
> --- a/drivers/ata/ahci_dwc.c
> +++ b/drivers/ata/ahci_dwc.c
> @@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
>  static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>  {
>  	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
> -	struct device_node *child;
>  	void __iomem *port_mmio;
>  	u32 port, dmacr, ts;
>  
> @@ -271,14 +270,12 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>  	 * the HBA global reset so we can freely initialize it once until the
>  	 * next system reset.
>  	 */
> -	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
> +	for_each_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
>  		if (!of_device_is_available(child))

for_each_available_child_of_node_scoped()?

>  			continue;
>  
> -		if (of_property_read_u32(child, "reg", &port)) {
> -			of_node_put(child);
> +		if (of_property_read_u32(child, "reg", &port))
>  			return -EINVAL;
> -		}
>  
>  		port_mmio = __ahci_port_base(hpriv, port);
>  		dmacr = readl(port_mmio + AHCI_DWC_PORT_DMACR);

