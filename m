Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC87A
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 00:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654822378; x=1686358378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hfzqHZ9WZZKqlNxOYXcLszDyFwmAwNzB+DvcFyJmCZE=;
  b=KUKmlqV8cymbEwLFLT9NIEUSqyjA3UK/c6QsdiqnV0nV69CW+pp+/ccq
   fPK7XKwZ/mCtc/5+V32VLYxpr+3HY5JzvAlDp3y2whJd4iTt8/KEMYAtd
   xAy+LXb44LYWQmG2lAKMIDBFEAOqMwLFgpg/NrW34/4COCW/hhVi6CDrO
   c7+tiFCkE4rgxFy/t4kswsyg+Dv1Sd/ghxZzjdfh0ffP9M/nkYAxFMvlU
   Iro+N8Y391uqf8nrWCDX1gfMepExD9yf9sOrZPU5WUO1lYeSYkLbSQyp1
   dd+hB4UpubVjDLvqckjuMCXlQBytrfgjJ5oeQdSqqHnP5AYb3RTRh+IXm
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339226079"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="339226079"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 17:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="533855446"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jun 2022 17:52:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzStS-000GXR-2d;
	Fri, 10 Jun 2022 00:52:54 +0000
Date: Fri, 10 Jun 2022 08:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?J=F6rn-Thorben?= Hinz <jthinz@mailbox.tu-berlin.de>,
	bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, netdev@vger.kernel.org,
	=?iso-8859-1?Q?J=F6rn-Thorben?= Hinz <jthinz@mailbox.tu-berlin.de>
Subject: Re: [PATCH bpf-next v2 2/2] bpf: Require only one of cong_avoid()
 and cong_control() from a TCP CC
Message-ID: <202206100820.VN7PQCkp-lkp@intel.com>
References: <20220609204702.2351369-3-jthinz@mailbox.tu-berlin.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609204702.2351369-3-jthinz@mailbox.tu-berlin.de>

Hi "Jörn-Thorben,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/J-rn-Thorben-Hinz/bpf-Allow-a-TCP-CC-to-write-sk_pacing_rate-and-sk_pacing_status/20220610-054718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220610/202206100820.VN7PQCkp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 70d35fe1257e429266b83025997b400e9f79110e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ac2a3c95ce28ad79c2ef7e6c52c4fd25af9f3c6d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review J-rn-Thorben-Hinz/bpf-Allow-a-TCP-CC-to-write-sk_pacing_rate-and-sk_pacing_status/20220610-054718
        git checkout ac2a3c95ce28ad79c2ef7e6c52c4fd25af9f3c6d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/bpf_tcp_ca.c:225:6: warning: unused variable 'prog_fd' [-Wunused-variable]
           int prog_fd;
               ^
   1 warning generated.


vim +/prog_fd +225 net/ipv4/bpf_tcp_ca.c

0baf26b0fcd74b Martin KaFai Lau   2020-01-08  218  
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  219  static int bpf_tcp_ca_init_member(const struct btf_type *t,
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  220  				  const struct btf_member *member,
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  221  				  void *kdata, const void *udata)
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  222  {
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  223  	const struct tcp_congestion_ops *utcp_ca;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  224  	struct tcp_congestion_ops *tcp_ca;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08 @225  	int prog_fd;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  226  	u32 moff;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  227  
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  228  	utcp_ca = (const struct tcp_congestion_ops *)udata;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  229  	tcp_ca = (struct tcp_congestion_ops *)kdata;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  230  
8293eb995f349a Alexei Starovoitov 2021-12-01  231  	moff = __btf_member_bit_offset(t, member) / 8;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  232  	switch (moff) {
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  233  	case offsetof(struct tcp_congestion_ops, flags):
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  234  		if (utcp_ca->flags & ~TCP_CONG_MASK)
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  235  			return -EINVAL;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  236  		tcp_ca->flags = utcp_ca->flags;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  237  		return 1;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  238  	case offsetof(struct tcp_congestion_ops, name):
8e7ae2518f5265 Martin KaFai Lau   2020-03-13  239  		if (bpf_obj_name_cpy(tcp_ca->name, utcp_ca->name,
8e7ae2518f5265 Martin KaFai Lau   2020-03-13  240  				     sizeof(tcp_ca->name)) <= 0)
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  241  			return -EINVAL;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  242  		if (tcp_ca_find(utcp_ca->name))
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  243  			return -EEXIST;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  244  		return 1;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  245  	}
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  246  
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  247  	return 0;
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  248  }
0baf26b0fcd74b Martin KaFai Lau   2020-01-08  249  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
