Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976192;
	b=bkD/Z/Zqt5Gq78doPlzgqYtO42CDg4XRXga33DFMzWA9S+48d3p6VjTPkth9YvXqYv6X
	 NRKyruiNH6eWMRSwRaZP10TG5gi0p7u0GGl9bSQ/pjW4uwZ/tg25LTTD1vLng7CjRT/Ca
	 /iYkzhU+O86OoycgJvcXMeAhmW1ibp/HVGj1NWQdH3pqBuq/Y8mtgoHpSG5lwDa9yixC5
	 wsNqCjmjBDtakNnSDp+JaHCJTkEJgqeXxTPgpAIKtNU40gI6Ci0MCduEbVO2pnXe/M9u7
	 PnoXRV45RHHMvsUstrP5+5LELavJJxTgftqtnDku7hSwaygzbA+g1Hn5CdhQ60xGJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976192;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=5WAyfwxes97eXVKQ4WaEOycOnpyd2q1S7T7hoYmOWJ4=;
	b=1Bg6jL86QarNVrCxc+kUIjIkCyWnYN1+0/pRPp5rZtNLeNtK57247R3Pcc1BykVwCTDG
	 2La/GZuAWkKnEo6lmgH5n/5zCyq9s8gMc15m/QNYONRPDArDW856pz9n1hg2vJE9wJtw1
	 VThUoQc5riXs3sZ5w+l/7rk0cV9eDcwO2eNF+J0vraCPYXbfMMtmCO8IVXlYTPvD/Fa3U
	 j8lvnLn7tS9x8+ShkwBGEtZNRH0Dei+FREQDt31/VOt8j5C3suwooiod5hbCjyBCnpsTj
	 KbbY9Homu5yDqIWTKz1ZOT7hyquOa4qC7gZPOmUbNGcwfBmpwBqXNlRUBi4Zim2IEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=D7iVj3R3;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09324606EE82
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 14:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09324606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=D7iVj3R3
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144309euoutp02d3a45fbf182d4289338c041a54a30ba3~le9bpk8I61214112141euoutp029;
	Fri,  6 Nov 2026 14:43:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144309euoutp02d3a45fbf182d4289338c041a54a30ba3~le9bpk8I61214112141euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976189;
	bh=5WAyfwxes97eXVKQ4WaEOycOnpyd2q1S7T7hoYmOWJ4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=D7iVj3R3EFBMCZfeWcnCC6O7h42HpAdgC15pTjtVCRsbOpbrJ1u7362+nBytnVZJo
	 GPaJoilZTC4GQb+X+MBgAo049VkMz1rY7KhTfaMWbYh+LVWzWOPpt+Dd40an5c0lvY
	 fZESEJO8U5ENXVpBrDS1XGbsnu08ctiWvS6Akuo0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7~le9bJGw3w1206712067eucas1p2u;
	Fri,  6 Nov 2026 14:43:09 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144306eusmtip13eaf752873270c04345a32c3bd105a56~le9ZQns9S0066400664eusmtip1c;
	Fri,  6 Nov 2026 14:43:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:52 +0100
Subject: [PATCH v2 12/15] lib/lz4: widen LZ4_DECOMPRESS_INPLACE_MARGIN for
 the fast decode loop
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
Message-Id: <20261106-lz4-vendor-upstream-v2-12-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=Tpg9+ra3w5bOUJNOcaBr2j03QC+ZywHsirLjAFcMOMY=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ4qLJQjrZip3LipbJ+lgnfepgtXFNi+nNiwQ0m2O
	dxxwb2wjlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRT6oM//O5StQshSrPZkpy
	fjtTf7732jPX8Cs37feWSKzLLZ5rrMfwPzhjjqNKzaZ1HX9+LzmrNWlPT3Obds6iHf/OOFvd/8j
	cyQ4A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7
X-EPHeader: CA
X-CMS-RootMailID: 20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7@eucas1p2.samsung.com>

erofs decompresses a pcluster in place when the slack after the output
is at least LZ4_DECOMPRESS_INPLACE_MARGIN(compressed size), upstream's
(compressedSize >> 8) + 32.

That holds for the fork, which overshoots its output by at most 8
bytes. Upstream's LZ4_FAST_DEC_LOOP, which the next patch brings in for
x86 and arm64, copies in 32-byte steps and can overwrite input it has
not read yet: of 172410 valid streams laid out as erofs does at exactly
that margin, 3660 fail to decode, none with the fork. The worst needs
(compressedSize >> 8) + 33. Images mkfs.erofs built did not hit this,
but nothing in the format rules it out.

Use (compressedSize >> 8) + (compressedSize >> 15) + 36, which takes a
4K pcluster's margin from 48 to 52 bytes. Upstream's lz4.h defines the
macro too, so undefine it first.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 include/linux/lz4.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/lz4.h b/include/linux/lz4.h
index 05060b9790be4621ddbe744172fa0ae37f6191f4..e809149747c3dc97d129e42e0ce4385b5a219930 100644
--- a/include/linux/lz4.h
+++ b/include/linux/lz4.h
@@ -521,7 +521,18 @@ int LZ4_decompress_safe_usingDict(const char *source, char *dest,
 	int compressedSize, int maxDecompressedSize, const char *dictStart,
 	int dictSize);
 
-#define LZ4_DECOMPRESS_INPLACE_MARGIN(compressedSize)          (((compressedSize) >> 8) + 32)
+/*
+ * Slack needed after the decompressed data for LZ4_decompress_safe() to
+ * decode in place, with the compressed data at the end of the buffer.
+ * Upstream's (compressedSize >> 8) + 32 can be a few bytes short: its fast
+ * decode loop copies in 32-byte steps, which may overwrite input it has
+ * not read yet.  The >> 15 term is extra headroom for large pclusters.
+ * Upstream's lz4.h, which lib/lz4's objects also see, defines the macro
+ * too.
+ */
+#undef LZ4_DECOMPRESS_INPLACE_MARGIN
+#define LZ4_DECOMPRESS_INPLACE_MARGIN(compressedSize)	\
+	(((compressedSize) >> 8) + ((compressedSize) >> 15) + 36)
 
 #ifndef LZ4_DISTANCE_MAX	/* history window size; can be user-defined at compile time */
 #define LZ4_DISTANCE_MAX 65535	/* set to maximum value by default */

-- 
2.34.1

