Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A2222F11
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 20:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714768825; cv=none; b=EPsNdh3jJBqtc9mFYHaMMLIYRfhHPO6LwR8HMRgCvLosG7R7fi3PaQ3/yDN40WpKKZu7QRFFQt8gDDDz48pQXsbtQiZKT8hUW0iLc/EuzfJAlHtLNuaM3QQIeM1YkE0BpSTQvYrq7qj8g2FvpYe9J2vC53T4Zy7ihZ1rp6YugCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714768825; c=relaxed/simple;
	bh=FzWh89LnKN/2rPVaiDqcCRxHJiQvPMtsLZtBAhKO/80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMwQrVt8OhqjywX+sjT6okKa8ytFB9PasOpT61Aoypa1MJsFyZE1zh7zqlCgQ+IRg1tKVXyg2v8AgPILkLInb3i+cFNnYipT9TvxYUjetys1t1Y8QwPWPRFut+/xjoGZLZSxTWdApRp9zfmsnrAB80hUr/xrSgJOuTi3R0cHD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7TSaun8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7TSaun8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso1475129f8f.1
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 13:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714768822; x=1715373622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDVI2lxNIEoHBnfc+c1mdxSwHaEoO/v2D+NGdQ5K8Ac=;
        b=C7TSaun8mqvjOFzId3B2xpCk9JWPH+JMlwF16m338hRoixcomTM2lXGpMiiYcqy0Fd
         OIh39nRljsqhIF//KmExSGOw0UDFwrdS98CbICDNRnApBRLqEaxuXtSqX9PJFMlc4jQd
         UMH85Hn3hOeVDfBArz8lcE2H4AyIXZ1qd9LT+g72+KoRLW7FD2uGmezKBspEWEtSeQ0s
         zkvsQ7ogFjcFcLGWAW9eqCT2SmyxeWjFF0qhaJq2YhhPKsXPniIpy/GyLrE48G/KQrh2
         nIUZ34OU3YDnSq8i7hfdqHTSZdEA1+ABkELXkPfTY0atq9nfLTRUMVsIzWcxwRZP8FVu
         mUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714768822; x=1715373622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDVI2lxNIEoHBnfc+c1mdxSwHaEoO/v2D+NGdQ5K8Ac=;
        b=SZvpyO+xTMAO1YPGKaIFocsxrXCttEPxUa3ke9R5hT1R1xFZZ87BlRC6YUcrWKDtjD
         nvcmS6TtbL7zSh7oEK+EQM32adt6dPYg3eFBf8YQMX3YdSGZkNIRAwml2dameDJRPrKc
         rY6k9jzlN7iwwlchVkMXb6SEIHB4tWmxC7K0Kv2IASrlzWHCCczB6YrUz63qGnCKw54a
         pM71Ghc5/Mr3PFMG+yQJOe3KtAiLXh/i9EWO0yu/5LwhrgXiKRbnvQ4S1j5sd/aFa8og
         iReq5/AN4Bk/29okXtsEbyAkzH2WnTpB5Kurz0igfO+fwPatPbPfKABsNgyXMF5se44B
         nG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXylKnhB5OBCp2xUwVlw6ewoEY60OfPbTDSZzXA/FNO+c9JIN003rVSq4MYsEP5J9SNKTzBGkXk/nwAeRgr213n4vRE4A==
X-Gm-Message-State: AOJu0YxP7J1Fjr2ubV5MjrjX4/naD9STvMobBSEiSeA5MQKzCJDoZu0q
	tPzr0PNiw3an6NDGjRPTel0687OLjXTQGLmmphXaB+zmFO72+UKUWDGjhVuigJA=
X-Google-Smtp-Source: AGHT+IFe4iSXZoJhuPdxqGmWEAclAE1SSjrlr58XewUMveIRQamI8LNDgaNu5eHGZFYo5X1d1Xs5ew==
X-Received: by 2002:a5d:47a7:0:b0:34e:8f88:e1f8 with SMTP id 7-20020a5d47a7000000b0034e8f88e1f8mr2101178wrb.30.1714768822193;
        Fri, 03 May 2024 13:40:22 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c359100b0041adf358058sm6770889wmq.27.2024.05.03.13.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 13:40:21 -0700 (PDT)
Date: Fri, 3 May 2024 23:40:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] gve: Avoid unnecessary use of comma operator
Message-ID: <00eaac4f-f8dc-4140-9eec-0c17bc6012aa@moroto.mountain>
References: <20240503-gve-comma-v1-0-b50f965694ef@kernel.org>
 <20240503-gve-comma-v1-1-b50f965694ef@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-gve-comma-v1-1-b50f965694ef@kernel.org>

On Fri, May 03, 2024 at 09:31:26PM +0100, Simon Horman wrote:
> Although it does not seem to have any untoward side-effects,
> the use of ';' to separate to assignments seems more appropriate than ','.
> 

Huh.  Interesting.  I wrote a check for that in Smatch.  The only place
where it would matter would be in an if statement.

	if (foo)
		frob1(),
	frob2();

It's unexpected that frob2() is included in the if statement.  But I
was never able to find any of these actual bugs so I gave up.

regards,
dan carpenter

