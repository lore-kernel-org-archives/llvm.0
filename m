Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B420C31B
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729877915; cv=none; b=RzUE/a69RpwSwCFON4IyNwb5Q7F8lZfquz9oMVG7lznbEUH32T8nn+76pMtcDfkpgcse88n6F2l9HfbNoeTZbyZwH+DYOuD4ILltg1Mu0a/vWD4Gm6IsJGww9FJ1IB/AD4vx+D2i/WJlTo28RRVXs8ia4gZU2v7O2qOp0nSP3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729877915; c=relaxed/simple;
	bh=gD7gai+8+e+XqyRYz6DgQyaNtMkK8qGXrU7mo/3ff9Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m08K002GBKYOyq1wKaGGobqDhasXcb7wac218YrjaMXAtP2rAFxy7IkO40WrysQUlYSQMHtuNKmzDLwIxjWn1LRcDXyhugn3UWNBsxcEg5G3N20HLHPYW/ZZr1O1MQHzQDgSmh77fyvD30UKPEb53ji1mNdG6S7Iv7Ej193UjpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdlYySC+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdlYySC+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so1457394f8f.2
        for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729877911; x=1730482711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=icrbjufJnRgwt68MAU/y4XC+360m+aOHWM5i4IT1Xks=;
        b=YdlYySC+X1FNMIE6rSlWEXigEKlfu9jJ/boNtJCMv2dgJ4nFSZS+lesfqsv8I3O0Sf
         oWdZ+HSOu7Iw3FEMq8mp8uD5RKW8osLYllBdM2xYB6BuIR8FfCtLPUFguXWgDuIc8p7z
         QyR6jt/jR7bi3SfbJ6raBDYTHn++D2pbCECzrPygUWOJHQY7GWeCtVcJyygE0D3qs/ag
         6i5+y4Ll4XjxdvH+yd04HkqyTixjI9rTNDaJ0uuaexO/y7UDDKag/3DP6eNX5oP3eHQP
         Xzzkf0zze6mwPQZ/5mY/C/fPuBwtKYzpAkAHyB4+7CDvh1BYvMgDmI3kt+lOhdFDA2jw
         EJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877911; x=1730482711;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icrbjufJnRgwt68MAU/y4XC+360m+aOHWM5i4IT1Xks=;
        b=s9YZ7m3WYltukj1VaPo76wSm4us4RQESDpZnRpifGNKTrzvkgO9MPDgmESAIQ6tw12
         01yninOD8mCDEsJnsrk+pq0VhSbtwul6LOKX4/dUBjIdBxuGnkhMqV2gXnEDsJQOXrYf
         bON5Fr6I6wqvVHN5xt1tgfqE8KFVZV08T9V/eSNXj2e/cif8koHC7h45iF+XQ9H4LFjx
         X/vqQMBvtQEKs9LyODlj5l++CDI8fxn68hnUwXrxC8BdxbIYPkBJeS2J4DPUdejZ4tav
         O5gXXrdkv0hz6B/Zu/qT962V5q8Ah/pfyhOOypYLsxMvL6K56Z4tLZ1y7By/HdHsCtVj
         Fz0g==
X-Forwarded-Encrypted: i=1; AJvYcCVWYx53/hZXEyWud4JfPVyk+pRaRUTCx0VgWu0Tk7tTjGZK5PnTV0SLwy7ba3++fjysZrwY@lists.linux.dev
X-Gm-Message-State: AOJu0YyOzvI0skzNZaj7+1n5Z0zk/+wGvUXkgufNsSnh5pY51t2EUsDX
	LP8tmwQJ013xNWbB21YdKr3aS4PVCibc3K8PPpjN/Ev+QWuaOp0F
X-Google-Smtp-Source: AGHT+IFcGZFAS8CInDpA9qvFdcQqnYrmtRC4DUQ5GHTNRF3RvoHorTdnAhB8kgVDB0PC1FrWTEt9iA==
X-Received: by 2002:adf:e0d2:0:b0:37d:493c:f7b8 with SMTP id ffacd0b85a97d-380610f245dmr173222f8f.2.1729877911277;
        Fri, 25 Oct 2024 10:38:31 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b712bfsm2071948f8f.79.2024.10.25.10.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:38:30 -0700 (PDT)
Message-ID: <671bd796.df0a0220.216be3.8504@mx.google.com>
X-Google-Original-Message-ID: <ZxvXkl10_RuUJMxW@Ansuel-XPS.>
Date: Fri, 25 Oct 2024 19:38:26 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
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
	llvm@lists.linux.dev, upstream@airoha.com
