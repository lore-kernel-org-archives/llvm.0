Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976174;
	b=Emtv2WeMuAVhDaH9mcdb1GupyvE05603PzCZG3K8WUJ8mjcVI/eSx+gLycnmiWlxqGGj
	 +qqXrfc7OzMF4uFfNvF8nyBo/dvi1pOVgj32BSgb2mfS44uSkiGwWz3Cwkkrky0yPooll
	 CAn0IXwAs8GZQl/UHxJzUX7BtPZ6usjhk6ZEIVTRRhrDfJTnnvW8n3M2iXIO8TQ4CLmRT
	 WiJ7QERQZ5DgGyfUjpgsWz7MXZ0yTxQKTjm9DfY0TGthPetLfo84JaO0+Bq6OYsd3xqSU
	 c+XwqHsL5U2WXrWzvG21fgC48/LqxfohluM8ZGPbT0gwuC8crjAhDejg7LIczta7y0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976174;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ZukkpYT3qCCda2Jxa+XkaNLKI/uzan+hwGewF/8rdTw=;
	b=S3KeA5REJXzO1ZPYxKLxLzrroQih67Dq38QZ8BY6886Y6CQV3I+fUoFCdG3YMboGZR/J
	 vuv2huhzo44AVAtPyfl5wZzCEhAjFCnwig2XKTOi8dzvvsygwGMTq2TWrsJW3EgjHeUol
	 FZrvgTKXOoEDZv0fEoW0WZjXzcCPtgywWbOteqhyOuCJwPshKMe4/5MJktLYU22UJ5Phk
	 TAkQqENm8G3tqjaFpWxFpgJP594Fe3sh7CgIHLetLpdkv1DKwI+KmF+YYSEVzadT9ebxL
	 f0wIcVKSGizSwa7xFaAmrUbU5W1d2tEoGekCPt78Tc/kcFad6L3/p1M9WO4bZh7iaNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EN46cMg4;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56733606A33E
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 14:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56733606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EN46cMg4
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144250euoutp022e1a6a3073d383bd646015487e8568c9~le9JpKhy81199311993euoutp02D;
	Fri,  6 Nov 2026 14:42:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144250euoutp022e1a6a3073d383bd646015487e8568c9~le9JpKhy81199311993euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976170;
	bh=ZukkpYT3qCCda2Jxa+XkaNLKI/uzan+hwGewF/8rdTw=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=EN46cMg4Z5AshlKXcWj6iq9nVx+1cEFRUR3OeEX1SELWiBSHo0MXSd8R+ZRpXPqPo
	 5J9fZGzBi/ektMzl9T564UxSBe3S67f6f+YsOPNBKFF7rocyARFmA/WbDBCKVPMy1l
	 grLUbbLxfYwtJc30nNwsRnyAAGoxoUyejvqHmnV0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1~le9JAlvFx2626526265eucas1p1j;
	Fri,  6 Nov 2026 14:42:49 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144247eusmtip1bdfc91f54320939f93a2226da03397ef~le9G89u5c0161401614eusmtip13;
	Fri,  6 Nov 2026 14:42:47 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:41 +0100
Subject: [PATCH v2 01/15] lib/decompress_unlz4: use
 LZ4_decompress_safe_partial() before boot
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
Message-Id: <20261106-lz4-vendor-upstream-v2-1-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=i98BIOEMfPRofAmIfLEP+RTKtUlRGNT17p8zNX3eSM8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ6ynW99606dIwL7ulQ6Bbe9jN7M8lqzVe7sNB/dw
	JkrA5JWdZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJrAtn+Kd4oT3eQJe/yUhy
	6odrlWpckv+rc3a+M/rqfupkEZNc9AyG/453bnjdSWxq+LLd5e7mt6pKC87ZPImexDM9MuXEZx3
	FWh4A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1
X-EPHeader: CA
X-CMS-RootMailID: 20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1@eucas1p1.samsung.com>

The pre-boot decompressor is the only in-tree user of
LZ4_decompress_fast(), which upstream has deprecated since v1.9. It
never checks the input against the chunk length in the header.

Decode with LZ4_decompress_safe_partial() instead, bounded by the chunk
length and by the expected output length. Count every chunk against the
size the image ends with, and fail a chunk that decodes short or comes
after that size is reached.

x86 decompresses in place; the margin arch/x86/boot/header.S reserves,
(output >> 8) + 128K, covers the safe decoder's 32-byte overshoot.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/decompress_unlz4.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/decompress_unlz4.c b/lib/decompress_unlz4.c
index c0dbb3cea915eb91d8f4ac26c38c4785bbf19770..dc20c22e087900e21da49f9fcb267e6b511e1072 100644
--- a/lib/decompress_unlz4.c
+++ b/lib/decompress_unlz4.c
@@ -151,14 +151,17 @@ STATIC inline int INIT unlz4(u8 *input, long in_len,
 			}
 		}
 #ifdef PREBOOT
-		if (out_len >= uncomp_chunksize) {
+		if (out_len >= uncomp_chunksize)
 			dest_len = uncomp_chunksize;
-			out_len -= dest_len;
-		} else
+		else
 			dest_len = out_len;
+		out_len -= dest_len;
 
-		ret = LZ4_decompress_fast(inp, outp, dest_len);
-		chunksize = ret;
+		ret = LZ4_decompress_safe_partial(inp, outp, chunksize,
+						  dest_len, dest_len);
+		/* A chunk once the image's stated size is reached is corrupt. */
+		if (!dest_len || ret != (int)dest_len)
+			ret = -1;
 #else
 		dest_len = uncomp_chunksize;
 

-- 
2.34.1

