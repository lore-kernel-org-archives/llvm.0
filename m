Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6547885C
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584055; cv=none; b=Vh7apLyg/attWjYzu2Itcaw3VWKwz2et49XH8Rf9v6H9tuFwjzrl2Axp24AbQGWosGSFTVid83iQNjSes4YJzEhal+7pit0AFvtyKQ1PQ+0++lVQFWzR8pZAmoNKmq3q4G6BO40P5d4u/9LBeGlhsl2UZUYlfteIsrjlF/D3dkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584055; c=relaxed/simple;
	bh=qAKPddpqFgfHmTQw4mD4LolSxZQhiX47J3WLDmhJNXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxQprENDGhRw3xk1KOQpNe/ujPfJ+VsDZw0VgI6dqagRk0yMMYOU7y6qLVwcMsTOLJmI5Cv3cvkhyqzx+ZX8jW60u335sD5utoWEiJ9cp2sniCOVYeOhrilY9XsL3b/slMQZK4ufpzUu1kwPbZMpC7MxHkcp3Qi4MLjIY1uq2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hl4BWk+A; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hl4BWk+A"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88206fc44c6so1146533b3a.2
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790584053; x=1791188853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfTNwTEf8cXEoiVJjaR2wzaM0AVgLL//fGyHvTOkwQs=;
        b=Hl4BWk+A2Rqgb2viIht50j2+482y95oeg193bvnNjuwQ1YJAFmJVBd2Ru19dJfnGNU
         s2MdIRh+4XOcgwI/15OplTnJR8HdPwYVKuMr06otxWacj5CJQyfmSoU2FSJGVKNY8uAN
         9pwDcJvLCiUVzBYn8QzxPpe9Rf8YtZftvton0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584053; x=1791188853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfTNwTEf8cXEoiVJjaR2wzaM0AVgLL//fGyHvTOkwQs=;
        b=yQb0obpZeC257wpKl22tbJX7OJ6NbEbH3E8XbW6GObvDaFtHNJINe/r2/6ycYQcFir
         pf2X5GiehXcz/2bGugDdxwd6D7MnGIdShhbhSTN0aaA5VRrm2zBg9HJFQbnO1HA84lCV
         JApO9DBiyAH0Yy4t2cBPKgdt+KchkUTSHuCOh42xuny6Itw0XUfdEoUtie2sED/EWyCF
         CwF4lXcCcQWJFIu6dqQP7otMrdEa6StoQi24Y6HXH5ozd5XP1JR7Dg02IDsgK+BwnwTw
         +Jo4feKVqXZoPsjiXSKoRXyEr8nK2sV7gGCIx5tANabmPHUwvUX8Lt/efp0QpfMfVjZb
         UcNw==
X-Forwarded-Encrypted: i=1; AKwUvBynPTO/0XhLA4h8R5mBuUKtbJfF2htAexxWYRqTHRWbtircQq1h5+YBQwFVX5SOogfwsgUm@lists.linux.dev
X-Gm-Message-State: AFuF++l4CvsfrzJj0rr4jJgYMU15VUOFlBf6kPsBWT4eLFyuWjp18xFv
	Va2H1QeahSKByLRYuVLE4VqO6NGEMHfDyX/McHQ4Tr/49v4reCgvRxkc4WIdmI0EfA==
X-Gm-Gg: AYBFou0Igilm1gP5zLZV0DOTXI27vR59iVD9xE2MJ1G47tR1jHOAC+PC/h3nx0O5NBj
	n5fzIQ4FSDLhsnL200W1T44CpMnKStFW1V9ZML6OeaphXsUUQ9ai5dPDc7buTuzYX4Ep8AJJ19x
	XNKUHaheMO52Glzmc/m28HaszfQKoMyyj8nGhUUmA9W7oHgi5QTCVSJu1SX9+LbiqRpMUcCM+ZL
	uE1w0/0jWMVetVy2T8MwNtr8PqOpLYsAr2H/i/ZkLePReGJi9xeAVoMavMW91ngoi8gu7et5TDc
	Nj/X2jtUJe4Dsk626SX00PhIdjcnCF4rllIEkTDFF5t6CPe9eFGOxkYgWJ1idPyFAU8/rcOqa7s
	AuiLj0MgBcxKbrhlSjr0vZq6E52aCJcIe1589w8jjMZvLCDu4vN9fo0h7A248+nn8vi5okFjAEt
	gKJldjsjMvEZlnjL/iDDeUiMKnmdp4P4bSi12NgjtjNJ57cMVIuMT3eGGBLZeA3KeLoxSJBb3HZ
	8fUtrG0NQNMsCpn1pby9QHO8uKm6Ks4i68lXoU=
X-Received: by 2002:a05:6a00:7619:b0:880:8fe8:a3ea with SMTP id d2e1a72fcca58-8808fe8a798mr3659738b3a.45.1790584053122;
        Mon, 28 Sep 2026 01:27:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feae8d827sm3676965b3a.36.2026.09.28.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:27:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:27:23 +0900
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
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-block@vger.kernel.org, 
	Yann Collet <yann.collet.73@gmail.com>, Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Phillip Lougher <phillip@squashfs.org.uk>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH RFC 0/9] lib/lz4: stop forking upstream LZ4, vendor it
 instead
Message-ID: <arokqo4gVQVglkBa@google.com>
References: <CGME20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <arnr-Su0uJdK_rOb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arnr-Su0uJdK_rOb@google.com>

On (26/09/28 13:25), Sergey Senozhatsky wrote:
> On my x86_64 build .text size change seems to be quite significant:
> 
>  ./scripts/bloat-o-meter lib/lz4/lz4_compress-old.ko lib/lz4/lz4_compress.ko
> add/remove: 0/2 grow/shrink: 5/1 up/down: 8022/-1755 (6267)
> Function                                     old     new   delta
> LZ4_compress_fast_continue                  6028   10486   +4458
> LZ4_compress_destSize                        158    3112   +2954
> LZ4_compress_fast_extState                  4078    4597    +519
> LZ4_saveDict                                  82     153     +71
> __UNIQUE_ID_modinfo_466                       52      72     +20
> __pfx_LZ4_compress_destSize_generic           16       -     -16
> LZ4_loadDict                                 261     204     -57
> LZ4_compress_destSize_generic               1682       -   -1682
> Total: Before=14756, After=21023, chg +42.47%

D'oh you actually point that out in the commit message, sorry for the noise.
