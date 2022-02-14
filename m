Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5065EEB8
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 23:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644880644; x=1676416644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h58TGqMYYScHpHkX1cS/n0upCHHRwSUwIeZYk3KFmlY=;
  b=QCmUZo4K588P1UQ0YZyRwialeuLFPtWIFzpt+yS0OY6JR+KXXNxJu08M
   bvXoufxawUoptdyEl/wiP9GGcyi9kr4MXFWmrqii0zE7Bd8XTvKzK3T08
   CKA890tLrnVZZeSNz9y3ZWvi+KlQPwOuRq+JnEbV9Vmrz81Xg3m0n8ogV
   UncEvgHXaMOvgk0aY7p50W/ExqH1Sp8auKNBn7v2zwMkKzr4dL9o72y4k
   E/gPhDzWHxJZ6n57KkiDJI3kXXlHtuAYE0c2aIIVH2ZdFE/en1mRER0Jg
   jagm9bZDG7mVVY5WM/7GJKnYWehEVD+WQBCkezlTM0/0wtUmPAqRlWEQz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="310943026"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="310943026"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 15:17:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="624488965"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2022 15:17:22 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJkav-00091Z-Oq; Mon, 14 Feb 2022 23:17:21 +0000
Date: Tue, 15 Feb 2022 07:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [jolsa-perf:bpf/fprobe_link_6 3/11]
 include/linux/trace_events.h:781:47: warning: declaration of 'union
 bpf_attr' will not be visible outside of this function
Message-ID: <202202150707.pEsVvhSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/fprobe_link_6
head:   bb2f8cf233977d40c029e2f718e95f637980e350
commit: 00327b2f7c60bd84d8c5e887003987b2e688d159 [3/11] bpf: Add support to attach kprobe program with fprobe
config: hexagon-randconfig-r041-20220214 (https://download.01.org/0day-ci/archive/20220215/202202150707.pEsVvhSW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=00327b2f7c60bd84d8c5e887003987b2e688d159
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/fprobe_link_6
        git checkout 00327b2f7c60bd84d8c5e887003987b2e688d159
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/base/syscore.c:12:
   In file included from include/trace/events/power.h:12:
>> include/linux/trace_events.h:781:47: warning: declaration of 'union bpf_attr' will not be visible outside of this function [-Wvisibility]
   static int bpf_fprobe_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
                                                 ^
   include/linux/trace_events.h:781:12: warning: unused function 'bpf_fprobe_link_attach' [-Wunused-function]
   static int bpf_fprobe_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
              ^
   2 warnings generated.


vim +781 include/linux/trace_events.h

   753	
   754	static inline int
   755	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   756	{
   757		return -EOPNOTSUPP;
   758	}
   759	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   760	{
   761		return -EOPNOTSUPP;
   762	}
   763	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   764	{
   765		return -EOPNOTSUPP;
   766	}
   767	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   768	{
   769		return NULL;
   770	}
   771	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   772	{
   773	}
   774	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   775						  u32 *prog_id, u32 *fd_type,
   776						  const char **buf, u64 *probe_offset,
   777						  u64 *probe_addr)
   778	{
   779		return -EOPNOTSUPP;
   780	}
 > 781	static int bpf_fprobe_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   782	{
   783		return -EOPNOTSUPP;
   784	}
   785	#endif
   786	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
