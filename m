Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FF2D5940
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193926; cv=none; b=A0oLieggMjgwOdGC/fFs8iU/i+dt0Ui/gikhuyhW9UGBGKOvpPgEqaaRIvRIDgj7Dyok3wwNq63gs+FNEeItFY+7Gr7aAbInRv5oJOikg8yNvXtkv2DVGSkzcWAuJeRbw9HQYGeC6Vwy7/CQt+kXlZOC01w0YnGH+ireLpa3Nx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193926; c=relaxed/simple;
	bh=skp6a1+i24vr3ZUetqOg5WmKTF0iU/JeJP6zzFcRmSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUDXSdSGnODhZ7wswd6V4dsX7ypqAKc/GjNxJJHNopcZ4mDRhtnM7uEvcEAmuSsvp0sO6MUmu2oIToRaIVQRXsuPYcFUAhX6fD8JJWXk/d4T07TTe34+WlhF5yx9u0aN1k2JMeA191xC14BvvllZtykMNMw3JC1tiK9Eba4Y25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGqauh8M; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGqauh8M"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so4960149a91.0
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193924; x=1777798724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SYhnvPVAJd1oaQ7E3w3ymi0iyxJM6QAUXA089o3vB8=;
        b=dGqauh8M0/lfPWqJYABwtXnB+gKUhtoaCqeRBU8U38OAe1aOdb5burvrmTEKE4IdVN
         GWxTvv6CM8ufQzoo2n7OMXP9tYe3ew5lrE0rSTGbKU0OeLoli7V+8rUptBwVKsogzvHv
         YMvs0vmho8y47Erau9F9IP9uFJeXKevAtzkeaCr/xONQEsRA0G8emW5cXGm8scql6BZA
         D7Qy0ZgEuB1q5l4S7HNFkpjz8QBkP9eFOvXaQrn+RfU9YRVn85ZuPd1eMtWldY3zNztS
         1QSmu2m/RGP5EDPGqRKJCjaa+BroLB25XjuL7xQqx6fULfxNGfLB5ExZ8smxSX1gGgbq
         X0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193924; x=1777798724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SYhnvPVAJd1oaQ7E3w3ymi0iyxJM6QAUXA089o3vB8=;
        b=LQpL7ZRFde+Bz6s/wrrYHFduoOR8HGhzVwKCGvTxA+zKemfAeF7O4ss26aBB4MmA55
         2BNWYvIO3gunG3tkIck33sS4Jguwb21PNlsdog3m+8TwNiwNb0nbylpYTV2HJhSzXVpQ
         kNIgxfvlfSvy8reUPR8HuhTtBfgc2P05IsfprkPmwoy4NjUirtmq2WHqoTlhWvOHMjer
         M79znFpq2oUpzKfsOilBlfVOSFNFxDCre+BJo1z71roXeFgB3CElQg7f24KO8Y60U+s/
         cuadRoSLXa+ezrztT7aGUEzmwTxg4Czp+q3elhHrSZIvGdXp2OeMBhxhUfXban4JPBUn
         CBDg==
X-Forwarded-Encrypted: i=1; AFNElJ+9vxM6DkBS+Tvxb3tVvHRKHvhlLdp2wPrrZk39nGlXea5xBPqOsqWMO2/X2Nz6l5E051rx@lists.linux.dev
X-Gm-Message-State: AOJu0YxXakNYX23bC/nBvNnvp6hstQ/YKGjkVSg8GySgHcq2lfMqajNy
	wglFZ6iSw1RgrdhiWxRb5Qm5zLm6MoLkRQBZvWWh7ywL+1KQuSJnyDLw
X-Gm-Gg: AeBDietOrYq7/70tm6NF3KeHCCFzibBrIORJDLLiGz862Xl4O89LExstEZL2Td2gre+
	jlL45eTuxkiFsq2JkE8EaiFoL1jwi7rFIcpKgZ/rD5OJZrg/4XUEJO6yIt30SYuEV01KFS+rvst
	iCuhJiwIXcj4xqhLS6DpyHzDG24oNn3X+3uW5SMp5eHZ9Hcixt8FIKpsknC60gPmb4X5w8vKzLK
	dHxwwzEsDhG3jGR1DK2QQ5grsCSG3jxWqRzjOX5DPQs/9C5fVbJhx36Y2lXdiVYWCqaiDMcy6gR
	YXCny22hPe3R6VTxmxpMceMo9TY/3Rj42lqZJbwGXktmnE7VyfZw/lLoN6Mh6QYn0X93/kFCY7o
	8X5Mlmb8bNZQrNSXlsKazTBeKnlgDxk18S9NWBq/s0aTw/xzWX5FN+UIHL9vs8EEbPAfGjoeTgP
	2vJOpOEWA8+Ivq0A8hNAmgU4wLryX25PFDDkjI7dHBE5aS/5TM2tL07E5eomVonO2YZlriBD7V0
	LsbjH5GJlNVi0U=
X-Received: by 2002:a17:90b:52cf:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-361402edcc2mr27986180a91.12.1777193924145;
        Sun, 26 Apr 2026 01:58:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:43 -0700 (PDT)
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
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V14 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Sun, 26 Apr 2026 14:27:23 +0530
Message-ID: <20260426085725.2090827-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index f6369d121c50..9aa18cff2fae 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -615,6 +615,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.53.0

