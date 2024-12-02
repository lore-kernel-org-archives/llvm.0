Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE517C215;
	Mon,  2 Dec 2024 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156085; cv=none; b=C/1vhMvrEFTFYN/BsslTqc0R9RlA9jsuJeMqCdypppxX120TZa+3DUQRtXC5PmbmVY8MBxs8MtpiSufwspeVwkFxsuynIYUDrEe3jcHnAUk9LBxjXnxskS9YsNzJCH5aJktfpKIeRkZqWsfU0WNU5pFlkLqMAbW7Oo3WYCkwnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156085; c=relaxed/simple;
	bh=v1Hx6Kf34Um/vEhgVQ34LyNEJEbqTYzx6TgGdRu2Sis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIBu5LUOAHfl+BlzRvbuIYJKl3klhteGlAOZUADWHbZFoX8j99eRzoZafsxpYTX0qr9RC8PASKjMTa5k71DlpPPcRoeKE01XR+/QC3Qhk37ZQywCeiInop8nmlKQ+qdzNVw4VXhDT/RLZPOHq/3hZ2xG3mfS4MNF7RvKAuhqNo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 55FP6Q/pRWyBmx9xD3FOrg==
X-CSE-MsgGUID: g0HXBtoXSYyNj6ObtQCORA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43942117"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="43942117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:14:42 -0800
X-CSE-ConnectionGUID: vjG8tfL3ShOB4efcJxu2NA==
X-CSE-MsgGUID: K3lM3hHaQ8ClrOhRcJhPSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93976735"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:14:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tI94E-00000003BnJ-1QEb;
	Mon, 02 Dec 2024 18:14:34 +0200
Date: Mon, 2 Dec 2024 18:14:33 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] media: atomisp: Use the actual value of the enum
 instead of the enum
Message-ID: <Z03c6ZHOP9rUFtP_@smile.fi.intel.com>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 02, 2024 at 03:47:16PM +0000, Ricardo Ribalda wrote:
> hrt_isp_css_irq_sw_pin_0 has a different enum type than
> irq_sw_channel_id_t.
> 
> Replace it with the actual value of hrt_isp_css_irq_sw_pin_0 to avoid
> arithmetic operations between different enum types (and make the
> compiler happy).
> 
> It is required to build with llvm 9 without these warnings:

9?! Maybe 19?

> drivers/staging/media/atomisp/pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> drivers/staging/media/atomisp/pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> drivers/staging/media/atomisp/pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> ro

You can make the above lines shorter by dropping the obvious an duplicated (in
other places) part, i.e.  drivers/staging/media/atomisp/. I usually replace
this with "...".

.../pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
.../pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
.../pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


