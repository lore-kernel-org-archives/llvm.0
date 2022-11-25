Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2E3238
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 12:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F04C433C1;
	Fri, 25 Nov 2022 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669378087;
	bh=gevkG6TfDd9z8LOLiUxeJy2lRLn2rHcp1JIJZyU3WcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKro9j5bc3m00YbU0C47HLUKAGS90KVKcmKx+1ecGTLz37DxwZyrNZ7fwQfp5Fj8a
	 CiapE/0vqwCbVzyT6HhmpVX/XBKeejO6lK9QXxlStLS1dng1RuhTy8Gv9LR40rZ0jI
	 roICL0dzAEKCllb1GT6QZQ+AtTu+w3R+7rdxjgCAE1deHnnnSu+Z/h7tZB73K+FSld
	 XRk6ZlECfR0pF1ev+J1frrZh1lxzN9kmR+Fjv8dEZfZq6nOsnGmetTUu7q/Fi/QHMM
	 YzPWHY3w9e6RdCRmPk8euVAu7uXqWYeOEwwkhpP0qaJK3hxNzjlkv3EduQ+nlzeo2z
	 eWiR5vohumuvw==
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
Subject: [PATCH v2 2/2] Kconfig.debug: Provide a little extra FRAME_WARN leeway when KASAN is enabled
Date: Fri, 25 Nov 2022 12:07:50 +0000
Message-Id: <20221125120750.3537134-3-lee@kernel.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221125120750.3537134-1-lee@kernel.org>
References: <20221125120750.3537134-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enabled, KASAN enlarges function's stack-frames.  Pushing quite a
few over the current threshold.  This can mainly be seen on 32-bit
architectures where the present limit (when !GCC) is a lowly
1024-Bytes.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 lib/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c3c0b077ade33..82d475168db95 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -399,6 +399,7 @@ config FRAME_WARN
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
 	default 2048 if PARISC
 	default 1536 if (!64BIT && XTENSA)
+	default 1280 if KASAN && !64BIT
 	default 1024 if !64BIT
 	default 2048 if 64BIT
 	help
-- 
2.38.1.584.g0f3c55d4c2-goog

