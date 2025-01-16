Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B467C1E50B;
	Thu, 16 Jan 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737030840; cv=none; b=YmJk+VWYrGilelqd8ECF4rAXLv5r/30nWu0GGm6IrAI3wAWS2B2TxMUBGgONLYlwf8S7mwgTaGI8xka/H6UC7rsdHBbQfZsNyqCwPIqNiVY/YVhaIFRq7uieFOkNb+RgUFhE9qKL5dc5LOlPQiGKZRPNEyZFz2ixoynngKqAGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737030840; c=relaxed/simple;
	bh=URYD4orAWUPlAIo0veMlLGPudtl79GZLpB4L3IsRIaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqEmGasI5c7YdTBbO15Ybnj49LvAgq3Fw03HH4+Qy6XwyNDW+v2gwXGXCVkgSuPMRNOuvCnXxXpaLqmn6V53YfT6XXom+XapqoSxj38atUslUYV5OpFmh2ajDPxWSt0BA3I7yJ1KMZzS2sW3LAcC/EiMKSEH9i9bfaIY0wTEwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkWiHt8y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkWiHt8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737030839; x=1768566839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=URYD4orAWUPlAIo0veMlLGPudtl79GZLpB4L3IsRIaQ=;
  b=DkWiHt8yy0NH5rkd+iy0dBCbdDpSEQwML6FYOMM0M29jmhZ29Pj70iii
   42SRWmqoefJZLIx1WxDSfQWWyfbEqSzDwvBMAui5DHll1eTtsHoK9l/LW
   NjchUcK7yj2/ZecNGmrYfpLytuayJ8Brl1vh8vBKOYgNb92+WbGsJB+/a
   8SDT4wmYXI8gVpqsrW9qS/jhK7Aq7J5Qx3zlW3SuwQ729SLNevh1VYduG
   jREM1itIfI5rrLGcm7vbNxL0H4u3i/QCp//zug07TSTF2oO6oq5VKr4t+
   9vw/1xAws86bZsPMH+X7gSBWKlCO+TfO2sl4A0pYqh0OgFncGf07uf1Bz
   A==;
X-CSE-ConnectionGUID: GPz6rG/XTbOYrSO3Qk7oCA==
X-CSE-MsgGUID: GN/9D8J4RaOZYWjtpaeQ7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40225294"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="40225294"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:33:58 -0800
X-CSE-ConnectionGUID: AbJ1C9V/SRyGtZ1yrlP0dg==
X-CSE-MsgGUID: pBy6lnfsQoCZLC0XGxUE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="136322745"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2025 04:33:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYP4K-000RoB-2S;
	Thu, 16 Jan 2025 12:33:52 +0000
Date: Thu, 16 Jan 2025 20:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux@armlinux.org.uk, horms@kernel.org,
	netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: Re: [PATCH net-next v3 1/2] net: txgbe: Add basic support for new
 AML devices
Message-ID: <202501162038.zXreDkFM-lkp@intel.com>
References: <20250115102408.2225055-1-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115102408.2225055-1-jiawenwu@trustnetic.com>

Hi Jiawen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiawen-Wu/net-wangxun-Replace-the-judgement-of-MAC-type-with-flags/20250115-180916
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250115102408.2225055-1-jiawenwu%40trustnetic.com
patch subject: [PATCH net-next v3 1/2] net: txgbe: Add basic support for new AML devices
config: powerpc-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250116/202501162038.zXreDkFM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501162038.zXreDkFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501162038.zXreDkFM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/libwx/wx_hw.c:451:12: warning: variable 'recv_hdr' is uninitialized when used here [-Wuninitialized]
     451 |         buf_len = recv_hdr->buf_len;
         |                   ^~~~~~~~
   drivers/net/ethernet/wangxun/libwx/wx_hw.c:406:29: note: initialize the variable 'recv_hdr' to silence this warning
     406 |         struct wx_hic_hdr *recv_hdr;
         |                                    ^
         |                                     = NULL
   1 warning generated.


vim +/recv_hdr +451 drivers/net/ethernet/wangxun/libwx/wx_hw.c

   400	
   401	static int wx_host_interface_command_r(struct wx *wx, u32 *buffer,
   402					       u32 length, u32 timeout, bool return_data)
   403	{
   404		struct wx_hic_hdr *send_hdr = (struct wx_hic_hdr *)buffer;
   405		u32 hdr_size = sizeof(struct wx_hic_hdr);
   406		struct wx_hic_hdr *recv_hdr;
   407		bool busy, reply;
   408		u32 dword_len;
   409		u16 buf_len;
   410		int err = 0;
   411		u8 send_cmd;
   412		u32 i;
   413	
   414		/* wait to get lock */
   415		might_sleep();
   416		err = read_poll_timeout(test_and_set_bit, busy, !busy, 1000, timeout * 1000,
   417					false, WX_STATE_SWFW_BUSY, wx->state);
   418		if (err)
   419			return err;
   420	
   421		/* index to unique seq id for each mbox message */
   422		send_hdr->index = wx->swfw_index;
   423		send_cmd = send_hdr->cmd;
   424	
   425		dword_len = length >> 2;
   426		/* write data to SW-FW mbox array */
   427		for (i = 0; i < dword_len; i++) {
   428			wr32a(wx, WX_SW2FW_MBOX, i, (__force u32)cpu_to_le32(buffer[i]));
   429			/* write flush */
   430			rd32a(wx, WX_SW2FW_MBOX, i);
   431		}
   432	
   433		/* generate interrupt to notify FW */
   434		wr32m(wx, WX_SW2FW_MBOX_CMD, WX_SW2FW_MBOX_CMD_VLD, 0);
   435		wr32m(wx, WX_SW2FW_MBOX_CMD, WX_SW2FW_MBOX_CMD_VLD, WX_SW2FW_MBOX_CMD_VLD);
   436	
   437		/* polling reply from FW */
   438		err = read_poll_timeout(wx_poll_fw_reply, reply, reply, 1000, 50000,
   439					true, wx, buffer, recv_hdr, send_cmd);
   440		if (err) {
   441			wx_err(wx, "Polling from FW messages timeout, cmd: 0x%x, index: %d\n",
   442			       send_cmd, wx->swfw_index);
   443			goto rel_out;
   444		}
   445	
   446		/* expect no reply from FW then return */
   447		if (!return_data)
   448			goto rel_out;
   449	
   450		/* If there is any thing in data position pull it in */
 > 451		buf_len = recv_hdr->buf_len;
   452		if (buf_len == 0)
   453			goto rel_out;
   454	
   455		if (length < buf_len + hdr_size) {
   456			wx_err(wx, "Buffer not large enough for reply message.\n");
   457			err = -EFAULT;
   458			goto rel_out;
   459		}
   460	
   461		/* Calculate length in DWORDs, add 3 for odd lengths */
   462		dword_len = (buf_len + 3) >> 2;
   463		for (i = hdr_size >> 2; i <= dword_len; i++) {
   464			buffer[i] = rd32a(wx, WX_FW2SW_MBOX, i);
   465			le32_to_cpus(&buffer[i]);
   466		}
   467	
   468	rel_out:
   469		/* index++, index replace wx_hic_hdr.checksum */
   470		if (send_hdr->index == WX_HIC_HDR_INDEX_MAX)
   471			wx->swfw_index = 0;
   472		else
   473			wx->swfw_index = send_hdr->index + 1;
   474	
   475		clear_bit(WX_STATE_SWFW_BUSY, wx->state);
   476		return err;
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
