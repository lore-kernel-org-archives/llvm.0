Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109050;
	b=09zVkgoo9VJMNoFQh6xF/Lmrl/RNUM656bsq96yk/a3GjFLi4JAeYccJMDRnjVufqma0
	 DbQeJcYq/nkX5I9hxg8GuFAyZRJFvWvIQz8ZySP3mATLBU/UmJHmD0oHAVpj2l31DnAab
	 oP5Do95AZXiSEv0eAxWPgzhkiXxHt7JHLm8lqQR8SCCWFLMbdROV7j/nhO9/ZzSrNkyVO
	 vlFLxQSEe36yveSiGu0qoJtiluEKvsB5tLluyxcZD+eIhGfsAAemQEUDhaj4yAy6R2AeZ
	 n1ODhxMZkZBqGLz+4DOd8m2qCgHRWlDyOxpiGtmuMltN8AglXG21uzot25X16ZQFuTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109050;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=qBQSOtzPb5Dyyy7UCfkkm4GoQy/f0qU0XzNeiniP9cA=;
	b=XiY7c6w4WTGR4AXVS8lzBT5z7OUMi1dM1o5SHOxCXm3impfxJ6TFMYyEVA6tdnzyQH2t
	 dDaDA9DeIUCTd2eM0aoBE1aHNhrsGycnrBstQd/dCxvRYbjNq0eIRHPHL112D5pTDu76s
	 qANE0tUHqIKJsf3fs4C2I3E02OMYdI4lEW1RCiaYnb8U3ksqv1k0Cf70kVTWPCQ3R+H6k
	 NT36f/+FzRch+LWsr/taS+S+eP+PbKPw7Er57N+DPeXoYt+7S1Wd749oR6wIcfjaBSOpH
	 jvaRU5sN5TSIgh1WNpeebUfuufrqQNRUhQDCVWdGyAQLj/kJN0OvvOx/DJtzXmKWdfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfgTh1Wc;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1493606A324
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1493606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfgTh1Wc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795109049; x=1826645049;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UQ71sU6zYzd/SSWqHxnzrNKZt+CZBGWiDB4bggmKr3k=;
  b=kfgTh1WcQwnkrhwKKeVBF3w/WnPUfv3VcQ67Edex+06qexo8m3fVgnXq
   Wmn5sUKadCZLiepHwf6RY/nD4MWMlTAgCG3Qsiuyyre9KmqtUQx7Chgfp
   IjNsUPNWjbDvz22faxBYv7ntT5vANwBG6sC4Zg8PkCEuQwMWHN8xJgtp4
   cIYY7Xv273CnjmgJgD1uE5JsG0MoBytdca02iKXqoumtjqRjeLvI6Wm1G
   81BEJjnwF+VL6L3PpP3JEAyccF7abo6feI821tE7ESW1XceYKolESnb+2
   Dva3APf8VD91TaNO6Vhuvvcoedx4SjmTgUrnrzGeQ5n6ILcGsIA+wgnZV
   g==;
X-CSE-ConnectionGUID: stYWvjk5SEuK37818veK0Q==
X-CSE-MsgGUID: KbMua9S+QJijm4BnqRN20w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3960126"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3960126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:24:09 -0800
X-CSE-ConnectionGUID: 2wAT42UiTw2ulVwHCNzVNw==
X-CSE-MsgGUID: QgwcaKoZQ6qy+oLWx4PU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10871779"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91]) ([10.245.245.91])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:24:07 -0800
Message-ID: <7aa15f50ed768eae3d192312d90568c81956fcb9.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/svm: Initialize xpagemap to NULL in
 xe_svm_get_pagemaps()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ian Rogers <irogers@google.com>, Matthew Brost
 <matthew.brost@intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Elkin Cruz
 <elkin@google.com>
Date: Thu, 19 Nov 2026 18:24:04 +0100
In-Reply-To: <20261119170716.1523667-1-irogers@google.com>
References: <20261119170716.1523667-1-irogers@google.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 09:07 -0800, Ian Rogers wrote:
> On integrated Intel Xe GPUs (!IS_DGFX), xe->info.mem_region_mask has
> no
> per-tile VRAM bits set, so every iteration of for_each_tile() in
> xe_svm_get_pagemaps() hits 'continue' without assigning 'xpagemap'.
> The
> post-loop IS_ERR(xpagemap) check then evaluates an uninitialized
> stack
> pointer on every fault/SVM VM creation.
>=20
> Initialize 'xpagemap' to NULL so IS_ERR(xpagemap) evaluates false
> when no
> VRAM regions exist.
>=20
> Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with
> an AI
> coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> -Wconditional-uninitialized; not runtime-tested on Intel Xe hardware.
>=20
> Fixes: 8a52f4d9b1ef ("drm/xe: Use the drm_pagemap cache and
> shrinker")
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks. Will add relevant Ccs from ("dim fixes") and push after CI
completes.

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index bc6902b5bf57..22cc7ed19d8a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -2055,7 +2055,7 @@ xe_pagemap_find_or_create(struct xe_device *xe,
> struct drm_pagemap_cache *cache,
> =C2=A0static int xe_svm_get_pagemaps(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D vm->xe;
> -	struct xe_pagemap *xpagemap;
> +	struct xe_pagemap *xpagemap =3D NULL;
> =C2=A0	struct xe_tile *tile;
> =C2=A0	int id;
> =C2=A0
