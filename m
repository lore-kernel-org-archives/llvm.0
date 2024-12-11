Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C231238E27
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917218; cv=none; b=UlpgkZ1EXvFFfj6DNB3872gKZ+MjFFGtMwQg0051XBjf6VczVZku3afgi7jO1RcuvARtRVWHJ3rg3uI2lv1wDQNu3Q20vK3DmZ6PSHSvoHZ/q/nGkLTG8l3xEtTMtp5ipwwxCSU/Sz+8YNSZNIdujOlBUFPm+6THsGJErzG0pjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917218; c=relaxed/simple;
	bh=VHGL3u0EdA+ohBMKTYCA0Q8nxt8Cql2CiG/tIRN+9OE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlQPhytARtdHt2x/Y1iV+Ydx3gIHRFuV9gqAECDLVVH/mMZiGo9R9OiVMTYANPnoc9tnJEOgUcW/16dAIxBPO9brmwx5TgqfCXSUNz9ISrl7cupNoCUKA/vAzgVYXmcnbde/XC7fWPrQJMMTAoh4LBJcl+5Q7TNfICodFE02tpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwpqIZ2u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwpqIZ2u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso3833587f8f.2
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 03:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733917215; x=1734522015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qlvml2G4Xi5ig1v0QjPfVDw4ozpGhiPCOsava1Ml8Js=;
        b=dwpqIZ2uwm89PMBxsPphhjlWm7LAS8hP36cYqBm9FfyyZzzbcMRLKLzQWYWiUtGlIE
         is7spxybwaTRrfWeu5xAtK/PprEJAmdHJMJRz5FDXBI/o75tV16WZsDRyCAEW/0NpiMT
         kxapydlb0ca0lBnYgU1HYC7gNIyZDFuTPIGgZyyQCaNqVf3j70wRZ7l/ZHUZLWr3QLKI
         T28F1vr4gP9c0BRXrDF20yLWQu+dvVgwoNzQwpOCA4YXj2bL5uP4duxc4D8is3mGwgWg
         m/2WCaR+AFEcgzk+WhWQ5MJ6ma5CsclOj0noDJP8sSl2qMn5jIobfk1vCvyniTD0w2GM
         8xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733917215; x=1734522015;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlvml2G4Xi5ig1v0QjPfVDw4ozpGhiPCOsava1Ml8Js=;
        b=RpNZjTAUyHjMkx8Sa9RS+oR/lKuxaCmLTSfCij7/p9eAUzxU2GZW3Trek2FwfhS2ix
         vP5qw6+EvPVR6vIUZ20UCcugpD3gLlkTIrzuA5QpRER8fRB35obIIT9hLd47MLTPNSer
         xMwIviFQ7YTJoUsPAHqD/r8d4j6AhGyo1Y1o8gwwttJKAu8D4cor3HI+p70OvZlmhssk
         vqvIi885HODo0nkue1dniC91/9j1bOJvNvX57S4cQDNc3TWOoaCraC0dLbGhfqaQMBAY
         L6mgtLL/kCxc8ERvzJYqm95ORwouq/LDJEt2Bk+XcwMmZ7+1jCYMwlhCuPfZgQaxnuPz
         kAKA==
X-Forwarded-Encrypted: i=1; AJvYcCUHMxi057cpaja2rkUWIS/1AeaOHh5RlnFzHjwlKn39dV9HY0eQQ8OOGWXOeIKPf+5h6YZ4@lists.linux.dev
X-Gm-Message-State: AOJu0YzTdzT3nLU6Qb6bn2z9jporSxas1JsG/sCod/mSKtHqpcGfckBg
	7/EEjRFkUPHLY8xDHN3dByceDyxIKMdXVQhdIuIEnRdVtG/40hfB
X-Gm-Gg: ASbGncvtarBTvv2+//DG1BO27GmDT1zyMub5U0Niupn0Rucz7/PkcMG3Tea8OOgGspO
	5gXkD3GEYXRhUDPpECng9oPiUBShNwX4eT5RghVAV1oRqpOCYQeTdhe2y/R7htxRmw23C4H0y4H
	VFvWd7NL19VODwYr/mdELhuTVaGnKzYR2+oOIcqrbnNghnTj2mKNqpDTF1XerQR/z3Fg2+2p+t/
	tNxs1EItfuDd1hlk4yRDGtpDx19Oc+y6krhjlg7qiYsXPrrDo/y1evlJC4a4JIUPzRgxo87eMDY
	31nP7QdwOw==
X-Google-Smtp-Source: AGHT+IFiA1Xf7QFgwYwlmpgBDu0fCeGNMpapKx4zkoOoVFH/jisTnTeHhTBy5KZBO/+3QOQXv20ouQ==
X-Received: by 2002:a5d:6d03:0:b0:385:e4a7:df09 with SMTP id ffacd0b85a97d-3864cec7063mr2403857f8f.44.1733917214360;
        Wed, 11 Dec 2024 03:40:14 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c2bf2sm1079314f8f.55.2024.12.11.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:40:14 -0800 (PST)
Message-ID: <67597a1e.5d0a0220.9b04.2bef@mx.google.com>
X-Google-Original-Message-ID: <Z1l6GYZY1dHMKb2S@Ansuel-XPS.>
Date: Wed, 11 Dec 2024 12:40:09 +0100
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
 <Z1ldzyPKgoD8GZfx@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1ldzyPKgoD8GZfx@gondor.apana.org.au>

On Wed, Dec 11, 2024 at 05:39:27PM +0800, Herbert Xu wrote:
> On Tue, Dec 10, 2024 at 09:48:33PM +0100, Christian Marangi wrote:
> >
> > +static int eip93_hash_export(struct ahash_request *req, void *out)
> > +{
> > +	struct eip93_hash_reqctx *rctx = ahash_request_ctx(req);
> > +	struct eip93_hash_export_state *state = out;
> > +
> > +	/* Save the first block in state data */
> > +	if (rctx->len) {
> > +		struct mkt_hash_block *block;
> > +
> > +		block = list_first_entry(&rctx->blocks,
> > +					 struct mkt_hash_block,
> > +					 list);
> > +
> > +		memcpy(state->data, block->data,
> > +		       SHA256_BLOCK_SIZE - rctx->left_last);
> > +	}
> > +
> > +	eip93_hash_export_sa_state(req, state);
> > +
> > +	eip93_hash_free_data_blocks(req);
> > +	eip93_hash_free_sa_state(req);
> > +	eip93_hash_free_sa_record(req);
> 
> The export function should be idempotent so it shouldn't be freeing
> anything.
> 
> In fact this indicates a bigger problem with how DMA is being used
> in the driver.  You shouldn't be leaving DMA memory mapped after
> the init (or update) function completes.  It is perfectly legal
> for a user to call init and then abandon the request by freeing it
> directly without ever calling final.  In that case you will be
> leaking the DMA mappings.
> 
> So make sure that DMA is mapped only when needed, and freed before
> you call the user callback.
> 
> The import/export functions should only be touching kernel memory,
> not DMA.
> 

Just to make sure, this is only limited to DMA or it's also problematic
to the block list? Aka NO FREE should be done in export or NO DMA FREE
should be done in export?

-- 
	Ansuel
