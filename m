Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B7CC2E2
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 15:37:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso13733435e9.2
        for <llvm@lists.linux.dev>; Fri, 05 May 2023 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683301056; x=1685893056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMQANphqIg54PwzmueerEA1nz6ede73K9wjbTi5bw3k=;
        b=a3xV0hgeH2+HOW7KQ0n46spF34Mt6cZU8UE6reMTk2Op3pdqgwaIFTbRbmk+e/aQE5
         RYAMOUEy+fGor1eIm/k7tig6rEzQMOVfL+NVK1QXrIVSfsQt571I3B/Zi3VXe1weaVC/
         4eomzoHkj+3Vi/NW1q3m/SEAtqWO3jFWjEISvcnd6qBERWdECqpy2CgdFDUJ+tyIH+2S
         TPs5UtZBwBc/Fnz+SGWOVXs6AsnX8fEaUzPGEI3GH/eyteKctZoFKyigjIjqhB+FSMKh
         k/g9upF9q7vnODKBoVtt7O8XVD8aYy+d5l91r51H/v49ETPGi28RYnTNUroqmb/D0HmJ
         jaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301056; x=1685893056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMQANphqIg54PwzmueerEA1nz6ede73K9wjbTi5bw3k=;
        b=Gn5kMOrP04aP/fcx/0s/Y6Kw1w29CGUS0IRH3dF0/rHb2JGMeRVqWkRYVoKlHiL+hS
         2Gfw3R6X5EAvMRWbjNzZQVldKilzwb2GFJs77PZ7oejhYtUq4ClbWCNNPcJVAzRS19ra
         hNEKcywmSViYZEHKmlJC4UIqnsb/8JwThOe/tOkBkgXqVqyyeAj2X1u/RlUyXSBHO829
         mDCNCmF0zCPGWj/9URzcL5escNrRZmTIKZyqrUpXPtS0W2u7hJMoHVIyl4j783qJAqEd
         Kpnzf+NSvLcoShIvNdY49g0k6EpGcXJbS7ksoXLOQwWm/P1Hh7N+qBCrzpG5HR9GEnvN
         gFiA==
X-Gm-Message-State: AC+VfDzAH8LkhcEI8fb6hh7YU1vZArjjykp6eap8bMwyz+wyw3XB84WS
	kHnQzIfOJGHrjI9FEV8XBzk=
X-Google-Smtp-Source: ACHHUZ6YF0JN2q50Mb4Rc5IWpAQlQaY8t82WbF1TW53ociZHjEHxERnMkxklnJoCQ9mt5l5ZwvQpug==
X-Received: by 2002:adf:f2c2:0:b0:306:3be9:6ab with SMTP id d2-20020adff2c2000000b003063be906abmr1905923wrp.54.1683301055966;
        Fri, 05 May 2023 08:37:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4bc8000000b0030631f199f9sm2696499wrt.34.2023.05.05.08.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 08:37:34 -0700 (PDT)
Message-ID: <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
Date: Fri, 5 May 2023 17:37:33 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US, ca-ES, es-ES
To: Vinod Koul <vkoul@kernel.org>, Tom Rix <trix@redhat.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 chunfeng.yun@mediatek.com, kishon@kernel.org,
 angelogioacchino.delregno@collabora.com, nathan@kernel.org,
 ndesaulniers@google.com, granquet@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ZFTMPWp8LhwA9uHz@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/05/2023 11:28, Vinod Koul wrote:
> On 14-04-23, 08:22, Tom Rix wrote:
>> clang reports
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>          if (ret)
>>              ^~~
>> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
> usage in pll_calc"

Thanks Vinod, that was on my list for today as well. I was a bit puzzled because 
you took the patch that added it, but I wasn't sure if you would take the fix. 
How do you want to handle things like this in the future?

Regards,
Matthias
