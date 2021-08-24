Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8823FC1
	for <llvm@lists.linux.dev>; Tue, 24 Aug 2021 23:23:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36A46610F8;
	Tue, 24 Aug 2021 23:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629847387;
	bh=4ZASDukXEFD6gzQ3txH7gkEOWmXTrxFmwK+P5dWdDlQ=;
	h=From:To:Cc:Subject:Date:From;
	b=XeCbBM0ZbkYIgSeNifwC91fAm1WEGYJ4JuxoYgQNpeKuCb0Ywt2jQyVCfiqNSOueh
	 PPdJiAzTR+c1jJ4HFcOC+MJRftf2zrRXXBlxWvg8dA4wmqwd61xMesXxsEJX+F1TYP
	 6Lx6yT8AorZRbQFNNprX7Jhh1VX4YBaY5HO1/wbxzdCJ5hjGvL2VsEruzzHsgRLJ+s
	 w1BH2Sm81RjXH/WrbEl6Ov/4Sd110xIuXb69BxzYYoXDxdGe/yrY83+A74mNIoT4Le
	 rL5tDOhGF2CluFIaYjVoCy9iNfa/vTbP7cocrExi24clP7R+jaaH1n7G/wcee7q1IR
	 DrlnnY64ASetQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/i915: Clean up disabled warnings
Date: Tue, 24 Aug 2021 16:22:38 -0700
Message-Id: <20210824232237.2085342-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

i915 enables a wider set of warnings with '-Wall -Wextra' then disables
several with cc-disable-warning. If an unknown flag gets added to
KBUILD_CFLAGS when building with clang, all subsequent calls to
cc-{disable-warning,option} will fail, meaning that all of these
warnings do not get disabled [1].

A separate series will address the root cause of the issue by not adding
these flags when building with clang [2]; however, the symptom of these
extra warnings appearing can be addressed separately by just removing
the calls to cc-disable-warning, which makes the build ever so slightly
faster because the compiler does not need to be called as much before
building.

The following warnings are supported by GCC 4.9 and clang 10.0.1, which
are the minimum supported versions of these compilers so the call to
cc-disable-warning is not necessary. Masahiro cleaned this up for the
reset of the kernel in commit 4c8dd95a723d ("kbuild: add some extra
warning flags unconditionally").

* -Wmissing-field-initializers
* -Wsign-compare
* -Wtype-limits
* -Wunused-parameter

-Wunused-but-set-variable was implemented in clang 13.0.0 and
-Wframe-address was implemented in clang 12.0.0 so the
cc-disable-warning calls are kept for these two warnings.

Lastly, -Winitializer-overrides is clang's version of -Woverride-init,
which is disabled for the specific files that are problematic. clang
added a compatibility alias in clang 8.0.0 so -Winitializer-overrides
can be removed.

[1]: https://lore.kernel.org/r/202108210311.CBtcgoUL-lkp@intel.com/
[2]: https://lore.kernel.org/r/20210824022640.2170859-1-nathan@kernel.org/

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

NOTE: This is based on my series to enable -Wsometimes-initialized here:

https://lore.kernel.org/r/20210824225427.2065517-1-nathan@kernel.org/

I sent it separately as this can go into whatever release but I would
like for that series to go into 5.15.

 drivers/gpu/drm/i915/Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 335ba9f43d8f..6b38547543b1 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -13,13 +13,11 @@
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
 subdir-ccflags-y := -Wall -Wextra
-subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
-subdir-ccflags-y += $(call cc-disable-warning, type-limits)
-subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
+subdir-ccflags-y += -Wno-unused-parameter
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-sign-compare
 subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
-# clang warnings
-subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
-subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 

base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
prerequisite-patch-id: 31c28450ed7e8785dce967a16db6d52eff3d7d6d
prerequisite-patch-id: 372dfa0e07249f207acc1942ab0e39b13ff229b2
prerequisite-patch-id: 1a585fa6cda50c32ad1e3ac8235d3cff1b599978
-- 
2.33.0

