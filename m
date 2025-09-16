Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA754918
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027054; cv=none; b=mVh0gCmimcLBjomkvMxL3PureVRc0nb+Ls65THxppBcIvD5mtDREemQdvtu1ghcXtkChY5X6Uh/HA7+YcvIPiSUZZyimm7e5g9TCmtuSIkgyYOfSmEBEdMP1neTQlzxJSTzlwZuVtPNTD8SkJtXIbkJ9pwltHdHzeHvDYXZFLbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027054; c=relaxed/simple;
	bh=VxM/cdUE+MegHutCDt81ETLB7ynUxqJX6Yz1kpPrbhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH+4sXougowat4z348j3p9Fa1NX68FO6To+TnzZhNQFX52I+5TqQ/aXRiSSG+J/vrHiVY9/3aut9WVPA98NMatIbNtdRhgrTeXgfww2axsLwV7e7u7X1AaFDWoriiehgZVj5e9vKZg+SIpNgvhcdrVgJ1qIj6kOo3aDetVjiirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhOiTeGb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhOiTeGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758027053; x=1789563053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VxM/cdUE+MegHutCDt81ETLB7ynUxqJX6Yz1kpPrbhQ=;
  b=VhOiTeGbYVu2bPwdayYYpaM7HrhuPYee/ZUcb6n8C7QriSTbTv5aKDcc
   i7OjGS95bQLRmbfp8LyVs3AHe0HiAEJhyCvVjDGTMAcxVmHuGD1Ba0RdS
   +QH9h+xrX7Gp83Pe8mZ0jUjtSsC8D5k98rR63cdDwjUpuXtADrGmDvwzm
   O4pTX0CarW+jB/4KW2cBYvI50/AfvO5//boQibbgqwruVP7bZs7xvbt5J
   YfScyiwgZWgFiKFB78rtGXpaF0MjBs8h+rD4OoDSNsLEd9EIUpc8rTGjW
   Z+zFUhUal6ue8v1dyr46KyfbGTA1CNCzcKsjND22KJI9oIiLSsEKTIzPl
   A==;
X-CSE-ConnectionGUID: GKaqUQrtSVm+CzH89m4u6A==
X-CSE-MsgGUID: UcOlZrIKQcGn7XaQJ2KHQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85742571"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="85742571"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:50:52 -0700
X-CSE-ConnectionGUID: Sfghzwj2RRG2AEz6CPxh+w==
X-CSE-MsgGUID: dr1e4I5gRCGdNtLcOWHJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174044636"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:50:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyV8u-00000003WoJ-2sRO;
	Tue, 16 Sep 2025 15:50:44 +0300
Date: Tue, 16 Sep 2025 15:50:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, grom@black.igk.intel.com,
	07110bfd5785d3bff71cebd710db42d6f5c4a643@black.igk.intel.com,
	Mon@black.igk.intel.com, Sep@black.igk.intel.com,
	17@black.igk.intel.com, 2001@black.igk.intel.com
Subject: Re: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <aMldJJktQVvkcMub@smile.fi.intel.com>
References: <20250916123048.3058824-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916123048.3058824-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 16, 2025 at 02:29:49PM +0200, Andy Shevchenko wrote:

My gosh, the Subject is mangled, sorry, I resend it ASAP after double checking
it's fine looking.

-- 
With Best Regards,
Andy Shevchenko


