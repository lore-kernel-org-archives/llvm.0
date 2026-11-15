Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775495;
	b=Q1DnwCkG3tBZScDjxG15qUxhR8lwg2V1hEOJUCoMT3jauITtbclHnUNIhJJ13TP/MSsh
	 FRmje8lxqIvQ7zZE3tMyz/mdVUDBOrp3eiBetXEiG2mVhRgD+rAfCx9593C6d3zAXEzRB
	 75OU0kXupMphLBwHdiy6EA8vtcN0sPMnqR8Vud+k5yaYoC7Hr/MyrfPmlFSquzCS9RRJm
	 4Xxj6jhg5qtuaoehPdm6ybGdaP7B2NeJ/Lvi7p4WS6VQWyt9cS7xrSDsxutn0A6DUQqXT
	 oS5AQ2G5C1cnq/U0EzZjBLqJgesBfi6xs4khp6EEUCXSIjZfNNurR9tJg3OG/YSK8Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=6H/ZfWTUyIQTMWA2fhwX+YwMOS18lui744hS2pyAkBU=;
	b=DJf/L0MyJd5HPSJiSy4i/l4tpn9uKXXo0QonkuZ5iQqZoUb5pdsVKp5eo/A9ecSEb+s4
	 5kLKQLyuOQ8IDBqzSiEn9Sa9q06EoSi2YGLHAmcSy1HdZCfmC3s/J+bTu8jj6krWkcCO1
	 3wOz3E5MZbtO5Hd8nTNZogZzqPvwSvDuZ7zfgW4KMizTvt23Gx0vgG5AmpzSIoZ1qRzWN
	 JEUBr1z77+Z8Jjwsv+SbDiq8SfYIcetKNt0cWbORtWIQ0w9Pu62gFlqpHlaij5b0bAa/2
	 6I95p28hXOsGTcoEVVcrJ1+BsgsOjTzS1WHuRk2HIQrgufieK7JkVmSHBZDjWI5dYjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DtsfieTp;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F9606A323;
	Sun, 15 Nov 2026 20:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DtsfieTp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794775495; x=1826311495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=t9q7P458xE1DAAzTT8YmArYQrAmOpeaMBGCFeonz75w=;
  b=DtsfieTpAJNA3cXoGhTgVZlOHMBvBSl2HFwYZ/sCxj0XvmQ4+9Xa3QvV
   Hgg8fcxohJdiKEB/+KGPpQ4yX2gY8wgmCxNZE7k01puIUYTlRHrWjTqZS
   NJqUgLAK98HiTRu9dlYCCAPIg3T+aMAXOoWuewN4L6fqOm884lCKBd6Ma
   0lEWHyaup9bJgp2NA1SuXbsfniHJFsaPtJJwmKqxiC3tLLFE2zCiCEx92
   4t3AppP/6WIzTroM1PxJYGjEclpaN/8d1kRBPpvUOwu8bYKsfDfWJUoZt
   b4lc9LtLfkqii+VZozuw3dwso0umYf8w0KohYjlCqWrkYC3IfPGABiNKY
   w==;
X-CSE-ConnectionGUID: XMtk3ca+QwuVDM0N2SrthQ==
X-CSE-MsgGUID: i6GSQyz6SxegZk1har04wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3501652"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3501652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 12:44:55 -0800
X-CSE-ConnectionGUID: tuBMvxGOSPOkyB7OPTsXpA==
X-CSE-MsgGUID: elTB1/WFSOCf9ocxwmlAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9808870"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2026 12:44:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSh5k-000000017Iq-0ij2;
	Sun, 15 Nov 2026 20:44:48 +0000
Date: Mon, 16 Nov 2026 04:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Waiman Long <longman@redhat.com>,
	Ryan Houdek <Sonicadvance1@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-api@vger.kernel.org, kernel-dev@igalia.com,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v8 10/10] futex: Use new robust list API internally
