Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B1231A3B
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 04:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569026; cv=none; b=TJHQk6qsW+R9YaMGwUMA2xhvuQSITKscsqWjQYePq+Zvl0sfmpRr/FlX9HO5drPvJ9aymoY8QhtTWcEdiQNhmha1mLMcI5o+udlJ9xIxwO8psxZB1sn9MO4xF88W87JTu3Ncl1fiiCJZVZLR9u4nHGBgxd2c63smnsSkp5ze9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569026; c=relaxed/simple;
	bh=YTfotWDlml5UR/GBD1wY4ze1xpdJN2PButuZynaIwOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7YfG7Th97X+heI4ZE578GwFHeg7XWB3R8j0Sja4jtBzeSH9GdKaxEJ3R1OO5QNQ0p75t1M5mP2Fkfp9gkHsUlvDhHkjxsHBpEHcnp1hk1XArAhUWmsiT4lqeVtoBD/OwVwx8DRFdzGE5glq8/pJFPTgeNMC8NRzW5hGwf7SuJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h2wmXpCO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h2wmXpCO"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso11548275ad.3
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 21:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790569024; x=1791173824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=;
        b=h2wmXpCO9rBc8MWkMWZgqZBkd7H8EEWjgWb68lJrkO8j/qyLEEP2qWLZ3+SW3KYdX7
         enakvau8xAVSSM4ToNtgJrnDIiH9tqDnFU1JBpIrN5tOqcWKbxIGPmmwJKup0inR/CYC
         iuT75yIrotyBw7L3Kr5KbExy2R1ysnITwu1gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569024; x=1791173824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=;
        b=m2+2WEzBmZJil7c0FpQ1dJ5qemrQQYQkNwyNxsuS+kgK/g2a8nB5WMLT+ax46EN+Qi
         fH+B41tvcD6pu9zJoPsM+LFJXHOo0OfTZFPEiwwDgmc5GNbT5GYDZQcXmAhLhtL9xj+c
         RIWn82TAL9hJq5b9DNuJ/VaSoy/ZINNtYqJDPABDLuUqId0j6LVeK90mXuw1nK7XIAJc
         G34Pe43To5an9tcjeViwny5e+r4nZ2zBdpE/617yd7eCSOmwg6bXQ1DMV30ZumXdFHTm
         I7UqUuW86DvWJQ6tCHlzazRDpFz1nR0+sBESzvgZMOcwFzZSltAL1ObZt9kW+HO9j53V
         BJVA==
X-Forwarded-Encrypted: i=1; AKwUvBzkvaUq76gBboYofTx8Wi5lQAfJCy9N0/OGTJlLie314Gucq+7jexxQUfxWoW6aCP/cUD3x@lists.linux.dev
X-Gm-Message-State: AFq9FYLHznBenacgEw5u3Sy+IV2hOcLeH/0p/rUE9/3yjEf6waMFOXen
	hp9EKrzUucY+mcshXMywPT/1Rc7h3WB9Lk3LJx/RKbyfpNJKcVyFcY3LVI06cgISIA==
X-Gm-Gg: AYBFou1Gj1axpwJ9aPcYI9QSaeOYY21Sf7/h9mIREAmcpRCP78aEM+rfnbTidMm95c8
	21Wi3gh2VdsN8ZdOEYFwVdLj6DWTV9Skw4KsqgXJF+R8UyQty/z0Y/DArsLrdPoV1zMtdf3LuG0
	0B7GKf4S4z/nfg4yEDXAhrrJuZL++vL2ilHUiaE6TWjTYphlLQy11JR4ohdDlAJEcxkmRMDtss7
	vl0vWTjuFG6qUBF8NEYpOUGZhlw6anAtQSlr5nsYoQYIt2OTlTNRGTHqEo2bZ8WSZwA//68aJMO
	40pDkwt4+wVj1vykCE/HpiikmOcwrEYzJOJhuFaofqzpVz766WlDb9POs3xdQJx4h+wKJwB7GQ5
	XLbNxqGHgwFEA2RMe8QaA7kmTbLpD30Z/cH30B0nY8MX5r/NpYARXq+iMIATAz4T2yYcYVTjQ26
	Nu+r89matz2lA6t/fvPBdrp9tQiUd/94qu70e9JBcB+71n6jsYjSobytxzld++fwdsKnwZ2A2JM
	LZPNo+d+HRmmvI2O0Joh2GUdNCLmbMkpzvQfYw=
X-Received: by 2002:a17:902:d98d:b0:2dd:c100:7cc3 with SMTP id d9443c01a7336-2df7dd72aa3mr103163935ad.63.1790569024011;
        Sun, 27 Sep 2026 21:17:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e23ecsm35034075ad.18.2026.09.27.21.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:17:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:16:54 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 7/9] lib/lz4: switch the decompressor to the vendored
 sources
Message-ID: <arnpj53cgDErAQEz@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113504eucas1p25e50de59c02681fc1385220be8acd184@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> -static FORCE_INLINE int LZ4_decompress_generic(
[..]
> -			/* Necessarily EOF when !partialDecoding.
> -			 * When partialDecoding, it is EOF if we've either
> -			 * filled the output buffer or
> -			 * can't proceed with reading an offset for following match.
> -			 */
> -			if (!partialDecoding || (cpy == oend) || (ip >= (iend - 2)))
> -				break;

Worth noting, these lines are downstream commit eafc0a02391b
(lz4: fix LZ4_decompress_safe_partial read out of bound).

Is this intended or are we "loosing" some of the downstream fixes?
