Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34A28692
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UqPUsRKh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c723f1c80fso19656555ad.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623674; x=1697228474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1oQgMYYOHJAqGUemakHE7gLhffpSOgun7mdtdcyLAY=;
        b=UqPUsRKhCJBtUUeOP3IiFO4XfOFC6Zvlzo2jKzwkHozUZxPtci235O90bvxW02TxdW
         6bnOX/bCuvhX6BpQVIRP4q1vpJBQFQnAexgWCTk3rAeU2nwDr1/PDYosl6QNBVMiHiFk
         JkVbmx0MQp9zT4jMkf24aLSh1txUEtQoUkJks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623674; x=1697228474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1oQgMYYOHJAqGUemakHE7gLhffpSOgun7mdtdcyLAY=;
        b=GtIKORJTSEr0OB/z0YDOOzG+OzpXL6ZXcBry4jt4oz+4noYt8M1BrsnzhFxaFAtfI7
         BVVY4FMr4rZO9uNo2ijnriy5FmpBqSlttgCjQa2VgVQRzgyFrIKyq6f6Pmt41dFKhG/m
         +h1Cd4E7jqeURL2WAvqbHqj/VPVZcRTG6xpgqGWWXJusfhRVBLAnKFrM4kRvBVuTH6x8
         SSeR4Cfc0do093UdOVk1LbK8G5lcJp5x0zPV5eTRmkZAkivQOVAWrhGttEhAKvsCtXse
         7MrQKdFnzJi+4mqdtWveNtudU6RnzRT4TBuAeN61RhJjIx8dMg9X85U7VJRgXeJLyqpI
         UI4g==
X-Gm-Message-State: AOJu0YzZ6cFwnd+UF03ve0ElqlY4Ie4BlpZa4cwbJALENp47jyfKiMHJ
	0tPbPJUEJHYNbxdKpnu+qe6HvA==
X-Google-Smtp-Source: AGHT+IGu32OJlQsQg2gdMOhdV/v2W3V3QUsAfaY6LRJfqpsCLXyocjInS1I983619DISa2FBj4aXpA==
X-Received: by 2002:a17:902:e810:b0:1c5:59ea:84de with SMTP id u16-20020a170902e81000b001c559ea84demr11148430plg.29.1696623674642;
        Fri, 06 Oct 2023 13:21:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ji2-20020a170903324200b001c75f94b0b0sm4333924plb.213.2023.10.06.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:21:14 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:21:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: Annotate struct mt76_rx_tid with __counted_by
Message-ID: <202310061320.8630F7E51@keescook>
References: <20230915200612.never.786-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915200612.never.786-kees@kernel.org>

On Fri, Sep 15, 2023 at 01:06:12PM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt76_rx_tid.

Friendly ping. Can this get picked up by the wifi tree, or should it go
via something else?

Thanks!

-Kees

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Felix Fietkau <nbd@nbd.name>
> Cc: Lorenzo Bianconi <lorenzo@kernel.org>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Shayne Chen <shayne.chen@mediatek.com>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
> index e8757865a3d0..03ef617b1527 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -376,7 +376,7 @@ struct mt76_rx_tid {
>  
>  	u8 started:1, stopped:1, timer_pending:1;
>  
> -	struct sk_buff *reorder_buf[];
> +	struct sk_buff *reorder_buf[] __counted_by(size);
>  };
>  
>  #define MT_TX_CB_DMA_DONE		BIT(0)
> -- 
> 2.34.1
> 

-- 
Kees Cook
