Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA429AB;
	Sun,  2 Jun 2024 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717296098; cv=none; b=EPyIh8+o+poR7HZq+8g7x4WAmpeWfaAx68SksWGtnzp1sFZSsSzUapf+rG1uleINIc85OPdpiGJWHPXzF60z8vuC/NuPEsQbdiSP9iMTMwJqUy3gIvYKqItJOcc8fR/WBrhL0tmv1j3K2nsbbQuZrRxhHpbKHTTe+qAkgwhRgGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717296098; c=relaxed/simple;
	bh=hI6dbiU1rqTCiMQRgVV4gF0ZgAVBLm1HMDlsacErdqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmUErdWlt8YwrvSuJxvMAUT//61xzHMhkpMdAco7GKwJkQE/iNxOj3cSWIS5a8RAR8jkfchg/rm3XV8lBuIiAIJc2jBaP4/yu8neGEdMF7xj22EdYXDtIJX8Ln2FQUQOo8peNzH9V/gIcYLITDxpddEfD3cv6SDgOdezq+RCP9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcVcVHPF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcVcVHPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717296096; x=1748832096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hI6dbiU1rqTCiMQRgVV4gF0ZgAVBLm1HMDlsacErdqs=;
  b=LcVcVHPFMCo8IT8v884p4setG+KIPBYd9Jebsn23tC0ExoSmy/mpg91B
   SU42DfzMpPkDrc9lluccJmxwQDu17BIXq2s+fUaDCx+REG+cyDnePqZIU
   Uq7MyF03Ia77o87GvBbCVdbmOjXuOo5DNam1+TPg1zDraDd5Qw72+hJ/T
   dZFYR6Je3VvuoyGawKZeetPVI8oi1BK7A8atGDSpKUvTW5u8NIJxBdYmt
   gjgQ8tzkBxwVOL3wNj3Z4uLgHsiw2CdAOhej4ftS3ljD9RFiEvYzq/jeZ
   Dfn6Kvm2TVYSQcDLLXFc4+rVE0vxYQOTR0AZSgkJZ5Q+jzhpY8DZ3i7RX
   Q==;
X-CSE-ConnectionGUID: XJcv9W/VRp6HnbIX4IK1ig==
X-CSE-MsgGUID: V59AbYQ3T9CGaKZUQ4tRsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="16762260"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="16762260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 19:41:35 -0700
X-CSE-ConnectionGUID: +Fqrwv7KR+SG0mNpQQwGHw==
X-CSE-MsgGUID: oSa5cvoCSrSczJ/Sbxn4qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="67374089"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2024 19:41:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDbA2-000JcB-03;
	Sun, 02 Jun 2024 02:41:30 +0000
Date: Sun, 2 Jun 2024 10:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Radu Sabau <radu.sabau@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 1/2] hwmon: Add PEC attribute support to hardware
 monitoring core
Message-ID: <202406021014.ieYpV47a-lkp@intel.com>
References: <20240531084645.12935-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531084645.12935-1-radu.sabau@analog.com>

Hi Radu,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Sabau/drivers-hwmon-max31827-Add-PEC-support/20240531-165035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240531084645.12935-1-radu.sabau%40analog.com
patch subject: [PATCH v6 1/2] hwmon: Add PEC attribute support to hardware monitoring core
config: hexagon-alldefconfig (https://download.01.org/0day-ci/archive/20240602/202406021014.ieYpV47a-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406021014.ieYpV47a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406021014.ieYpV47a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/hwmon.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/hwmon/hwmon.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/hwmon/hwmon.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/hwmon/hwmon.c:400:7: error: call to undeclared function 'i2c_check_functionality'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
               !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
                ^
   6 warnings and 1 error generated.


vim +/i2c_check_functionality +400 drivers/hwmon/hwmon.c

   393	
   394	static int hwmon_pec_register(struct device *hdev)
   395	{
   396		struct i2c_client *client = i2c_verify_client(hdev->parent);
   397		int err;
   398	
   399		if (!client ||
 > 400		    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
   401			return 0;
   402	
   403		err = device_create_file(&client->dev, &dev_attr_pec);
   404		if (err)
   405			return err;
   406	
   407		return devm_add_action_or_reset(hdev, hwmon_remove_pec, &client->dev);
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
