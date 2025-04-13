Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99E11A2564;
	Sun, 13 Apr 2025 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744556472; cv=none; b=N9p+RNty75Y/YgMzl0wwE/RLjbpnoCu75pCmOfJl/sNpUZifw7tVE5hKMNnvNB6kM51k28D1lt33oQYSyMsSrhFRM6e8tGzCiXj4rP/+YHXOxixXpmY6WjM0KplNzOIhdAWD/cIqTGe6Q/6onmCFVV+74MQ1HRBdPkLS2WayTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744556472; c=relaxed/simple;
	bh=MLCahKN631+WNkldw2jLxaUYbwf6sXr69XSXOpUPgdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFzJRc2M/K5EQvHtuXlP3Hr3j0gtBD+yAcRTWLGkRgG2ElavY9WxYuKSvZart6ZlYlINEmoE347ujTrv8VSJlJLHiTNJMnwj5qsgS9onldQgoj71sOogp+9mRSjziBVCQZWHYKANbeTPoR9/UpSNiqLmVRrn0lGJ45PnOCjzTS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A71C1063;
	Sun, 13 Apr 2025 08:01:01 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 045333F66E;
	Sun, 13 Apr 2025 08:01:00 -0700 (PDT)
Date: Sun, 13 Apr 2025 16:00:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [rafael-pm:bleeding-edge 44/52]
 drivers/cpuidle/cpuidle-psci.c:437:54: error: expected identifier
Message-ID: <20250413-brawny-certain-bullmastiff-da71fa@sudeepholla>
References: <202504121050.dgHmFeWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504121050.dgHmFeWe-lkp@intel.com>

Hi Rafael,

On Sat, Apr 12, 2025 at 10:36:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
> 

[...]

> >> drivers/cpuidle/cpuidle-psci.c:437:54: error: expected identifier
>      437 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
>          |                                                      ^
>    include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
>        8 | #define NULL ((void *)0)
>          |              ^
> >> drivers/cpuidle/cpuidle-psci.c:437:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
>      437 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
>          | ^
>          | int
> >> drivers/cpuidle/cpuidle-psci.c:437:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>      437 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
>          |                   ^                                            
>          |                                                                void
>    3 errors generated.
> 
> 
> vim +437 drivers/cpuidle/cpuidle-psci.c
> 
>    436	
>  > 437	module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
> 

I think you asked me correctly on v1 [1] to pick up, but I assume with
patchwork, may be you picked up v2 instead. The link in the commit log is
pointing at v2.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20250317-plat2faux_dev-v1-1-5fe67c085ad5@arm.com/
