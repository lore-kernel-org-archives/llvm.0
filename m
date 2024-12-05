Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1575B1B4124
	for <llvm@lists.linux.dev>; Thu,  5 Dec 2024 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384707; cv=none; b=anNPYz2b3avOckyOFAJcQZ53BgSg6iv1DnGkgUFSUBWCfr15D/84AKuXOmOGSAPG9YK1ya136OtqscQFusvm3EPWEPirj1jucMkiPJhVSZaMdv2UOZtQyGM+it60dD7gFf6eO8UNdXsxc1qLyZEen6eunyLOREw03MgP25Nmxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384707; c=relaxed/simple;
	bh=97hThSuPVWzZ9pr/MZVasityF+cJQ+fGhUX+4hk4DEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmU9GbRC83ahroY0kdO9QtNx+P9C0dh35SsR2bavFKELEqfFDE1Wq91QLPW4U4BbciMftlMViFpDPARh4czgsqgBxVEt8K/d/gMfwpS9QigXaCbUwBV+ymvfCBWpCXqGQBKXpdr8AVjEEVXz8RNKUSgvx/3NwBuJPNwrquaqPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+PmSorB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+PmSorB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733384705; x=1764920705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=97hThSuPVWzZ9pr/MZVasityF+cJQ+fGhUX+4hk4DEY=;
  b=D+PmSorBARVl/Ze9+8mUB+Sw0rTnpYjTqKE9qo1Iy1LN2KvnOBETQuC/
   zi9/oWrkjF1T08d42MOgaY0fwKFSDX7Kr1TVKFueOpBLO7gRoJXXpFd/z
   OpYQN778IOoAau4lbWjN0zME+0tO9VtEdFad9Ctl5IHViMmUQUD9zZg9K
   5negloJvW6zHP1KuiWZoIIURFT4n6Mm9kErhXKY/6y/MBySZ+ve/fhtLc
   VXJ0EUH6TBb225TlBoC0tfhg1Ro2QPFcipfsr7IIwpqGsiLd+M5lG9x+f
   nD+RTj65Av78QTEY35RfVvfsbZcxVBH5jjLzGioJh0G48GzxoVuVAxFMc
   A==;
X-CSE-ConnectionGUID: K/xm7TJsQIW/9fxiN0WZ1g==
X-CSE-MsgGUID: OJOEizODRtm31r10yk/6Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51215324"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51215324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:45:05 -0800
X-CSE-ConnectionGUID: 0TcOPYQKR5W0L5QBkVXADA==
X-CSE-MsgGUID: jX684qnHQEKA759rclA1NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98466092"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:45:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ6Xf-0000000411f-28rf;
	Thu, 05 Dec 2024 09:44:55 +0200
Date: Thu, 5 Dec 2024 09:44:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] pref/x86/rapl: Remove unused function
Message-ID: <Z1FZ97Jxngcxyb7N@smile.fi.intel.com>
References: <20241202182815.639124-1-andriy.shevchenko@linux.intel.com>
 <CAP-5=fXbjvsmuKrNe1uAOYLV0k5U9OBuHV+drSs_5JyUuXQ9SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXbjvsmuKrNe1uAOYLV0k5U9OBuHV+drSs_5JyUuXQ9SQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 03:56:03PM -0800, Ian Rogers wrote:
> On Mon, Dec 2, 2024 at 10:28 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > get_rapl_pmu_cpumask() is unused, it prevents kernel builds
> > with clang, `make W=1` and CONFIG_WERROR=y:
> >
> >   arch/x86/events/rapl.c:165:37: error: unused function 'get_rapl_pmu_cpumask' [-Werror,-Wunused-function]
> >
> > Fix this by removing unused function.
> >
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").
> >
> > Fixes: 9e9af8bbb5f9 ("perf/x86/rapl: Clean up cpumask and hotplug")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> 
> nit: s/pref/perf/ in the commit message title

Thanks, the analogue change is already in the perf tree. Just hadn't made the
rc1.

-- 
With Best Regards,
Andy Shevchenko


