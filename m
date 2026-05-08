Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3C274FDF;
	Fri,  8 May 2026 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263370; cv=none; b=q7nzDsraP+cOpprO1yuwErEe0DwUTxW0bPIrt8kDvTbcvt8PfVGkdh4qQ2qYKQU0PURZBQFBsu2sSSvVFpFF8r1ro4lSUuCmVX0OWDLnHHT7ZlYs79UbfpS26ZQuy4F+mDhuRO2/sodL2QG2Wyxv3Y7aCMJcQlbvil0+lm0aDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263370; c=relaxed/simple;
	bh=X7BGivxhOkRTq8ciwL84ZzxaUsOMB4vAjCY/e/RaaIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtsjHcryvbWiDh23swQaQ80jfxgDO3WVYA438nxNR7k/ytEQSqPT80+ZcKCg8/FCul1f4W8vMa0fDI/5O7Vqj3t5hoO4pPJKX1d3NV/1eq1bB7PkKWaJ36kiP//sd36zNt/NDvYbs+IOad4X2JYX3d5MDD9mH4JJTME+DNobvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lBa4ESFn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lBa4ESFn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cQZNmvowIFlL59gjPKwq3S8Lubw9QFautuveU52+dKw=; b=lBa4ESFnJWmcZU/hr3VPTBtLNH
	pdkh8XsukCtxTfw0NXjGUDeSTIXBdZFwqkScx5H5evOrJYgXiCi9joq2CjvPMAge+4wiW6wt/QAER
	7kT2+FsH2YRJXNizpejCsUWjihJI+fJYNfBRpXxAfBpYnBk4fWz1PaZsD9VjD1YyzUw6g/bPr6zme
	1DHM6vP8Wn1eXJp8F63nZDuXsZ5D7zOE5QEUVPCuZbZLpNuV2MxBWWkUkUQwELBXFS3IRgoEYYgH7
	XtbGKfKpiL0N0JpUu3XM7VmpjIcB/l5MKwf8ezV4wNdfYMakI3q5KObM09bh3NAsbYamFAc3vdlWo
	FE0xuc9g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXD-00000007DjV-18d1;
	Fri, 08 May 2026 18:02:47 +0000
Message-ID: <6f5a4345-abc6-4439-801f-f3b98e2701b3@infradead.org>
Date: Fri, 8 May 2026 11:02:46 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-8-nm@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260508153211.3688277-8-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/26 8:32 AM, Nishanth Menon wrote:
> Fix knav_init_acc_range() use of 'Return ...' instead of 'Return:'
> kernel-doc comment, which produces a warning with W=2:
> 
>   knav_qmss_acc.c:473: No description found for return value of
>   'knav_init_acc_range'
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Cc: Randy Dunlap <rdunlap@infradead.org>
> 
>  drivers/soc/ti/knav_qmss_acc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_acc.c b/drivers/soc/ti/knav_qmss_acc.c
> index 269b4e75ae40..1f8b5acdd462 100644
> --- a/drivers/soc/ti/knav_qmss_acc.c
> +++ b/drivers/soc/ti/knav_qmss_acc.c
> @@ -466,7 +466,7 @@ static const struct knav_range_ops knav_acc_range_ops = {
>   * @node:		device node
>   * @range:		qmms range information
>   *
> - * Return 0 on success or error
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_init_acc_range(struct knav_device *kdev,
>  			struct device_node *node,

-- 
~Randy
