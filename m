Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263D257D
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660416992; x=1691952992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBPDfSeBK9w+B+8JdjaWQ3ncVRB2cbox7kKTBR+j8R4=;
  b=dEP2+eEdKhmmctEGz84g3tT48RuWWkUQQ+zpKfAoK14b7WzmeL/zIfq3
   kHPdhbinIPOzAOpxSoMuBcFGJP0OXJLkPrY6P1JYO5Zy6UcblFB3wSi35
   tXFcSJlVoxu/TRnwO3JoZaSOnjhBkXPZg2Tc96r4EFdZ7BZdOFN8AYHUX
   HpKmUVWPy6LXE0G5jMBatZzHN3ng5eCEVZaZmc9fDn6J3w0PZvvG/cAk9
   krLh4zza9XzF2SvqddTcigZGzYZD3oPu3bIccvVMfhaNb4qIwflY8Fqqr
   Nyh6R5cO0zVTNE8PKA/3NfSE5LJpIHF/0Em9kT5x1Z9gTj8mbSsq5gxFs
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289339992"
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="289339992"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 11:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="709345965"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2022 11:56:28 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMwJ9-00020D-1R;
	Sat, 13 Aug 2022 18:56:27 +0000
Date: Sun, 14 Aug 2022 02:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org
Subject: Re: [PATCH bpf-next 2/3] bpf: use cgroup_{common,current}_func_proto
 in more hooks
Message-ID: <202208140239.yjzPuMmv-lkp@intel.com>
References: <20220812190241.3544528-3-sdf@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812190241.3544528-3-sdf@google.com>

Hi Stanislav,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-expose-bpf_-g-s-et_retval-to-more-cgroup-hooks/20220813-030615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220814/202208140239.yjzPuMmv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329cec2f79185bafd678f310fafadba2a8c76d2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0429824054f7a843ee976d48432e825e493a0a7e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stanislav-Fomichev/bpf-expose-bpf_-g-s-et_retval-to-more-cgroup-hooks/20220813-030615
        git checkout 0429824054f7a843ee976d48432e825e493a0a7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/helpers.c:1817:11: error: use of undeclared identifier 'bpf_get_cgroup_classid_curr_proto'
                   return &bpf_get_cgroup_classid_curr_proto;
                           ^
   1 error generated.


vim +/bpf_get_cgroup_classid_curr_proto +1817 kernel/bpf/helpers.c

  1797	
  1798	/* Common helpers for cgroup hooks with valid process context. */
  1799	const struct bpf_func_proto *
  1800	cgroup_current_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
  1801	{
  1802		switch (func_id) {
  1803	#ifdef CONFIG_CGROUPS
  1804		case BPF_FUNC_get_current_uid_gid:
  1805			return &bpf_get_current_uid_gid_proto;
  1806		case BPF_FUNC_get_current_pid_tgid:
  1807			return &bpf_get_current_pid_tgid_proto;
  1808		case BPF_FUNC_get_current_comm:
  1809			return &bpf_get_current_comm_proto;
  1810		case BPF_FUNC_get_current_cgroup_id:
  1811			return &bpf_get_current_cgroup_id_proto;
  1812		case BPF_FUNC_get_current_ancestor_cgroup_id:
  1813			return &bpf_get_current_ancestor_cgroup_id_proto;
  1814	#endif
  1815	#ifdef CONFIG_CGROUP_NET_CLASSID
  1816		case BPF_FUNC_get_cgroup_classid:
> 1817			return &bpf_get_cgroup_classid_curr_proto;
  1818	#endif
  1819		default:
  1820			return NULL;
  1821		}
  1822	}
  1823	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
