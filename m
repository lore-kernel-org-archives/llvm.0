Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC71AAE17;
	Tue, 24 Mar 2026 04:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774326056; cv=none; b=oUuaIOj+/cv9I9/G+oe1aq1Cq3NFPKPWcHiI9Vcp6/HjvtZUSKPQzzxCXDgWsvmTXgWwPoeRdt+GHjB2rxyjTaC9FN8k5ckto4gsxzeAOh+UyzMnY5VFAZQL3nkAWmxgZuDYgNgjsRC1fbVUppc4LtJj0wqMikVTPDs4AjHL0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774326056; c=relaxed/simple;
	bh=OqHoKJWvvmhgynw9NqNETcNSrVpJiY3jiGOP7/yHmHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDIzb6ipSKo87W+5VMUJST4sH+uK7OGF7pvXXaX7LH8b2XWfPOJT7mM5oLH2Jud7/g85MXdhehvMy+by8BOvUSyZh+FjsYUUJfC5Yd/bf4OKMav7OVMpiql4nAF+LA6ojk8nUP6hNwhr+5LZ7vEqcLIXyyqtXFITPJQSxeQkUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQz+jxEj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQz+jxEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774326055; x=1805862055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OqHoKJWvvmhgynw9NqNETcNSrVpJiY3jiGOP7/yHmHA=;
  b=LQz+jxEjForzET41En+cYs9spbYMA2uGAj/Gk3IfeREHLNnhTDYk/ibc
   nDUlVZYq3tep4LfCG0PebSZ2UMD+l1J8XdkuaM8nU/qazxZKXGWSf74SW
   LgreEZz6/1cCEIpVacWe8wGV1h0dRkdAWH32jqj0jo9EtSef2K7sjxjJg
   6R1G5aWVbVFUAgtRIiwj7llbBb4IJ4mdpm4OGjREFz5oyoi8lXhrFbyEx
   yTgVm88VvctfxNR73OqWkCQIlBK3WNiTZVP+CEM38IsRH7D3v8kmywVh7
   qAg0a7kL1wio9/8k4JWF8LRwlz7EligAzc5Aa8f/jJZpDwTbNpthNZm+k
   g==;
X-CSE-ConnectionGUID: PAMfKslHRs2plXJE7sImUg==
X-CSE-MsgGUID: BLUjfnfvS2Wzhj/jv+bC2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75359537"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75359537"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 21:20:55 -0700
X-CSE-ConnectionGUID: LAP6mxm/SrGJeXeSAnuoBg==
X-CSE-MsgGUID: 77j8BtE7QLKvHvvTDE1c7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223309159"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2026 21:20:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4tG5-000000003mP-1gTE;
	Tue, 24 Mar 2026 04:20:49 +0000
Date: Tue, 24 Mar 2026 12:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: songxiebing <songxiebing@kylinos.cn>, tiwai@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: core/seq: Optimize the return logic in
 cc_ev_to_ump_midi2
Message-ID: <202603241242.5Kms3LqO-lkp@intel.com>
References: <20260323024742.220707-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323024742.220707-1-songxiebing@kylinos.cn>

Hi songxiebing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/songxiebing/ALSA-core-seq-Optimize-the-return-logic-in-cc_ev_to_ump_midi2/20260324-013342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260323024742.220707-1-songxiebing%40kylinos.cn
patch subject: [PATCH] ALSA: core/seq: Optimize the return logic in cc_ev_to_ump_midi2
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603241242.5Kms3LqO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241242.5Kms3LqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241242.5Kms3LqO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/seq/seq_ump_convert.c:881:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     881 |         case UMP_CC_BANK_SELECT_LSB:
         |         ^
   sound/core/seq/seq_ump_convert.c:881:2: note: insert '__attribute__((fallthrough));' to silence this warning
     881 |         case UMP_CC_BANK_SELECT_LSB:
         |         ^
         |         __attribute__((fallthrough)); 
   sound/core/seq/seq_ump_convert.c:881:2: note: insert 'break;' to avoid fall-through
     881 |         case UMP_CC_BANK_SELECT_LSB:
         |         ^
         |         break; 
   sound/core/seq/seq_ump_convert.c:885:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     885 |         case UMP_CC_DATA_LSB:
         |         ^
   sound/core/seq/seq_ump_convert.c:885:2: note: insert '__attribute__((fallthrough));' to silence this warning
     885 |         case UMP_CC_DATA_LSB:
         |         ^
         |         __attribute__((fallthrough)); 
   sound/core/seq/seq_ump_convert.c:885:2: note: insert 'break;' to avoid fall-through
     885 |         case UMP_CC_DATA_LSB:
         |         ^
         |         break; 
   2 warnings generated.


vim +881 sound/core/seq/seq_ump_convert.c

