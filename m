Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F9335AC30
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201216; cv=none; b=B14qBKcUFzxeDa4cGG5aXuFMOWYkjGxvN7bgveSaye9De6gN8YFrTGHCNdzrMIEQ6GOtURpkVl0cMieZgp/W1h2Y3Cg1QEonA+TehmWhJxIWbVaAa6vEfIbuvWsSiBgqeIRgoB3abXz0iAYbXWqpG95zemV3tAe+TgU2yYBWYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201216; c=relaxed/simple;
	bh=btkQtdgQ0/faA3G8fQ7vJ2dLzybospS9rvLC2N23AHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgbX4jMBq9o12CC/bzaWwZjHat6Z2sf+vTjNGrpv6245KfQBoyupIMq+0vlEfKYP5NmAnYfsyJRnkMSG7+jxRCwGoFDOz7MPpDLBsBFvCIXmHk1vQuW1Z5bhsFeqqhrWrWgkvw6PewG5E1w2E1Lxb3ZYt0niVizB7unpfwo9g5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnYE1pJK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnYE1pJK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b24fede2acso60766205ad.3
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201214; x=1777806014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=EnYE1pJKDN+w4Zd5IX/CtOkxRkSQnpLAlXX7J8Zhpe3pfjYThpZboo55YsI3lDeHa9
         eq/gGI/luW8uiaDXmBcWI0S80NIQBq574nExNPfJFJYu+r8S5XjWFICxKV6HRSu34uWB
         ixBzWxgwwsUrVhsv8CNio8v9cm/Gbp3GMdGG8fraR6AQw6Xysj7ZJf1Ih4cGA0V6F4CB
         dVXUXTFzvnWW4zcY7DjMoVTe0s4xP5ZLqrQcqy5UTWmxFLmtsScS+OsY61SyszKNkVej
         VVTkiiyFZsOY8aLi27LP+HouQQGhzBGyc/tH1l15mLbxc5tPFNqZPtWMvjXVq226Zps5
         Rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201214; x=1777806014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=Spep9r+/YU/Va0GvHoLSqh5KdkmuXUrb+Lp97nULHlvGBLYZoSh1SBVjs9fziW30s/
         yeG2zJPRUIYD7PHXChTXIH6DSWmh4xzLjKudiIsjWE7ePnSa9ON/B53nV6L9ADni+clc
         0a1TuqNteSUPgsAqm2DiDx5ymTW9PRecNIQIQ04nGY3uSUH83QPhcCHFgQO6ahHgUmmi
         rBzokbmZKmmf9yt3+Jgpf2N/u6MsxS98f3EDNuhdhAzTVNEw1CML/Cw0NfBcwjv7YTQP
         r1oh0YTX9DfQtHiKsKdXn6grzx8yv8GC0T6ZraunzbRrosx5EFyqURz5d7aeLBzERJOZ
         0YmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pL5M4NgSYJfKCghbTYr4/mP8h2Flu3yWEQtbktH3Q1R+HgzNLLIeHWqTa49/DzRnwkIb6@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp8r0jpGLsRxE3MIPfOBjcAanGbNmEMBBcCVFOOSd2jQL7aSuP
	159wP3Crk0QSId737q83Mu/AtB8KiO0oPw/p9EJRp5l3eLU0vjTYdo7e
X-Gm-Gg: AeBDietTxmIeKT3c1FINxqHX8fdvtAs4IUBxNqiOMian670PlfD6Fpdnkjpo7GhawhF
	B8RDDm4btUgSkFsvCoQt6sPpFKauyVnkyrqexiKI10pyCUtAxi8HohMYCYjc2jQGDJ0SlRqnZzM
	pVmgyn84uul2gRVSbh4ye62MiApc0EzvWEHNGtt4bjhWaZE3LtkJG9hfgCBzem0EBe6caOQ6eh/
	y1/mOMj8Kba56U12eYSpWw/H3eJuzAq1XgORIur3hRVRBqqbpTVeKReNkF5gMxxVr0TSnnZV0g2
	1KQj/M2Szjz3LO0j0YEv/ZYdhY0S7krcZlza7FrsPO98WkHSfaKddvoYB7TDvHA11vO817CGzRD
	i1tqMWqNsc7EbJcJYx+pKD4EPQN2qw5M2bCvhGmZcEbwUF0NwxynV8mmp8nMiu5503rpJViV/tk
	YNMwpsBjPx5nuhcBY44IfJlZXpXXVAIfebIsx22iMk4c45Pa+xfWdmf4QUYD1jufiogrU+SPc3X
	LbSvyTet83+UtU=
X-Received: by 2002:a17:903:2acc:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b5f9e8cdb3mr378037025ad.8.1777201214089;
        Sun, 26 Apr 2026 04:00:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:13 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V15 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Sun, 26 Apr 2026 16:29:27 +0530
Message-ID: <20260426105932.2270364-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with LLVM=1 for architectures like powerpc where
CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:

  ld.lld: error: undefined symbol: dma_resv_reset_max_fences
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)

The issue occurs because:
1. CONFIG_DEBUG_MUTEXES=y is enabled
2. CONFIG_DMA_SHARED_BUFFER is not enabled
3. dma_resv_reset_max_fences() is declared in the header when
   CONFIG_DEBUG_MUTEXES is set
4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
   which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
5. Rust helpers call dma_resv_unlock() which calls
   dma_resv_reset_max_fences(), causing an undefined symbol

Fix this by compiling `dma-resv.c` file only when CONFIG_DMA_SHARED_BUFFER
is enabled.

Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_lock")
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/helpers/helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..09ee5cac600d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,7 +57,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
-- 
2.53.0

