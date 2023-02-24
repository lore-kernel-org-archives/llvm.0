Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347E197;
	Fri, 24 Feb 2023 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677258561; x=1708794561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xeaO1IniKr75/c4+/ZSkpy1ddVFlxyuf+WDd3rAkTAk=;
  b=WFGJkCIa8Wb4fhnbrUys6oKzMU7vIRTkr8Ud4CZGD3tJvVUJgntYaTVl
   piIy5AFMhG3KqoOzegUAcAx1VAyS4bFUO3RUi18lva7cnqPwIi+aNz6jp
   3i6lHQkzKc+LvQYp+nPVjs1xQ1CI7Pg8gqye6xTdZDkD7aFGjXNmeitVi
   xCviv68Z/YcCxiFZvnmR+FKPsMpVYeuq3oBevFlHVRYZs2+ytNw64Zz7l
   R9pxbuE8stt6q6Jn6CGtUv5oVPhDJSyNfNqE9tE9BMgMbLCxW+q85MrEG
   oX0M2XSUFrWUPfXAc7D2gQBDQk2DupF+R85dYmZYOfWUKQsu0FGhihjYR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="419760079"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="419760079"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 09:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="796803293"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="796803293"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2023 09:06:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVbX8-0002Yr-2N;
	Fri, 24 Feb 2023 17:06:58 +0000
Date: Sat, 25 Feb 2023 01:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Pearson <rpearsonhpe@gmail.com>, jgg@nvidia.com,
	zyjzyj2000@gmail.com, linux-rdma@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bob Pearson <rpearsonhpe@gmail.com>
Subject: Re: [PATCH for-next v2 4/4] RDMA/rxe: Add error messages
Message-ID: <202302250056.mgmG5a52-lkp@intel.com>
References: <20230224032916.151490-5-rpearsonhpe@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224032916.151490-5-rpearsonhpe@gmail.com>

Hi Bob,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 66fb1d5df6ace316a4a6e2c31e13fc123ea2b644]

url:    https://github.com/intel-lab-lkp/linux/commits/Bob-Pearson/RDMA-rxe-Replace-exists-by-rxe-in-rxe-c/20230224-113206
base:   66fb1d5df6ace316a4a6e2c31e13fc123ea2b644
patch link:    https://lore.kernel.org/r/20230224032916.151490-5-rpearsonhpe%40gmail.com
patch subject: [PATCH for-next v2 4/4] RDMA/rxe: Add error messages
config: arm-randconfig-r004-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250056.mgmG5a52-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/39493983f5f2a6f4c7d19ba3b28e2e0537a42247
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bob-Pearson/RDMA-rxe-Replace-exists-by-rxe-in-rxe-c/20230224-113206
        git checkout 39493983f5f2a6f4c7d19ba3b28e2e0537a42247
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/infiniband/sw/rxe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250056.mgmG5a52-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/sw/rxe/rxe_verbs.c:600:13: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
                              mask, err);
                                    ^~~
   drivers/infiniband/sw/rxe/rxe.h:53:51: note: expanded from macro 'rxe_dbg_qp'
                   "qp#%d %s: " fmt, (qp)->elem.index, __func__, ##__VA_ARGS__)
                                                                   ^~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_verbs.c:596:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +/err +600 drivers/infiniband/sw/rxe/rxe_verbs.c

   590	
   591	static int rxe_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *attr,
   592				 int mask, struct ib_udata *udata)
   593	{
   594		struct rxe_dev *rxe = to_rdev(ibqp->device);
   595		struct rxe_qp *qp = to_rqp(ibqp);
   596		int err;
   597	
   598		if (mask & ~IB_QP_ATTR_STANDARD_BITS) {
   599			rxe_dbg_qp(qp, "unsupported mask = 0x%x, err = %d",
 > 600				   mask, err);
   601			err = -EOPNOTSUPP;
   602			goto err_out;
   603		}
   604	
   605		err = rxe_qp_chk_attr(rxe, qp, attr, mask);
   606		if (err) {
   607			rxe_dbg_qp(qp, "bad mask/attr, err = %d", err);
   608			goto err_out;
   609		}
   610	
   611		err = rxe_qp_from_attr(qp, attr, mask, udata);
   612		if (err) {
   613			rxe_dbg_qp(qp, "modify qp failed, err = %d", err);
   614			goto err_out;
   615		}
   616	
   617		if ((mask & IB_QP_AV) && (attr->ah_attr.ah_flags & IB_AH_GRH))
   618			qp->src_port = rdma_get_udp_sport(attr->ah_attr.grh.flow_label,
   619							  qp->ibqp.qp_num,
   620							  qp->attr.dest_qp_num);
   621	
   622		return 0;
   623	
   624	err_out:
   625		rxe_err_qp(qp, "returned err = %d", err);
   626		return err;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
