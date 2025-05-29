Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548924E4B4
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 04:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492979; cv=none; b=CBur1TSS2O6EaudFVIRfIPujqNrBoMy9WSxDbD2EQFoplnqv1W16BMGwa+XYiC1B3SwLibVi+2tMEefhxnFY+/1/e4sr+N4OEAFIfJ2Yd8lwo6BuuE+aSP7Z7U6JeVCs0du77U8EBKtWM0Je18MWtgjbB08J0W5u9LNFUbcIDRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492979; c=relaxed/simple;
	bh=29sobqm92M3rZ1bOUUb4/59RjSD9m1I3jqACEyznSqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=po3dlW0m3K7nMpcR3kTH6FL87H6kHV6OLisLXEj2KOBs01A2Uqgd6obf7usynEXnT2vbwqNVACm26DNcm9jMvFzs8F1ZfWgbcs+/xwdNXEtutTUzil2Fwa1lgnTTHBLoV1kT2Y23TXS/EsgWtr4xs5yXVmMSYCwPY4T7jW8bpUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUzEGgKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUzEGgKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D711C4CEEA;
	Thu, 29 May 2025 04:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748492978;
	bh=29sobqm92M3rZ1bOUUb4/59RjSD9m1I3jqACEyznSqk=;
	h=From:To:Cc:Subject:Date:From;
	b=DUzEGgKFHbjnTF8KEb9Noc3PCTbgXyf+zn7LZi5YZP3UlSEdmqIOA/AVcqvFBzY1y
	 n0Snn21ucdG6sEAuox0wOhDZ45LUSkgBUUq6nUkfHy9qQ/tJyJmWglyVqjKOjvVNJ/
	 pc/fEljlBVzcxVnF3Baz3Npv2sLEl3wWRrgJYWkXIPmLoAnA6HPorVMJNxmpzJIQt5
	 PyL78ZTQ+wr9kvQOcV08iGZyBrkIieN0XJVAzlpTjaSX/XcIArUJejiwvtq9Dey99d
	 QyebF7sdr0sb14mSlH+pz/fZ/XfsJP+jeqevPswnsQr6NVke3vvGYKObGJUavzKoq1
	 Oj9CJtTlcl9kQ==
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
Subject: [PATCH] drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled
Date: Thu, 29 May 2025 04:29:10 +0000
Message-ID: <20250529042910.2436330-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
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
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
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
2.49.0.1266.g31b7d2e469-goog

