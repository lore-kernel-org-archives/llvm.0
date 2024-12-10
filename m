Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1999B19E96A
	for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733831711; cv=none; b=upQr6XqkuY/X3SRK8oDjPzO8U5BzQsvFwR0hEmYOcBu0wD/UEEtAIcBu17NDlW39hJmobU8GXyYXqjijqilDZTqKIbqlPWO7XeMcAltHoLf4SFHm6jzeiv5WhJR5ySE2aOyq8qFkBUwo/ylodP0+GS8aGTyFTUTD0EkNaMLGG9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733831711; c=relaxed/simple;
	bh=FFYRaVt398kWlY3AcePts9f2SooVUww1t10zGlceo8M=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/CKsc0itaT5uHK0duc/ma4vLDDgCyM6mg4dtEhvgWpB5trkjz9zyUQSEQzP7ail3sxCIFTT1ojXuRXRbJeUugpxbCyClhri4XoSbTtI5QZo2ah4AIGhKcTwZaAt86C5POF5KX4pTYwdVTewl31ZuSQeNgm4XlCMa8LLLW9jx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahklGbLV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahklGbLV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434e9716feaso18211615e9.3
        for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 03:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733831708; x=1734436508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GxtTqQBTIL8qkdLSUdzE6PIJ9G6FWWi9p3lyqXCUMq0=;
        b=ahklGbLVbaslfsiLJ2HOlmgRXYYocmR4cyuz9RIMVnmAsbcRFGauMvvicMJd6oE+ZM
         TYgDMP3IDdB/h9rbJhk8/dFshEGE5FnZfACIHBbh3UYYR6f4ArdLV5jE6UcP/e7l5Mun
         KbWuRG2UAkR+e4yFwltmXU2+9iHmgZCH4CsjqQFM5nVOcaAsVElstUv4bQy3unmyIqqq
         qDelVaSsrc2PhsBqFT6/FjGP7ZdihGC9Gf9UnZr26Q/vMkGhfyzv4rjwwctZqouxM18G
         nkfut4QpUJNE2XyPQJiT9FZn/0RQcytkjEgaGY/QqlFlpZ58GmwZ++UG9eF06IbuunIq
         3d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831708; x=1734436508;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxtTqQBTIL8qkdLSUdzE6PIJ9G6FWWi9p3lyqXCUMq0=;
        b=XfEO3e9yEZ85kIJFGOOxRuH49y+BNVCaBndeoVs9H+LRTD8o4gDlj80NcZMhlgr/Hy
         DGiCjSj4glFbkWXqvPfuYL+TXnLPVB0IK7JLuLvWATyimCpu2FihYDVzcR7398AMCytK
         j+r6ZzExu38NdGMjrfNJfjkccYJCyyrz0IHDAhJ8OhovmqQn2rmZp0jNlL1WI68TPrqQ
         phD/Lcn3Z1swrV5aWBVDovnVjznmqhwKmcTnqbk/7cRPSD1yK/1dwdReb7YqM12EFQI6
         sATmYM78WgrEgZqfl3xFlGiCuYTX5utHTXIaltKiVYFkHoZ4SnDEfjYMcTi5gkIeXcu6
         zTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC0w9z6bv8/jIEcPpPO+Gn/pYyXYOMCrPhFd9QDFjX/12UpF6JBH56B0cp9WVbOSv8/4kD@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1M+BOXkPIxBtVIeoR15ur4JirHGkBD2rJr6qp+YiESwmONaX0
	bLYfC1Y+7JxfFth0hOBsOXHMUAkpRX63vovUfb9+d/OXf4QChqYH
X-Gm-Gg: ASbGncvgUIgqxKFDsxMgQU+F5Dd3IpwOxFJ89mQqe6HjosPesche22cDCH/BE/aWoW2
	D2bqCaaCMJWNkxCBQ+VNNhPqYkjr0h1XujRAI77CZx8lbnckL2Sts3puwzkwXbaj8UEER2i3K2P
	PIbvRp2KUBFkJk5KY1N7lrUR6yYDvO8rJ29W9qusdoGIw/cR+p4d37Vj8Wrj0tFPNAW0LcYrPLQ
	E3bkg8ROH9GLS8ao0lq9HGnOxbUBbamASeDinrSHX9GEt5hY8IoQXybdJpqutQmkqCPDjpO6Xfb
	qbJ6LQn0aw==
X-Google-Smtp-Source: AGHT+IEqPyQZxvaTdaCGPBbnnyYvA3iFt3x9GqsjfxRLDxoVwreBtdhs6qFT0if4l4gCopK2n/CUaQ==
X-Received: by 2002:a5d:6d86:0:b0:386:378c:b7ec with SMTP id ffacd0b85a97d-386378cb923mr8329503f8f.58.1733831708190;
        Tue, 10 Dec 2024 03:55:08 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386329a15b0sm11246137f8f.45.2024.12.10.03.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:55:07 -0800 (PST)
Message-ID: <67582c1b.050a0220.83ef5.c8df@mx.google.com>
X-Google-Original-Message-ID: <Z1gsFv24WRhhdqlb@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 12:55:02 +0100
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
Subject: Re: [PATCH v7 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
References: <20241112015920.22564-1-ansuelsmth@gmail.com>
 <20241112015920.22564-4-ansuelsmth@gmail.com>
 <Z1e0LHycNGcWqd2q@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1e0LHycNGcWqd2q@gondor.apana.org.au>

On Tue, Dec 10, 2024 at 11:23:24AM +0800, Herbert Xu wrote:
> On Tue, Nov 12, 2024 at 02:59:00AM +0100, Christian Marangi wrote:
> >
> > +static int eip93_hash_export(struct ahash_request *req, void *out)
> > +{
> > +	struct eip93_hash_reqctx *rctx = ahash_request_ctx(req);
> > +	struct eip93_hash_export_state *state = out;
> > +	DECLARE_CRYPTO_WAIT(wait);
> > +	int ret;
> > +
> > +	crypto_init_wait(&wait);
> > +	/* Set the req callback for hash_partial_final wait */
> > +	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +				   crypto_req_done, &wait);
> > +
> > +	/* Set for partial hash generation */
> > +	rctx->partial_hash = true;
> > +	rctx->export_state = true;
> > +	rctx->state = state;
> > +
> > +	/* Save the first block in state data */
> > +	if (rctx->left_last || rctx->len) {
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
> > +	/* Call hash_partial_final.
> > +	 * This will send a dummpy 0 length packet. This is done to
> > +	 * wait for every descriptor to being handled and sync the sa_state
> > +	 * from the host. Partial hash and any other data will be copied in
> > +	 * eip93_hash_handle_result()
> > +	 */
> > +	ret = crypto_wait_req(eip93_hash_partial_final(req), &wait);
> 
> Sorry, you can't do that here.  Your hash state should have been
> exported when the request previously completed.  The export function
> must not sleep.
>

Ah that unfortunate but doesn't that goes against the async idea of ahash
OPs? Anyway is busy loop acceptable here?

The main problem here is that .update only enqueue packet to be
processed and we don't wait for it to finish as that would result in
really bad performance.

To export the state with the previous request (.update) we would have to
wait for each packet to complete or we would export the wrong partial
hash.

The process is fast enough so busy loop here should not be problematic
but waiting for every packet sent to .update on being processed might
introduce big performance regression.

Thanks for checking this hope you can help me understand this.

-- 
	Ansuel
