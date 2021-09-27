Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9E3FCB
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 12:58:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4CFD6103B;
	Mon, 27 Sep 2021 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632747509;
	bh=oswmBYCS56c1A9KQBHfr/N2KsORPP0gcw6VGA+01gjQ=;
	h=From:To:Cc:Subject:Date:From;
	b=byJp6TBwZwi6G+sFiUjraRb/MEzZ6qeImq1Pw8i+kMuetEZdbdVRf4zT+WPKGTAev
	 xQSfv/18IKtOPf21332cPN1y5QIAFPH2uGg/bdS52dKb5nNZZJ24TEP8GwWrrsDv8T
	 fRIQAs50KBcbZFzN2xwHXL9r0kWfrqfEtUKnIul2IxCp4Or4+85bnHuQnRi1e7JpT1
	 5moXs5IRGHSTBhrKeCM2+HaiX7ErVu+vpcDzZoQwYYmZsKy0O/GswCHyhEli0G06xc
	 3/EFhScMt7T6lbk70i0jB8Kqz1k7JPZV3nS3aeAgRrocM1/SYwJZArMT7U/8HHQ6B7
	 gikAgjt9VqNcA==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Chunming Zhou <david1.zhou@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/amdgpu: fix warning for overflow check
Date: Mon, 27 Sep 2021 14:58:10 +0200
Message-Id: <20210927125824.1583474-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The overflow check in amdgpu_bo_list_create() causes a warning with
clang-14 on 64-bit architectures, since the limit can never be
exceeded.

drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:74:18: error: result of comparison of constant 256204778801521549 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
            ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The check remains useful for 32-bit architectures, so just avoid the
warning by using size_t as the type for the count.

Fixes: 920990cb080a ("drm/amdgpu: allocate the bo_list array after the list")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 15c45b2a3983..714178f1b6c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -61,7 +61,7 @@ static void amdgpu_bo_list_free(struct kref *ref)
 
 int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 			  struct drm_amdgpu_bo_list_entry *info,
-			  unsigned num_entries, struct amdgpu_bo_list **result)
+			  size_t num_entries, struct amdgpu_bo_list **result)
 {
 	unsigned last_entry = 0, first_userptr = num_entries;
 	struct amdgpu_bo_list_entry *array;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index c905a4cfc173..044b41f0bfd9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -61,7 +61,7 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 int amdgpu_bo_list_create(struct amdgpu_device *adev,
 				 struct drm_file *filp,
 				 struct drm_amdgpu_bo_list_entry *info,
-				 unsigned num_entries,
+				 size_t num_entries,
 				 struct amdgpu_bo_list **list);
 
 static inline struct amdgpu_bo_list_entry *
-- 
2.29.2

