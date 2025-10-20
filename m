Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA423507E
	for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955053; cv=none; b=q4vf+LqcQVD7cWOEggZyhqrY/lju3f07E55/F2WOLAKO5timRr730bbqHygXgDZyQQfsB5sYYjYzEAsCmxN3mxj/h4UXqdcLJCM62vUwJxJ+LVy3TwVjaCgUs2LRYdEI3M1jXM1lV9c39hygM4rDW/JVTrmS9z/CROsPjU09DI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955053; c=relaxed/simple;
	bh=9Lz2Aidu5wnK4L8gWJOKVc/m3XQlXh1QkPKZErk+B7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EckMXsONwOV3gbSqNQn8bwBmq15wP11Leo7zeHh+TM4fvI1SLbCefkh8GaI4xRjOh6fufTDoUwnCE5Ag/cOjYxKjD0MgQ44jU5OKfe4OLyM36h73owfam5fAcFgZs/XfPqWpAlpHaersWbWaa1pR9AN7Lu22/0jtaMmdzoLDmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5wzi/rW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5wzi/rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760955052; x=1792491052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Lz2Aidu5wnK4L8gWJOKVc/m3XQlXh1QkPKZErk+B7s=;
  b=S5wzi/rWEW11OULhnJPiprdd7rgHmTg36IEOHRJ/AMWuSWs9J1fkBMlB
   ygDy+WjxW/VgmFNvMr49fGOZbttOIn8z0ILGCRORp3H2SfGb7Gn172R7F
   U73KcIoDVCRYAhUDZN3x5vTsbl22AfHtkcgMOK3btTMzxijX1F0RtAyTK
   FT+NrhRdVNM3rrROwfM3reZbxROmPEdSlbkl1BwL0oaY9y3DvKcJXiWSp
   Hd+tagYLGpnrnejcV3MygtUj2e316mtC6BgtX+osB4Od/i23HwaCkQjNR
   bDNW+egWhIOEl1rexjMf7MKk/fsRJ4avGDlqJobrsUqYdDh+7EqKiiliA
   Q==;
X-CSE-ConnectionGUID: t5lZ9j1uTnWS2bCY0bn3uw==
X-CSE-MsgGUID: 1H4oHY9vTs+X4dASN1UoNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62963394"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62963394"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:10:52 -0700
X-CSE-ConnectionGUID: 7JUmIlm6Sn+dAsFfYdqWvA==
X-CSE-MsgGUID: gaTytT72S8yVPWaVi/jztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="213911533"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.6])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:10:48 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAmqi-00000001GqU-3VLx;
	Mon, 20 Oct 2025 13:10:44 +0300
Date: Mon, 20 Oct 2025 13:10:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] sched: Remove never used code in mm_cid_get()
Message-ID: <aPYKpJ4MdjlGeILa@ashevche-desk.local>
References: <20251015091935.2977229-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015091935.2977229-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 15, 2025 at 11:19:34AM +0200, Andy Shevchenko wrote:
> Clang is not happy with set but unused variable (this is visible
> with `make W=1` build:
> 
> kernel/sched/sched.h:3744:18: error: variable 'cpumask' set but not used [-Werror,-Wunused-but-set-variable]
> 
> It seems like the variable was never be used along with the assignment that
> does not have side effects as far as I can see. Remove those altogether.

Anybody to apply this for fixes?

-- 
With Best Regards,
Andy Shevchenko


