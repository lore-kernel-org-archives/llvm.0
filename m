Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E313B7A6
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZjE3gPVG"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57b8a0f320dso2697054eaf.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696881603; x=1697486403; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnnNZrfQHu6U702fU9qv9YujuMNy/CqVElyAPuDlNS8=;
        b=ZjE3gPVGZ8Ey9ga8uC/jTwcac6KQLzGPUVIlN2JDyE5IQE2axo/CC2YjBqKmqjzx2T
         awcjL4Hcb6rfD8DSUKz5mpu2jNoSWO4gKKzQB6gAJN/vyuJpcolVZkd8ifN3+viUWQzv
         Kl8EpDaj7aDBTQmR1NfJLWVVxdC1uW9dVY2Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881603; x=1697486403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnnNZrfQHu6U702fU9qv9YujuMNy/CqVElyAPuDlNS8=;
        b=Hd1ZO9svs781i/us9Kyu/5gy4WrBiMPMP4YBg1qzKBlT/Eu9Qh3Vx5Wod/K/r2lDf4
         TJj4C2qwBPqP0SmEqK6PHMHEJKsGPcUUgQzKOo45r1uNfmyOK1ZmLZb+BSXu8NXq2ujV
         x8pNq/oLW/tnIXMPZJ1dvTZZhhAywRxJ8tT+I0RJWKF1jev9Ab5LMN65b58IqZFnJecT
         r5LaGHPipO/zRLREu3b9Kbnr2Jpemw/abRwH8Nby6RpznzryX77MXBrNsjJ5MDEp3myQ
         l4KsbzxXMPr6+/hg1wYGTa1VX+BV1opmB95NZz7Ka0wCpd+CsDkUUFtTzFgyEO/AhH6U
         CbXA==
X-Gm-Message-State: AOJu0Yw2C2pf2N5jFcppAgLWqrGnUcDXUmBHYhxF2qXbbcv2vbqXFZKO
	oBxi98GXquqs45zQqvrFiSuBVA==
X-Google-Smtp-Source: AGHT+IFr2diKV0FUnPCKvbVJgM9zVEQvrx9lAF5Q6PUGXjcm/39HFBRDZ6m3k4XI8U3B8QraX/ZFbw==
X-Received: by 2002:a05:6358:42a6:b0:143:321:f36b with SMTP id s38-20020a05635842a600b001430321f36bmr14035556rwc.18.1696881603565;
        Mon, 09 Oct 2023 13:00:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001bdc8a5e96csm10053257plc.169.2023.10.09.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:00:03 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:59:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: rockchip: Use struct_size()
Message-ID: <202310091259.1D9E73DAE@keescook>
References: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>

On Sun, Oct 01, 2023 at 09:44:04AM +0200, Christophe JAILLET wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more robust.
> 
> While at it, prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with __counted_by
> can have their accesses bounds-checked at run-time checking via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions).
> 
> Also remove a useless comment about the position of a flex-array in a
> structure.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It seems the consensus is to keep the struct_size() changes together
with the __counted_by annotation, so yes, this looks correct to me:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
