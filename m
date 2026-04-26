Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746292EFD95
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193913; cv=none; b=YOk0TAmeKnxhwAzSEZPnXFSXxzi3/vAxySYTgyYYTNwl+xuMOPYpBNJe9Xh63b5DNdBoKxNwEmUifiGBrsP9pe5/OOnjO3+E7JgF+/pRNUfebkkDv1NcshED3JNA5oTnGN5PaZvIJG44KtLZefTwMO9WILQ/ruRNYPhhLZnRD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193913; c=relaxed/simple;
	bh=r1aKh5I901VyW1MTDbYbzZkzaliwYbiMtV4wPKGZXxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW7wasL2jwVNvX9tukcKm+5eUbPG9Si5Paii+hl7d3e/OCTHXeDV2iaX6lJFaWR1rCVnStlcHX5ZgDBWYRGFkKf+fsmWpWwdhr9HPeEeRuWKrNBxDa1RUh6L6JXyxoxxCkkIAttpZwxYoep/oheD+3zilge849O7ESqvDa2b3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgbUy1dm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgbUy1dm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso6337046a91.1
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193912; x=1777798712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=SgbUy1dmTikDKbD9+PjRDdy1SYhk1X5FGj2NK9nXlUr7javiwxxEUswkfTU26RHrXa
         6Zig22X5XyUF6B+go7AbfxlIGlK6Ytw2bDQLo9Fh2C3K6AiV24Eo+0sFeqZzD9AdIYhH
         A91/KzaEk3O5uOzkCHMRgktFO6PzzCeF0Yq7d6KPWxq5aG+G4VBR0Nc/zNmnbNSEG0XG
         FpaC9hbF26g6AQ5dQkATRTbxzpIvjO1X7MudZYaZ57lphbI68grUXilrBzTNYNFiiVxR
         kaw90yQnnsPxiFmNLqs7ezA0WcU2LcUAzktkrf0yhzNCdvcgHKnAqfUAuPXWUoQEgX9W
         ykeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193912; x=1777798712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=JdT2utM4WzltJ2DySJPBWi3Rxroc1CXsZQ1qPODYUDl8d8QwNcG5jkivcM+3GTurVv
         sD0qQv1vWsjwnuytbXvP3ti5hcXdXA8GV7FC5fty3jGkQGghoMePuDqTDx3k/IIB705G
         q/b2NqaRFDjvbcrnf1bqUvvmvDUbeiCRNEt87EqyOjBq2zRnL/NQhqxYDJpQoc1O+HAV
         VCV95e/6zQJpTyKac3zDWjWaGzuia3gBmf8NAm2rHLXMMTCNookYBhliTdhzisdYxIEi
         Jq6vvBsvVRCv08lwyvipoPy3y6qDf7ohWfybcWQuLRcRSO1rVYShQS20o9My8HhO39ds
         RqSw==
X-Forwarded-Encrypted: i=1; AFNElJ+f2KOghwsnCkzY8Mh8gODY7Q8dbhDkTTDw7Ddisc4HIfTxnp3Y64lysL7wnrCzXACnvLnM@lists.linux.dev
X-Gm-Message-State: AOJu0YwW69WPpICfteheb9kFpfg+mMvUpOixQtJRrTc02HvUXXgwqsjP
	0jvIk/QNBtJ9ERNUOpbk5oauFN3nWn+KdPK0T4VJQkv2QdqKFKqgbwIC
X-Gm-Gg: AeBDieuupp433PGrszTJf3iDvAo/SRHO7FZgEob9TxOM7Qvd8OOEkaEbLZPtqDpc4X9
	Uq7peOy31552E8okvvZsVP33889x31X+5m1alpbCfwnblSS29byO4mEjOXZjeIYXE/Wbu2PoMe7
	AlLwVHQ6RaDpfVhhJGWJraIjGDirA1b3/Lw8A18l7xsHsitVYLC3X3qCAn8GzuPRlB4HiGo4v51
	Os7vSIR3qZdcVo5Cq7vOrskGQ6pGbYKFQGndFB/KTALE0nH62yBvYASG+sKqG7s/lM25Hh8XaAQ
	4DSmUelERJuxcavh+BDCUimLJHRVdtpA8Sw+0cZQ8cbJkGuMVDLJkEfm4vexsmFfim0HaQqGmAA
	LVcYgV/iCM+DIgsU2u3Z7vPL0iCplhX9e6cz2O8mtUPRNYDVb3WXz/a3+7e0d/oUJZAoFfLtdk3
	vY9A/TxJD/xYCvERLHcCENG7Yy1fR+b0249VvORQKs8Ti/z4PI4g99LBhor/58Q4R5u0sNSivRG
	OVaV7rAEiLGzAA=
X-Received: by 2002:a17:90b:4a0a:b0:35e:58d3:3284 with SMTP id 98e67ed59e1d1-361403e083bmr38831908a91.9.1777193911700;
        Sun, 26 Apr 2026 01:58:31 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:31 -0700 (PDT)
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
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V14 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Sun, 26 Apr 2026 14:27:22 +0530
Message-ID: <20260426085725.2090827-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel are not there.

For example Stable inline asm support which got merged in 1.95.

Link: https://github.com/rust-lang/rust/pull/147996
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 scripts/min-tool-version.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index b96ec2d379b6..406895621511 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,11 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.85.0
+	if [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
+	else
+		echo 1.85.0
+	fi
 	;;
 bindgen)
 	echo 0.71.1
-- 
2.53.0

