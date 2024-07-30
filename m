Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27AA1A76C5;
	Tue, 30 Jul 2024 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362516; cv=none; b=XwYx53Gd/h357AFzpIjK3IGnCuIGSx1tKqqJoqr6cwsQSw20dYCugQo5HxUbzWvIWEb6cZUZkAFXaI6S0MlTOnVrZb+H6z91aCRapA/6aU/ZUONkmWUOdxKXdY6neSGWnW9yElhw54j+VoJ60xiYyYF8rrPhX4QpP90dCfofOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362516; c=relaxed/simple;
	bh=cQFnUmyzRL6dRhPLo+YZ4kKLc+PPFdKOIPULfZq3dB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qtp65pbUEBdxYVAPjq1wpwgkmsRcWQpRZwb/xdsMqLMduTXua0lYN+ma4gEmREb+F5pf/kHT9+di2Rolp0XUgbFa6KslaEz565/4Hd1NcQlVtSaKKYn/9sfLIEzrO1UUPWukNxnQrDC7UItK5gAmza2E/AxlGmFGWg9ovfkUNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUaBshE/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUaBshE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722362515; x=1753898515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQFnUmyzRL6dRhPLo+YZ4kKLc+PPFdKOIPULfZq3dB8=;
  b=UUaBshE/knsnS1ACFOg0YE24vaxZkFWzjECYfZc6+5zWo6HBre8sg0Ps
   beAcuTV2hkHzuFCtBu5gUeHJoKYgi9EUpNG6oFRk/xruA/Vhk3rHsl5LR
   hpTLoyOUwbaEv8Asr1fKSEqtto8/OAhqay8elJguhLxCbcPEC7UVeOQ2s
   pfjtk5lI1mevhqblM6RVS3hYUDIoKWw38a13qL8B8c0yqOKU/YonraNKv
   2EqYYnuUJgzJRAxHiiLu2brvmwAUdTfHUYGdF1e9pkeWe+Zyyw446zBWV
   cfbWTC7++e/gJKaDOvikW8I2/69ZX6O6cFC2TwGkuFS89i+IAObcUcpFZ
   Q==;
X-CSE-ConnectionGUID: hdi3eU7JQeyyg9kCxfoykA==
X-CSE-MsgGUID: WJfP7bktQZ6wnRDjLM9dcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23119832"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="23119832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 11:01:54 -0700
X-CSE-ConnectionGUID: NuC3k2+OTimmswySozNqyw==
X-CSE-MsgGUID: AAB1Hg6eROivl3iOH/gHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54461432"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2024 11:01:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYrAV-000tDG-0s;
	Tue, 30 Jul 2024 18:01:51 +0000
Date: Wed, 31 Jul 2024 02:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:for-next 2/2] fs/smb/client/ioctl.c:178:6: warning:
 variable 'flags' is used uninitialized whenever 'if' condition is true
