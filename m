Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADFD168BD;
	Mon,  9 Sep 2024 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725905806; cv=none; b=VuU54c3pul48/lXytKqojywz1aUo4UHEVYYOayFdv1XZJj8fhpIXVKRVhgzGcu8ALlzQQYgheUJuQogasLuyGJHOOSKTiXyPDzCYPZb9lv7zGUE9ARsnz7AXPoeFy3f7dw3zDHl0YWQvLkXiqom/oS54CBP5yY8OinKmAFQfr/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725905806; c=relaxed/simple;
	bh=1m0BQspKKb5n/ltP/8wT3dNT4FPFncSkzmglJ56qGb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBjQsudftthXrE9xG0ob3fuHkp0KHCYF7uuFDu1FMeTWqJFdtPzG+zXMRZs1YoFt3oWWjflTYycWic9se9PcNj1yFj0UZJELKhLXcxUCd+vxGZDbNMfmLgpzh4OADsol19Zqphe55gCg4QEXIX6amCwOMoC3mix+4+gHWisf8nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuDNc2hT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuDNc2hT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725905804; x=1757441804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1m0BQspKKb5n/ltP/8wT3dNT4FPFncSkzmglJ56qGb0=;
  b=OuDNc2hTakmLR3URw8Bgp8QeUWp6EH01jBA6PZsDR1ZknPYYV6fiXkqk
   YW17Co+j2xSITO0mwDKCRZ8JkgQGS/xkF2C6BNdk9vmcKRX+BLRw1kthU
   v7NthXkTvSczf30YZVf7HWFEMFQTJ1ixza0DaRAXw4Owcp6qFkakhgbvE
   CiW+9Q5pZ31bXv6+s3584OTJl6IAjYFNDoDn0GIUfwP925xa/PZHZQZKT
   OiZmQUPqbKDJNClGAnrc4bHeyN3Pzg2FUkF00Al3Mo7nkiYtA1n36NuvK
   dnEs99rcd9ve7GXzFd9il2/1IrQ3Pm/cq1gImf3sIo0sOLdstOVUWBHek
   A==;
X-CSE-ConnectionGUID: DdNdUcOkRCioDqNoIn4kwQ==
X-CSE-MsgGUID: QAp/4i+eTzmrYOqAgltfpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50030304"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="50030304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 11:16:44 -0700
X-CSE-ConnectionGUID: /SaHwF5XTIaCTUKM+f+PNw==
X-CSE-MsgGUID: oAwhcFZyQMSixJv3A6T5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71540158"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Sep 2024 11:16:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sniwK-000F43-2E;
	Mon, 09 Sep 2024 18:16:40 +0000
Date: Tue, 10 Sep 2024 02:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 209/258]
 include/linux/pipe_fs_i.h:274:15: warning: declaration of 'struct iov_iter'
 will not be visible outside of this function
Message-ID: <202409100217.UMwAi0cW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 79e9f469b262e253396d71d7af0945da30a61cd0 [209/258] bcachefs: convert thread_with_stdio to pipes WIP
config: i386-buildonly-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100217.UMwAi0cW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100217.UMwAi0cW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100217.UMwAi0cW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/tls/tls_sw.c:42:
   In file included from include/linux/splice.h:12:
>> include/linux/pipe_fs_i.h:274:15: warning: declaration of 'struct iov_iter' will not be visible outside of this function [-Wvisibility]
     274 |                      struct iov_iter *to,
         |                             ^
   include/linux/pipe_fs_i.h:277:16: warning: declaration of 'struct iov_iter' will not be visible outside of this function [-Wvisibility]
     277 |                       struct iov_iter *to,
         |                              ^
   2 warnings generated.


vim +274 include/linux/pipe_fs_i.h

   272	
   273	ssize_t do_pipe_read(struct pipe_inode_info *pipe,
 > 274			     struct iov_iter *to,
   275			     bool nonblock);
   276	ssize_t do_pipe_write(struct pipe_inode_info *pipe,
   277			      struct iov_iter *to,
   278			      bool nonblock,
   279			      bool is_packetized);
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
