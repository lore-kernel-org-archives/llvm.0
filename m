Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843187;
	b=by0os2FxhjCeCvLWPnWjYAdS1sdEncSReImVbtNavZVx/X4y5hbh9kWBrNwxuvA2xJ0n
	 DBEv4/qGmYaLPDeY93PlsyS2MTd8WhFPPVB7DyCvYK49XpfY90/m792ht0xcTserv2XiJ
	 mSg86ds5io0tpdXauJdMS66ImXIzEMpB8OCPrB7fBs3xitpEPDDRfN8giI+ZpJPmBEdj7
	 xlJ3jXE4JvVAKa+AiBZeRFdBHbVVjX1LjcR7TrN62gabKBF97h3AM7y5WiPVRd3CYut5X
	 Veeq2fNvwTZGF5AS4d1MXFWMP61fkcUUo0QgguqonFrmOFxxWf6CK3RT4d7/SkAdsVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
	b=dAhI0rokLSCBkTSIiWxlU5EWsi+TFTRtXTF3nnqtqr20mnwenPlt4ibeXsuzWHiSBBJs
	 ZDJnu58F5APlD47WZiOc+8q4bgqo+sJpiiFQDjAy1nHjVtKN8aw+G1Ydru21TmSxa9Ltd
	 sSwYizz1eQp/VpVL56/pOzw4qGHMzPm5Qxm7CKU/7sPLOy9q8N55yveRQX06L4XWyop0D
	 6mVJh326tUUYbmvJXpuGEJoxowoC/feUKIlpx4pTyVrfxl2E9h2XrtMETXu7/YwUERtmR
	 h7TLjZlTwfKUnEGc9PkguTHCr5SOSpncnyRKWuNgIBALhY7vLK7DygZcbXU+EXlU+8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kDg4uz53;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32767606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 01:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32767606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kDg4uz53
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso2610915eec.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 17:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793843186; x=1794447986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
        b=kDg4uz53iyTo3Xk7eFyi0xjkJnyRWuGPXvDRfv+NuEyjFtV1cdXfYSmKHSfed8Crdu
         eaUsv6BN59B3YLa7hVzkXhrVmfnDJS1U3P5o6RNdqCN9NsJFCy4jtO9bZYALcme7sd6f
         C28b1YeSUQMjSwPP6om2HJ304CA4UiSqb8TC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793843186; x=1794447986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
        b=Jz8JgKLKz6FA7I3mAgQGMGT8bNlL4yEY222AcmnsF1oy+nJrtfY19AiKLDZ5byQnEV
         lo/Us6DyMtLgXkc/jPUqv7otYM3UcbcKPnD6zI4MYgViUWBgfDcpzNJ4pX5moFII1ZiY
         IUlNwL6mGMPUBXE2g+r+P8r7IyveqQwHrFs1vel4A7ILRoV/d3CtupAHeRZZtKDZFpR7
         GrVlvfeE+lq9fk0Ur75+XfJlZWFoM4TjSEEYHDGosAs1BuwlAgRydR3feuS4XU7Fz1Mm
         LiW13V0Mzc1CCWxuq4A0MHAu7Gs0L8vBMSumU0y6Tqtp97Ds/I9ER2IWTQlEUVDtg2ZG
         Ikcw==
X-Gm-Message-State: APuU4Z/0j0o7h2rdHF5QrMmTjakbDMwxP9zgRRUeO4wl/37qRMJcA9co
	4h0DTF2hDsm9126IkX20SOsAhUTQRSOEiAthSRsN27keCPN7jLXdMqfuWJR3JFCqQj/mbKZoVDV
	4E0Pm4NWmb4E=
