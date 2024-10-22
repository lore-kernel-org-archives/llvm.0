Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C338B;
	Tue, 22 Oct 2024 04:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571661; cv=none; b=jDNn3BC7HmHk/3hLO55BzIGobkmyNWJKHHYnzaudmQL2prLONBQrpKBEXox3+quiTC6gz2Ki6U+addsHp7WoKVRaetswffWC4S+8nIj5BYWqqYlXAroWdVVuhUFDnDKj4BvpH5VkLBPZmpXFT+y4U8zqG1AhF/4373LxxCGNobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571661; c=relaxed/simple;
	bh=7e5NYSzE2NoLAoHODKI75pJFPJGPF7bdkJmk3GtFVp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsoYL6M64wkdG5X3NcXRGTQgdtXM95M00jSVYYyjgTpOwADTXkBTanGJDjjUiTCAHd42BC2LGi9m2EbV7PNOmr2oNvY1jYPTdhLSovN31lfmOfYTgjB7z+8Wj4pDf/HfE51brTFzYunsBliKWHAeFDlr+7GpnniI3M0y8r/NGFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bApzbWxE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bApzbWxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729571659; x=1761107659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7e5NYSzE2NoLAoHODKI75pJFPJGPF7bdkJmk3GtFVp4=;
  b=bApzbWxEMnioCVIcG+HAsox5kQrBD/iN7baajvAkd3VxfOaCXV7D0tL9
   Ug8rt7xjPcxKke0HVhL8/oPnRrE7+QclDKDEXLuyWskxFzSqk/2kAZY32
   01IZYqQXrWA4RQ9KG3e1mema7wYW7pBQITIfHKp2KXnPzmMNASmnrFi5j
   ntzfYyLFHdyc/IbcEeFXh9vuP6Ur17n4TqZb/K0oUkpSnFyZ1ISo4eAT/
   5j+z9OEASdk7rbrLR4bKAVNYbCm7UEmpPb2Tmn6+03OwJ+KqAX1Cavl3F
   s7RRVM2/Y3CWaCx43vEbRXwioi3SUFmfENCQglP6cYnhwQy5G3uYuUO+U
   Q==;
X-CSE-ConnectionGUID: Ij1fOHWNRleXtuv01AKw/w==
X-CSE-MsgGUID: U2UsXRcmRcmMIbkOWSAk/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="16714387"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="16714387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 21:34:18 -0700
X-CSE-ConnectionGUID: HMhWDQ+pRoOPUnUEaSH/Ww==
X-CSE-MsgGUID: 64orfNxfQJOU4UYis/9F/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79657289"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 21:34:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t36aw-000T46-2q;
	Tue, 22 Oct 2024 04:34:10 +0000
Date: Tue, 22 Oct 2024 12:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: FUKAUMI Naoki <naoki@radxa.com>, heiko@sntech.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, macromorgan@hotmail.com,
	jonas@kwiboo.se, andyshrk@163.com, tim@feathertop.org,
	jagan@edgeble.ai, dsimic@manjaro.org, michael.riesch@wolfvision.net,
	sebastian.reichel@collabora.com, cfsworks@gmail.com,
	kever.yang@rock-chips.com, jing@jing.rocks,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2 RESEND 3/3] arm64: dts: rockchip: Enable HDMI0 on
 rock-5c
Message-ID: <202410221225.u7cCiQ3a-lkp@intel.com>
References: <20241021090548.1052-3-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021090548.1052-3-naoki@radxa.com>

Hi FUKAUMI,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.12-rc4 next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/FUKAUMI-Naoki/arm64-dts-rockchip-add-Radxa-ROCK-5C/20241021-171353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241021090548.1052-3-naoki%40radxa.com
patch subject: [PATCH v2 RESEND 3/3] arm64: dts: rockchip: Enable HDMI0 on rock-5c
config: arm64-randconfig-001-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221225.u7cCiQ3a-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221225.u7cCiQ3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221225.u7cCiQ3a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts:260.1-7 Label or path hdmi0 not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts:269.1-10 Label or path hdmi0_in not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts:275.1-11 Label or path hdmi0_out not found
>> FATAL ERROR: Syntax error parsing input tree

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
