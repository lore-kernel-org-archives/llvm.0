Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792740799;
	b=V42XqKTaCKGOvNknoIlPLfXwBUYH1ceGlhx/YRO1X0Y5PLLLMr0ytKjaxJGE6VEXLurd
	 16aog/8SN1JuRaTcBIT8UmVXn1dVZ6/NLj4qpxGOOLLVScPIdmXBVUGY8Fc4ka5PjAg91
	 jh6Jjyrfzd3jdKpXE0m/YQcL2JCZp7/BY9lf2193sYMyKz7h1gX136NC9Y3vHrMqCzvzd
	 6K9+0IBmsMJPx9snwkYwjOobrLhEmUf8LlkVYcODutDGj5lrutdKgQB+NxcVYtiSJ0jRS
	 /IItXko2dcltNBLZMWg3KPNbj94zpRIEcVMOCFWJjpTlAodVjey63z8KSNTYkTCwRtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740799;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+OjyAynH0oD0HVraX7bbem/k32aJw3On3UPimsYKksQ=;
	b=1vQZ98JLj1y2ZAnIuqtAgd0C94UBkU4WbE2IdWHXgBNLOuJgCI7uXaSYGf23TOJX03GB
	 qDMNwBAQHvRMtvIn2W/cqTZBiixSGvQEh7Tjp++Tz8CJY7Lc3xUnQ79iJFew3X40f4S0w
	 QQJt4Lcq+f2CbffgbrXEVIF7jwdXHiECHummQfA/OzDGbeYkDA2yLSM5hjCngNnDIueyN
	 iva9ZELuqN+kZYgP0O7nnp8WHP73xeBDMc7X5x6v9fbJbeCzRTbiZdU3WosTQOZOlhedx
	 8I2lYYVmPCE0hCf4kDE0Gj7VK71eyHE5mTVdLMM6chcjpHNHSa2/TNOnLOI2lzAz9MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+0kF2YT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41732606A31E;
	Fri, 23 Oct 2026 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+0kF2YT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792740798;
	b=n1EU+14t85857+Zc2Dk/i6a6lASF6iMg9If4UzpKJOgYCN7blibvkSazDxH6b+qYEMyY
	 uMIUC4RSabbaCP+C2oqZlewjoO+QbLKxuJT4ARd0Vlb+09G8Dk0FIAKMlPOnBIe8Xx70W
	 ohK+N06N63tdh6F3CAysG7h84pz+Sfnf7/FQSAbc7OwpVrXDd2ZwiFHEAzv3TJJ0MvYY7
	 49pN9L21BFqO0Kg2fy/2NICTy40K9SAjIoMGYfYM/pdr2kYzSMuw1U++NzhWTwaZ7jwiO
	 4cDro00sNSnVzDV5IuDp/CZmmk9nyZIl+G47jtMgM3V5sXS8ZdbBiOY4qggIFLahUoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740798;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+OjyAynH0oD0HVraX7bbem/k32aJw3On3UPimsYKksQ=;
	b=KIf8c4X67EwOUTXEq6w1KIR5GFe2nXozAnQZMR4wwWe5jvLqWoufmgpeL4QYAmUUBfeo
	 BJ0FExe+B1XtKbvsM088QPNUk5VXg5+zOMO0qGu1vH7kC3jOV3kxQasHlkVlCHPpcXBsB
	 ggV2YfkOShIXPfOOQZinXYuCYilVf1JP0Kq+AJzSS2sUJyWnG8aqbEVltt8HmvjKYZaJO
	 zmaMZA24S/bthpB0lUxFv9E3zsF5NiyoQFfz3+2742OFDcuuC0nt8onPSlVaAz0m1C9yx
	 kLRMqChBYLg/ALMTAT6ohUK+w3Vao96Pc+KSYD43N5BfnO12H39kHRaXf8QwfjYP28Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF62B1F031E4;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740798;
	bh=+OjyAynH0oD0HVraX7bbem/k32aJw3On3UPimsYKksQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W+0kF2YTSD2UlZjSeo4uBf4oN3rq6GlCPjDSJLxhvOxfwIR0q294PxqqRRgZxI4cu
	 3EwsOG/3tFSyJPtqOzLmVrEkWQA3zOuC/4aUObctJFdWGH7AhD2aACaahrGyHV+bNp
	 DPNomSiUbDwQ4fcm91SmQeLSAtm3aYCWEVFcAvsDyqJ8CQjTzzCPpOn7n7j/msHVWm
	 sz3c1et1VhI1TO/Yi+hWNA6idSHZRY5IMKubvJC/jGkU2de+9I4kp24PNNIvyyylnX
	 9cm12cLkZ7PRgu6c9aMJiYSqrQ0JqEWX492krPcEaYs15SkDKPeDtPG56uJlQj65aO
	 +5OnIdSr+inOw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 48838421CE;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Fri, 23 Oct 2026 15:33:14 +0800
