Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745391922E9
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105672; cv=none; b=ukwGl3HyGEn+OnLpll5jt5Y/2YktLzAb4lzxmv59vsPffbMo36D3lmHkXZJX4qVHA5iV2egc73m4AHY/zNCYaz4gDRndDmbG7CJUKvv2u3m4oh9Yfa+2WBYehZvUeYxqdkt3EUTNLPPcjZJI+1NcnqBtFVZf1AlLVz8eoKJ0Ih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105672; c=relaxed/simple;
	bh=YUetvKzd46adoVApbL2fh+0ppPiQVBMI3J39BvdqVfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COK4lEWSYgtai7cL8iLqXRia5N5/oXYivr4JQtsy1FHVsVppauIFvjVB2jDmXNJzyACgTPxpz+Dxltwbzuelv7ypkJ3BK95Ad8ajrXmwerUeVeslpanY4yz/bCWawazwqT+MZI5FG6prdLtjmlkP9glZbFdl40D+ktLO46Md2RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FunJO1T/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FunJO1T/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431688d5127so40060045e9.0
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730105669; x=1730710469; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/R6e74JyYvRc6gOjM1TEYninS6Et/kGOYELmgbhJKQ=;
        b=FunJO1T/SLqsz2uNxGVouwv3uWM2cs0+iWcxWWeLPX+onrM4+KYIa1GA9PNAFWWvqu
         QjxmyDO66ZVmgdwYaowvW7Hvb/K2nKnOo7qb+YInwWekcA8dmAlZSGCNvxkvw3Bs7d/j
         UYAkSUbRcMDyGchJV7tKs4EmP9bIDsjiroTqj5tWe+FYEXkGoMrxNZSanT75xu1LUuku
         gZZ04kp7hddjxSjFz5HqSLuUiPJRzAUkEvZw3wwyFQA5UMlbdYhDgphPaPOz3jnSfeK9
         HdfQ2uPOcglm+2wovYGIGXhmdlRQnowW86M1w13FinMJH/Gu8FuvjYDdZ1RjEUfIUt0W
         yj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730105669; x=1730710469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/R6e74JyYvRc6gOjM1TEYninS6Et/kGOYELmgbhJKQ=;
        b=TAfGwhcSAjYanu1jLw870+3fv3FmMnMAIfISdF4Ti+S2X1W0IvHxst0EURE4F0a//E
         21qS1vKT85nVyauYwGWjynuBHXEvdA0YVd2wuAtmS4PnaBRD+Hf50nWzC2YX84cvqwnI
         4kqTvEBwevgxGwgRwj4YwuOAThz7FFcHbZe2BAB0QIaTslxpZ4u/YcDEQmlzOyz45sKB
         Ec+8YmMr/2iGNjn2p9W80339EdstuJ4yhQh8OJnJpHuLH1Nt3a8g9G7eYS/JlQN0JB6+
         9+JF+DLiEdEm1ojxO/9VTLciCtDrP9L1UuRL3mocEj7fOViay/nboHEELTAtJXZ2Lv1s
         FQAw==
X-Forwarded-Encrypted: i=1; AJvYcCW9CWivPjhk8QfZ4nUj2hjfVD9wCRoLvfOVgQf/qsJ4+K8NVfjVT9gQgtvaoKj02cMdhgMD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8xHb8BtIPhpvoWywqkaON+Ra5GySDrbRl4zT9iiOXNbbUXtFI
	QyBAsedqZ0dCV0PPOKye7x9lQKFkbLnsSVij9otikC6D7e2WfJqwV0KXuy+lNGg=
X-Google-Smtp-Source: AGHT+IFAR7aw2P0zLeO2hMSdxBoiLLXBRMAWipIDAb/3G9chQY281aHj3wqQikEwOL/Sd7zLxykqDw==
X-Received: by 2002:a05:600c:4f56:b0:431:52c4:1069 with SMTP id 5b1f17b1804b1-4319ac997c7mr67096825e9.8.1730105668837;
        Mon, 28 Oct 2024 01:54:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b567e18sm131027405e9.26.2024.10.28.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:54:28 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:54:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
	llvm@lists.linux.dev, upstream@airoha.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Richard van Schagen <vschagen@icloud.com>
Subject: Re: [PATCH v4 3/3] crypto: Add Mediatek EIP-93 crypto engine support
Message-ID: <2347a34a-f82d-44bf-85fd-e220c45deb8d@stanley.mountain>
References: <20241025094734.1614-3-ansuelsmth@gmail.com>
 <8011818d-bdc1-433a-a348-648955c55535@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8011818d-bdc1-433a-a348-648955c55535@stanley.mountain>

On Mon, Oct 28, 2024 at 11:47:14AM +0300, Dan Carpenter wrote:
> drivers/crypto/inside-secure/eip93/eip93-hash.c:162 _eip93_hash_init() error: uninitialized symbol 'sa_record_hmac'.

This one is a false positive.  Smatch doesn't understand bit flags very well.

regards,
dan carpenter

