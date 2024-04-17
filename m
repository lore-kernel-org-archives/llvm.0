Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 99ADB7EF1B
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343199; cv=none; b=HbxxjJfxn4Q9TpBxSigMJry02kzx8B7I7gWd7unb6/NejwSI7N8WFtZqEwtzQ6L0HJabxaPhX8ZHXY/dCVDz1QXuJ1y6RT8Lm5z1sFtJoQlIqO7L6m8yLGLrT8pLeYrA6UsZ0SiSJbR/n8mLTfKBzIP7NG8RMl1MQ+GLZpFJSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343199; c=relaxed/simple;
	bh=bkdtrhw2AnU57Efat4BsX7bkcfARUcoIOhyRCKyW95E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ongpTptH4ZkVrpyhmiNXAxnTU8OqqpJRpMJICtzAgwIGDVthySZA597l21BMpd392PmAlTaij+q8WMpFJCGna6aO6dI4RMEgWEqsijO3AvdPxfSOvvnlwS9mofksItQbUVrfCkkpoD2bynTgrn5kX5RnFkulzScimDqJxID+KvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id BBB506061BF4E;
	Wed, 17 Apr 2024 16:39:47 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	bskeggs@redhat.com,
	airlied@redhat.com,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp: fix an error problem in nvkm_uconn_new()
Date: Wed, 17 Apr 2024 16:39:21 +0800
Message-Id: <20240417083920.2256027-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang Static Checker(scan-build) Warning:
drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c:line 215, column 4
Value stored to 'ret' is never read.

Return the error code rather than zero when 'conn->info.type' has an
unknown type.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..6a67d307bf79 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -213,13 +213,14 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 		default:
 			WARN_ON(1);
 			ret = -EINVAL;
-			break;
+			goto err;
 		}
 
 		nvkm_object_ctor(&nvkm_uconn, oclass, &conn->object);
 		*pobject = &conn->object;
 		ret = 0;
 	}
+err:
 	spin_unlock(&disp->client.lock);
 	return ret;
 }
-- 
2.30.2

