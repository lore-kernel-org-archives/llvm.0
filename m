Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E6B208BC
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 23:01:42 +0000 (UTC)
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTP
	id k7PIq2teFWU1ckBd8qVgRl; Sat, 23 Sep 2023 23:01:42 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id kBd7q0CXuSdIskBd7quXeW; Sat, 23 Sep 2023 23:01:41 +0000
X-Authority-Analysis: v=2.4 cv=HY4H8wI8 c=1 sm=1 tr=0 ts=650f6e55
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=FP58Ms26AAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3p6Oxd8lImna/tnNPn3kLAJYhLmgd2YCH8VHS7QjBc8=; b=Q6NvT0FFjrU/P/cmSBkrYbG5Gg
	i+smH9lRlSIxn9dC22X5pYBf0exEamPbuz5btM4xN4Cko5jeT7ZFiMgSzY/EDx7NOnkfaZqRrxHJj
	BVjHEplYGLOUHuv7YzAT8n1dj4jT+lo/hMj3BMYzlOWGEIFyoPWmXehdlE9bpz7SYIBJXQv4O8U5z
	PKjp3bqldB6XdvWbijbV7BPgrkmAcdHlTBNkzBguUihoqiL2LIRlDglPKeowNdHLTeNAi2zK5FpSJ
	5rfgIeN5NRxwu0F0eO6FMOIueuH0D6gfJJWpUP0Mrq6hvge5nKEk1ftsxpgfW07gNpCFcboOeP2wR
	FSS5SXSw==;
Received: from [94.239.20.48] (port=37818 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy7M-003gFe-1z;
	Sat, 23 Sep 2023 03:36:00 -0500
Message-ID: <eba660fc-4284-6793-1598-fd5bdedaca4a@embeddedor.com>
Date: Sat, 23 Sep 2023 10:37:06 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] firewire: Annotate struct fw_node with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175334.work.335-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175334.work.335-kees@kernel.org>
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
X-Exim-ID: 1qjy7M-003gFe-1z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:37818
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIP5EBZ9ql2eEtkStbZaR7UPp5iA8JvJV//24EBRld/G7s9u2vVpgZj1Ixta0hiSFpGSUGne9Cg3E/q8SFElc1r7D1wszS8Wql4we9hk3OcwekPstu4a
 NS/4nuqpFOUqm5mnMrp6aalKmsAdQ2k7+d1hJb79GjP+w+iU/Jt2csVr55vcXiQT/CUSSoKkFy3giGkbShW8E74/fhnA2MPRjeQ=



On 9/22/23 11:53, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct fw_node.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Cc: linux1394-devel@lists.sourceforge.net
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/firewire/core.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
> index 2a05f411328f..95c10f3d2282 100644
> --- a/drivers/firewire/core.h
> +++ b/drivers/firewire/core.h
> @@ -191,7 +191,7 @@ struct fw_node {
>   	/* Upper layer specific data. */
>   	void *data;
>   
> -	struct fw_node *ports[];
> +	struct fw_node *ports[] __counted_by(port_count);
>   };
>   
>   static inline struct fw_node *fw_node_get(struct fw_node *node)