Subject: Re: [PATCH v4 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel
 EIP-93 crypto engine
References: <20241025094734.1614-1-ansuelsmth@gmail.com>
 <20241025094734.1614-2-ansuelsmth@gmail.com>
 <20241025-marmalade-constant-1c733ef5f3e8@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-marmalade-constant-1c733ef5f3e8@spud>

On Fri, Oct 25, 2024 at 05:44:39PM +0100, Conor Dooley wrote:
> On Fri, Oct 25, 2024 at 11:47:23AM +0200, Christian Marangi wrote:
> > Add bindings for the Inside Secure SafeXcel EIP-93 crypto engine.
> > 
> > The IP is present on Airoha SoC and on various Mediatek devices and
> > other SoC under different names like mtk-eip93 or PKTE.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v4:
> > - Out of RFC
> 
> I left comments on v3, that I do not see addressed here.
>

I missed them sorry, I was confused with the other reply about RFC not
asking for comments. Let me copy the comments here so we can continue
here.

> > Changes v3:
> > - Add SoC compatible with generic one
> > Changes v2:
> > - Change to better compatible
> > - Add description for EIP93 models
> > 
> >  .../crypto/inside-secure,safexcel-eip93.yaml  | 63 +++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> > new file mode 100644
> > index 000000000000..13341710ee31
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/crypto/inside-secure,safexcel-eip93.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Inside Secure SafeXcel EIP-93 cryptographic engine
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: |
> > +  The Inside Secure SafeXcel EIP-93 is a cryptographic engine IP block
> > +  integrated in varios devices with very different and generic name from
> > +  PKTE to simply vendor+EIP93. The real IP under the hood is actually
> > +  developed by Inside Secure and given to license to vendors.
> > +
> > +  The IP block is sold with different model based on what feature are
> > +  needed and are identified with the final letter. Each letter correspond
> > +  to a specific set of feature and multiple letter reflect the sum of the
> > +  feature set.
> > +
> > +  EIP-93 models:
> > +    - EIP-93i: (basic) DES/Triple DES, AES, PRNG, IPsec ESP, SRTP, SHA1
> > +    - EIP-93ie: i + SHA224/256, AES-192/256
> > +    - EIP-93is: i + SSL/DTLS/DTLS, MD5, ARC4
> > +    - EIP-93ies: i + e + s
> > +    - EIP-93iw: i + AES-XCB-MAC, AES-CCM
> >
> This implies that you should have a non-trivial set of fallbacks, with
> the "i" model as the base for that. eg:
> 
> "ie", "i"
> "is", "i"
> "iw", "i"
> "ies", "ie, "is", "i" (I dunno which would be a better order here)
>

These info are what I found around since informations about models are very
scarce. The driver itself makes use of a bitmap in the IP to detect the
supported stuff so the meaning of this is really to comunicate the set
of feature mounted on the system.

Any hint on how to describe this better? I assume you refer to some kind
of yaml logic structure to put in the compatible?

> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: airoha,crypto-eip93
> > +      - enum:
> > +          - inside-secure,safexcel-eip93i
> > +          - inside-secure,safexcel-eip93ie
> > +          - inside-secure,safexcel-eip93is
> > +          - inside-secure,safexcel-eip93ies
> > +          - inside-secure,safexcel-eip93iw
> > +
>
> I don't really get what's going on here. Why is the first compatible the
> generic one? That seems suspect to me, as I doubt the crypto block on a
> particular SoC varies? I'd expect to see some soc-specific compatibles
> with a fallback to the inside-secure IP version that it integrates.
>

This was already discussed and hoped this solution was accepted (I
didn't get any reply in the other revision, so I'm probably wrong)

Everything started with:
- airoha,mtk-eip93

Was wrong as the compatible wasn't clear on what mtk was and if the IP
was from airoha (it's not, it's licensed to...)

Then only the inside-secure ones, following how it's done for the newer
inside-secure eip197.

Krzysztof then suggested that, since it's licensed but OEM can make
modification, it should be sensible to put a compatible of the SoC where
the thing is mounted at the front of the other compatible. Eip197 should
have received the same treatement but for some reason it didn't.

So here in v3/v4 with this proposed solution.

First compatible is SoC name, useful if the Vendor made modification to
the IP. Then the generic model that describe the set of feature
supported.

I checked the register of 3 different device where EIP93 is implemented
and they ALL match them. ONLY additional register are added for debug
purpose and never conflicting bits are introduced.

Hence why IMHO it's OK to use the combo of Vendor + second compatible
for the generic implementation.

From both comments I'm not really sure what do you mean about fallback,
anyway hope it's clear now.

> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    crypto@1e004000 {
> > +      compatible = "airoha,crypto-eip93", "inside-secure,safexcel-eip93ies";
> > +      reg = <0x1fb70000 0x1000>;
> > +
> > +      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +    };
> > -- 
> > 2.45.2
> > 



-- 
	Ansuel
