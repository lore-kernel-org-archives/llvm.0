Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246A634
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 15:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FE0C340E8;
	Tue, 22 Feb 2022 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645543335;
	bh=dJFaztZbOTKlwjszD+cQgkDqaaoQUaeR4abG0LlrMB4=;
	h=From:To:Cc:Subject:Date:From;
	b=DXHzm1Ojr/JdzsxpKmL+iNBWnbLZMRdxOs3Z6Lw0U0yZwOti1yflN+C6vng2Eba++
	 i+vpqCBIIMuKux+/wtJht32wzJ7HVm3kE5VkuRBFdiSbB8S4Hlk7Lcgz5uZsekJXE1
	 qV1Ljp+h6xRJF7YXQN/+qDTtQRuPAyRvTXZSJwAOnOfKMwOBcEePpACcjr6Vrb7HwY
	 0UIwnMCgtZ54v+f+KYU6kpPC1h4J1ojPkGhkjPPWAPwBuastYyBzoktQThSsGVt4Z6
	 73dHlUoFqFrUoSU0oK12YMxzPSHt9lFm48gh1/2cesQFXcKyu40FPSTA0i57xvcuN4
	 Mf9izYSZYCRLg==
From: Nathan Chancellor <nathan@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v2] drm/stm: Avoid using val uninitialized in ltdc_set_ycbcr_config()
Date: Tue, 22 Feb 2022 08:20:46 -0700
Message-Id: <20220222152045.484610-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

  drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
          val |= LxPCR_YCEN;
          ^~~
  drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
          u32 val;
                 ^
                  = 0
  1 warning generated.

Use a return instead of break in the default case to fix the warning.
Add an error message so that this return is not silent, which could hide
issues in the future.

Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
Link: https://github.com/ClangBuiltLinux/linux/issues/1575
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2: https://lore.kernel.org/r/20220207165304.1046867-1-nathan@kernel.org/

* Use DRM_ERROR() instead of drm_err() (Philippe).

* Collect tags from v1, as nothing substantial has changed.

 drivers/gpu/drm/stm/ltdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5eeb32c9c9ce..c9bc4ccb6d43 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
 		break;
 	default:
 		/* RGB or not a YCbCr supported format */
-		break;
+		DRM_ERROR("Unsupported pixel format: %u\n", drm_pix_fmt);
+		return;
 	}
 
 	/* Enable limited range */

base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
-- 
2.35.1

