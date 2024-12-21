Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBB1D9694;
	Sat, 21 Dec 2024 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734757319; cv=none; b=cy92AH/ysK/nxrnurOGciYKuM34FEYieX7i9PC8nsCoM91la8QVQOqm6m0sOJ7f/gkIR8N06rh7i5+g1Zm6yy7UuU0Wqzbjw0pWxoB2xUV4lsBLvDxaqRMncZfc4I/01wnF7DRfI4IKhhTOkd6IsMAtXir3muFzUomTDyyBcm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734757319; c=relaxed/simple;
	bh=9hxFDyVIJZ9xQbiWvmBfutVhyl+tgB9qVF0L2TIP5X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HN4COuNQJsQDU0nxcUBXzhguHvNWb8ydl5RVby4ywp/1ySAEZfniSXyo6fiH6ZYUaSDEVnv8A/5IsTE23jyUf0+pB0z++JKoii1QW24TbVKJASrCtra1CIQBj2cdaf1KBo15w1VGWfEW33Cltai+vDcRI2AQ7i+WU300ni+6hRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPNEeYEY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPNEeYEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734757317; x=1766293317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9hxFDyVIJZ9xQbiWvmBfutVhyl+tgB9qVF0L2TIP5X4=;
  b=aPNEeYEY001Sh+SrNeWdollgh1o1Yf44iiHVERqiSsUmtKIUm59LC8KH
   mVoD17LyivsgDxungZqyINJrYDgc3ga+Ljcp4SVgwJCA/S8Y/5HAdmNOH
   ugBT94PmuZPjLgCbi12FBmmrwkZbzazswEGlxJasRqQE7AYj47EgGk9yU
   Tfsapnh7B7bBiXLqHAVpzyH3wcXXOwPuMr78EUIoCDY+atZWW/oRkcpjN
   Nf6aYhiN7pnKWI4vOyWtYgj7AWdEJeowwnsMEeBEjn1nRnt7BV9nbJj/e
   GNYIOE9w5m5LBBDoU2m24o/eoD+TlW9hrKCkn8AJek2e/rWwx/N8aktsX
   g==;
X-CSE-ConnectionGUID: l1QFXKwRRniAmOqlt6SCEg==
X-CSE-MsgGUID: TVbLE5/gQ+iCDiQJlzcD4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39087361"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="39087361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 21:01:55 -0800
X-CSE-ConnectionGUID: /5LC0LrbT2m1WXSrYCH6ew==
X-CSE-MsgGUID: /xvoo+kPSkKewbmkN8nCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98907633"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 21:01:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOrce-0001w7-0V;
	Sat, 21 Dec 2024 05:01:52 +0000
Date: Sat, 21 Dec 2024 13:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:uaccess-hardening-2 6/7] net/core/scm.c:258:3: error: call
 to undeclared function 'unsafe_copy_to_user'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202412211219.1Zl2KV7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   3bdf7366340d6baa8c06d0f8f0093868c0c675d2
commit: 43815105e17e4070555526222913036e603b7a7c [6/7] x86/uaccess: Speed up unsafe_copy_to_user()
config: i386-buildonly-randconfig-003-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211219.1Zl2KV7q-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211219.1Zl2KV7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211219.1Zl2KV7q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/scm.c:14:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/scm.c:258:3: error: call to undeclared function 'unsafe_copy_to_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     258 |                 unsafe_copy_to_user(CMSG_USER_DATA(cm), data,
         |                 ^
   net/core/scm.c:258:3: note: did you mean 'kmsan_copy_to_user'?
   include/linux/kmsan-checks.h:87:20: note: 'kmsan_copy_to_user' declared here
      87 | static inline void kmsan_copy_to_user(void __user *to, const void *from,
         |                    ^
>> net/core/scm.c:259:30: error: use of undeclared identifier 'efault_end'
     259 |                                     cmlen - sizeof(*cm), efault_end);
         |                                                          ^
   1 warning and 2 errors generated.


