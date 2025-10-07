Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507FB2E2F05
	for <llvm@lists.linux.dev>; Tue,  7 Oct 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849403; cv=pass; b=ROGsrCwNTxlpC+OdKirQ1ptVaY2j+hWfZcZ4hJPPFghlUhH0brRta4aXUqDHxCeWn8Cp1RssLo2nGtQ7IAhm3fagyPn8sRBqrUkDsQ8Z4NYjwAIiDRDaKyATmDvI/v9XScRkoEeGAS3A1koi7r1Flnh9L3sdwQt/J1Im3kH7c8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849403; c=relaxed/simple;
	bh=uhW78c9WYmd7qmGnyc5byd9/WeK8N8eGipEG9Me9lJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUALXSWmK455/PYsAyCgENlV48aOM/sRx7U7pWcePOVDJsGiqQED27+Aj3T3rEkaX8W8DAwfub8/qST+yXfN200zXSfdZjTbL39RSwj9PACM4zIvrw4EaX4CIvRhYIHLA3eUbbGszltdoeU9Hz8U1hvtpyxfznv3QjkLz65k/WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=lFsZQQsN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lFsZQQsN"
ARC-Seal: i=1; a=rsa-sha256; t=1759849390; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gWxtCWOO1gAm/uxKZTA5GfbcOptj1/qUsXNeBsypNU+JqNEwmDwuDClIXZ6KlV7i/lQb8ikRRP8CTosqT8awigkCkPNd5I9X1wQ0697uuVTqVVXDbK3ItKWqnzBznHmhMWAeS2R//2lFWKerunsSRUNg0a3z4a80DvgtC78SIaE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759849390; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/DuCVIo25xMaaA0q76PJtVL+EmE9+q7pgG4XQRIF+dw=; 
	b=nQhxprhcngyWNHlJme+Qn8wkG1T7U3yuAIn00YkfprreZewCA0kVXhY2Ew1tpqLgr3sksOKvWQiOKrMUPGG0kgw1SKvHVXsYXN63ZvIn3EKP1xVyH2wlAwL52+HxUbCdCPUZUaVuOEzes6jKURtvb5eT5e4RVDGR/IgiuDhZc1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759849390;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/DuCVIo25xMaaA0q76PJtVL+EmE9+q7pgG4XQRIF+dw=;
	b=lFsZQQsNiWI9LwdLEkpJgwDflvLP3E9mVy1HTWkXdXjNNG7GkRfhcZVcfp6iVa/T
	03lztnUmVgQN+O4Ino7iekqTyRlIJQETRQkaVe6gEDIBLAkdURGrYTPE30Wb9G3c9J2
	r8j7G7Xrzr/yakexV0H6GPYrNiOvdyHm42MYQMDw=
Received: by mx.zohomail.com with SMTPS id 1759849388906612.5457081656152;
	Tue, 7 Oct 2025 08:03:08 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
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
Subject: [PATCH v5 09/12] drm/panfrost: Add forward declaration and types header
Date: Tue,  7 Oct 2025 16:01:51 +0100
Message-ID: <20251007150216.254250-10-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150216.254250-1-adrian.larumbe@collabora.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is to make LLVM syntactic analysers happy.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
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

