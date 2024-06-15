Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA201B950;
	Sat, 15 Jun 2024 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718439473; cv=none; b=Ag5AhPxCdxymNv52iktktHCZWA2YdorObFmHuoPdK5QXJLjtlSiBC2NWSlMcVzHgBFU5ER5xH9LoabPqx1+Pb4E101ojQ/HK9qP2w94r17RkuRpd9gRFSunf55UELOEZuMRk4slfZzOYkaS7rukghgb8Q1SrvFSmcx+K2EUatSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718439473; c=relaxed/simple;
	bh=9ZPXo80veTMZF3yzDVmF5Ma03AjmP0nyxtJoVLB/zkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZm5h44RGPWyA4z6OixGbkTmWd6YNGVSH0MOXCHbrBQCWpzyv+47br1TS468+eXkt1Mprl+1eTFmBlAOS9ps892H4F9z+1vEcBHjCBk22F6UnIYTruyTkCuaTn8dGpezfUAka9Y/bzVI+aUxsNRX/qd6HPHSI0RNTVmmTiQgGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O79FN0wP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O79FN0wP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718439472; x=1749975472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZPXo80veTMZF3yzDVmF5Ma03AjmP0nyxtJoVLB/zkQ=;
  b=O79FN0wPePAbDAgihuVFWaCxyDdWwZ5SrccNNXmxBYSn/+lC7ounC5uf
   zuDNFZoFcG8ZoIfAgdpAxteZIeLHagb9RCsOvWUAu7PjoFKzykuvkqXvq
   Ag/AffOOgjsBORw0I3PSjpRkJPGPeHSosgsQDKDjVyvf9iQ9vBu6LV06Y
   CHlraQhhyC66g6KNTi4Zt2Hkm8KgxhMlXfPvuDyb42xNuNzpXBfad/PlK
   tkh2a9qutxBgXo4Jd8kRgh/9sXCpXvGN7hLGbTQyFh2K5dpZOoNOLyxVV
   2XoFm5QMABKm57+cDwx3b8MPbd1Ks3BBDOWLQAW9dIKS0HnzM0sA4KwR/
   Q==;
X-CSE-ConnectionGUID: UfiRz5rJQcSdnXDt3cpFuw==
X-CSE-MsgGUID: L3ajVzLERXm1u62OlzrFew==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="37859817"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="37859817"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 01:17:52 -0700
X-CSE-ConnectionGUID: 3XVxrubOTb6Y0yCD28MSlA==
X-CSE-MsgGUID: XelJFQ/wRCuaUmA0DQ+Apg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="63939683"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jun 2024 01:17:49 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIObb-0002N1-2n;
	Sat, 15 Jun 2024 08:17:47 +0000
Date: Sat, 15 Jun 2024 16:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 7/7] security/keys/process_keys.c:771:47:
 warning: format specifies type 'int' but the argument has type 'long'
