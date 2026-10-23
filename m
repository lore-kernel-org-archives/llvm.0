Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792740799;
	b=EExSkivrwAzzo1gUgb8ZAyUmyg3GHt/dlE0B8e/VDXDOvpfRcT4jxeqID0Sdlbmz+URO
	 R2bXWWkeVW4/nJvBM2cpyo1mwNkyDera+EM4RVZj/u9NkTY40q4PFLpW9+SCtzWu/gFP0
	 MVn90SJejeNhkgsV4GOXTirUqVloXWHBm38+iXWvlG21zLTRrVs0YNJnn/UjPhwSOj6mU
	 t8TGrwwQacA5x9a49mrEZQoH0Z7SYvKNyi2FFr/ZvpJY1qIbBBUMFi6rxlFbrNZYdxWGe
	 BgK2ZdSPHzAXcvirI65aBF8jPbO8cA31xBymke9m3p7pj3ANWMCuSX/kBlBZJWghj4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740799;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DXlkibDr0eUyUlFexrKUMNsRMFOBJ97mIZORHlS7eX0=;
	b=KTCmJkYtwZF2P3p7i8Coiq5dSYlS1SAhdFnRfq2OWMlyXkE46+P7deWqlU3I7YbtN527
	 r+E52CIn2P2hHNB6R5/OGNVO11hjRh9/RunkbHW7WmjnrzfgYjkdpYJPOM7xvtwdRjckH
	 eCVCbLW8Y/UpMyrij2bDKQYUB/J4Mhd5gyURyrX2IvLF5KiIWEKPQA/Osjp4+NmWO4YUM
	 vyNTLRCqag57eVk5ZHcnpirHJncs1quLWgbvUqyiVAx/BWnA1u3XqrEYUe53cNQ6MFNxB
	 LObyKQ1fJBfpGi1PohulMeIFSLkK36lx6OUy7cXr0ybHynaqAu1VcoT73PGitLrnLSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNfQvBY2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79E606A324;
	Fri, 23 Oct 2026 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNfQvBY2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792740799;
	b=rd7ue05xxdSpH4/mCZSXwKw66p1zO4BLOzmEWnMfSZkBKTVSdDoZxM0owAnUmhJy9gZc
	 +t2gALfQ5IY6uiVFWgogQyvvMf97UHQVvtOutfs2csrwsxivmaenpJMHzwOJ2rLJkYifA
	 WvfA+IFE+byaUYj39I/VoeFyn+V5PiBDbSpoURVrn/8AlNg7HicKo0sTdnH6F7UcDi6LA
	 Yh7F3DjVH1+r3aNM3ynfUCRHTYJzWc/c2/07R7vMXvJ3/NK0lhxYY7UZru7NadmPJ7u09
	 iZdOK00fhVnqF0hRzNmcazSZgltsWZXVbqxarFy0zicjA4URs0FjC1Ap6Z4qrcTmXjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740799;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DXlkibDr0eUyUlFexrKUMNsRMFOBJ97mIZORHlS7eX0=;
	b=MIo5Bm1knn8mQVToCCMd4Jn3pzQxoPhOWW29I9ErcfFKlcLWM+hm63lF1+MeKEva1Qd6
	 NCzS4qBqAWGxe5c20Ri2wx6My9peuNvxUOGlah4VXZDXa8JJzpJ9oB8TVRgv8juL+QZCG
	 68sqlFA8oAszWLYc8MO5rC67HN94oqZPtEenoSm2nz+SST4U8UPZdsgDPS5Eb7roOVWQw
	 APV6sUe9kh5IFgBh9a8lkzfxyiwjiX2QubNlT4N75taFTvDyDUufMEChEXcczGs50Khhv
	 Z4ISzpJWImX5QCqtyJ+m5l15KDEqyYX1osgG+tZuBuYjsccqWk4vzfN1dryos0UlSmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF2971F031E2;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740799;
	bh=DXlkibDr0eUyUlFexrKUMNsRMFOBJ97mIZORHlS7eX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZNfQvBY2vmAQxxDMUzg3DBouLY9zqbB9yRtJuBS913YQL7RJZ8HKzQyrDDZM+72Pu
	 ujvLKC7nkfPZUrLE2hpWBpUB0aNy1oVsyetC1Bo5OfhGumjbldEDv8a1JH3eqE1A2v
	 buTwZ4TtFqvfmU1wFsiLXUbK6tC07yJRA7yzqUCjf1a/R8Lm6ttPHl00Emuyab9EPE
	 v3ok1tvJapb3dRtG1PTdtpy733a3xI4RAluumV0vmQj2moqfNh7dxX8EVcNBctCd0J
	 ypCnbMddeEXK6gh1C/znp9o0CD+grXlOuIPJTGLZrfx0O1ZZ0hNfQpHSHh/tCPOfWT
	 kb/1MFbLb6+XQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5AC29443EE;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Fri, 23 Oct 2026 15:33:16 +0800
Subject: [PATCH 3/5] kexec_file: Honor the segment alignment for CMA
 allocations
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
Message-Id: <20261023-riscv-kexec-cma-fixes-v1-3-825b90ea23c4@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792740795; l=1480;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=qJEDPA0ppewD/2akK6SOlKkXPbYM3Y6vYk6RoryMxR0=;
 b=k2WWS6RTJ6LmCg0h1zKhwYN75d0Cz5RFyTNujkDVbhWiDu1L84xl9pr9j0UyBeqXCXktEAl1S
 b8+pMaOPh4vB3By4HbvwIG+rIw9MQ2jqBYyRbEonik0/PRAt8W4WIsi
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

dma_alloc_from_contiguous() limits the requested alignment to
CONFIG_CMA_ALIGNMENT without reporting it. kexec_alloc_contig() can
therefore place a segment at a less aligned address than buf_align. On
RISC-V with 4 KiB pages, the default 1 MiB limit is below the 2 MiB
kernel alignment, and the new kernel stops at the setup_vm() BUG_ON for
a misaligned physical address.

Release such a block and fall back to the regular memory hole search,
which honors the alignment.

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 kernel/kexec_file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..6ce10e01414e 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -690,6 +690,13 @@ static int kexec_alloc_contig(struct kexec_buf *kbuf)
 
 	mem = page_to_boot_pfn(p) << PAGE_SHIFT;
 
+	/* dma_alloc_from_contiguous() caps the alignment at CONFIG_CMA_ALIGNMENT. */
+	if (!IS_ALIGNED(mem, kbuf->buf_align)) {
+		pr_debug("CMA block 0x%lx is not aligned to 0x%lx\n", mem, kbuf->buf_align);
+		dma_release_from_contiguous(NULL, p, nr_pages);
+		return -EINVAL;
+	}
+
 	if (kimage_is_destination_range(kbuf->image, mem, mem + kbuf->memsz)) {
 		/* Our region is already in use by a statically defined one. Bail out. */
 		pr_debug("CMA overlaps existing mem: 0x%lx+0x%lx\n", mem, kbuf->memsz);

-- 
2.55.0


