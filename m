Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433D3D9DCD
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677027; cv=none; b=tcV9XCIQPVX26HpTL/Ro87vgSU7jV5GvIIX+gc1V+caBGhom8Jj3iqWkDO47bM5lax/229/5sGLVWvn0KvRT0nwi2/HuX2aaxkGhwuwpyf6BF3TfZVT6ZsVBOpMf6sj34/ny2Star64toytns7Y9bevu+zAwDn7ISRyZppFMgaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677027; c=relaxed/simple;
	bh=e//TCcit/ISzMYO0YeFaG6Hi1WgM+P6dvupJ+mrGO14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fxlBQ9cxPT9bzAQF5DMv+yjXsRXawieHMFtiDA0ZUB2iXsy2tjzKWgeT39lFJ/xXx7PUSRGlHSV03Fn2GbzO/wzruxZHZi0IrCyhxt8LMY8iaX+sjHMyuGSyJNNDcyekGjOUFWANzTBfXiLZ2OQSDTRVvOlGEIycR2CRAGBgmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjDRPl9X; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjDRPl9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790677017; x=1822213017;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=e//TCcit/ISzMYO0YeFaG6Hi1WgM+P6dvupJ+mrGO14=;
  b=AjDRPl9XBa9mA7gFH25PhKH8XRg29+yFQ/RSaqSDS+e1S2xZZilRmN27
   p+wx/S8yl6skzrgtPmnxa0Yg070HIbB6JRYqukpA2uUvE3xRLdZ2kA7nY
   KC0rz5c/DcvjTdBYxxBcUVGnMUbbVy6Qap+Tlpna3TV9X+VeV6stojG99
   3BAsNZ9DkybfyWxtSUjGjM4ZmCNkXJqet8zLeNMik4BJ5F2SeEsy+tQjp
   yQTYKyOZiSQE0xBxbG3zyPobDZZKXfjKmebyGCN+Y2Ihv8gcwi1yIEcru
   ghYL9wEyo2V1fygtJh0xGXK2EIo0JweGQrDCiRSQZ8vqV5Sw+X1YZ1rFp
   Q==;
X-CSE-ConnectionGUID: 9tBZqgUSTpuy7k921+FzMA==
X-CSE-MsgGUID: +qd7kPQRRk6PIn27F/RMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101558569"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101558569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:16:53 -0700
X-CSE-ConnectionGUID: mcFPh+TaRTGZ537dHTcCpQ==
X-CSE-MsgGUID: xQ/qpcy8QsmvUL+LJw7xhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="271815009"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.233])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:16:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <aruD5kwOEsvFhW2e@beelink>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
 <aruD5kwOEsvFhW2e@beelink>
Date: Tue, 29 Sep 2026 13:16:41 +0300
Message-ID: <42cfa3fb2246c66d69e45d7d9b8d6aaadc0da4c4@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 29 Sep 2026, Benjamin Tissoires <bentiss@kernel.org> wrote:
> Ouch. This immediately raises the "let's implement a parser in the
> kernel" flag, or "let's create a new langage".

Fair.

> You'd still need a dedicated driver for your new blob parser, with far
> fewer people who had had a look at it than BPF who has been working on
> for several years.

Fair.

> The integration of BPF and the kernel is honestly transparent nowaday:
> calling a struct_ops BPF function is just a function call away, and from
> the bpf calling anything in the kernel is also just a call away.

I don't know if I'm just being overly conservative here, but it seems to
me BPF provides too much flexibility for the use case. But maybe the
point is completely moot, and you should just ignore me. ;)

> See Maxime's answers: yes, falling back to dedicated driver is still
> encouraged.

[Moved the above to go with below.]

> Isn't that what Maxime wants to have? One driver for a plethora of DSI
> panels, with the same ability the BIOS has to also do function calls to
> set things up?

I suppose this is something that could use some clarification. Is the
idea that most (simple) dedicated panel drivers eventually get converted
to BPF? Or is the idea that BPF is easy for prototyping and development
using stable kernels and short time to market, and most of them would
eventually get converted to dedicated panel drivers?

The story wrt display before userspace is up and running also needs
clarification.


BR,
Jani.


-- 
Jani Nikula, Intel
