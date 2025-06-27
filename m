Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9D1A2387;
	Fri, 27 Jun 2025 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041096; cv=none; b=blSQDmI3Cnjzzi/Ht7UpZpAIuI+rVdzKxnjHacRER7bmp3sFv5Byyn1kgP8J/pp6iMTY1rCKReOH8u3POqnDDD24PXAI1YFP6AkUz9A5C37c9oCbqLxJFQUnGqUwzAmyv14BkVCBTsKpLxNQfpJwOhT/aQczP5KnfaYfuGAWWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041096; c=relaxed/simple;
	bh=vNyKPuHzCNUHX4x3bntCWHqAQ4zTRDjMdL7Oc2xzQyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXSJnMNylTfq/YJcRVIMbioJEq3BZL0dXX5kEFXUxEyUhIo9rruvm4qqlauL2wpv6ZM6fOD9JCGLoc7xFPnuS8yZXkiBXK9uSDLeQ2lSW31h0fn7tN2ExXTh9vti0O98zf4QwUCSEUfIOkLspo402N4KeSvVBd3wD5ObXNgdYCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieL9AVWt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieL9AVWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751041095; x=1782577095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vNyKPuHzCNUHX4x3bntCWHqAQ4zTRDjMdL7Oc2xzQyI=;
  b=ieL9AVWt5UXGNSokFw4BZDelWvlLZF9/xHd9jKA3T0GqicGA/xnHykCH
   urWROnf4rlyhVlZ8byrkqpe5pJ0ssMCjlk5bKMrNufxjyxDKcPhc143aW
   UOS33yUj2oPSs7YynKC7ZHvuwt9GqZjUUtwj/vX6kwBc2jcfhKoMMXBNc
   ZZ37YfhH9sxnxtwkTIZTSn1CAEyUzUHotwHo21BbxN/zvBchydCpmkZ+f
   Xo9kIFpO6gsPGSywFCrEIsL6gIlTJqCFwOX/Y31jkOraf5USGpvt02u4l
   ++708S5JC16IRakGUmhU1Vzg1CKgaDiNJFPykVRA46YxsiLsPnJHu9Aj2
   A==;
X-CSE-ConnectionGUID: 1YPOHyD5T2aNLtryIxsDeA==
X-CSE-MsgGUID: s4mcZCBRSY6B/JXMMmQ3Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="40983253"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="40983253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:17:27 -0700
X-CSE-ConnectionGUID: x6MOS/2zRwqYo99kITkz4g==
X-CSE-MsgGUID: ZwvY1V5LQ5qWmx5VIdRoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157129155"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:17:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uVBlQ-0000000AX4s-2NUJ;
	Fri, 27 Jun 2025 19:17:20 +0300
Date: Fri, 27 Jun 2025 19:17:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <aF7EEAxXsurLvIt9@smile.fi.intel.com>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
 <e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 06:05:08PM +0200, Hans de Goede wrote:
> On 27-Jun-25 4:56 PM, LiangCheng Wang wrote:

...

>  	for (i = 0; i < count; i++) {
> -		err = i2c_smbus_write_byte_data(client, reglist[i].reg, reglist[i].val);
> +		err = i2c_smbus_write_byte_data(client, reglist[i].reg,
> +						reglist[i].val);
>  		if (err) {
> -			dev_err(&client->dev, "write error: wrote 0x%x to offset 0x%x error %d",
> 
> The original line here had a length below 100 chars, so it was fine
> and log messages are allowed to go over the length limit

Actually I tend to agree with clang-format on this case and that's why:
until V4L2 becomes less pedantic and fanatic about 80 characters
limit, the 100 is not applicable for this driver to be moved under
their umbrella.

> +			dev_err(&client->dev,
> +				"write error: wrote 0x%x to offset 0x%x error %d",
>  				reglist[i].val, reglist[i].reg, err);
>  			return err;
>  		}

-- 
With Best Regards,
Andy Shevchenko


