Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064F17CA12;
	Wed, 19 Feb 2025 02:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739932493; cv=none; b=sVnXPFOD1ZCDKX4AdByFq2CVHJDVgXMNEUKb861M2YlcERWRZqczaqMLwOyfuz9atTlYepg1P+te3w/1ibTmhNlzHSZT2jtfcTP3UuUz7IykLOV/civ759Jjh2mvmgIqofMa3dFbq1Y8ikkl21MibOrga5OA3h7pUOlR5Z7mpMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739932493; c=relaxed/simple;
	bh=NAAHiS42bhd4NtLIVDGcTF2I5VSPzSVITVY8K37nrYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTjzSeBBlsbaW0mQkux8K7kRxI4HR34j6YkoNB6jDwHrYQdTi1bilsxupHdXARFHA5mz7E1LH6KZYcfHaMHKoSfMGwSBx8+EeVyz1Bd8xrg/wWdqTLi4h3xemudpTsw4XlPMr+Drf5y19RDDezAJstpSgLoLe04JxQviqmLA6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8pgR8PC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8pgR8PC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739932491; x=1771468491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAAHiS42bhd4NtLIVDGcTF2I5VSPzSVITVY8K37nrYU=;
  b=i8pgR8PCsMm6pxdBAuoNyHy5aSK3I379J/z4lYmjg3RTBY1FUV4ORGRH
   xNwZrjwcyWSBFo0SOP3GHnfo8u4vpxKuJ+cvixxZ4zbboXU9XD5Ev/gyX
   +V/BlZhqdkGfSHkLI5lxzlAn9BxUhspzuL+TiFNg+9+7Yzsshiwt76tRh
   x+GrgJI+jxDg6s2ZmUlKt7iXOrwOEhQ350TFz2jVFDiGZ/QtzPwGhJuOj
   oyLUSKTNOvEdDucoQGL7wyZ1tN5xnF7oTExbskzRB/ltW+coSiGoUl/zn
   o5wBEUxfztE3V5xzF4UXhEIdCvF2mOOhyS+I+Ax+VEpNhNG2zsu/W7a1S
   Q==;
X-CSE-ConnectionGUID: hPRQRpykTGeb5UP9Ozo2hQ==
X-CSE-MsgGUID: 9wJZL+WHTN+F1c0ZqMh7aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63128688"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="63128688"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:34:51 -0800
X-CSE-ConnectionGUID: bBYqrZ1NTLO+pH3kJYy73w==
X-CSE-MsgGUID: pcV7ZefcTISew4qh/vsibQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118711751"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2025 18:34:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkZvA-00019I-1a;
	Wed, 19 Feb 2025 02:34:45 +0000
Date: Wed, 19 Feb 2025 10:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh C <quic_vignc@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:ath12k-split-phy 61/81]
 drivers/net/wireless/ath/ath12k/mac.c:4778:15: warning: variable 'ar' is
 uninitialized when used here
Message-ID: <202502191045.TBgxxg1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   c836072ed719073e205d0d8d16b766940e240e68
commit: f430fff8339fb95a85489c1363c3ac7ab0d0f536 [61/81] wifi: ath12k: Split scan request for split band device
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250219/202502191045.TBgxxg1V-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191045.TBgxxg1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191045.TBgxxg1V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/mac.c:7:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ath/ath12k/mac.c:7:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ath/ath12k/mac.c:7:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath12k/mac.c:4778:15: warning: variable 'ar' is uninitialized when used here [-Wuninitialized]
    4778 |                 ath12k_warn(ar->ab, "unable to select device for scan\n");
         |                             ^~
   drivers/net/wireless/ath/ath12k/debug.h:36:50: note: expanded from macro 'ath12k_warn'
      36 | #define ath12k_warn(ab, fmt, ...) __ath12k_warn((ab)->dev, fmt, ##__VA_ARGS__)
         |                                                  ^~
   drivers/net/wireless/ath/ath12k/mac.c:4768:19: note: initialize the variable 'ar' to silence this warning
    4768 |         struct ath12k *ar, *prev_ar;
         |                          ^
         |                           = NULL
   13 warnings generated.


vim +/ar +4778 drivers/net/wireless/ath/ath12k/mac.c

  4763	
  4764	static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
  4765					 struct ieee80211_vif *vif,
  4766					 struct ieee80211_scan_request *hw_req)
  4767	{
  4768		struct ath12k *ar, *prev_ar;
  4769		int i, from_index, to_index;
  4770	
  4771		lockdep_assert_wiphy(hw->wiphy);
  4772		/* Since the targeted scan device could depend on the frequency
  4773		 * requested in the hw_req, select the corresponding radio
  4774		 */
  4775		prev_ar = ath12k_mac_select_scan_device(hw, vif,
  4776							hw_req->req.channels[0]->center_freq);
  4777		if (!prev_ar) {
> 4778			ath12k_warn(ar->ab, "unable to select device for scan\n");
  4779			return -EINVAL;
  4780		}
  4781	
  4782		/* NOTE: There could be 5G low/high channels as mac80211 sees
  4783		 * it as an single band. In that case split the hw request and
  4784		 * perform multiple scans
  4785		 */
  4786		from_index = 0;
  4787		for (i = 1; i < hw_req->req.n_channels; i++) {
  4788			ar = ath12k_mac_select_scan_device(hw, vif,
  4789							   hw_req->req.channels[i]->center_freq);
  4790			if (!ar) {
  4791				ath12k_warn(ar->ab, "unable to select device for scan\n");
  4792				return -EINVAL;
  4793			}
  4794			if (prev_ar == ar)
  4795				continue;
  4796	
  4797			to_index = i;
  4798			ath12k_mac_initiate_hw_scan(hw, vif, hw_req, prev_ar,
  4799						    from_index, to_index);
  4800			from_index = to_index;
  4801			prev_ar = ar;
  4802		}
  4803		return ath12k_mac_initiate_hw_scan(hw, vif, hw_req, prev_ar, from_index, i);
  4804	}
  4805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
