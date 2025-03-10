Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D84184F;
	Mon, 10 Mar 2025 05:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741585904; cv=none; b=Gvgi7KbBqu2RDFRVuhw7X+eHRgphXWjRnAKJnRQ9BzZxWtRZuQTHCLCZbIowA3H2Q1pwTC4WFTBjMaGfcuNQETbQ1qHTI+csVemMB2MU6PLVcrpOupdIZi6mwLeJbkeNuBpGmg9F52MfwDfraqciIHcJPqjvtAeW49pH/QrOJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741585904; c=relaxed/simple;
	bh=pkvcGoJYqPkfnjx/FWK4pr+tkYcyNCVGpXvtq8+JiDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cug/I0ZVgI/7v0AaSc9qTz5CsIHtoyziwbffkLV2bAEgQ0YXni5MFK2/Ccx5LkQo6FZgF4nPMa3uaPr60A0fGHTEK1HVg6yRnl0gnD5Geeu0yO0mCQ0SM8W8zXgzT1PUy1TdqyxBXVVHmKQWX579BDaAVMypOW3hrGrIofpcX3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe3CmMar; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe3CmMar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741585903; x=1773121903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pkvcGoJYqPkfnjx/FWK4pr+tkYcyNCVGpXvtq8+JiDg=;
  b=Qe3CmMarjZx+PEsjuMsOSRdLaH7VeoWkINoW9+OgWkKx/CBjRWv7DZHn
   Rk5Sn+/YY49YCaqQ7fwFZeuImUzY4pa1RutCu4OiEEUeWS/D0IY29qzG4
   za5cR0fcy0qcSUd5vBJEs0kZ5aZAYMl6pWWaJZvUrSrbOR2ukLEV9S2hb
   strvG9j/ClPgXvyUN8qj6N9izjcEEvijsEfEOIjyNggqFl9mvDTIo+PXa
   ZvlP4ur+oM5QXfR/jnSI4YetT6EtZ3NBv0janQ2PD0EAUS0HF86amrGtx
   MlH/ASQdVWWwVfTAsVkyRvjRyWKCO/m2p9uJ77XS3rGHDhn94Wj+e0T5U
   g==;
X-CSE-ConnectionGUID: 91q1teoFRhCzbo4ci0LhrQ==
X-CSE-MsgGUID: p6CUMQ6LQ7+gX3tzqSt7GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65011555"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="65011555"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 22:51:42 -0700
X-CSE-ConnectionGUID: DkOHpz8XT+69PlPEmQ9OAg==
X-CSE-MsgGUID: +2yc0tImToi3QEBT3Ij4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119737197"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2025 22:51:40 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trW38-0003qo-0q;
	Mon, 10 Mar 2025 05:51:38 +0000
Date: Mon, 10 Mar 2025 13:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-03-07 17/40]
 sound/soc/soc-pcm.c:1635:8: error: call to undeclared function
 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202503101300.LhjHiEqb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kuninori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/morimoto/linux sound-cleanup-2025-03-07
head:   609577579ecf4de9913d0d83a96d240bd935a4a1
commit: f6c0618b06d3285bd3ddd254ce62c5eb92c6e4f1 [17/40] ASoC: soc-pcm: tidyup function name to snd_soc_dpcm_be_can_xxx()
config: x86_64-buildonly-randconfig-004-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101300.LhjHiEqb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101300.LhjHiEqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101300.LhjHiEqb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-pcm.c:1635:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1635 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:1685:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1685 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:2010:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2010 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:2076:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2076 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:2121:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2121 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:2191:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2191 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:2468:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2468 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   sound/soc/soc-pcm.c:2626:8: error: call to undeclared function 'snd_soc_dpcm_can_be_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2626 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^
   8 errors generated.


vim +/snd_soc_dpcm_can_be_update +1635 sound/soc/soc-pcm.c

  1619	
  1620	void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
  1621			      int do_hw_free, struct snd_soc_dpcm *last)
  1622	{
  1623		struct snd_soc_dpcm *dpcm;
  1624	
  1625		/* disable any enabled and non active backends */
  1626		for_each_dpcm_be(fe, stream, dpcm) {
  1627			struct snd_soc_pcm_runtime *be = dpcm->be;
  1628			struct snd_pcm_substream *be_substream =
  1629				snd_soc_dpcm_get_substream(be, stream);
  1630	
  1631			if (dpcm == last)
  1632				return;
  1633	
  1634			/* is this op for this BE ? */
> 1635			if (!snd_soc_dpcm_can_be_update(fe, be, stream))
  1636				continue;
  1637	
  1638			if (be->dpcm[stream].users == 0) {
  1639				dev_err(be->dev, "ASoC: no users %s at close - state %d\n",
  1640					snd_pcm_direction_name(stream),
  1641					be->dpcm[stream].state);
  1642				continue;
  1643			}
  1644	
  1645			if (--be->dpcm[stream].users != 0)
  1646				continue;
  1647	
  1648			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) {
  1649				if (!do_hw_free)
  1650					continue;
  1651	
  1652				if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE) {
  1653					__soc_pcm_hw_free(be, be_substream);
  1654					be->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_FREE;
  1655				}
  1656			}
  1657	
  1658			__soc_pcm_close(be, be_substream);
  1659			be_substream->runtime = NULL;
  1660			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
  1661		}
  1662	}
  1663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
