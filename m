Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43113148B9;
	Thu, 23 Oct 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231414; cv=none; b=bwnuA2iJsVK+eRoE00vxHjdqHu1c7wRAgmFQtiMuyRuJS5//sPwcd09r8s7eZ7hBgCqi2hUlQxSoJfhL7xINUbijQ38C4HK04bodmB87oQP+4hEONDv1bE/uoFUTDzydcv6WkPncggMY6is7lbQOCqkMHsC6RQFf/csYEkGz+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231414; c=relaxed/simple;
	bh=zl4EQVxMwdi+82iMAbep7c4uBdcXNrgCGiikKHak4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvPLZamWfxR7J+FagHhQVZKsxvsT3til5LMnRzY1Qiz1mEbJIkiQ2kO4JTFf080NZEtyP4uKnQRsoHUl61ZRxXcZhJ1wPpH3EyPweDJezYrcqNgDpXeIpz/4MVIIynePRl4Vn5Ku4dS653jDJ8OGdW4Hq47ki2KBfsgWCLhbeAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jpc0f1Vc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpc0f1Vc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761231413; x=1792767413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zl4EQVxMwdi+82iMAbep7c4uBdcXNrgCGiikKHak4aw=;
  b=Jpc0f1VcEkb2sKsC2eaDFVa7PaujfYpMIX7qRJnLaIfJGyLeWouZOCI0
   8japSk2kbrEGp2JD6jrB6e2UoyZSArVhDGZNR+l6ijgWoSphEhLrQYaEk
   e9Lr1pNzhrGus7STPbKq10udWRJEBBc/ArlAcQZsXL1v36aS9aDU9AbRa
   SCrNkyA0rjhpTnTv1r47auPz5hYbF60D9AKvDT61ChO5s/yUdERCGymIY
   ofHv9Yn9/VTPaqRMUYBvvIxigrdeEKSew4VKhbkVNz7yK9tJEGpG281LC
   t3vdwSpRYoWIHGgYEBf9Cf922NE//kdFy3rW9N+eOVIyu5I4M+D5Gdax9
   w==;
X-CSE-ConnectionGUID: 3g0AmY6cTTOuAcpT2TFpAA==
X-CSE-MsgGUID: LC9BL6V8Tke8KlR47LbDow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63440940"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63440940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 07:56:53 -0700
X-CSE-ConnectionGUID: 2E8E/w0eTHehMuPPPocNfw==
X-CSE-MsgGUID: 3DMf3RxjSzeaj3/3U3f73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="188571864"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2025 07:56:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBwk7-000DbB-1r;
	Thu, 23 Oct 2025 14:56:43 +0000
Date: Thu, 23 Oct 2025 22:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	linux-cxl@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Xiaofei Tan <tanxiaofei@huawei.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>, Xin Li <xin@zytor.com>
Subject: Re: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Message-ID: <202510232204.7aYBpl7h-lkp@intel.com>
References: <20251023122612.1326748-4-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023122612.1326748-4-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on 552c50713f273b494ac6c77052032a49bc9255e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251023-202846
base:   552c50713f273b494ac6c77052032a49bc9255e2
patch link:    https://lore.kernel.org/r/20251023122612.1326748-4-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
config: x86_64-buildonly-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232204.7aYBpl7h-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232204.7aYBpl7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.7aYBpl7h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cper_severity_to_aer
   >>> referenced by ghes.c:626 (drivers/acpi/apei/ghes.c:626)
   >>>               drivers/acpi/apei/ghes.o:(ghes_do_proc) in archive vmlinux.a
   >>> referenced by ghes.c:753 (drivers/acpi/apei/ghes.c:753)
   >>>               drivers/acpi/apei/ghes.o:(ghes_do_proc) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: aer_recover_queue
   >>> referenced by ghes.c:642 (drivers/acpi/apei/ghes.c:642)
   >>>               drivers/acpi/apei/ghes.o:(ghes_do_proc) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_APEI_PCIEAER
   Depends on [n]: ACPI [=y] && ACPI_APEI [=y] && PCIEAER [=n]
   Selected by [y]:
   - ACPI_APEI_GHES [=y] && ACPI [=y] && ACPI_APEI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