Message-ID: <202611160419.vIdH20Tu-lkp@intel.com>
References: <20261115-tonyk-robust_futex-v8-10-a4fe47333a28@igalia.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261115-tonyk-robust_futex-v8-10-a4fe47333a28@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9f74092fda91ef93c2b07585785c1dc83cd7971f]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20261115-143110
base:   9f74092fda91ef93c2b07585785c1dc83cd7971f
patch link:    https://lore.kernel.org/r/20261115-tonyk-robust_futex-v8-10-a4fe47333a28%40igalia.com
patch subject: [PATCH v8 10/10] futex: Use new robust list API internally
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261116/202611160419.vIdH20Tu-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160419.vIdH20Tu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160419.vIdH20Tu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/syscalls.c:75:6: warning: variable 'head' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      75 |         if (index >= 0) {
         |             ^~~~~~~~~~
   kernel/futex/syscalls.c:85:9: note: uninitialized use occurs here
      85 |         return head;
         |                ^~~~
   kernel/futex/syscalls.c:75:2: note: remove the 'if' if its condition is always true
      75 |         if (index >= 0) {
         |         ^~~~~~~~~~~~~~~
   kernel/futex/syscalls.c:48:19: note: initialize the variable 'head' to silence this warning
      48 |         void __user *head;
         |                          ^
         |                           = NULL
   1 warning generated.


vim +75 kernel/futex/syscalls.c

af8cc9600bbf22 Peter Zijlstra 2021-09-23  44  
5588aabbe40841 André Almeida  2026-11-15  45  static void __user *futex_get_robust_list_common(int pid, bool compat, int index)
6b54082c3ed4dc Pranav Tyagi   2025-09-15  46  {
6b54082c3ed4dc Pranav Tyagi   2025-09-15  47  	struct task_struct *p = current;
6b54082c3ed4dc Pranav Tyagi   2025-09-15  48  	void __user *head;
6b54082c3ed4dc Pranav Tyagi   2025-09-15  49  	int ret;
af8cc9600bbf22 Peter Zijlstra 2021-09-23  50  
a2d2b7acb53d36 André Almeida  2026-11-15  51  	if (index >= FUTEX_ROBUST_LIST2_MAX_IDX)
a2d2b7acb53d36 André Almeida  2026-11-15  52  		return (void __user *)ERR_PTR(-EINVAL);
a2d2b7acb53d36 André Almeida  2026-11-15  53  
6b54082c3ed4dc Pranav Tyagi   2025-09-15  54  	scoped_guard(rcu) {
6b54082c3ed4dc Pranav Tyagi   2025-09-15  55  		if (pid) {
af8cc9600bbf22 Peter Zijlstra 2021-09-23  56  			p = find_task_by_vpid(pid);
af8cc9600bbf22 Peter Zijlstra 2021-09-23  57  			if (!p)
6b54082c3ed4dc Pranav Tyagi   2025-09-15  58  				return (void __user *)ERR_PTR(-ESRCH);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  59  		}
6b54082c3ed4dc Pranav Tyagi   2025-09-15  60  		get_task_struct(p);
af8cc9600bbf22 Peter Zijlstra 2021-09-23  61  	}
af8cc9600bbf22 Peter Zijlstra 2021-09-23  62  
6b54082c3ed4dc Pranav Tyagi   2025-09-15  63  	/*
6b54082c3ed4dc Pranav Tyagi   2025-09-15  64  	 * Hold exec_update_lock to serialize with concurrent exec()
6b54082c3ed4dc Pranav Tyagi   2025-09-15  65  	 * so ptrace_may_access() is checked against stable credentials
6b54082c3ed4dc Pranav Tyagi   2025-09-15  66  	 */
6b54082c3ed4dc Pranav Tyagi   2025-09-15  67  	ret = down_read_killable(&p->signal->exec_update_lock);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  68  	if (ret)
6b54082c3ed4dc Pranav Tyagi   2025-09-15  69  		goto err_put;
6b54082c3ed4dc Pranav Tyagi   2025-09-15  70  
af8cc9600bbf22 Peter Zijlstra 2021-09-23  71  	ret = -EPERM;
af8cc9600bbf22 Peter Zijlstra 2021-09-23  72  	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
af8cc9600bbf22 Peter Zijlstra 2021-09-23  73  		goto err_unlock;
af8cc9600bbf22 Peter Zijlstra 2021-09-23  74  
5588aabbe40841 André Almeida  2026-11-15 @75  	if (index >= 0) {
5588aabbe40841 André Almeida  2026-11-15  76  		scoped_guard(mutex, &p->futex.exit_mutex) {
5588aabbe40841 André Almeida  2026-11-15  77  			uintptr_t *rl = p->futex.robust_lists;
5588aabbe40841 André Almeida  2026-11-15  78  			head = rl ? (void __user *) rl[index] : NULL;
5588aabbe40841 André Almeida  2026-11-15  79  		}
5588aabbe40841 André Almeida  2026-11-15  80  	}
af8cc9600bbf22 Peter Zijlstra 2021-09-23  81  
6b54082c3ed4dc Pranav Tyagi   2025-09-15  82  	up_read(&p->signal->exec_update_lock);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  83  	put_task_struct(p);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  84  
6b54082c3ed4dc Pranav Tyagi   2025-09-15  85  	return head;
af8cc9600bbf22 Peter Zijlstra 2021-09-23  86  
af8cc9600bbf22 Peter Zijlstra 2021-09-23  87  err_unlock:
6b54082c3ed4dc Pranav Tyagi   2025-09-15  88  	up_read(&p->signal->exec_update_lock);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  89  err_put:
6b54082c3ed4dc Pranav Tyagi   2025-09-15  90  	put_task_struct(p);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  91  	return (void __user *)ERR_PTR(ret);
6b54082c3ed4dc Pranav Tyagi   2025-09-15  92  }
af8cc9600bbf22 Peter Zijlstra 2021-09-23  93  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