Message-ID: <202407310110.dsjyb2uc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   0aeae343da69af8c0516b6650312be517d4ff6a8
commit: 0aeae343da69af8c0516b6650312be517d4ff6a8 [2/2] smb3: add dynamic tracepoints for shutdown ioctl
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240731/202407310110.dsjyb2uc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310110.dsjyb2uc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310110.dsjyb2uc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/ioctl.c:178:6: warning: variable 'flags' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     178 |         if (!capable(CAP_SYS_ADMIN)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/ioctl.c:236:30: note: uninitialized use occurs here
     236 |         trace_smb3_shutdown_err(rc, flags, tcon->tid);
         |                                     ^~~~~
   fs/smb/client/ioctl.c:178:2: note: remove the 'if' if its condition is always false
     178 |         if (!capable(CAP_SYS_ADMIN)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     179 |                 rc = -EPERM;
         |                 ~~~~~~~~~~~~
     180 |                 goto shutdown_out_err;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     181 |         }
         |         ~
   fs/smb/client/ioctl.c:175:13: note: initialize the variable 'flags' to silence this warning
     175 |         __u32 flags;
         |                    ^
         |                     = 0
>> fs/smb/client/ioctl.c:178:6: warning: variable 'tcon' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     178 |         if (!capable(CAP_SYS_ADMIN)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/ioctl.c:236:37: note: uninitialized use occurs here
     236 |         trace_smb3_shutdown_err(rc, flags, tcon->tid);
         |                                            ^~~~
   fs/smb/client/ioctl.c:178:2: note: remove the 'if' if its condition is always false
     178 |         if (!capable(CAP_SYS_ADMIN)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     179 |                 rc = -EPERM;
         |                 ~~~~~~~~~~~~
     180 |                 goto shutdown_out_err;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     181 |         }
         |         ~
   fs/smb/client/ioctl.c:174:24: note: initialize the variable 'tcon' to silence this warning
     174 |         struct cifs_tcon *tcon;
         |                               ^
         |                                = NULL
   2 warnings generated.


vim +178 fs/smb/client/ioctl.c

   169	
   170	static int cifs_shutdown(struct super_block *sb, unsigned long arg)
   171	{
   172		struct cifs_sb_info *sbi = CIFS_SB(sb);
   173		struct tcon_link *tlink;
   174		struct cifs_tcon *tcon;
 > 175		__u32 flags;
   176		int rc;
   177	
 > 178		if (!capable(CAP_SYS_ADMIN)) {
   179			rc = -EPERM;
   180			goto shutdown_out_err;
   181		}
   182	
   183		if (get_user(flags, (__u32 __user *)arg))
   184			return -EFAULT;
   185	
   186		tlink = cifs_sb_tlink(sbi);
   187		if (IS_ERR(tlink))
   188			return PTR_ERR(tlink);
   189		tcon = tlink_tcon(tlink);
   190	
   191		trace_smb3_shutdown_enter(flags, tcon->tid);
   192		if (flags > CIFS_GOING_FLAGS_NOLOGFLUSH) {
   193			rc = -EINVAL;
   194			goto shutdown_out_err;
   195		}
   196	
   197		if (cifs_forced_shutdown(sbi))
   198			goto shutdown_good;
   199	
   200		cifs_dbg(VFS, "shut down requested (%d)", flags);
   201	
   202		/*
   203		 * see:
   204		 *   https://man7.org/linux/man-pages/man2/ioctl_xfs_goingdown.2.html
   205		 * for more information and description of original intent of the flags
   206		 */
   207		switch (flags) {
   208		/*
   209		 * We could add support later for default flag which requires:
   210		 *     "Flush all dirty data and metadata to disk"
   211		 * would need to call syncfs or equivalent to flush page cache for
   212		 * the mount and then issue fsync to server (if nostrictsync not set)
   213		 */
   214		case CIFS_GOING_FLAGS_DEFAULT:
   215			cifs_dbg(FYI, "shutdown with default flag not supported\n");
   216			rc = -EINVAL;
   217			goto shutdown_out_err;
   218		/*
   219		 * FLAGS_LOGFLUSH is easy since it asks to write out metadata (not
   220		 * data) but metadata writes are not cached on the client, so can treat
   221		 * it similarly to NOLOGFLUSH
   222		 */
   223		case CIFS_GOING_FLAGS_LOGFLUSH:
   224		case CIFS_GOING_FLAGS_NOLOGFLUSH:
   225			sbi->mnt_cifs_flags |= CIFS_MOUNT_SHUTDOWN;
   226			goto shutdown_good;
   227		default:
   228			rc = -EINVAL;
   229			goto shutdown_out_err;
   230		}
   231	
   232	shutdown_good:
   233		trace_smb3_shutdown_done(flags, tcon->tid);
   234		return 0;
   235	shutdown_out_err:
   236		trace_smb3_shutdown_err(rc, flags, tcon->tid);
   237		return rc;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
