Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859111CA9;
	Wed, 24 Apr 2024 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713954972; cv=none; b=UjaYe63o/exzjKzbm7clujIOhBYY10LHpViLpFhTLbc1mBrsa1/IkJ+Q+E4Rtdx8KGXeXbIx7Ao2H5psyyv5jfefHlwilbV6SkF7cariaVX+cgdKzQrG9WpowjAGDcerSc8ECl52GZvFJABLw4ejTyBEY3BX8giD6/NAZUiviDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713954972; c=relaxed/simple;
	bh=AhMX/hyslzMw8bBjd6ZHQRVTIrVOvW9zMAjfNKUs8w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkrPv3K4jyQUTFg9bAOWnE93uRpMyXnAGI20q9qLmowtjSUYofie/BA8qTatG+h6g20Qw2AlOH9wFUJdIhpzw8vU42VA/rgZTOTZBZLv95IwpZyr1rscwjqcocufwXzuXiK4rVajsgLGLsHSLcmKvV+Ro3NvjhvaRfbMoWcU+4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6Dut3xB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6Dut3xB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713954971; x=1745490971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhMX/hyslzMw8bBjd6ZHQRVTIrVOvW9zMAjfNKUs8w8=;
  b=M6Dut3xBdWBpzjdQ/C0CTKZKAy7kq+Zm0+KAUlh0BkJkig04WZgfowAf
   y/D2KSa6PnlNYIy1aYvWDTaACLgNbzoSvKbttIifaF9Tb5inrk7WntmGM
   /2nKjOjkXwUe8pzWywS/vzBDir/+zbgk1gP84BERxRUQXKg+/GjV6QMID
   w9tufivaMwDTJgIrjLgHKcNZ/V6E+uLfHJCFH26z2ePwxuUgC/IwNIOLK
   INMSKbrrsh81HoC7pmk8edtrrDM8ahoGUmdSi99j8FPXF0jdnh99VxdR7
   +TnCctHljtmI+Td7HcI+v+SQuQWaBJohRt2sAb33wutUwhIuxvn9VNAeg
   w==;
X-CSE-ConnectionGUID: /LwqPLLVR8yN90Es48aOfQ==
X-CSE-MsgGUID: 5bXaLMvoS8e/xtAuedh62g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27093041"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27093041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 03:36:10 -0700
X-CSE-ConnectionGUID: CqI+MrDUTP6lvAZGv1zzEw==
X-CSE-MsgGUID: LE4f7Rq1TFG8I4bf11V+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="25278599"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Apr 2024 03:36:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzZyw-000184-2Q;
	Wed, 24 Apr 2024 10:36:06 +0000
Date: Wed, 24 Apr 2024 18:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 11/17] ld.lld: error: undefined symbol:
 __bpf_prog_enter_sleepable_recur
Message-ID: <202404241811.FFV4Bku3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   6e10b6350a67d398c795ac0b93a7bb7103633fe4
commit: eb48f6cd41a0f7803770a76bbffb6bd5b1b2ae2f [11/17] bpf: wq: add bpf_wq_init
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240424/202404241811.FFV4Bku3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241811.FFV4Bku3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241811.FFV4Bku3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bpf_prog_enter_sleepable_recur
   >>> referenced by helpers.c
   >>>               kernel/bpf/helpers.o:(bpf_wq_work) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __bpf_prog_exit_sleepable_recur
   >>> referenced by helpers.c
   >>>               kernel/bpf/helpers.o:(bpf_wq_work) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
