Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7228825;
	Sun, 19 May 2024 06:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716098552; cv=none; b=RXxHntY18rO8glJtwn4NC5kedEPFJ37zKqY+gmEByfZ8KnZTfIGbHlBfFXoSJ644pnNEApG+KqvHZQLGn+FvcZ9cyzCxzySWypCW85G4vRfRK3mdI3wuPf+1Bo0MX/1Eu8II+4WID4MSFfREYAL1H/F/Dij/ea4sK1qPBPbxVcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716098552; c=relaxed/simple;
	bh=FxLwfDtq9X2G3z+3GDiXEtvjyrUj0G6ehXkxsxq0kBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sb8BQUbbhoEFzNf4h5MdLlv31rCr+UvKnyIxfVerOaiyXz3h8e9qBMaLBZmCZje3OvlMHC7LlpHOtoYB5q/wAfFwDMJt3w+PgLwtCbg6TN2MfAYVWq+UpEyCNvRmyC2GCdkfhSryWCyGLGYJzT4CFjeIkjBIfqvyOErUUp+RW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqa5BYqm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqa5BYqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716098550; x=1747634550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxLwfDtq9X2G3z+3GDiXEtvjyrUj0G6ehXkxsxq0kBQ=;
  b=mqa5BYqm0crAIVIDM1zs6GseaD3lxZU+va3XO7v6NKXdrVDT/cLE+pGC
   shpDAS2AsKXOcSPDWXXrx1OVn1m+LqIUd/GZPuvyJbATgS+gXSDmtI10I
   jGUC/Gyf3jFe0ZRcRJWAN9ANwXogGQBJHVTXk/tyIGOw/dEmURyUsOVvv
   xstsi4Raa1tusXK13wV56fJcdXMIRPcLEUA+iZ3IJmwbUOFfAF8XaAWeE
   3es0IFNmLu2RXc4Sp1NFdy9+GiRQX0qcNW0RB4A+ioCNCFFDEbZoW9JfK
   3l4cGzvKi2KnK17IPgBxDKZcm9rIgJ8Vx5yW4kmioF1kp6FRXjMt1pYYx
   Q==;
X-CSE-ConnectionGUID: yIhutZJWSDG8JjXbCtmdUw==
X-CSE-MsgGUID: pbTtgOjsSk+6Y3sUdEgnPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="23385289"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="23385289"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 23:02:30 -0700
X-CSE-ConnectionGUID: G02znX1xTd6NS3ZINPjnLA==
X-CSE-MsgGUID: ZXfofzoxTHq4dKFHlavG/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32119292"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2024 23:02:28 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Zco-0003Ci-20;
	Sun, 19 May 2024 06:02:26 +0000
Date: Sun, 19 May 2024 14:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 11/16] error: unreachable `pub` field
Message-ID: <202405191312.68iyLxvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   440a8db3f583392a1a894f32782ecc397911f9af
commit: c91cc0f1abf0e3de8b46034ab2e15da4860061a7 [11/16] rust: PCI: add BAR request and ioremap
config: x86_64-buildonly-randconfig-001-20240519 (https://download.01.org/0day-ci/archive/20240519/202405191312.68iyLxvG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191312.68iyLxvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191312.68iyLxvG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: struct `IoMem` is never constructed
   --> rust/kernel/iomem.rs:10:12
   |
   10 | pub struct IoMem {
   |            ^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: multiple associated items are never used
   --> rust/kernel/iomem.rs:16:19
   |
   15  | impl IoMem {
   | ---------- associated items in this implementation
   16  |     pub(crate) fn new(ioptr: usize, maxlen: usize) -> Result<Self> {
   |                   ^^^
   ...
   24  |     fn get_io_addr(&self, offset: usize, len: usize) -> Result<usize> {
   |        ^^^^^^^^^^^
   ...
   32  |     pub fn readb(&self, offset: usize) -> Result<u8> {
   |            ^^^^^
   ...
   38  |     pub fn readw(&self, offset: usize) -> Result<u16> {
   |            ^^^^^
   ...
   44  |     pub fn readl(&self, offset: usize) -> Result<u32> {
   |            ^^^^^
   ...
   50  |     pub fn readq(&self, offset: usize) -> Result<u64> {
   |            ^^^^^
   ...
   56  |     pub fn readb_relaxed(&self, offset: usize) -> Result<u8> {
   |            ^^^^^^^^^^^^^
   ...
   62  |     pub fn readw_relaxed(&self, offset: usize) -> Result<u16> {
   |            ^^^^^^^^^^^^^
   ...
   68  |     pub fn readl_relaxed(&self, offset: usize) -> Result<u32> {
   |            ^^^^^^^^^^^^^
   ...
   74  |     pub fn readq_relaxed(&self, offset: usize) -> Result<u64> {
   |            ^^^^^^^^^^^^^
   ...
   80  |     pub fn writeb(&self, byte: u8, offset: usize) -> Result {
   |            ^^^^^^
   ...
   87  |     pub fn writew(&self, word: u16, offset: usize) -> Result {
   |            ^^^^^^
   ...
   94  |     pub fn writel(&self, lword: u32, offset: usize) -> Result {
   |            ^^^^^^
   ...
   101 |     pub fn writeq(&self, qword: u64, offset: usize) -> Result {
   |            ^^^^^^
   ...
   108 |     pub fn writeb_relaxed(&self, byte: u8, offset: usize) -> Result {
   |            ^^^^^^^^^^^^^^
   ...
   115 |     pub fn writew_relaxed(&self, word: u16, offset: usize) -> Result {
   |            ^^^^^^^^^^^^^^
   ...
   122 |     pub fn writel_relaxed(&self, lword: u32, offset: usize) -> Result {
   |            ^^^^^^^^^^^^^^
   ...
   129 |     pub fn writeq_relaxed(&self, qword: u64, offset: usize) -> Result {
   |            ^^^^^^^^^^^^^^
--
>> error: unreachable `pub` field
   --> rust/kernel/iomem.rs:11:5
   |
   11 |     pub ioptr: usize,
   |     ---^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
