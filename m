Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24081F94F;
	Thu, 16 Apr 2026 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776311844; cv=none; b=UkQqUvW1/elPAEzIyMvE6YvcUPSCQmNxRe3HICyzN683JGsaFVUy7xtcpZqqMSgAjXQvK8on5HDJq+WxA1vSq4uKJaHcC3YhxrCHMahzCnYbhkIbJmy0SbPlOxUimimtkG6pn8AKIYhA03prpSw8vxvdAkgqWNEMSxSlqPDVx1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776311844; c=relaxed/simple;
	bh=WfN26jWcEZqrtt0LoW3jfDnHcm/acaPTEDjDrkBnSbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kYUHNyCBE3eYYUf5e0ZtwCiy/EAoE0VocGr3K65+iEq2pZyb0jQoIp6R5qOMVN7S7N+ZSm4StGzCQts9vlvYSJoOjrGZvOA5dU/cUdoeDLrdhALVsK3j1NGV4QCtNsWzFQXqhnJJoDSGPyZmeMVFMUV8XED5rPDI8q0GiL+p6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HR62CFu2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HR62CFu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776311842; x=1807847842;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WfN26jWcEZqrtt0LoW3jfDnHcm/acaPTEDjDrkBnSbA=;
  b=HR62CFu2kTVWTszil1oK1234yu0FWcBShLDGXTT/2AAu8dHIClOeUbtJ
   AtNd9dkniKFIDai+mcauhzcFCvDNphrhqVNMmRdCWq85B0d3iVqNB0BTV
   Vo+Upm5IWYs25SW4M4goxkC3RF/7N+EUC5oOpkDJYiDm64VA3sYDL3q2n
   qL5z6m+UZLzB96c8OMLcL2ct+/WasAuvYcvHKabZ7RzPNePfIs5pdowb2
   fuYxjf4fjUpwjpybRQe4oCXQ0YMCZ9Bm3fixjUaK+B7RAm6FH6Eg90P7G
   IJaJpbtr3K0F0VgRHEP6Hg+vf0b48BNPVkgkcW37RS2veN1MyKQazkGM/
   w==;
X-CSE-ConnectionGUID: amR74CZYQTyursgKkWkCIQ==
X-CSE-MsgGUID: RtHO84PTS/Cq8tEkW7ETaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="79885487"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="79885487"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:57:22 -0700
X-CSE-ConnectionGUID: SMY5gPjqRnS9dCdH5O/Dyg==
X-CSE-MsgGUID: H++EOdDXRca4Vm/fCsR9Vw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2026 20:57:21 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDDqw-000000001Fq-1oFb;
	Thu, 16 Apr 2026 03:57:18 +0000
Date: Thu, 16 Apr 2026 11:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-thread-safety 64/68]
 drivers/scsi/sg.c:842:2: warning: releasing rwlock 'sfp->rq_list_lock' using
 shared access, expected exclusive access
