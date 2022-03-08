Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E77491
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 21:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC43C340F9;
	Tue,  8 Mar 2022 21:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646776617;
	bh=MSDAfiFmxb619SbNV0Do6ViYQlOLDRcmxvg0q5mQXVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGcDWHDdpzSijirtmAR+bbuZP2FzIWh8GyKHYDevUEiMiwo5oAaKV8kVMjuWYTcZl
	 QeSIFMI4XCpErcpUaSG8ulhzpgVPJq1gCUwI2SftIEoafLPwXA74zMnYRIuI9kTY/X
	 KgnJDTclYL4o7ODLvWSOpj6I+iUf88LiLWNYyLbA7TH1AV8VLlm6n/u5EdB49MrJ/0
	 fZ6Baio/T7JaQ+1y35Ic458d1rPh0QxXs87jgA7/VFNJDxsC5tvBs5XaBZ8JRQFPRT
	 yr9CvKVbA37y+Jz7GPiMGTrG6R8VI5WacCYe6SzjSOqr6DEaT6eV/xkTes5b6yWItb
	 +wXyUC9EAOI6Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: alexs@kernel.org,
	arnd@arndb.de,
	arnd@kernel.org,
	dsterba@suse.com,
	elver@google.com,
	jani.nikula@intel.com,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mark.rutland@arm.com,
	ndesaulniers@google.com,
	ojeda@kernel.org,
	torvalds@linux-foundation.org
Subject: [PATCH 1/4] [v4] Kbuild: add -Wno-shift-negative-value where -Wextra is used
Date: Tue,  8 Mar 2022 22:56:12 +0100
Message-Id: <20220308215615.14183-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220308215615.14183-1-arnd@kernel.org>
References: <20220308215615.14183-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

As a preparation for moving to -std=gnu11, turn off the
-Wshift-negative-value option. This warning is enabled by gcc when
building with -Wextra for c99 or higher, but not for c89. Since
the kernel already relies on well-defined overflow behavior,
the warning is not helpful and can simply be disabled in
all locations that use -Wextra.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
[v4]
  split into a separate patch
---
 drivers/gpu/drm/i915/Makefile          | 1 +
 drivers/staging/greybus/tools/Makefile | 3 ++-
 fs/btrfs/Makefile                      | 1 +
 scripts/Makefile.extrawarn             | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1b62b9f65196..1618a6e0af4e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -17,6 +17,7 @@ subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
 subdir-ccflags-y += -Wno-missing-field-initializers
 subdir-ccflags-y += -Wno-sign-compare
+subdir-ccflags-y += -Wno-shift-negative-value
 subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
diff --git a/drivers/staging/greybus/tools/Makefile b/drivers/staging/greybus/tools/Makefile
index ad0ae8053b79..a3bbd73171f2 100644
--- a/drivers/staging/greybus/tools/Makefile
+++ b/drivers/staging/greybus/tools/Makefile
@@ -12,7 +12,8 @@ CFLAGS	+= -std=gnu99 -Wall -Wextra -g \
 	    -Wredundant-decls \
 	    -Wcast-align \
 	    -Wsign-compare \
-	    -Wno-missing-field-initializers
+	    -Wno-missing-field-initializers \
+	    -Wno-shift-negative-value
 
 CC	:= $(CROSS_COMPILE)gcc
 
diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
index 4188ba3fd8c3..99f9995670ea 100644
--- a/fs/btrfs/Makefile
+++ b/fs/btrfs/Makefile
@@ -17,6 +17,7 @@ subdir-ccflags-y += $(condflags)
 subdir-ccflags-y += -Wno-missing-field-initializers
 subdir-ccflags-y += -Wno-sign-compare
 subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-shift-negative-value
 
 obj-$(CONFIG_BTRFS_FS) := btrfs.o
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 8be892887d71..650d0b8ceec3 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -36,6 +36,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-type-limits
+KBUILD_CFLAGS += -Wno-shift-negative-value
 
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
 
-- 
2.29.2

