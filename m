Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE52731619C;
	Wed,  8 Jul 2026 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491899; cv=none; b=tPYLKasFseOlof8/REGvfKIe8IyUzDBykd3gDPjwelFxMuhhoxnPLQGskJaT5WIUw64SNLlDQn0Ujb3r88ekoZvD5fCaZmp1dSOswL9GiP0l0WJY8EoXLxveTIg3RmUAzo6k9HGZ9a/2UIweyeVIpuoFq58QEgjeiH2rllzy5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491899; c=relaxed/simple;
	bh=cFQdQMuj3NW80WXsm22i7f53HWrn3LtRS6vZGB8O3fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n/1ujgAZ9s3B27gqWJCDobeXChGQxBe3Sy11etq5tRR8Ayb7iXYTktUEfsegAjlZGoSO2mutHDfF/JTqDyN2VDa/+fjpowpF5OaRj1eCeJSrO5LsUJmrWSgDe/9k1x1vNbgwpgO+qSPHcYlZ1rmP3FKuD6BLzZGvFpq1SEj44Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMq59Gje; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMq59Gje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783491898; x=1815027898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFQdQMuj3NW80WXsm22i7f53HWrn3LtRS6vZGB8O3fQ=;
  b=FMq59Gje+P22+RSjFnJm0tQe+0kBpdVru4l1c5RcbD8upVwDbXBmIsRx
   kSLRay3PTuD5H45K/XKqiweHpSCEcIH2y7M5r3Q2jYQqpd007H+ot/gaw
   KG8fo2ZwdyOuH1krZCBueQxJdSx6ljSWqjPhh3OP9EgOP4aAC3nKTLaBv
   EN1HA4QQ/d5IkKlURzqEj9zeWasplWrql1KQfpUmbkyH1uNqrT3T0O3ZO
   t6MKeYJ6QymIJF2mzdrvdxdVqAb8t6iu2lTOtNTjW5g9ELc2AUr0kEEs6
   eWfTtz22Fccn1zQcezRoKGhETOfCblzw3Mkp92rpU20+PvaWk+V/6yPIR
   Q==;
X-CSE-ConnectionGUID: iMUmeK/SS0yYPyHNqe4F1A==
X-CSE-MsgGUID: iniu9yQBRmeY4GtIhIuQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84118878"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84118878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 23:24:57 -0700
X-CSE-ConnectionGUID: 4HGF5TIgR9mjOBw/jyX+bg==
X-CSE-MsgGUID: YwCCp7raR/ekg2CCaHrphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254843951"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Jul 2026 23:24:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whLiG-00000000G5j-0BtO;
	Wed, 08 Jul 2026 06:24:52 +0000
Date: Wed, 08 Jul 2026 14:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Pali =?utf-8?Q?Roh=C3=A1r"?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:pali-patch8 1/1]
 fs/smb/client/reparse.c:434:33: error: too many arguments to function call,
 expected 8, have 9
Message-ID: <202607081443.zDQo6O5Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   git://git.samba.org/ksmbd.git pali-patch8
head:   7ad4ba8846086dd14f26bed6dd56de6d0050dfb4
commit: 7ad4ba8846086dd14f26bed6dd56de6d0050dfb4 [1/1] cifs: Create native Window socket file compatible also with WSL subsystem
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607081443.zDQo6O5Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081443.zDQo6O5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081443.zDQo6O5Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/reparse.c:434:33: error: too many arguments to function call, expected 8, have 9
     429 |                 tcon->ses->server->ops->set_EA(xid, tcon, full_path,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                                                true /* open reparse point */,
     431 |                                                SMB2_WSL_XATTR_MODE,
     432 |                                                &xattr_mode_val,
     433 |                                                SMB2_WSL_XATTR_MODE_SIZE,
     434 |                                                cifs_sb->local_nls, cifs_sb);
         |                                                                    ^~~~~~~
   1 error generated.


vim +434 fs/smb/client/reparse.c

   384	
   385	static int create_native_socket(const unsigned int xid, struct inode *inode,
   386					struct dentry *dentry, struct cifs_tcon *tcon,
   387					const char *full_path, umode_t mode)
   388	{
   389		struct reparse_data_buffer buf = {
   390			.ReparseTag = cpu_to_le32(IO_REPARSE_TAG_AF_UNIX),
   391			.ReparseDataLength = cpu_to_le16(0),
   392		};
   393		struct cifs_open_info_data data = {
   394			.reparse_point = true,
   395			.reparse = { .tag = IO_REPARSE_TAG_AF_UNIX, .buf = &buf, },
   396		};
   397		struct kvec iov = {
   398			.iov_base = &buf,
   399			.iov_len = sizeof(buf),
   400		};
   401	#ifdef CONFIG_CIFS_XATTR
   402		const __le64 xattr_mode_val = cpu_to_le64(mode);
   403		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
   404	#endif
   405		struct inode *new;
   406		int rc = 0;
   407	
   408		new = tcon->ses->server->ops->create_reparse_inode(
   409					     &data, inode->i_sb, xid,
   410					     tcon, full_path, false, &iov, NULL);
   411		if (!IS_ERR(new))
   412			d_instantiate(dentry, new);
   413		else
   414			rc = PTR_ERR(new);
   415	
   416		/*
   417		 * Try to set also optional WSL EA $LXMOD but ignore errors.
   418		 * WSL socket and native Win32/NT sockets uses same reparse point
   419		 * tag IO_REPARSE_TAG_AF_UNIX. WSL subsystem additionally requires
   420		 * EA $LXMOD to be set with the S_IFSOCK value. So setting this EA
   421		 * allows native socket to be recognized also by WSL subsystem.
   422		 * Note that setting of both EAs and reparse points is not supported
   423		 * by NTFS filesystem on Windows 8 / Windows Server 2012 and always
   424		 * fails. So ignore failures from this set_EA call.
   425		 */
   426	#ifdef CONFIG_CIFS_XATTR
   427		if (!rc && tcon->ses->server->ops->set_EA &&
   428		    (le32_to_cpu(tcon->fsAttrInfo.Attributes) & FILE_SUPPORTS_EXTENDED_ATTRIBUTES))
   429			tcon->ses->server->ops->set_EA(xid, tcon, full_path,
   430						       true /* open reparse point */,
   431						       SMB2_WSL_XATTR_MODE,
   432						       &xattr_mode_val,
   433						       SMB2_WSL_XATTR_MODE_SIZE,
 > 434						       cifs_sb->local_nls, cifs_sb);
   435	#endif
   436	
   437		cifs_free_open_info(&data);
   438		return rc;
   439	}
   440	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
