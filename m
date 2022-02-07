Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739EB2F27
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 16:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D23FC340ED;
	Mon,  7 Feb 2022 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644252797;
	bh=X39xYx51fikLum/6dHtmOj01yGauqmQNBgR0dA+t/T4=;
	h=From:To:Cc:Subject:Date:From;
	b=daQ/U5GjWfNjCv/LB9Bb4/XbLHnn7bL1gcbSSNpasT2b/VlhN0hVFOpSqKam/0dEa
	 bpyiUxlfQlTzbqNwEtgG7vDWrd8uTKgWFaeN1z9j77gL17m0Fwx1GvlcoFD63IOhZ6
	 aUAt6UccpTa0iMVMP9JhHEpJoTaCOugnlvW8u+Xcb44//9MHg7zH6jZkEevSiBr5bN
	 xJhMylojME3ZonO9bIqbR2RjxTze8Mkm7FQcxq352Y2N5gUjNNJ/fGADzZoIUk2KIm
	 pNe/efhQ4UaqmLRW6nyXUhxuqSKaDTbO0GKhwVkYXJ8XUDIdziHpTCA1yN/rYFThfc
	 pTYRUq7PJmu3g==
From: Nathan Chancellor <nathan@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/stm: Avoid using val uninitialized in ltdc_set_ycbcr_config()
Date: Mon,  7 Feb 2022 09:53:04 -0700
Message-Id: <20220207165304.1046867-1-nathan@kernel.org>
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
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5eeb32c9c9ce..447ddde1786c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
 		break;
 	default:
 		/* RGB or not a YCbCr supported format */
-		break;
+		drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
+		return;
 	}
 
 	/* Enable limited range */

base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
-- 
2.35.1

