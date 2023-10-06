Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F493AC33
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="ftxxo9hJ"
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTP
	id oqqOqH0pOaLCxori0qnopJ; Fri, 06 Oct 2023 20:46:04 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id orhzq7QXqzh7corhzqFCal; Fri, 06 Oct 2023 20:46:03 +0000
X-Authority-Analysis: v=2.4 cv=Bb3Lb5h2 c=1 sm=1 tr=0 ts=6520720b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=0yL73Cyy68KADmUz8mEA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BRGB0NNwE8hDgjYAd2KbQaPiR2c564MmUQFT4MQXCS8=; b=ftxxo9hJw61JRpQuu6HdG7d+W4
	bxpt7e2vZYKe3mjDxgN3zkzzvZFDmbmkvPlJZtZhCDi+QjV6zuddVimrTWiRoh00JErWaG279i52c
	QjwhC8+7UF7RgUbL+awusED3/kBKuMP87idsx2YLTf8I0fRWq5/1baJYkJ+e9/g7vMcUXD+MdMqy0
	xjRtCZFap4WaNWMIeTAcJBJSnCu83tGOnezwaY09s2R4UjpYFAgiXhMx55Z8g3fcFgd27CgC5RZ2v
	0NiPIkX+8aTbOzj30hb3swM8y1gelQjdi4/ugEz/NcqGxxPOl+dlzQ9PUj1Hcy+S0XZKLbeC4Q61Z
	dFlArn6A==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:47408 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qorhy-001Bge-23;
	Fri, 06 Oct 2023 15:46:02 -0500
Message-ID: <94848cc3-6f5c-46d7-8cc7-98a4f10865b3@embeddedor.com>
Date: Fri, 6 Oct 2023 22:45:10 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: intersil: hostap: Annotate struct
 prism2_download_data with __counted_by
To: Kees Cook <keescook@chromium.org>, Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-wireless@vger.kernel.org, linux-hardening@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20231006201901.work.278-kees@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231006201901.work.278-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.238.9.39
X-Source-L: No
X-Exim-ID: 1qorhy-001Bge-23
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:47408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfA8Tqgwjze3Ml+5S88F6kfsJ/AWlEu4Ub4mH/jT+YL3LSa4exHi5UV/DEk2YkSamoVNzYSaohLGoqBNp4Sj00/DsBwGcLyEYITI512BQVzEaQrqVQLOd
 k1xDiTn/VUPWHcQJYs5FP4PH0Kvs/+609I/Yl/CLD4wRDmlEk9s7VCZtfauhdGGpUg5DbcPNMOD1PA1xgFFqOKcwQ6zzsGFAzGE=



On 10/6/23 22:19, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct
> prism2_download_data.
> 
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/net/wireless/intersil/hostap/hostap_wlan.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intersil/hostap/hostap_wlan.h b/drivers/net/wireless/intersil/hostap/hostap_wlan.h
> index c25cd21d18bd..f71c0545c0be 100644
> --- a/drivers/net/wireless/intersil/hostap/hostap_wlan.h
> +++ b/drivers/net/wireless/intersil/hostap/hostap_wlan.h
> @@ -617,7 +617,7 @@ struct prism2_download_data {
>   		u32 addr; /* wlan card address */
>   		u32 len;
>   		u8 *data; /* allocated data */
> -	} data[];
> +	} data[] __counted_by(num_areas);
>   };
>   
>   
