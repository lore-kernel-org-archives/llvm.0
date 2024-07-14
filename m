Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA1D51D;
	Sun, 14 Jul 2024 04:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720929609; cv=none; b=JooN3l4TG5pUQFOll1nax+5c9tmoUxWuyojnlWo2gj/qkrTvWeZ3aFUCKr5BbEu8JuR4kt9YpBxvwppIF2zgITS7mq/S21zYgNNOc/fQ814VUlv0Z085qSKpbzGNFLNzMzcJQq3nRp/Ghciix5z3zhSNJPBY3nKJFLi95Wx+Bew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720929609; c=relaxed/simple;
	bh=cCYajcD6NSynkcODow7PH3QgMSrVNxizgfr4nJfOxzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZp0X7mdHf2VSKdkwe4lqUm9yq+gq0N7U70rpMj8bItG9KRZBHoY36ysuTh3RyNEIQ9q2jADlXBI9XmBDEOd2S5OFe2eD02vljnj0+lUrJCiDSxy6X7kOICmVpqjPEHJaUbaF44lJg7mDUBNa/HGM5j7/ZksXYAaCXMkX+P0C64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnsJiqPU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnsJiqPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720929607; x=1752465607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cCYajcD6NSynkcODow7PH3QgMSrVNxizgfr4nJfOxzs=;
  b=gnsJiqPUVKnkomLGjyfwUDDuUBtMhaTL70zXUET0id6XTrB9D9cpYFty
   C3GV/WaZRqheyGR/JCc29D0FIgEujecbdhhmCW+bZNyjvMY/jU2y66DSc
   ta+PwrpMHWDdv/QzgXe8uc4xUhHyhXc5D2FTuTO/2YoJK3qRXVE93IKqU
   h6077CgMel8V+/VZsWj8xnJjrkjz4b8GBvXm21Hujv7kRklhqLpSYvvWn
   PDfuFdG2wh75MUXMi/Yh50Uf8FoFfESE7w34J+tsnn1+J40MEt8TwaGqN
   NzjGOuXoG1ZVhWkmDxaBIRzSAsjzZYyV9GxjMXOWwyPClxW3c5T1kqKAY
   Q==;
X-CSE-ConnectionGUID: kdOobHWhTeS0JBU+PMK2gw==
X-CSE-MsgGUID: UFcYxSh/SJ+UpVsNAV19XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29743262"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="29743262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 21:00:06 -0700
X-CSE-ConnectionGUID: AcDRTHTpT4CKkJ425jtWmQ==
X-CSE-MsgGUID: 3MUrE1aQQBO+JemCa/Efzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="50044986"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jul 2024 20:59:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSqOx-000d1i-25;
	Sun, 14 Jul 2024 03:59:55 +0000
Date: Sun, 14 Jul 2024 11:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Liran Alon <liran.alon@oracle.com>,
	Jan Setje-Eilers <jan.setjeeilers@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>, Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@kernel.org>,
	Khalid Aziz <khalid.aziz@oracle.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Paul Turner <pjt@google.com>, Reiji Watanabe <reijiw@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 10/26] mm: asi: Avoid warning from NMI userspace accesses
 in ASI context
Message-ID: <202407141109.Vpmj3Sze-lkp@intel.com>
References: <20240712-asi-rfc-24-v1-10-144b319a40d8@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-asi-rfc-24-v1-10-144b319a40d8@google.com>

Hi Brendan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/mm-asi-Make-some-utility-functions-noinstr-compatible/20240713-012107
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240712-asi-rfc-24-v1-10-144b319a40d8%40google.com
patch subject: [PATCH 10/26] mm: asi: Avoid warning from NMI userspace accesses in ASI context
config: i386-buildonly-randconfig-004-20240714 (https://download.01.org/0day-ci/archive/20240714/202407141109.Vpmj3Sze-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141109.Vpmj3Sze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141109.Vpmj3Sze-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1329:20: warning: function 'cr3_matches_current_mm' is not needed and will not be emitted [-Wunneeded-internal-declaration]
    1329 | static inline bool cr3_matches_current_mm(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/cr3_matches_current_mm +1329 arch/x86/mm/tlb.c

  1328	
> 1329	static inline bool cr3_matches_current_mm(void)
  1330	{
  1331		struct asi *asi = asi_get_current();
  1332		pgd_t *cr3_pgd;
  1333	
  1334		/*
  1335		 * Prevent read_cr3_pa -> [NMI, asi_exit] -> asi_get_current,
  1336		 * otherwise we might find CR3 pointing to the ASI PGD but not
  1337		 * find a current ASI domain.
  1338		 */
  1339		barrier();
  1340		cr3_pgd = __va(read_cr3_pa());
  1341	
  1342		if (cr3_pgd == current->mm->pgd)
  1343			return true;
  1344		return asi && (cr3_pgd == asi_pgd(asi));
  1345	}
  1346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
