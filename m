Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94776222585
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026279; cv=none; b=tAZL49F0amgn4xS6Mj9dRxZBc8N+NxvmPa9PrzXfBluHTHSH7Qs2FAzpZzOFBEgQ160nfTbC3TyhpOfOTrt6+FynKSE0lIpCJrwagE0EUa8xPhYjoTzA/E459pzXC3aBgjTlouYU99pqWMicAvS+Ib7syx9beeZSs1kcXRVrElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026279; c=relaxed/simple;
	bh=XVyDlZ1SCJXgq+chWGP6vIGrgyIk1SQPZ/6k4hcNvh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXK9LXf53R9fxfaiGY85a+TgJ7hTTYTXftYQOwWtJpgB0IYGUBNc9dTv4fphA2Rg07oCQBfY1PxlnGv1FKrhaDU1U36vEh5NONSown2mdn7vK4CrQDES9xvwn7iNZUUWBD8dWwquyEp7Vh/JJxR15Pj7leia4jHz1+hRckPdszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbCCalfv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbCCalfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758026274; x=1789562274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVyDlZ1SCJXgq+chWGP6vIGrgyIk1SQPZ/6k4hcNvh0=;
  b=bbCCalfvapPlNCpnGPLbwiNVi0KFo0yz3dk0zlTS+deP+NABTAAj9MgE
   1pHo667MZutYls2zYZ4HT5qMxVACACwbESnvwZcIkb/tBf1Gzo/PqJoKC
   QsMlQdcEMGD8bae+7qTjNjWR4u/Pag0Fb9O3xSq/Q90tE/LZYcMx+wEZO
   9z7D5jTzvWOGpxAkUEulmtS1GJ8+gvqay4CXTEFfstOJoXWJQS8bA4ujG
   hEMHCWDRZe04VK9jTOxjNu+0TbU/JCu3f5eeUcqGD7ZULvev66kYV4Xyp
   oBJUPqef3rLRuqi7NJCvlQNDi5rUWUqFwckntCExzUbmWjQLCZrR6CDde
   Q==;
X-CSE-ConnectionGUID: D4FpzN4oSWmB1DEuX4fy9w==
X-CSE-MsgGUID: nbNHZSA1TEib5fKFC6vYlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="77911520"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="77911520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:37:53 -0700
X-CSE-ConnectionGUID: vqsWCP6PT0CN9pfuYNJyGg==
X-CSE-MsgGUID: MbPp+YYXQ9SXfecXIdFwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174866470"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:37:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyUwO-00000003WfM-076A;
	Tue, 16 Sep 2025 15:37:48 +0300
Date: Tue, 16 Sep 2025 15:37:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lock_mount(): Remove unused function
Message-ID: <aMlaG5gXag1C-MGr@smile.fi.intel.com>
References: <20250915160221.2916038-1-andriy.shevchenko@linux.intel.com>
 <20250916012537.GL39973@ZenIV>
 <aMlHXBswxpy0D7s9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMlHXBswxpy0D7s9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 16, 2025 at 02:17:48PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 16, 2025 at 02:25:37AM +0100, Al Viro wrote:
> > On Mon, Sep 15, 2025 at 06:02:21PM +0200, Andy Shevchenko wrote:
> > > clang is not happy about unused function:
> > > 
> > > /fs/namespace.c:2856:20: error: unused function 'lock_mount' [-Werror,-Wunused-function]
> > >  2856 | static inline void lock_mount(const struct path *path,
> > >       |                    ^~~~~~~~~~
> > > 1 error generated.
> > > 
> > > Fix the compilation breakage (`make W=1` build) by removing unused function.
> > > 
> > > Fixes: d14b32629541 ("change calling conventions for lock_mount() et.al.")
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Folded into commit in question to avoid bisect hazard
> 
> Thank you!

It seems similar treatment needs for node_to_mnt_ns() as it's now unused after
the commit 96ff702edaec ("mnt: support ns lookup") if I'm not mistaken.

Should I send a patch?

-- 
With Best Regards,
Andy Shevchenko


