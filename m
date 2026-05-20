Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623934D4EA
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259673; cv=none; b=qEdanK8YKXWEXE7NH3jsfPEvpcQV2Umijn9wvWN3ZsuAkL8GmMSMfZsoL1ssSK82P0VCQeeDXLkNjGBcgX1RAO4G+tWBHkKd4/X0e0K69jyvqtTGgevnlaIVEk3qu54MCFk5WsitNQyO+WD2cj7B7HiEwhlRaTt1w6NE4INNGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259673; c=relaxed/simple;
	bh=Dg93UDfgNMmf3frCyrzgybqXjzCFSicmCtGflkVWgoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SS4Ms0V5KWHjBqW4DXp3dIRz5Y4BgmF0VFAoeMQBti4ocXzu19hC1QYfvAfhn2iTNSKU0HdAwwDEaCYkFQcpo1+6RgJbsQTo0vBlVggaknr2O1RdIKKWfihSqiqVem6YW3lXhaPj+mC/sIkaqsfP8vwazixREUSxEUY/9l6TnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ewdo+KGJ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewdo+KGJ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36643b96b99so4166374a91.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 23:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259671; x=1779864471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwFpdmrQysTo8snbwtDD0b/CRHKgzW4YRIXP8JLk4/Y=;
        b=Ewdo+KGJQhyd6ALeJnm9Gu7jlwG+osJUBtjmfX4+uuurFE10dcThcFDi1N2JuIwsTv
         6fO9luZ+Dl0XIhT8uwbLiA1dBVFuw1/fH9Ljyj/oIsAZ6Od6/R1D4w2hdSSHqd/a9I1B
         9suC4LGXAs818j2YoMIvuCmuqzXNsh/Y446/dFnR6QmIhAL3vfX5+TGghDln+jXXe1g6
         PuzmgvRc/CfxsdlSVg9UqtPc0GgmvpCKwr7yO81jATquh+MKj3WJoPLqoESCnEasyh0N
         oF3E59QRyX/WyU+M9jpJ8ppkSNvCnkZbTJCfsVW6YAnYCgKv14uDF4i9H89q8AGGSPri
         g8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259671; x=1779864471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DwFpdmrQysTo8snbwtDD0b/CRHKgzW4YRIXP8JLk4/Y=;
        b=MA8BcYdhKVl+XxnvjlEz/h9n6Ou8CrX04ZfdswcrQveC4VRGQ2VMtHDAh6OVtrWkxq
         brPdSWKFa3aeLEBu3AXGjdvaXg6EUoWJfEC2MA0mSyrVosDdsFCmDXm98Y3YnPliLL+3
         38OFEaX2M2f9OfzNfmCrSoLuh5CQAo9wgASxnbrQWL3PqSExi4Pl278WfWEqjqxETkId
         tQR2WR7wwr1qF/6K6QwxYDFqPEle6kQGjjPzWs/yf/l+tp4mjy4pLmxe9oOIKkcLYDOp
         oQdXT1YUemjMa1MbGDP+7dTW9F61bQc03cdic+4DNczTm4uN8V02xMzUtoh+mzxOvuc2
         d/TA==
X-Forwarded-Encrypted: i=1; AFNElJ9voPFpXDEafHAJeb0s/FIenAPlSAHhU/zmHcDGGv+rPnbfLi0arKsfbp2cX+eyHkxQpGvc@lists.linux.dev
X-Gm-Message-State: AOJu0YxjlsQJFq0QU3FBJzdVbmSnDunuZJgxhB7YHRumjLV5lepQR7Bd
	cIW8eQYed+517wIV7kFjYSdfloUl801osz6hmuf9q/8WX+85Eh+zjzqw
X-Gm-Gg: Acq92OEFPXRyyWnevV4OBz50iFdT6NvTXZGVzvWerCu5C/h9bj3Mb2NsH7FrFFn854z
	h110/u1kJFy4Qw31l/2dZ+q8ZbyqtyRRHh438mpaxFtVxq1+pCkHxlze1OkWwruhWVluS+DzlEU
	+4UhYJLpf85A6LEauG9CYkibpOGsXNwszGVyE7Y2VsGL+117t0oFeMTibtGEc6+Xpc3wgxodTtB
	V1enkzjg8cBCkukyKKsnY5iXgYnGcEpWfglqg96AlUAOo4/0+J5pbUNFwUgdtzjQD0m+oVqYf6q
	NykLdNFmTASpU0+KeITA81+MnAqqSPq0Ojc4HvDWd/favjnoMI1gRTg/CAPwADOUQamA11wANEs
	K0GXn96hwEZZUBwEz/U/Gwey1EMrwOMjK+AKApy8Ts5I8hr2WjrFN6USuUnepmhkf3LpY9C1kaf
	rySfEiPIAduxTN4GKaOeuFrqdYGW8hHNT067Af0kEwJjmhk42cGE6UGbVIINf8W611XQrjPz39L
	n1u
X-Received: by 2002:a17:90b:5290:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36951a044b5mr22090513a91.7.1779259670620;
        Tue, 19 May 2026 23:47:50 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:50 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V16 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Wed, 20 May 2026 12:16:27 +0530
Message-ID: <20260520064630.1785283-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
index 6d7ed7a1ff18..8ce4fa0e5e57 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -618,6 +618,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
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
2.54.0

