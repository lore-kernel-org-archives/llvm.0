Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F32580FD;
	Mon, 12 May 2025 23:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747093299; cv=none; b=pLeqhdTqLRH1iSPQRum7A26EGnIrrv9eQQfag2gUg0K4TlNWzMy0mPfXIe+saAG0EJlk6z9UVgR7z0irYt4XcFjhIaXPvnzXF6aXaaJy5e/64aSVLYrDoDj0PauC2lm7n88fEFJvY6oI4vdQIKhceBlmjXuGSw8OW8NZB4xPe1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747093299; c=relaxed/simple;
	bh=wcj13w4TVjv787CkGQN4QQuKoHWG8W/gt1HFU6O5c08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SE3jpcWIK6+2PdKyppzw8muWd/BurAsh6jQbLoQeEDuTBpxlKp3dyQ367X95XqXMSVRDCMcPy0exIP5MRg4kZQH+0RdXUigbvo2tyfzBOQW5IMnB2TeL0Q+IISlrg3mIXuFE0+Zgmb9m86v0eV03yX+ACOmwTOaRl04vKv1BwqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmmLyAHm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmmLyAHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747093297; x=1778629297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcj13w4TVjv787CkGQN4QQuKoHWG8W/gt1HFU6O5c08=;
  b=mmmLyAHmUUbCP4dACW4HnIByFT1sDGzM1LY3gMN/u/RKhLR0XT2wgmst
   0mHawFEjTunhXL5kj5G+WjRbm4sl/xECBSwWk6ftTOquMRhgSZFRCjvtv
   LFGwMA3JvmBkThi9nyuwmcinXMX/Ulv7cUlv3pFGGsOtJJNulnmYhwlTU
   YnNMW2QaopRxlMZ2XwzFfYzVBJri5DAUTm0dW4F4GJAoa+/LGZNafTJHP
   HHqNEghZBwMfZX6M4J6bb7BaNhCwrxF4D9NxXLiFf8tSs3Z2XbKp0Qod2
   vDOZlSmvT3OMDL7geMhJFWkyMTrSYwXJkKjgWst0AiQNJ6Fn6GN3KZvM+
   A==;
X-CSE-ConnectionGUID: Ik//Ukp0QOaKI0SLUpTzVA==
X-CSE-MsgGUID: Vz2vv9hyQEKtw9PsLD9yAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59142714"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="59142714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 16:41:36 -0700
X-CSE-ConnectionGUID: vDvMv2BlRV+ip9qt0WzIhA==
X-CSE-MsgGUID: P9RoDDUXQ+iSr81g94CSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137540390"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2025 16:41:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEcm4-000FWZ-37;
	Mon, 12 May 2025 23:41:32 +0000
Date: Tue, 13 May 2025 07:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Carlos Song <carlos.song@nxp.com>
Subject: [andi-shyti:i2c/i2c-host-next 51/54]
 drivers/i2c/busses/i2c-imx-lpi2c.c:207:2: warning: expression result unused
Message-ID: <202505130735.zh3WuTNu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   6fa92cdd693b8ea056fba482afee567a7c81fc97
commit: c6ab35c95a2ff3dbc87d08115657f9ed943bbbda [51/54] i2c: lpi2c: implement master_xfer_atomic callback
config: arm-randconfig-004-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130735.zh3WuTNu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130735.zh3WuTNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130735.zh3WuTNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx-lpi2c.c:207:2: warning: expression result unused [-Wunused-value]
           lpi2c_imx_read_msr_poll_timeout(atomic, temp, temp & (MSR_ALF | MSR_BBF | MSR_MBF), 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:194:5: note: expanded from macro 'lpi2c_imx_read_msr_poll_timeout'
                     readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val, cond,  \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:170:2: note: expanded from macro 'readl_poll_timeout'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:135:2: note: expanded from macro 'readx_poll_timeout'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:58:15: note: expanded from macro 'read_poll_timeout'
           (cond) ? 0 : -ETIMEDOUT; \
                        ^~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:267:2: warning: expression result unused [-Wunused-value]
           lpi2c_imx_read_msr_poll_timeout(atomic, temp, temp & MSR_SDF, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:194:5: note: expanded from macro 'lpi2c_imx_read_msr_poll_timeout'
                     readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val, cond,  \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:170:2: note: expanded from macro 'readl_poll_timeout'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:135:2: note: expanded from macro 'readx_poll_timeout'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:58:15: note: expanded from macro 'read_poll_timeout'
           (cond) ? 0 : -ETIMEDOUT; \
                        ^~~~~~~~~~
   2 warnings generated.


vim +207 drivers/i2c/busses/i2c-imx-lpi2c.c

   202	
   203	static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
   204	{
   205		unsigned int temp;
   206	
 > 207		lpi2c_imx_read_msr_poll_timeout(atomic, temp, temp & (MSR_ALF | MSR_BBF | MSR_MBF), 1);
   208	
   209		/* check for arbitration lost, clear if set */
   210		if (temp & MSR_ALF) {
   211			writel(temp, lpi2c_imx->base + LPI2C_MSR);
   212			return -EAGAIN;
   213		}
   214	
   215		/* check for bus not busy */
   216		if (!(temp & (MSR_BBF | MSR_MBF))) {
   217			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
   218			if (lpi2c_imx->adapter.bus_recovery_info)
   219				i2c_recover_bus(&lpi2c_imx->adapter);
   220			return -ETIMEDOUT;
   221		}
   222	
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
