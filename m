Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB82570
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 09:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F61C433D7;
	Fri, 25 Nov 2022 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669368340;
	bh=4rZWwSgzcPoyGbF2cU2dy6RGrUK8SvYQXJ5I/d301sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVySWLD4bfgwzmU3EDuWXrOr5+9K7omnfIJNLSB17LnaTYkzqW0IHAhgguS/yAbKI
	 keOD3799zsdbZXqEi9jshPBqql3X6oRcsBdUjjBfuOxRb3EA+mZFoMZnhfJdfxwgqF
	 ouBSnIJy3vWuQV+5doxD8yZCaPbDERk181QPGhkvLNgrzLOMLgOgbrp5kalCc8rgKg
	 hlLnCB9AKVF24plNhevg7MpSpznv+QsBfAFe4ILSV2JuK38V03NMNMIavkS1+ch1v3
	 dmiTLMWVqHqIRUq23xNrqOYVBvCVKFUOdtFA0s2j21TR4yW9A33Lt0VxGewsjtwaEV
	 3VI8QO44l3Lbg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	arnd@arndb.de,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ndesaulniers@google.com,
	trix@redhat.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: Temporarily disable broken Clang builds due to blown stack-frame
Date: Fri, 25 Nov 2022 09:25:16 +0000
Message-Id: <20221125092517.3074989-3-lee@kernel.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221125092517.3074989-1-lee@kernel.org>
References: <20221125092517.3074989-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
architectures built with Clang (all released versions), whereby the stack
frame gets blown up to well over 5k.  This would cause an immediate kernel
panic on most architectures.  We'll revert this when the following bug report
has been resolved: https://github.com/llvm/llvm-project/issues/41896.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 34f5a092c99e7..1fa7b9760adb8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -265,6 +265,7 @@ source "drivers/gpu/drm/radeon/Kconfig"
 
 config DRM_AMDGPU
 	tristate "AMD GPU"
+	depends on BROKEN || !CC_IS_CLANG || !(X86_64 || SPARC64 || ARM64)
 	depends on DRM && PCI && MMU
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
@@ -289,6 +290,12 @@ config DRM_AMDGPU
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
+	  calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
+	  architectures built with Clang (all released versions), whereby the stack
+	  frame gets blown up to well over 5k.  This would cause an immediate kernel
+	  panic on most architectures.  We'll revert this when the following bug report
+	  has been resolved: https://github.com/llvm/llvm-project/issues/41896.
+
 	  If M is selected, the module will be called amdgpu.
 
 source "drivers/gpu/drm/amd/amdgpu/Kconfig"
-- 
2.38.1.584.g0f3c55d4c2-goog

