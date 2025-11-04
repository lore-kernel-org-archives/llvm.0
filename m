Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F02BB1D;
	Tue,  4 Nov 2025 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228002; cv=none; b=JFvk77POEFoYksMA4S+KnmZw/V0DPePpS6YdSF3LdpnIagDMc2lPSsGomHTXjTllIJV56ZMqKTNv+VInHNPX7Gt20hw6yUajFGA8vJDq8H69D7IE9xBgDs4HaADqNqT207SkgxniJ7qEaZl+rrdakYA1RSIemNQClUjTfsmn424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228002; c=relaxed/simple;
	bh=vhJ5Druyh/SewtsdkX3BnZDpBB+KY6ERZo+upDIZC6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIaZMAbWUAFdAm1kPbfd5aGgmZSuOYevhXBvXND3wVJSnLzu7Y6PV/LaLw/OmVpLf1qFfsEDrX9j2KRYTM7PJbqLOuPCVYkx5mYcHGkLKEli2kfefE+WjxlqjTAoi095/bCj4imaZcbyf1nSk6bBsuO3M9+X8XQrvt1UVu6KzuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bga/dTZz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bga/dTZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762227999; x=1793763999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhJ5Druyh/SewtsdkX3BnZDpBB+KY6ERZo+upDIZC6I=;
  b=bga/dTZzNv/r9QyKkHV9rD6br4UotJC3x76iCrc1ke//Wwai+azeM1hf
   hpjdyhXJb+jm/EXPehW/Mj3s+llPmo2+r4v0r413JwxdWoD9B7FaMqkqz
   hkosbNyoMN454exyMLeHohgfRNYHRojCril/1MS9TipK3gEq9z7SHheiR
   UcmRaW2eO9msDM1BSQSZfDfBsyD3CPeNcOVBqGZ5KptnYd5r7RuHfipFA
   gMzolKSB/ZOeJmvB5m0yrhQf1W7BwaJWtHiIKcgBEYCSvloMbs3dyOJWz
   FdJq/Gic4cRnyriNHOPKKALwOipa9M0X5GchQSSTZtL5Kk4AF9BIJRyCS
   w==;
X-CSE-ConnectionGUID: MH40lpH2SD6qf4UszmyuDA==
X-CSE-MsgGUID: Dw9a28BHTLWt7puH5vP0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64232144"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64232144"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 19:46:39 -0800
X-CSE-ConnectionGUID: fJmA6CTDThCb/Msigxg+jw==
X-CSE-MsgGUID: P6w88pgcSXGWWUHSRQblyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186904544"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2025 19:46:35 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG7zz-000QpU-0C;
	Tue, 04 Nov 2025 03:46:28 +0000
Date: Tue, 4 Nov 2025 11:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: niravkumarlaxmidas.rabara@altera.com, dinguyen@kernel.org,
	matthew.gerlach@altera.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bp@alien8.de, tony.luck@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Subject: Re: [PATCH 4/6] EDAC/altera: Add IO96B ECC support for Agilex5
 SoCFPGA
Message-ID: <202511041157.q0be68K1-lkp@intel.com>
References: <20251028092232.773991-5-niravkumarlaxmidas.rabara@altera.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028092232.773991-5-niravkumarlaxmidas.rabara@altera.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on robh/for-next linus/master v6.18-rc4 next-20251103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/niravkumarlaxmidas-rabara-altera-com/dt-bindings-edac-altera-Document-additional-ECC-instances/20251028-173250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20251028092232.773991-5-niravkumarlaxmidas.rabara%40altera.com
patch subject: [PATCH 4/6] EDAC/altera: Add IO96B ECC support for Agilex5 SoCFPGA
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251104/202511041157.q0be68K1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041157.q0be68K1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041157.q0be68K1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/altera_edac.c:1957:25: warning: variable 'err_word0' is uninitialized when used here [-Wuninitialized]
    1957 |                 err_queue_overflow = (err_word0 & GENMASK(9, 6)) >> 6;
         |                                       ^~~~~~~~~
   drivers/edac/altera_edac.c:1916:15: note: initialize the variable 'err_word0' to silence this warning
    1916 |         u32 err_word0;
         |                      ^
         |                       = 0
