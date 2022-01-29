Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C12CA1
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643475744; x=1675011744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W7DZG6qmcOjEcEDWWfMSe6v88eVVQD1gFgLStlTGeVA=;
  b=c/dgg8AQ2t/iFdhusb6Q6SZiEi1CLeerMvU7ZYZGQJi5uL0PI2117k8W
   GG0RCjaJPKIIAzGi/+mXdpSYj5B0BwtM+N3uXWmFvT9Uvx1KqEQ2zK5IK
   K4Gwy/x1s/J86mNGuMDqQoEC4qxdWXA4lf6lr8Z6YecPZgttx5+KgR0Wv
   QxmZl8HCkOFBMnNsPElfMCGVU/CJnJd9NBTrZ3TNgNEUfPBhmtxzTT8ox
   YzqPtnjirKDlGyEeLOEIbnXTprf3QG7CdGnp5Twpm9xyIBw/q59yJ2g87
   NLn+TtHbtr8QMSrHhbIqeaxViH62wMzUraxJ0wKEZc6rG/toco4QZgWH1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247054806"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="247054806"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 09:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="522063039"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jan 2022 09:02:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDr7E-000PQO-Vz; Sat, 29 Jan 2022 17:02:20 +0000
Date: Sun, 30 Jan 2022 01:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jordy Zomer <jordy@pwning.systems>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jordy Zomer <jordy@pwning.systems>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
Subject: Re: [PATCH] dm ioct: prevent potential specter v1 gadget
Message-ID: <202201300033.eThgyeLo-lkp@intel.com>
References: <20220129143722.3460829-1-jordy@pwning.systems>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129143722.3460829-1-jordy@pwning.systems>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jordy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on device-mapper-dm/for-next]
[also build test ERROR on linux/master linus/master v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jordy-Zomer/dm-ioct-prevent-potential-specter-v1-gadget/20220129-223840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
config: hexagon-buildonly-randconfig-r001-20220129 (https://download.01.org/0day-ci/archive/20220130/202201300033.eThgyeLo-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/494fed5461aa05e0efaf098b57a2a47dc19ba226
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jordy-Zomer/dm-ioct-prevent-potential-specter-v1-gadget/20220129-223840
        git checkout 494fed5461aa05e0efaf098b57a2a47dc19ba226
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/md/dm-ioctl.c:1791:8: error: implicit declaration of function 'array_index_nospec' [-Werror,-Wimplicit-function-declaration]
           cmd = array_index_nospec(cmd, ARRAY_SIZE(_ioctls));
                 ^
   1 error generated.


vim +/array_index_nospec +1791 drivers/md/dm-ioctl.c

  1752	
  1753	/*-----------------------------------------------------------------
  1754	 * Implementation of open/close/ioctl on the special char
  1755	 * device.
  1756	 *---------------------------------------------------------------*/
  1757	static ioctl_fn lookup_ioctl(unsigned int cmd, int *ioctl_flags)
  1758	{
  1759		static const struct {
  1760			int cmd;
  1761			int flags;
  1762			ioctl_fn fn;
  1763		} _ioctls[] = {
  1764			{DM_VERSION_CMD, 0, NULL}, /* version is dealt with elsewhere */
  1765			{DM_REMOVE_ALL_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, remove_all},
  1766			{DM_LIST_DEVICES_CMD, 0, list_devices},
  1767	
  1768			{DM_DEV_CREATE_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_create},
  1769			{DM_DEV_REMOVE_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_remove},
  1770			{DM_DEV_RENAME_CMD, IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_rename},
  1771			{DM_DEV_SUSPEND_CMD, IOCTL_FLAGS_NO_PARAMS, dev_suspend},
  1772			{DM_DEV_STATUS_CMD, IOCTL_FLAGS_NO_PARAMS, dev_status},
  1773			{DM_DEV_WAIT_CMD, 0, dev_wait},
  1774	
  1775			{DM_TABLE_LOAD_CMD, 0, table_load},
  1776			{DM_TABLE_CLEAR_CMD, IOCTL_FLAGS_NO_PARAMS, table_clear},
  1777			{DM_TABLE_DEPS_CMD, 0, table_deps},
  1778			{DM_TABLE_STATUS_CMD, 0, table_status},
  1779	
  1780			{DM_LIST_VERSIONS_CMD, 0, list_versions},
  1781	
  1782			{DM_TARGET_MSG_CMD, 0, target_message},
  1783			{DM_DEV_SET_GEOMETRY_CMD, 0, dev_set_geometry},
  1784			{DM_DEV_ARM_POLL, IOCTL_FLAGS_NO_PARAMS, dev_arm_poll},
  1785			{DM_GET_TARGET_VERSION, 0, get_target_version},
  1786		};
  1787	
  1788		if (unlikely(cmd >= ARRAY_SIZE(_ioctls)))
  1789			return NULL;
  1790	
> 1791		cmd = array_index_nospec(cmd, ARRAY_SIZE(_ioctls));
  1792		*ioctl_flags = _ioctls[cmd].flags;
  1793		return _ioctls[cmd].fn;
  1794	}
  1795	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
