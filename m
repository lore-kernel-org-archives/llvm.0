Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508D2C9C
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 02:01:08 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JJbhj4X8jz91rH;
	Wed, 22 Dec 2021 09:44:05 +0800 (CST)
Received: from [10.67.103.22] (10.67.103.22) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 22 Dec
 2021 09:44:55 +0800
Message-ID: <d3227d10-cf28-10a5-d560-f46309970c5f@hisilicon.com>
Date: Wed, 22 Dec 2021 09:44:50 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] crypto: cleanup warning in qm_get_qos_value()
To: <trix@redhat.com>, <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<nathan@kernel.org>, <ndesaulniers@google.com>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
References: <20211221205953.3128923-1-trix@redhat.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <20211221205953.3128923-1-trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.103.22]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected

在 2021/12/22 4:59, trix@redhat.com 写道:
> From: Tom Rix <trix@redhat.com>
> 
> Building with clang static analysis returns this warning:
> 
> qm.c:4382:11: warning: The left operand of '==' is a garbage value
>         if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
>             ~~~~ ^
> 
> The call to qm_qos_value_init() can return an error without setting
> *val.  So check ret before checking *val.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/crypto/hisilicon/qm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
> index b1fe9c7b8cc89..c906f2e59277b 100644
> --- a/drivers/crypto/hisilicon/qm.c
> +++ b/drivers/crypto/hisilicon/qm.c
> @@ -4379,7 +4379,7 @@ static ssize_t qm_get_qos_value(struct hisi_qm *qm, const char *buf,
>  		return -EINVAL;
>  
>  	ret = qm_qos_value_init(val_buf, val);
> -	if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
> +	if (ret || *val == 0 || *val > QM_QOS_MAX_VAL) {
>  		pci_err(qm->pdev, "input qos value is error, please set 1~1000!\n");
>  		return -EINVAL;
>  	}
> 

Should check return firstly, thanks.

Zhou
