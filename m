Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E669211A2C
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917162; cv=none; b=uTrxiGQWyz0SJnwlS/77Sdi0es4/ptm2luTBs/yTYCos4nhr6A6oF+pELPF/fwxvXIKTK/5POQktcA+zm/91dX+/SqHjAxkVk8rGxZwLdC35ZsNczk6Z/srgIGD86nnxSuURToNXNlI5D954DaDb9AQEymxr8bnsWJIdn1H97Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917162; c=relaxed/simple;
	bh=tbspPjYs+73r2j4ySGBJyGBNWGcl3sWds2HJdphhR4Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnV/GaS3QE5B70ZpmOSJgGV8uLQREoaYtbBsBd7E+sx/DdNgabhC1K4OLrYfs6oohWfHSFegTQOVlaaUV8iYPHeS1c9P9lKHbSCr2QPpTgc4I3C4+JHE9RjhEOy9QmEbxEavX0DUSUhTPZQ2Byq3XSFmL6Lw9y79lCocg/zmxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx7N2MQe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx7N2MQe"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so2824118f8f.2
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 03:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733917158; x=1734521958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8lOnb2hGc/HeFSo81ffjoj+9khn7BFghib0/DAmAJY=;
        b=Gx7N2MQe91jvILIlOlcsHGKfHD2B9hsdCUljTBn+bKPoF5v19eu6CnNZ9b044eIvek
         Nq+a2UEARA0w7jjOSKd2LH07Z1PCVaJTyx0kCT0bXdumf1JN9NQmQVu7jvUUjw50UYVS
         DTiS5n61n78dRt5AuZzllt1xkEw7+aqUlcDV84qcWN/6WRg9G6GZe33fNGAyE9MlsIi5
         V8Uj5VgulG9ZGtHPzqCPlKik3Y4qATyTRkaJz08pBxA0SFTc+mhfQr17kpDJe84QJQJ2
         dTOXMPKpvW3J1PGdG3manxrematwhFf0C4vZvZ0zelMfH6jjIG1ERIc8ATEYjgdmev81
         xUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733917158; x=1734521958;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8lOnb2hGc/HeFSo81ffjoj+9khn7BFghib0/DAmAJY=;
        b=Ul68WKUUUcd7mTkQUYQXef+r+xvQSU+lNlrE7e1wM5tclrxeKSS5XiEUio4+B69/YH
         LLMpb7/Sy7TCAh2DU6Cx0FMmk8evSPj5F/XQ7mEzbWwNVKdKDZzhZdkq1SlrBa0YdMdn
         hClaahZHS2TNDCvy5r/GuX8KI46slmMwaYErP7u9mUg1XoJuvy4fdAeFWhYdvS4FJyKI
         NAhC61Hg3UPNZ2/GUv7wq8GNxmngReASazVzX25LA8if7cbXZ9GXAYPoUUUfg+oJptDV
         9LyjZ6Ii+wMTzlJNxRv51dH1k+HgzYEg+RCVqgX2OyG75NhOL4u4nj+UPP9wu9rhZWce
         UXqA==
X-Forwarded-Encrypted: i=1; AJvYcCWCBayExttHZuO80p3UsRDaKGf5g0wNmrf9cyEeUtpa2wARDntFSbO75SYeryVQv3KkzOgV@lists.linux.dev
X-Gm-Message-State: AOJu0YxsQD8YIHwmVG414mPbbVFPcV3q0zVRkFuurjGTMUzNy2MBMoCL
	GUcQJcCJDIY7ivnUBMll9kO3BsLoO1BhEnWtM9ucnZRFV16+GV0D
X-Gm-Gg: ASbGncv4W2itRWujkPCFPvJjkNd4m3+vbRelOJxS4BPKVvAEb5NQSKVQ/xdlS126q0x
	DXXL/A1375sxcFzrKI7n19AbrWyVPMkX3ntpyl0SpUANjr+L4G4m3A7LHfqRpDES012zMpMQim1
	r2kOHuikLMJS9NWx0uvNwW5X398vZF1danOheRsKOAzZ2UqAUBX4EzlJKsKzJsquuzzCORwQrG2
	p8O5oB6ImS8vk6u0l1WPJ3zCo7gu6whlDd/Tqrp9R3l7CNHmq5hRxMk3fmJ5aK2Shpn/2HBL2oD
	mW9UGiGy6w==
X-Google-Smtp-Source: AGHT+IEu2L6xxMGKBzrUx057O/u6Pru32/aq1pu98cgTxsX305NBsVSVBbNw/7ELG0jiQjX0S3MyBQ==
X-Received: by 2002:a05:6000:4020:b0:385:dc45:ea06 with SMTP id ffacd0b85a97d-3864ce51e82mr2289707f8f.13.1733917158107;
        Wed, 11 Dec 2024 03:39:18 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824bd889sm1102564f8f.44.2024.12.11.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:39:17 -0800 (PST)
Message-ID: <675979e5.5d0a0220.207826.2bf1@mx.google.com>
X-Google-Original-Message-ID: <Z1l54cDWpFTUmsCB@Ansuel-XPS.>
Date: Wed, 11 Dec 2024 12:39:13 +0100
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
Subject: Re: [PATCH v8 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
References: <20241210204853.18765-1-ansuelsmth@gmail.com>
 <20241210204853.18765-4-ansuelsmth@gmail.com>
 <Z1lb0ImxhhFs4Kuz@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1lb0ImxhhFs4Kuz@gondor.apana.org.au>

On Wed, Dec 11, 2024 at 05:30:56PM +0800, Herbert Xu wrote:
> On Tue, Dec 10, 2024 at 09:48:33PM +0100, Christian Marangi wrote:
> >
> > +	/*
> > +	 * Consume remaining data.
> > +	 * 1. Loop until we consume all the data in block of 64bytes
> > +	 * 2. Send full block of 64bytes
> > +	 * 3. Skip sending last block for future update() or for final() to
> > +	 *    enable HASH_FINALIZE bit.
> > +	 */
> > +	while (to_consume > 0) {
> > +		int to_read = min(to_consume, SHA256_BLOCK_SIZE);
> > +
> > +		block = kzalloc(sizeof(*block), GFP_KERNEL);
> 
> You should avoid allocating memory.  If you really must do it,
> then it needs to be GFP_ATOMIC, and your algorithm needs to set
> CRYPTO_ALG_ALLOCATES_MEMORY which means that it won't be used
> by the storage layer as memory allocations may lead to dead-lock.
>

It's problematic for the ring consumption logic to free the block as
they get consumed hence memory allocation is needed.

> The preferred way to access extra memory is through the request
> context structure.
>

Do you have quick example for this?

-- 
	Ansuel
