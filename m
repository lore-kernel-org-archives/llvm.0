Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED182C2ED
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734183157; cv=none; b=rcYZJDrjPbaZfpY0760ysZFv+gQEbC9nSSYXqv9R0kp/+p9Uem3+nw5I7wPQZb8LJYhiMPZ+dKtynI34zdlOLEE9P+vJOP0qNWjFqDrfXpMfsDkkLSPGVxYEXvvzrezpYm1bGWY82AyZTPfMuUiTAk98S1wm+O2kPfJuEJvGEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734183157; c=relaxed/simple;
	bh=rj7r3lu0zdXSXQRfn+FqEwD9DtqSI15OA0S9yniDho4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5aN8HuU4I4pUiJq5XkHRnNutmnZvmehWnuF6pCwrasB4EOfKPVNwIeI6Fjhzit8r/mtuHmX4fEGAlotPejabXi5iKUbl9s+iyFSqe6G3JoVKbmR4wYiJcslu07NqjpDbnnvLxY3uszG7lhOZxxTSjeck0ShxOrbozGzoyKmVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4VlVlc7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4VlVlc7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361c705434so18850155e9.3
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 05:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734183154; x=1734787954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9g/vBJjPtbTlrMR1/eypOk5GU1ytqwbwGWCidwQB9RM=;
        b=I4VlVlc7YMMF+AJ0QzW57PM4+ZgjRly47h0uSkAGOU+FhemnHLjTaUG6J/HPcpqjNF
         84iYj9NhxNlHFGPNd4XNCJmKaYDMI9ZSCC+6Kldh9QWKSTj4DyjbpwQCvmudrI2sBKfx
         zF9os2UwtespJTSVUZj/9+mLUzKnwCvX0OeqtQlgcUjhOIeOF0sjk2jPAqhHo4wQtDxP
         KeSrXGpqoCyl5oKGpf0LX5XXz2rZm1Vt6PQ/4qbsWSktLfmskGcfsgOQa6AP9fd4Eplk
         l0wMZjuPHLo3PI5iDElqlE3snNT1BtO+aZqDJWz0Cpf3eddF5CbUBTS/Y5yVv2AYXI0A
         O0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734183154; x=1734787954;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g/vBJjPtbTlrMR1/eypOk5GU1ytqwbwGWCidwQB9RM=;
        b=Hi/u5WLTJqD0MlqK3ouirfjDGqi26D1+doAmwZN5Xbuz0oUxF8SyWrAbKCV6G7Y6TG
         fIfnKeOeIolxslHwR1ObLbd73v+EPA6aBi+8G1B43SO0fx2EXR12/e1zmwsBN8yA/agj
         rX7Ah26wpkOSwTPiCh6wt9ZA+ys9CMF2fqS2SLppFLJaarWMUcpddw75HNCbknIjxhgt
         jd9UFO43Mfd2QE/5eRVLhuBdDbiWo6NmBVpb6DkU65VVRynzg/GkSc/7XnOi9eKLSk9S
         Ob29yesmzl9SQYYfRGMtKm5ES9oNQycbZcuCs2jb1KPjvyAoz2kzrpA8ZCOVrt3ZWQhr
         Pgnw==
X-Forwarded-Encrypted: i=1; AJvYcCUVT781yXGzbaifqNpZ6iZ9j66N3FUDa1uuQyl1xhIGga8eL4XfxgntLKatllmF12YL/Nbn@lists.linux.dev
X-Gm-Message-State: AOJu0YwJeZOdYdh5UJPKGJiDYolfyi8v1RuOC+E7xk26bjVDkACsRW+D
	hvzdZIC75f4EAae52blpaP3HhWrWAXt8B3fw38TbBM7LImFtkK2d
X-Gm-Gg: ASbGncsdPdBUrJFF2NAoFktEMqHPOwQPfyEmwdTGgbFN2Fs8mQrfhtb9WqWYdy8AVtG
	wceqpXmRwk8dxcYsH2LUH0OV0snPjzx8ojWET3Q6gW8HLWilUVmGHboSLu6jAdayiwBe2/FIihE
	J/fJ40F6Mrumc/oqjvmgf9QTZbvBG8Ul/14xYQMt6hyqaK8fmgPOdOR+qk06JuA7tJrCRg8882g
	nQAeNxxp+jWYNY5h28x9WrX5hKKEsPwCfprZxjd5ZLC3nS8bB0GRTwMIQjq4VQxN3p2uLSh2yI2
	+84Zq5XaeQ5x
X-Google-Smtp-Source: AGHT+IG8g4EFy0ehsQjwuqYvjL5RmWXOXLQffYHq1JWYKvL48y3hP5A1jAeo0WRLGRPrGmDNGVoJCw==
X-Received: by 2002:a05:600c:511c:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-4362aaa9cb5mr46725015e9.20.1734183153978;
        Sat, 14 Dec 2024 05:32:33 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363602d76fsm24359015e9.18.2024.12.14.05.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:32:33 -0800 (PST)
Message-ID: <675d88f1.7b0a0220.325e04.7513@mx.google.com>
X-Google-Original-Message-ID: <Z12I6nlTPOqnIoi2@Ansuel-XPS.>
Date: Sat, 14 Dec 2024 14:32:26 +0100
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
 <675979e5.5d0a0220.207826.2bf1@mx.google.com>
 <Z10LgtZm4-qCB2aL@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z10LgtZm4-qCB2aL@gondor.apana.org.au>

On Sat, Dec 14, 2024 at 12:37:22PM +0800, Herbert Xu wrote:
> On Wed, Dec 11, 2024 at 12:39:13PM +0100, Christian Marangi wrote:
> >
> > Do you have quick example for this?
> 
> Just search for crypto_ahash_set_reqsize in drivers/crypto and see
> how they use the reqctx to store temporary data.  For each request,
> you're guaranteed to have exclusive ownership of the reqctx.
> 
> If you wish to DMA into the reqctx, search for ahash_request_ctx_dma
> to see how you should set it up.
>

Oh ok I didn't understood you were referring to the request_ctx API
thanks.

I just pushed v9 with the requested changes done. Now we map DMA only
when needed and use local struct instead of kmalloc. kmalloc is only
used for blocks. For that GFP_ATOMIC is used. The ALLOCATES_MEMORY was
already set in the algo flags.

Hope I'm making good progress on this.

-- 
	Ansuel
