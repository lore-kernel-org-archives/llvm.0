Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482753;
	b=AzJ48LQj0XCSqkAk3TGBFZZJ2luT5q7idboKcCUhxjyZstUCxDNmHJ/fkHIrmAXEfEOS
	 6OtALrglpUPZnoqZpeRXVm+PYcKXihzE+yiZvjz7qpkLwzQyi0Hb7bw7p45KQDp43Pj5j
	 hJ4JecO/7tmeCbYrMe9LDm3x0fKgFI11bcuZXzmi5Nsady59IyjkSQV50miZogyT05BAU
	 y4ZriuSiee8xtcKYsNyeBrG2Tgl/Hf/Gv6F54+NvD5gujhWLi7J2B8y9+Lm5Ygtox7xZJ
	 M/6qbOwCPFtteju1X0YxreyIj3N8q+fEmRUGdaZjgRQKpuT4ycvTSR+3Y8NcC/nBhWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482753;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ipHsKGzdySUFK43kUSa1EUse/xjwdqGzCAkyYU+4IsQ=;
	b=CCAcBqG9LqtBRCl8Nj2noc3A4qoPdi6YHh/qNS++rDKssCYmfcSQyHvBqLnyeEBybxQp
	 b8rrGeyvjNKy1hniwQBL6jjBKVpS4za2bQN5nf0JfEj/rWX+V8f9wmQHOJ/HNA2cG+jvw
	 x12ZmNcwElDcbNUnlMUqkLmqhqDi6yEgQsI768a46URx5vESJqNGb27FuwfFwm28TnW0B
	 neLee5XMRUTdkCnN9syrvp88yCfGQ2tE2rUfolhu7Z0TqL52DRDdPpoY7I6ILQyLRb3mo
	 TGtGZEPefgJl9jq9iRphxQLt1SfVuC3zT5tcxpOUNgUuqpIyKS7UqG2uQ1hoZF2NMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AvhYjNqW;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCEF606A881
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 11:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCEF606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AvhYjNqW
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261112112543euoutp010f016eb7fa47ed13835ab3afff799d5d~nSIxA7B940644806448euoutp01J;
	Thu, 12 Nov 2026 11:25:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261112112543euoutp010f016eb7fa47ed13835ab3afff799d5d~nSIxA7B940644806448euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794482743;
	bh=ipHsKGzdySUFK43kUSa1EUse/xjwdqGzCAkyYU+4IsQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AvhYjNqWqGDSDWciDHfOXU3HOJjD8I0PqyiBFvEino+CXJ/Ts8YCaLP0CTP7r83SV
	 D0u2NoLv9bExEfdz3CuNTS48kAhibm5QmC2eYY3NRLEJ1vo1+7ksYjGgKf8B93b7Ln
	 eIdw+0vhCIWca8FGDq/+owQFBplfxnoB2Ht47E5M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261112112543eucas1p2f3aa7565474df56edb967cbecfd1858d~nSIwwzSqJ0570005700eucas1p2G;
	Thu, 12 Nov 2026 11:25:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261112112540eusmtip2793b80df566384250842db8b2aa8054b~nSIuZrphA1705017050eusmtip2o;
	Thu, 12 Nov 2026 11:25:40 +0000 (GMT)
Message-ID: <feca1837-fb17-4d96-b6d9-7e5d413ef222@samsung.com>
Date: Thu, 12 Nov 2026 12:25:40 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] lib/lz4: stop forking upstream LZ4, vendor it
 instead
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Heiko
	Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, Andrew
	Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers
	<ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, David
	Laight <david.laight.linux@gmail.com>, Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261112112543eucas1p2f3aa7565474df56edb967cbecfd1858d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144247eucas1p15bdd0704f32d1cb3b19f9d2296a0cbc3
X-EPHeader: CA
X-CMS-RootMailID: 20261106144247eucas1p15bdd0704f32d1cb3b19f9d2296a0cbc3
References: <CGME20261106144247eucas1p15bdd0704f32d1cb3b19f9d2296a0cbc3@eucas1p1.samsung.com>
	<20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>

Hi everyone,

On 11/6/26 15:42, Michal Wilczynski wrote:
> 
> The import is the v1.10.0 release tag.

It appears v1.11.0, followed by v1.11.1 were released in the
meantime. The next revision of this patchset will import from the
v1.11.1 release tag to take advantage of the newest code. It already
contains the backported commits so I will drop the backports.

I will redo all the measurements with the newr version for the v3.

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
