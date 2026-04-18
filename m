Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA9C19A2A3
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776504744; cv=none; b=Bj3hsDNh8syYRfgn6bHT4I/vKuhVbOC55uNOWJ1Q/B+N7baA6N9LBxRrLuOe4XvQvXaqzNdvGRiwCaQMvlNfgUh/RKzL/r4qzzP/9WuUNWjEBFDh1Z6FiAuaXznZwrofXvavQmw/4uJj9KzFDvVqdj5mNv7M8fJ5+7m5qUZKhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776504744; c=relaxed/simple;
	bh=LuNgNR4zWEnIVng3Iao/eYGyIMmZ7NSZVhPM11xUPG0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qMzsUFSNDMxm1RVTEB0Ky/nWFNUIAK1T6uJx4hA5wFziH2QZm8sn1UojD2vvUogynpB3DUWgH2JXMMawLMXmo2rAfCbx8qqoOcgjym/v7Sy4YoYEXbU9imWyAxmZzp9az1PhyJ1mvjHZIX0hSF1Ehm8hLJ7kmeoUM2uyNUCivQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIJhGeeE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIJhGeeE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso19853105e9.3
        for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776504742; x=1777109542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxD+is+pbahMT9dB8HsDTaseFAqKL6o1uQcZ5xCt9OM=;
        b=PIJhGeeEheYcr+tAWYWh6SE3ycM6/HXtFkeBmQfwXFquqlDYi+lDCpJpfYLHKUIM3G
         A+J+jfswx9swxLPoGImoatJMZhfGnTgS4o9Tat0KMKzHwoqFwvSJcXHPEeHSXe3jVyVJ
         vImtSGbxD1Pm3MiSG7MrraA9X9SARmONTp1/0P0hz+w+3OGs7q6AjyxVGJaVqCybj3TP
         UYM2qF9aOD0hmAdbt5Wi2YM1zfbXQPAhRpiH75QB+bPjUtaevKXMwLT0Ld9bw4GzVqWx
         JbrlF+fmDZxIi1KsIO7tjQh8Q0mgNBLFcmsS2hIwbqm6ozF3yDnFZAkkC3V3+PtbqbWX
         sV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776504742; x=1777109542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HxD+is+pbahMT9dB8HsDTaseFAqKL6o1uQcZ5xCt9OM=;
        b=FYl6bQ1xl2iBDPDemtMPgoi66rrdLUu+JGJhTRSaI6ThA1ghsWDX+cpIjP1rjoT1wo
         h5wVD1YoMBQOP//x5uLC+IF1rW8coitTDDXSTrqZaaF/83/0EkeW+6FtP5/tMhWBfhBQ
         E+qQh3r4qlZwbLmbSd8JktpRaUY1s71W7C4Ye/DM0ttKaxQFoCqOlzkIroLXJdgZ7OMT
         ZeYssu3o+q0umYld4Co9F9jxgUDp2x5+xeCWF2LB0vERJ2fJyi4MwSAE6Wqdn/YQkb6N
         6EKpGOHMdEegxxIoNxyF/8XwS7z0d9spLkhlBvoj9m8auQ6tMbhQFkq+/VBJbPVFFdWg
         mNXg==
X-Forwarded-Encrypted: i=1; AFNElJ93EULUX4wni+zUSTCknAjwS27vscYnBZRhPzqI9G3VOIs7EmlDgj69OYnX5a0Hi7At8IQ0@lists.linux.dev
X-Gm-Message-State: AOJu0YyF3zZQllVgWaPaKyALOaA/pfUP4jEDaF0hCCw9AOtjAGypShvN
	VoJ60H7d2E1t8IyMbMi4PRQFBEckfWRjMg80qubrfjhGIyNsHYZBqPIp
X-Gm-Gg: AeBDievFGEfK7AHvV52zGsHqm7nCtQB9mQunT/dwHJEQWtD6my+SvK9mwCwf8gDGnPg
	sm6B7wTrY9tOz7yfsUDYLehr2mpebsoBOxxgyMp8OgzAnNI1CL6eFBnNJm8G2yA4n9jFIPf69qG
	pgBDiVYPGW6PbsX712HItZMowiYDkGCEGnDF5mx5611qCqvuTobvCmc+D4iSMxnwl2K7jZxRDUA
	XiNsDU43uSNQZCgZxx+8+xvBnRb7iY/jkJBg72XRwMmMz12b3PIOYUMBmJuohnb4vpYVVDTggAT
	OnTFUq0IttcAl9cPa36bfg/nIDD/GlpkqZ66PfjDM5/80X5S979c6oGHr4vQicBoKEo4UpKoSdd
	UB0SnmSeydb8ozefwukIm9I6pgsZnEVrTa3caXHtPfS8L65qogQ3/llK6tzvZrXXouo6eqrup4d
	bit0MlbeFwMluRZI4ZpArxW9Smzei2enxgBo4jmVOc0UX9kYtC4MZgyCo6XMPictUdQS4pmc6Sv
	M8=
X-Received: by 2002:a05:600c:a30b:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-488fb74dff1mr59895795e9.9.1776504741623;
        Sat, 18 Apr 2026 02:32:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc13938fsm166946075e9.10.2026.04.18.02.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 02:32:21 -0700 (PDT)
Date: Sat, 18 Apr 2026 10:32:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds
 limit (1024) in 'hmac_setkey_ahash'
Message-ID: <20260418103219.1024d2ce@pumpkin>
In-Reply-To: <aeGwENQpQIlY1-d8@gondor.apana.org.au>
References: <202604161035.PMTaI4Cg-lkp@intel.com>
	<20260416112406.68b7afcd@pumpkin>
	<aeGwENQpQIlY1-d8@gondor.apana.org.au>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Apr 2026 11:59:12 +0800
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Thu, Apr 16, 2026 at 11:24:06AM +0100, David Laight wrote:
> >  
> > >    250	  
> > >  > 251	static int hmac_setkey_ahash(struct crypto_ahash *parent,    
> > >    252				     const u8 *inkey, unsigned int keylen)
> > >    253	{
> > >    254		struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
> > >    255		struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
> > >    256		int ds = crypto_ahash_digestsize(parent);
> > >    257		int bs = crypto_ahash_blocksize(parent);
> > >    258		int ss = crypto_ahash_statesize(parent);
> > >    259		HASH_REQUEST_ON_STACK(req, fb);
> > >    260		u8 *opad = &tctx->pads[ss];  
> > 
> > Is ss actually guaranteed to be not smaller than bs ?  
> 
> Yes, it's checked in hmac_create_ahash:
> 
>         ds = halg->digestsize;
>         ss = halg->statesize;
>         if (ds > alg->cra_blocksize || ss < alg->cra_blocksize)
>                 goto err_free_inst;
> 
> Thanks,

Ok, so the comment on the definition of 'struct crypto_ahash' could
reasonably be changed to say that pads[] is large enough for two copies
of any the digest, block or state.
And then line 260 (above) changed to use 'bs'.
The memcpy(opad, ipad, bs) could also be replaced by putting
	opad[i] = ipad[i] ^ HMAC_OPAD_VALUE;
into the loop.

None of this helps find why this build explodes the stack.
I've had another look and can't see any inline functions calls
that might cause grief.

	David