X-Gm-Gg: AYBFou1yQJvIRLpoB+pZYFOEHZVUPL8Jg/+KrdAkmjrRKtylMStVzXcvaknVisSMCMM
	Wcq4x2LdkDequAyXUxD7j5HTT6IdzC0DAYVWqDFkUW2OKbvTOS130ADMDrjSbUA/Hv/zCWJSTId
	f63tSfrpgeWWE2NmI/oTm20TOJ9Dse16AzOaYIVqmHoVzWQwQPdZX8dukLEBkjF37r6NHJUxMLi
	6I8ST+pos6p9lA/QNqDOs4JAri+Mr0GndFIoQxluZrBqtwrdsPbofyJq+WKcsS169DQy+uIiKxX
	YDAT5O9Oy6B2z4FcDijY/mYSGrwZGtl350Nm4YjBT6Xelr+PBrfYDWkVRLDjm0A6gr76hsFhCW5
	icd0kFtYK2pnWOYteX1F+N88dFUOWOKLzaoFPthW4rxmUCIuQ2folzUr3eJ+p0eRMyNPlfcGwVG
	YA2zPy6S2l2ljBxUhGtvaTOOW06JrSYTs+a8w2hYp+BcbZ63hA2g34AhSEQcUGHGLeTdtHrK11W
	lGQF/rKqXJQKBuG6JACXVDyErukmiH8XMVbuGpJ7ATrlxXvZAK6TA/Q8udh9JcYT/VIV2Zqq2vl
	DOJkKmERyvdnSWpyLTBDjuYNk3rbHFkt6ak5CgMcBBZ0zBxWa+BhSDs+If500YSqFXROAGf073Q
	d166LBqWBHpXgbQ==
X-Received: by 2002:a05:7300:ae18:b0:369:f035:661 with SMTP id 5a478bee46e88-36a42389027mr22926230eec.15.1793843186083;
        Wed, 04 Nov 2026 17:46:26 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:e268:adf5:686b:4655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm15294011eec.27.2026.11.04.17.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:46:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Han Wang <nesthanwang@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Bill Wendling <morbo@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
Date: Wed,  4 Nov 2026 17:45:55 -0800
Message-ID: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Han Wang <nesthanwang@google.com>

AutoFDO profiles are commonly collected on one kernel revision and
reused across subsequent commits or stable merges before a fresh
profile is generated. While AutoFDO uses function-relative line
numbers to tolerate edits above a function, adding or removing lines
inside a function (or an inlined helper) shifts all subsequent
relative line offsets within that function. Without stale profile
salvaging, shifted callsites fail to match their nested inlinee
profiles in SampleProfileLoader (dropping profile-guided inlining for
those callees) and basic block sample counts are misattributed to the
wrong instructions, degrading branch probability estimation and
machine function splitting.

Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
since LLVM 17) for C, Rust, and ThinLTO builds when
CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
to use lexical callsite anchors within functions to fuzzy-match and
remap shifted line offsets when querying the profile.

While -salvage-stale-profile is not enabled by default in LLVM due to
the minor compile-time/memory cost of sequence-matching callsite
anchors (which is unnecessary when profiles are freshly generated on
the exact commit being built) and the heuristic nature of fuzzy
matching on heavily rewritten functions, enabling it makes sense for
the kernel: hardware PMU profiles are rarely regenerated on every
commit, and anchoring on callsite names is strictly more resilient
than blind line-offset lookup when functions are edited.

As a side benefit, remapping shifted line offsets also avoids feeding
mismatched weights from stale profiles into MIRProfileLoader's flow
inference solver (applyFlowInference), working around a compiler bug
[1] where a small intra-function line shift (such as in
__vm_normal_page() in mm/memory.c) can cause applyFlowInference to
spend 30+ minutes compiling unmap_page_range().

Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
Signed-off-by: Han Wang <nesthanwang@google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Much of the commit-message justification here is AI-generated. Sorry!
:( Folks who know better, feel free to call bullshit.

Honestly, this patch came about because of AI analysis compiles taking
30 minutes to run (see the clang bug [1]). It seems to work around the
problem. Obviously, we should fix the compiler. That being said, upon
further analysis it seemed like adding this flag was beneficial
anyway, so I'm posting it upstream. If folks disagree, we can simply
drop this patch.

 scripts/Makefile.autofdo | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..3b1e65a13ffa 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,13 +13,16 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += -mllvm -salvage-stale-profile
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-salvage-stale-profile
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_AUTOFDO_PROFILE
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    KBUILD_LDFLAGS += --mllvm=-salvage-stale-profile
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
   KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
-- 
2.56.0.455.g6c5a503b38-goog

