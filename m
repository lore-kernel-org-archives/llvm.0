Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBE1F4165;
	Mon,  3 Mar 2025 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000729; cv=none; b=R7KfWDY8Sdi3JwsJvy3pu9t6j7OxUVutiLAN8BoJzNIlOIfAbLW3ZGTCezN0v32fGTapA/S+xUVdKCyEqSsc9oOiQd3Qw5pNd2A7xJSs7uXEvMBhij+GLtILJF7/PTGqcY3SBoogioHFo5FlNcZFzSsnELZWqEo8wXPVhXtuyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000729; c=relaxed/simple;
	bh=tX6xycVlm0hqQ9h8iORXLZHUyLwbVdP+cXKqAOJS+II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olpIAXtMqTvvvZisEb3lWUxoCcg87y5Yd0ixKJy8D7YP1hk00aRlMAdSTmquDUmBHtw2utFEo8UxTL871PQYLpRcwOcwDPZHVy8J/6FqeSjVr7Id4Vf8JYRKTthGDdjf472505r9hKaNmSpgHCZVhyjQbHIWRdLIH6CuGwB4Kdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCDsjqce; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCDsjqce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741000728; x=1772536728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tX6xycVlm0hqQ9h8iORXLZHUyLwbVdP+cXKqAOJS+II=;
  b=nCDsjqceOA3qkUiSJIVV8D7MpwSc+oP9tqrMOKTm3bMRONhriK4lfHLy
   mgdxf498nwmHYaqK3gDp4E3fL25O9XHxNh3mV/mgdfKciBvpI8F+ec/SV
   6LkFsfQ1T31YkOMUVyO1hlFn9PWObt0Sd1XNsiAeHJs5lZaInSay10YPM
   2EtOlCkchP0BKDWlDqDe4hzs73rCKLJB7Mgrrl4dDnvxqDJDtvEALN124
   Jh7SczYDAz55baEVp2RoEs2KdOJ8O9dlR6Yev/6RLPamVKocg0W3gCwEu
   PIsk+hfHG3fydMVy45kG1AOLAsPYrbq3suN4wn3aEyIy5fKVXaoM0wBxb
   Q==;
X-CSE-ConnectionGUID: 8K3jH+aMRn2JskM3MUYafQ==
X-CSE-MsgGUID: k9Umaj5VRKWXK/UXFses5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="45644557"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="45644557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:18:47 -0800
X-CSE-ConnectionGUID: S5aCuh0sQ0q2PF8VTniF7g==
X-CSE-MsgGUID: 0oCy3AfKT9+VTH5NApmTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122978491"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2025 03:18:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A550B125; Mon, 03 Mar 2025 13:18:42 +0200 (EET)
Date: Mon, 3 Mar 2025 13:18:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel test robot <lkp@intel.com>,
	Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Add lockdep assertion for pageblock type
 change
Message-ID: <Z8WQEpv7BNtDDoH3@black.fi.intel.com>
References: <20250227-pageblock-lockdep-v1-1-3701efb331bb@google.com>
 <202503010129.rJvGqZN1-lkp@intel.com>
 <20250228182804.GB120597@cmpxchg.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228182804.GB120597@cmpxchg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 28, 2025 at 01:28:04PM -0500, Johannes Weiner wrote:
> On Sat, Mar 01, 2025 at 01:31:30AM +0800, kernel test robot wrote:

> The patch is missing a dummy in_mem_hotplug() in the
> !CONFIG_MEMORY_HOTPLUG section of <linux/memory_hotplug.h>.

+1, I just stumbled over and this is not fixed in today's Linux Next. I'm
wondering how this was missed during merge into Linux Next. Stephen?

-- 
With Best Regards,
Andy Shevchenko


