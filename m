Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EEFDF59
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 09:41:46 +0000 (UTC)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTP
	id jjHsqDt3Nez0Cjz8bqB6sd; Sat, 23 Sep 2023 09:41:22 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id jz8zqM6ZMySCujz8zqYveB; Sat, 23 Sep 2023 09:41:45 +0000
X-Authority-Analysis: v=2.4 cv=ea8uwpIH c=1 sm=1 tr=0 ts=650eb2d9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=cm27Pg_UAAAA:8 a=gq5M5jF_6ledRb6gi8cA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0NtaCTVGjOYSpp7Vv4BMjxuQDFYb5u3uxvIHM5NV04k=; b=FU7vQujz2rS0onI7bq2398r92f
	yjnfA8G0aQkFCaHHiAQNObT89HDOuXpxfchnLtf/LZIOXXI0557oPadCaz0cxOIpO9vlp5nyaJnmY
	lzY1kKtx8iuZ7r7Xjk35r6tfJFqh3Ts9D/jxjrOEcwDxCxsS+ySD59ijGTizylOrSBrQ01ds7h8DC
	QHghQuneEEYZqbsgDkaGauphGNKcrayXtHw+QATlBE70wJDGgK2cTrgIQFGxJjxhR3tUUKQzpZsKc
	jriQOX3K7c/NHW2rIm1sVxGbppvGhYvkLgpBnFmABsLohWW/mIF8h5JoWjW777iXZn+Sat7EzEXmr
	JBZs88PQ==;
Received: from [94.239.20.48] (port=55432 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy7m-003gxW-0M;
	Sat, 23 Sep 2023 03:36:26 -0500
Message-ID: <436d7488-1a20-b6af-8e3f-f151ba2c210d@embeddedor.com>
Date: Sat, 23 Sep 2023 10:37:30 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drivers: thermal: tsens: Annotate struct tsens_priv with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175341.work.919-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175341.work.919-kees@kernel.org>
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
X-Exim-ID: 1qjy7m-003gxW-0M
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:55432
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKPdLuJArSn8HzGIb5bsmA5EvhLk2GrJkRqpqNtS278Hw+yVXHKZn1qIyUFjAdaqzCdvN8uOhO/SmTQZZjjF2McsKaZGgzfEVL8q9JrNR62/238GwBuz
 Mm9syzCAXOo92EYKbKejOKWfXGHnUiW5tTIBntnbarWM0Ges2Hq01McrfMDwiFKb3qKQUBetC1vmiMVC09GR53yd+1CLS0obiJY=



On 9/22/23 11:53, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct tsens_priv.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Amit Kucheria <amitk@kernel.org>
> Cc: Thara Gopinath <thara.gopinath@gmail.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/thermal/qcom/tsens.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index 2805de1c6827..cb637fa289ca 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -585,7 +585,7 @@ struct tsens_priv {
>   	struct dentry			*debug_root;
>   	struct dentry			*debug;
>   
> -	struct tsens_sensor		sensor[];
> +	struct tsens_sensor		sensor[] __counted_by(num_sensors);
>   };
>   
>   /**
