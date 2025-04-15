Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E53849C
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699565; cv=none; b=JkKbuh6GkL8G7Sm8et+N+gdIG8+ixLayohhtJG0uRcfX3Aqz4RQvXrgJVe4nTX0Kp3C/GkFQKE4OufMkOgRvxRh6/xx8izhnlWaluLDT0FcaTDRUSolDxSM518SLShJAOOcqCWEPlbx53Yp1cqoQZmeBtMsnEsE7goeFBtaULKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699565; c=relaxed/simple;
	bh=SBEr8CwCyXVE2U80w9UyF6A35EP/6o196oB1OA0kh/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT9wJ0nHJDvW5GCCt+bjSVpsSMVICVc+R+au1T47aHZ04ijrsGmHUD1YZSydlScxq8s5wipyV4uSQh92+ccAaAW1tWFKdtt56xYpsOfNKohbzu9YGvfvJEfLdg8GYmSrJYAROkQrffMlS7jBTmnUgmkIAhDxfZb8JbhVkdYxMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI11/ETv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI11/ETv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744699564; x=1776235564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBEr8CwCyXVE2U80w9UyF6A35EP/6o196oB1OA0kh/U=;
  b=GI11/ETvM6V1F9zFlCdfgVWdUFB+aFslHs8M+tOIFaXjZkQIfLhIp7Ln
   vMX2H4wjaFWgnVWSMQTnRkVs6yupz8zGe6riia5TL282b7ip6MbNzrz+9
   ALWH67bsSH8pOQtdRcMwZnB4fMPL0Oc5CUhFLf08oTqmixv2R35fPHBL7
   POZwr1kHT3unpMqWVXMyf5w1L0bFAjyErX31p3ltnin0I9PYud1UzO68+
   1K05/EwJlm2hvScy68Yw+hHQR8gcW9Kvhbqi+4kKObPny7KkBSQX/haD2
   1Y6QQCNSdIGiBfCXG5LjM7oVigiiAAvHrmwTdwdSnTwFf8MzqGOykoOIC
   w==;
X-CSE-ConnectionGUID: CUrHwMvwSOalvpsvSsvf2g==
X-CSE-MsgGUID: NeyQ2asTR2G0fDA1Gy5gWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57182747"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57182747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:46:04 -0700
X-CSE-ConnectionGUID: K63iAaCpTzqDWGS1VbWsYw==
X-CSE-MsgGUID: JTqxjqWGR7Gt9XIYIB8RqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130567637"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:46:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4a3T-0000000CSsu-0IkC;
	Tue, 15 Apr 2025 09:45:59 +0300
Date: Tue, 15 Apr 2025 09:45:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <Z_4ApoWzgWSovgRi@smile.fi.intel.com>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Z_yrjPBO_CPS8WX1@black.fi.intel.com>
 <20250415003326.GA4164044@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415003326.GA4164044@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 05:33:26PM -0700, Nathan Chancellor wrote:
> On Mon, Apr 14, 2025 at 09:30:36AM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> > > On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:

...

> > > Getting rid of the unreachable() in some way resolves the issue. I
> > > tested using BUG() in lieu of unreachable() like the second change I
> > > mentioned above, which resolves the issue cleanly, as the default case
> > > clearly cannot happen. ...
> > 
> > As Dmitry pointed out to this old discussion, I have a question about the above
> > test. Have you tried to use BUG() while CONFIG_BUG=n? Does it _also_ solve the
> > issue?
> 
> Yes because x86 appears to always emit ud2 for BUG() regardless of
> whether CONFIG_BUG is set or not since HAVE_ARCH_BUG is always
> respected.

Thank you for the reply. But do you know if this is guaranteed on the rest of
supported architectures? I.o.w. may we assume that BUG() in lieu of unreachable()
will always fix the issue?

-- 
With Best Regards,
Andy Shevchenko