Message-ID: <202406151629.ksL0j1Je-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   bcc939c27d5d9bddbba697c643ede5cfa2e37c4a
commit: bcc939c27d5d9bddbba697c643ede5cfa2e37c4a [7/7] fixup
config: i386-buildonly-randconfig-001-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151629.ksL0j1Je-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151629.ksL0j1Je-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151629.ksL0j1Je-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/keys/process_keys.c:771:47: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
     771 |                         pr_info("%s: skey_ref err=%d\n", __func__, PTR_ERR(skey_ref));
         |                                                   ~~               ^~~~~~~~~~~~~~~~~
         |                                                   %ld
   include/linux/printk.h:537:34: note: expanded from macro 'pr_info'
     537 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +771 security/keys/process_keys.c

   592	
   593	/*
   594	 * Look up a key ID given us by userspace with a given permissions mask to get
   595	 * the key it refers to.
   596	 *
   597	 * Flags can be passed to request that special keyrings be created if referred
   598	 * to directly, to permit partially constructed keys to be found and to skip
   599	 * validity and permission checks on the found key.
   600	 *
   601	 * Returns a pointer to the key with an incremented usage count if successful;
   602	 * -EINVAL if the key ID is invalid; -ENOKEY if the key ID does not correspond
   603	 * to a key or the best found key was a negative key; -EKEYREVOKED or
   604	 * -EKEYEXPIRED if the best found key was revoked or expired; -EACCES if the
   605	 * found key doesn't grant the requested permit or the LSM denied access to it;
   606	 * or -ENOMEM if a special keyring couldn't be created.
   607	 *
   608	 * In the case of a successful return, the possession attribute is set on the
   609	 * returned key reference.
   610	 */
   611	key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
   612				  enum key_need_perm need_perm)
   613	{
   614		struct keyring_search_context ctx = {
   615			.match_data.cmp		= lookup_user_key_possessed,
   616			.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
   617			.flags			= (KEYRING_SEARCH_NO_STATE_CHECK |
   618						   KEYRING_SEARCH_RECURSE),
   619		};
   620		struct request_key_auth *rka;
   621		struct key *key, *user_session;
   622		key_ref_t key_ref, skey_ref;
   623		int ret;
   624	
   625	try_again:
   626		ctx.cred = get_current_cred();
   627		key_ref = ERR_PTR(-ENOKEY);
   628	
   629		switch (id) {
   630		case KEY_SPEC_THREAD_KEYRING:
   631			if (!ctx.cred->thread_keyring) {
   632				if (!(lflags & KEY_LOOKUP_CREATE))
   633					goto error;
   634	
   635				ret = install_thread_keyring();
   636				if (ret < 0) {
   637					key_ref = ERR_PTR(ret);
   638					goto error;
   639				}
   640				goto reget_creds;
   641			}
   642	
   643			key = ctx.cred->thread_keyring;
   644			__key_get(key);
   645			key_ref = make_key_ref(key, 1);
   646			break;
   647	
   648		case KEY_SPEC_PROCESS_KEYRING:
   649			if (!ctx.cred->process_keyring) {
   650				if (!(lflags & KEY_LOOKUP_CREATE))
   651					goto error;
   652	
   653				ret = install_process_keyring();
   654				if (ret < 0) {
   655					key_ref = ERR_PTR(ret);
   656					goto error;
   657				}
   658				goto reget_creds;
   659			}
   660	
   661			key = ctx.cred->process_keyring;
   662			__key_get(key);
   663			key_ref = make_key_ref(key, 1);
   664			break;
   665	
   666		case KEY_SPEC_SESSION_KEYRING:
   667			if (!ctx.cred->session_keyring) {
   668				/* always install a session keyring upon access if one
   669				 * doesn't exist yet */
   670				ret = look_up_user_keyrings(NULL, &user_session);
   671				if (ret < 0)
   672					goto error;
   673				if (lflags & KEY_LOOKUP_CREATE)
   674					ret = join_session_keyring(NULL);
   675				else
   676					ret = install_session_keyring(user_session);
   677	
   678				key_put(user_session);
   679				if (ret < 0)
   680					goto error;
   681				goto reget_creds;
   682			} else if (test_bit(KEY_FLAG_UID_KEYRING,
   683					    &ctx.cred->session_keyring->flags) &&
   684				   lflags & KEY_LOOKUP_CREATE) {
   685				ret = join_session_keyring(NULL);
   686				if (ret < 0)
   687					goto error;
   688				goto reget_creds;
   689			}
   690	
   691			key = ctx.cred->session_keyring;
   692			__key_get(key);
   693			key_ref = make_key_ref(key, 1);
   694			break;
   695	
   696		case KEY_SPEC_USER_KEYRING:
   697			ret = look_up_user_keyrings(&key, NULL);
   698			if (ret < 0)
   699				goto error;
   700			key_ref = make_key_ref(key, 1);
   701			break;
   702	
   703		case KEY_SPEC_USER_SESSION_KEYRING:
   704			ret = look_up_user_keyrings(NULL, &key);
   705			if (ret < 0)
   706				goto error;
   707			key_ref = make_key_ref(key, 1);
   708			break;
   709	
   710		case KEY_SPEC_GROUP_KEYRING:
   711			/* group keyrings are not yet supported */
   712			key_ref = ERR_PTR(-EINVAL);
   713			goto error;
   714	
   715		case KEY_SPEC_REQKEY_AUTH_KEY:
   716			key = ctx.cred->request_key_auth;
   717			if (!key)
   718				goto error;
   719	
   720			__key_get(key);
   721			key_ref = make_key_ref(key, 1);
   722			break;
   723	
   724		case KEY_SPEC_REQUESTOR_KEYRING:
   725			if (!ctx.cred->request_key_auth)
   726				goto error;
   727	
   728			down_read(&ctx.cred->request_key_auth->sem);
   729			if (test_bit(KEY_FLAG_REVOKED,
   730				     &ctx.cred->request_key_auth->flags)) {
   731				key_ref = ERR_PTR(-EKEYREVOKED);
   732				key = NULL;
   733			} else {
   734				rka = ctx.cred->request_key_auth->payload.data[0];
   735				key = rka->dest_keyring;
   736				__key_get(key);
   737			}
   738			up_read(&ctx.cred->request_key_auth->sem);
   739			if (!key)
   740				goto error;
   741			key_ref = make_key_ref(key, 1);
   742			break;
   743	
   744		default:
   745			key_ref = ERR_PTR(-EINVAL);
   746			if (id < 1)
   747				goto error;
   748	
   749			key = key_lookup(id);
   750			if (IS_ERR(key)) {
   751				key_ref = ERR_CAST(key);
   752				goto error;
   753			}
   754	
   755			pr_info("%s: continue\n", __func__);
   756			key_ref = make_key_ref(key, 0);
   757	
   758			/* check to see if we possess the key */
   759			ctx.index_key			= key->index_key;
   760			ctx.match_data.raw_data		= key;
   761			kdebug("check possessed");
   762			rcu_read_lock();
   763			skey_ref = search_process_keyrings_rcu(&ctx);
   764			rcu_read_unlock();
   765			kdebug("possessed=%p", skey_ref);
   766	
   767			if (!IS_ERR(skey_ref)) {
   768				key_put(key);
   769				key_ref = skey_ref;
   770			} else {
 > 771				pr_info("%s: skey_ref err=%d\n", __func__, PTR_ERR(skey_ref));
   772			}
   773	
   774			break;
   775		}
   776	
   777		/* unlink does not use the nominated key in any way, so can skip all
   778		 * the permission checks as it is only concerned with the keyring */
   779		if (need_perm != KEY_NEED_UNLINK) {
   780			if (!(lflags & KEY_LOOKUP_PARTIAL)) {
   781				ret = wait_for_key_construction(key, true);
   782				switch (ret) {
   783				case -ERESTARTSYS:
   784					goto invalid_key;
   785				default:
   786					if (need_perm != KEY_AUTHTOKEN_OVERRIDE &&
   787					    need_perm != KEY_DEFER_PERM_CHECK)
   788						goto invalid_key;
   789					break;
   790				case 0:
   791					break;
   792				}
   793			} else if (need_perm != KEY_DEFER_PERM_CHECK) {
   794				ret = key_validate(key);
   795				if (ret < 0)
   796					goto invalid_key;
   797			}
   798	
   799			ret = -EIO;
   800			if (!(lflags & KEY_LOOKUP_PARTIAL) &&
   801			    key_read_state(key) == KEY_IS_UNINSTANTIATED)
   802				goto invalid_key;
   803		}
   804	
   805		/* check the permissions */
   806		ret = key_task_permission(key_ref, ctx.cred, need_perm);
   807		if (ret < 0)
   808			goto invalid_key;
   809	
   810		key->last_used_at = ktime_get_real_seconds();
   811	
   812	error:
   813		put_cred(ctx.cred);
   814		return key_ref;
   815	
   816	invalid_key:
   817		key_ref_put(key_ref);
   818		key_ref = ERR_PTR(ret);
   819		goto error;
   820	
   821		/* if we attempted to install a keyring, then it may have caused new
   822		 * creds to be installed */
   823	reget_creds:
   824		put_cred(ctx.cred);
   825		goto try_again;
   826	}
   827	EXPORT_SYMBOL(lookup_user_key);
   828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
