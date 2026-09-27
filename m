Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E43BBFBA;
	Sun, 27 Sep 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525767; cv=none; b=e/xYgE3GP5wdv35SwXBPG9p/PMO1mQmN9oq/rXT8fSO/vYUgXi2g0KJrOWXkAI/LyyLi2lRhbCv9J1PmRFKWuN0DMDU0ZdzEJWxhvL7x8r9bJ3bJPbKJPa5WZ+F+0mEWcaizbgyvkdeOe8DzxPq/Kmbk1klb+VOQXfzMaqzErSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525767; c=relaxed/simple;
	bh=9ASjQxg4NczP2C91oIxms44WsTCstJd1/KF1Cts008A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6v7gB/ji6vxOMcAxVUXmLvoRoYwfWfcTcodwEVqsEoE0VqTp7GdxRjc4aPAFjY8K8VF0haCA2fjAIxtfTompu9k5I4ECSpQ3AmH3JZupbRePQlyCXAGbRLaxmeaC2arfrbe/udAZCS/k81t/X6jdbBv/FhgccV7R/c8FmEnDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzZ3rIWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzZ3rIWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDD61F000FF;
	Sun, 27 Sep 2026 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790525765;
	bh=3adEtc4xOPxd1JaicuETuvUs/uY97IjCeup573MIdrk=;
	h=From:To:Cc:Subject:Date;
	b=jzZ3rIWim1fWVek/Bac0fgqQKNgqm4W7UFXEwgACbvi/rWb6cpT+OtVskY293oPml
	 Caf/KwHr0kjhJNu5zWd8tmJR4Dp4hUFLZsj860KMY7wqYluRYwpNSDM9yFWCXkwajn
	 kd0fuyYE2P97bM5JZb9toUvoE0nSp2dnpmol/QFXdtndEbTxWcqk3oBELuQBAU30LD
	 8L5PouM2no4oSIi15G2jtmdsO3irGvXah52gJYrsB791tXitNvjus2fJJuVy66tEZs
	 9wqeQEJwp4gEWUsOqmJxz4GsL87mszcKFU1Y92zMz+DEXIsVXW5sDC7Ghvpzveg2A5
	 gRuq+hOW4209Q==
From: Sasha Levin <sashal@kernel.org>
To: Austin Zheng <austin.zheng@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Alex Hung <alex.hung@amd.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/amd/display: Fix sanitizer check for the DML frame size limit
Date: Sun, 27 Sep 2026 12:16:01 -0400
Message-ID: <20260927161601.1183525-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building x86_64 allmodconfig with clang fails:

  .../dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10491:13:
  error: stack frame size (3128) exceeds limit (3072) in
  'dml_core_mode_programming' [-Werror,-Wframe-larger-than]

That config enables both KASAN and UBSAN, and should get the 4096
byte limit meant for clang COMPILE_TEST sanitizer builds. The check
in the dml and dml2_0 Makefiles concatenates the three symbols with
no separator:

  ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)

KASAN and KCSAN cannot be enabled together, so before UBSAN was
added the string was at most "y". UBSAN can be enabled alongside
either of them, and with both set the string becomes "yy",
$(filter y,yy) is empty, and the build falls through to the
non-sanitizer limit of 3072. Adding UBSAN to the check therefore
lowered the limit for the most heavily instrumented builds instead
of raising it.

Separate the symbols with spaces so that $(filter) sees individual
words, and test for a non-empty result. Only the configs with two
sanitizers enabled change behaviour.

Found by KernelCI builds of the linus-next tree.

Fixes: ebf8b0fd8508 ("drm/amd/display: Relax DML frame limit with UBSAN")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile    | 2 +-
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 91465ac05c971..eb4ce5b1ecfbb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -29,7 +29,7 @@ dml_ccflags := $(CC_FLAGS_FPU)
 dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
+    ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
         ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
             frame_warn_limit := 4096
         else
diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
index e8bd061be05c1..2181079c89d0e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
@@ -28,7 +28,7 @@ dml2_ccflags := $(CC_FLAGS_FPU)
 dml2_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
+    ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
         ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
             frame_warn_limit := 4096
         else
-- 
2.53.0

