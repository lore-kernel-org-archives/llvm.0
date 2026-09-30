Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AAD3D3002
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795913; cv=none; b=uC7dWqFyNQ2MD/NwP5MTXY5CPRgoGXtEVSG5oa7Bvz1goxUi/Cds8dNMzFoqS9YaYQNNuYvMxEMwTSKaJPIOf8GQxZAacnj+xbd5zSXrw+7jZP8l6BlXHIIqJo4xZdpBNSLptDQl2oA6XlA18pFIJeTYwfsCRBm6qw/4789A2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795913; c=relaxed/simple;
	bh=CyGtyCPmNZniFcfDSReMKCTj4N1SwBDzJ2xIa3sj7uI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dMTe3DGsZh/AHsF5HcwKsq/FEBaBtlkCQgVcSxxtm4+jjEZ35nYqsX4ZDO8ROGNiragOT22wUQLVvTHyhSAcoyzCyzpwP9NjJwyEyiaWuWRtGG7RPJzLwnvy2cIJu5QQ2q6VpekvZY9LbuKj6ueiNg2nL+o5ISEbIO8UYlKLuuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbWJlQAD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbWJlQAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790795911; x=1822331911;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CyGtyCPmNZniFcfDSReMKCTj4N1SwBDzJ2xIa3sj7uI=;
  b=WbWJlQADYS/5KjqCp8Oh0hItphHq/mzhyyIezCv7ZYUziSD4R5hf+Cjs
   LBZIihumRXhI9qeBkgBx2SEExF7caiTTBrWtEYDhoJSFKlaLdOigmFqUD
   Sh13wAlluVKNsPIymsWOnd9jT/Gs/RsK+WQDpyfkrQjzyjlmsP85ot4eH
   QESaxmJYsMkphAZWMnzpzMruWkaQexRCB/9WXYg+GpcnHfE0KQ5/Bg8w/
   QBYqdEuDRIayl6bAN1VmminoO1hgCEIHHixDQGrw7Khe39/yEEeyQvDeP
   s/WJhW5a8X34kYs8royTMB5cdAxvtAfwGo/FQs1ZIVHC/T4RgB6IKJfjR
   w==;
X-CSE-ConnectionGUID: RbuMpcbQT5qFGa0VYF/K0g==
X-CSE-MsgGUID: kDYettinQROM0iAGRm/YxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102218493"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="102218493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 12:18:30 -0700
X-CSE-ConnectionGUID: BLsley0fRryRnafxe2muKg==
X-CSE-MsgGUID: 955Bc4nlQZCMiHe1JN9npQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275320575"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 12:18:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Benjamin Tissoires
 <bentiss@kernel.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <6c581ae0-2480-47a2-b46e-97afadbc7c1f@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
 <6c581ae0-2480-47a2-b46e-97afadbc7c1f@linaro.org>
Date: Wed, 30 Sep 2026 22:18:21 +0300
Message-ID: <5617389e496cf14a48efb9026b6d19a0fa37e568@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 30 Sep 2026, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Yes we could have a similar panel-simple but with init tables, but
> in reality those panels offers much more features we don't handle because
> the DDIC vendors and panel integrators just don't care exposing those
> features, but they get handled by vendor implementation like for Phones.

...

> I don't think we want this, downstream vendors does that and we don't want
> to go there.

I think those are fair points.

BR,
Jani.


-- 
Jani Nikula, Intel
