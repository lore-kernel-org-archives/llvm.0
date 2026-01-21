Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860643AEF57;
	Wed, 21 Jan 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013591; cv=none; b=ULYo7BO5SuIhepQE/mtWH+TUXN46UjdPqA2fUXkVK1exiq6RCFzQ/Id4AxVY8n3l9VNi0wZQhNVNeGYMdvhyl81bp1JjpBkoDkFg3az5cVJRT/p1W1+ZzpAHwtCNKHDC+6tNguWmMUT+HT7WCm30ATTADOhUUbD/ZlQTODCX3dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013591; c=relaxed/simple;
	bh=ulyu4QwPKgMQJSiC7ZsZ+eRPLRwcj0oSbaNhdn/UKKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEMzgHMzfSfDr1P3bMGOE+PAniLG7FLM75c/QCdms0k8tZpSMSzrrY2IFVB6dSIn+cyyRxPxxsEqcVAGj/jvCX1la4a/LdYnYcROHTM5fuS3r86lXlrbduB9Z3EAMdH6lkmEYYmmdPbpQqHBuPn8YxoXKyzjrJPF4rnIuPOZwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yj5fL43R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yj5fL43R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769013589; x=1800549589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ulyu4QwPKgMQJSiC7ZsZ+eRPLRwcj0oSbaNhdn/UKKw=;
  b=Yj5fL43RaK2Sbv2QQKFQ2D3WCzHry482GmEtQqnt6GqoF3+a55tf2OUe
   BS+VGcnV5DZhZHJ5OtoC+gXX61pABSpm+B1v90Q1wCoYGq5vgyPJPZZff
   7yvYwvz0qIes4eZKzJItEeBTY30NLZANzI7vCU3th9ilLstaM9O9hRBMs
   Ns7+vBZX1F+5PmcJtEiqc4XPOPpLgtCyAudOcDEz9XgW6N/0Ve+3SLDGy
   u5S6/qHC+1kBuEdIDm73Merw8MLaJoXfi2Sc2DZOhf35scYdroyoXrReE
   +BmzLdlYm9ELRZoL6bVievJxckf6imOD6Fi7WMFsu/jrbS0DGTf/EI//1
   Q==;
X-CSE-ConnectionGUID: EDPdT9dEQWWaEHhctGdwXg==
X-CSE-MsgGUID: f6A+LI77Q86oUKSfspWotg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70297910"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70297910"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 08:39:49 -0800
X-CSE-ConnectionGUID: YyP6REyCQ/WIvPbmXJTTTw==
X-CSE-MsgGUID: Cna44i8VTXqbTdAOniI2Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="237151326"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.73])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 08:39:45 -0800
Date: Wed, 21 Jan 2026 18:39:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
Message-ID: <aXEBTl-LhCvLdXlj@smile.fi.intel.com>
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 21, 2026 at 11:10:08AM -0500, Tamir Duberstein wrote:
> This allows the compiler to check the arguments against the __printf()
> attribute on __test(). This produces better diagnostics when incorrect
> inputs are passed.

Seems there is a consensus about this version, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


