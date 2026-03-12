Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D03346AF;
	Thu, 12 Mar 2026 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346763; cv=none; b=MWP8JvEc6dcqZGjA8VTqBT3JnLG7xy9BzUcu+8cDWr4Wk+14gFb3gwSj/BYQCafo5fcvKW0Z1gC0AQUkIfIfMsz7QSgNrQpqURlFgNccgAnFPeKiTaKQxEqIIodIVL43awIcN/DxLz8oZSOy8EEjvM1Y27myik/6ZEnaHJYkqfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346763; c=relaxed/simple;
	bh=q9i0aNYEP5JbHJFthJWj0hPcbi62cBIHgZdzs8kAjUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toDNTHMV9RC0iRDaVagnEJVryMIWMheUkdIBO46+WMV5OAPbauLxki1ixg1ye+TZ7z6pgWmFXEmbpza47WIGxv03tv+nH/JPiLUsBIk5J2ko56SVcHTccdDtf5B7kU7lrrFtvCQCROXSLMsosoE4hnPwm9njoP0KyJToGJv/iTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCRqgJ/A; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCRqgJ/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773346763; x=1804882763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9i0aNYEP5JbHJFthJWj0hPcbi62cBIHgZdzs8kAjUM=;
  b=lCRqgJ/AQzx8b3wKURQ2AN2oKpuoeQxl2eFKNzEjUaNqi40qhGy7mcH9
   64OvOYUm5aC7Uws0MyVqiA4u/z7Rzvzp9+l9ibwWsZBw8Ny72/cw82t4l
   RQHFyofX1x9+yMPM9RATYYyaaqP1wL+V+KB/HXpEqsMzyGwCo/B0dbcXY
   1+5UbGo+NgfjbSXTOuZQHgyNsBffSjpA3Xm6BDo4ARraH1D1V2MLh6yEB
   H9nXjlmW/WVJxo35wSL1VF0OUlHbgwuRAWIOcPcyRQZ6EWcgfRld+VN+3
   Uq8mnCcgG17oZqaVrShRdNvjAjkKrHmEsBuUCKw3WLepJMlIGgF0G32R5
   Q==;
X-CSE-ConnectionGUID: r4EjijDxS26N526Tv9Z33A==
X-CSE-MsgGUID: ZxEU2aXNRymjYqs18gddKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74335564"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74335564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:19:22 -0700
X-CSE-ConnectionGUID: AYg91w3STzKB947nCvtOpw==
X-CSE-MsgGUID: 631cUlyuSmizJuoqoO5P2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220027894"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2026 13:19:14 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0mUw-000000002wx-3Wq3;
	Thu, 12 Mar 2026 20:19:10 +0000
Date: Fri, 13 Mar 2026 04:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 03/25] mm/percpu: Annotate static information into
 meminspect
Message-ID: <202603130444.K3MmZnxY-lkp@intel.com>
References: <20260311-minidump-v2-v2-3-f91cedc6f99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-minidump-v2-v2-3-f91cedc6f99e@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 343f51842f4ed7143872f3aa116a214a5619a4b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/kernel-Introduce-meminspect/20260311-042334
base:   343f51842f4ed7143872f3aa116a214a5619a4b9
patch link:    https://lore.kernel.org/r/20260311-minidump-v2-v2-3-f91cedc6f99e%40oss.qualcomm.com
patch subject: [PATCH v2 03/25] mm/percpu: Annotate static information into meminspect
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260313/202603130444.K3MmZnxY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d47b695929cc7f85eeb0f87d0189adc04c1c629)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130444.K3MmZnxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130444.K3MmZnxY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/percpu.c:3363:25: error: use of undeclared identifier '__per_cpu_offset'; did you mean '__per_cpu_start'?
    3363 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         |                         ^~~~~~~~~~~~~~~~
         |                         __per_cpu_start
   include/linux/meminspect.h:103:40: note: expanded from macro 'MEMINSPECT_SIMPLE_ENTRY'
     103 |         MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
         |                                               ^~~
   include/linux/meminspect.h:94:19: note: expanded from macro 'MEMINSPECT_ENTRY'
      94 |                 .va = (void *)&(sym),                                           \
         |                                 ^~~
   include/asm-generic/sections.h:42:13: note: '__per_cpu_start' declared here
      42 | extern char __per_cpu_start[], __per_cpu_end[];
         |             ^
>> mm/percpu.c:3363:25: error: use of undeclared identifier '__per_cpu_offset'; did you mean '__per_cpu_start'?
    3363 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         |                         ^~~~~~~~~~~~~~~~
         |                         __per_cpu_start
   include/linux/meminspect.h:103:52: note: expanded from macro 'MEMINSPECT_SIMPLE_ENTRY'
     103 |         MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
         |                                                           ^~~
   include/linux/meminspect.h:95:12: note: expanded from macro 'MEMINSPECT_ENTRY'
      95 |                 .size = (sz),                                                   \
         |                          ^~
   include/asm-generic/sections.h:42:13: note: '__per_cpu_start' declared here
      42 | extern char __per_cpu_start[], __per_cpu_end[];
         |             ^
>> mm/percpu.c:3363:1: error: invalid application of 'sizeof' to an incomplete type 'char[]'
    3363 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/meminspect.h:103:51: note: expanded from macro 'MEMINSPECT_SIMPLE_ENTRY'
     103 |         MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/meminspect.h:95:12: note: expanded from macro 'MEMINSPECT_ENTRY'
      95 |                 .size = (sz),                                                   \
         |                          ^~
   3 errors generated.


vim +3363 mm/percpu.c

  3362	
> 3363	MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
  3364	/*
  3365	 * pcpu_nr_pages - calculate total number of populated backing pages
  3366	 *
  3367	 * This reflects the number of pages populated to back chunks.  Metadata is
  3368	 * excluded in the number exposed in meminfo as the number of backing pages
  3369	 * scales with the number of cpus and can quickly outweigh the memory used for
  3370	 * metadata.  It also keeps this calculation nice and simple.
  3371	 *
  3372	 * RETURNS:
  3373	 * Total number of populated backing pages in use by the allocator.
  3374	 */
  3375	unsigned long pcpu_nr_pages(void)
  3376	{
  3377		return data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;
  3378	}
  3379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
