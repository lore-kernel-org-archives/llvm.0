Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473FD2E6CAA;
	Tue,  3 Feb 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130711; cv=none; b=JSGzmiAQXgOsYjjRzkuuTT0z38mZlM4cf7ApdL2oLPW60RMC1yB7bQTalNbK/R5jw/RYjOa8SDbNJRDyfc30T2Iiwqb13eS5Ly47WVtxjifUDedeyG+7E0G9e4T97+C53thB6xNGqRcvRMdyA7aUkZnbgUCMIBGq61fZOvw6Gp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130711; c=relaxed/simple;
	bh=3OqK9oTeVR5lGSXtaWyFd41ZMpY3Io7T1BufEaZUCaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7gm5hdIln2CPNfqXBWVyroN+VdKXqjFgSAHpCA9JkdK2STD75TdidMPERPsKwv4IU6QpwDJrSFXtMvCQzWfHDW2GLF4Xj/WSehmpXCOP5ulZTbaWpvuwfLG8yZjam+x5LoAvYg3ixAfYz9NoAUNNeCfFbwal6sRwKXZ1/cZVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7Hn9MCV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7Hn9MCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770130710; x=1801666710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3OqK9oTeVR5lGSXtaWyFd41ZMpY3Io7T1BufEaZUCaQ=;
  b=K7Hn9MCViXijX0fol+g7gtaMz13pGFswsk6woNyAyqzh4sl3bSK8H0PZ
   47SDJH73xge9tf5jKlqdo0oB8CCgbe+0rWuDZDFYr9kxoXzM3v+quLXBE
   sT2pmLcLuKvuFqvElrPKXtlQsFvk5/0b1/5H6v/RiHHAJN6cZtsbzG4Bc
   0we6DL2SuhjB0Nfz7sfBROVlRZtd941v1rUEXAHgZcAaRRXfxemWH5+B9
   z6uedy5b0RVi7t2yRXng8GvPHr8Cm3KllosbEqgrV2zcm5Cet3tcL3BJO
   Fbmk7SBxFbFDkzoTZtbJOTXjgSVTcyXMTAMnF5ibpyhi+0/orOyFXkQwi
   w==;
X-CSE-ConnectionGUID: imTcosciSV2yEuWgaflQOQ==
X-CSE-MsgGUID: MOIEsOD2SAWE1KSGKOFJsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70319512"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="70319512"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 06:58:16 -0800
X-CSE-ConnectionGUID: TEiuhvuxRciWAcrGKGfvVQ==
X-CSE-MsgGUID: pMj6s6SHTVauTS8hT+TbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209901413"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 06:58:10 -0800
Date: Tue, 3 Feb 2026 16:58:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Simon Horman <horms@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Chuck Lever <chuck.lever@oracle.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yury Norov <ynorov@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: remove __printf() attribute on
 __ftrace_vbprintk()
Message-ID: <aYINAPJS9zXlUGCw@smile.fi.intel.com>
References: <20260202095834.1328352-1-arnd@kernel.org>
 <202602032036.FQK7gJvV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602032036.FQK7gJvV-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Feb 03, 2026 at 08:12:57PM +0800, kernel test robot wrote:

> kernel test robot noticed the following build warnings:

Yeah, you need to go for the full stack of these calls and mark the bottom one
with __diag() to avoid these warnings. That's my understanding and what BPF people
required. Chasing this one-by-one would produce unneeded churn.

-- 
With Best Regards,
Andy Shevchenko


