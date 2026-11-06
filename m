Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976197;
	b=XAakPQF9q2xtepHhbBGLdxnBWUPqq6DEEPlPDB8rsizsqDqkuKrh9G0CU4GI3CCMxMwH
	 w3d4109kY0B6EdJmW+j/zjg5dR/OWvwjPKgZOfSUqkNLV3iunZNXj0agvt3LJKRXJX9cJ
	 HTTiWwSJJuJ7jdDh484IJwOWaL2OP7qEKBOVu2fUkbOmJ2tQqJQNRHrlU9LH/6XI4Iq4S
	 bN4Hj9SxwkbIz05hZGqMAol0aY6s0N1bC/NKJ4gpA5hvGx1Bj1Q9BJLmpqMtByMKph24U
	 udjwKUMsaTCRA1Cfa5o+M7i6Oos7un1zGMxjhQNJjAbrzps/fmYXZpb1OVAQ2DfQSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976197;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=GYgm5u58bPQ8KjrBy/61xpOFxkMjgCoTnwcTVNwoqbk=;
	b=pSf93UkU6KyuNKY4ai3Wigo6ZCi0bXvoqkvox/VX5/eK+kMI/YpGqyKCfWxnQdTFL9j0
	 UAI5FUa6KCoyfiwrxk5s48Sv9ubbCgrGjt1ptZ2w9M+yR8d9Le41RwV+kmqjek5m1m0Uc
	 EFTUsvSysqle245MZS1SRM2FPgh/P6Mr3PWdgpFxQlKAJ2ocDVhDlfmgI6et3trC9mury
	 yYdOtDXQakv60y4W45kYouh9+X8kzD4LY4Aw8LeOmP+E9mXX4Pofg/2kIIS6H3iALYPfC
	 CGlkQl7tFFMuQQBzhTeMKTkKQmS+iO7A/RjsBcgZLSbxMYQ3RYUG3XKXC2KlIO4r6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WQgmkKbc;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5303608362C
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 14:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5303608362C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WQgmkKbc
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144314euoutp01bf87a536a63373af7576bde678d1ddb8~le9gTt12I2284222842euoutp01h;
	Fri,  6 Nov 2026 14:43:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106144314euoutp01bf87a536a63373af7576bde678d1ddb8~le9gTt12I2284222842euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976194;
	bh=GYgm5u58bPQ8KjrBy/61xpOFxkMjgCoTnwcTVNwoqbk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=WQgmkKbcpS0E5IppfyivxuipWCQVcrj3wQBhcG7mppmAFCb61WSuWQLycNnw2LszB
	 QBV9gIdHH1YOykat4PVKvqUj106DRrp0MQYKnvtWt+9iAlpffLU8njplSMEPRaxEUg
	 Zi2lTJLd/b+PgKD4zjnk6WRW355DOUz0XqSi+Au0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f~le9foEAZZ0320803208eucas1p1z;
	Fri,  6 Nov 2026 14:43:13 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144312eusmtip1f828cc3d3bce0595deabb51a9c76f7a7~le9eGMPzl0111901119eusmtip1B;
	Fri,  6 Nov 2026 14:43:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:55 +0100
Subject: [PATCH v2 15/15] MAINTAINERS: add an entry for the LZ4 compression
 library
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-lz4-vendor-upstream-v2-15-ee04c3f0d7dc@samsung.com>
In-Reply-To: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Nathan Chancellor
	<nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
	Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Russell
	King <linux@armlinux.org.uk>,  Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
	Heiko Carstens <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>,  Christian Borntraeger
	<borntraeger@linux.ibm.com>,  Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>,  Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,  Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,  Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,  Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,  Eric Biggers
	<ebiggers@kernel.org>,  Herbert Xu <herbert@gondor.apana.org.au>,  David
	Laight <david.laight.linux@gmail.com>,  Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=HGm8Ef+oh1jjJf2rH2pR5MHSsxC9Nek4TB/eJTDN4oQ=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ46abfJ/e19IaxMGW5HdnJahax7qPTqucTmL61LK
	yVunnzF2VHKwiDGwSArpshydmO0keQ/hqflxx//gpnDygQyhIGLUwAmMkuZ4b8H27vww+aTf9sr
	N3XbHLz3N8hwUuGtw780TzbOOCOjvSmPkeGmlHH30XVnPxqo96y+mbnccFpp95ySRF5/txDPTl+
	eX2wA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f
X-EPHeader: CA
X-CMS-RootMailID: 20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f@eucas1p1.samsung.com>

lib/lz4/ has never had one: get_maintainer.pl returns only the LKML
fallback for every file in it, including include/linux/lz4.h, which eight
subsystems build against.

The entry also takes lib/decompress_unlz4.c and its header, which
decode LZ4 kernel images and initramfs through lib/lz4, the way XZ
EMBEDDED covers its own equivalents, and crypto/lz4.c and crypto/lz4hc.c,
the crypto API wrappers zswap uses, as ZSTD takes crypto/zstd.c.

This matters more now than it did. With the previous patches lib/lz4 is
vendored upstream sources, and someone has to bump them to new upstream
releases and decide what the kernel-side glue may do. I am willing to do
that, so add myself as its maintainer.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b34aeb705cef654c720ca9f2ba223..598d87ca772eecbb1ed169d51ff0eb8cdd2e50ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15606,6 +15606,16 @@ S:	Supported
 F:	drivers/net/pcs/pcs-lynx.c
 F:	include/linux/pcs-lynx.h
 
+LZ4 COMPRESSION LIBRARY
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	crypto/lz4.c
+F:	crypto/lz4hc.c
+F:	include/linux/decompress/unlz4.h
+F:	include/linux/lz4.h
+F:	lib/decompress_unlz4.c
+F:	lib/lz4/
+
 M68K ARCHITECTURE
 M:	Geert Uytterhoeven <geert@linux-m68k.org>
 L:	linux-m68k@lists.linux-m68k.org

-- 
2.34.1