Message-ID: <202604161153.TgAss4GY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/bvanassche/linux scsi-thread-safety
head:   00e2d287e2a16a8d2598582f28442e7ae0aa818a
commit: 1b597fe87b0d136a287571ddce0931edd6488622 [64/68] scsi: core: Enable=
 lock context analysis
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260416/20=
2604161153.TgAss4GY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260416/202604161153.TgAss4GY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161153.TgAss4GY-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sg.c:842:2: warning: releasing rwlock 'sfp->rq_list_lock' u=
sing shared access, expected exclusive access [-Wthread-safety-analysis]
     842 |         read_unlock_irqrestore(&sfp->rq_list_lock, flags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:840:2: note: rwlock acquired here
     840 |         read_lock_irqsave(&sfp->rq_list_lock, flags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:1003:5: warning: releasing rwlock 'sfp->rq_list_lock' =
using shared access, expected exclusive access [-Wthread-safety-analysis]
    1003 |                                 read_unlock_irqrestore(&sfp->rq_=
list_lock,
         |                                 ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:1000:3: note: rwlock acquired here
    1000 |                 read_lock_irqsave(&sfp->rq_list_lock, iflags);
         |                 ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:1008:3: warning: releasing rwlock 'sfp->rq_list_lock' =
using shared access, expected exclusive access [-Wthread-safety-analysis]
    1008 |                 read_unlock_irqrestore(&sfp->rq_list_lock, iflag=
s);
         |                 ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:1000:3: note: rwlock acquired here
    1000 |                 read_lock_irqsave(&sfp->rq_list_lock, iflags);
         |                 ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:1017:3: warning: releasing rwlock 'sfp->rq_list_lock' =
using shared access, expected exclusive access [-Wthread-safety-analysis]
    1017 |                 read_unlock_irqrestore(&sfp->rq_list_lock, iflag=
s);
         |                 ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:1011:3: note: rwlock acquired here
    1011 |                 read_lock_irqsave(&sfp->rq_list_lock, iflags);
         |                 ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:1086:4: warning: releasing rwlock 'sfp->rq_list_lock' =
using shared access, expected exclusive access [-Wthread-safety-analysis]
    1086 |                         read_unlock_irqrestore(&sfp->rq_list_loc=
k, iflags);
         |                         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:1084:4: note: rwlock acquired here
    1084 |                         read_lock_irqsave(&sfp->rq_list_lock, if=
lags);
         |                         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
>> drivers/scsi/sg.c:1189:2: warning: releasing rwlock 'filp->private_data-=
>rq_list_lock' using shared access, expected exclusive access [-Wthread-saf=
ety-analysis]
    1189 |         read_unlock_irqrestore(&sfp->rq_list_lock, iflags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:1182:2: note: rwlock acquired here
    1182 |         read_lock_irqsave(&sfp->rq_list_lock, iflags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
>> drivers/scsi/sg.c:1616:2: warning: releasing rwlock 'dev_get_drvdata().s=
fd_lock' using shared access, expected exclusive access [-Wthread-safety-an=
alysis]
    1616 |         read_unlock_irqrestore(&sdp->sfd_lock, iflags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:1610:2: note: rwlock acquired here
    1610 |         read_lock_irqsave(&sdp->sfd_lock, iflags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
>> drivers/scsi/sg.c:2269:2: warning: releasing rwlock 'sg_index_lock' usin=
g shared access, expected exclusive access [-Wthread-safety-analysis]
    2269 |         read_unlock_irqrestore(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:2267:2: note: rwlock acquired here
    2267 |         read_lock_irqsave(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:2297:2: warning: releasing rwlock 'sg_index_lock' usin=
g shared access, expected exclusive access [-Wthread-safety-analysis]
    2297 |         read_unlock_irqrestore(&sg_index_lock, flags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:2286:2: note: rwlock acquired here
    2286 |         read_lock_irqsave(&sg_index_lock, flags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:2496:2: warning: releasing rwlock 'sg_index_lock' usin=
g shared access, expected exclusive access [-Wthread-safety-analysis]
    2496 |         read_unlock_irqrestore(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:2481:2: note: rwlock acquired here
    2481 |         read_lock_irqsave(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:2515:2: warning: releasing rwlock 'sg_index_lock' usin=
g shared access, expected exclusive access [-Wthread-safety-analysis]
    2515 |         read_unlock_irqrestore(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:2507:2: note: rwlock acquired here
    2507 |         read_lock_irqsave(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   drivers/scsi/sg.c:2621:2: warning: releasing rwlock 'sg_index_lock' usin=
g shared access, expected exclusive access [-Wthread-safety-analysis]
    2621 |         read_unlock_irqrestore(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:104:3: note: expanded from macro 'read_unlock_irq=
restore'
     104 |                 _raw_read_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/rwlock_api_smp.h:110:2: note: expanded from macro '_raw_re=
ad_unlock_irqrestore'
     110 |         __raw_read_unlock_irqrestore(lock, flags)
         |         ^
   drivers/scsi/sg.c:2597:2: note: rwlock acquired here
    2597 |         read_lock_irqsave(&sg_index_lock, iflags);
         |         ^
   include/linux/rwlock.h:69:11: note: expanded from macro 'read_lock_irqsa=
ve'
      69 |                 flags =3D _raw_read_lock_irqsave(lock);   \
         |                         ^
   12 warnings generated.


vim +842 drivers/scsi/sg.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  834 =20
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  835  static int srp_done(Sg_=
fd *sfp, Sg_request *srp)
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  836  {
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  837  	unsigned long flags;
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  838  	int ret;
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  839 =20
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  840  	read_lock_irqsave(&sfp=
->rq_list_lock, flags);
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  841  	ret =3D srp->done;
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12 @842  	read_unlock_irqrestore=
(&sfp->rq_list_lock, flags);
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  843  	return ret;
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  844  }
6acddc5e911bb3 J=C3=B6rn Engel     2012-04-12  845 =20

:::::: The code at line 842 was first introduced by commit
:::::: 6acddc5e911bb3a4a007448371ed7317c85669da [SCSI] sg: prevent unwoken =
sleep

:::::: TO: J=C3=B6rn Engel <joern@logfs.org>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
