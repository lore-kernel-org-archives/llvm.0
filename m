Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63133242D72;
	Tue,  8 Sep 2026 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788829778; cv=none; b=ms4f4EXgTI/wLurylL6ymDCF7Db9PL6Jz9ZXDWZ/HPtYBdubPFzpXNollXgazlNtGM7z+QO+gTzkyxMLYNqVLij55HDmBRaV+W8QJVY6cXjCmnIkL2rtOhFqZGPX9Z1rcNTeWd/ME0NTxbwnDSiKR0c5zvxYTw2rXZdZuHpLxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788829778; c=relaxed/simple;
	bh=VYgsaIIhZa9Vpxs6rnUwQoV99atGSMGQxukydgYacBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DVuXRd+XAQ1VD2n/ZMs+8UEb7CBeMkPcxTG3hnDw0SzpNdm0Ez3ipe89NrTc0VHkapKCW4834o5IKUazstXnNzOSORVaMxSoPLwWpUHYBlfrZTcu4yj+aBAkFxA6EViOVNtBmwWLDfdROZFdt86Y1bdhas8hFP/jpJGobavdOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4RkFbzx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4RkFbzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788829776; x=1820365776;
  h=date:from:to:cc:subject:message-id;
  bh=VYgsaIIhZa9Vpxs6rnUwQoV99atGSMGQxukydgYacBU=;
  b=L4RkFbzxjVfM7PLWf4XpuwB9vi7BQI48eZsGev5nFZcPCiktilhMaWvk
   Jhx5kOhs3BL4k/I/3MywWW7PC7nhewT5kJN1S1tt4aVxObE1kYJ3KNJYt
   M97XL7gNx175WHeYFtuz09x5OCSvhBZU5ne2v/SGf8R25y5GXLnP0536h
   1fA1v1HGgEyKiekTv3fkvdkU98lv+oQFLYOQKnyHYAWInxjrzTHBPCXeB
   apPH9nOP7U6zPjcYD3NbTnEBn/9e+PHoEAN9eCCeYE9n7WGI5XXsRPVTP
   /bRXmR7t6WfTvnHukGrp4nBp/tzF0htt2VscpaB/4Oqw/B1/6sYIyqj+Z
   Q==;
X-CSE-ConnectionGUID: EozBPO6MSk2ZL1lL/eIBCQ==
X-CSE-MsgGUID: o5H0HzKQSsmkLnvgNMusVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76784197"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76784197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:09:33 -0700
X-CSE-ConnectionGUID: 8ie541+ZTDiH7wlKWBRm2g==
X-CSE-MsgGUID: aIzoWWq8QZOIceNX36T0lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270319761"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Sep 2026 18:09:32 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kL3-000000001Un-2Pzp;
	Tue, 08 Sep 2026 01:09:29 +0000
Date: Tue, 08 Sep 2026 09:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 263/343]
 sound/soc/codecs/nau8360-dsp.c:231:13: error: incomplete definition of type
 'struct snd_soc_component'
