Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAE346AFD;
	Tue, 28 Apr 2026 23:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777417905; cv=none; b=MSgsCB1iShRbCR6wRaOTHb3B+QPvUM3nrtvUIWvO6/MyGs9jPfiVmJ0iks6CDMVRDQxlqWvNUcBw4q2vySTLX5Ga7y7BVsxW+8ITPkcNfYMauqYCarTX9tRK77VBpEoDG/EHNWqZga5nStpUElDURnVatx9RWWG6sBGXpJw72Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777417905; c=relaxed/simple;
	bh=mOd1+/pjP+EGTIv5fUtzevodrBcPg1AohOW3V9tki6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XR52Aix8xWpfF6YTod2WBxUNgokzcS8lIiVsC+W5papvJfDxwvZBhqZ8ra3ErWzlE9y3cbZL9SJvG4EwCPkLo7tn/IhYSj1yCU1gtLaaUW0KdG9tn8U1MVZgwW6/hh25u8M0claRcF2Ptm2uskACFd90gAiHVqeWTOLCNWPtXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJtjKkFQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJtjKkFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777417903; x=1808953903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mOd1+/pjP+EGTIv5fUtzevodrBcPg1AohOW3V9tki6k=;
  b=PJtjKkFQGBvbYpqKqA9pWd6ckFB2BMIesRHc6+4DQvuc9t5F3lcCYNDe
   zMX/dVCvYyCp/7tvMA610rwql2e0Jy54czAJWgHuwFcPE08kMCW2K9Ar+
   TCgoufGFFRD4JvT45YOHqeB90CaGt/038cfTfwxsPXwyVt3VwUuElrTmy
   S9RtscIWZxAdUMCEStOXatO7/6Z3/dVJeCxJv3BFU6WBZ3xuz1kIrGS3F
   uqAditlqstSkt/0Ntf6chJowmEL1bXurArsaaRvTOHlunKqD9T4wQxeWU
   o1D2Q7n6eNA/K/ndG2peWluuqGNPMqbFmOAWrpmFD8YTju0kjSqSH1AEc
   A==;
X-CSE-ConnectionGUID: Zqa7npFSRrWAnEsLp3zeOg==
X-CSE-MsgGUID: av2t5UteRyaAqxmXKFRLzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77506574"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="77506574"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 16:11:42 -0700
X-CSE-ConnectionGUID: oJsrIaKiQVyaW2JaRn9r3g==
X-CSE-MsgGUID: PAPkm0WuQcacjzYfPZAOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="233068293"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2026 16:11:39 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHraa-00000000ALU-2Aes;
	Tue, 28 Apr 2026 23:11:36 +0000
Date: Wed, 29 Apr 2026 07:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, badhri@google.com,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
Message-ID: <202604290711.kHqUSJ8v-lkp@intel.com>
References: <20260419213638.38291-2-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419213638.38291-2-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus linus/master next-20260428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/usb-typec-tcpm-replace-strcpy-with-strscpy/20260427-011111
base:   v7.0
patch link:    https://lore.kernel.org/r/20260419213638.38291-2-m32285159%40gmail.com
patch subject: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260429/202604290711.kHqUSJ8v-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290711.kHqUSJ8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290711.kHqUSJ8v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/tcpm/tcpm.c:728:52: error: expected ';' after expression
                   strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
                                                                    ^
                                                                    ;
   1 error generated.


vim +728 drivers/usb/typec/tcpm/tcpm.c

   706	
   707	__printf(2, 0)
   708	static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
   709	{
   710		char tmpbuffer[LOG_BUFFER_ENTRY_SIZE];
   711		u64 ts_nsec = local_clock();
   712		unsigned long rem_nsec;
   713	
   714		mutex_lock(&port->logbuffer_lock);
   715		if (!port->logbuffer[port->logbuffer_head]) {
   716			port->logbuffer[port->logbuffer_head] =
   717					kzalloc(LOG_BUFFER_ENTRY_SIZE, GFP_KERNEL);
   718			if (!port->logbuffer[port->logbuffer_head]) {
   719				mutex_unlock(&port->logbuffer_lock);
   720				return;
   721			}
   722		}
   723	
   724		vsnprintf(tmpbuffer, sizeof(tmpbuffer), fmt, args);
   725	
   726		if (tcpm_log_full(port)) {
   727			port->logbuffer_head = max(port->logbuffer_head - 1, 0);
 > 728			strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
   729		}
   730	
   731		if (port->logbuffer_head < 0 ||
   732		    port->logbuffer_head >= LOG_BUFFER_ENTRIES) {
   733			dev_warn(port->dev,
   734				 "Bad log buffer index %d\n", port->logbuffer_head);
   735			goto abort;
   736		}
   737	
   738		if (!port->logbuffer[port->logbuffer_head]) {
   739			dev_warn(port->dev,
   740				 "Log buffer index %d is NULL\n", port->logbuffer_head);
   741			goto abort;
   742		}
   743	
   744		rem_nsec = do_div(ts_nsec, 1000000000);
   745		scnprintf(port->logbuffer[port->logbuffer_head],
   746			  LOG_BUFFER_ENTRY_SIZE, "[%5lu.%06lu] %s",
   747			  (unsigned long)ts_nsec, rem_nsec / 1000,
   748			  tmpbuffer);
   749		port->logbuffer_head = (port->logbuffer_head + 1) % LOG_BUFFER_ENTRIES;
   750	
   751	abort:
   752		mutex_unlock(&port->logbuffer_lock);
   753	}
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
