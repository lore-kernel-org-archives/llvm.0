Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43B1D9A57
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 23:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949127; cv=pass; b=K4r91A68IyQgO11PX+PLJWykRnpNu6Bjs+Pu3AUR0JEQR6mwWdOO7fUFLlwv0+5JpBd1FUdfKULry82X/CO0c3fDo/wfxyUIK57AQsz3G+vYNbC00hU6REXDthYuikPcvomntmgE0USZUC7ynTDtNta7c9G6fyeGeIGE0qa4yCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949127; c=relaxed/simple;
	bh=siBBuvR3ZHWRrR2Loxb5JSYH4735HK7/mjVTgW/Kh6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VhBoR1Ru91SfF4xFAGeAuNMUrv+KGMynBvHrFZXqE+RG69ueyCflfLrvX4yzb4eu6ACVJvI+t1Zpwc4EX8a3zQ5cj+Kp0Q4rBkWGtxLix/KhDEoH7KM5VUxBsxWRqf0Mcge8+IdVODqu1OF5FErTVrSAUKRvo82ANlYThvn8prY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=iHUrBMYt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="iHUrBMYt"
ARC-Seal: i=1; a=rsa-sha256; t=1728949118; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wzkx/UJGOZrXqVxlmZTVxDuFtXyIF3nds/uJrYxLSS33l0ItvrCGuYj7+1nLRAj6UTKJCyvT1dSElCgMgpE2BAqZqCnd8+GSRNiiuMCMzQ1M0QCqRX4DKId9esyo4MqPL+sxtYLSaE04QyKYItFgO+eYIkfR/mzFriCooU03a8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728949118; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qn2Rk8Ugffxfl5LMvo+WmO3g460JFKXzoiCtcH0gUi8=; 
	b=YZ4aCBuZ9ulpliM3Kamj/i7vE/XFVZGn76WTNOamMBzw6Yf1BYCjfzhh6SWSUoByEUf51GgjltIyHJx3+avODg5JjojuydzxnTP1tTpioWNAyQjrdKUbz8Sl5wntiFJREDZHQqaFVJZGIjC2BKnVKzIxdUXSu4lj+1D3rtOW2Jc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949118;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qn2Rk8Ugffxfl5LMvo+WmO3g460JFKXzoiCtcH0gUi8=;
	b=iHUrBMYthLTLgQXbAY+yK1K5dUVx/qjE5E4UDhApA9/tLdnX+A9bVXETeOm3RTWb
	BMAMWJ/V7NcP4EppFmLg/DKoJ+6BgUcNmTkZkV1eKZGR/RvzjiQRbh6i4XNedxei0C7
	bs7FCwJQ8Xk4T4OmlvXY1QCP/XmXcdiTngUya34A=
Received: by mx.zohomail.com with SMTPS id 1728949117928981.8020714538841;
	Mon, 14 Oct 2024 16:38:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 8/9] drm/panfrost: Add forward declaration and types header
Date: Tue, 15 Oct 2024 00:31:43 +0100
Message-ID: <20241014233758.994861-8-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is to make LLVM syntactic analysers happy.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index 0b2c0b59db3f..a19282a22aab 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -4,6 +4,9 @@
 #ifndef __PANFROST_MMU_H__
 #define __PANFROST_MMU_H__
 
+#include <linux/types.h>
+
+struct panfrost_device;
 struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
-- 
2.46.2

