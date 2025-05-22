Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB0028BAA5;
	Thu, 22 May 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924497; cv=none; b=cAWjTiOHZSFmvTzk2ft0YaEPDgbRXCQF2rt76rJBV6ShqNYy+Gz8NdmavXxrKRzmw8qKcsfOsmjWt0/TcSrh3zZWVKlUlyjUP73Rf27jkLwgekzoNxBjDLIBkAmNCsy7Lc8CyxsASQnIjBXrgdh+G11kh02P/RhB0AI4QAUU4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924497; c=relaxed/simple;
	bh=xqAqvgAubILWGhXACIlm432+BBt51LD8pVliVtzDTNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms7I7yJ18JsWLHf1ZhYrmZRImrNTRySPHJf+26BRx4OzjvNPPXU1Aa1inDII9amjARS1lVOB0THwlrn7r3gj7t+yh65SlFceQUdNAoOGITc26IqOSdljNA2BE7wXpE4lgv+Ygvt/ZrWJ/rQYFUm3nDF+svt3va4MC0rsYQADsnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Us/6+8f6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Us/6+8f6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747924496; x=1779460496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xqAqvgAubILWGhXACIlm432+BBt51LD8pVliVtzDTNI=;
  b=Us/6+8f6pLC4+jCs6jsggpexx0QNZOdm+iM1nZLpRvwCanL6zZtgpAcx
   AXBr66DtvwaiU5mMHus/88DTPewdN0PRhly8CNbaY3Jg9RPGd28Sydpgu
   ZC0E2nlsmHCHoWIjGt+oMa7aQHrMRZHfjetKdx7wSWrATZ1PLWyI/st7k
   326bbl0oXAC1HPTtPSRzkEVL6LkOyYiO9bWazupM3wXIhiF+kudrw1K2U
   RK15iSQyLe7eX2SF52d1ddX2DdXg1vD/SFEld4/kv5ARwks0v5T53YPw+
   fmOYtygmmQ+jgpyhds4PGFrkiJt6aVs7uJYA1KzvqfvKudu0wPMl3NZW8
   Q==;
X-CSE-ConnectionGUID: fGCdxv3ZTKCZ6XdE4mUeTg==
X-CSE-MsgGUID: WsQD4/E/QimI2zDK93xOrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50115556"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50115556"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:34:55 -0700
X-CSE-ConnectionGUID: UN2ecM1vTgeSqkkQHGGHMA==
X-CSE-MsgGUID: QTQ8cnZCTM2n1wIYlnU0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="144589256"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 May 2025 07:34:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI70V-000PQ5-24;
	Thu, 22 May 2025 14:34:51 +0000
Date: Thu, 22 May 2025 22:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 42/43] fs/nfsd/nfs4state.c:9707:56: warning:
 format specifies type 'long' but the argument has type 'int'
Message-ID: <202505222243.QDfjEgah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   0c6668479bba48114e5031d6fb3db53d80d8d6ad
commit: 1a1ed17116bff2122995a9a1f09e5c4df41b2997 [42/43] DEBUG: trace_printks all over the place
config: i386-buildonly-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222243.QDfjEgah-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505222243.QDfjEgah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222243.QDfjEgah-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:9707:56: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
    9707 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                                                          ~~~                ^~~~~~~~~~~~~~~~~~~
         |                                                          %d
   include/linux/kernel.h:275:26: note: expanded from macro 'trace_printk'
     275 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/kernel.h:286:37: note: expanded from macro 'do_trace_printk'
     286 |         __trace_printk_check_format(fmt, ##args);                       \
         |                                     ~~~    ^~~~
   include/linux/kernel.h:238:40: note: expanded from macro '__trace_printk_check_format'
     238 |                 ____trace_printk_check_format(fmt, ##args);             \
         |                                               ~~~    ^~~~
>> fs/nfsd/nfs4state.c:9707:56: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
    9707 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                                                          ~~~                ^~~~~~~~~~~~~~~~~~~
         |                                                          %d
   include/linux/kernel.h:275:26: note: expanded from macro 'trace_printk'
     275 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/kernel.h:291:36: note: expanded from macro 'do_trace_printk'
     291 |                 __trace_printk(_THIS_IP_, fmt, ##args);                 \
         |                                           ~~~    ^~~~
   2 warnings generated.


vim +9707 fs/nfsd/nfs4state.c

  9645	
  9646	int
  9647	nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
  9648				  const struct qstr *name)
  9649	{
  9650		struct file_lock_context *ctx;
  9651		struct file_lock_core *flc;
  9652	
  9653		trace_nfsd_file_fsnotify_handle_dir_event(inode, dir, mask);
  9654	
  9655		ctx = locks_inode_context(dir);
  9656		if (!ctx || list_empty(&ctx->flc_lease)) {
  9657			trace_printk("no ctx or list_empty\n");
  9658			return 0;
  9659		}
  9660	
  9661		/*
  9662		 * Do getattr against @inode, and then generate an fattr4. Use that as the
  9663		 * ne_attrs in the notify_entry4's.
  9664		 */
  9665		spin_lock(&ctx->flc_lock);
  9666		list_for_each_entry(flc, &ctx->flc_lease, flc_list) {
  9667			struct file_lease *fl = container_of(flc, struct file_lease, c);
  9668			struct nfs4_delegation *dp = flc->flc_owner;
  9669			struct nfsd4_cb_notify *ncn = &dp->dl_cb_notify;
  9670			struct nfsd4_notify_spool *nns = ncn->ncn_gather;
  9671			struct xdr_stream *stream = &nns->nns_stream;
  9672			static uint32_t zerobm = 0;
  9673	
  9674			trace_printk("considering fl=%p\n", fl);
  9675			if (fl->fl_lmops != &nfsd_dir_lease_mng_ops) {
  9676				trace_printk("fl_lmops doesn't match\n");
  9677				continue;
  9678			}
  9679	
  9680			/* If no buffer or slots are available, give up and break the deleg */
  9681			if (!nns || nns->nns_idx >= NFSD4_NOTIFY_SPOOL_SZ) {
  9682				trace_printk("no buffer");
  9683				nfsd_break_deleg_cb(fl);
  9684				continue;
  9685			}
  9686	
  9687			if (mask & FS_DELETE) {
  9688				static uint32_t notify_remove_bitmap = BIT(NOTIFY4_REMOVE_ENTRY);
  9689				struct notify4 *ent = &nns->nns_ent[nns->nns_idx];
  9690				struct notify_remove4 nr = { };
  9691				u8 *p = (u8 *)(stream->p);
  9692	
  9693				if (!(flc->flc_flags & FL_IGN_DIR_DELETE)) {
  9694					trace_printk("FL_IGN_DIR_DELETE not set\n");
  9695					continue;
  9696				}
  9697	
  9698				nr.nrm_old_entry.ne_file.len = name->len;
  9699				nr.nrm_old_entry.ne_file.data = (char *)name->name;
  9700				nr.nrm_old_entry.ne_attrs.attrmask.count = 1;
  9701				nr.nrm_old_entry.ne_attrs.attrmask.element = &zerobm;
  9702				if (!xdrgen_encode_notify_remove4(stream, &nr)) {
  9703					pr_warn("nfsd: unable to marshal notify_remove4 to xdr stream\n");
  9704					continue;
  9705				}
  9706	
> 9707				trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
