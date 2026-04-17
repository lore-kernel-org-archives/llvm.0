Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632C35F195;
	Fri, 17 Apr 2026 03:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398359; cv=none; b=ef2Yxl6e35Y/C64zBJqR+i6XMB/hNQ+7AtX909xWNyYOi9ZjntFs5X2UzuGvLEk+oiHkBZTcEwNon+jRlpkUJGqASTvDpBboe98nShC+Bly9W9ibs2F5qr7oZI8IDUfyTX2v87WQGK4QZ+Q1nR5PkN9F/sGif9vklQo3ZN8X/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398359; c=relaxed/simple;
	bh=W413nTUQt9syTkYqNXkH7OUxoH3prUNC6+YLpUVy5QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKilHVU8NqT0tnGtWWhUejbgc+9A3FKoQD5sdl+/xsDf5suExqA6J972O9TXccbnAGkkqS5P/MKmEAaqyM69wdBiuMi9o7ZDIkMBpQ/BwY4F1T56YHHm9DWRTkbeRKZrr6cQUKcuG24y0d3Vb4Uij7Aoxpcv+CLyo5jt0JwVTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=hkDRvoiJ; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="hkDRvoiJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Aw2wqVpV7hb0Fex9Jx2jUe9MxZi+2znPOI1abQ6xsGs=; 
	b=hkDRvoiJd9PK5/0Xf7paOTx+9PrAV6Y+agHZbI5qFk06lgL9cjYxNJEQQaKVPyjfEGWraSVdPSZ
	41+ERGE0nx+1Tss62p3Er50q3z4vacq/Q66m2qJtfOS7T8672l/xVUljrhgX2fnd/rPOAWyjroYxo
	0z1t8znsDraieNc15awNU+ebYHsTTgpcXKW45bXvySGFBN+cnZjbRV6e2oNqjlOLJ1DCr16CaUUv/
	AQCNcmyJ2vKfd5x/Q6129Pwx5MMIkzQivU05kIx5D9ek/ydEE6xjXP53ZE41Vu8W3ZpBinvFSLcu7
	lv2CyeAd7/XF/j07+3YEOJtfq8w+PtVQeczg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wDaMK-006iHS-0P;
	Fri, 17 Apr 2026 11:59:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Apr 2026 11:59:12 +0800
Date: Fri, 17 Apr 2026 11:59:12 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: David Laight <david.laight.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds
 limit (1024) in 'hmac_setkey_ahash'
Message-ID: <aeGwENQpQIlY1-d8@gondor.apana.org.au>
References: <202604161035.PMTaI4Cg-lkp@intel.com>
 <20260416112406.68b7afcd@pumpkin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416112406.68b7afcd@pumpkin>

On Thu, Apr 16, 2026 at 11:24:06AM +0100, David Laight wrote:
>
> >    250	
> >  > 251	static int hmac_setkey_ahash(struct crypto_ahash *parent,  
> >    252				     const u8 *inkey, unsigned int keylen)
> >    253	{
> >    254		struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
> >    255		struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
> >    256		int ds = crypto_ahash_digestsize(parent);
> >    257		int bs = crypto_ahash_blocksize(parent);
> >    258		int ss = crypto_ahash_statesize(parent);
> >    259		HASH_REQUEST_ON_STACK(req, fb);
> >    260		u8 *opad = &tctx->pads[ss];
> 
> Is ss actually guaranteed to be not smaller than bs ?

Yes, it's checked in hmac_create_ahash:

        ds = halg->digestsize;
        ss = halg->statesize;
        if (ds > alg->cra_blocksize || ss < alg->cra_blocksize)
                goto err_free_inst;

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
