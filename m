Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E333F3
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126623; cv=none; b=iV+hKN+OxBvpuvGGO5+6GCSCHuiV4o/VTHBtNMnogHMFQSKYLbnKPlJ7njI5ffui9HQn5R0L4dupSHB5KGS/ERs5or2oHW3SmlSgIMqI75wBNulEOBzXARUHKm4G81VuXhsdaZNE+PhMd3uSRKFFbGswF3HYHbYOjGOA2GqiOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126623; c=relaxed/simple;
	bh=8dk3jQXqVNLtNBSBu8i0zu9YlvX2SJldVag1wY9K7lA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWDlLLsBwc4H5dID+E7ZLZ0LoyfkgZkUJnYQlezdQ87Qwy7mx+bQt1fG0UMd3LI2mU0bIPWHzHaMeyEMVaUqMamVRi4/rUFPCDgA0RHR+CIqIQ/1+5XLjrkpLg8KqFgWSQMDMOCxF5FdD4ZdNUAkdRKXxRRDVjqMKQB/H3C25fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/NrIJ0x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/NrIJ0x"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so3283976f8f.3
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730126619; x=1730731419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0o9UR6/T9IDZWX4PfCYo7WA8X0C5Y7vXRC8iiUeqkNw=;
        b=I/NrIJ0x5Bwu0rqCkZWckllH8S5pleB5IDYKc/FEjIqa7LxMuIKmWP8KWlTKZbEKJe
         nzGlK/hOXifT+5Xtn09FmTMbACvbzflhVdH9FSXPFDzeKmd9tF02F/clZLDuWSbtMXoP
         w6rDxt7RC9IIvYME+dWtb/Q5FldG0wcbmzf8tpp+k40dvMPXRuZ/T6rHNY4RpyOgmoh8
         dDMLS19Y7oP3Y6lBZTRcUu8M83dhivcT+UH2LKPVs+2wk7fUZKtejqihqo1uFgGED8Om
         6TTql4QlCyy11eivC4PbQA6/d2gcP717hyVWjwcJ6ca9TEBFjZ3EMpZ++aj+5Nu8i1Bc
         mB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126619; x=1730731419;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o9UR6/T9IDZWX4PfCYo7WA8X0C5Y7vXRC8iiUeqkNw=;
        b=ZFaxjemg1o5Xu7NsBg4e7rXJeZKeerpQgTQuJ1nZRVD/tNw+ZdZM/yvZB5oFaBO8+Y
         exGQXQBcw3Y30WlcHOJTQoJwhlF3ivCq8BDOrSLHzJiiAbggS51vXM+1eCbOCEK4241Z
         P82w/wTLkmMtH5BJ1iw1jp8bI8a9oJZniPBGIziO2xA/XoxEFymdJIZtlsszVirWwhN4
         YWgzDIrgrfCM1ak1KsqF/xn+Pw8uAj2QF/ckepD7U94quQcG99pFgPbsXuDHT3bM2lzf
         KCI+S3RJk5Tes3FoFCdE8Be7+6XSi1kAlmGG/5vCKbw1X0fxgr6ic7g2I8GcEuJWYqLy
         BW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkoqXFYz8gx1aS3KRruVWeOjvRonCTXa5QbSuCNGs7e9yV4NhHTV8PRWgiXDb3FYUXv4an@lists.linux.dev
X-Gm-Message-State: AOJu0YxR0y4+UO/Z5Pt8AgLlgYUVMqtNygqB4MJ/7PEdHCxNV9wzqGlI
	h1fY+YphRDcEFptrTCYBPnoqn2T6wv1rTTCYx/cQc4u5aklRJqmj
X-Google-Smtp-Source: AGHT+IFVLEdQhrVQexeTh8VZ2u00+D168l91ubbaWPiPvFI6RdA1c1AyL40rbbrSIN3jQ/kPERYfEA==
X-Received: by 2002:adf:efca:0:b0:37d:5103:e41d with SMTP id ffacd0b85a97d-380611eecddmr5702661f8f.39.1730126618689;
        Mon, 28 Oct 2024 07:43:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bb62sm9699237f8f.29.2024.10.28.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:43:38 -0700 (PDT)
Message-ID: <671fa31a.050a0220.12b1fe.157e@mx.google.com>
X-Google-Original-Message-ID: <Zx-jFqvjwjZD91UR@Ansuel-XPS.>
Date: Mon, 28 Oct 2024 15:43:34 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH v5 2/3] dt-bindings: crypto: Add Inside Secure SafeXcel
 EIP-93 crypto engine
References: <20241028124206.24321-1-ansuelsmth@gmail.com>
 <20241028124206.24321-2-ansuelsmth@gmail.com>
 <20241028143515.GA792452-robh@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028143515.GA792452-robh@kernel.org>

On Mon, Oct 28, 2024 at 09:35:15AM -0500, Rob Herring wrote:
> On Mon, Oct 28, 2024 at 01:41:42PM +0100, Christian Marangi wrote:
> > Add bindings for the Inside Secure SafeXcel EIP-93 crypto engine.
> > 
> > The IP is present on Airoha SoC and on various Mediatek devices and
> > other SoC under different names like mtk-eip93 or PKTE.
> > 
> > All the compatible that currently doesn't have any user are left there
> > commented for reference.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v5:
> > - Comment out compatible with no current user
> > Changes v4:
> > - Out of RFC
> > Changes v3:
> > - Add SoC compatible with generic one
> > Changes v2:
> > - Change to better compatible
> > - Add description for EIP93 models
> > 
> >  .../crypto/inside-secure,safexcel-eip93.yaml  | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> > new file mode 100644
> > index 000000000000..188240b74110
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> > @@ -0,0 +1,67 @@
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
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: airoha,crypto-eip93
> 
> Still doesn't look SoC specific...
>

Oh ok I didn't understand that I had to drop it.

> > +          - const: inside-secure,safexcel-eip93ies
> > +      # Compatible that doesn't have any current user.
> > +      # - items:
> > +      #     - const: SoC specific compatible
> > +      #     - enum:
> > +      #         - inside-secure,safexcel-eip93i
> > +      #         - inside-secure,safexcel-eip93ie
> > +      #         - inside-secure,safexcel-eip93is
> > +      #         - inside-secure,safexcel-eip93iw
> 
> I should have looked at the driver before commenting before, but since 
> you are using these compatibles, you should go with my other suggestion 
> or these will be listed as undocumented.
>

The other suggestion you mean with the false or not: {} ? I tried that
first with 

- items:
	- not: {}
	- enum:
		- ...

But make dt_binding_check always complained. and False had some problem
is compiling the yaml schema.

Sorry if I'm making this very confusing. We can also consider using SoC
specific compatible in the driver directly and just declare the generic
one here.

-- 
	Ansuel
