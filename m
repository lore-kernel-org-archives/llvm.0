Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A1E3ED3CD
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199701; cv=none; b=fqIpDWYWCnjewaUzky2IFoFcQGDYsNL8leMsOgKRYL+HJwooV76oOwz1pVxy3S8YFhAj3xEwT/LgIWfPDFyhrWhGjKHO4xa+BXGM/zAFh25p8EJJAD4jjGbAIcatqrkTCa2ZO7WJZYUmgkBCsdDef6z9BRIsUhwe/668Mld/kgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199701; c=relaxed/simple;
	bh=yXR/8vsDWfBlIw16XhJL16Hga3EGXjRfXGeaN88k5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RMj/BJv1+DgoPC/KWnUmRsVK+Kmdh9w8g67fW0XIH3iUobvlsft58CtI5odlikG5fT7lmmOnqrTimcrG0UG3f/iEleibMoR39Umh6EYlh3bxpCPawxkal6rgbZ8sKtmQ7PluFTk9OoiTIojH0++ofvqW0OrLEM+or6XJtxoK3g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+TfplNw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+TfplNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779199696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
	b=Q+TfplNwBWksTLAlGXQDH6p56p38gNmgtYWsvn2CvnVdRJC6xmC/hoYIQZ/iCAfQmEeYZg
	cAtvwmWyq+TYI5uJvj7ZFB74ZG8u+N327rOXJHdyURxbTZVQtR/VBjPqDip5l//XYPQkma
	ngZnVL/bD8lSr8ZVGtgJSfZ/W8XMtIA=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-aCb2-gyZPb6Ww3t_53h-oA-1; Tue, 19 May 2026 10:06:07 -0400
X-MC-Unique: aCb2-gyZPb6Ww3t_53h-oA-1
X-Mimecast-MFC-AGG-ID: aCb2-gyZPb6Ww3t_53h-oA_1779199566
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-696307c7f2eso7834870eaf.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 07:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199566; x=1779804366;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
        b=nsgJbfn5mu2DLKmmjmGVMF8ODiEwBkcKJWqwsWeS+wsYnHlsUEx350VWzJ8RdUDKjE
         uVte0EUF5eEOER8Q37m20FGHn0tLHLAkIMinAWOPu9KQU/RvSI/q5eD02lRf7DMciOd1
         7AsLac8ieoqpa8D886Z9G0Rf5s9gp/XPqXymLLlosZxVr0itoW22BS5ODPKg9pPBtfCD
         kNhiuoSZ/13q8sbsWlrThbn5IMS8U7LTYw6ln/j2w/YZ2D+9g3Q8HBtPwseTWnmksW1i
         dcUA/LYWnHMjChEWGS0Df53j/L/iTTPexIB2IigDEZrODgUZLQ8VMaZ1HtEpKp6ddG8m
         k3OA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ys+Cq5KvSjZm4sju9uV5XEp0z+bJT484KcqXjLoCZfuaiWoBS4/4z2Dv07ICPmMK2VCuZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Ewiej7YxsCho4djQelDPnoRV+e99HLdNxB6czaXy5x5ma+8s
	B3VkUvuV6C1UJug85djUy6dMGf1wooDpkZ+QNkMbI93Gh2o5wK0UTDDiBrY2+w+45XrYZSWeJ/R
	zTO1n+B/ry7Nztc1aE3Ch5cH4XlsfMZAF00R+GBCQ/u5qRToTnJ6sriw=
X-Gm-Gg: Acq92OHhb5epSwuFrb4ys3GhtGCU8OlUJVTuFWwt28SmAazKTO1mSpll8QWf1iSZfLn
	DD+JySOnZf08xPHlT5qO1cHV7j1kaKgepZP/9z/qBVTaDhPfTeap2thzw4xDrMisp8haMWNJiAi
	VVA3yeV0JZ3a2tlZPj9utFEZhtaKRkLFxO2t68oaaAiU6i5z2XGLnzCK94UDmMQN1KXsFGRECUP
	+hRzaS90gZzKo0Z5K2TR2JdKbg1oQcRdPoQm9prur5MHrNtKXc21KsbURfXRyDKrNS6Ans9RDzk
	ko0Mzy/HCQQhFivlJwtWIJgTJjdzUv5zvUbGXPj7096APBvb+OxjhYWw3guXSANAVbUJRnB7HYR
	QFyHYMIsTU8SpmgmJHoZCNvQJL4vpAR+J79ycI1HHPZDN/THeOs/75kWL
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d521da817mr581323eaf.55.1779199566360;
        Tue, 19 May 2026 07:06:06 -0700 (PDT)
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d521da817mr581253eaf.55.1779199565643;
        Tue, 19 May 2026 07:06:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3608bb6bsm91862306d6.6.2026.05.19.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:06:04 -0700 (PDT)
Date: Tue, 19 May 2026 10:06:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
Message-ID: <agxuSsAhreZJVYcc@redhat.com>
References: <20260518221230.19879-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260518221230.19879-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Y1GDHoefKAChqqiXvvgyUMA67sQ3-mX_TceyI2IzDY_1779199566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rosen,

On Mon, May 18, 2026 at 03:12:30PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Building the STM32MP21 and STM32MP25 clock drivers then requires direct
> linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
> that compile-test coverage.

The second one needs to be it's own separate patch, along with a Fixes
tag.

Brian

> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Makefile              | 2 +-
>  drivers/clk/stm32/clk-stm32mp21.c | 1 +
>  drivers/clk/stm32/clk-stm32mp25.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 9c3a9703ad92..0cd2223de3ca 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -150,7 +150,7 @@ obj-y					+= spacemit/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> -obj-$(CONFIG_ARCH_STM32)		+= stm32/
> +obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
>  obj-y					+= starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
> diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
> index c8a37b716bd5..3c143371c77e 100644
> --- a/drivers/clk/stm32/clk-stm32mp21.c
> +++ b/drivers/clk/stm32/clk-stm32mp21.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 52f0e8a12926..cc95fac66449 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> -- 
> 2.54.0
> 

