Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31932D03B
	for <llvm@lists.linux.dev>; Sun, 18 Feb 2024 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708251597; cv=none; b=kSVmVtawG0AHyXQ/nZB7O1arutX5uSrNNA0lqiWcGy0VAGY1UHX0C/3W1vtz6x9W2qnx3cZVvkM0iRbVXt/1iC7lxnzvW9RH/o3TvbhA4Rzw8Ez+K8s1vLcJZpysB9z7p+oiTdbuY9JJRepEm1LwtX5MPaMgPEg1AxexCBo7ss4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708251597; c=relaxed/simple;
	bh=JK7js32ODxWd2IYgaKayzCZ2uwHXLXIH5AK5JBEaZpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp/g9vs+qkiASKnkIHBVVLjmwW11M2BBnGYFHGqJKI/jSbq1d19yLUH8rM3W32XM70cGMINjPdpIsSXddvZUbwMF7Yn1DjmWrSqKsMtE3sgGQlHKe348CKGuYReZrK1y+19Ji3LoRpl9LKag+7qVwBFsHfKwDzQhUQjGmZBFT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFPJCfo5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFPJCfo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708251596; x=1739787596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JK7js32ODxWd2IYgaKayzCZ2uwHXLXIH5AK5JBEaZpM=;
  b=AFPJCfo5OTwHzsWjR8rcGeVBVTrp1TvA4MvUOI6zqSsqNJw7Kaez4hXw
   ejeQW59/maYjBTqLtcpzbA9d8tGJbv3dlb9tkAWbuWtMibOqTpnKoDted
   oxpJY5caw2O8S0vScx32OhOdSn2UxDfg0hHnfY+fCfhxQ3Xb6yl1eU3oD
   alwxi2ubqOCEqQu9TVXf1oqm0qD6k/Zlk2BDUyOjapZqulZPLCHWt3lCx
   dOZ/YklPhuUdmT/BXCc4x6OJ/o39pQ87nfJDD4J8QNop0YGuuPtiOg4cF
   kmtCiPKDPJNFSNkUhBi/rVw9wFo4GEX3DMrYQ7hgQ8/YzFGhvY2nghAaG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="13744909"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="13744909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 02:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4193821"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 02:19:54 -0800
Date: Sun, 18 Feb 2024 02:19:53 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] fs/select: rework stack allocation hack for clang
Message-ID: <ZdHZydVbQ7rIhMYV@tassilo>
References: <20240216202352.2492798-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216202352.2492798-1-arnd@kernel.org>

I suspect given the larger default stack now we could maybe just increase the
warning limit too, but that should be fine.

Reviewed-by: Andi Kleen <ak@linux.intel.com>


