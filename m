Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6397472
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 20:04:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="235650437"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="235650437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 12:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="555632239"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2021 12:04:15 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqhSA-0008Wl-3Z; Fri, 26 Nov 2021 20:04:14 +0000
Date: Sat, 27 Nov 2021 04:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 11/12] nvmet-auth: Diffie-Hellman key exchange support
Message-ID: <202111270313.t95s8nb5-lkp@intel.com>
References: <20211123123801.73197-12-hare@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123123801.73197-12-hare@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on linus/master v5.16-rc2 next-20211126]
[cannot apply to herbert-crypto-2.6/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hannes-Reinecke/nvme-In-band-authentication-support/20211123-204008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
config: i386-randconfig-r035-20211126 (https://download.01.org/0day-ci/archive/20211127/202111270313.t95s8nb5-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/34bd34a0ee0dbaeeb36f3264e50be3a533491d97
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hannes-Reinecke/nvme-In-band-authentication-support/20211123-204008
        git checkout 34bd34a0ee0dbaeeb36f3264e50be3a533491d97
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/target/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/fabrics-cmd-auth.c:352:35: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                    req->sq->dhchap_tid, data->hl, ctrl->dh_keysize);
                                                   ^~~~~~~~~~~~~~~~
   include/linux/printk.h:576:38: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
                                       ~~~     ^~~~~~~~~~~
   include/linux/printk.h:132:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.
--
>> drivers/nvme/target/auth.c:490:18: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                           ctrl->cntlid, ctrl->dh_keysize, buf_size);
                                         ^~~~~~~~~~~~~~~~
   include/linux/printk.h:499:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ~~~     ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +352 drivers/nvme/target/fabrics-cmd-auth.c

   315	
   316	static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
   317	{
   318		struct nvmf_auth_dhchap_challenge_data *data = d;
   319		struct nvmet_ctrl *ctrl = req->sq->ctrl;
   320		int ret = 0;
   321		int hash_len = nvme_auth_hmac_hash_len(ctrl->shash_id);
   322		int data_size = sizeof(*d) + hash_len;
   323	
   324		if (ctrl->dh_tfm)
   325			data_size += ctrl->dh_keysize;
   326		if (al < data_size) {
   327			pr_debug("%s: buffer too small (al %d need %d)\n", __func__,
   328				 al, data_size);
   329			return -EINVAL;
   330		}
   331		memset(data, 0, data_size);
   332		req->sq->dhchap_s1 = ctrl->dhchap_seqnum++;
   333		data->auth_type = NVME_AUTH_DHCHAP_MESSAGES;
   334		data->auth_id = NVME_AUTH_DHCHAP_MESSAGE_CHALLENGE;
   335		data->t_id = cpu_to_le16(req->sq->dhchap_tid);
   336		data->hashid = ctrl->shash_id;
   337		data->hl = hash_len;
   338		data->seqnum = cpu_to_le32(req->sq->dhchap_s1);
   339		req->sq->dhchap_c1 = kmalloc(data->hl, GFP_KERNEL);
   340		if (!req->sq->dhchap_c1)
   341			return -ENOMEM;
   342		get_random_bytes(req->sq->dhchap_c1, data->hl);
   343		memcpy(data->cval, req->sq->dhchap_c1, data->hl);
   344		if (ctrl->dh_tfm) {
   345			data->dhgid = ctrl->dh_gid;
   346			data->dhvlen = cpu_to_le32(ctrl->dh_keysize);
   347			ret = nvmet_auth_ctrl_exponential(req, data->cval + data->hl,
   348							  ctrl->dh_keysize);
   349		}
   350		pr_debug("%s: ctrl %d qid %d seq %d transaction %d hl %d dhvlen %lu\n",
   351			 __func__, ctrl->cntlid, req->sq->qid, req->sq->dhchap_s1,
 > 352			 req->sq->dhchap_tid, data->hl, ctrl->dh_keysize);
   353		return ret;
   354	}
   355	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
