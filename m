Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5624C79;
	Sun,  9 Jun 2024 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717902582; cv=none; b=SWGdyVAfG4Thqmtj4pvCbq2cbe7j8jH+359MDMNu3zCzITJGOHQeYqlTb13I8jneN134TePrWsEKNZShBWGJL+8LukzMUVCkjSCacrcae/63hn4w4LLARCzxZUODoZ42gzhmjJwt5O2m8quuSZCKbqt/OtL958Lm3Z4jcy+1Y+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717902582; c=relaxed/simple;
	bh=kv8E7meS0VchpCBhCFww8IHwDWtFgD8k0nDXCuh/ESE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amPXFJLGjC7rsFZmIW24lwqRO8DRDVzLyFg2m/QXEFx0Yhk7yBQKTk3PxShkQe75TdI9xfqGzriQR8MPuXf8NHMC4fgL+0Lz5UhiasV0ci5X9o0v7g3sGy6aNawmwk/NfNfniCm1DwnfObsHIzSbDuz/ZViWV4DkpFNG2JMU8z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lsngp5Tc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lsngp5Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717902580; x=1749438580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kv8E7meS0VchpCBhCFww8IHwDWtFgD8k0nDXCuh/ESE=;
  b=Lsngp5TcBoOUcmpyi/1+8hkc+/mIp7XX4elYoHAWEkUv1Me9Q2EJTlYH
   +GGjuEJzIj+njUN/mSyHDDpl2JPecD1UlfRk+XAXs3Z1dpt+DltzbrbMy
   y90VZ5G1nl+gyPl1GKjC/kd5TwxQMd8/8/eneaT8BJldb6z4T2b/7ZVcV
   fCyQwUATu0M8417v/YfWnQKfS3JynefXzAbXNOG3kMtV4B+fzSfo5zoKC
   n3kUv/SxXto4ZG7LBdomjftjkUDBgPD0Py9KL3ewBvFQwC93j2FJ8Pf6G
   gjKdIJqvKg4zqqrFseWK9pY7IGPgRWsZzgElfUhT+mX2/R3XQpGUdWgEe
   g==;
X-CSE-ConnectionGUID: M0DIBFJmReOvrrg8V3uXOg==
X-CSE-MsgGUID: SIx3x8h8S++dIYc2mNzKmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14328885"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14328885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 20:09:39 -0700
X-CSE-ConnectionGUID: W5l7cB0qS9qRN3hMBT8ocA==
X-CSE-MsgGUID: vBhJ/sp7Tn+ds0ICCJbfNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43654344"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jun 2024 20:09:38 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG8w3-0000nW-3C;
	Sun, 09 Jun 2024 03:09:35 +0000
Date: Sun, 9 Jun 2024 11:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 14/20] error: unreachable `pub` item
Message-ID: <202406091152.bphP4HCO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   508348922df19178b613531fb6cc7beb624642ae
commit: 3fa8443d0fca31d3e103e3a2651d2c38904895a2 [14/20] rust: PCI: add BAR request and ioremap
config: x86_64-buildonly-randconfig-005-20240609 (https://download.01.org/0day-ci/archive/20240609/202406091152.bphP4HCO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091152.bphP4HCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091152.bphP4HCO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:68:5
   |
   68 |     pub fn readl_relaxed(&self, offset: usize) -> Result<u32> {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:74:5
   |
   74 |     pub fn readq_relaxed(&self, offset: usize) -> Result<u64> {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:80:5
   |
   80 |     pub fn writeb(&self, byte: u8, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:87:5
   |
   87 |     pub fn writew(&self, word: u16, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:94:5
   |
   94 |     pub fn writel(&self, lword: u32, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:101:5
   |
   101 |     pub fn writeq(&self, qword: u64, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:108:5
   |
   108 |     pub fn writeb_relaxed(&self, byte: u8, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:115:5
   |
   115 |     pub fn writew_relaxed(&self, word: u16, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:122:5
   |
   122 |     pub fn writel_relaxed(&self, lword: u32, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:129:5
   |
   129 |     pub fn writeq_relaxed(&self, qword: u64, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:10:1
   |
   10 | pub struct IoMem {
   | ---^^^^^^^^^^^^^
   | |
   | help: consider restricting its visibility: `pub(crate)`
   |
   = help: or consider exporting it for use by other crates
   = note: requested on the command line with `-D unreachable-pub`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
