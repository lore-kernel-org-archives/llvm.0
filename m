Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618873FF8A8;
	Thu, 19 Mar 2026 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954618; cv=none; b=MvnsGHs30NZvYyfQAb3k9Cd3GlnckLOIRfjnonMXBR5SxMQGaa2w+5y8GifcweIgbg0upMIC4Wql92BxgPSDxGrLdXYpLRHO678/43XZfFrcibtZ72snSRWIHPHAhBS3HdmKXXpVYNK6kFCg2thoKYqbDcX3wQbzVAQ/6uvpSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954618; c=relaxed/simple;
	bh=T20ujShKVXyNYyBPVvZ0DB1nIQnNnSmSywuG7ANjP5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cQ6TWXOsNGy0jqS92D3s/1P9/DxrB86nJjDJ+4/z7q/LPVFw0KRyW+iyGngduVIXcvdlrZArTaC0jvn/25yQkmHa4tTgEyCu/x9Paja75JzC/CwRtxoxSP2N/yEJSsgm/ohgWVmp4CyaZVezI6EXIRCOZLMlnd5j5SqIRLrEKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoOiOPwr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoOiOPwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773954611; x=1805490611;
  h=date:from:to:cc:subject:message-id;
  bh=T20ujShKVXyNYyBPVvZ0DB1nIQnNnSmSywuG7ANjP5g=;
  b=MoOiOPwr1rRrG9yaGlNArK/zXGpyKrAiPmMU8tPa5soAM+UuIEsOQBdr
   F0s7XLaEA5RL0CWOrIVY2H5tn51rfzV/9OGOinMhHtqtR2WCyEF8Eeg8I
   2zmJLOSKHSY7rBej0xp519pC3ClypLirD8gStovHmd/gdhzD4q0zf3yP9
   2OxZdGI7vqxb2XmPmhN0XpN46KOGAmDvzZIkFXQ/OhR38MThUK05CHHQE
   0tMvZ/8zHheiKjjyCFwBhQBWu60/U3Lp+w10oau4faApJTMb5k6yJ3Zly
   pKV9VmIO2/qrpQjIC2eIMXBneBE+axo30F3hfazxtOUj+7tO2eBNshFr9
   w==;
X-CSE-ConnectionGUID: 8YzddsZyTr2v3NlSGc0ldg==
X-CSE-MsgGUID: wwkSLi2lSsqKV9+vrCB4UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="77646211"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="77646211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:10:10 -0700
X-CSE-ConnectionGUID: 7H4p5ooARASxMKIiy2s5aA==
X-CSE-MsgGUID: gpf1waTxTjKCY5cLOKSQnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228028061"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2026 14:10:09 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Kd3-000000001f7-38yK;
	Thu, 19 Mar 2026 21:10:05 +0000
Date: Fri, 20 Mar 2026 05:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 88/539] security/smack/smackfs.c:840:8:
 error: redefinition of 'data'
