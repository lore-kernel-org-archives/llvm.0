Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1485134BD
	for <llvm@lists.linux.dev>; Sat,  4 Jan 2025 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736008000; cv=none; b=bvdTsG0HjPERR3rG/kpt7A16CGJvQopl2YmK7mA9zYYh5q0e+5dh2VrI1bnrr1IXgHDQGjHOuxOzipCj5CnsplsxMdgG8Lbjs2vkrkqTRMPlK5BvmZqHbMOIPcMIJn0/lr0D99N+CUlYlULwxDpbVBjYp7VZIEr7ZA8OdupJ5tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736008000; c=relaxed/simple;
	bh=+2hu2HBFZ3z098bnGj2w0wakHLQJ1X+CDDzNKkFvSo4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWijTr3xylPD8Ea+ti+KiDZoGQrhCECwNoFFjEWonsznpNGI82l31X/AsXUGNygAD4MpgK+/FM2kbf3ClB+pekercBEeXRwSkci86zdeZp0TAEXqC0sKmnGH78v7JSwJvbNyhHWlGmVZCaRmXu6S7FZwWLbP2yfG0IQSYNwRQpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyXpBUFo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyXpBUFo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso94806245e9.2
        for <llvm@lists.linux.dev>; Sat, 04 Jan 2025 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736007996; x=1736612796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nTlW5tpHNJbidyn2Hd1CGByd7XKtmPkVfZjZnPxhfiU=;
        b=AyXpBUFo3g3dLV9iXy7wC29DvNnzXUfAjOpVOP5UszFq2gshCbPiLmdcs9yxanY69T
         JnSFWpJtQmC76ebypVgFsftVQDN5lT4FCbo9Wf155TWyMB9MHlEc6tdKJyutwOSQ9v9v
         9USvH70YwpnjmjjZd5olrDmzHatEKGmRr57wkYOsqbkJDHoOKnLOQ2Cesh1InaMnHWEE
         YZpfv/El/SLS+4f3HxAUcWiYt3Z448DCzC4tj1KzgEs01oCrBTkXu5KrwdnW9EEj6j2x
         6ems0Y7038EJv67Vv27mELvaxjzw4zCeEIOKkhq0hrpW2mofyONJLO0R7ZVXtq/HdP7x
         xJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736007996; x=1736612796;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTlW5tpHNJbidyn2Hd1CGByd7XKtmPkVfZjZnPxhfiU=;
        b=pp05L4PzFaVSWVpd3qcI2ejMor4QN4JQwa6MbFnLoMe1euo5Mj1bQVL+8mgJvSE1qm
         7kFIv+u2JHPmhBnefIgKesZ091wsN0LXUTmgUPJ0OAoe77ok7TaC8dP4EU4nNDCAsbjQ
         3QBJOkZ3MTWLuPnEREGzOcPj3LG5+gO92U49kEsw9N2LqRxMNkJ6Yn8mhV5KPNWDwKLt
         xB0VKMyskqMQgG3HI0BlUXgiaxA16LN60lUsUiKuBFif52zIYWXzYQYHsSwiP/tMTyG1
         dzG50qGCwyblsVK/nW5+BofnLkJeYMHGkQMYmIyep+C8OJQPy5oKneJmU4MOsYjwSTs8
         6nmg==
X-Forwarded-Encrypted: i=1; AJvYcCUp9YVEwTH+e+g/EVELkICiBTz6exyFcUziu2MrxU0cu7TjxgLoKxED9z1nCTluBM989f5Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzB2AP8zsNXp45HopDOD8NFocPei4fTIv3MDpM5s/wPn+9T0ZB0
	tRdgtfBOmRkkeA1I3hHRTKN5DZKzlt5RMqGnrj9gyNePwwBEWt3F
X-Gm-Gg: ASbGncsgclB4pnh6RtoVVMrppKMJkOW0g7zR3L9h3aBKp1Ps19nqufDrIAZRA/03hSS
	fccp+MrMm+arPEOzWyJk0DVw5q7VdcZ9CeHXkk8m3njRHqfi6heYg4zMncNm565gJ/e3a8qGKEm
	NUmDHGa+Ddgsuf0iWAp1tAgPd4JMe0HQlmdcG9WK8RFwuReVsxNzITYTZCeBKCTpknTDdj97gZr
	GLTGsgsNFitGEby1VdBmW+32Ft9dEduSCz3BAwGpe4ywWwadqqmdu7oMiCnDR1cL3kBIqtdFuys
	1CvScRa0jJK7xVy1eEFNpLek6EPg
X-Google-Smtp-Source: AGHT+IEYyWCHbe8Xmh/2fe8JTYwqsP1+JeqaC3d0GDdR+GXkSctHI+hIK/4TMHem5BXiKUDqAK4wFA==
X-Received: by 2002:a05:600c:470a:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-43668548337mr441848705e9.5.1736007995848;
        Sat, 04 Jan 2025 08:26:35 -0800 (PST)
Received: from Ansuel-XPS. (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm515449015e9.27.2025.01.04.08.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:26:34 -0800 (PST)
Message-ID: <6779613a.050a0220.184c1c.c90e@mx.google.com>
X-Google-Original-Message-ID: <Z3lhNNTbHX6We7M8@Ansuel-XPS.>
Date: Sat, 4 Jan 2025 17:26:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v9 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
References: <20241214132808.19449-1-ansuelsmth@gmail.com>
 <20241214132808.19449-4-ansuelsmth@gmail.com>
 <Z2aqHmrVAm3adVG6@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2aqHmrVAm3adVG6@gondor.apana.org.au>

On Sat, Dec 21, 2024 at 07:44:30PM +0800, Herbert Xu wrote:
> On Sat, Dec 14, 2024 at 02:27:54PM +0100, Christian Marangi wrote:
> >
> > +	ahash_tfm = crypto_alloc_ahash(alg_name, 0, 0);
> > +	if (IS_ERR(ahash_tfm))
> > +		return PTR_ERR(ahash_tfm);
> > +
> > +	req = ahash_request_alloc(ahash_tfm, GFP_ATOMIC);
> > +	if (!req) {
> > +		ret = -ENOMEM;
> > +		goto err_ahash;
> > +	}
> > +
> > +	rctx = ahash_request_ctx_dma(req);
> > +	crypto_init_wait(&wait);
> > +	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +				   crypto_req_done, &wait);
> > +
> > +	/* Hash the key if > SHA256_BLOCK_SIZE */
> > +	if (keylen > SHA256_BLOCK_SIZE) {
> > +		sg_init_one(&sg[0], key, keylen);
> > +
> > +		ahash_request_set_crypt(req, sg, ipad, keylen);
> > +		ret = crypto_wait_req(crypto_ahash_digest(req), &wait);
> 
> Sleeping in setkey is no longer allowed.  I don't think it's
> fatal yet because the main user driving this currently uses
> sync ahashes only.  But we should avoid this in all new driver
> code.
> 
> Easiest fix would be to allocate a sync ahash:
> 
> 	ahash_tfm = crypto_alloc_ahash(alg_name, 0, CRYPTO_ALG_SYNC);
>

Hi Herbert,

I'm a bit confused by this... I can't find any reference of
CRYPTO_ALG_SYNC, is this something new? Any hint on where to look for
it? Can't find it in include/linux/crypto.h

Following the codeflow of crypto_alloc_ahash is a bit problematic.

-- 
	Ansuel
