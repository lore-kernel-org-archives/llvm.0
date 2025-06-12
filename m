Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7C2147EA
	for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717055; cv=none; b=eL4mlGuxH9eAjmVWtn5pIBUWs6SXftKXJ49mdxorHzP6lt9Y3idE4eT0FZYPYgqmfpC4kjHe7nScUvfG/LTJU6JJNm4YHU1ILMZxNBJr13UYztJFLX387GNY8Qff+/z/YZfHDMG3blzJfPyzLDmJDys1e0D+WXP/AqTLwFXmfao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717055; c=relaxed/simple;
	bh=mSPz4JyDiTbHlIZY2LoFchrSDTmvR2H2ufTA+zC7mXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSAJo+eHiTFjTthRfx7GZuRePYwIyzlgg2aY+qsDAr/D+GIbrsZZE/93TD1SRh98cgtW5unwVkWWh8wYSx/3Y+0ji++IGAHlXResEz0nlX8yYf58ZtrayBwh1JRUgcUy6Wdva1HNHAymekNcEIlDoRerSMYyL86PVZnblfrua7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnVJcQfG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnVJcQfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C4CC4CEEA;
	Thu, 12 Jun 2025 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749717055;
	bh=mSPz4JyDiTbHlIZY2LoFchrSDTmvR2H2ufTA+zC7mXY=;
	h=From:To:Cc:Subject:Date:From;
	b=bnVJcQfGHwR78iMhMGJ3/c5moT+Bn2Ma2Q6g2tWpN6A90vUf3ykTM/Z5mq/OLFJ2w
	 e8S8Y5lPnV454HZORUiUUUITukB5zxDoAcPrs3eRl9QXwABr2M+o5Y0MmU/Y+7+5m+
	 vYpCBJeqgNYlyaTbucxJZ9lSv7W2ONvRf0XsDiyVYkqdTmkOYSkMF7w/j2pCUi+ZWf
	 n7Bqwrg6Vl7SSRm33QP+IPAyMJqwZqGLeIEyXSkl/PXTaxrKnQnTU4UdEv6VvjMPWr
	 N+iHNHH6i9K9qHAjHpljGaQDXOStzWTqUqs+lA0FjVk4jObixznLx9LY+r6O84fxD7
	 W6OXF/irQpwNw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	nathan@kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH v2] drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled
Date: Thu, 12 Jun 2025 08:30:23 +0000
Message-ID: <20250612083023.562585-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i915_pmu.c may fail to build with GCOV and AutoFDO enabled.

../drivers/gpu/drm/i915/i915_pmu.c:116:3: error: call to '__compiletime_assert_487' declared with 'error' attribute: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
  116 |                 BUILD_BUG_ON(bit >
      |                 ^

Here is a way to reproduce the issue:
$ git checkout v6.15
$ mkdir build
$ ./scripts/kconfig/merge_config.sh -O build -n -m <(cat <<EOF
CONFIG_DRM=y
CONFIG_PCI=y
CONFIG_DRM_I915=y

CONFIG_PERF_EVENTS=y

CONFIG_DEBUG_FS=y
CONFIG_GCOV_KERNEL=y
CONFIG_GCOV_PROFILE_ALL=y

CONFIG_AUTOFDO_CLANG=y
EOF
)
$ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
       olddefconfig
$ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
       CLANG_AUTOFDO_PROFILE=...PATH_TO_SOME_AFDO_PROFILE... \
       drivers/gpu/drm/i915/i915_pmu.o

Although not super sure what happened, by reviewing the code, it should
depend on `__builtin_constant_p(bit)` directly instead of assuming
`__builtin_constant_p(config)` makes `bit` a builtin constant.

Also fix a nit, to reuse the `bit` local variable.

Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
(https://patchwork.freedesktop.org/patch/656115/?series=149617&rev=1)
- Collect R-b tag from Nathan.
- Rebase to v6.16-rc1.

 drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index e5a188ce3185..990bfaba3ce4 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -112,7 +112,7 @@ static u32 config_mask(const u64 config)
 {
 	unsigned int bit = config_bit(config);
 
-	if (__builtin_constant_p(config))
+	if (__builtin_constant_p(bit))
 		BUILD_BUG_ON(bit >
 			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
 							 enable)) - 1);
@@ -121,7 +121,7 @@ static u32 config_mask(const u64 config)
 			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
 							 enable)) - 1);
 
-	return BIT(config_bit(config));
+	return BIT(bit);
 }
 
 static bool is_engine_event(struct perf_event *event)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

