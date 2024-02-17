Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E658004E;
	Sat, 17 Feb 2024 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708211861; cv=none; b=ljYNZufU6vUHe6wdsZKb8wwIB3pszPW7zhT/i9YwGNba5fSe6ZQ0jGMFSCRD1TXqZGJZwWWDtM0T9r5Y+ASSJBrUviL7+DkNRTZ0/dlMKNm3b/HFBHSDcrGbZ/FVcy8L7QKEB2FJTk3VBiFdOzOaD6qRCWAZTIP21RhGOUwtcLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708211861; c=relaxed/simple;
	bh=5p7U8x9q2Wtf/FCRQ0S+ocYKEI8DCrcwz3npP5ABtMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kd5pIhhEoQJocnXo7mZ7+LnJcXZwfgOTzBCUd6GDIZv3/9AExgUEnF9GIE08cZ/FpSC08BKQ8HJyQZbxsdLw99/agbCR7uMv/mIXNG3XPbvNxvqmTPdeBpGp7nb+TtdQ4gCtZ8Guo6vawCwLlsRhbR0KCd1FkcBayth19H4cVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJrww0RN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJrww0RN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708211852; x=1739747852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5p7U8x9q2Wtf/FCRQ0S+ocYKEI8DCrcwz3npP5ABtMU=;
  b=eJrww0RNmTJap6O5avZA2fmfB1mX1iUImoo6FQuBBJYuRvHK0wEHEjHZ
   zIHTdlg+UlPthhsVxEtXIhNclMnLAeTzrA3W4QDCG0wvIh7tSLL3Fy4c2
   S/3LYx1bfASa6rAZzHGtDuTtznozMZuaIIA5qKhjKI/TrsmfY7wMUZchD
   ayr4fuswbhTqyh4UkhaOqYaqAwNmcn8mKZE5VbuXkdrmd+mPWh8gncusM
   XmJi1PQLREyBK60y+MwOkS2o31ZMU5L74Hy0vFMm2O/qiV+uJWc9JieHd
   2CoZgcZ38oJfY57wKEnPESE0rNjSq1tv2GdwxCAIeyFArp+aH1R8UKqzv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="12945405"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="12945405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 15:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4436283"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Feb 2024 15:17:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbTvz-0002aA-0l;
	Sat, 17 Feb 2024 23:17:27 +0000
Date: Sun, 18 Feb 2024 07:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dorcas Anono Litunya <anonolitunya@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:outreachy-vivid 46/46]
 drivers/media/test-drivers/vivid/vivid-core.c:1745:20: warning: unused
 variable 'dev'
Message-ID: <202402180727.u4BJhiyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid
head:   3aac2c4bb29abd8505942e3ccd6a51fb7b754fdc
commit: 3aac2c4bb29abd8505942e3ccd6a51fb7b754fdc [46/46] media: vivid: Implement workqueue to prevent race conditions
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240218/202402180727.u4BJhiyO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180727.u4BJhiyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180727.u4BJhiyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-core.c:1745:20: warning: unused variable 'dev' [-Wunused-variable]
           struct vivid_dev *dev = container_of(work, struct vivid_dev, update_hdmi_ctrl_work);
                             ^
   1 warning generated.


vim +/dev +1745 drivers/media/test-drivers/vivid/vivid-core.c

  1742	
  1743	static void update_hdmi_ctrls_work_handler(struct work_struct *work)
  1744	{
> 1745		struct vivid_dev *dev = container_of(work, struct vivid_dev, update_hdmi_ctrl_work);
  1746		u64 skip_mask;
  1747	
  1748		spin_lock(&hdmi_output_skip_mask_lock);
  1749		skip_mask = hdmi_to_output_menu_skip_mask;
  1750		spin_unlock(&hdmi_output_skip_mask_lock);
  1751		for (int i = 0; i < n_devs && vivid_devs[i]; i++) {
  1752			for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
  1753				struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
  1754	
  1755				v4l2_ctrl_modify_range(c, c->minimum, c->maximum,
  1756						       skip_mask & ~(1ULL << c->cur.val),
  1757						       c->default_value);
  1758			}
  1759		}
  1760	}
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
