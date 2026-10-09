Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4D3537D2;
	Fri,  9 Oct 2026 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528768; cv=none; b=KoRwQ+V7EEp5nXu781jRoOD1igdHj5DZ70QbTMe5YrDefuCu7EILQ9TEa9GuUsW1Wl7b6t1hfDs62oNntOfny79k3RAY54iJDpvYvXTIwtQ74i3Ej1RVTY1GL29+uLlAe5FyY1O+FmQSSEtGs0/6pP/bNQNbQXHHeqJuOgGrnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528768; c=relaxed/simple;
	bh=H1+FpJ79sK0uwFTJ3AfplsqD0q6SPMdFpNjloq56mGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4oUqKq0eOdD+BeMa6nOl1KYNKu3/Lo7klbSWr1co1IYg/9wJJJSFN9A84CCo+vCsGuOfz1XrzYbuKNfirKecwcs57oManngIdoA7I4g448qmRWeuIc2xiV3654T0/qGLcw9rJmY+9h67yb6zmYbablqspfYorfvyuaq/rS6CSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzYFVJwE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzYFVJwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791528767; x=1823064767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H1+FpJ79sK0uwFTJ3AfplsqD0q6SPMdFpNjloq56mGU=;
  b=EzYFVJwEY6sTeZaLQ4yU1dzdThH3NfAiA0lVUP/zCXRJTCd7gb8GqHk3
   2xQlSXt0VqgfwoS1yJgGHpMTnAZvIFk9QvJwJxPSeL91RgovHUhn974PB
   zmKe0qITnuDHU26umLMGPCMJ7HfWTSq20cTr8oiQerwcMjCBAgsHHaTIi
   MgdCcI2eIIkVyviP8ER0F+c9qbJ+0LeqHqjZJdqwbDJVn93KH3jPskW3p
   0XexxFk8navlQSKXyhWFiqha8BtoJBIfTXZ4+s87bihD9p/h+RycvbX6L
   eEJo5/FYPe199xb3qCsESjCs/PEYfZgGwJUKvJfbgO0L+eXyIZ+U0gEc2
   A==;
X-CSE-ConnectionGUID: 8BDcwE+mTnejV/zJBlXaPw==
X-CSE-MsgGUID: NjHpfb/hRme/xtnWegW1PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="332498"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="332498"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:52:46 -0700
X-CSE-ConnectionGUID: VX1XhK7RTrmDhvfTgjEN9Q==
X-CSE-MsgGUID: wSiI1/5YQqWBUWtYpU0ucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="1977362"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 08 Oct 2026 23:52:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF4T8-000000005QG-17al;
	Fri, 09 Oct 2026 06:52:38 +0000
Date: Fri, 9 Oct 2026 14:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
	Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
	Robert Foss <rfoss@kernel.org>,
	Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/74] media: qcom: camss: vfe: Represent output as an
 array instead of a singleton
Message-ID: <202610091417.UPY6v8H3-lkp@intel.com>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-19-ed985aefd611@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-19-ed985aefd611@kernel.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8d3ae59288f1e7d58d76558a6ee96d533bc5019f]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/media-qcom-camss-vfe-Rename-gen3-back-to-vfe780/20261005-191331
base:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
patch link:    https://lore.kernel.org/r/20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-19-ed985aefd611%40kernel.org
patch subject: [PATCH 19/74] media: qcom: camss: vfe: Represent output as an array instead of a singleton
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261009/202610091417.UPY6v8H3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091417.UPY6v8H3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091417.UPY6v8H3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-vfe-17x.c:395:9: error: incompatible pointer types assigning to 'struct vfe_output *' from 'struct vfe_output (*)[1]' [-Wincompatible-pointer-types]
     395 |         output = &line->output;
         |                ^ ~~~~~~~~~~~~~
   1 error generated.


vim +395 drivers/media/platform/qcom/camss/camss-vfe-17x.c

7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  385  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  386  static int vfe_get_output(struct vfe_line *line)
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  387  {
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  388  	struct vfe_device *vfe = to_vfe(line);
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  389  	struct vfe_output *output;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  390  	unsigned long flags;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  391  	int wm_idx;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  392  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  393  	spin_lock_irqsave(&vfe->output_lock, flags);
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  394  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16 @395  	output = &line->output;
8ce158c1be981bf drivers/media/platform/qcom/camss/camss-vfe-170.c Milen Mitkov 2022-12-09  396  	if (output->state > VFE_OUTPUT_RESERVED) {
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  397  		dev_err(vfe->camss->dev, "Output is running\n");
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  398  		goto error;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  399  	}
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  400  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  401  	output->wm_num = 1;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  402  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  403  	wm_idx = vfe_reserve_wm(vfe, line->id);
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  404  	if (wm_idx < 0) {
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  405  		dev_err(vfe->camss->dev, "Can not reserve wm\n");
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  406  		goto error_get_wm;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  407  	}
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  408  	output->wm_idx[0] = wm_idx;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  409  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  410  	output->drop_update_idx = 0;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  411  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  412  	spin_unlock_irqrestore(&vfe->output_lock, flags);
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  413  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  414  	return 0;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  415  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  416  error_get_wm:
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  417  	vfe_release_wm(vfe, output->wm_idx[0]);
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  418  	output->state = VFE_OUTPUT_OFF;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  419  error:
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  420  	spin_unlock_irqrestore(&vfe->output_lock, flags);
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  421  
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  422  	return -EINVAL;
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  423  }
7319cdf189bb643 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  424  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
