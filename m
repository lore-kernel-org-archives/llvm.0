Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72B3207
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658781032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XR/XGl5d+vD331sf91Cdt4PhYy4RnDiWcXKqjqi8ODs=;
	b=ZuVBkM87FFykPm+R3alPR2NULAqXz3yWtCmRMhRBLpGoy/xT0BeTIvxP3uS7I02sQuQYUE
	TO5QYLcP3OEUCosjlRX91f9WI7mk2Z1gjZEek1PGA70PrTJhel6u2BT8ewphGOMKxaqv9K
	JZ2vthHRzO6pBDWTuh6Ww5+rUzN22So=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-T3mNIKvHO9aU9AyfWeGyJA-1; Mon, 25 Jul 2022 16:30:31 -0400
X-MC-Unique: T3mNIKvHO9aU9AyfWeGyJA-1
Received: by mail-oo1-f70.google.com with SMTP id d30-20020a4a3c1e000000b00435d3d030cdso620650ooa.13
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 13:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XR/XGl5d+vD331sf91Cdt4PhYy4RnDiWcXKqjqi8ODs=;
        b=xTJEHjSbkPkuF/oMD0HtqIIA9udlwUb8YZXm2RTqV/KWDkCnOyrGAW0+7ggn1DUwwH
         MgKK3qzvHx83Yffu1SZ5fX83c1ubef0LOp4+VmIScliTLr/l4lMRVvJLSA1klXCrV/fE
         cZ6S2nnswphNs/KuWfTIjkFTgdgKitr0StDaIn8cG1dhf7HN47jQ5043cpcnJD5+QCRH
         0rW0y2UvtVTIr1taczALDPHqB9s6LZKPX5Gma3XLNROqp/bVlTptt8G1XB8l1/eYq3KQ
         xhsuj6CIoFKiAEVH7ohLT1SSPKHLv6XRPZM0+MTcB57CZcmDWC7GKrMKsb+26KkgsBQ0
         B1qg==
X-Gm-Message-State: AJIora9NhYx9Z6YBJq2ayGmnl8AL1nFAH7nsHisVMqMZVa2m6CWBXRis
	/KBXaeSKPEFH37SDGWL7S5iqRl7FEpiQH1doNOLZtK00A50RdlPD2fIlB55fUWAdFlF2EYbLppu
	zJEjVm2oHoj80WvHKRMEQ3ldoZajoWXSo+vrk7LjsQ64VEqlNEvDMF+/5+yvH
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id t34-20020a056870f22200b0010b732618c2mr14678600oao.55.1658781030788;
        Mon, 25 Jul 2022 13:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMKdLBsCrpyPFiMwp1I36On67rQNmu7kKIT17kKg4MZ0q/jXm/7VX99Y0AfExWzkcNf7gWrA==
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id t34-20020a056870f22200b0010b732618c2mr14678576oao.55.1658781030337;
        Mon, 25 Jul 2022 13:30:30 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o31-20020a056870911f00b0010c7487aa73sm6507887oae.50.2022.07.25.13.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 13:30:29 -0700 (PDT)
Subject: Re: [PATCH] ASoC: amd: acp: Fix initialization of ext_intr_stat1 in
 i2s_irq_handler()
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220725180539.1315066-1-nathan@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <fd7188f2-8e42-3683-0ef5-2ddde56b3efc@redhat.com>
Date: Mon, 25 Jul 2022 13:30:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220725180539.1315066-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/25/22 11:05 AM, Nathan Chancellor wrote:
> Clang warns:
>
>    ../sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr_stat1' is uninitialized when used here [-Werror,-Wuninitialized]
>                            if (stream && (ext_intr_stat1 & stream->irq_bit)) {
>                                           ^~~~~~~~~~~~~~
>    ../sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the variable 'ext_intr_stat1' to silence this warning
>            u32 ext_intr_stat, ext_intr_stat1, i;
>                                             ^
>                                              = 0
>    1 error generated.
>
> The variable was not properly renamed, correct it to resolve the
> warning.
>
> Fixes: 93f53881473c ("ASoC: amd: acp: Modify local variables name to generic")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1675
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Tom Rix <trix@redhat.com>
> ---
>   sound/soc/amd/acp/acp-platform.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
> index 10730d33c3b0..f561d39b33e2 100644
> --- a/sound/soc/amd/acp/acp-platform.c
> +++ b/sound/soc/amd/acp/acp-platform.c
> @@ -100,7 +100,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
>   		return IRQ_NONE;
>   
>   	if (adata->rsrc->no_of_ctrls == 2)
> -		ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
> +		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
>   
>   	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
>   
>
> base-commit: be0aa8d4b0fcb4532bf7973141e911998ab39508

