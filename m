Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6920FB;
	Thu, 16 Feb 2023 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676533582; x=1708069582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g9InpgZGpHCTqv43vAgfDoxqIyxIY+mikfkYgZQHho8=;
  b=OxC+QBLeOSkIqJKsm8tbF4+VW+nYmhOwC8gGO/NI+k/XNSZgqTofcZXz
   AeZdvirwm34IBUeWu3Et1T7lKpTnyNOCNsrWLf4fINGm6ZC/Mmh3i357+
   n3Zhjc0uUhq8HjvkSz4WJTvnnh3bmx6mW116G13qwOfeQgPbN5tZRrDi0
   D0H9pUsCwETjZ2tQQVhwfkgvyuRrOZT7TZ6M+qeHpZlsGpkuC+KOhcNUO
   mTsWtbXC4huRzZzzvuytcE63dhttDsL16zxPeu9XWJinTyYL4kMIKvH60
   9dyKM92dFf9W2jhUQCVnhtBBHE6k+v3VdktY+jVr7hW9DvxDa9rkgsWUs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="417873286"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="417873286"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 23:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812876577"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="812876577"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 23:46:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSYyC-000A6j-09;
	Thu, 16 Feb 2023 07:46:20 +0000
Date: Thu, 16 Feb 2023 15:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 1/1] bpf: Support 64-bit pointers to kfuncs
Message-ID: <202302161535.Vb9cejVb-lkp@intel.com>
References: <20230214212809.242632-2-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214212809.242632-2-iii@linux.ibm.com>

Hi Ilya,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230215-054702
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230214212809.242632-2-iii%40linux.ibm.com
patch subject: [PATCH RFC bpf-next 1/1] bpf: Support 64-bit pointers to kfuncs
config: i386-randconfig-a002-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161535.Vb9cejVb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b93c73d640845b2e5ddd1b4af608f4896379002
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230215-054702
        git checkout 5b93c73d640845b2e5ddd1b4af608f4896379002
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161535.Vb9cejVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:1227:13: warning: incompatible pointer to integer conversion assigning to 'u64' (aka 'unsigned long long') from 'u8 *' (aka 'unsigned char *') [-Wint-conversion]
           *func_addr = addr;
                      ^ ~~~~
   1 warning generated.


vim +1227 kernel/bpf/core.c

  1181	
  1182	int bpf_jit_get_func_addr(const struct bpf_prog *prog,
  1183				  const struct bpf_insn *insn, bool extra_pass,
  1184				  u64 *func_addr, bool *func_addr_fixed)
  1185	{
  1186		s16 off = insn->off;
  1187		s32 imm = insn->imm;
  1188		bool fixed;
  1189		u8 *addr;
  1190		int err;
  1191	
  1192		switch (insn->src_reg) {
  1193		case BPF_PSEUDO_CALL:
  1194			/* Place-holder address till the last pass has collected
  1195			 * all addresses for JITed subprograms in which case we
  1196			 * can pick them up from prog->aux.
  1197			 */
  1198			if (!extra_pass)
  1199				addr = NULL;
  1200			else if (prog->aux->func &&
  1201				 off >= 0 && off < prog->aux->func_cnt)
  1202				addr = (u8 *)prog->aux->func[off]->bpf_func;
  1203			else
  1204				return -EINVAL;
  1205			fixed = false;
  1206			break;
  1207		case 0:
  1208			/* Address of a BPF helper call. Since part of the core
  1209			 * kernel, it's always at a fixed location. __bpf_call_base
  1210			 * and the helper with imm relative to it are both in core
  1211			 * kernel.
  1212			 */
  1213			addr = (u8 *)__bpf_call_base + imm;
  1214			fixed = true;
  1215			break;
  1216		case BPF_PSEUDO_KFUNC_CALL:
  1217			err = bpf_get_kfunc_addr(prog, imm, off, &addr);
  1218			if (err)
  1219				return err;
  1220			fixed = true;
  1221			break;
  1222		default:
  1223			return -EINVAL;
  1224		}
  1225	
  1226		*func_addr_fixed = fixed;
> 1227		*func_addr = addr;
  1228		return 0;
  1229	}
  1230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
