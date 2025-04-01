Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0F86353
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504859; cv=none; b=cmJg/wd3RErWU/ujWYLMVzpygMfg7NV4TOwKK8oN/1vyFqEPGjl4eGTVc4DoIO9Z67NqySeFjherWUyKUZnpP/uSwCidu4jpX7RRKuzApiolaf/ATniceVEoydVNm+BTcqVa+H6ZW7+A5+uiui9kLhL/Ch2viH12RIy6v4h80SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504859; c=relaxed/simple;
	bh=X5Os4a3UyZegJZHpfRnnbX8gNK59hG9Lbyfs3JOXSZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2doCim1nV75Y8JwInKZ1smpknWZphYVL6c4/Pfsz4623a5xBqfPTA8FYN+yOZcb29BdN0oXXNAT7/RLiN1bkG5Acc4do0XkyiBYwmuP12NCSR2CboC2LP6IvW34tKTp6F1SmvF7YUCajZgI11bqQjw41l6UAJ+MaX0tos4jr8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTc2cy56; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTc2cy56"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f6970326so49254406d6.0
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 03:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743504857; x=1744109657; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrrNmnVXe62DiAkl/WS3t3m868nCMqWuMBB1Lhr06l8=;
        b=LTc2cy56BX18cskvvzHXq4PCK/DJfPsWlBWE+Xj+fA5ijDYoLlV6+tgHnKnitgWGBw
         NYMuHwRL2Zl4JQmkLDHCkH9Cl8WiuBudMGDktzvsi8klCsGkF9Lbp1SQvNEAljRd7wRS
         9M+lcowbwnxDBa6I90UjPclEPbGARdq57V3OpsG3aQ1yL4+EoxXyU4z4aJlGM+9XVmBK
         c/Jx09Zf2jbV4Ly9e6OaCCGCudhq8fgsC9VJ2aLNNU+pPql90ggHpysNXaISfhjC82Eg
         EFyrRqKtUQ3Rw2NvQZDeTQEPc9/L5LoELqKJug+S2nI0nWC/5u7BFX0xa4QO7722xCC6
         LNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743504857; x=1744109657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrrNmnVXe62DiAkl/WS3t3m868nCMqWuMBB1Lhr06l8=;
        b=i9PNqAbh7EUISiAUT4H0h0ad5S9VzZ6iNgLTpGKaz20iJxni2AmwYVsGAyxO9TfZSP
         XtI7BTyOAG2IKl5fzIJqeoplMqvv/2Jwc4nDITi1Oxk0rZDaB9c2slGQQLW4wtI0cFsv
         h1vD3CYp/+70/+tODnAaPETUYVRzSjg7fnK10liIxR3Fa45DnhGBxf+qCub0vHyLrpdY
         +x15d1xgFYhkDaphPN1hHILolP54IJP+LD3sRbvzQJgboqPR5WttjSOHlLr1TqbwNZ3y
         pdTWhOPil1NHBC6xd02liDQH+gPNUTU47XMBSD7i54GtBxoraxmTONseEMsWMoXF2Lan
         35Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWMlh7W/1qptYUulfX4vhS8Sk3wkDTEdTAbArHJ3De3UFmXGatkaXbg2nSj0u9E/LgakETa@lists.linux.dev
X-Gm-Message-State: AOJu0YxHCQDioaJArNTnlD0Z7tGGFLASdJKpsR8lGKu5RmqMoVq1jwkO
	vsLEyOnqswEODNuui3u7QXbC1V3iDyNfyaFLZC9JSRlbbvJtpJbYvwRZ7DaDAURoqCXFBRcH1rH
	QP13TlIr4xBF+ahe9lOqrCMXQCoY=
X-Gm-Gg: ASbGncuAensjBcn1uD1x3WVVeMJu7toaC3Bj8llrb2vM82NOSJlpIh+e6Zgu2w80X7D
	Cba2kEAo6gUZY066CZ1tUakrRWGmE0iHTGJ8riVV3kWPRI6krxtsNuPKpmtIqzqjws73ImInIEr
	95jKQJTbhd96+a7bzmrVQe9NEF
X-Google-Smtp-Source: AGHT+IGjklB7zttrEykPwzu/uhqSetSxLjCa0c9CmOp+KGR0ls7clhJCH6ITB6pCWyc2LLSi+8nRzPfxfQ0+ULkUuPk=
X-Received: by 2002:a05:6214:19eb:b0:6e6:5f08:e77d with SMTP id
 6a1803df08f44-6eed603410cmr160553986d6.19.1743504856865; Tue, 01 Apr 2025
 03:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114123935.18346-1-ansuelsmth@gmail.com> <20250114123935.18346-4-ansuelsmth@gmail.com>
 <Z-u67D7xl2_SR-hg@gondor.apana.org.au>
In-Reply-To: <Z-u67D7xl2_SR-hg@gondor.apana.org.au>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 1 Apr 2025 12:54:05 +0200
X-Gm-Features: AQ5f1JqAHbUgXCPSpYMsP6fOYVU3DU1D6Rjb-5J2YSPy0QuYLzvnvkFIIg1s8kY
Message-ID: <CA+_ehUzZruhT7Bko2Xm2kyOaZxUPA4vNLQhq_5V30gfjgmfcng@mail.gmail.com>
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

Il giorno mar 1 apr 2025 alle ore 12:08 Herbert Xu
<herbert@gondor.apana.org.au> ha scritto:
>
> On Tue, Jan 14, 2025 at 01:36:36PM +0100, Christian Marangi wrote:
> >
> > +static int eip93_send_hash_req(struct crypto_async_request *async, u8 *data,
> > +                            dma_addr_t *data_dma, u32 len, bool last)
> > +{
>
> ...
>
> > +again:
> > +     ret = eip93_put_descriptor(eip93, &cdesc);
> > +     if (ret) {
> > +             usleep_range(EIP93_RING_BUSY_DELAY,
> > +                          EIP93_RING_BUSY_DELAY * 2);
> > +             goto again;
> > +     }
> > +
> > +     /* Writing new descriptor count starts DMA action */
> > +     writel(1, eip93->base + EIP93_REG_PE_CD_COUNT);
>
> Why is there no locking here? Shouldn't this be under ring->write_lock?
>

Hi Herbert,
this is really to tell DMA that there is new packet to process and
gets decreased instantly.
The lock is used to track what descriptor index should be used in the
ring in the put and get
functions.
