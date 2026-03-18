Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE7392C3C;
	Wed, 18 Mar 2026 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831057; cv=none; b=Hpw+sDh6Lhhl295JHVAxZE2YVG1LugMlOrUtVWfSZcRO21hdj4QttZCYRUZDBORHMh7Qbj0H9VCe7d8MtoKZtaZWFg6yVAHNdBD04L9+45Tfs/xOyot6gN9UQaOlyhOXfAUrxB+OF6wKUCasbRhDS/uG8UULvhYejbFegO4p3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831057; c=relaxed/simple;
	bh=ji6bfDBIUH/YaEq7aQ7rTvdhAXlQ+34ZHlqkieiAzHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D7NVR3bafkyb5XgE+CtBbC621y8z8CovKdgHLZufQWCg8W/aYDPsZ3ZIOav2mSm0yIWhWO3B8g3gU3ZKuMBz6Pf+4/RJsUFzcdHTED2h7THvPbI54jUzJZIoa8/yC7FKsKmfkbVp/TSCsEYuNHr0PNnDuaOvPAzGZMiFC+w8SzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDtL6o40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDtL6o40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B5EC19421;
	Wed, 18 Mar 2026 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831057;
	bh=ji6bfDBIUH/YaEq7aQ7rTvdhAXlQ+34ZHlqkieiAzHw=;
	h=From:To:Cc:Subject:Date:From;
	b=gDtL6o40WNgqJ8sB3xh2TEVoYX5I+QA4iLucLxPDMZwXPdLaN6iygF+WXKuXwqZGX
	 VZXFNcz3ZXa1Rkef+1ne4G31X+S0et6mMB1h5LapxwUPeduGjAPB1+UGsH7hUJwurY
	 LuW4nbr/A7bCyE3Ki/L7fz6GePyFeJdH/YzAp2VXq1q/Ghf3VbM80l26lLd+X1tir3
	 PNM3HisEab56bymQCzb35Q4V3oTRnJhkAjQ7C3986Qt+QO1s4vTCPFQ2Mr82sgpK5T
	 1OBONQrnTuMo4JwZPc9agXnTD0b/mr5ODXFd9SqWbR/eM1/GunIZvYZcU8cal5ydAc
	 a1g3Dlu5Joryw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Tao Zhou <tao.zhou1@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gangliang Xie <ganglxie@amd.com>,
	Kees Cook <kees@kernel.org>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/amd/ras: work around write overflow attribute warning
Date: Wed, 18 Mar 2026 11:50:36 +0100
Message-Id: <20260318105050.1947902-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-22 warns about possibly copying beyind the end of an array:

In file included from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:24:
In file included from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:27:
In file included from drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sys.h:29:
In file included from include/linux/string.h:386:
include/linux/fortify-string.h:569:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
  569 |                         __write_overflow_field(p_size_field, size);
      |                         ^

As far as I can tell, this is a false-postive warning, but there is
an easy workaround, by using a direct struct assignment in place of
the memcpy.

Fixes: 7a3f9c0992c4 ("drm/amd/ras: Add umc common ras functions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
index 23118f41eb96..fb426386b384 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
@@ -290,7 +290,7 @@ static int ras_umc_get_new_records(struct ras_core_context *ras_core,
 		if (!entries[i])
 			continue;
 
-		memcpy(&records[i], entries[i], sizeof(struct eeprom_umc_record));
+		records[i] = *entries[i];
 		count++;
 		radix_tree_tag_clear(&ras_umc->root,
 				entries[i]->cur_nps_retired_row_pfn, UMC_ECC_NEW_DETECTED_TAG);
-- 
2.39.5

