Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861DCA68
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 08:28:25 +0000 (UTC)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTP
	id jjWSqsX8jEoVsjy01qGuJh; Sat, 23 Sep 2023 08:28:25 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id jy00qdnsXuHtrjy00qVMv6; Sat, 23 Sep 2023 08:28:24 +0000
X-Authority-Analysis: v=2.4 cv=B8eqbchM c=1 sm=1 tr=0 ts=650ea1a8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=ffdGAcwRWn2kBxf02vYA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4MkvwgfG2f0rR4J4N5IdVcabzhoeN6YMox+PAYVuHDg=; b=hxE/QxCMmIg4GIjJ1kKysfB8HW
	LFKNGposUCaPO5YrVpm8nWxVAK3o2W+f0ds0tO7A9oqB77pzkkcxWXK6oTRB+sDdwuRmwvV/ptEUk
	awn9myNLcc5/X2gj2Yu78hHNIg60AjhTgnc7r5plZqn5fhde5Bh0Npp2qxyYqp/lBiuS/snhldFK1
	K/c6pPb5EJfnMBKN1OHZUEHrFATh+gcREIhum8AispOHfQ79SfhgGlF2EI9UfzgBWMpFRt8XQuAZ/
	rjOIK6F9FfECs1uFAqYCqUYrBDN1EpSIC7q7Obf6yPmP5VPHZMF773OfRZSXGmH7XrG/VJ1nQk+0j
	D/KB/VVA==;
Received: from [94.239.20.48] (port=51144 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjxzy-003XiG-2a;
	Sat, 23 Sep 2023 03:28:23 -0500
Message-ID: <13ed115d-d0ba-f723-ee05-df0da9f56e6c@embeddedor.com>
Date: Sat, 23 Sep 2023 10:29:23 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] Input: Annotate struct input_leds with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175031.work.467-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175031.work.467-kees@kernel.org>
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
X-Exim-ID: 1qjxzy-003XiG-2a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:51144
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 88
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIIFlJVi7bDRd1n9Lcuc7M2FPgV+wF5YD59Qd4p78ez30aBnA6sB6dF5vRyTgKg/KpyVxDtWJxS36M7ArabZFng1giynOunQ8YLABGZu3dmwFF8m5GIH
 Qhj7o6/bolIQoaHqJTfmQ1ewopyZd6v2By4HoluhvijzCu53QwujuWCSHV4z3gZinf7zbfL7Lv3NqxXdtE/d6zMyjpaN2QBXtbg=



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct input_leds.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/input/input-leds.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> index 0b11990ade46..0e935914bc3a 100644
> --- a/drivers/input/input-leds.c
> +++ b/drivers/input/input-leds.c
> @@ -44,7 +44,7 @@ struct input_led {
>   struct input_leds {
>   	struct input_handle handle;
>   	unsigned int num_leds;
> -	struct input_led leds[];
> +	struct input_led leds[] __counted_by(num_leds);
>   };
>   
>   static enum led_brightness input_leds_brightness_get(struct led_classdev *cdev)
