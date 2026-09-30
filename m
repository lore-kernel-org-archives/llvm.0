Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C609370AD9;
	Wed, 30 Sep 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761272; cv=none; b=S9kg6gBRTkAffdmRo1GR5ZBz0xTyChalOiTgkhYunyNDKMYZFmJennBhxlbuI9M1AeSzcl3kziCCc39mIGsVWLhUTe9HHwCNqFSgv7KVyusFMgVOMOAQ99/pFabnVRizjmwxjOZ6mEvERKjGPotNFYe28vzJB0NjiQUFdfKDakk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761272; c=relaxed/simple;
	bh=72kYHT6rKlydvDKcn+nzBukjVValtnrNwz1CMrPd2jU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q0cMXWpHVOSXGVykptlf3e+OXHQ1TtXgqK8OsbfJ1LifRop1StC49qPhwuWqtZihcfZPQ2FAumweMW8en6fgIrEQSC66p5yYHnLQIVSWH+Vx3MOwhC4lz7iNTClcmDp4Ytg7mWxWk6hU0KF2u7u5CwH2EbDVPa7es8Fqpl+Qnos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLjUd+cQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLjUd+cQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761269; x=1822297269;
  h=date:from:to:cc:subject:message-id;
  bh=72kYHT6rKlydvDKcn+nzBukjVValtnrNwz1CMrPd2jU=;
  b=JLjUd+cQHpBS3bIW43dP5Wym8L4JhHAXxQlJcUq0xCcIXGt7gniNB9nq
   dLhI8Jxhw0IAn+byM9Dx5+FGUqSX0n9tYYbjBwkSeh+unXk74ZD/XVxcN
   +oxpNkyGuiXmVBAWOKFBXYZDjsdeSpBzxZB0NGSJ50ryfouxXYjPXM8ov
   ycyGVCHQ/wWp0ZpgKaq+ptrtgio1gjDuaU3eAECuQnyIH+2r0yfByd0kW
   cjDwTLMSYAMlhuRUdYmdzvcz/9c3G4B6OEmZezkF77ABypjgu6SxGJ34c
   vQOoQy2LEC2Pp8/slB6JlAiJrs5pKLSCWqECO1u9tw544qdHPFvuwbyzw
   A==;
X-CSE-ConnectionGUID: 4200pD3STp+gkPDZ89Pwdg==
X-CSE-MsgGUID: hzHtSaM5SVehOnq4aZ07vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="117024581"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="117024581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:41:09 -0700
X-CSE-ConnectionGUID: /nrlSQylTFCA1R6NEUYFYA==
X-CSE-MsgGUID: +W+r6Jn4RO+RrXArOtaJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="305153603"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2026 02:41:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBqoC-00000000QSO-1GPP;
	Wed, 30 Sep 2026 09:41:04 +0000
Date: Wed, 30 Sep 2026 17:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_mpxy_imp_v1 2/5]
 arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for
 function 'sbi_mpxy_read_attrs'
Message-ID: <202609301701.1eIab1jS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_mpxy_imp_v1
head:   ca441e957bb4806b528959ae80efb7e7a9f5447a
commit: 36c74ca9f1dd2278453c544310c73d45beb9c993 [2/5] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20260930/202609301701.1eIab1jS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301701.1eIab1jS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301701.1eIab1jS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:13:
   In file included from arch/riscv/include/asm/kvm_host.h:25:
   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12:
>> arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for function 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:744:5: warning: no previous prototype for function 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:750:5: warning: no previous prototype for function 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:758:5: warning: no previous prototype for function 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:758:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:765:18: warning: declaration of 'struct sbi_mpxy_notification_data' will not be visible outside of this function [-Wvisibility]
     765 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^
>> arch/riscv/include/asm/sbi.h:764:5: warning: no previous prototype for function 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^
   arch/riscv/include/asm/sbi.h:764:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         | ^
         | static 
   7 warnings generated.
--
   In file included from arch/riscv/kernel/alternative.c:18:
>> arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for function 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:744:5: warning: no previous prototype for function 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:750:5: warning: no previous prototype for function 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:758:5: warning: no previous prototype for function 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:758:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:765:18: warning: declaration of 'struct sbi_mpxy_notification_data' will not be visible outside of this function [-Wvisibility]
     765 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^
>> arch/riscv/include/asm/sbi.h:764:5: warning: no previous prototype for function 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^
   arch/riscv/include/asm/sbi.h:764:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         | ^
         | static 
   6 warnings generated.
--
   In file included from arch/riscv/kernel/kernel_mode_vector.c:16:
   In file included from arch/riscv/include/asm/kvm_vcpu_vector.h:17:
   In file included from arch/riscv/include/asm/kvm_host.h:25:
   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12:
>> arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for function 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:744:5: warning: no previous prototype for function 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:750:5: warning: no previous prototype for function 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:758:5: warning: no previous prototype for function 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:758:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:765:18: warning: declaration of 'struct sbi_mpxy_notification_data' will not be visible outside of this function [-Wvisibility]
     765 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^
>> arch/riscv/include/asm/sbi.h:764:5: warning: no previous prototype for function 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^
   arch/riscv/include/asm/sbi.h:764:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         | ^
         | static 
   In file included from arch/riscv/kernel/kernel_mode_vector.c:16:
   In file included from arch/riscv/include/asm/kvm_vcpu_vector.h:17:
   In file included from arch/riscv/include/asm/kvm_host.h:27:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
   In file included from include/linux/perf/riscv_pmu.h:12:
   In file included from include/linux/perf_event.h:43:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   7 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:13:
   In file included from arch/riscv/include/asm/kvm_host.h:25:
   In file included from arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h:12:
>> arch/riscv/include/asm/sbi.h:738:5: warning: no previous prototype for function 'sbi_mpxy_read_attrs' [-Wmissing-prototypes]
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:744:5: warning: no previous prototype for function 'sbi_mpxy_write_attrs' [-Wmissing-prototypes]
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |     ^
   arch/riscv/include/asm/sbi.h:744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     744 | int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:750:5: warning: no previous prototype for function 'sbi_mpxy_send_message_with_resp' [-Wmissing-prototypes]
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:758:5: warning: no previous prototype for function 'sbi_mpxy_send_message_without_resp' [-Wmissing-prototypes]
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         |     ^
   arch/riscv/include/asm/sbi.h:758:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     758 | int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
         | ^
         | static 
>> arch/riscv/include/asm/sbi.h:765:18: warning: declaration of 'struct sbi_mpxy_notification_data' will not be visible outside of this function [-Wvisibility]
     765 |                                struct sbi_mpxy_notification_data *notif_data,
         |                                       ^
>> arch/riscv/include/asm/sbi.h:764:5: warning: no previous prototype for function 'sbi_mpxy_get_notifications' [-Wmissing-prototypes]
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         |     ^
   arch/riscv/include/asm/sbi.h:764:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     764 | int sbi_mpxy_get_notifications(u32 channel_id,
         | ^
         | static 
   7 warnings generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   1 warning generated.


vim +/sbi_mpxy_read_attrs +738 arch/riscv/include/asm/sbi.h

   737	
 > 738	int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   739				u32 *attrs_buf)
   740	{
   741		return -ENODEV;
   742	}
   743	
 > 744	int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   745				 u32 *attrs_buf)
   746	{
   747		return -ENODEV;
   748	}
   749	
 > 750	int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
   751					    void *tx, unsigned long tx_len,
   752					    void *rx, unsigned long max_rx_len,
   753					    unsigned long *rx_len)
   754	{
   755		return -ENODEV;
   756	}
   757	
 > 758	int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
   759					       void *tx, unsigned long tx_len)
   760	{
   761		return -ENODEV;
   762	}
   763	
 > 764	int sbi_mpxy_get_notifications(u32 channel_id,
 > 765				       struct sbi_mpxy_notification_data *notif_data,
   766				       unsigned long *events_data_len)
   767	{
   768		return -ENODEV;
   769	}
   770	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
