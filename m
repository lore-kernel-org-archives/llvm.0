Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8419047C
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105337; cv=none; b=YOmxBxjN+4lA3SKiOMoUVeViQ+PRcliZ2ZFYL3+lKBH/rMIliK6cWUFDLaeyG2PEUE/jSShnXC5e/3zFl1XV74MD+GhUzf4EHhJSuwCrMdn9pBSsVaFtCmPORn9EEgbqK/FsOk3dN7/IALoCSLZrj3ES42VetNKE5A9h3utCVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105337; c=relaxed/simple;
	bh=j2xt+trhQJQXYZaSllPkx3D8Wpc1vrMkDLbDwCWMDOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/DuOYbs36NgtViTVEAdr0nNLeeTCsKlzA6yUBi7BV6qSJ/wgTWW9Oh5A15vK05K/R5McVdtcIscfrvDTMUCXsCjR27gg4Je7uN+ZvsAue6vpnPTb/ZvoKW3hLJ/t3m7yO9vhJOso3RfHZ0spyLtGOgQUGDuYCz1Y7Xk6OT3qfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xd1qXVEj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xd1qXVEj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso91793f8f.1
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730105334; x=1730710134; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yH8rSI6GTPme8vkq348HNrx9rwQPSGuC28jjl3dlmxg=;
        b=xd1qXVEjntzKBMsxERNYUhGweIJxSqA0GXrOa06hp1SLKMEV8W5I6qCco2PwgifUn6
         R5BbPRTbNfbnp7fTbdSkTKARM0nzTikMMrpdpftLBUo0oM0w2OW4lqp273XVB1RyMFng
         MIwfsh/ttLfhnWoys0ThJGxdwvjw9usKg6AzEXQwVW1IxvIOrq9C9zynLuh1Mj0tPlF7
         7eEw+4qRubSfAW/Ned9s/ApMp543DpCe6SE5ET20Gv/6M3ybz0vyP3ulqp1bffI0c1aI
         K79RYKBeU2DeN0xtmdx3sH+AUdByU5BfHXbc1wKcJAkIwvruW7ZgG87XGCYAGAagm6rF
         dmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730105334; x=1730710134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH8rSI6GTPme8vkq348HNrx9rwQPSGuC28jjl3dlmxg=;
        b=H1RnuVBtRUTe+BIHxr0d5Km0hbD5COp14vLmg6tP8ib19T2P+0ZIjfYkyzTXM+Ut1Q
         kjN7ztgi8sfm5TqJ2+lKLM96IR+3NOFf/1hJlR5awA/DCzmNAVoG/0WQlJzGaNemUlJE
         H/78Td/TB097EDnspdzJEWsmwn1oM3m6HawYCrqd2bltRqtZWw4GSSNRz4s6N4D49cSr
         3oxITh/gZjHzXl/NAxsM4MK0TDt1A2pO5yuuRu9Bp4GOEgr+Hz5WfzMo3mEi/dImixek
         0t3LUd9fzcr6VAGFROsS/vzsIbHP3NzPGc5sA7DnV28xQypUjn8Subwv9hTQwAOXeMrW
         S60A==
X-Forwarded-Encrypted: i=1; AJvYcCWj6W4g3/CVVv5Qcu56S28AB9QWgpdrVhLb8qCTNJ1/mWARgwGEgvkuIQIo0B/ujiviYuSr@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw77CKwgVsySHIKHhUI3o4+xb011BUD+4V+CSc/7/lSuVqbrwN
	SP8hhSXuHcRJgWADrL8KCItLPQe8EEwEv/utwyJqwgwAggwglKXE4y4MmCoIUUQ=
X-Google-Smtp-Source: AGHT+IH9y5ZsNU0/1IZVAwqxMjl/THOn02DoTBZeJQXoIQD78iYBw9cg5G5ERRFPQ7WvpJL4YR5few==
X-Received: by 2002:adf:ea91:0:b0:37c:c51b:8d9c with SMTP id ffacd0b85a97d-38061228564mr7060382f8f.38.1730105333982;
        Mon, 28 Oct 2024 01:48:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c861sm8872842f8f.44.2024.10.28.01.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:48:53 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:48:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, upstream@airoha.com,
	Richard van Schagen <vschagen@icloud.com>
Subject: Re: [PATCH v4 3/3] crypto: Add Mediatek EIP-93 crypto engine support
Message-ID: <2c53b5f9-cba8-48a8-a9ad-9c72656b7479@stanley.mountain>
References: <20241025094734.1614-1-ansuelsmth@gmail.com>
 <20241025094734.1614-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025094734.1614-3-ansuelsmth@gmail.com>

On Fri, Oct 25, 2024 at 11:47:24AM +0200, Christian Marangi wrote:
> +static void eip93_hash_free_data_blocks(struct ahash_request *req)
> +{
> +	struct eip93_hash_reqctx *rctx = ahash_request_ctx(req);
> +	struct mkt_hash_block *block;
> +
> +	list_for_each_entry(block, &rctx->blocks, list) {
> +		dma_unmap_single(rctx->mtk->dev, block->data_dma,
> +				 SHA256_BLOCK_SIZE, DMA_TO_DEVICE);
> +		kfree(block);

You need to use list_for_each_entry_safe() to avoid a use after free.

> +	}
> +}

regards,
dan carpenter

