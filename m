Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0F36D
	for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 01:41:36 +0000 (UTC)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id kDWrqdKW1DKaKkE7rqL4ed; Sun, 24 Sep 2023 01:41:35 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id kE7qq3bJVgCcEkE7qqt7Dc; Sun, 24 Sep 2023 01:41:34 +0000
X-Authority-Analysis: v=2.4 cv=G9gPrvo5 c=1 sm=1 tr=0 ts=650f93ce
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u5/PPzzCx21+32s0aYlv06SUgr2FZ2QgBdbWkjoYS+I=; b=b3N8+G3iXbFmFhxj4q7r9muAw1
	KvvzLR7CvUcWRrdR8QBo8wxAVUgKCFGxgzu4Is/AKbZqLOaS5vuPTI+Ca/E6ih3pD34ebHep9DtcG
	m+ofHrytuiDCICg98GyPRCigslGsbt2n1xxZh0h2JqEHQ3F9hOr1fb1xGxTU5cCBPllZkrEdUkMN7
	n9oPKNrqPQwTlitJh8HPOHjV9edYLxaT06HFNWdttdINU/coat8B2DFvwDWifaeMonxiQII3GaQp2
	hHB3bZBng4BRUwcWbvGYETdlehXLAOr6trq+BI6vcPhpQpXR2N4JgQs7sYBQw5O6VkDJnputtnCYC
	7izDHduw==;
Received: from [94.239.20.48] (port=47808 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy7a-003gjN-1c;
	Sat, 23 Sep 2023 03:36:14 -0500
Message-ID: <d2287237-3137-bc11-c95b-e218b07ff9af@embeddedor.com>
Date: Sat, 23 Sep 2023 10:37:20 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] mfd: iqs62x: Annotate struct iqs62x_fw_blk with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Lee Jones <lee@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175337.work.150-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175337.work.150-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy7a-003gjN-1c
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:47808
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBTd/oKfuNQE3zubzoA/6NzygzP+Rzc3sklTCdEja+3VWu663NlX4TLe+iCXq4hRgB1uQwg0DUkH93Ly2rsykcl8GWTCViI0/K4KJnfs5wyskEpY8V/n
 omOtHsaED2hCCCMEpqNQeqGYkVnYCNBzaQSMYy8UPvg8wEaDD4PPBHOnxC2ZAp5xztRezXrYVDQFpZb3VY1GFrFxhocHitlegzM=



On 9/22/23 11:53, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct iqs62x_fw_blk.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Lee Jones <lee@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mfd/iqs62x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
> index e03b4d38fbb0..1b465590567c 100644
> --- a/drivers/mfd/iqs62x.c
> +++ b/drivers/mfd/iqs62x.c
> @@ -96,7 +96,7 @@ struct iqs62x_fw_blk {
>   	u8 addr;
>   	u8 mask;
>   	u8 len;
> -	u8 data[];
> +	u8 data[] __counted_by(len);
>   };
>   
>   struct iqs62x_info {
