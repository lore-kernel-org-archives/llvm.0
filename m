Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1444C9C;
	Sat,  9 Mar 2024 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710020205; cv=none; b=o7e/iAH2rNbq78aR5WQcdguHDFHjX+JpPOg6TO5GxaQO4qTHY+8qXr67cUg7iiRoIthl4iDHSjwQ+g0lQF75BjMZvkvE9xxHxg31GNWKl6IBdexFrnOntkN631Vyf2BcHko0rYLLnQIsulD7bETmTMe8pEM24bcLbiXWtVCDwPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710020205; c=relaxed/simple;
	bh=dhGgN4di+d6HT3YmrBy7B/bCsT4AwuezR1Nld1Gp69c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocKjolSvGhlTc0v1oYgoK/P2waPKnHAlU0rF51s9Vfl3jCVK8/JcWj40MGH9P4stj1qDiA5ds5WLBxPbbBRLZQ5nfs6oQRuf3Uav8R7yfP+hSDY8vVea0mynTI775P3P2OQ5N/9HPwxueZHxUbrggOgI2ecoTIOV7wXx3YelddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5R3WzHl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5R3WzHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710020203; x=1741556203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dhGgN4di+d6HT3YmrBy7B/bCsT4AwuezR1Nld1Gp69c=;
  b=F5R3WzHl3SJmFOiBKcVynuZpfftpQ/5E4YwqSjg8pFweR/+jhmcZ/8ay
   fKkqD3AhyolsMWfZq2nBYT157Jne+SKiGNaJbVIqHONYnMX2X/f5UP1Kl
   ursAtBHQbRiIsbGOrHjyPtbcMlYbP3bJsDkKb8O3i2qbocxPR7MutKEsq
   bEzBjD1BuZAfLgoF5z9+2l/FfiJDICWMTM7EpfigTl3JJgX7OHFDiWDLq
   j2pbqdFl8ZBqKRnpnE6jOLdKaheDOXlWXgYEXsnUiepPf4uUWEqjTIL96
   wxCgmZM1QcyKUmc3QK7daTuVYud/gl3vG5UXGHS0NOo3rWJNeFmOP1/l9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4573554"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4573554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 13:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15393376"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2024 13:36:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj4Mw-0007fd-1l;
	Sat, 09 Mar 2024 21:36:38 +0000
Date: Sun, 10 Mar 2024 05:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/21] fs/netfs/write_issue.c:236:33:
 warning: format specifies type 'unsigned long' but the argument has type
 'size_t' (aka 'unsigned int')
Message-ID: <202403100554.A1U8HTG3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   4b19245d19affeb7108cfd195f1523e575ca62ce
commit: 4b19245d19affeb7108cfd195f1523e575ca62ce [21/21] netfs: Use writeback_iter() and improve the writeback algorithm
config: i386-buildonly-randconfig-004-20240310 (https://download.01.org/0day-ci/archive/20240310/202403100554.A1U8HTG3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100554.A1U8HTG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100554.A1U8HTG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/write_issue.c:236:33: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                      ~~~               ^~~~~~~~~~~
         |                      %zx
   fs/netfs/internal.h:396:43: note: expanded from macro '_debug'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/write_issue.c:236:46: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                          ~~~                        ^~~~~~~~~~~~~~~
         |                          %zx
   fs/netfs/internal.h:396:43: note: expanded from macro '_debug'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/write_issue.c:236:63: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                              ~~~                                     ^~~~
         |                              %zx
   fs/netfs/internal.h:396:43: note: expanded from macro '_debug'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/write_issue.c:236:69: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                                  ~~~                                       ^~~
         |                                  %zx
   fs/netfs/internal.h:396:43: note: expanded from macro '_debug'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/write_issue.c:522:16: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     522 |         _enter("%lx", len);
         |                 ~~~   ^~~
         |                 %zx
   fs/netfs/internal.h:394:65: note: expanded from macro '_enter'
     394 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                             ~~~                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/write_issue.c:530:28: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     530 |                 _debug("unbuffered %lx", len);
         |                                    ~~~   ^~~
         |                                    %zx
   fs/netfs/internal.h:396:43: note: expanded from macro '_debug'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   6 warnings generated.
--
>> fs/netfs/direct_write.c:40:16: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      40 |         _enter("%lx", iov_iter_count(iter));
         |                 ~~~   ^~~~~~~~~~~~~~~~~~~~
         |                 %zx
   fs/netfs/internal.h:394:65: note: expanded from macro '_enter'
     394 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                             ~~~                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +236 fs/netfs/write_issue.c

   205	
   206	/*
   207	 * Add data to the write subrequest, dispatching each as we fill it up or if it
   208	 * is discontiguous with the previous.  We only fill one part at a time so that
   209	 * we can avoid overrunning the credits obtained (cifs) and try to parallelise
   210	 * content-crypto preparation with network writes.
   211	 */
   212	int netfs_advance_write(struct netfs_io_request *wreq,
   213				struct netfs_io_stream *stream,
   214				loff_t start, size_t len, bool to_eof)
   215	{
   216		struct netfs_io_subrequest *subreq = stream->construct;
   217		size_t part;
   218	
   219		if (!stream->avail) {
   220			_leave("no write");
   221			return len;
   222		}
   223	
   224		_enter("R=%x[%x]", wreq->debug_id, subreq ? subreq->debug_index : 0x99);
   225	
   226		if (subreq && start != subreq->start + subreq->len) {
   227			netfs_issue_write(wreq, stream);
   228			subreq = NULL;
   229		}
   230	
   231		if (!stream->construct)
   232			netfs_prepare_write(wreq, stream, start);
   233		subreq = stream->construct;
   234	
   235		part = min(subreq->max_len - subreq->len, len);
 > 236		_debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
   237		subreq->len += part;
   238		subreq->nr_segs++;
   239	
   240		if (subreq->len >= subreq->max_len ||
   241		    subreq->nr_segs >= subreq->max_nr_segs ||
   242		    to_eof) {
   243			netfs_issue_write(wreq, stream);
   244			subreq = NULL;
   245		}
   246	
   247		return part;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
