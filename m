Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D411CB3
	for <llvm@lists.linux.dev>; Mon, 13 Nov 2023 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from canpemm100004.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4STJWX5g96zrV6B;
	Mon, 13 Nov 2023 13:53:28 +0800 (CST)
Received: from [10.174.179.14] (10.174.179.14) by
 canpemm100004.china.huawei.com (7.192.105.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 13:56:45 +0800
Subject: Re: [PATCH] scsi: pm8001: return error code if no attached dev
To: Su Hui <suhui@nfschina.com>, <jinpu.wang@cloud.ionos.com>,
	<jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <damien.lemoal@opensource.wdc.com>, <johannes.thumshirn@wdc.com>,
	<linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <20231113050147.80818-1-suhui@nfschina.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <d34527f0-f708-8ec0-33ea-6fd9d4260a6b@huawei.com>
Date: Mon, 13 Nov 2023 13:56:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231113050147.80818-1-suhui@nfschina.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.14]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm100004.china.huawei.com (7.192.105.92)
X-CFilter-Loop: Reflected

Hi, Su

On 2023/11/13 13:01, Su Hui wrote:
> Clang static analyzer complains that value stored to 'res' is never read.
> Return the error code when sas_find_attached_phy_id() failed.
> 
> Fixes: ec64858657a8 ("scsi: pm8001: Use sas_find_attached_phy_id() instead of open coding it")

This 'Fixes' tag is not right. This commit is only a refactor and did 
not change the original logic here.

Thanks,
Jason

> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   drivers/scsi/pm8001/pm8001_sas.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/scsi/pm8001/pm8001_sas.c b/drivers/scsi/pm8001/pm8001_sas.c
> index a5a31dfa4512..a1f58bfff5c0 100644
> --- a/drivers/scsi/pm8001/pm8001_sas.c
> +++ b/drivers/scsi/pm8001/pm8001_sas.c
> @@ -662,6 +662,8 @@ static int pm8001_dev_found_notify(struct domain_device *dev)
>   				   SAS_ADDR(dev->sas_addr),
>   				   SAS_ADDR(parent_dev->sas_addr));
>   			res = phy_id;
> +			pm8001_free_dev(pm8001_device);
> +			goto found_out;
>   		} else {
>   			pm8001_device->attached_phy = phy_id;
>   		}
> 
