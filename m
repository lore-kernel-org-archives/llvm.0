Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC044487
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="ep9L0mkk"
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTP
	id oqrgqX2RvnGhUotqXqPGnH; Fri, 06 Oct 2023 23:03:01 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id otqWqlBDjGElaotqWqRu6J; Fri, 06 Oct 2023 23:03:01 +0000
X-Authority-Analysis: v=2.4 cv=P5IpOwMu c=1 sm=1 tr=0 ts=65209225
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=n9Sqmae0AAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=u-_MtDP4nkpryoX2ZJoA:9
 a=QEXdDO2ut3YA:10 a=UmAUUZEt6-oIqEbegvw9:22 a=AjGcO6oz07-iQ99wixmX:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VBGDvZyyYkRgxFIbXzQBi8VzcoI67HAzbQQBsrMirwE=; b=ep9L0mkkrQy2WMIZJ65JEfzfix
	0zmqIVnJ0o3V5YcvcY6kyu4NDrTdhiz+ZlVj1SA17X4irNaBJlcB2FBrBaXILf1NdkMHTDuzjIqL5
	2Uf7VNW65DgEfzdOAdWe6hK8+HcTTp2mhoK6EPR/lNdS+ceNT+azTgCQha+GOMzNva66uitI7tKR8
	fcKFyR3lJIBu0KH3DGzInQGLgjHf6sPmwPcZz+2HyeHxceFAEcoPFwRc5UKE1sjFWczy+Zku6qnI4
	FymLJzjlIF7IHDp5UgEhkl57bAOLCf6MaLUIaN5hw8d9VQZ2hszGruPAYwxgqRoHOLRhYZpZpe4i2
	ZKs1C1Rw==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:47408 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qorlY-001Bge-0E;
	Fri, 06 Oct 2023 15:49:44 -0500
Message-ID: <00482b1c-c88d-4e84-ba06-92f00dec8f53@embeddedor.com>
Date: Fri, 6 Oct 2023 22:49:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: rtw89: coex: Annotate struct
 rtw89_btc_btf_set_slot_table with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Ping-Ke Shih <pkshih@realtek.com>
Cc: Kalle Valo <kvalo@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-wireless@vger.kernel.org,
 linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20231006201715.work.239-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231006201715.work.239-kees@kernel.org>
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
X-Exim-ID: 1qorlY-001Bge-0E
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:47408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGQl1KXGuX3L7pbYleddht9f62JQwVObvLQpTNwkQwvQjcS4+UfMuNNxolJtlUg52+nAX4yibkAd66cKWd8NXKbEidqTcE8tjusZMQwSzzHMTwjORmgx
 mZrmJX9zOuY7kSh2RAjNOqIHF03gvrgZvRTRhP5g/wlWTO4QpF6GEUrKUkzpdpypFUE8jkcIJ1gUIWLI8KW5wI43t0LlXFfUry0=



On 10/6/23 22:17, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct
> rtw89_btc_btf_set_slot_table.
> 
> Cc: Ping-Ke Shih <pkshih@realtek.com>
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
>   drivers/net/wireless/realtek/rtw89/coex.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
> index 4ba8b3df70ae..d66a1152c3f5 100644
> --- a/drivers/net/wireless/realtek/rtw89/coex.c
> +++ b/drivers/net/wireless/realtek/rtw89/coex.c
> @@ -237,7 +237,7 @@ struct rtw89_btc_btf_set_report {
>   struct rtw89_btc_btf_set_slot_table {
>   	u8 fver;
>   	u8 tbl_num;
> -	u8 buf[];
> +	u8 buf[] __counted_by(tbl_num);
>   } __packed;
>   
>   struct rtw89_btc_btf_set_mon_reg {
