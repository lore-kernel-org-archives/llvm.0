Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D714A4E5
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712842092; cv=none; b=UjySgFjlmhheKaolTB3fvvBoymuYV4Zzbqqw46pj11sa4Hvt+L88NTuf6dNNV7y6pP9ShYAo4aEyIBQQQkAuhI7PeYVnWZ8Gi8SldgpUbdIxkkmj3dg0yArgpJmfHi0qRI8TOoqHx/OGZuz33nO1kEiVgTtcOXe1fFSewELVK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712842092; c=relaxed/simple;
	bh=rN3vnamxh1y4e19vWKAPhoeeESNA3w+VvGOlWEyFGns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsO2gAHSkjVqU19iLK4+qkw7wmQ46oiyVjuZiwcGeqi4T3AFRtC6cIvEbrSezAiEjAkQ+LHkm5PhzaU5fueLdvO0jG1wUwx8kH+RRDEjishKBc8q+4i9Onguv0/Qde2oiLDeaB4p1HxeBiaXBVbh3J6OEz83CFXGqp4+XowXjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9Q6Z+W7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9Q6Z+W7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712842091; x=1744378091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rN3vnamxh1y4e19vWKAPhoeeESNA3w+VvGOlWEyFGns=;
  b=S9Q6Z+W7o1vnYlqo9nMo3eIuBz0Z7vrbM63vn+qexxoeGePkjGXCq5GX
   UOM3dXq+SsyyhByR5FsVQwOZyyv8MDrfdvM5rRw5io+SVn9sMpjIs2I8N
   /hsOwMykQ2O5awLRk7NgjXhxg+6koue/ISevnOgryvT8mxq8au0XiLkUJ
   FqdWpXjZcEOkvZaDxVO5Pstg1z1PHiBg2CYFO+dW0k+QjN34Nv8ZDsDxQ
   Rku3hXL9rdKFf3IBKyfVfvLlC50K8FPhlw+3Zta1PUuPr6ySuGVrYZAYK
   6qcm7WZ6c4EcOG6oPOLkIpBjr+obmojlq4wdeikFsgTWWDrVeolDMGtmE
   g==;
X-CSE-ConnectionGUID: 8N2z3sNGQx+8mHnsslX7QA==
X-CSE-MsgGUID: 1Tzt2YKeRsCEBhw2amR0UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8102460"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8102460"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="937096973"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="937096973"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2024 06:28:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EB28532A; Thu, 11 Apr 2024 16:28:06 +0300 (EEST)
Date: Thu, 11 Apr 2024 16:28:06 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 0/2] gpiolib: acpi: A couple of error checks amendmends
Message-ID: <20240411132806.GB112498@black.fi.intel.com>
References: <20240410202243.1658129-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410202243.1658129-1-andriy.shevchenko@linux.intel.com>

On Wed, Apr 10, 2024 at 11:21:45PM +0300, Andy Shevchenko wrote:
> One error check is moved and one is dropped.
> No functional changes intended.
> 
> Andy Shevchenko (2):
>   gpiolib: acpi: Remove never true check in acpi_get_gpiod_by_index()
>   gpiolib: acpi: Check for errors first in acpi_find_gpio()

Both,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
