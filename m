Received: from out199-1.us.a.mail.aliyun.com (out199-1.us.a.mail.aliyun.com [47.90.199.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D11B8EF
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 05:18:53 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0VjIIOXp_1684811830;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VjIIOXp_1684811830)
          by smtp.aliyun-inc.com;
          Tue, 23 May 2023 11:17:13 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	sumit.semwal@linaro.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amdgpu: Modify mismatched function name
Date: Tue, 23 May 2023 11:17:09 +0800
Message-Id: <20230523031709.19673-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:426: warning: expecting prototype for sdma_v4_4_2_gfx_stop(). Prototype was for sdma_v4_4_2_inst_gfx_stop() instead.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:457: warning: expecting prototype for sdma_v4_4_2_rlc_stop(). Prototype was for sdma_v4_4_2_inst_rlc_stop() instead.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:470: warning: expecting prototype for sdma_v4_4_2_page_stop(). Prototype was for sdma_v4_4_2_inst_page_stop() instead.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:506: warning: expecting prototype for sdma_v4_4_2_ctx_switch_enable(). Prototype was for sdma_v4_4_2_inst_ctx_switch_enable() instead.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:561: warning: expecting prototype for sdma_v4_4_2_enable(). Prototype was for sdma_v4_4_2_inst_enable() instead.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:798: warning: expecting prototype for sdma_v4_4_2_rlc_resume(). Prototype was for sdma_v4_4_2_inst_rlc_resume() instead.
drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:814: warning: expecting prototype for sdma_v4_4_2_load_microcode(). Prototype was for sdma_v4_4_2_inst_load_microcode() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=5283
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index bf47eb33c12e..590b08585901 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -415,7 +415,7 @@ static void sdma_v4_4_2_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64
 
 
 /**
- * sdma_v4_4_2_gfx_stop - stop the gfx async dma engines
+ * sdma_v4_4_2_inst_gfx_stop - stop the gfx async dma engines
  *
  * @adev: amdgpu_device pointer
  *
@@ -446,7 +446,7 @@ static void sdma_v4_4_2_inst_gfx_stop(struct amdgpu_device *adev,
 }
 
 /**
- * sdma_v4_4_2_rlc_stop - stop the compute async dma engines
+ * sdma_v4_4_2_inst_rlc_stop - stop the compute async dma engines
  *
  * @adev: amdgpu_device pointer
  *
@@ -459,7 +459,7 @@ static void sdma_v4_4_2_inst_rlc_stop(struct amdgpu_device *adev,
 }
 
 /**
- * sdma_v4_4_2_page_stop - stop the page async dma engines
+ * sdma_v4_4_2_inst_page_stop - stop the page async dma engines
  *
  * @adev: amdgpu_device pointer
  *
@@ -494,7 +494,7 @@ static void sdma_v4_4_2_inst_page_stop(struct amdgpu_device *adev,
 }
 
 /**
- * sdma_v4_4_2_ctx_switch_enable - stop the async dma engines context switch
+ * sdma_v4_4_2_inst_ctx_switch_enable - stop the async dma engines context switch
  *
  * @adev: amdgpu_device pointer
  * @enable: enable/disable the DMA MEs context switch.
@@ -548,7 +548,7 @@ static void sdma_v4_4_2_inst_ctx_switch_enable(struct amdgpu_device *adev,
 }
 
 /**
- * sdma_v4_4_2_enable - stop the async dma engines
+ * sdma_v4_4_2_inst_enable - stop the async dma engines
  *
  * @adev: amdgpu_device pointer
  * @enable: enable/disable the DMA MEs.
@@ -786,7 +786,7 @@ static void sdma_v4_4_2_init_pg(struct amdgpu_device *adev)
 }
 
 /**
- * sdma_v4_4_2_rlc_resume - setup and start the async dma engines
+ * sdma_v4_4_2_inst_rlc_resume - setup and start the async dma engines
  *
  * @adev: amdgpu_device pointer
  *
@@ -802,7 +802,7 @@ static int sdma_v4_4_2_inst_rlc_resume(struct amdgpu_device *adev,
 }
 
 /**
- * sdma_v4_4_2_load_microcode - load the sDMA ME ucode
+ * sdma_v4_4_2_inst_load_microcode - load the sDMA ME ucode
  *
  * @adev: amdgpu_device pointer
  *
-- 
2.20.1.7.g153144c

