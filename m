Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309E117CA1B;
	Tue, 15 Jul 2025 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752583640; cv=none; b=iYp6UcYiq+dK9kYiOn5Oe0L7SpNk2FpafFj+7RNuvjndMNAppifCch8MIVU8lZZOeJ6FcCycWRgUPu2LyQ4rHZUbDBwpkFSc+hLSacjvzPeE2VK6JpxG55JwkuzMHQ+NshPxgQiRYHTWyng0Rjwg7O6GHgcKQXzIZ3v7U7H/CZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752583640; c=relaxed/simple;
	bh=hBc8ff8HOQ5UtD+3Cw+/ByuYTKjMsXhHB0AAQYZuPe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3PDOpX9SyJyL5KQovNBpsj2Wri1q0UdThiRAe8Kj+WlX3aJmJ4Id/uO1tJ75MyJhZB02V24ihMuwBuI8ohnkwqj5LgThDw4slfNf/7Qh/Q6JV7qPxdMhnEJ4+vEaDqilEOOwHiJMth1XJuIIqBsYhhMdPJOjhBXn0GrVNpbG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8DsgzeJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8DsgzeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752583638; x=1784119638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBc8ff8HOQ5UtD+3Cw+/ByuYTKjMsXhHB0AAQYZuPe4=;
  b=A8DsgzeJBfEQL9TROeGYq2DYocwOJhc/OulZfu9PSj25h+6cA45s3Se+
   ynD4N3Vcd6wUMgv0tiJGXYpghZNJsmpgCFZ8rMqfzGzKxFq0KSEzQT/GB
   apSX9tQZWu2tqtRQ3kBCLnuM5WCPwT8kTnmHNaaLm+W99kapjdr6OlKEA
   4SmGmVDkN5F7WdDFJvNy4NArM9luJ6hnRx6FmZNShCI++wM2FzQRUhQC2
   pmEb4ma0m9rI3uFuK08Ffa6JPrnl21vkpBbZ8SldTXJ34sLX9liWfuNjC
   hdvLFfmKVInb0kMa3HSPuDfVZfYzuACxbhhMVEnNUZlkytxWkmIfv1hA0
   A==;
X-CSE-ConnectionGUID: 05raMbMXSzmbkHtVMrKI9A==
X-CSE-MsgGUID: O8ZufkwTThSJQSCY+07wDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72377314"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="72377314"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 05:47:18 -0700
X-CSE-ConnectionGUID: bTOmUedsQVaNXje9djikHw==
X-CSE-MsgGUID: 2WRmLjLCTWe8cqpsnxua1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157721361"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jul 2025 05:47:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubf3s-000A49-0j;
	Tue, 15 Jul 2025 12:47:08 +0000
Date: Tue, 15 Jul 2025 20:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, alok.a.tiwari@oracle.com,
	arnd@arndb.de, bp@alien8.de, corbet@lwn.net,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, kys@microsoft.com,
	mhklinux@outlook.com, mingo@redhat.com, rdunlap@infradead.org,
	tglx@linutronix.de, Tianyu.Lan@microsoft.com, wei.liu@kernel.org,
	linux-arch@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v4 03/16] arch: hyperv: Get/set SynIC
 synth.registers via paravisor
Message-ID: <202507152017.8UNXIbRJ-lkp@intel.com>
References: <20250714221545.5615-4-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714221545.5615-4-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build errors:

[auto build test ERROR on d9016a249be5316ec2476f9947356711e70a16ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/Documentation-hyperv-Confidential-VMBus/20250715-062125
base:   d9016a249be5316ec2476f9947356711e70a16ec
patch link:    https://lore.kernel.org/r/20250714221545.5615-4-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v4 03/16] arch: hyperv: Get/set SynIC synth.registers via paravisor
config: i386-buildonly-randconfig-005-20250715 (https://download.01.org/0day-ci/archive/20250715/202507152017.8UNXIbRJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152017.8UNXIbRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152017.8UNXIbRJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/main.c:5:
   In file included from arch/x86/kvm/vmx/vmx.h:16:
   In file included from arch/x86/kvm/vmx/vmx_ops.h:9:
   In file included from arch/x86/kvm/vmx/vmx_onhyperv.h:7:
   In file included from arch/x86/include/asm/mshyperv.h:345:
>> include/asm-generic/mshyperv.h:377:4: error: call to undeclared function 'hv_para_set_synic_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     377 |                         hv_para_set_synic_register(HV_MSR_EOM, 0);
         |                         ^
   1 error generated.
--
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:9:
   In file included from arch/x86/include/asm/mshyperv.h:345:
>> include/asm-generic/mshyperv.h:377:4: error: call to undeclared function 'hv_para_set_synic_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     377 |                         hv_para_set_synic_register(HV_MSR_EOM, 0);
         |                         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:24:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];


vim +/hv_para_set_synic_register +377 include/asm-generic/mshyperv.h

   344	
   345	/* Free the message slot and signal end-of-message if required */
   346	static inline void vmbus_signal_eom(struct hv_message *msg, u32 old_msg_type)
   347	{
   348		/*
   349		 * On crash we're reading some other CPU's message page and we need
   350		 * to be careful: this other CPU may already had cleared the header
   351		 * and the host may already had delivered some other message there.
   352		 * In case we blindly write msg->header.message_type we're going
   353		 * to lose it. We can still lose a message of the same type but
   354		 * we count on the fact that there can only be one
   355		 * CHANNELMSG_UNLOAD_RESPONSE and we don't care about other messages
   356		 * on crash.
   357		 */
   358		if (cmpxchg(&msg->header.message_type, old_msg_type,
   359			    HVMSG_NONE) != old_msg_type)
   360			return;
   361	
   362		/*
   363		 * The cmxchg() above does an implicit memory barrier to
   364		 * ensure the write to MessageType (ie set to
   365		 * HVMSG_NONE) happens before we read the
   366		 * MessagePending and EOMing. Otherwise, the EOMing
   367		 * will not deliver any more messages since there is
   368		 * no empty slot
   369		 */
   370		if (msg->header.message_flags.msg_pending) {
   371			/*
   372			 * This will cause message queue rescan to
   373			 * possibly deliver another msg from the
   374			 * hypervisor
   375			 */
   376			if (vmbus_is_confidential())
 > 377				hv_para_set_synic_register(HV_MSR_EOM, 0);
   378			else
   379				hv_set_msr(HV_MSR_EOM, 0);
   380		}
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
