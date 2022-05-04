Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C411F29AA
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 18:09:11 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id c5-20020a9d75c5000000b00605ff3b9997so1425904otl.0
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 11:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D+E9lNuRbHFdd170vr+MtjOcic+cq6LuKuOZKRSFmmQ=;
        b=3FRsbg21aamatuH12CCVpozE1j715q+FYJMJxCkwyooh3uar1a+CRMrJH3XdrtQJT/
         tn8YUB2xWoI3uH4eKRvypWFerkiy2A8U9wvoi3skzlhZ5sa2mwaXWz8BPQQDu68/PkJH
         8i9rJTu3pctXTDBYseUMEBAyUe5mg42SjS0RUNP6EhF4BpuT6BxzBM5YxuXksCVr3OdC
         apRwW5bSGXMZaLdFvB9VZlMkY8ZqK9QgF+TEe/lUD7aQ9b88ytda/6veZtGKP4gbx0/g
         ivVS6UUeCzGcbCspPx1hxbnN3hkgyjCjCxrtBuUjx8yer14tgQ+smgnN9j1K4/3X68QW
         +lYw==
X-Gm-Message-State: AOAM531/bxcA5QQDYSUinTFLFVgxF5J8jAbKsrl4K54sPP+IBGsY0tUt
	i/7l5NPE+jBywR5EfQ/eyg==
X-Google-Smtp-Source: ABdhPJz7UxGCoN/1mtQLUptxPhW193aedSmrIFdTLYGH8vHQEwAOv7HLwELKhlP+txzkjgVxGZbMKA==
X-Received: by 2002:a05:6830:116:b0:606:3fb1:e89e with SMTP id i22-20020a056830011600b006063fb1e89emr2227922otp.310.1651687750783;
        Wed, 04 May 2022 11:09:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d19-20020a4ad353000000b0035eb4e5a6bfsm6240803oos.21.2022.05.04.11.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 11:09:10 -0700 (PDT)
Received: (nullmailer pid 1975953 invoked by uid 1000);
	Wed, 04 May 2022 18:09:09 -0000
Date: Wed, 4 May 2022 13:09:09 -0500
From: Rob Herring <robh@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>, linux-xtensa@linux-xtensa.org, devicetree@vger.kernel.org, kunit-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-integrity@vger.kernel.org, linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, llvm@lists.linux.dev, netdev@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH 29/32] xtensa: Use mem_to_flex_dup() with struct property
Message-ID: <YnKbaXEUHyu+btOD@robh.at.kernel.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-30-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504014440.3697851-30-keescook@chromium.org>

Gmail won't send this, so I've trimmed the recipients...

On Tue, May 03, 2022 at 06:44:38PM -0700, Kees Cook wrote:
> As part of the work to perform bounds checking on all memcpy() uses,
> replace the open-coded a deserialization of bytes out of memory into a
> trailing flexible array by using a flex_array.h helper to perform the
> allocation, bounds checking, and copying.
> 
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-xtensa@linux-xtensa.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/xtensa/platforms/xtfpga/setup.c | 9 +++------
>  include/linux/of.h                   | 3 ++-
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
> index 538e6748e85a..31c1fa4ba4ec 100644
> --- a/arch/xtensa/platforms/xtfpga/setup.c
> +++ b/arch/xtensa/platforms/xtfpga/setup.c
> @@ -102,7 +102,7 @@ CLK_OF_DECLARE(xtfpga_clk, "cdns,xtfpga-clock", xtfpga_clk_setup);
>  #define MAC_LEN 6
>  static void __init update_local_mac(struct device_node *node)
>  {
> -	struct property *newmac;
> +	struct property *newmac = NULL;
>  	const u8* macaddr;
>  	int prop_len;
>  
> @@ -110,19 +110,16 @@ static void __init update_local_mac(struct device_node *node)
>  	if (macaddr == NULL || prop_len != MAC_LEN)
>  		return;
>  
> -	newmac = kzalloc(sizeof(*newmac) + MAC_LEN, GFP_KERNEL);
> -	if (newmac == NULL)
> +	if (mem_to_flex_dup(&newmac, macaddr, MAC_LEN, GFP_KERNEL))
>  		return;
>  
> -	newmac->value = newmac + 1;
> -	newmac->length = MAC_LEN;
> +	newmac->value = newmac->contents;
>  	newmac->name = kstrdup("local-mac-address", GFP_KERNEL);
>  	if (newmac->name == NULL) {
>  		kfree(newmac);
>  		return;
>  	}
>  
> -	memcpy(newmac->value, macaddr, MAC_LEN);
>  	((u8*)newmac->value)[5] = (*(u32*)DIP_SWITCHES_VADDR) & 0x3f;
>  	of_update_property(node, newmac);
>  }
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 17741eee0ca4..efb0f419fd1f 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -30,7 +30,7 @@ typedef u32 ihandle;
>  
>  struct property {
>  	char	*name;
> -	int	length;
> +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, length);
>  	void	*value;
>  	struct property *next;
>  #if defined(CONFIG_OF_DYNAMIC) || defined(CONFIG_SPARC)
> @@ -42,6 +42,7 @@ struct property {
>  #if defined(CONFIG_OF_KOBJ)
>  	struct bin_attribute attr;
>  #endif
> +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, contents);

99.9% of the time, this is not where the property value is stored as it 
points into an FDT blob. I suppose that is okay, but just want to make 
sure.

The DT API for creating new nodes and properties is horrible as it is 
multiple allocs and strdups which makes for tricky error paths. A better 
API to centralize it would be welcome, but if this is the only case you 
came across it's certainly not a requirement.

Rob
