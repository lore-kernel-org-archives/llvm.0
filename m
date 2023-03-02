Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CCA47;
	Thu,  2 Mar 2023 04:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677732783; x=1709268783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eh3DUtjG5IFOz9rUK7gLWPJCFHORNgToiBo7IktqzDk=;
  b=CWONCqLpyAuDRtmXfMIqqbrn7rKdrhQiuoNaUf0Ij+VoN1BLy96us5pB
   3KA9vs0aFyNFykb5RWea4zlKbBhJx1Zvqp3Gc02M82utvYqIeLYZEcUTK
   JQys/NNCLwNAQqw0jeJ9APLWNOysGk6FCtZ7hhROuL6+6gYlNB94HA+BP
   +kBY1KnGV0kA5h/JF04Hgqm4EJMeVQJGJKjaCJpllhvoAPJCAyBHy0cC3
   WLog3KTZ+bgGReoHx0atYOQdNFpbQe7SOR1+Cf8/yUo6HG83FTMRR38gZ
   7ymEvRzHiX8ZStABu7sNL3skwYSOmfe8ajWaZSiebRR+aDE4BuONnm8nL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332099691"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332099691"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 20:53:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743691302"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743691302"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 20:53:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXaw9-0000DR-1h;
	Thu, 02 Mar 2023 04:53:01 +0000
Date: Thu, 2 Mar 2023 12:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing-opt 2/20] fs/proc/proc_sysctl.c:1287:8:
 error: must use 'struct' tag to refer to type 'ctl_dir'
Message-ID: <202303021239.XT7Oo08R-lkp@intel.com>
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
config: hexagon-buildonly-randconfig-r005-20230302 (https://download.01.org/0day-ci/archive/20230302/202303021239.XT7Oo08R-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=16bbd0aea0b8edb87a0133affeaad33820ce81f9
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing-opt
        git checkout 16bbd0aea0b8edb87a0133affeaad33820ce81f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021239.XT7Oo08R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/proc/proc_sysctl.c:1287:8: error: must use 'struct' tag to refer to type 'ctl_dir'
   static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
          ^
          struct 
>> fs/proc/proc_sysctl.c:1287:20: error: expected ';' after top level declarator
   static ctl_dir *dir sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
                      ^
                      ;
   6 warnings and 2 errors generated.


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