Subject: [PATCH 1/5] riscv: kexec: Disable the MMU before walking the entry
 list
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
Message-Id: <20261023-riscv-kexec-cma-fixes-v1-1-825b90ea23c4@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792740795; l=2405;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=EJAmc1LhiOIaPfBoanoCTj1bfUwyzJ9NpP/6hMQvfHg=;
 b=HLOjXket0TJYHSjizcezuxCYXNT1wamHy7x02PGGvb9bpIIlzpofSThrWyW6LG0iwUaelhZT9
 ertk9LY+oWQCK+TpyWDObtpYQmdHgxIQWiAwAV1oGrsKG+MLqHRx8Zi
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

riscv_kexec_relocate() only switches satp to Bare when it meets an
IND_INDIRECTION entry. Since segments may be allocated from CMA at their
destination, an image can have no indirection pages, and its list then
holds only IND_DONE. The relocation code jumps to the physical entry
point with the MMU still enabled and loops on instruction page faults.

Switch to Bare mode before reading the first entry, converting the list
pointer from its linear-map address.

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/kernel/kexec_relocate.S | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index de0a4b35d01e..419b56600550 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -34,24 +34,22 @@ SYM_CODE_START(riscv_kexec_relocate)
 	csrw	CSR_SIP, zero
 
 	/*
-	 * When we switch SATP.MODE to "Bare" we'll only
-	 * play with physical addresses. However the first time
-	 * we try to jump somewhere, the offset on the jump
-	 * will be relative to pc which will still be on VA. To
-	 * deal with this we set stvec to the physical address at
-	 * the start of the loop below so that we jump there in
-	 * any case.
+	 * Switch SATP.MODE to "Bare" before reading any entry. An image
+	 * whose segments were allocated from CMA at their destination has
+	 * no indirection pages, so its list may hold only IND_DONE.
+	 *
+	 * pc is still a VA here: set stvec to the physical address of the
+	 * loop below, so that we get there even if the next instruction
+	 * fetch faults. The entry list starts at image->head, in the
+	 * linear mapping.
 	 */
 	la	s6, 1f
 	sub	s6, s6, s4
+	sub	s0, s0, s4
 	csrw	CSR_STVEC, s6
-
-	/*
-	 * With C-extension, here we get 42 Bytes and the next
-	 * .align directive would pad zeros here up to 44 Bytes.
-	 * So manually put a nop here to avoid zeros padding.
-	*/
-	nop
+	csrw	CSR_SATP, zero
+	sfence.vma
+	jr	s6
 
 	/* Process entries in a loop */
 .align 2
@@ -70,8 +68,7 @@ SYM_CODE_START(riscv_kexec_relocate)
 	andi	t1, t0, 0x2
 	beqz	t1, 2f
 	andi	s0, t0, ~0x2
-	csrw	CSR_SATP, zero
-	jr	s6
+	j	1b
 
 2:
 	/* IND_DONE entry ? -> jump to done label */

-- 
2.55.0


