Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78082918
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 20:58:38 +0000 (UTC)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTP
	id WeK1qgYDuyYOwWk3Bqt7fT; Thu, 17 Aug 2023 20:57:01 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wk3BqjQaTor5tWk3Bqw4Fu; Thu, 17 Aug 2023 20:57:01 +0000
X-Authority-Analysis: v=2.4 cv=Vqcwvs6n c=1 sm=1 tr=0 ts=64de899d
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=IpJZQVW2AAAA:8 a=cm27Pg_UAAAA:8
 a=vO73nbbZ3KiERqEehhIA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=cvBusfyB2V15izCimMoJ:22 a=IawgGOuG5U0WyFbmm1f5:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=al2JraySz4Y/nPRNsqZbRF4Ul/8ysGw80iLcTMhMqyg=; b=RJc1tSlduq4F3dGL6LlDVnuap6
	+bqyVurTa2rldyvuEFVel4+FHkb1+mkCzz0yARsiDbBm2lHDqYOOtOuWWiw7sfSE85uqivQazNw07
	O0mwM1Nuc7gRH/9b8YFTyTA/sTZ5tvEg+1tXf2LvJfadtJn3vPqlKmdWezATiNrbK3T1b3P/kctWo
	/8e8Ro5q/YWeNdkpKwIk2EDUBceBxMWviQTPavZ+N72YtLLTHhrAJxfJWm5utUr5FtEtkzytt3OsF
	DQbQREDHTqCl5ca3eQnuLiagvUEtZ+mRcFlzP7sTW1QdsMNKWiLMU9o92CN1NpqijXSbNxfhxBh9D
	BRzKKKIg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:33092 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWk39-001NVy-0V;
	Thu, 17 Aug 2023 15:56:59 -0500
Message-ID: <7da75c68-9a5c-c8cb-2b52-543968568124@embeddedor.com>
Date: Thu, 17 Aug 2023 14:58:01 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: Annotate struct
 spmi_pmic_div_clk_cc with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817202941.never.657-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817202941.never.657-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWk39-001NVy-0V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:33092
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 76
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEzWo5tv/srCuStBbvYnxQQASpCFj2FJsrp5Dv9RtEIHhNI89qevptJZDcrLi3kB05umMQzNk7A/itPe3UXkuimDK2s+AcJgqL94Z7aO7BfOf4BA/z1W
 V52saFIoMTNQXIRrRD6k8RRRmCBTIWoMDpI8iuiAbyWIhNR04F/jGdkKST09BSDKGdM+pAKXzXgYdX9hTBro4W8/dhzpS5B8E3Y=



On 8/17/23 14:29, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct spmi_pmic_div_clk_cc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/clk/qcom/clk-spmi-pmic-div.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
> index f846be285f51..f394031eb0e5 100644
> --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> @@ -177,7 +177,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
>   
>   struct spmi_pmic_div_clk_cc {
>   	int		nclks;
> -	struct clkdiv	clks[];
> +	struct clkdiv	clks[] __counted_by(nclks);
>   };
>   
>   static struct clk_hw *
