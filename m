Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA020B81F;
	Thu, 23 Jan 2025 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737620002; cv=none; b=kHOQcY+BF/BiHypUBsScGJBb55sBByzGgmRSZfUDsuamFcgprt6egfoL+jAtkNf16s+xAF3AXvYb6cF30H0aAovxB9LFm5Wlx0gsEy7B45WzOpPm9OHlIIJx2A9EvtfPBxqVeId7INCqUkaJOYKYmnzE+dnmAW/AGDLHsLW4xHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737620002; c=relaxed/simple;
	bh=jcCdauiHNJa0pjJlx3jdbeh1z1RLOy70cymrXf3sNzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYd+g+PJ11WklR1zokojqgSwk7OeI/gT+mdLWVCN+j5w0E3OoeSZpPmF9N4YijNnOl+gXFSheNlU6Y6urL+tBUU6hyJ1bE5+c068V8uV6IzCL9o87i4PuPpiXSK7CNTGub4t5UH20FuXnXSEjNLOoC3ss98JPpCrOCEGYBU6C1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hy0ume0G; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hy0ume0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737620000; x=1769156000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcCdauiHNJa0pjJlx3jdbeh1z1RLOy70cymrXf3sNzc=;
  b=Hy0ume0GGWjH0jRBlsiFqExC1nI2lejTd6JjDmf6ch56K+xUKmVmosyF
   dlAhmueDTPWqy6/YTS788fPm1kCJtOEAOxM8qcawOW8w7cAyfuU6vPbqO
   WpIUJ34cuQMCyMFw8MWlVc9W8AiW+rXQfGUD93jxhnEYJGlm5QIGEW1e9
   4WmaG9NuBPHYZOQXrChk1xRYvnJ7XWeFJTBZl1xqQlJCSa/aL0aQMYXK0
   mY47J22QBlxX7E5lHDhUI8zjGm85s3C8cZ2ROGUV/qMzET6sVmshC/z0W
   IHVwiykXK7+YkTpWV8sBS/i9phuLpxx/vk8kJ3f4B9WAHBy5czg4Hunbv
   A==;
X-CSE-ConnectionGUID: u6JhsPfFQBisgfwGBtbwdg==
X-CSE-MsgGUID: 76ic5AnjTQW1o20NlM98cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="25706841"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="25706841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:13:18 -0800
X-CSE-ConnectionGUID: aUhZJh7CR0GVuBWiasvwBg==
X-CSE-MsgGUID: TkgXNxTpQIm/3UweijlX7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="112414187"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2025 00:13:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tasKx-000auw-0O;
	Thu, 23 Jan 2025 08:13:15 +0000
Date: Thu, 23 Jan 2025 16:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 16/18]
 drivers/soundwire/debugfs.c:301:3: warning: format specifies type 'long' but
 the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202501231655.XTYbJ9rZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   965963c9c3d7f1433fa353a420b31af0ca279a83
commit: 63c78350b3707920cb42c0dbb86cc454aacfb6a5 [16/18] soundwire: debugfs: add interface for BPT/BRA transfers
config: i386-buildonly-randconfig-002-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231655.XTYbJ9rZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231655.XTYbJ9rZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231655.XTYbJ9rZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/debugfs.c:301:3: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     300 |         dev_dbg(&slave->dev, "command completed, num_byte %ld status %d, time %lld ms\n",
         |                                                           ~~~
         |                                                           %zu
     301 |                 num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   1 warning generated.


vim +301 drivers/soundwire/debugfs.c

   234	
   235	static int cmd_go(void *data, u64 value)
   236	{
   237		const struct firmware *fw = NULL;
   238		struct sdw_slave *slave = data;
   239		ktime_t start_t;
   240		ktime_t finish_t;
   241		int ret;
   242	
   243		if (value != 1)
   244			return -EINVAL;
   245	
   246		/* one last check */
   247		if (start_addr > SDW_REG_MAX ||
   248		    num_bytes == 0 || num_bytes > MAX_CMD_BYTES)
   249			return -EINVAL;
   250	
   251		ret = pm_runtime_get_sync(&slave->dev);
   252		if (ret < 0 && ret != -EACCES) {
   253			pm_runtime_put_noidle(&slave->dev);
   254			return ret;
   255		}
   256	
   257		if (cmd == 0) {
   258			ret = request_firmware(&fw, firmware_file, &slave->dev);
   259			if (ret < 0) {
   260				dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
   261				goto out;
   262			}
   263			if (fw->size < num_bytes) {
   264				dev_err(&slave->dev,
   265					"firmware %s: firmware size %zd, desired %zd\n",
   266					firmware_file, fw->size, num_bytes);
   267				goto out;
   268			}
   269		}
   270	
   271		/* Userspace changed the hardware state behind the kernel's back */
   272		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
   273	
   274		dev_dbg(&slave->dev, "starting command\n");
   275		start_t = ktime_get();
   276	
   277		if (cmd == 0) {
   278			if (cmd_type)
   279				ret = do_bpt_sequence(slave, true, (u8 *)fw->data);
   280			else
   281				ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
   282		} else {
   283			memset(read_buffer, 0, sizeof(read_buffer));
   284	
   285			if (cmd_type)
   286				ret = do_bpt_sequence(slave, false, read_buffer);
   287			else
   288				ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
   289		}
   290	
   291		finish_t = ktime_get();
   292	
   293	out:
   294		if (fw)
   295			release_firmware(fw);
   296	
   297		pm_runtime_mark_last_busy(&slave->dev);
   298		pm_runtime_put(&slave->dev);
   299	
   300		dev_dbg(&slave->dev, "command completed, num_byte %ld status %d, time %lld ms\n",
 > 301			num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
   302	
   303		return ret;
   304	}
   305	DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
   306				 cmd_go, "%llu\n");
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
