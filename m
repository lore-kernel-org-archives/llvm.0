Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21B1F9EA9
	for <llvm@lists.linux.dev>; Mon,  9 Dec 2024 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733786851; cv=none; b=REREN2z2zdYHc+2brHOu6YQXj67qhExjFNfhXo7OnDiGJfg60nuaBmGxPRwTftSF1YZEojjqkQXF40KYIFZVGDwOR2ppx6IyvdFcYwUSROMssV2r2K37JmzoS6K8CNborP6eiktjb1Dlh63lKhanJ3TjjHse3t8knqSSs68L5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733786851; c=relaxed/simple;
	bh=sib2JIsnpaJ4xFop5I9w3oSpRI1Wmim0nseZDPgA/uQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSHYC0zdoMdu14F62rtIc07rzeGAofMyJOnsCP579kX8pT/YfKAhCx99s89YOxR/l8n8Uc9GHGQsZVJ43lRFi6FL+6thCYnJa+O/OdHnsNT5+QEtzuTZf5k2c9hBvnDf0yNzwbO6xFQ/sHuHo6E8dXI4u5oPHvv1/1EqZqOFjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHd0cYF9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHd0cYF9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434e3953b65so18940605e9.1
        for <llvm@lists.linux.dev>; Mon, 09 Dec 2024 15:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733786848; x=1734391648; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YUkySfBwBkhhjkuJlpR0sFTlCT96jZzoa4DO4d+b/nA=;
        b=WHd0cYF9UGd6TCrlRkoK3Evoz4viwZwL7CI2Xm0uENVIlfV7KPy0whvOz+IlKCXkNy
         HMZNMjaBK+90+vWw4HdWqOGfQU5cYTDpzPSQK1KpavJyZnlG6YrM1MXG7HQo7hbKY213
         SD8cq4PjrVty43M8ykUxiQXv0OBq5JyxwAkOQyW3Ucd7FaRFpe7u/nvEbr8Hioxg7gu7
         9M9PAm/twb5BRU4Ma6gVmFjGvAmlsCf5NNYjEiQlv03N1+upIDA+fl1U+hzOY+9SbBl2
         l3fQpSt3kUyhdYrK0CRSDEq3IHroz4AAxf9PEEYLqrzIH+wzv3DqycYHP347WSauVTH7
         9eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733786848; x=1734391648;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUkySfBwBkhhjkuJlpR0sFTlCT96jZzoa4DO4d+b/nA=;
        b=XmRUnAQ/RVHlgFXmrowG9jMWPHZVB2XR+EqHsBLD6e+cAXXLo4vUD13jHOFqA0joDz
         +0Cy2c+5wa7vG4JXZO5ioXK0R0vZEMBPDxhqsitmxMXBhdmGd5Yp6x/DeZJonX3PKz9c
         Usd8CZcXLS7I5C2LKSa7lJAopF1PTfUTJF+VSKjtg0tiSxpNIMSUU4605aeUMfUisQ43
         +JuIuCJwwletlEdlGzSwtCzUs9jj9dY0N12z7rqVvIA8Hiwz/leflt4CKkJeVcmTDkGb
         CMyhcTVMMzSFGYV1gd39vj7vc+L5UZ+CAsjfpMFXKSGLPKmWEoCeAQ2tbmfjaVEJ8N2T
         IoIw==
X-Forwarded-Encrypted: i=1; AJvYcCXGfACWZuz+b86HyHoiLyFFXH/LIybqYeZpRyO9up89rEhklpUCjdMYCCzl2UaQQb94ZBOV@lists.linux.dev
X-Gm-Message-State: AOJu0YyXH0JKDCuqO4dOYYcwd3mkl0frNfBpSfNuobw65oPNBYp8j0k8
	JXxgbgL0CFMBTpChQrE52IIpXU4fcPamVU3BGbzskRM3kzCmEUd+
X-Gm-Gg: ASbGncvWnKXZ6+HwsLqZ9naJmiJ7+mAPmYehDXf65S4BHJZTln7vrKulJCb5CkJByqd
	tO8QNdjocGV3doKFKEEvDGgpCR1UMUsaAR/hZMFMTEKtvMNOPZHZcBb8buEkhMjQqqflpTSuz0I
	tm6c9sX4xtpa6EAWHs/OereL3I4gLlKy4SOW4KWVhtlVoEqC43PSQR+/4XJ0FwO2KmHRT2wCL+f
	i1vlwJJOf3fh4R222lvDhfGQzy5tZw3jqtBwqLlOLzh845aAscYkYuI3i9DXYNBqs6d1DytAOzO
	6OIt2hwBfA==
X-Google-Smtp-Source: AGHT+IG+AB1Ph1Dj5geXxUnKA8iVEw8ecVqYIcxVzRThCcrVKOuP+9lqU9OBDnF6U9HvS4qSlC1FZg==
X-Received: by 2002:a05:6000:1f8c:b0:385:f280:d55 with SMTP id ffacd0b85a97d-386453fe853mr1676974f8f.37.1733786847561;
        Mon, 09 Dec 2024 15:27:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219096adsm14666431f8f.85.2024.12.09.15.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:27:26 -0800 (PST)
Message-ID: <67577cde.df0a0220.128dd3.75a0@mx.google.com>
X-Google-Original-Message-ID: <Z1d82uNcCx7EcU0n@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 00:27:22 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
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
	llvm@lists.linux.dev, upstream@airoha.com
Cc: Richard van Schagen <vschagen@icloud.com>
Subject: Re: [PATCH v7 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
References: <20241112015920.22564-1-ansuelsmth@gmail.com>
 <20241112015920.22564-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112015920.22564-4-ansuelsmth@gmail.com>

On Tue, Nov 12, 2024 at 02:59:00AM +0100, Christian Marangi wrote:
> Add support for the Inside Secure SafeXcel EIP-93 Crypto Engine used on
> Mediatek MT7621 SoC and new Airoha SoC.
> 
> EIP-93 IP supports AES/DES/3DES ciphers in ECB/CBC and CTR modes as well as
> authenc(HMAC(x), cipher(y)) using HMAC MD5, SHA1, SHA224 and SHA256.
> 
> EIP-93 provide regs to signal support for specific chipers and the
> driver dynamically register only the supported one by the chip.
> 
> Signed-off-by: Richard van Schagen <vschagen@icloud.com>
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Any news with this?


