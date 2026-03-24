Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B8239E6F;
	Tue, 24 Mar 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386561; cv=none; b=VCke50+CxX4RMZHXAhHgEWWa1geecRklJOXD2/RI6uc8apAF/DsM01yPWnnWClfPAqU6aHtVywuxN3DphuHRQ9X7MZrWGuQ4ZXjIga4wpxAkglmRjdHKATSrd0oVYIyaCi5b2E+ecZ4yhSqx4qvR0m8CV1Oeji9xAGsK1E8IGls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386561; c=relaxed/simple;
	bh=+kImbJrvWBzptz6Abvg+mpFZVXsFt0y97kIhiuxnkno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZsFEU/0373n7a2vKbY+mURxDzRqWuZFLndJG2tRIiStGUQSC3Q/jaMaCUmc7T/nA8Kl4wKCwuLLJWaIQ0O/P9OzS05g7da8RfEgKIWrx8IV/9meQiNQMh5CI9ZWr3Oa7Wnx560WC08ZVxnHVWKlu4aPumnA+MQoBfvvUOlzx4kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsXTKGiP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsXTKGiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774386560; x=1805922560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+kImbJrvWBzptz6Abvg+mpFZVXsFt0y97kIhiuxnkno=;
  b=BsXTKGiPOIVvIuqdsUI1xqvtjTv//NqDfCTLSpB5dBxuiYK/otFKbz6s
   ZjfUGN0srverKlVULjkUZ3r9jeSX3t/0Dhf58uNLlxeO0lkSxNTDFxM+H
   jzLX2lI1raPTqrKCktxn8Ybg7XOrk7fpoURbnlSiN0e+HLlo5L0Ol0asK
   OwUmNm8HhJBc5XTUq35f3U7wosFICp4yUtDYIEefedjnWFi0llF56b6K7
   Zbi2jTIoGDPfZnNBJm0r8+YfdPrStu3AboU41qctU61EOFjjtxP7jsbwW
   3rlummdn9XXfgRRKnsEautswLHho9nr3zkqy8HmfGCMj1RpWrgHCzIA98
   Q==;
X-CSE-ConnectionGUID: z0oetK+OTbGuB+CnHH2G+g==
X-CSE-MsgGUID: tN33idkhTU6YVlkwHEtkLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86492359"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86492359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 14:09:19 -0700
X-CSE-ConnectionGUID: keI9GFdyR8yMw5OzvrMzCA==
X-CSE-MsgGUID: URXJ//RkSOO4RrjgoF8S9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="217894089"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Mar 2026 14:09:17 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w58zy-000000005RZ-3qQl;
	Tue, 24 Mar 2026 21:09:14 +0000
Date: Wed, 25 Mar 2026 05:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5955/8611]
 include/linux/drbd_protocol.h:587:2: warning: field  within 'struct
 p_twopc_request' is less aligned than 'union p_twopc_request::(anonymous at
 include/linux/drbd_protocol.h:587:2)' and is usually due to 'struct
 p_twopc_request' being packed, which can le...
Message-ID: <202603250506.A6rmlvj4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
commit: 945807e66a140e5ee0f919d04e15eadd4cc294be [5955/8611] drbd: remove B=
ROKEN for DRBD
config: arm-randconfig-002-20260325 (https://download.01.org/0day-ci/archiv=
e/20260325/202603250506.A6rmlvj4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054=
e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603250506.A6rmlvj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250506.A6rmlvj4-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/drbd/drbd_receiver.c:31:
   In file included from drivers/block/drbd/drbd_int.h:33:
   In file included from include/linux/drbd_genl_api.h:36:
   In file included from include/linux/drbd_config.h:10:
>> include/linux/drbd_protocol.h:587:2: warning: field  within 'struct p_tw=
opc_request' is less aligned than 'union p_twopc_request::(anonymous at inc=
lude/linux/drbd_protocol.h:587:2)' and is usually due to 'struct p_twopc_re=
quest' being packed, which can lead to unaligned accesses [-Wunaligned-acce=
ss]
     587 |         union {
         |         ^
   1 warning generated.


vim +587 include/linux/drbd_protocol.h

59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  571 =20
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  572  struct p_twopc_r=
equest {
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  573  	uint32_t tid;  =
/* transaction identifier */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  574  	union {
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  575  		struct { /* wh=
en DRBD_FF_2PC_V2 is set */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  576  			uint32_t flag=
s;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  577  			uint16_t _pad;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  578  			int8_t  s8_in=
itiator_node_id;  /* initiator of the transaction */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  579  			int8_t  s8_ta=
rget_node_id;  /* target of the transaction (or -1) */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  580  		};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  581  		struct { /* or=
iginal packet version */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  582  			uint32_t u32_=
initiator_node_id;  /* initiator of the transaction */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  583  			uint32_t u32_=
target_node_id;  /* target of the transaction (or -1) */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  584  		};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  585  	};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  586  	uint64_t nodes_=
to_reach;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16 @587  	union {
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  588  		union { /* TWO=
PC_STATE_CHANGE */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  589  			struct {    /=
* P_TWOPC_PREPARE */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  590  				uint64_t _co=
mpat_pad;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  591  				uint32_t mas=
k;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  592  				uint32_t val;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  593  			};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  594  			struct { /* P=
_TWOPC_COMMIT */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  595  				uint64_t pri=
mary_nodes;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  596  				uint64_t rea=
chable_nodes; /* when TWOPC_HAS_RECHABLE flag is set */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  597  			};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  598  		};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  599  		union {	 /* TW=
OPC_RESIZE */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  600  			struct {    /=
* P_TWOPC_PREP_RSZ */
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  601  				uint64_t use=
r_size;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  602  				uint16_t dds=
_flags;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  603  			};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  604  			struct {    /=
* P_TWOPC_COMMIT	*/
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  605  				uint64_t dis=
kful_primary_nodes;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  606  				uint64_t exp=
osed_size;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  607  			};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  608  		};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  609  	};
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  610  } __packed;
59f03ec44e87aaf Christoph B=C3=B6hmwalder 2025-12-16  611 =20

:::::: The code at line 587 was first introduced by commit
:::::: 59f03ec44e87aaf5b153440601e62f1c1c5260cb drbd: update and move proto=
col definitions

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
