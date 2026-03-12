Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ACB34D389;
	Thu, 12 Mar 2026 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325786; cv=none; b=WZ2Lw73KJnaDVIHuWP3L4IKINDL2wcEDjrWDAHk8MyIbBwAiTo626gw2vu+IKc8HOYcqDjLFMUj6Js/ou5wCs2XfV26HM/a7SNn2C6YHNKYWdaQt2ZiNXyG4LiSttchtxtXJvypSs2f8dYJ1mX48Ct5Fd3QEb7Bp3j1LxqVtpQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325786; c=relaxed/simple;
	bh=U6h2kSkaL3m+HufZ+v4XEQzA63uvN0k+ygU09TQOjv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4NOtCvTnItaoRn2V5P5Db140SfD2V2Rn3jQ912u8MXdHz5a0N9EAq2Euk+cR/y38oIIoY4CEv9ei9uJk5ZxwQfieXR2aylruyrs/GAYHSDCGfmiWdoUNMnkj3W1rTL1R6qJq7dRY+gQTKnNexVjRbW5tIiJ/aGeJQkogcMcUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJv1cXJS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJv1cXJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773325785; x=1804861785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U6h2kSkaL3m+HufZ+v4XEQzA63uvN0k+ygU09TQOjv8=;
  b=UJv1cXJSNNejbkrLFZ0oFtzI1i5LdqpJcftwqg3rJZenR0miCusccBMh
   z737S+LCf/JL3FsGKiq1iiE7DFoeD9UDPBoYRLyigCiizD+2oZgASgfrM
   x7IMwEk9pcAAESvZGzsDx1yVqRJysXyaOWheXl37nHl7h3wGnAHiwnbag
   Er+XdAvo+yiNdSE6JX+1lDUraJ4A/lVDFvfOJBbVViB61qr+nCHAQDuHD
   CN0pI/N/P9bGD806qF9GsRw5lkakjRaZpNX8kdXnslxbreMnqEE7G/Nzd
   s1dW5lWJusqRtaDttdKbDToiffyxMvGxFqYkwwbLTb7+y38/SJ5Xddj4r
   g==;
X-CSE-ConnectionGUID: 3+/cNA7PQSOnsx8Dokbo8A==
X-CSE-MsgGUID: lDUOJrbtQzScvo0YYkenww==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85773984"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85773984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:29:44 -0700
X-CSE-ConnectionGUID: 4MKoUK6kRgGlaA8Dhfivaw==
X-CSE-MsgGUID: 5lbBIi/WTwK4sairjG9Ekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="218641912"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2026 07:29:38 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0h2c-000000002Yj-1R2Q;
	Thu, 12 Mar 2026 14:29:34 +0000
Date: Thu, 12 Mar 2026 22:28:35 +0800
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
Subject: Re: [PATCH v2 13/25] mm/init-mm: Annotate static information into
 meminspect
Message-ID: <202603122259.3cXlDDN9-lkp@intel.com>
References: <20260311-minidump-v2-v2-13-f91cedc6f99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-minidump-v2-v2-13-f91cedc6f99e@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 343f51842f4ed7143872f3aa116a214a5619a4b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/kernel-Introduce-meminspect/20260311-042334
base:   343f51842f4ed7143872f3aa116a214a5619a4b9
patch link:    https://lore.kernel.org/r/20260311-minidump-v2-v2-13-f91cedc6f99e%40oss.qualcomm.com
patch subject: [PATCH v2 13/25] mm/init-mm: Annotate static information into meminspect
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603122259.3cXlDDN9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603122259.3cXlDDN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603122259.3cXlDDN9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/init-mm.c:23:23: error: use of undeclared identifier '_sinittext'
      23 | MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
         |                       ^
>> mm/init-mm.c:24:23: error: use of undeclared identifier '_einittext'
      24 | MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
         |                       ^
>> mm/init-mm.c:25:23: error: use of undeclared identifier '_end'
      25 | MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
         |                       ^
>> mm/init-mm.c:26:23: error: use of undeclared identifier '_text'
      26 | MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
         |                       ^
>> mm/init-mm.c:27:23: error: use of undeclared identifier '_stext'
      27 | MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
         |                       ^
>> mm/init-mm.c:28:23: error: use of undeclared identifier '_etext'
      28 | MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
         |                       ^
   6 errors generated.


vim +/_sinittext +23 mm/init-mm.c

    22	
  > 23	MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
  > 24	MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
  > 25	MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
  > 26	MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
  > 27	MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
  > 28	MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
