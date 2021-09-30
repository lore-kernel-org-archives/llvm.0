Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E233168
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 16:02:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC71A61267;
	Thu, 30 Sep 2021 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633017722;
	bh=0+sb2XqH5BquPP7EjtdnYr/NxYIMmonry0L2K3JYAFo=;
	h=From:To:Cc:Subject:Date:From;
	b=tnqVKO6f7eLz2tpcuRDdCbw3uKJ9pnWBRYsHY3fEabEYitSik4nVI1i5qhZ2pTrT2
	 knPSWujATtrB4RkrITDzAhDWSwvT6b4yORb+jJERgymY5ew+ej61QUcWzSAmI0fxsc
	 DZpUgmX0LDW15rxFHYvo0NMd2PoWWKmwFARS4prSYnowHmSaH14Y1v6iddHhGRmvWt
	 /cwqiAJ4WpR07zC0H4Y7krVUE6bvb9O1Vw36+mguqO5DGxY88G7KWjQj10lQ9KT6V2
	 12S4/oGlFGpQx4aE9MQHj2BFxij3G+wSanDMk6ummf01Ft/KZA6/dT8Sa2Dw6G/Hfo
	 gzrRn/wUwDKcA==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/amd: Guard IS_OLD_GCC assignment with CONFIG_CC_IS_GCC
Date: Thu, 30 Sep 2021 09:01:42 -0700
Message-Id: <20210930160142.2301257-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.591.gddb1055343
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

cc-ifversion only works for GCC, as clang pretends to be GCC 4.2.1 for
glibc compatibility, which means IS_OLD_GCC will get set and unsupported
flags will be passed to clang when building certain code within the DCN
files:

clang-14: error: unknown argument: '-mpreferred-stack-boundary=4'
make[5]: *** [scripts/Makefile.build:277: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.o] Error 1

Guard the call to cc-ifversion with CONFIG_CC_IS_GCC so that everything
continues to work properly. See commit 00db297106e8 ("drm/amdgpu: fix stack
alignment ABI mismatch for GCC 7.1+") for more context.

Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
Link: https://github.com/ClangBuiltLinux/linux/issues/1468
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
index d98d69705117..96cbd4ccd344 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
@@ -14,9 +14,11 @@ ifdef CONFIG_PPC64
 CFLAGS_$(AMDDALPATH)/dc/dcn201/dcn201_resource.o := -mhard-float -maltivec
 endif
 
+ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+endif
 
 ifdef CONFIG_X86
 ifdef IS_OLD_GCC

base-commit: b47b99e30cca8906753c83205e8c6179045dd725
-- 
2.33.0.591.gddb1055343

