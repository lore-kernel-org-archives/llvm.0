Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976183;
	b=MvMZpSfSWfGxKnnKNFclKTrGCn3cCug0DJBUmrYfpqNVHpg1vObw+wWTovRId6U2UoMN
	 HuJkxC5/uN6hw2HyvCCluJIn6RAnZhXCowErvdjEXLKD5lug9AuzpmElhglfkCoIP1B5X
	 clhJyrdiMT8cbNcdWWkZ2lNa5gx34box0hrHj8EdB5u0UPfPJR1AJwgiwYkWmsBC121XL
	 kPkJW7tO9cDKpGosHRLplLf6jKJ1aSRP1qrKTrW72fhGAGwynQafBUi922vlXqXvWALWx
	 UQWaXk+ZQw8cwygRx7tH0YvyRC8UwdH3yho8cvwt3OGqbZg4WOfsGH5SXO9eQdNYeyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976183;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=6rJNUO6E54sMvUs2WMIZbbBsdevweP1GURHzVXhYi9c=;
	b=szXDFK5bOZhmvJMNkwJ+xoDsLnQaYlCvm0Y1AgqFukcS/sOowX40Ar4VpCtMTxWiPoil
	 A5uy78K/N2e/mbqwHiaHH/mX4GzT++1TQobNV9XdixnNwUqSeim5j3K86l0CsfGFsrpfQ
	 Gr2c4IpF3RhrNhq0W97zkVY3pTYWzkp3OeTvJpDmE33CT4GnXHNCG24zKe53iDUStch62
	 CNmzy10HgbTDar6c7BTBkmqOudqwAkGUBCibINaaGfRDVvKxc1Gtga6E6haBSf/PzMxhO
	 u96zvn6LhMEHssQhpZbeRWR2DQrvA45GWVzASf/5sLxYC6Dn0qlXQRWidsqUEHWW93w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vQL1Kemy;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC3606EE8B
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 14:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAC3606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vQL1Kemy
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144300euoutp022fe9ba632879a263b59dd1be5c370c27~le9Tgddn21426614266euoutp02X;
	Fri,  6 Nov 2026 14:43:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144300euoutp022fe9ba632879a263b59dd1be5c370c27~le9Tgddn21426614266euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976180;
	bh=6rJNUO6E54sMvUs2WMIZbbBsdevweP1GURHzVXhYi9c=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=vQL1KemyUL/i8iZISuvadb7LjWhfk9xrjaC2sDcM8Owe+O9RHy1wFufNoIOF94jcf
	 p0JVcTX5g5tl+FMQDx9m1nv0Tf+LPOvYWUH9EP9PPWO7X7w1rERwDHFqKFiq4V0yTk
	 PQ3uwEgwyYh+n8/Yo016rsYHh9MLBaxuU9NrIFjU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310~le9SqiDiy1206212062eucas1p2V;
	Fri,  6 Nov 2026 14:42:59 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144258eusmtip1a717ab7164c31bdd835911116d976388~le9RHsKmV0111901119eusmtip1_;
	Fri,  6 Nov 2026 14:42:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:47 +0100
Subject: [PATCH v2 07/15] lib/lz4: backport upstream's match length limit
 fix
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
Message-Id: <20261106-lz4-vendor-upstream-v2-7-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=FeGwjLLCi9r5jO0sT4c2oOMQI6pybsCaTl5iiV1XLg0=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ56U0Pa67C9pl5js81Djt4t++e+Y9b7J3lW8Y3NG
	r1sg6NpHaUsDGIcDLJiiixnN0YbSf5jeFp+/PEvmDmsTCBDGLg4BWAi79MZGWakV6Uz+5RNvHEk
	zKojQjHywl3bTtHiJs+mSS+WF12fZsHwTzdo44JtE7fGf1/aYSV3LyD68iubAoVt21jaD0zI/xv
	xkw8A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310
X-EPHeader: CA
X-CMS-RootMailID: 20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310@eucas1p2.samsung.com>

v1.10.0 lets a match length's extension bytes run to four bytes before
the end of the block, which leaves room for only a token and three
literals where the format requires five. The fork rejected such blocks,
v1.10.0 decodes them: 1f 41 01 00 ff 00 30 7a 7a 7a decodes to 278
bytes instead of failing.

Upstream fixed this in 587ed9557708 ("add comments explaining
read_variable_length() ilimit bounds, fix match length limit"), on top
of a read_variable_length() rework v1.10.0 does not have. Both versions
accept the same final ip for a given limit, so change the limit at the
two match length call sites to iend - (1 + LASTLITERALS), as upstream
does. This is one byte stricter than the fork; no compressor produces
the blocks it newly rejects.

This goes away at the next re-sync.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/lz4/upstream/lz4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/lz4/upstream/lz4.c b/lib/lz4/upstream/lz4.c
index ee69d57aae112f4057c050bbdab4cc0f2d30f9d9..a45f3828141eec9baea59a5e97a3ff37d6474d6e 100644
--- a/lib/lz4/upstream/lz4.c
+++ b/lib/lz4/upstream/lz4.c
@@ -2120,7 +2120,7 @@ LZ4_decompress_generic(
             DEBUGLOG(7, "  match length token = %u (len==%u)", (unsigned)length, (unsigned)length+MINMATCH);
 
             if (length == ML_MASK) {
-                size_t const addl = read_variable_length(&ip, iend - LASTLITERALS + 1, 0);
+                size_t const addl = read_variable_length(&ip, iend - (1 + LASTLITERALS), 0);
                 if (addl == rvl_error) {
                     DEBUGLOG(5, "error reading long match length");
                     goto _output_error;
@@ -2338,7 +2338,7 @@ LZ4_decompress_generic(
 
     _copy_match:
             if (length == ML_MASK) {
-                size_t const addl = read_variable_length(&ip, iend - LASTLITERALS + 1, 0);
+                size_t const addl = read_variable_length(&ip, iend - (1 + LASTLITERALS), 0);
                 if (addl == rvl_error) { goto _output_error; }
                 length += addl;
                 if (unlikely((uptrval)(op)+length<(uptrval)op)) goto _output_error;   /* overflow detection */

-- 
2.34.1

