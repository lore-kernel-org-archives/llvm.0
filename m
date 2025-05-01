Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED718DB3D;
	Thu,  1 May 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128433; cv=none; b=gYY+q9GKGvjG2EWYY95xxbglOBdTPvNXvVrXeSa+BTZ9yphpXaoXnu9n036pWa/KwtTQycVgZq3cHZl/Q3jCY/CRUMQrTMdajpBNsveL+A67cTQM56BzRcoFauZy5rx5FXgqxgCKiC4UtpPjbT1ECgJfgnPQfUUfgHAwJX0Dgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128433; c=relaxed/simple;
	bh=bU3JMirVRBD0YaRTuXJ71BotKArw/yfnHzLcx+k+Imo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/+LRDTcDPghNOl/eMPcL5yP+W9EM8U5+vxPhBGlmG3N/4KOiLYkppekH+UiuVXtOeJzXTxKVA6ev9CCIYz1Cuccj+gsKINnjLcKe5hOYBYxZyRSFlAgxGfXlYMMWf6ov9hLs0PGymrSQhnYsr2S/74QH23oaXgZQZAtV+0wPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9JVyjZv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9JVyjZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746128432; x=1777664432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bU3JMirVRBD0YaRTuXJ71BotKArw/yfnHzLcx+k+Imo=;
  b=K9JVyjZv0JMBZhig0Lbj9N/doqeOcXQJTFJ7XaD4DYlcEIwVKDsooz/G
   kklDZijNjEJ5jh/YrK3Yno+dbGJ24Ka0F8B3c0TXkB2janl5txtwKKnQD
   Pp5abdd2DH/33UkZCPD0dcIQw1OsKNkamjtKPaZC5tundW0WOkY+c2v7p
   MrxarbIgdc1X4j1XzcoB4n2s7lRlcNuhZeqJWIF1PcFbsHZWNCxF/2PDe
   ulpVYI2PyopaPg4D0AWI7j16IURa5ehsNfABuwe9oC9RtY0iHSeuXztX8
   ndiRUqZQ5sN+tL1YBdgogN64xz0UtNIki2c3Ucf9z9+2xk08/nI50VuX1
   Q==;
X-CSE-ConnectionGUID: ZIrSwKDnTHipW9bLxeyJPQ==
X-CSE-MsgGUID: ZPfUdcVtQUmXy7r4JVnfrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51472785"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="51472785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 12:40:31 -0700
X-CSE-ConnectionGUID: 5SzoFQHqSA+ZpzPMIs5BFg==
X-CSE-MsgGUID: Xd19wmUjRwerWfcCfwm2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134414653"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 May 2025 12:40:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAZld-0004Ll-3B;
	Thu, 01 May 2025 19:40:21 +0000
Date: Fri, 2 May 2025 03:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v14 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Message-ID: <202505020341.ZT3z5hbk-lkp@intel.com>
References: <20250429-v5_user_cfi_series-v14-22-5239410d012a@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-v5_user_cfi_series-v14-22-5239410d012a@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4181f8ad7a1061efed0219951d608d4988302af7]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20250430-082727
base:   4181f8ad7a1061efed0219951d608d4988302af7
patch link:    https://lore.kernel.org/r/20250429-v5_user_cfi_series-v14-22-5239410d012a%40rivosinc.com
patch subject: [PATCH v14 22/27] riscv: enable kernel access to shadow stack memory via FWFT sbi call
config: riscv-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020341.ZT3z5hbk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020341.ZT3z5hbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020341.ZT3z5hbk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: riscv_nousercfi
   >>> referenced by head.S:77 (arch/riscv/kernel/head.S:77)
   >>>               arch/riscv/kernel/head.o:(_start_kernel) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
