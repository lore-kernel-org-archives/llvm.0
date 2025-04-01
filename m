Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DD1F152F
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506458; cv=none; b=cFoVsR1ZXh9pn9sWWJ4mD+u1ltKTOeet9Ss7wzUco3mP0n8XyWv5sHRnNZm2vRl1xf3UdvkcX3C0nOlz7SmOmbokc6ZjPHbZwAAG/VoSmNDneBhzwczrLBZO7yT/17NOJ6KYA3HCDnr1mciZQlhoSm4frU55hjfuKncaS+xClrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506458; c=relaxed/simple;
	bh=eiGtsQFzAxF57nNUAs9/1Tr4sRdk24379Nfq9qrZFco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqM7o1DWlcqjo5ozSxtD0GP8ySqDgyv59kP7qsqoUQ0GiJ/o2kGhczwjaOzYH/JnoJKWsLUaTPDGgUqzQM62sMTnKC0YfP9PRKLHZtn51kqViiQKMS34XrkIIkAis9xeOgeAjA7uHL3OPerJBGwAhym5jjkwmr3ZDZXtZ/njixQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTgSqyT0; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTgSqyT0"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8fce04655so52212106d6.3
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 04:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743506455; x=1744111255; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zyYvK18sL7Sms9HOD6wLOj02iesaKqNDYnihADT8IVI=;
        b=VTgSqyT0m3guu5kfji2yjKSWEN8ijmlJq3fyYg0Vl+xZz3Ri8Y/xyDhenoV6MJHoBs
         eBVfj3Ozrh4sDh4gE89Spnn0oFENwuiX+8ar+lrrQIiYOz/lkThpN0KVA/choPuARK9E
         ndK7mQtEF2qXePqN7v/TKKGXwxQPxcI3GaoGblOjvSjdI4v8jkGWUQKv7LmQjROhqiOv
         bRxeQz+dfqMpMhUSchznWtUOSi5TGkvuBS7AoJczYLCtogXnVZmq+sDc50yk+WSsa8Jy
         9a+PVdh6P4z9jPu2OTYauWRnx297qvlSXrPeyBTJBE3Fb94+NXrLX8gdy6lYWGOg2LGZ
         8xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506455; x=1744111255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyYvK18sL7Sms9HOD6wLOj02iesaKqNDYnihADT8IVI=;
        b=NIyCz/qDXrPDqmqXNGrsuuzpZ+I+SSzVqO3iAzeA/XaUqvzRNRZcTshHMWiUXC1BBL
         V+CCVWI+GpIfc65VRW67iYxGezCg1QnUChi8Eogb+i81XMr7yD9wlYzbEsVjeCrDWGHG
         Y7LJnCSGjLk3HyaKVJVBIfbQ4j48NzGfBCRCJ8sFFHrUxveoFw9EqwEeNxq6+B4X9Omn
         R1+XT4FW7nVTw2lxzh1LqVdIDP4+ghiIpweT1id7TeZoAiEhogtlU9iPQHVgD9f+dRpy
         jLExYmoh5G792vxNWKK59PlqkV7wWWJpvLuTWvuNP+eLKHPLw0RCeDS3gH0MEqaAC+Ha
         zcLg==
X-Forwarded-Encrypted: i=1; AJvYcCVcVPU3k7Z6w8/ka/2cJed60e6y/rXWa4ZWtcSqFoWiLHsgbr5IhlBEXmQ6vb+lucKVDqgx@lists.linux.dev
X-Gm-Message-State: AOJu0YzaNMSwHLgq65JpNtPLsd583tqC3ysnBOTApnTHli5SGZUwEg21
	kIP7liMvBYc8P0RnZeFZtvvMEk5zvyb5TuR/yDMtLwwTTqBGFJ0TsfocXJPAPls6qDZMUONep89
	XZ14Vj7s3Gq7s8mC6R4Hjqg2yA64=
