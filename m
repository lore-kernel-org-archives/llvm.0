Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971E282F25;
	Fri, 17 Apr 2026 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776424717; cv=none; b=FAtnhdQjx8Q75y4ibhzf/4TnjixF27ySeeP+Kd3c1vYih7/J8lkiw1ZtXe6OlYTr0laewkKKIazfBsNVbOq6RgeOgwFyxUrxprR4O2ndTKMsYGRJB4KAxfLNsCKhrpT9L+O5h3A3SOYv3LydfcP5n1zlksMOuC9XIeeUaJQoHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776424717; c=relaxed/simple;
	bh=ZBM3GsCaH2Q45jvPNXGBjBBF7xWufrYUKiVWkVejlHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r2v1vGm/7tEFBLK7AIR+/BTkiYWmI+uKPXkQTwNItClK+9xGRtX91PsYQ7y6Qvt4Mc1erWsepiOdaEmyEWCBR0+L32iuU4m9ugWrKHWlPpUH2nChuVQd8EROFo7jycvXYYqPAD6b+KU+VxoEa2cctf4h5ngH4hix1cjRJrVHwPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOQmoRXs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOQmoRXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776424715; x=1807960715;
  h=date:from:to:cc:subject:message-id;
  bh=ZBM3GsCaH2Q45jvPNXGBjBBF7xWufrYUKiVWkVejlHE=;
  b=eOQmoRXsilk99g4Tn4uND6DrnMBE858B/P02smZqgudxLnmOGoZch4xX
   BuBVyyIFJevJdJT/Fw1WDTJeKecwuwzjwrp7FuV8zbgeWexUjfCzHRVSI
   MXX757PFohLUq4OOG46CqqltL7DzNPO6OK3DpAXT3ZnfB+/RhXg8OyUbX
   08ssAf+3r7oDpw+7QsS1vN5QJ9pV3ZhQc9bHLhbzxxA5Qfs+cMDCYCPe8
   nEjgmW5+UmmXr1VLUYoUYCYpcahOr9ZnrxTjWFd9Bmx0gk4DBfa3S7F5e
   090aNxpiwfbiqF3phL0gfHOHeIzcyyH0v43NR+PtimBVcVnQMB7hTsUyW
   w==;
X-CSE-ConnectionGUID: WCWSBKrQQ26Cb2yghmsXPg==
X-CSE-MsgGUID: PrJNW2ExQjmVl3od4DZ7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88892548"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="88892548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 04:18:35 -0700
X-CSE-ConnectionGUID: NjVeeEp1TGOq8kOrD7d+7Q==
X-CSE-MsgGUID: YBznjx/yQsq0bhP1TTz6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230146842"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 04:18:33 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDhDS-000000000I1-2TEJ;
	Fri, 17 Apr 2026 11:18:30 +0000
Date: Fri, 17 Apr 2026 19:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/rewrite_dbg_cmds 5/5]
 arch/x86/kvm/svm/sev.c:1278:11: error: expected ')'
