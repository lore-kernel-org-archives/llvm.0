Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D624A3407
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045147; cv=none; b=NrzWe9CO4NsdNrYSqGO1UeyIkipGzArDZ+mgCVt7FCOj3/CRYDAPWOzJycDNyzAH02xQfb5oImdUNIsWOVDHt1cVfxBrNN9SiZoRKpnQpe7hFZ91eKum8D62PLjimYANe0Opo1jVkPKYsDxH/f2PkZe9RyXY7fHlV7AOGnz4InA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045147; c=relaxed/simple;
	bh=uWIGcoMjBsOu7MWw7lNaM/mVpWzj1TccHCHnCXEj8VI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h8FgixLdCNjzdjEjQvK5LBvirQkNV4n6uNHmaQF9+LoHJDLMi6aq33KX3iFcWbbGBct9AeOvjwvj7E8V4qilidW2BaPKvQryPyDnSgvO3YtmYgRUbDWcAk9Bs5zo1q1Q2cs84BDMV/45B1uB7LHvNevY9tE2g2vl+dwzPA7IoCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xMbC8IEA; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xMbC8IEA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2231C2BB2C;
	Tue, 14 Jul 2026 16:05:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0285660346;
	Tue, 14 Jul 2026 16:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31C9111BD3A80;
	Tue, 14 Jul 2026 18:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784045135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p2Q03M5Qo5hBXFIilmL0M/xoaJQC1jAcQbHh/u0YmIM=;
	b=xMbC8IEAgTFmtK4TcGjrhyoQeEg9EPgAFQybhNbI3UPiNUpHLvBz52JW6MJSG1TBsFOKEG
	GxNCffBYTc7032xcZ4b1FEpxhQbzVj6b6EW40/hpvfRTIb+TEthC33HhgPUooFVY8sXA4e
	k2OVNgQzk4iKHp3Y0f7y8A5WFPJrViLWCGU182c0IjOJa4coLteIUKa+5Pmtpful3aX452
	/PHAbs50/xi76Lvq1zvPbqRhcZvgMR1CfRhfx8Vqd2nQGkx9Tp7hg81ti9bsyVtkuiiy69
	XYjUzN51qnx2dE5qWaUuuYhfvzHmUJdfCgQTAmI30hQtKIhcNDUtF/XPS4Kuxw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260630-drm-bridge-alloc-getput-for_each_bridge-2-v2-1-e0a1094cd1eb@bootlin.com>
References: <20260630-drm-bridge-alloc-getput-for_each_bridge-2-v2-1-e0a1094cd1eb@bootlin.com>
Subject: Re: [PATCH v2] drm/bridge: rename
 drm_for_each_bridge_in_chain_scoped() to drm_for_each_bridge_in_chain()
Message-Id: <178404512885.172760.6481594517700778969.b4-ty@b4>
Date: Tue, 14 Jul 2026 18:05:28 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 30 Jun 2026 17:34:04 +0200, Luca Ceresoli wrote:
> drm_for_each_bridge_in_chain_scoped() was added in commit e46efc6a7d28
> ("drm/bridge: add drm_for_each_bridge_in_chain_scoped()") to provide a
> safer alternative to drm_for_each_bridge_in_chain().
> 
> Following commits converted all users to the _scoped variant.
> 
> Finally commit 2f08387a444c ("drm/bridge: remove
> drm_for_each_bridge_in_chain()") removed the old
> drm_for_each_bridge_in_chain() macro.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: rename drm_for_each_bridge_in_chain_scoped() to drm_for_each_bridge_in_chain()
      commit: 12f5090aaa3cc82ce2d8ca0d7bb2b86817587ace

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


