Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99A101CF
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 09:41:38 +0000 (UTC)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTP
	id jnFHqEyp9ez0Cjz8TqB6qZ; Sat, 23 Sep 2023 09:41:14 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id jz8rqQHsrsKmijz8rqK5Wf; Sat, 23 Sep 2023 09:41:37 +0000
X-Authority-Analysis: v=2.4 cv=JOMoDuGb c=1 sm=1 tr=0 ts=650eb2d1
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=AgWW5FNtAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=8DkScU8FlKhdH4yH5W0q:22 a=xmb-EsYY8bH0VWELuYED:22
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jtCXrZWqpgNvF4IRmj9O1vy7JiLl7EHS4J1sxz8kGJU=; b=Cmq39EokFJooLrmvWTUtH/fW7T
	80rgt/jSCPGnIFbvUz+s4vgYNlcnXFS/Ok2FR+LKgyAnNUGkr1SDBbINa95sshBkd0qNNWvZaJ7gh
	paKAwBL3jmJfrDDs22NuwQVraPyc5wgcsXoOWFWpdhGa6McGlVlhmTQtFf4PS3sS8AAcpyJnUC/Sc
	2sPmCnb7NkAgq54CoWchmeerg2XzLNTcLA3qSVRss+pwygBOk+8gj7N6uIpmKZMMChbkQrMbQPoMC
	qViPi/IHct8IzqXvZAwrdAsKftsMPsefav7WzcBiFHVewC+Ekk6oHKIG0TorK8DIPHdeJx5XoeQe6
	M/8vajVw==;
Received: from [94.239.20.48] (port=58468 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy1h-003ZS4-01;
	Sat, 23 Sep 2023 03:30:09 -0500
Message-ID: <7ab3ff29-dee4-7df6-f668-ab90211e6ba0@embeddedor.com>
Date: Sat, 23 Sep 2023 10:31:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hwmon: Annotate struct gsc_hwmon_platform_data with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Tim Harvey <tharvey@gateworks.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175053.work.564-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175053.work.564-kees@kernel.org>
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
X-Exim-ID: 1qjy1h-003ZS4-01
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:58468
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFwdPfDxCdhtNuzw28f3kTlIAaI7oinsAIaHVCX4oQshwT3GfHSs3U0rqP9/K16H+J7dWuAwpjjKkfEgzYD9zPqtpto48mG8RAgaV6qJ0MeCAV/bcBrH
 FJU7kTyk+fqCqg4ie8JzyZQ5qhjalLNA3+r1S5N/7SOGUvLm25xGn0AuZFF8FXgOwxILb4Knw4RU2h3jFZ0UeNsGeHYFwbgGfts=



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct gsc_hwmon_platform_data.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   include/linux/platform_data/gsc_hwmon.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/gsc_hwmon.h b/include/linux/platform_data/gsc_hwmon.h
> index f2781aa7eff8..70e8a6bec0f6 100644
> --- a/include/linux/platform_data/gsc_hwmon.h
> +++ b/include/linux/platform_data/gsc_hwmon.h
> @@ -40,6 +40,6 @@ struct gsc_hwmon_platform_data {
>   	unsigned int resolution;
>   	unsigned int vreference;
>   	unsigned int fan_base;
> -	struct gsc_hwmon_channel channels[];
> +	struct gsc_hwmon_channel channels[] __counted_by(nchannels);
>   };
>   #endif