X-Gm-Gg: ASbGncuUZ2TYjWZfhK+Wj7qYzMhgBSpHdUQB9magA89uvmlp+JZuhg6rMaAsx5D1nP+
	6RN1i1tykLcl2jm0YiaVlSWe+V4Lad2DifwzQ1gOZyS8edivRxUO3gtpTdiWsVnKCW8WJ+niels
	h2kiPEKODbkgOJv0iqa13aawWd
X-Google-Smtp-Source: AGHT+IGVM4NtvvnMjwPf4ND9jwxgAPzQn9QkZGxSalUZQi1yrmLRglBW7qsxWQ8Z6yPKdl0LpoUdx6JaHEwNgvl0CuI=
X-Received: by 2002:a05:6214:29e3:b0:6e6:6aa5:2326 with SMTP id
 6a1803df08f44-6eed60a792fmr158786426d6.24.1743506455223; Tue, 01 Apr 2025
 04:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114123935.18346-1-ansuelsmth@gmail.com> <20250114123935.18346-4-ansuelsmth@gmail.com>
 <Z-u67D7xl2_SR-hg@gondor.apana.org.au> <CA+_ehUzZruhT7Bko2Xm2kyOaZxUPA4vNLQhq_5V30gfjgmfcng@mail.gmail.com>
 <Z-vGkbmX2PQ_gt7Z@gondor.apana.org.au>
In-Reply-To: <Z-vGkbmX2PQ_gt7Z@gondor.apana.org.au>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 1 Apr 2025 13:20:44 +0200
X-Gm-Features: AQ5f1JrP9iCrauxAuRFhrzBH1SFUJTtI1qP7DuS86ze821f3jbX2JZfIFOSBW1M
Message-ID: <CA+_ehUxCD1+CUJ_6rXa8ra=tZ1Nr1LCZVYQ0X9RhDndJ33F=ug@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, upstream@airoha.com, 
	Richard van Schagen <vschagen@icloud.com>
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 1 apr 2025 alle ore 12:57 Herbert Xu
<herbert@gondor.apana.org.au> ha scritto:
>
> On Tue, Apr 01, 2025 at 12:54:05PM +0200, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 1 apr 2025 alle ore 12:08 Herbert Xu
> > <herbert@gondor.apana.org.au> ha scritto:
> > >
> > > On Tue, Jan 14, 2025 at 01:36:36PM +0100, Christian Marangi wrote:
> > > >
> > > > +static int eip93_send_hash_req(struct crypto_async_request *async, u8 *data,
> > > > +                            dma_addr_t *data_dma, u32 len, bool last)
> > > > +{
> > >
> > > ...
> > >
> > > > +again:
> > > > +     ret = eip93_put_descriptor(eip93, &cdesc);
> > > > +     if (ret) {
> > > > +             usleep_range(EIP93_RING_BUSY_DELAY,
> > > > +                          EIP93_RING_BUSY_DELAY * 2);
> > > > +             goto again;
> > > > +     }
> > > > +
> > > > +     /* Writing new descriptor count starts DMA action */
> > > > +     writel(1, eip93->base + EIP93_REG_PE_CD_COUNT);
> > >
> > > Why is there no locking here? Shouldn't this be under ring->write_lock?
> > >
> >
> > Hi Herbert,
> > this is really to tell DMA that there is new packet to process and
> > gets decreased instantly.
> > The lock is used to track what descriptor index should be used in the
> > ring in the put and get
> > functions.
>
> AFAICS it's not safe to call eip93_put_descriptor simultaneously
> since it doesn't use atomics.  Without locking in eip93_send_hash_req
> two threads hashing into two separate eip93 requests will be calling
> eip93_put_descriptor at the same time.
>

Sorry but isn't it enough to acquire lock before eip93_put_descriptor to
prevent 2 thread?

Or you are suggesting that also

writel(1, eip93->base + EIP93_REG_PE_CD_COUNT);

should be done atomically?

Maybe I can better handle that writel(1) by using atomic_t
value and atomic_inc/dec?
