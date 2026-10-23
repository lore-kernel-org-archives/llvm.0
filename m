Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792740799;
	b=cJXLHGf8/UT1r0hBguBlDxkGR3BVbqTVg9qT7L1jB4aGIhac3ex4pkjEEgaV0fW90hBv
	 YLid+djYbzbzLaAE8RTWT4n6WO1iT8fIkmZAuhGC6Bubf5Qv+nxcjB5n65zU3je67KANv
	 ar0A0vYNBjPe6QlOIbpTQJEQRdsng2TSTBTRMZf/DxiKXh/Onhq9Gd4fZixOmsxjLH1td
	 C9jtAZu8XcWSsw3kKfUaMBDOsYKdpnI0seo/2CS7vAc8lS5L2FbMJEbM8lHWz5nj4ZTSI
	 6VBRB4nsuKtNjYcSXgUiiITvZ9wiDp5Mm13Q8ZmHi8Gp3d8q1q82j65u7XS1+CYEiDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740799;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KUj2wD1kfsmWk13djYVHAZbCTEuU9wsxHyV80zm6Q7M=;
	b=AYHn09+SZdiCws2YM8xR18gUMXRx7toY8sBlfFecI3jXovmWUXmZlX3jzKp1AV6X+TyA
	 aIfcTSe3XJ9EWDNF/zRVbZsUAiGIObIqfNdWC277WEEKj0EUD0LqZEIUgcNmFxmkhqYcq
	 4gzNABPnLxMjPh9Eo3Kmd+lhzXEmmy63f1mTfGG/GD8+q8SGA8Vk2iVLkP7UXNfT00Day
	 jLoj+3BYxyyHL0ar8k34l56fYzuUuqtqb9na9/UPsPAuBGNnllQA0YLdp+DYDgnTsa8c5
	 +reS20wrTJyWn+ZemzxZ2LUVUZ41rK9C9P0mWSRl3KrxmgMpyNTquZcWfkc9jSBqing==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkuXtjy1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FB606A320;
	Fri, 23 Oct 2026 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkuXtjy1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792740799;
	b=QwzEhnGzAyaOj5mIr7jiYBIlo5ngKCq2wCE69zr9mOB1a1h3Fq2fMMKNLNRnYFVGAIG7
	 Q61v3EPch0vmGrniKZLyJqFWdla5vv5GqOZgWXEGq3ck9A+7Mq7+dStJlNC1lqnIa/KbK
	 d3njWXi2Q2HfmpwoYbrvLaAXnk6iT6Fisks80V0fB5zEp4NbYqOTk//hdAOnx9yshFDro
	 3FhqlYkSSQlTQm1qLWZimMx3LtMgcdmrmZZ139DkmpOqFa9hTMONRppYAl9/nXMdgt9J1
	 agK1UpQk7eMu3duGvUuysaJSNwMnA/TM7fuykSHC3RFnueEY2g83OKcRk+O5wOMLJ1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740799;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KUj2wD1kfsmWk13djYVHAZbCTEuU9wsxHyV80zm6Q7M=;
	b=WScygSanCYIH5/fmkHwhaOroi9Frtludr+C1GOu8ZMF5tEJtBcRfLl4BEPFomumKRdHO
	 iRdYYWaqy2MMYjNxwpanMXPQyXz9x3onevNxVBuL9aAdJPKvBb6mSgb88z8Jr7/CTGN3Z
	 2Me4oAFt/RsCTK06sTXIsdGojRwXQ3Xbym7uC60iNr1GlMWLF7E3k42y5VwrZmugdc2hy
	 nsol3no48/CnLFB2WXNFNioYWnlpZyAiJ9s3YrpIloVTtjkErFDxI+EumtKdumjWsM8a+
	 xRFUMWowPaizCKxxzavnpYik50uNWP5lM6D50HU1H9abyZVEU9tWYJm05WPEhDPkxWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF1DD1F031E1;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740799;
	bh=KUj2wD1kfsmWk13djYVHAZbCTEuU9wsxHyV80zm6Q7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MkuXtjy1qcLNm4KOIX0Un8yaV7ALrVBccEi1dic/3zTwfAPdIDFW2U4JIojjIN912
	 bChLfVpknqmtKeZ0+LRUNYCDdTV/dHUHYrv3T6bK8KdbuWqsN0QyiXItwdbRDUqJY0
	 LSv4Bz0HXTz3Qp352AsT5Cqju+2ktGSkk8BxrKs1c5IPkV815zlvQcnURtxEA5cICl
	 p0AqAaBr/IVtztIuWmfLNfKoZqTl3qihy+LYG9M1iRYGWfc+/n/AlGA+fwWEegqUpo
	 d2FDZKHoRmTKbhIJvOtGp5l5cHsUfwer2wd8L8Qzxu4LIDdKi6DRQA2xg5bA7Bb8hA
	 NXn0A/mVJyY9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 63515443F2;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Fri, 23 Oct 2026 15:33:17 +0800
Subject: [PATCH 4/5] kexec_core: Clear the unused part of CMA segments
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-riscv-kexec-cma-fixes-v1-4-825b90ea23c4@iscas.ac.cn>
References: <20261023-riscv-kexec-cma-fixes-v1-0-825b90ea23c4@iscas.ac.cn>
In-Reply-To: <20261023-riscv-kexec-cma-fixes-v1-0-825b90ea23c4@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Yao Zi <me@ziyao.cc>
Cc: Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kexec@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792740795; l=1247;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=WsDVC64bHfydftrHjB9ROmcnpvLdDMLm7LAG2iAtKWU=;
 b=DHa8l1upqFe8GF0mr/wI7BJo0OZLh4M+VDC9vtw7ebm3LQOk9dhQ/R3IcFgCVQ3BmqCnUxdFj
 9V4k04q5zHwBlic6h3xu2XScMsBcX0ln1yqzAgLHbr//OOGGibK8100
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

kimage_load_cma_segment() copies the source data into pages that are not
cleared, but zeroes nothing after it: the final memset() runs once the
loop has consumed all of memsz. The tail of the last source page and
every page beyond bufsz keep stale data, while the purgatory digest
covers them as zeroes.

A kexec_file reboot then stops in purgatory on a digest mismatch, for
instance when the DTB lands in a reused CMA page.

Zero the remainder of each page instead.

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 kernel/kexec_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index dc770b9a6d05..0d6e10bea4e4 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -780,15 +780,15 @@ static int kimage_load_cma_segment(struct kimage *image, int idx)
 			goto out;
 		}
 
+		/* CMA pages are not cleared: zero the part without source data */
+		memset(ptr + uchunk, 0, mchunk - uchunk);
+
 		ptr    += mchunk;
 		mbytes -= mchunk;
 
 		cond_resched();
 	}
 
-	/* Clear any remainder */
-	memset(ptr, 0, mbytes);
-
 out:
 	return result;
 }

-- 
2.55.0