>> drivers/edac/altera_edac.c:1963:41: warning: variable 'err_word1' is uninitialized when used here [-Wuninitialized]
    1963 |                               dci->edac_dev_name, err_word0, err_word1);
         |                                                              ^~~~~~~~~
   drivers/edac/altera_edac.c:1917:15: note: initialize the variable 'err_word1' to silence this warning
    1917 |         u32 err_word1;
         |                      ^
         |                       = 0
>> drivers/edac/altera_edac.c:1958:7: warning: variable 'error_type' is uninitialized when used here [-Wuninitialized]
    1958 |                 if (error_type == ECC_SINGLE_DBE || error_type == ECC_MULTI_DBE ||
         |                     ^~~~~~~~~~
   drivers/edac/altera_edac.c:1923:2: note: variable 'error_type' is declared here
    1923 |         enum io96b_error_type error_type;
         |         ^
   3 warnings generated.


vim +/err_word0 +1957 drivers/edac/altera_edac.c

  1912	
  1913	static irqreturn_t io96b_irq_handler(int irq, void *dev_id)
  1914	{
  1915		struct altr_edac_device_dev *dci = dev_id;
  1916		u32 err_word0;
  1917		u32 err_word1;
  1918		u32 cnt = 0;
  1919		u32 ecc_error_status;
  1920		u16 err_queue_overflow;
  1921		u16 err_count = 0;
  1922		bool dbe = false;
  1923		enum io96b_error_type error_type;
  1924		u32 err_queue = IO96B_ECC_ERR_ENTRIES_OFST;
  1925	
  1926		ecc_error_status = readl(dci->base + IO96B_ECC_ERR_REG_OFST);
  1927		err_queue_overflow = ecc_error_status & GENMASK(31, 16);
  1928		err_count = ecc_error_status & GENMASK(15, 0);
  1929	
  1930		if (!err_queue_overflow) {
  1931			while (cnt < err_count) {
  1932				err_word0 = readl(dci->base + err_queue);
  1933				err_word1 = readl(dci->base + (err_queue + 4));
  1934	
  1935				error_type = (err_word0 & GENMASK(9, 6)) >> 6;
  1936				if (error_type == ECC_SINGLE_DBE || error_type == ECC_MULTI_DBE ||
  1937				    error_type == ECC_WRITE_LINK_DBE ||
  1938				    error_type == ECC_READ_LINK_DBE ||
  1939				    error_type == ECC_READ_LINK_RMW_DBE) {
  1940					edac_printk(KERN_ERR, EDAC_DEVICE,
  1941						    "%s: DBE: word0:0x%08X, word1:0x%08X\n",
  1942						    dci->edac_dev_name, err_word0, err_word1);
  1943					dbe = true;
  1944				} else {
  1945					edac_printk(KERN_ERR, EDAC_DEVICE,
  1946						    "%s: SBE: word0:0x%08X, word1:0x%08X\n",
  1947						    dci->edac_dev_name, err_word0, err_word1);
  1948					edac_device_handle_ce(dci->edac_dev, 0, 0,
  1949							      dci->edac_dev_name);
  1950				}
  1951				cnt++;
  1952				err_queue += 8;
  1953			}
  1954			if (dbe)
  1955				panic("\nEDAC:IO96B[Uncorrectable errors]\n");
  1956		} else {
> 1957			err_queue_overflow = (err_word0 & GENMASK(9, 6)) >> 6;
> 1958			if (error_type == ECC_SINGLE_DBE || error_type == ECC_MULTI_DBE ||
  1959			    error_type == ECC_WRITE_LINK_DBE ||
  1960			    error_type == ECC_READ_LINK_DBE ||
  1961			    error_type == ECC_READ_LINK_RMW_DBE) {
  1962				panic("\nEDAC: UE: %s: word0:0x%08X, word1:0x%08X\n",
> 1963				      dci->edac_dev_name, err_word0, err_word1);
  1964			} else {
  1965				edac_printk(KERN_ERR, EDAC_DEVICE,
  1966					    "%s: Buffer Overflow SBE:0x%08X\n",
  1967					    dci->edac_dev_name, err_queue_overflow);
  1968				edac_device_handle_ce(dci->edac_dev, 0, 0, dci->edac_dev_name);
  1969			}
  1970		}
  1971	
  1972		//Clear Queue
  1973		writel(IO96B_ECC_ERROR_QUEUE_CLEAR, dci->base + IO96B_CMD_REQ_OFST);
  1974		return IRQ_HANDLED;
  1975	}
  1976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