Message-ID: <202609080804.DHiRTu73-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 39822a6ef2f5c6b15b01c08c9a6c70b57d7134fd [263/343] ASoC: soc-component: capsuling Component
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609080804.DHiRTu73-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 419c22c908c97dac45d161ce56fa01b99ec7debf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080804.DHiRTu73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080804.DHiRTu73-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/nau8360-dsp.c:117:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:117:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     117 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/nau8360-dsp.c:231:13: error: incomplete definition of type 'struct snd_soc_component'
     231 |                 dev_err(cp->dev, "message error (CMD_ID 0x%x, LEN 0x%x) !!!",
         |                         ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/codecs/nau8360-dsp.c:265:25: error: incomplete definition of type 'struct snd_soc_component'
     265 |         struct device *dev = cp->dev;
         |                              ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/codecs/nau8360-dsp.c:266:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:266:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     266 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:296:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:296:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     296 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:297:25: error: incomplete definition of type 'struct snd_soc_component'
     297 |         struct device *dev = cp->dev;
         |                              ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/codecs/nau8360-dsp.c:336:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:336:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     336 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:337:25: error: incomplete definition of type 'struct snd_soc_component'
     337 |         struct device *dev = cp->dev;
         |                              ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/codecs/nau8360-dsp.c:446:14: error: incomplete definition of type 'struct snd_soc_component'
     446 |                         dev_err(cp->dev, "DSP %x fail (%d)", nau8360_dsp_addr[i], ret);
         |                                 ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/codecs/nau8360-dsp.c:515:25: error: incomplete definition of type 'struct snd_soc_component'
     515 |         struct device *dev = cp->dev;
         |                              ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/codecs/nau8360-dsp.c:534:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     534 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:534:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     534 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:562:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     562 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:562:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     562 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:572:13: error: incomplete definition of type 'struct snd_soc_component'
     572 |                 dev_err(cp->dev, "DSP %x is not ready", dsp_addr);
         |                         ~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +231 sound/soc/codecs/nau8360-dsp.c

be88847a8bb1a1 Neo Chang 2026-08-25  197  
be88847a8bb1a1 Neo Chang 2026-08-25  198  static int nau8360_message_to_dsp(struct snd_soc_component *cp,
be88847a8bb1a1 Neo Chang 2026-08-25  199  	const struct nau8360_cmd_info *cmd_info, int frag_len, int param_offset,
be88847a8bb1a1 Neo Chang 2026-08-25  200  	int param_size, void *param_data, unsigned short dsp_addr)
be88847a8bb1a1 Neo Chang 2026-08-25  201  {
be88847a8bb1a1 Neo Chang 2026-08-25  202  	unsigned int payload;
be88847a8bb1a1 Neo Chang 2026-08-25  203  	int ret, padding = 0, frag_cnt = 0;
be88847a8bb1a1 Neo Chang 2026-08-25  204  
be88847a8bb1a1 Neo Chang 2026-08-25  205  	ret = nau8360_dsp_idle(cp, dsp_addr);
be88847a8bb1a1 Neo Chang 2026-08-25  206  	if (ret)
be88847a8bb1a1 Neo Chang 2026-08-25  207  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  208  
be88847a8bb1a1 Neo Chang 2026-08-25  209  	/* sending preamble fragment */
be88847a8bb1a1 Neo Chang 2026-08-25  210  	payload = nau8360_pack_preamble(cmd_info->cmd_id, frag_len);
be88847a8bb1a1 Neo Chang 2026-08-25  211  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  212  
be88847a8bb1a1 Neo Chang 2026-08-25  213  	if (!cmd_info->msg_param)
be88847a8bb1a1 Neo Chang 2026-08-25  214  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  215  
be88847a8bb1a1 Neo Chang 2026-08-25  216  	/* sending payload + padding */
be88847a8bb1a1 Neo Chang 2026-08-25  217  	payload = nau8360_pack_param(param_offset, param_size);
be88847a8bb1a1 Neo Chang 2026-08-25  218  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  219  	frag_cnt++;
be88847a8bb1a1 Neo Chang 2026-08-25  220  
be88847a8bb1a1 Neo Chang 2026-08-25  221  	if (cmd_info->setup_data)
be88847a8bb1a1 Neo Chang 2026-08-25  222  		nau8360_send_data_payload(cp, dsp_addr, param_data, param_size,
be88847a8bb1a1 Neo Chang 2026-08-25  223  			&frag_cnt, &padding);
be88847a8bb1a1 Neo Chang 2026-08-25  224  
be88847a8bb1a1 Neo Chang 2026-08-25  225  	/* sending trailing fragment */
be88847a8bb1a1 Neo Chang 2026-08-25  226  	frag_cnt++;
be88847a8bb1a1 Neo Chang 2026-08-25  227  	payload = nau8360_pack_trailing(frag_cnt, padding);
be88847a8bb1a1 Neo Chang 2026-08-25  228  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  229  
be88847a8bb1a1 Neo Chang 2026-08-25  230  	if (frag_cnt != frag_len) {
be88847a8bb1a1 Neo Chang 2026-08-25 @231  		dev_err(cp->dev, "message error (CMD_ID 0x%x, LEN 0x%x) !!!",
be88847a8bb1a1 Neo Chang 2026-08-25  232  			cmd_info->cmd_id, frag_cnt);
be88847a8bb1a1 Neo Chang 2026-08-25  233  		return -EPROTO;
be88847a8bb1a1 Neo Chang 2026-08-25  234  	}
be88847a8bb1a1 Neo Chang 2026-08-25  235  
be88847a8bb1a1 Neo Chang 2026-08-25  236  	return 0;
be88847a8bb1a1 Neo Chang 2026-08-25  237  }
be88847a8bb1a1 Neo Chang 2026-08-25  238  

:::::: The code at line 231 was first introduced by commit
:::::: be88847a8bb1a14194cf50116f8909d127861318 ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

:::::: TO: Neo Chang <YLCHANG2@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
