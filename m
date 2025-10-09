Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3AC2417E6;
	Thu,  9 Oct 2025 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022167; cv=none; b=peDNsoVtjq9rPWMeWvVyw+efbrKiILATk+6J+CxEEvhQi5S7reJP5lctmHnFc88jvL3XlmoQPrCYsPQGUpieuJaGWu2NwOmvwmMsx0UTAfy7Q0XHN/tTdjK9nTrtrkvufMFQ0xTEDt5Vys9ulu/arUylyZ7swa3a/nPoVqL8+2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022167; c=relaxed/simple;
	bh=Gj5G46QFWGjSz9FUz2xVDHoyy50Dljewu/SyxI/TZ38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XwXZ0X2JS9SKDu5thKPhsMpzFFurDkP9k3ONygQ7yzAJhao0K6gK3o3qc38DCPSHQBMtJsYfVMSah95LviFVKWx8hBB6rmXUsg+5mlXXRa9ESJRZglbs5o6x4BO2SO2IHEoDk/pTAOfbhPKfij2nbQe2qOpAH8aPP7k5gWiXurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6/lxHcU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6/lxHcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760022166; x=1791558166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gj5G46QFWGjSz9FUz2xVDHoyy50Dljewu/SyxI/TZ38=;
  b=V6/lxHcU8dkf2EZemstnpwhP4JUn9odzHvdxPRaVTGWXeZnepvKHnbTY
   uAJTMt1cfbZEkQvYVh1vMzu8kNZP8QT6gdf3J0wpdXRfVR2GK9EVe4N5H
   4rnGJaAGZK28mmtH3AqxiE/DbdCec/mo2qvtpJJEb4PQyo7KS/z5guSu1
   rKLkdN7tlHsXU1phQSbHqXsfzacIeXxU0xt3uBSqG9+QKaE9HzKHkgdwX
   ptplMqct8hukULy9bcEeXLQ7pcjFCaT+NBqRLwV51JJW6RV0R2gKTJ8nZ
   NItjqjqiHvIX/r8sy49frenTYrLS/RilZ4xD9OjoYa4Ahkzf87v8D+GT/
   w==;
X-CSE-ConnectionGUID: nWO2enDcSwmwSoZNRmpNRQ==
X-CSE-MsgGUID: Ty713YqKSMOTntN6KO56+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66087888"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="66087888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 08:02:45 -0700
X-CSE-ConnectionGUID: uj4eTCjWSDaRG15vIhv5TA==
X-CSE-MsgGUID: +G2A3AdPT0mATTbQ/iYmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="181147466"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Oct 2025 08:02:44 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6sAD-0000rv-2o;
	Thu, 09 Oct 2025 15:02:41 +0000
Date: Thu, 9 Oct 2025 23:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Elfring <elfring@users.sourceforge.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 13403/13588] fs/smb/client/smb2ops.c:3128:3:
 warning: variable 'rc' is uninitialized when used here
Message-ID: <202510092253.kjfjscfD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
commit: e3699346828bf78aaacdae52356c69c1ab0f8cd6 [13403/13588] smb: client: Simplify a return statement in get_smb2_acl_by_path()
config: hexagon-randconfig-001-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092253.kjfjscfD-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092253.kjfjscfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092253.kjfjscfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/smb2ops.c:3128:3: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
                   free_xid(xid);
                   ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:54:6: note: expanded from macro 'free_xid'
           if (rc)                                                         \
               ^~
   fs/smb/client/smb2ops.c:3112:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   1 warning generated.


vim +/rc +3128 fs/smb/client/smb2ops.c

2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3104  
3651487607ae77 fs/smb/client/smb2ops.c ChenXiaoSong       2024-08-22  3105  static struct smb_ntsd *
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3106  get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3107  		     const char *path, u32 *pacllen, u32 info)
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3108  {
3651487607ae77 fs/smb/client/smb2ops.c ChenXiaoSong       2024-08-22  3109  	struct smb_ntsd *pntsd = NULL;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3110  	u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3111  	unsigned int xid;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3112  	int rc;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3113  	struct cifs_tcon *tcon;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3114  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3115  	struct cifs_fid fid;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3116  	struct cifs_open_parms oparms;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3117  	__le16 *utf16_path;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3118  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3119  	cifs_dbg(FYI, "get smb3 acl for path %s\n", path);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3120  	if (IS_ERR(tlink))
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3121  		return ERR_CAST(tlink);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3122  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3123  	tcon = tlink_tcon(tlink);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3124  	xid = get_xid();
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3125  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3126  	utf16_path = cifs_convert_path_to_utf16(path, cifs_sb);
cfe89091644c44 fs/cifs/smb2ops.c       Steve French       2018-05-19  3127  	if (!utf16_path) {
cfe89091644c44 fs/cifs/smb2ops.c       Steve French       2018-05-19 @3128  		free_xid(xid);
e3699346828bf7 fs/smb/client/smb2ops.c Markus Elfring     2025-10-08  3129  		return ERR_PTR(-ENOMEM);
cfe89091644c44 fs/cifs/smb2ops.c       Steve French       2018-05-19  3130  	}
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3131  
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3132  	oparms = (struct cifs_open_parms) {
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3133  		.tcon = tcon,
fddc6ccc487e5d fs/cifs/smb2ops.c       Shyam Prasad N     2023-03-17  3134  		.path = path,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3135  		.desired_access = READ_CONTROL,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3136  		.disposition = FILE_OPEN,
3c3317daef0afa fs/cifs/smb2ops.c       Steve French       2020-10-21  3137  		/*
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3138  		 * When querying an ACL, even if the file is a symlink
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3139  		 * we want to open the source not the target, and so
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3140  		 * the protocol requires that the client specify this
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3141  		 * flag when opening a reparse point
3c3317daef0afa fs/cifs/smb2ops.c       Steve French       2020-10-21  3142  		 */
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3143  		.create_options = cifs_create_options(cifs_sb, 0) |
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3144  				  OPEN_REPARSE_POINT,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3145  		.fid = &fid,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3146  	};
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3147  
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3148  	if (info & SACL_SECINFO)
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3149  		oparms.desired_access |= SYSTEM_SECURITY;
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3150  
69dda3059e7a4d fs/cifs/smb2ops.c       Aurelien Aptel     2020-03-02  3151  	rc = SMB2_open(xid, &oparms, utf16_path, &oplock, NULL, NULL, NULL,
69dda3059e7a4d fs/cifs/smb2ops.c       Aurelien Aptel     2020-03-02  3152  		       NULL);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3153  	kfree(utf16_path);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3154  	if (!rc) {
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3155  		rc = SMB2_query_acl(xid, tlink_tcon(tlink), fid.persistent_fid,
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3156  				    fid.volatile_fid, (void **)&pntsd, pacllen,
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3157  				    info);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3158  		SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fid);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3159  	}
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3160  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3161  	cifs_put_tlink(tlink);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3162  	free_xid(xid);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3163  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3164  	cifs_dbg(FYI, "%s: rc = %d ACL len %d\n", __func__, rc, *pacllen);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3165  	if (rc)
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3166  		return ERR_PTR(rc);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3167  	return pntsd;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3168  }
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3169  

:::::: The code at line 3128 was first introduced by commit
:::::: cfe89091644c441a1ade6dae6d2e47b715648615 smb3: fix various xid leaks

:::::: TO: Steve French <stfrench@microsoft.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