Message-ID: <202604171900.fIqvQqfm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux svm/rewrite_dbg_cmds
head:   1355c91eb47e8bea0a1addb82d3a7aed3288a5a3
commit: 1355c91eb47e8bea0a1addb82d3a7aed3288a5a3 [5/5] KVM: SEV: Allocate only as many bytes as needed for temp crypt buffers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604171900.fIqvQqfm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171900.fIqvQqfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171900.fIqvQqfm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:1278:11: error: expected ')'
    1278 |                                              unsigned int *nr_bytes)
         |                                              ^
   arch/x86/kvm/svm/sev.c:1274:45: note: to match this '('
    1274 | static unsigned int sev_dbg_crypt_slow_alloc(struct page *page,
         |                                             ^
>> arch/x86/kvm/svm/sev.c:1283:3: error: use of undeclared identifier 'nr_bytes'
    1283 |         *nr_bytes = round_up(len, 16);
         |          ^
   arch/x86/kvm/svm/sev.c:1291:11: error: use of undeclared identifier 'nr_bytes'
    1291 |         if (va + nr_bytes < __va + len)
         |                  ^
   arch/x86/kvm/svm/sev.c:1292:3: error: use of undeclared identifier 'nr_bytes'
    1292 |                 nr_bytes += 16;
         |                 ^
   arch/x86/kvm/svm/sev.c:1301:48: error: use of undeclared identifier 'nr_bytes'
    1301 |         if (WARN_ON_ONCE((*pa & PAGE_MASK) != ((*pa + nr_bytes - 1) & PAGE_MASK)))
         |                                                       ^
>> arch/x86/kvm/svm/sev.c:1302:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'unsigned int' [-Wint-conversion]
    1302 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:1304:18: error: use of undeclared identifier 'nr_bytes'
    1304 |         return kmalloc(*nr_bytes);
         |                         ^
   arch/x86/kvm/svm/sev.c:1304:18: error: use of undeclared identifier 'nr_bytes'
   arch/x86/kvm/svm/sev.c:1304:18: error: use of undeclared identifier 'nr_bytes'
>> arch/x86/kvm/svm/sev.c:1316:59: error: too many arguments to function call, expected 4, have 5
    1316 |         buf = sev_dbg_crypt_slow_alloc(src_p, src, len, &src_pa, &nr_bytes);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~                           ^~~~~~~~~
   arch/x86/kvm/svm/sev.c:1274:21: note: 'sev_dbg_crypt_slow_alloc' declared here
    1274 | static unsigned int sev_dbg_crypt_slow_alloc(struct page *page,
         |                     ^                        ~~~~~~~~~~~~~~~~~~
    1275 |                                              unsigned long __va,
         |                                              ~~~~~~~~~~~~~~~~~~~
    1276 |                                              unsigned int len,
         |                                              ~~~~~~~~~~~~~~~~~
    1277 |                                              unsigned long *pa
         |                                              ~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:1321:10: error: too many arguments provided to function-like macro invocation
    1321 |                               nr_bytes, KVM_SEV_DBG_DECRYPT, err);
         |                               ^
   include/linux/mem_encrypt.h:27:9: note: macro '__sme_set' defined here
      27 | #define __sme_set(x)            ((x) | sme_me_mask)
         |         ^
>> arch/x86/kvm/svm/sev.c:1320:37: error: use of undeclared identifier '__sme_set'; did you mean '__memset'?
    1320 |         r = sev_issue_dbg_cmd(kvm, src_pa, __sme_set(__pa(buf),
         |                                            ^~~~~~~~~
         |                                            __memset
   arch/x86/include/asm/string_64.h:23:7: note: '__memset' declared here
      23 | void *__memset(void *s, int c, size_t n);
         |       ^
   arch/x86/kvm/svm/sev.c:1342:59: error: too many arguments to function call, expected 4, have 5
    1342 |         buf = sev_dbg_crypt_slow_alloc(dst_p, dst, len, &dst_pa, &nr_bytes);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~                           ^~~~~~~~~
   arch/x86/kvm/svm/sev.c:1274:21: note: 'sev_dbg_crypt_slow_alloc' declared here
    1274 | static unsigned int sev_dbg_crypt_slow_alloc(struct page *page,
         |                     ^                        ~~~~~~~~~~~~~~~~~~
    1275 |                                              unsigned long __va,
         |                                              ~~~~~~~~~~~~~~~~~~~
    1276 |                                              unsigned int len,
         |                                              ~~~~~~~~~~~~~~~~~
    1277 |                                              unsigned long *pa
         |                                              ~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:1346:51: error: use of undeclared identifier 'buf_p'
    1346 |         r = sev_issue_dbg_cmd(kvm, dst_pa, __sme_page_pa(buf_p),
         |                                                          ^
   arch/x86/kvm/svm/sev.c:1712:16: warning: unused variable 'n' [-Wunused-variable]
    1712 |         unsigned long n;
         |                       ^
   arch/x86/kvm/svm/sev.c:1938:20: error: incompatible pointer types passing 'struct page *' to parameter of type 'struct page **'; take the address with & [-Werror,-Wincompatible-pointer-types]
    1938 |         sev_clflush_pages(guest_page, n);
         |                           ^~~~~~~~~~
         |                           &
   arch/x86/kvm/svm/sev.c:837:44: note: passing argument to parameter 'pages' here
     837 | static void sev_clflush_pages(struct page *pages[], unsigned long npages)
         |                                            ^
   1 warning and 15 errors generated.


vim +1278 arch/x86/kvm/svm/sev.c

  1273	
  1274	static unsigned int sev_dbg_crypt_slow_alloc(struct page *page,
  1275						     unsigned long __va,
  1276						     unsigned int len,
  1277						     unsigned long *pa
> 1278						     unsigned int *nr_bytes)
  1279	{
  1280		unsigned long va = ALIGN_DOWN(__va, 16);
  1281	
  1282		/* The number of bytes to {de,en}crypt must be 16-byte aligned. */
> 1283		*nr_bytes = round_up(len, 16);
  1284	
  1285		/*
  1286		 * Increase the number of bytes to {de,en}crypt by one chunk (16 bytes)
  1287		 * if the aligned address and length doesn't cover the unaligned range,
  1288		 * e.g. if the address is unaligned _and_ the access will split a chunk
  1289		 * at the tail.
  1290		 */
  1291		if (va + nr_bytes < __va + len)
  1292			nr_bytes += 16;
  1293	
  1294		*pa = __sme_page_pa(page) + (va & ~PAGE_MASK);
  1295	
  1296		/*
  1297		 * Sanity check that the new access won't split a page.  This should
  1298		 * never happen; just squash the the access and let firmware command
  1299		 * fail.
  1300		 */
  1301		if (WARN_ON_ONCE((*pa & PAGE_MASK) != ((*pa + nr_bytes - 1) & PAGE_MASK)))
> 1302			return NULL;
  1303	
  1304		return kmalloc(*nr_bytes);
  1305	}
  1306	
  1307	static int sev_dbg_decrypt_slow(struct kvm *kvm, unsigned long src,
  1308					struct page *src_p, unsigned long dst,
  1309					unsigned int len, int *err)
  1310	{
  1311		unsigned int nr_bytes;
  1312		unsigned long src_pa;
  1313		void *buf;
  1314		int r;
  1315	
> 1316		buf = sev_dbg_crypt_slow_alloc(src_p, src, len, &src_pa, &nr_bytes);
  1317		if (!buf)
  1318			return -ENOMEM;
  1319	
> 1320		r = sev_issue_dbg_cmd(kvm, src_pa, __sme_set(__pa(buf),
> 1321				      nr_bytes, KVM_SEV_DBG_DECRYPT, err);
  1322		if (r)
  1323			goto out;
  1324	
  1325		if (copy_to_user((void __user *)dst, buf + (src & 15), len))
  1326			r = -EFAULT;
  1327	out:
  1328		kfree(buf);
  1329		return r;
  1330	}
  1331	
  1332	static int sev_dbg_encrypt_slow(struct kvm *kvm, unsigned long src,
  1333					unsigned long dst, struct page *dst_p,
  1334					unsigned int len, int *err)
  1335	{
  1336		unsigned int nr_bytes;
  1337		unsigned long dst_pa;
  1338		void *buf;
  1339		int r;
  1340	
  1341		/* Decrypt the _destination_ to do a RMW on plaintext. */
  1342		buf = sev_dbg_crypt_slow_alloc(dst_p, dst, len, &dst_pa, &nr_bytes);
  1343		if (!buf)
  1344			return -ENOMEM;
  1345	
> 1346		r = sev_issue_dbg_cmd(kvm, dst_pa, __sme_page_pa(buf_p),
  1347				      nr_bytes, KVM_SEV_DBG_DECRYPT, err);
  1348		if (r)
  1349			goto out;
  1350	
  1351		/*
  1352		 * Copy from the source into the intermediate buffer, and then
  1353		 * re-encrypt the buffer into the destination.
  1354		 */
  1355		if (copy_from_user(buf + (dst & 15), (void __user *)src, len))
  1356			r = -EFAULT;
  1357		else
  1358			r = sev_issue_dbg_cmd(kvm, __sme_set(__pa(buf)), dst_pa,
  1359					      nr_bytes, KVM_SEV_DBG_ENCRYPT, err);
  1360	out:
  1361		kfree(buf);
  1362		return r;
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
