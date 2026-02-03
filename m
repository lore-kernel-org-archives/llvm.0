Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63209309EF7;
	Tue,  3 Feb 2026 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111543; cv=none; b=Tz6buXBJ9n+Hybj9qrZlUBPyUJrtasU0DuPjE1PORoc1rcv2jujsjSKu/b2ftp8Y7opapsiSlMkJ90edVvAV4DUUo+RQ1WIvp7ADH6KlNWuNboaG7khlXSGoNzO+1QpupNNu9Zx/QjAUJd6jueKPnOL1XhealPsafErdvRVIAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111543; c=relaxed/simple;
	bh=/A73xej6s1psmRE5RRm7XpjvSNBBfWxWUtxjEw8AKnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=raFV7ssYzHg3gkQsIUxPW9wooQgC1NqB8cXBCMea0TmMK+0q1dT+VlfaiS//CF7CJzSmgwVsV/9iqrZD0TsUTGzo+u1GyibMKZb8kUAJW4OFFFExXmZhIQj2JBJbObfvLDMGhxK6vhyv9x3eSco4AYAm4MekLeOPsDJKnf3b7q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0lJnaXo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0lJnaXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770111542; x=1801647542;
  h=date:from:to:cc:subject:message-id;
  bh=/A73xej6s1psmRE5RRm7XpjvSNBBfWxWUtxjEw8AKnY=;
  b=E0lJnaXol0/uD07YUb1Zp/3+DojKA+S26tVR7hKYuyDjXnaPMAkOvSV6
   jBoIgZzfYlbCbkUJ6RBA32SYhVdZd089M1kiRYmvUz1zyS3lBFYdtM6mn
   e76Hm8R5fhDu2C4F6zCf2MRToOjRS0e2ZFfIdUfpai8Wz46eOQGM408sk
   vJwC4Wwk/F/rr9b3+MtIk4BTEL28Anpokw5wwzaibMFMiD8uSELEPXHYs
   37JXQbXaoGfTXLpbywGA34qfXFqewQtXfEu8cWLcacpj7+tAd0hn3hPgC
   emfXPpb8XJ1sP5INNqEhM4HyNLVVMh+qo6yfED6CsX/88PhMqzR8GT8O5
   g==;
X-CSE-ConnectionGUID: QSbjZMs5Qu6q9/GujXjfQQ==
X-CSE-MsgGUID: dm1PDQ0dRsG7T7wdRLmayw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="93931294"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="93931294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:39:01 -0800
X-CSE-ConnectionGUID: +qN5oLvzRxCf11ELb+ceUA==
X-CSE-MsgGUID: xzSGAuoCQHua289TpqJpAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209230212"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 01:38:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnCs4-00000000gVI-1DxJ;
	Tue, 03 Feb 2026 09:38:56 +0000
Date: Tue, 03 Feb 2026 17:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 16/18]
 include/linux/spinlock_api_smp.h:164:1: warning: raw_spinlock 'lock' is still
 held at the end of function
Message-ID: <202602031724.N1AQbEdm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   04c35250bb394d7bc867e1527c3250e49d486025
commit: c54b183eeade43270288ca1fa71cb4731bc78e8e [16/18] irq & spin_lock: Add counted interrupt disabling/enabling
config: sparc64-randconfig-001-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031724.N1AQbEdm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031724.N1AQbEdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031724.N1AQbEdm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/crypto_engine.c:10:
   In file included from include/crypto/internal/aead.h:11:
   In file included from include/crypto/aead.h:13:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:311:
>> include/linux/spinlock_api_smp.h:164:1: warning: raw_spinlock 'lock' is still held at the end of function [-Wthread-safety-analysis]
     164 | }
         | ^
   include/linux/spinlock_api_smp.h:163:44: note: raw_spinlock acquired here
     163 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |                                                   ^
   include/linux/spinlock_api_smp.h:214:2: warning: releasing raw_spinlock 'lock' that was not held [-Wthread-safety-analysis]
     214 |         do_raw_spin_unlock(lock);
         |         ^
   In file included from crypto/crypto_engine.c:10:
   In file included from include/crypto/internal/aead.h:11:
   In file included from include/crypto/aead.h:13:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   include/linux/spinlock.h:387:1: warning: raw_spinlock 'lock->.rlock' is still held at the end of function [-Wthread-safety-analysis]
     387 | }
         | ^
   include/linux/spinlock.h:386:2: note: raw_spinlock acquired here
     386 |         raw_spin_lock_irq_disable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:276:41: note: expanded from macro 'raw_spin_lock_irq_disable'
     276 | #define raw_spin_lock_irq_disable(lock) _raw_spin_lock_irq_disable(lock)
         |                                         ^
   3 warnings generated.


vim +/lock +164 include/linux/spinlock_api_smp.h

   158	
   159	static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
   160	{
   161		local_interrupt_disable();
   162		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
   163		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 > 164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
