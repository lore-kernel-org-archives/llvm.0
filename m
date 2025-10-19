Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1782EC0B5
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760885608; cv=pass; b=O9y2Pme+PDl496sqEKsUCKySkF9Syps8p09lZ2/8mlPt/aMoV7wJg4rLfOxKpO7yPdrjoFp3gkPqwVRGjEsItgSmAkTdyELxAoVFc1pGGxhdEzb3KlYegv8JJg2LBFMWEw2aJE6LQKu7F3MDgLjQNFI5tJxo4cAdKO4Cr+n9fLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760885608; c=relaxed/simple;
	bh=DpevFMeJDzjsulkccLMz850NvtRiBQZhK/YdeXqOmzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIu03k/F4AH0F3RQC3adfPgZEAlP1QYYN/9X4aCzJ+EzotKQ4P5DetoTnFiHgMZxoqLf80e+3WEYB8YrrqJ57eNuspd1EqNi5m3/lqsVSW1Be9WMFG6oysuVs755eNSdg0cHP3JYmhXQuRy7MjJ9RC4f/8fVoB4lJKfHcbVgpKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=iqJ/0P0G; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="iqJ/0P0G"
ARC-Seal: i=1; a=rsa-sha256; t=1760885594; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NClnHMOf2Z0i5wBZOA5su3g3FGY2ujSrUNWJNfLsMDM9YXbOAjhTJX1SqUwUJVE8qOsHWfyV4wkEXY/TDVdY/m8YnmSEwBjQj6qJS2n00Q6XRGh8A3psFO63fcznm1J7hbavXpeM+ssQ6ASDDFb4jNQem8/hZ4KvZpjszwrwo7s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760885594; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jcGhi4cFQeguLmYhlD5ydo3KQYoOuKjZFsRfbK7t5UU=; 
	b=JTyVHR0uO0Xj/PyWeI5vzVKBmCGaXMwoALZkHGYVhlraI+qN83ML3BxrLA2wocg9+sdd6wcbNTVraVGwqsyp1n/br6upW9zKmfdgY7mnUP2evTp9EubSD+CXmuTX5ZXxw7SBIAs6EIMAgTJeOFQ+Il7Zxh7iNsI84xGh66VMHq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760885594;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jcGhi4cFQeguLmYhlD5ydo3KQYoOuKjZFsRfbK7t5UU=;
	b=iqJ/0P0GC8hDIpKVPeAX8Ekd9pXm4CjnTnyN69/35wKbiVZiwoBuGlQrSmHkki3m
	qa9bkQmJQe30Kb+zfL6BXsm63RAxyRwqOxKWD9o7pNRY0hKYV4uBZyApQcUi5Exbm8l
	NOe4ho59ryaAB/Tbltam0LCbnJxQQPnjy3CBT+v8=
Received: by mx.zohomail.com with SMTPS id 1760885593456572.9210544100706;
	Sun, 19 Oct 2025 07:53:13 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v7 09/12] drm/panfrost: Add forward declaration and types header
Date: Sun, 19 Oct 2025 15:52:14 +0100
Message-ID: <20251019145225.3621989-10-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
References: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is to make LLVM syntactic analysers happy.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index e6e6966a0cca..27c3c65ed074 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -4,6 +4,7 @@
 #ifndef __PANFROST_MMU_H__
 #define __PANFROST_MMU_H__
 
+struct panfrost_device;
 struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
-- 
2.51.0

