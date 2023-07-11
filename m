Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113161840;
	Tue, 11 Jul 2023 06:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689058072; x=1720594072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+pv5pWPoOslcKmWqVcKkH2UmrC4m5k248n+oevCB8zY=;
  b=G5aFNPMnD185iGTFpHCMxbgtX7L1wSDoht5ug4RtOOhUhwWe8exxhL8e
   qwB4aQJ+LspvJohVCGFRGAoBVFTBPDUSeIqU6dBI5S+35bzsslcgIXEKe
   WcSVG0LY0TWPg5BSbtJY0euKa/RkfDirjmgR9JTFpDIVQNwFbRKWNAcVg
   EpkhX72lxGqVESb0JuaY0xnHcPMoX8idhd7y1QANpYGaNwlg8VCoyN0ZP
   2tf69/CScMwci4wUqDSR40EHLTUezznBhSpD12aOlrkm7uMrkOkUoQw2b
   n/4mgexRDIqpunhboOb5ZAFE4t7VUxclmmpHouzVnV/fprCfrK/T6LVfe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428235132"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="428235132"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="756237831"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="756237831"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 23:47:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ7A1-0004Pz-1o;
	Tue, 11 Jul 2023 06:47:45 +0000
Date: Tue, 11 Jul 2023 14:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/urgent 3/6] kernel/trace/fgraph.c:282:15: error:
 conflicting types for 'ftrace_return_to_handler'
Message-ID: <202307111442.GqM1Hsvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/urgent
head:   76ae40eccaa12b3b73256118ed3463dba523812d
commit: 8eebd18ffba37df7c5a78fdae9f9757b54795588 [3/6] tracing: arm64: Avoid missing-prototype warnings
config: i386-randconfig-i014-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111442.GqM1Hsvm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111442.GqM1Hsvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111442.GqM1Hsvm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/fgraph.c:282:15: error: conflicting types for 'ftrace_return_to_handler'
   unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs)
                 ^
   include/linux/ftrace.h:45:15: note: previous declaration is here
   unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
                 ^
   1 error generated.


vim +/ftrace_return_to_handler +282 kernel/trace/fgraph.c

e73e679f656e67 Steven Rostedt (VMware  2018-11-15  276) 
a1be9ccc57f07d Donglin Peng            2023-04-08  277  /*
a1be9ccc57f07d Donglin Peng            2023-04-08  278   * After all architecures have selected HAVE_FUNCTION_GRAPH_RETVAL, we can
a1be9ccc57f07d Donglin Peng            2023-04-08  279   * leave only ftrace_return_to_handler(ret_regs).
a1be9ccc57f07d Donglin Peng            2023-04-08  280   */
a1be9ccc57f07d Donglin Peng            2023-04-08  281  #ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
a1be9ccc57f07d Donglin Peng            2023-04-08 @282  unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs)
a1be9ccc57f07d Donglin Peng            2023-04-08  283  {
a1be9ccc57f07d Donglin Peng            2023-04-08  284  	return __ftrace_return_to_handler(ret_regs,
a1be9ccc57f07d Donglin Peng            2023-04-08  285  				fgraph_ret_regs_frame_pointer(ret_regs));
a1be9ccc57f07d Donglin Peng            2023-04-08  286  }
a1be9ccc57f07d Donglin Peng            2023-04-08  287  #else
a1be9ccc57f07d Donglin Peng            2023-04-08  288  unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
a1be9ccc57f07d Donglin Peng            2023-04-08  289  {
a1be9ccc57f07d Donglin Peng            2023-04-08  290  	return __ftrace_return_to_handler(NULL, frame_pointer);
a1be9ccc57f07d Donglin Peng            2023-04-08  291  }
a1be9ccc57f07d Donglin Peng            2023-04-08  292  #endif
a1be9ccc57f07d Donglin Peng            2023-04-08  293  

:::::: The code at line 282 was first introduced by commit
:::::: a1be9ccc57f07d54278be34eed6bd679bc941c97 function_graph: Support recording and printing the return value of function

:::::: TO: Donglin Peng <pengdonglin@sangfor.com.cn>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
