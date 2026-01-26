Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF227F010;
	Mon, 26 Jan 2026 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464719; cv=none; b=VfL3imAXYfdC6Q3HE/bmaCA0gHU3RUTIsNE5geHYv85IS1Tvn0RmsHpsQRH/NYOR7fGYARWEiYva357YvjXgMlBkMaxRf9ZP49oGA0zAmJrfAj1D6pj6vhBDx+D4WVkUmqf6QjfdwPbn44hedOKr5Y/IsYh0DqpQbDFty8d1A8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464719; c=relaxed/simple;
	bh=xUX1RQUbLbjtvgoqFU3fHlotLLgum51R3dNgxzy5aE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bq3/0H4ufc+POQIoETUGRp0Hnl49/F6qqYdY+91lIoOkuiYBWUAID4Nusx4j2qZ/GMEBz5CNhKhUaEx+QteK28GJj9DfDTEpq5ISvQ+gfAOw4lRHuZCU4kuvWcv7o8ZLBb/JdSlr4xlCzFD0Tfj5MBUbJhKujbFAC6XbP6sKVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFcPJC6o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFcPJC6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464718; x=1801000718;
  h=date:from:to:cc:subject:message-id;
  bh=xUX1RQUbLbjtvgoqFU3fHlotLLgum51R3dNgxzy5aE4=;
  b=KFcPJC6oSg6atYSlizV8/tSQstTL72ISpU7QwGrN8L6Dovv4uqlTgeEV
   0U+Fr0LiOfyeSrhGks6AGJhgDEoGcZRSOITSSVpqIoAZf0uexdmwAKbdP
   /yUU0d0Y1v5jxdIVMnrEZzxICRso5UCNhd/d9ksgeHFQMGn18KEqVLws8
   J/5GxvyrZSNboe55sv1NdML66XgpsZlxJ87npCi5alKR7AtiqYbfmdJJr
   9g4RrPwLicB8/67uDVTizyJfQk9dqwcSaLk+uieDyhnYJYMcTdC5Qu27k
   8IQQa3CUNd96spoHjORjUp66E+b1JF4oU/Zsq1JF0RkpHBwwLQ7+Ws+oz
   A==;
X-CSE-ConnectionGUID: VZOsCnUuR6qgBzKXQHj5BQ==
X-CSE-MsgGUID: Cwlu2ieqQ8eOP+kgN10vsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70366324"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70366324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:58:38 -0800
X-CSE-ConnectionGUID: Ekh//WAXQf+qFHzN7i/DeA==
X-CSE-MsgGUID: kisJMF1cSQ2hbNZ6Sr4Wcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207026760"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2026 13:58:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkUbQ-00000000Xj8-3lZz;
	Mon, 26 Jan 2026 21:58:32 +0000
Date: Tue, 27 Jan 2026 05:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 "Sang-Soo Lee" <constant.lee@samsung.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/mgmt/user_session.c:98:58: error: no member named 'inet6_addr'
 in 'struct ksmbd_conn'; did you mean 'inet_addr'?
Message-ID: <202601270536.sNP66ReK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   8cc38d4af66aa19d0e67d4b148abd6c50de339f8
commit: 8cc38d4af66aa19d0e67d4b148abd6c50de339f8 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: i386-buildonly-randconfig-004-20260127 (https://download.01.org/0day-ci/archive/20260127/202601270536.sNP66ReK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270536.sNP66ReK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270536.sNP66ReK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/server/mgmt/user_session.c:98:58: error: no member named 'inet6_addr' in 'struct ksmbd_conn'; did you mean 'inet_addr'?
      98 |                 seq_printf(m, "%-20s\t%pI6c\n", "client", &chan->conn->inet6_addr);
         |                                                                        ^~~~~~~~~~
         |                                                                        inet_addr
   fs/smb/server/mgmt/../connection.h:53:12: note: 'inet_addr' declared here
      53 |                 __be32                  inet_addr;
         |                                         ^
   fs/smb/server/mgmt/user_session.c:207:44: error: no member named 'inet6_addr' in 'struct ksmbd_conn'; did you mean 'inet_addr'?
     207 |                         seq_printf(m, " %-40pI6c", &chan->conn->inet6_addr);
         |                                                                 ^~~~~~~~~~
         |                                                                 inet_addr
   fs/smb/server/mgmt/../connection.h:53:12: note: 'inet_addr' declared here
      53 |                 __be32                  inet_addr;
         |                                         ^
   2 errors generated.


vim +98 fs/smb/server/mgmt/user_session.c

    80	
    81	static int show_proc_session(struct seq_file *m, void *v)
    82	{
    83		struct ksmbd_session *sess;
    84		struct ksmbd_tree_connect *tree_conn;
    85		struct ksmbd_share_config *share_conf;
    86		struct channel *chan;
    87		unsigned long id;
    88		int i = 0;
    89	
    90		sess = (struct ksmbd_session *)m->private;
    91		ksmbd_user_session_get(sess);
    92	
    93		i = 0;
    94		xa_for_each(&sess->ksmbd_chann_list, id, chan) {
    95		if (chan->conn->inet_addr)
    96			seq_printf(m, "%-20s\t%pI4c\n", "client", &chan->conn->inet_addr);
    97		else
  > 98			seq_printf(m, "%-20s\t%pI6c\n", "client", &chan->conn->inet6_addr);
    99		seq_printf(m, "%-20s\t%s\n", "user", session_user_name(sess));
   100		seq_printf(m, "%-20s\t%llu\n", "id", sess->id);
   101		seq_printf(m, "%-20s\t%s\n", "state", session_state_string(sess));
   102	
   103		seq_printf(m, "%-20s\t", "capabilities");
   104		ksmbd_proc_show_flag_names(m,
   105					   ksmbd_sess_cap_const_names,
   106					   ARRAY_SIZE(ksmbd_sess_cap_const_names),
   107					   chan->conn->vals->req_capabilities);
   108	
   109		if (sess->sign) {
   110			seq_printf(m, "%-20s\t", "signing");
   111			ksmbd_proc_show_const_name(m, "%s\t",
   112						   ksmbd_signing_const_names,
   113						   ARRAY_SIZE(ksmbd_signing_const_names),
   114						   le16_to_cpu(chan->conn->signing_algorithm));
   115		} else if (sess->enc) {
   116			seq_printf(m, "%-20s\t", "encryption");
   117			ksmbd_proc_show_const_name(m, "%s\t",
   118						   ksmbd_cipher_const_names,
   119						   ARRAY_SIZE(ksmbd_cipher_const_names),
   120						   le16_to_cpu(chan->conn->cipher_type));
   121		}
   122			i++;
   123		}
   124	
   125		seq_printf(m, "%-20s\t%d\n", "channels", i);
   126	
   127		i = 0;
   128		xa_for_each(&sess->tree_conns, id, tree_conn) {
   129			share_conf = tree_conn->share_conf;
   130			seq_printf(m, "%-20s\t%s\t%8d", "share",
   131				   share_conf->name, tree_conn->id);
   132			if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_PIPE))
   133				seq_printf(m, " %s ", "pipe");
   134			else
   135				seq_printf(m, " %s ", "disk");
   136			seq_putc(m, '\n');
   137		}
   138	
   139		ksmbd_user_session_put(sess);
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
