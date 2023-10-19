Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8B20FD;
	Thu, 19 Oct 2023 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNmgHZfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697694297; x=1729230297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WW2XN/8T4dUfviq+J47JnlHi4/WTNMvqDbRUo25KYzM=;
  b=JNmgHZfktLpWSGJ8G65sv/s+AF0ht4pUTLDnr6MDANNg0kc+COxT9oxt
   uG9Kiiu+rjHnNJDmUW3fzzu2BYCmaeVjN0ET6sfcnZiBnAHYRwOGf1KBR
   WWAJsb1EU+Q31cYOLfh5o2ZkJzdzL+i6La+0jZKZq3ZUV1b6Rp34KMPkH
   LmDTslQ2m7Uzmg6Fcz2IQsI5Pn4gzyw5ThSEWWwS+k1JcOTwUZ1aVk7Un
   IsB/MyIQdm5doLTmBsRkVEWPgQADk7VjeguIXrM89PsGBQUZgTfkW1bjX
   NvoFp3/H/QocMYUynFjwAoxUYlt9XV2taBumZLhsZMoGQDTZEFKNfUfrC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7730807"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="7730807"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 22:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760510434"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="760510434"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Oct 2023 22:44:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtLpz-0001i3-0R;
	Thu, 19 Oct 2023 05:44:51 +0000
Date: Thu, 19 Oct 2023 13:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v6 22/26]
 drivers/scsi/scsi_error.c:1277:6: warning: no previous prototype for
 function '__scsi_eh_finish_cmd'
Message-ID: <202310191300.pgpCJnlj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v6
head:   1e93963cdc1f4d2671b12c37a09b861f40313768
commit: 043bb4700d22ea8d579b0e8e24e7fee68e4a11ca [22/26] scsi: set host byte after EH completed
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231019/202310191300.pgpCJnlj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191300.pgpCJnlj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191300.pgpCJnlj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:1277:6: warning: no previous prototype for function '__scsi_eh_finish_cmd' [-Wmissing-prototypes]
   void __scsi_eh_finish_cmd(struct scsi_cmnd *scmd, struct list_head *done_q,
        ^
   drivers/scsi/scsi_error.c:1277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __scsi_eh_finish_cmd(struct scsi_cmnd *scmd, struct list_head *done_q,
   ^
   static 
   1 warning generated.


vim +/__scsi_eh_finish_cmd +1277 drivers/scsi/scsi_error.c

  1263	
  1264	/**
  1265	 * __scsi_eh_finish_cmd - Handle a cmd that eh is finished with.
  1266	 * @scmd:	Original SCSI cmd that eh has finished.
  1267	 * @done_q:	Queue for processed commands.
  1268	 * @host_byte:	Host byte of the command status to be set
  1269	 *
  1270	 * Notes:
  1271	 *    We don't want to use the normal command completion while we are are
  1272	 *    still handling errors - it may cause other commands to be queued,
  1273	 *    and that would disturb what we are doing.  Thus we really want to
  1274	 *    keep a list of pending commands for final completion, and once we
  1275	 *    are ready to leave error handling we handle completion for real.
  1276	 */
> 1277	void __scsi_eh_finish_cmd(struct scsi_cmnd *scmd, struct list_head *done_q,
  1278				int host_byte)
  1279	{
  1280		if (host_byte)
  1281			set_host_byte(scmd, host_byte);
  1282		list_move_tail(&scmd->eh_entry, done_q);
  1283	}
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
