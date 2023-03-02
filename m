Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D8110C;
	Thu,  2 Mar 2023 04:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677732786; x=1709268786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zcrUdPnjjh3xZK7mIGXqoVBRsdxvOpKbj0ABItM9K2s=;
  b=lKP+Pc689L7JA3qSh9S7IDLu2Z8UBLxxdzwVpwijpgm6SedmnSmJtVY6
   8AXvpK2VLPwECCJETUWncY8e7LEY6x5mm3WvESZALlSP4XAiaqV5Gj3bQ
   UV+n8wfRJ1p8nQEurbBPF9SgrE61iLmix2IwoJ37MLfshpHrr4PjqNIZu
   lwYcE4fOVw7j3ZZPaAs2Uf26XEugvGOGqvSBV+t2IPqBbcg75m4XEmE52
   7Rj54evPgvNvUr17HH+xcbv0d8t+5HM+fhsPfU2cMHAszN9Ls3Zt70NXp
   a0YYsRfvw78m+Sr2jlo1Z/EvdP8lNZ6dM1NYjVSa7I0fisXNg/Qzc3e15
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332099693"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332099693"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 20:53:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743691304"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743691304"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 20:53:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXaw9-0000DT-1n;
	Thu, 02 Mar 2023 04:53:01 +0000
Date: Thu, 2 Mar 2023 12:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing-opt 2/20] fs/proc/proc_sysctl.c:1287:8:
 error: must use 'struct' tag to refer to type 'ctl_dir'
Message-ID: <202303021230.tfoIVroT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luis,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing-opt
head:   4ac91d63df04d5f5e9830394b6d266adb2a21585
commit: 16bbd0aea0b8edb87a0133affeaad33820ce81f9 [2/20] proc_sysctl: move helper which creates required subdirectories
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230302/202303021230.tfoIVroT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=16bbd0aea0b8edb87a0133affeaad33820ce81f9
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing-opt
        git checkout 16bbd0aea0b8edb87a0133affeaad33820ce81f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021230.tfoIVroT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/proc_sysctl.c:1287:8: error: must use 'struct' tag to refer to type 'ctl_dir'
   static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
          ^
          struct 
>> fs/proc/proc_sysctl.c:1287:20: error: expected ';' after top level declarator
   static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
                      ^
                      ;
   2 errors generated.


vim +1287 fs/proc/proc_sysctl.c

  1285	
  1286	/* Find or the directory for the ctl_table. If one is not found create it. */
> 1287	static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
  1288	{
  1289		const char *name, *nextname;
  1290	
  1291		for (name = path; name; name = nextname) {
  1292			int namelen;
  1293			nextname = strchr(name, '/');
  1294			if (nextname) {
  1295				namelen = nextname - name;
  1296				nextname++;
  1297			} else {
  1298				namelen = strlen(name);
  1299			}
  1300			if (namelen == 0)
  1301				continue;
  1302	
  1303			/*
  1304			 * namelen ensures if name is "foo/bar/yay" only foo is
  1305			 * registered first. We traverse as if using mkdir -p and
  1306			 * return a ctl_dir for the last directory entry.
  1307			 */
  1308			dir = get_subdir(dir, name, namelen);
  1309			if (IS_ERR(dir))
  1310				break;
  1311		}
  1312		return dir;
  1313	}
  1314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