vim +/unsafe_copy_to_user +258 net/core/scm.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  230  
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  int put_cmsg(struct msghdr * msg, int level, int type, int len, void *data)
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  	int cmlen = CMSG_LEN(len);
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  
1f466e1f15cf1d Christoph Hellwig 2020-05-11  235  	if (msg->msg_flags & MSG_CMSG_COMPAT)
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  		return put_cmsg_compat(msg, level, type, len, data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  
1f466e1f15cf1d Christoph Hellwig 2020-05-11  238  	if (!msg->msg_control || msg->msg_controllen < sizeof(struct cmsghdr)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  		msg->msg_flags |= MSG_CTRUNC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  		return 0; /* XXX: return error? check spec. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  	if (msg->msg_controllen < cmlen) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  		msg->msg_flags |= MSG_CTRUNC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  		cmlen = msg->msg_controllen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  	}
1f466e1f15cf1d Christoph Hellwig 2020-05-11  246  
1f466e1f15cf1d Christoph Hellwig 2020-05-11  247  	if (msg->msg_control_is_user) {
1f466e1f15cf1d Christoph Hellwig 2020-05-11  248  		struct cmsghdr __user *cm = msg->msg_control_user;
1f466e1f15cf1d Christoph Hellwig 2020-05-11  249  
5f1eb1ff58ea12 Eric Dumazet      2023-02-17  250  		check_object_size(data, cmlen - sizeof(*cm), true);
5f1eb1ff58ea12 Eric Dumazet      2023-02-17  251  
38ebcf5096a867 Eric Dumazet      2021-04-15  252  		if (!user_write_access_begin(cm, cmlen))
38ebcf5096a867 Eric Dumazet      2021-04-15  253  			goto efault;
38ebcf5096a867 Eric Dumazet      2021-04-15  254  
e7ad33fa7bc5f7 Eric Dumazet      2021-04-16  255  		unsafe_put_user(cmlen, &cm->cmsg_len, efault_end);
38ebcf5096a867 Eric Dumazet      2021-04-15  256  		unsafe_put_user(level, &cm->cmsg_level, efault_end);
38ebcf5096a867 Eric Dumazet      2021-04-15  257  		unsafe_put_user(type, &cm->cmsg_type, efault_end);
38ebcf5096a867 Eric Dumazet      2021-04-15 @258  		unsafe_copy_to_user(CMSG_USER_DATA(cm), data,
38ebcf5096a867 Eric Dumazet      2021-04-15 @259  				    cmlen - sizeof(*cm), efault_end);
38ebcf5096a867 Eric Dumazet      2021-04-15  260  		user_write_access_end();
1f466e1f15cf1d Christoph Hellwig 2020-05-11  261  	} else {
1f466e1f15cf1d Christoph Hellwig 2020-05-11  262  		struct cmsghdr *cm = msg->msg_control;
1f466e1f15cf1d Christoph Hellwig 2020-05-11  263  
1f466e1f15cf1d Christoph Hellwig 2020-05-11  264  		cm->cmsg_level = level;
1f466e1f15cf1d Christoph Hellwig 2020-05-11  265  		cm->cmsg_type = type;
1f466e1f15cf1d Christoph Hellwig 2020-05-11  266  		cm->cmsg_len = cmlen;
1f466e1f15cf1d Christoph Hellwig 2020-05-11  267  		memcpy(CMSG_DATA(cm), data, cmlen - sizeof(*cm));
1f466e1f15cf1d Christoph Hellwig 2020-05-11  268  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  
1f466e1f15cf1d Christoph Hellwig 2020-05-11  270  	cmlen = min(CMSG_SPACE(len), msg->msg_controllen);
c39ef2130491b2 Kevin Brodsky     2023-04-13  271  	if (msg->msg_control_is_user)
c39ef2130491b2 Kevin Brodsky     2023-04-13  272  		msg->msg_control_user += cmlen;
c39ef2130491b2 Kevin Brodsky     2023-04-13  273  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  		msg->msg_control += cmlen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  	msg->msg_controllen -= cmlen;
1f466e1f15cf1d Christoph Hellwig 2020-05-11  276  	return 0;
38ebcf5096a867 Eric Dumazet      2021-04-15  277  
38ebcf5096a867 Eric Dumazet      2021-04-15  278  efault_end:
38ebcf5096a867 Eric Dumazet      2021-04-15  279  	user_write_access_end();
38ebcf5096a867 Eric Dumazet      2021-04-15  280  efault:
38ebcf5096a867 Eric Dumazet      2021-04-15  281  	return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  }
9e34a5b51684bc Eric Dumazet      2010-07-09  283  EXPORT_SYMBOL(put_cmsg);
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  

:::::: The code at line 258 was first introduced by commit
:::::: 38ebcf5096a86762b82262e96b2c8b170fe79040 scm: optimize put_cmsg()

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
