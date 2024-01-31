Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB01272C2;
	Wed, 31 Jan 2024 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706716005; cv=none; b=oqDNjB+wIHXPlfIWJmMm58rxbXPs40jhlsVPqSh+db41m88P2Sd/lC3tp8017D6pA3Tk+wmkfZbsmV3qK9Iyd7g6/utE3fElLGFj8/QkWWMEr1NOFvSQeg1VlG96tkhqkcWxT5mQsYlv+gKxfmk3EjeDOT240mlb40AkcKjxVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706716005; c=relaxed/simple;
	bh=TIYEjhEm+Q9THJNQ+RQRVyVZX4DEQNHZSWYzF0LI+Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVZdnW2HV76+o6FtCNR6+pDcv8zRDx0c+LXN3MzUHSTGepN13RVFZF2POutdwvHfLNjJI0IzhOTG7lBmaVtBB8wss9GxWAD18XtZPD/rXoYcJJaz/fK03EBtWhoXZwb0pbQRsyctH7Bfs0m51W1cM62FmX/dT3QvU0t12SSQroM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7wBb8Bp; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7wBb8Bp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706716004; x=1738252004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TIYEjhEm+Q9THJNQ+RQRVyVZX4DEQNHZSWYzF0LI+Ak=;
  b=W7wBb8BpLgksjmomzAQbMj4AcgGJt323qmhJ5qkIM9pfKqvJTlcvZ0Qp
   4hiZza0i+0Gs53xmEu+VZInkAbENJpCmDuq8Y0iH+PzWBTvf0NtpG5lwN
   rf/nJjohEJRCNYN2z5PU6NRxW7X/XRrzAAXd5vvpDP/AvZa75EUis+cZg
   0qGlJ+t8wVqxbJ4bpyQks6Dcns0xG9tGrYaBYMv6LoGpjsk7Mv3m2fFGi
   aAgcYkThpoaspUw7NVG1N8zX9pODhDRAAukDQ9XDALjAbUCqxAB17XnCz
   IUNui7OFCUaFiYVBbF43wQJyXGRoFRCCMSsDiR7XIl555J6QMAnpec/Wk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394068817"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="394068817"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 07:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822605488"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="822605488"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2024 07:46:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 07C7B772; Wed, 31 Jan 2024 17:36:46 +0200 (EET)
Date: Wed, 31 Jan 2024 17:36:46 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Kevin Loughlin <kevinloughlin@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Subject: Re: [PATCH v3 2/2] x86/head64: Replace pointer fixups with
 RIP_RELATIVE_ADDR()
Message-ID: <yie3eza6ak7eqlsvb2fjj6t7k43qtupscmv6cvu2eoqv5ikaoz@h5drniall723>
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-3-kevinloughlin@google.com>
 <733302e0-e8c2-458e-a4b2-dfd10e065036@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <733302e0-e8c2-458e-a4b2-dfd10e065036@amd.com>

On Wed, Jan 31, 2024 at 09:30:10AM -0600, Tom Lendacky wrote:
> On 1/30/24 16:08, Kevin Loughlin wrote:
> > Now that we have RIP_RELATIVE_ADDR(), we can replace the "fixup_*()"
> > family of functions in head64.c with the new macro for cleaner code.
> 
> If this series is purely for backporting, this specific patch isn't needed,
> right? Since this all works today with clang?

That's true. However, temporary things often end up becoming permanent :/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
