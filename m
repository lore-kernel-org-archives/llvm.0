Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264183;
	b=LcTfI+KZXU5qjrrjiz/WsPHmJGKpGC05SS2+kmUygV2Fs0sJKj+0ZxvY93egUil9jaH9
	 YpmHDTeDifKg8XUYhl6vkwDuwebNv7VEwTDWcd5zITpdt7N5WwezMX/6GCoTM1IziDRCG
	 YoF4wRwNgxBAWVmno9nGPXX+wUSAtTn85XIP/iZ4E1YkPIgOC9jJcUKUXsSoCCjQMQp7k
	 C5HRAhBhNlSYuCMtuRmen61z8bgV+FKddcZFDAhHPC/2D28iv03Dz4y/rIxcsyr+LKW1H
	 3eZas4KvWPEY/Y8OspSNqtdVskeMt7/dg3gnSywhL4J2G+m6WAmHOFbLEayPTqa/LWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Qfmz3wQRZHw1Acdm/+1MzSlQaBNEHKcQlH0KCOZ3rss=;
	b=KV43MojNGOZh32IKv2haAnPmEgG43mAupWw9EDSHm6FMs+VMiJ+67OF1RqyXgLU2n7zo
	 xDospfzw/bLNcV9/+eBwU1xu/672DKY/R/uscJpxTXMI6M8bSbXZxLYPYsN/QB7fCiswT
	 sanQVqxk4OlUNOeZNaZhCucwSYWpRySZN8AJlbYgjHsEboGmIkaeYEuYpzJRBAgjPCx3M
	 khNYZZ5rQns01CbfWCn+ZhdJL0TaT68nDPZ8vqbswQfwHTKmEbnxAgr4pKTvXVf4Rn6jt
	 +zQeIQibSktEXuoEBOigQyZsy6UJK25tXAli9iJPyqeXg4VXXhZ1GBY9mdf1POHfRzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAcqYrdf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB7606A32A;
	Sat, 21 Nov 2026 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAcqYrdf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06C91F000C4;
	Sat, 21 Nov 2026 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264183;
	bh=Qfmz3wQRZHw1Acdm/+1MzSlQaBNEHKcQlH0KCOZ3rss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LAcqYrdfw1qR/CVdPj1cGVnpCoWME6A8kiXMXMOTpexuyeFWolmOnIaWvsuJtnzrG
	 OhJy2TP5pRbQcS7jTlY6JkBgsN4lgLdU6TiCaFSmwnVMKRKUkXu89gW6LFBTkf26o2
	 ZnLDApMTE1KBCKtz3nFNQ/ksd2k7N+zhFQe/4MH0CE44IMHXICvkMXcsfJDchf0IId
	 R33W49VK4bNYtjjwCBVzYzxLtqzvWnDJ+wY/NwaNFbBTgnQmdIFXYcIWGzqikDrxs9
	 rQscWm9fAV7EuTAw+4dRLhTrBGmugRrhhYHC1sFhUCvvbdoOovp2ADDGYLQi+apXTq
	 SmwQKW9rF7cjg==
Date: Sat, 21 Nov 2026 13:29:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 05/15] wifi: ath12k: add Wi-Fi 8 directory
 and base module scaffolding
Message-ID: <20261121-objective-turquoise-sponge-f91ff2@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 01:45:28PM +0530, Madhavan Ganesan wrote:
> QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
> share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
> QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
> files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
> ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
> init/exit as stubs so the module builds cleanly and remains bisect-safe;
> actual PCI driver registration and hardware support come in follow-up
> patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Makefile       |  1 +
>  drivers/net/wireless/ath/ath12k/core.h         |  1 +
>  drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
>  drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
>  6 files changed, 66 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
> index 861ec85eebed..332110d72a1d 100644
> --- a/drivers/net/wireless/ath/ath12k/Makefile
> +++ b/drivers/net/wireless/ath/ath12k/Makefile
> @@ -25,6 +25,7 @@ ath12k-y += core.o \
>  ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
>  
>  obj-$(CONFIG_ATH12K) += wifi7/
> +obj-$(CONFIG_ATH12K) += wifi8/
>  
>  ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
>  ath12k-$(CONFIG_ACPI) += acpi.o
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index a8e8a55aa718..2a4b5e5e1af3 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
>  enum ath12k_device_family {
>  	ATH12K_DEVICE_FAMILY_START,
>  	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
> +	ATH12K_DEVICE_FAMILY_WIFI8,
>  	ATH12K_DEVICE_FAMILY_MAX,
>  };
>  
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
> new file mode 100644
> index 000000000000..b8c5b6d3a7bd
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: BSD-3-Clause-Clear
> +obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
> +ath12k_wifi8-y += core.o \
> +		  pci.o
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
> new file mode 100644
> index 000000000000..9253ef9d9cf5
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include "../pci.h"
> +#include "pci.h"
> +
> +static int ath12k_wifi8_init(void)
> +{
> +	int ret;
> +
> +	ret = ath12k_wifi8_pci_init();
> +	if (ret)
> +		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
> +			ret);
> +
> +	return ret;
> +}
> +
> +static void ath12k_wifi8_exit(void)
> +{
> +	ath12k_wifi8_pci_exit();
> +}
> +
> +module_init(ath12k_wifi8_init);
> +module_exit(ath12k_wifi8_exit);
> +
> +MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> new file mode 100644
> index 000000000000..3975081d167b
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/pci.h>
> +
> +#include "pci.h"
> +
> +int ath12k_wifi8_pci_init(void)
> +{
> +	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */

That's dead code and dead comment. Why are you adding comment which at
this point is not correct?

Commits represent logical chunks of bringing device support and above is
not logical. It's empty and achieve nothing.

Do not create stubs just for sakeness of having stubs (or worse - commits)

Best regards,
Krzysztof