e9e02819a98a50 Takashi Iwai 2023-05-23  833  
e9e02819a98a50 Takashi Iwai 2023-05-23  834  /* convert CC event to MIDI 2.0 UMP */
e9e02819a98a50 Takashi Iwai 2023-05-23  835  static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
e9e02819a98a50 Takashi Iwai 2023-05-23  836  			      struct snd_seq_client_port *dest_port,
e9e02819a98a50 Takashi Iwai 2023-05-23  837  			      union snd_ump_midi2_msg *data,
e9e02819a98a50 Takashi Iwai 2023-05-23  838  			      unsigned char status)
e9e02819a98a50 Takashi Iwai 2023-05-23  839  {
e9e02819a98a50 Takashi Iwai 2023-05-23  840  	unsigned char channel = event->data.control.channel & 0x0f;
e9e02819a98a50 Takashi Iwai 2023-05-23  841  	unsigned char index = event->data.control.param & 0x7f;
e9e02819a98a50 Takashi Iwai 2023-05-23  842  	unsigned char val = event->data.control.value & 0x7f;
a683030606fa5f Takashi Iwai 2024-07-31  843  	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
521be8ec43cb74 songxiebing  2026-03-23  844  	int ret = 0;
e9e02819a98a50 Takashi Iwai 2023-05-23  845  
e9e02819a98a50 Takashi Iwai 2023-05-23  846  	/* process special CC's (bank/rpn/nrpn) */
e9e02819a98a50 Takashi Iwai 2023-05-23  847  	switch (index) {
e9e02819a98a50 Takashi Iwai 2023-05-23  848  	case UMP_CC_RPN_MSB:
a4ff92ff0bdd73 Takashi Iwai 2024-07-31  849  		ret = fill_rpn(cc, data, channel, true);
e9e02819a98a50 Takashi Iwai 2023-05-23  850  		cc->rpn_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  851  		cc->cc_rpn_msb = val;
98ea612dd1150a Takashi Iwai 2024-07-31  852  		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
98ea612dd1150a Takashi Iwai 2024-07-31  853  			reset_rpn(cc);
521be8ec43cb74 songxiebing  2026-03-23  854  		break;
e9e02819a98a50 Takashi Iwai 2023-05-23  855  	case UMP_CC_RPN_LSB:
a4ff92ff0bdd73 Takashi Iwai 2024-07-31  856  		ret = fill_rpn(cc, data, channel, true);
e9e02819a98a50 Takashi Iwai 2023-05-23  857  		cc->rpn_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  858  		cc->cc_rpn_lsb = val;
98ea612dd1150a Takashi Iwai 2024-07-31  859  		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
98ea612dd1150a Takashi Iwai 2024-07-31  860  			reset_rpn(cc);
521be8ec43cb74 songxiebing  2026-03-23  861  		break;
e9e02819a98a50 Takashi Iwai 2023-05-23  862  	case UMP_CC_NRPN_MSB:
a4ff92ff0bdd73 Takashi Iwai 2024-07-31  863  		ret = fill_rpn(cc, data, channel, true);
e9e02819a98a50 Takashi Iwai 2023-05-23  864  		cc->nrpn_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  865  		cc->cc_nrpn_msb = val;
521be8ec43cb74 songxiebing  2026-03-23  866  		break;
e9e02819a98a50 Takashi Iwai 2023-05-23  867  	case UMP_CC_NRPN_LSB:
a4ff92ff0bdd73 Takashi Iwai 2024-07-31  868  		ret = fill_rpn(cc, data, channel, true);
e9e02819a98a50 Takashi Iwai 2023-05-23  869  		cc->nrpn_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  870  		cc->cc_nrpn_lsb = val;
521be8ec43cb74 songxiebing  2026-03-23  871  		break;
e9e02819a98a50 Takashi Iwai 2023-05-23  872  	case UMP_CC_DATA:
a4ff92ff0bdd73 Takashi Iwai 2024-07-31  873  		cc->cc_data_msb_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  874  		cc->cc_data_msb = val;
521be8ec43cb74 songxiebing  2026-03-23  875  		ret = fill_rpn(cc, data, channel, false);
521be8ec43cb74 songxiebing  2026-03-23  876  		break;
e9e02819a98a50 Takashi Iwai 2023-05-23  877  	case UMP_CC_BANK_SELECT:
e9e02819a98a50 Takashi Iwai 2023-05-23  878  		cc->bank_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  879  		cc->cc_bank_msb = val;
521be8ec43cb74 songxiebing  2026-03-23  880  		ret = 0; // skip
e9e02819a98a50 Takashi Iwai 2023-05-23 @881  	case UMP_CC_BANK_SELECT_LSB:
e9e02819a98a50 Takashi Iwai 2023-05-23  882  		cc->bank_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  883  		cc->cc_bank_lsb = val;
521be8ec43cb74 songxiebing  2026-03-23  884  		ret = 0; // skip
e9e02819a98a50 Takashi Iwai 2023-05-23  885  	case UMP_CC_DATA_LSB:
a4ff92ff0bdd73 Takashi Iwai 2024-07-31  886  		cc->cc_data_lsb_set = 1;
e9e02819a98a50 Takashi Iwai 2023-05-23  887  		cc->cc_data_lsb = val;
521be8ec43cb74 songxiebing  2026-03-23  888  		ret = fill_rpn(cc, data, channel, false);
521be8ec43cb74 songxiebing  2026-03-23  889  		break;
521be8ec43cb74 songxiebing  2026-03-23  890  	default:
e9e02819a98a50 Takashi Iwai 2023-05-23  891  		data->cc.status = status;
e9e02819a98a50 Takashi Iwai 2023-05-23  892  		data->cc.channel = channel;
e9e02819a98a50 Takashi Iwai 2023-05-23  893  		data->cc.index = index;
e9e02819a98a50 Takashi Iwai 2023-05-23  894  		data->cc.data = upscale_7_to_32bit(event->data.control.value & 0x7f);
521be8ec43cb74 songxiebing  2026-03-23  895  		ret = 1;
521be8ec43cb74 songxiebing  2026-03-23  896  		break;
521be8ec43cb74 songxiebing  2026-03-23  897  	}
521be8ec43cb74 songxiebing  2026-03-23  898  
521be8ec43cb74 songxiebing  2026-03-23  899  	return ret;
e9e02819a98a50 Takashi Iwai 2023-05-23  900  }
e9e02819a98a50 Takashi Iwai 2023-05-23  901  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
