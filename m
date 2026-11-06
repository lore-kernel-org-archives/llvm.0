Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976179;
	b=dpcAoGg2xakMuxGE1/32eAJeT4X7bFV8qLpXr2InPj0gQMIyrs6zID7QSf3eQ2is5/Aa
	 bOt8vAYbdlnOiqG/uiyOYss5Y/Foq+AwgEe9pI8h6/Sj6kX7Iz6oEMSm3q+lWEJ42IyGW
	 /oZFdAyjidKdxs0rg+ahEjfXTRChoGpDZFTanpNODmBqX0A6IbOfB7rHZReZW+QH4VNyN
	 e4blmrkgtMzJBDpb19Dc1zxHKyCFCmjTbRedZl4KuYmsYe3X4B4rZEMHVQ18uHNlI4UwO
	 ILekavgiYxruxeTfr9ieQEsM13Lw1Xszl5ifmOYC41TZcZZ3sx6AhN+VteOQ5W5QVwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976179;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=WSR+OYxGYuCEt4HZgWaGut42QNF8mF7rpyHwN5g0Fmw=;
	b=tc82bMt15F+ExpuW7vPUSgzgPON7TVBrnjyuEoKQnkrg0jzRMuKPiHqXy1PvYGS+skPf
	 bt8fKDwUVf49EsPxQvN5ZKvlGZtl65HByzJdeae8+iBGW79OIztzcv0DtBLQ8yZQAHoen
	 ahr+m8V+ZzuDafVpGoCbwyYJYaF0jTDZBZEDvaAj+1c03HKp5EfnEzIn7R6T7ez9MtdaA
	 apkSdouqdXC7AL44hXOUoCIh+huVPDG8OkjCz2IMC6oxTyZQ991oBLoBis43vzhJAWs5w
	 42WxCJKjRKvOYJwQBvnctDxEX7jmOiOacOY5NI9MarJaEb88GAROQWBmOiBzN8E3R/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=iNy7LdYD;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27689606A326
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27689606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=iNy7LdYD
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144257euoutp02f046c48219c70db95596d964730e31d9~le9QW44K01214112141euoutp025;
	Fri,  6 Nov 2026 14:42:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144257euoutp02f046c48219c70db95596d964730e31d9~le9QW44K01214112141euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976177;
	bh=WSR+OYxGYuCEt4HZgWaGut42QNF8mF7rpyHwN5g0Fmw=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=iNy7LdYD9y3Ce85ur99gVOgP70PRAxMlKgJ50WH0DEUBnvXrShJMbvfe3bxA28980
	 UAciP+g1AouqHElYOm5zofikYQj7Afh276F1w/Rk4NBMq/wRm6tm+0RcLd2EuCebCw
	 IG4+EnibCn2k/wLwGCpIOYZjqtVBgcW3SMirHPT8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144256eucas1p1beb947272dc94f916c8c8131722a480d~le9Pd9eIp0320903209eucas1p1W;
	Fri,  6 Nov 2026 14:42:56 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144254eusmtip1291e4ba24e2a230c09af0eb481e22639~le9N6-Ryb0161401614eusmtip16;
	Fri,  6 Nov 2026 14:42:54 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:45 +0100
Subject: [PATCH v2 05/15] lib/lz4: backport upstream's -Wmissing-prototypes
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
Message-Id: <20261106-lz4-vendor-upstream-v2-5-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=8N9wzkj/hKUNj1BW6DsxrUcKBRzHlHt4de1GPUas8dA=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ4aKBHw4KzylIunL5nMWL5nDtPGvfc/njCasV+lt
	GrWpcMX93eUsjCIcTDIiimynN0YbST5j+Fp+fHHv2DmsDKBDGHg4hSAiYSUMjKsiXqrvCj13sck
	jXdXYxcp/xC/+X8L552H1zvu7FxWvP6wLsP/nMgZJ7gTtqpMCPyt4XBn0/uNTa3qbC/maddKfOC
	7kveWFQA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144256eucas1p1beb947272dc94f916c8c8131722a480d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144256eucas1p1beb947272dc94f916c8c8131722a480d
X-EPHeader: CA
X-CMS-RootMailID: 20261106144256eucas1p1beb947272dc94f916c8c8131722a480d
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144256eucas1p1beb947272dc94f916c8c8131722a480d@eucas1p1.samsung.com>

v1.10.0 defines LZ4_loadDict_internal() in lz4.c and LZ4HC_searchExtDict()
in lz4hc.c with external linkage and no prototype, which the kernel's
-Wmissing-prototypes rejects. The first would also prevent linking once
lz4_compress.c and lz4_decompress.c both include lz4.c, later in this
series, since each would define it.

Neither can be forward declared static in the lz4_deps.h a later patch
adds, as the other bare helpers are, because their signatures use types
declared inside the .c files.

Take the two hunks of upstream commit 5ef1f16929b5
("fix -Wmissing-prototypes warnings") that apply to the files we vendor.
This goes away at the next re-sync.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/lz4/upstream/lz4.c   | 2 +-
 lib/lz4/upstream/lz4hc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/lz4/upstream/lz4.c b/lib/lz4/upstream/lz4.c
index a2f7abee19fb9a5c768f2a6c266acf5b571f0855..0d474be0236a698d297ab9a430f5082485eb3709 100644
--- a/lib/lz4/upstream/lz4.c
+++ b/lib/lz4/upstream/lz4.c
@@ -1584,7 +1584,7 @@ int LZ4_freeStream (LZ4_stream_t* LZ4_stream)
 
 typedef enum { _ld_fast, _ld_slow } LoadDict_mode_e;
 #define HASH_UNIT sizeof(reg_t)
-int LZ4_loadDict_internal(LZ4_stream_t* LZ4_dict,
+static int LZ4_loadDict_internal(LZ4_stream_t* LZ4_dict,
                     const char* dictionary, int dictSize,
                     LoadDict_mode_e _ld)
 {
diff --git a/lib/lz4/upstream/lz4hc.c b/lib/lz4/upstream/lz4hc.c
index 4d8c36a6978fcae09e4c4a936572b4b271513466..32b29f382268d961d65383b24c7225494d9044ad 100644
--- a/lib/lz4/upstream/lz4hc.c
+++ b/lib/lz4/upstream/lz4hc.c
@@ -360,7 +360,7 @@ typedef struct {
     int back;  /* negative value */
 } LZ4HC_match_t;
 
-LZ4HC_match_t LZ4HC_searchExtDict(const BYTE* ip, U32 ipIndex,
+static LZ4HC_match_t LZ4HC_searchExtDict(const BYTE* ip, U32 ipIndex,
         const BYTE* const iLowLimit, const BYTE* const iHighLimit,
         const LZ4HC_CCtx_internal* dictCtx, U32 gDictEndIndex,
         int currentBestML, int nbAttempts)

-- 
2.34.1

