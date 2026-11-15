Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775494;
	b=p9e9p0/moSKSwSy6c/qfwqqBFgz9rR7orvyLrwZTOt/PVe4HsERMsJViEUqysL7xHPCu
	 ECVyjRFbT+ExvbZ4yZuktFLJ3nR+S8D3ycLuR+IF0xgNU4+iqL+MCafSNbR1RTq0a/y3B
	 r3Uz1WMZOzib5njnYO/SvbSwY39uDyweJX2lQm5JgEKD9XnnnapKkhTeaU8KqGoaBSBCM
	 bJo0DAT5YyooajoFJ3fBzD40LX79VaszpToi4OeUP+UdiFshtf73R0PTa5OudPCmELvrX
	 i9RhEIjOvfhS5FOM9vuKQ6pNvc3iYOmUk1b9v+BeGo/DBnGLA2Hlt/gfS+iV9p0tl7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=wCU88k7VemMT/2795k/EvwDvYMjCXnIsoM+YJVUnuTs=;
	b=d4YakkxXb/XaM11bjP3NFc//xHbDq4nou/46ucIHMtPDK7d8nWcnD0EdzlheN10n8yHt
	 6VcMNOOWOC7Ve/BjPCIpaQrH9MDLbYfytcvzqsj79oYAal9cczW2vDO75dYM9jOsOBYfB
	 zgnOpFImNwxg0K3rYDbgFnztvg478k0GuWl3qi1ApHs7cnObJo3/jnxAN34KjdRZm3Skv
	 h4/U4COQYEooNy2bv9zS75+F66YRsjIBXWPJQId8PkGW4tsKwAuyuwnWz7GdcIxknwEfW
	 5KxotdkigsHX6sid+kzz/rv1Vmm/WDhimmA+OVDBg1+VQvA9U1WoadumisWSXco0TLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ar8Mm9Bc;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A8606A329;
	Sun, 15 Nov 2026 20:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05A8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ar8Mm9Bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794775494; x=1826311494;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2ERfuWmQBkfdUBVPTMTiEa/fQDCdXlKLBZ4EO/HG2Do=;
  b=Ar8Mm9Bcz8/VpxNS8ThSJQZinQkzXwNhI3LMNpsn9kI0hdln1BBBoMmq
   K0zQpp7ffH0n3OZ+Lv/DRWvaIXa8vpvKhXQLu9o3zmSdvZZa/dSzafGja
   YcrzRwYIDH3ChTcY+8S2ZYY2qH47D9MGX3Oi/2VxYNUFE2Vu6FT+d7nj6
   gWDpEm1GMslfC6nb5McXTVnFX4GiNpoAt+9HXSras5DueFxflhrfyUoh3
   3dwTjNLVWB83ovbhE9A2kjka+M+R7KCRmEf8NSoCVvudiIyle340+D3i+
   sP8ydjm6ASRQnB0aDf2ta5CS+ospSqaauCGu2p7I0eyC3R349NyQuNWSK
   w==;
X-CSE-ConnectionGUID: Ch5cWHvfRaa1mGirtLkjKw==
X-CSE-MsgGUID: QuXz/ZzpRkWGM0hpwvUzgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3501651"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3501651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 12:44:53 -0800
X-CSE-ConnectionGUID: BkLAj3YpRjmDGnw0XAnfVg==
X-CSE-MsgGUID: ok/gMNFtSA6sim5B8JHvPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9808874"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2026 12:44:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSh5k-000000017Iu-112z;
	Sun, 15 Nov 2026 20:44:48 +0000
Date: Mon, 16 Nov 2026 04:44:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 =?utf-8?Q?"P=C3=A9ter?= Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 22/67] ERROR: modpost:
 sound/soc/sof/snd-sof-fw-gdb.ko: symbol
 'sof_client_ipc4_find_debug_slot_offset_by_type' undefined!
Message-ID: <202611160412.HQiAJ6rq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   862d4ac42408c74e989139ede5a7348ead782ec9
commit: 01e8c247ebdc56efb3d75b04fdc92b8d3ad5dacd [22/67] ASoC: SOF: sof-client: expose Zephyr GDB stub
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261116/202611160412.HQiAJ6rq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dabc01bba1df10de6fb3c32fcf9db4aafe78f38)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160412.HQiAJ6rq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160412.HQiAJ6rq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: missing MODULE_DESCRIPTION()
ERROR: modpost: sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: symbol 'sof_of_pm' undefined!
>> ERROR: modpost: sound/soc/sof/snd-sof-fw-gdb.ko: symbol 'sof_client_ipc4_find_debug_slot_offset_by_type' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
