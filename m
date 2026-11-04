Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808491;
	b=UEH9W093pfDQWjriiF7VmjMeVBITClq1QXKCFZQrnHkOnkC425W1G1UFtBeKot14BIOM
	 Vn9Ir3U3ozYlRGb8ZVHCVxg6wRS0fPh8uWD3Kev/dp3lNvs8NyazWVBtaH23Y974T17hC
	 EfnRhNLNZAcPxP7y1PxylmZZ/yc0Eu0aCV4jug0GQeirKaM6HLjNhcr80E0C9NyaXJdI7
	 QwZY6YOgbmyzF4xUo81hqG/IqXOaWEYccs4vXLCeol+AWYyw0jy87xDa8h/rwNIcZTP0D
	 iHeXlGrrUGtV5Lo3QL9n5hzHn30bKdoOUD9Gn7DZSaenjmwNg+tPBo5B2OuFwDHw9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808491;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=12512aLllXftI9moEQx7MlwEUWUL+y5ReetVj26fF0E=;
	b=YV5Os6IPoin547Ve4lyFTPgrSkAOM678jskcigGCdhgeJUHzyhhAYCkLGs2fyozAJVjv
	 VDpb8/U8709ZhxUYH4ZV69Uwo+FuFIFV5uRZtxSVi6wPrWF+Z1tdF2Dg5LDaYYQfvyVt7
	 YFVhCMFg5b3qf9Fx6uVt67OnSJUvV4L990dH7r3Ryg2jk1C9fgYRjatZZCrgyyHntNNym
	 RWqTcKWPFesxitEexp8XZWoydBeZjMRYBYxKeH3ra9GxCEm3s5urT7JrfYFlPcxi+UvnH
	 Fd+SdS7aijBPkfN2Z51cbajEFS4z2nx/0bF2avwZCXVFt5E/18+A5TSwf0WAMxkTEmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="rb+/XLQD";
	arc=none smtp.remote-ip=95.215.58.121
Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F9606A333
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 16:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51F9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rb+/XLQD
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TEEBqA5mys4k9gU+dMidncfMYOQA4DDB7pbBCcoYQ8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808487; v=1; x=1794413287;
 b=rb+/XLQDmsVYYxbxM3pGl972/st2pEV7ZbvHwKTQUgpV6MNzyw2KF70URj+Bt2J+vOuRHzCL
 riO0CRGCictBJBAk5Tk2a4cqMqj5SLr7tvHXx3d4Aj8VftTHV86KeYzyqriAc3piAsMLTC2pkyL
 CQudFOs1JOex96IapnoJGxFk=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ae6b6b9431f873b0;
	Wed, 04 Nov 2026 16:08:04 +0000
X-Mizu-Trace-ID: ae6b6b9431f873b0
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/4] drm/i915: Avoid -Wconstant-logical-operand with GCC 17
Date: Wed,  4 Nov 2026 08:07:21 -0800
Message-ID: <20261104160722.1637541-5-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104160722.1637541-1-vineet.gupta@linux.dev>
References: <20261104160722.1637541-1-vineet.gupta@linux.dev>
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

GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
of && or || folds to a constant other than 0 or 1. Three places break the
build with CONFIG_WERROR=y:

  include/drm/intel/reg_bits.h:27:48: error: use of logical '&&' with constant operand '256' [-Werror=constant-logical-operand]
  drivers/gpu/drm/i915/i915_config.c:13:43: error: use of logical '&&' with constant operand '10000' [-Werror=constant-logical-operand]
  drivers/gpu/drm/i915/gem/i915_gem_context.c:999:45: error: use of logical '&&' with constant operand '20000' [-Werror=constant-logical-operand]

clang has the same warning, but it checks only a constant right operand
outside a macro. Here each constant is a left operand, and
IS_POWER_OF_2() is also a macro.

Commit 1a839e016e49 ("drm/i915: remove IS_ACTIVE") moved
CONFIG_DRM_I915_FENCE_TIMEOUT to the left of && to avoid the clang
warning. That does not help with GCC 17.

Compare each constant against 0, as commit aeedd3a82678 ("drm/i915: Avoid
-Wconstant-logical-operand in nsecs_to_jiffies_timeout()") did.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
 drivers/gpu/drm/i915/i915_config.c          | 2 +-
 include/drm/intel/reg_bits.h                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..1639639dd290 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -996,7 +996,7 @@ static int intel_context_set_gem(struct intel_context *ce,
 	    intel_engine_has_semaphores(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
 
-	if (CONFIG_DRM_I915_REQUEST_TIMEOUT &&
+	if (CONFIG_DRM_I915_REQUEST_TIMEOUT != 0 &&
 	    ctx->i915->params.request_timeout_ms) {
 		unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
 
diff --git a/drivers/gpu/drm/i915/i915_config.c b/drivers/gpu/drm/i915/i915_config.c
index 9e13b1be407c..9bbebe0a6a70 100644
--- a/drivers/gpu/drm/i915/i915_config.c
+++ b/drivers/gpu/drm/i915/i915_config.c
@@ -10,7 +10,7 @@
 
 unsigned long i915_fence_context_timeout(u64 context)
 {
-	if (CONFIG_DRM_I915_FENCE_TIMEOUT && context)
+	if (CONFIG_DRM_I915_FENCE_TIMEOUT != 0 && context)
 		return msecs_to_jiffies_timeout(CONFIG_DRM_I915_FENCE_TIMEOUT);
 
 	return 0;
diff --git a/include/drm/intel/reg_bits.h b/include/drm/intel/reg_bits.h
index 2a9066e1d808..f913c3e61f39 100644
--- a/include/drm/intel/reg_bits.h
+++ b/include/drm/intel/reg_bits.h
@@ -24,7 +24,7 @@
 /*
  * Local integer constant expression version of is_power_of_2().
  */
-#define IS_POWER_OF_2(__x)		((__x) && (((__x) & ((__x) - 1)) == 0))
+#define IS_POWER_OF_2(__x)		((__x) != 0 && (((__x) & ((__x) - 1)) == 0))
 
 /**
  * REG_FIELD_PREP8() - Prepare a u8 bitfield value
-- 
2.53.0-Meta