Message-ID: <202603200500.o713eiQc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: e1304db7fdf310d4270e4843eb8c7333bdc7f10a [88/539] smack: convert to read/write iterators
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200500.o713eiQc-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200500.o713eiQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200500.o713eiQc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/smack/smackfs.c:840:8: error: redefinition of 'data'
           char *data = NULL;
                 ^
   security/smack/smackfs.c:829:55: note: previous definition is here
   static ssize_t smk_set_cipso(struct file *file, char *data,
                                                         ^
>> security/smack/smackfs.c:860:25: error: use of undeclared identifier 'buf'
           data = memdup_user_nul(buf, count);
                                  ^
>> security/smack/smackfs.c:957:29: error: passing 'const char *' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return smk_set_cipso(file, buf, count, ppos, SMK_FIXED24_FMT);
                                      ^~~
   security/smack/smackfs.c:829:55: note: passing argument to parameter 'data' here
   static ssize_t smk_set_cipso(struct file *file, char *data,
                                                         ^
   security/smack/smackfs.c:1032:29: error: passing 'const char *' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return smk_set_cipso(file, buf, count, ppos, SMK_LONG_FMT);
                                      ^~~
   security/smack/smackfs.c:829:55: note: passing argument to parameter 'data' here
   static ssize_t smk_set_cipso(struct file *file, char *data,
                                                         ^
   security/smack/smackfs.c:2231:36: error: passing 'const char *' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return smk_write_rules_list(file, buf, count, ppos, &tsp->smk_rules,
                                             ^~~
   security/smack/smackfs.c:447:62: note: passing argument to parameter 'data' here
   static ssize_t smk_write_rules_list(struct file *file, char *data,
                                                                ^
   security/smack/smackfs.c:2368:36: error: passing 'const char *' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return smk_write_rules_list(file, buf, count, ppos, NULL, NULL,
                                             ^~~
   security/smack/smackfs.c:447:62: note: passing argument to parameter 'data' here
   static ssize_t smk_write_rules_list(struct file *file, char *data,
                                                                ^
   security/smack/smackfs.c:2442:36: error: passing 'const char *' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return smk_write_rules_list(file, buf, count, ppos, &tsp->smk_rules,
                                             ^~~
   security/smack/smackfs.c:447:62: note: passing argument to parameter 'data' here
   static ssize_t smk_write_rules_list(struct file *file, char *data,
                                                                ^
   security/smack/smackfs.c:2568:36: error: passing 'const char *' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return smk_write_rules_list(file, buf, count, ppos, NULL, NULL,
                                             ^~~
   security/smack/smackfs.c:447:62: note: passing argument to parameter 'data' here
   static ssize_t smk_write_rules_list(struct file *file, char *data,
                                                                ^
   8 errors generated.


vim +/data +840 security/smack/smackfs.c

e114e473771c84 Casey Schaufler    2008-02-04  817  
e114e473771c84 Casey Schaufler    2008-02-04  818  /**
f7112e6c9abf1c Casey Schaufler    2012-05-06  819   * smk_set_cipso - do the work for write() for cipso and cipso2
251a2a958b0455 Randy Dunlap       2009-02-18  820   * @file: file pointer, not actually used
e114e473771c84 Casey Schaufler    2008-02-04  821   * @buf: where to get the data from
e114e473771c84 Casey Schaufler    2008-02-04  822   * @count: bytes sent
e114e473771c84 Casey Schaufler    2008-02-04  823   * @ppos: where to start
f7112e6c9abf1c Casey Schaufler    2012-05-06  824   * @format: /smack/cipso or /smack/cipso2
e114e473771c84 Casey Schaufler    2008-02-04  825   *
e114e473771c84 Casey Schaufler    2008-02-04  826   * Accepts only one cipso rule per write call.
e114e473771c84 Casey Schaufler    2008-02-04  827   * Returns number of bytes written or error code, as appropriate
e114e473771c84 Casey Schaufler    2008-02-04  828   */
e1304db7fdf310 Jens Axboe         2024-04-10  829  static ssize_t smk_set_cipso(struct file *file, char *data,
f7112e6c9abf1c Casey Schaufler    2012-05-06  830  				size_t count, loff_t *ppos, int format)
e114e473771c84 Casey Schaufler    2008-02-04  831  {
c7fb50cecff9ca Konstantin Andreev 2025-01-17  832  	struct netlbl_lsm_catmap *old_cat;
e114e473771c84 Casey Schaufler    2008-02-04  833  	struct smack_known *skp;
f7112e6c9abf1c Casey Schaufler    2012-05-06  834  	struct netlbl_lsm_secattr ncats;
f7112e6c9abf1c Casey Schaufler    2012-05-06  835  	char mapcatset[SMK_CIPSOLEN];
e114e473771c84 Casey Schaufler    2008-02-04  836  	int maplevel;
f7112e6c9abf1c Casey Schaufler    2012-05-06  837  	unsigned int cat;
e114e473771c84 Casey Schaufler    2008-02-04  838  	int catlen;
e114e473771c84 Casey Schaufler    2008-02-04  839  	ssize_t rc = -EINVAL;
e114e473771c84 Casey Schaufler    2008-02-04 @840  	char *data = NULL;
e114e473771c84 Casey Schaufler    2008-02-04  841  	char *rule;
e114e473771c84 Casey Schaufler    2008-02-04  842  	int ret;
e114e473771c84 Casey Schaufler    2008-02-04  843  	int i;
e114e473771c84 Casey Schaufler    2008-02-04  844  
e114e473771c84 Casey Schaufler    2008-02-04  845  	/*
e114e473771c84 Casey Schaufler    2008-02-04  846  	 * Must have privilege.
e114e473771c84 Casey Schaufler    2008-02-04  847  	 * No partial writes.
e114e473771c84 Casey Schaufler    2008-02-04  848  	 * Enough data must be present.
e114e473771c84 Casey Schaufler    2008-02-04  849  	 */
1880eff77e7a7c Casey Schaufler    2012-06-05  850  	if (!smack_privileged(CAP_MAC_ADMIN))
e114e473771c84 Casey Schaufler    2008-02-04  851  		return -EPERM;
e114e473771c84 Casey Schaufler    2008-02-04  852  	if (*ppos != 0)
e114e473771c84 Casey Schaufler    2008-02-04  853  		return -EINVAL;
f7112e6c9abf1c Casey Schaufler    2012-05-06  854  	if (format == SMK_FIXED24_FMT &&
f7112e6c9abf1c Casey Schaufler    2012-05-06  855  	    (count < SMK_CIPSOMIN || count > SMK_CIPSOMAX))
e114e473771c84 Casey Schaufler    2008-02-04  856  		return -EINVAL;
49ec114a6e62d8 Tetsuo Handa       2021-04-12  857  	if (count > PAGE_SIZE)
49ec114a6e62d8 Tetsuo Handa       2021-04-12  858  		return -EINVAL;
e114e473771c84 Casey Schaufler    2008-02-04  859  
16e5c1fc36040e Al Viro            2015-12-24 @860  	data = memdup_user_nul(buf, count);
16e5c1fc36040e Al Viro            2015-12-24  861  	if (IS_ERR(data))
16e5c1fc36040e Al Viro            2015-12-24  862  		return PTR_ERR(data);
e114e473771c84 Casey Schaufler    2008-02-04  863  
e114e473771c84 Casey Schaufler    2008-02-04  864  	rule = data;
e114e473771c84 Casey Schaufler    2008-02-04  865  	/*
e114e473771c84 Casey Schaufler    2008-02-04  866  	 * Only allow one writer at a time. Writes should be
e114e473771c84 Casey Schaufler    2008-02-04  867  	 * quite rare and small in any case.
e114e473771c84 Casey Schaufler    2008-02-04  868  	 */
e114e473771c84 Casey Schaufler    2008-02-04  869  	mutex_lock(&smack_cipso_lock);
e114e473771c84 Casey Schaufler    2008-02-04  870  
e114e473771c84 Casey Schaufler    2008-02-04  871  	skp = smk_import_entry(rule, 0);
e774ad683f425a Lukasz Pawelczyk   2015-04-20  872  	if (IS_ERR(skp)) {
e774ad683f425a Lukasz Pawelczyk   2015-04-20  873  		rc = PTR_ERR(skp);
e114e473771c84 Casey Schaufler    2008-02-04  874  		goto out;
e774ad683f425a Lukasz Pawelczyk   2015-04-20  875  	}
e114e473771c84 Casey Schaufler    2008-02-04  876  
f7112e6c9abf1c Casey Schaufler    2012-05-06  877  	if (format == SMK_FIXED24_FMT)
c19a28e1193a6c Fernando Carrijo   2009-01-07  878  		rule += SMK_LABELLEN;
f7112e6c9abf1c Casey Schaufler    2012-05-06  879  	else
0fcfee61d63b82 Passion,Zhao       2013-06-03  880  		rule += strlen(skp->smk_known) + 1;
f7112e6c9abf1c Casey Schaufler    2012-05-06  881  
84e99e58e8d1e2 Casey Schaufler    2020-04-09  882  	if (rule > data + count) {
84e99e58e8d1e2 Casey Schaufler    2020-04-09  883  		rc = -EOVERFLOW;
84e99e58e8d1e2 Casey Schaufler    2020-04-09  884  		goto out;
84e99e58e8d1e2 Casey Schaufler    2020-04-09  885  	}
84e99e58e8d1e2 Casey Schaufler    2020-04-09  886  
e114e473771c84 Casey Schaufler    2008-02-04  887  	ret = sscanf(rule, "%d", &maplevel);
42a2df3e829f3c Dan Carpenter      2020-07-23  888  	if (ret != 1 || maplevel < 0 || maplevel > SMACK_CIPSO_MAXLEVEL)
e114e473771c84 Casey Schaufler    2008-02-04  889  		goto out;
e114e473771c84 Casey Schaufler    2008-02-04  890  
e114e473771c84 Casey Schaufler    2008-02-04  891  	rule += SMK_DIGITLEN;
84e99e58e8d1e2 Casey Schaufler    2020-04-09  892  	if (rule > data + count) {
84e99e58e8d1e2 Casey Schaufler    2020-04-09  893  		rc = -EOVERFLOW;
84e99e58e8d1e2 Casey Schaufler    2020-04-09  894  		goto out;
84e99e58e8d1e2 Casey Schaufler    2020-04-09  895  	}
84e99e58e8d1e2 Casey Schaufler    2020-04-09  896  
e114e473771c84 Casey Schaufler    2008-02-04  897  	ret = sscanf(rule, "%d", &catlen);
3ad49d37cf5759 Dan Carpenter      2023-07-06  898  	if (ret != 1 || catlen < 0 || catlen > SMACK_CIPSO_MAXCATNUM)
e114e473771c84 Casey Schaufler    2008-02-04  899  		goto out;
e114e473771c84 Casey Schaufler    2008-02-04  900  
f7112e6c9abf1c Casey Schaufler    2012-05-06  901  	if (format == SMK_FIXED24_FMT &&
f7112e6c9abf1c Casey Schaufler    2012-05-06  902  	    count != (SMK_CIPSOMIN + catlen * SMK_DIGITLEN))
e114e473771c84 Casey Schaufler    2008-02-04  903  		goto out;
e114e473771c84 Casey Schaufler    2008-02-04  904  
e114e473771c84 Casey Schaufler    2008-02-04  905  	memset(mapcatset, 0, sizeof(mapcatset));
e114e473771c84 Casey Schaufler    2008-02-04  906  
e114e473771c84 Casey Schaufler    2008-02-04  907  	for (i = 0; i < catlen; i++) {
e114e473771c84 Casey Schaufler    2008-02-04  908  		rule += SMK_DIGITLEN;
a6bd4f6d9b0745 Dan Carpenter      2020-07-23  909  		if (rule > data + count) {
a6bd4f6d9b0745 Dan Carpenter      2020-07-23  910  			rc = -EOVERFLOW;
a6bd4f6d9b0745 Dan Carpenter      2020-07-23  911  			goto out;
a6bd4f6d9b0745 Dan Carpenter      2020-07-23  912  		}
f7112e6c9abf1c Casey Schaufler    2012-05-06  913  		ret = sscanf(rule, "%u", &cat);
677264e8fb73ea Casey Schaufler    2013-06-28  914  		if (ret != 1 || cat > SMACK_CIPSO_MAXCATNUM)
e114e473771c84 Casey Schaufler    2008-02-04  915  			goto out;
e114e473771c84 Casey Schaufler    2008-02-04  916  
e114e473771c84 Casey Schaufler    2008-02-04  917  		smack_catset_bit(cat, mapcatset);
e114e473771c84 Casey Schaufler    2008-02-04  918  	}
c7fb50cecff9ca Konstantin Andreev 2025-01-17  919  
f7112e6c9abf1c Casey Schaufler    2012-05-06  920  	rc = smk_netlbl_mls(maplevel, mapcatset, &ncats, SMK_CIPSOLEN);
f7112e6c9abf1c Casey Schaufler    2012-05-06  921  	if (rc >= 0) {
0817534ff9ea80 Pawan Gupta        2021-08-28  922  		old_cat = skp->smk_netlabel.attr.mls.cat;
2749749afa071f Jiawei Ye          2024-09-02  923  		rcu_assign_pointer(skp->smk_netlabel.attr.mls.cat, ncats.attr.mls.cat);
a158a937d864d0 Konstantin Andreev 2025-01-17  924  		if (ncats.attr.mls.cat)
a158a937d864d0 Konstantin Andreev 2025-01-17  925  			skp->smk_netlabel.flags |= NETLBL_SECATTR_MLS_CAT;
a158a937d864d0 Konstantin Andreev 2025-01-17  926  		else
a158a937d864d0 Konstantin Andreev 2025-01-17  927  			skp->smk_netlabel.flags &= ~(u32)NETLBL_SECATTR_MLS_CAT;
f7112e6c9abf1c Casey Schaufler    2012-05-06  928  		skp->smk_netlabel.attr.mls.lvl = ncats.attr.mls.lvl;
0817534ff9ea80 Pawan Gupta        2021-08-28  929  		synchronize_rcu();
0817534ff9ea80 Pawan Gupta        2021-08-28  930  		netlbl_catmap_free(old_cat);
f7112e6c9abf1c Casey Schaufler    2012-05-06  931  		rc = count;
322dd63c7f9831 Casey Schaufler    2020-08-11  932  		/*
322dd63c7f9831 Casey Schaufler    2020-08-11  933  		 * This mapping may have been cached, so clear the cache.
322dd63c7f9831 Casey Schaufler    2020-08-11  934  		 */
322dd63c7f9831 Casey Schaufler    2020-08-11  935  		netlbl_cache_invalidate();
e114e473771c84 Casey Schaufler    2008-02-04  936  	}
e114e473771c84 Casey Schaufler    2008-02-04  937  
e114e473771c84 Casey Schaufler    2008-02-04  938  out:
e114e473771c84 Casey Schaufler    2008-02-04  939  	mutex_unlock(&smack_cipso_lock);
e114e473771c84 Casey Schaufler    2008-02-04  940  	kfree(data);
e114e473771c84 Casey Schaufler    2008-02-04  941  	return rc;
e114e473771c84 Casey Schaufler    2008-02-04  942  }
e114e473771c84 Casey Schaufler    2008-02-04  943  
f7112e6c9abf1c Casey Schaufler    2012-05-06  944  /**
f7112e6c9abf1c Casey Schaufler    2012-05-06  945   * smk_write_cipso - write() for /smack/cipso
f7112e6c9abf1c Casey Schaufler    2012-05-06  946   * @file: file pointer, not actually used
f7112e6c9abf1c Casey Schaufler    2012-05-06  947   * @buf: where to get the data from
f7112e6c9abf1c Casey Schaufler    2012-05-06  948   * @count: bytes sent
f7112e6c9abf1c Casey Schaufler    2012-05-06  949   * @ppos: where to start
f7112e6c9abf1c Casey Schaufler    2012-05-06  950   *
f7112e6c9abf1c Casey Schaufler    2012-05-06  951   * Accepts only one cipso rule per write call.
f7112e6c9abf1c Casey Schaufler    2012-05-06  952   * Returns number of bytes written or error code, as appropriate
f7112e6c9abf1c Casey Schaufler    2012-05-06  953   */
f7112e6c9abf1c Casey Schaufler    2012-05-06  954  static ssize_t smk_write_cipso(struct file *file, const char __user *buf,
f7112e6c9abf1c Casey Schaufler    2012-05-06  955  			       size_t count, loff_t *ppos)
f7112e6c9abf1c Casey Schaufler    2012-05-06  956  {
f7112e6c9abf1c Casey Schaufler    2012-05-06 @957  	return smk_set_cipso(file, buf, count, ppos, SMK_FIXED24_FMT);
f7112e6c9abf1c Casey Schaufler    2012-05-06  958  }
e1304db7fdf310 Jens Axboe         2024-04-10  959  FOPS_WRITE_ITER_HELPER(smk_write_cipso);
f7112e6c9abf1c Casey Schaufler    2012-05-06  960  

:::::: The code at line 840 was first introduced by commit
:::::: e114e473771c848c3cfec05f0123e70f1cdbdc99 Smack: Simplified Mandatory Access Control Kernel

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
