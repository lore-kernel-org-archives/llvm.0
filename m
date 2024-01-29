Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D05B5C9;
	Mon, 29 Jan 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706527299; cv=none; b=SkTUHw7aH2DIvhvhNtye+Po+0wRpN2ScQ0PQARutU/SMAgu6Syrv/b8DcZl28ILL9kcdwFK80QQ2zpqGUDt7gtOmwS0sX9ZY7otNkH8zm45IVLLCGkoChTRu70ARFxu76tU2oZlKz4y3amd80M2DSDFyGY4uui3M/QsF7Xd7KwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706527299; c=relaxed/simple;
	bh=NY7th3TWuLT6A+UxArkHPzAUMkwf/121EP9Z8/2reBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8ecDeeo9dWOyOU2MzmILCF7z6zcxOUDmimmK17IUd7oHXrXj0qudOXG585wXZHMZGI7m1puR+gKEjhm47RKW3Qa7IqD84tcl/8TPztRWEqjCaVvASamOp68rZIlbwjj8IYO+2n6gASnrsBvQ6KQifLf2eIH/aSn/NtBMTYuZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCbpUc0x; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCbpUc0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706527297; x=1738063297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NY7th3TWuLT6A+UxArkHPzAUMkwf/121EP9Z8/2reBU=;
  b=gCbpUc0xLBWhrr6GSdkk7Wvfrm2e1udZQdUZ6UwqCSgq7ZE5d2USuC5n
   8/CDkweFLiE8dKbtrTKxJN57q2n3VVRyGsgR0eXtXX7nvIbmerG3EGU4O
   zoINv/+kZIoCf4cR2VVkLUhQsvTxQ77cVaGrwHlvsQ4HeIPIJrN45OFUI
   LBemyCv48k7Tm9sfc/lTvy9ZT2ed2SpEcvWWcLZ/V/eveTvTjIDpoJYXP
   dRUdAv4Pnu+5lOYfpDkcKT7Wrl14f185h5+vg8c9bICKh86prlrrDKAwi
   MYIPCNB/PgXUKZ0N0w++jIbJ30U0RFNEbuxcrqX4GjSouIro0Vpe9k/wH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401788330"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="401788330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:21:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="22073405"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:21:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D610611FC11;
	Mon, 29 Jan 2024 13:12:52 +0200 (EET)
Date: Mon, 29 Jan 2024 11:12:52 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: kernel test robot <lkp@intel.com>, Jason Chen <jason.z.chen@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [sailus-media-tree:master 18/18]
 drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift'
 in 'struct ov08x40_mode'
Message-ID: <ZbeINIg_09lyMXym@kekkonen.localdomain>
References: <202401261628.dWEtdXLE-lkp@intel.com>
 <20240126154714.GB194356@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126154714.GB194356@google.com>

On Sat, Jan 27, 2024 at 12:47:14AM +0900, Sergey Senozhatsky wrote:
> On (24/01/26 16:47), kernel test robot wrote:
> > tree:   git://linuxtv.org/sailus/media_tree.git master
> > head:   f76be7216c3df5f563353bd7a6aaf5076b118943
> > commit: f76be7216c3df5f563353bd7a6aaf5076b118943 [18/18] media: ov08x40: Reduce start streaming time
> > config: i386-randconfig-003-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401261628.dWEtdXLE-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift' in 'struct ov08x40_mode'
> >     1783 |         if (ov08x->cur_mode->exposure_shift == 1) {
> >          |             ~~~~~~~~~~~~~~~  ^
> >    1 error generated.
> 
> This CL depends on https://patchwork.kernel.org/patch/13426393

Thanks, Sergey, I've taken it in my tree now.

-- 
Sakari Ailus
