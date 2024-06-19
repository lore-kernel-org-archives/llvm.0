Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571FA84FAD;
	Wed, 19 Jun 2024 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816614; cv=none; b=oyTVut9Qz039rMmU5vMBTrxk7kC1/1iTBGGOLP2hsttxhjCopbyD6tdN2i7UIh1vUuytkih29UcGiRPj/ANzPbl9spN7SRjcrjSnm63bYzDs0PANZcBkZOWa09w6qNttjqVDTaaEUfGCgUI2mP7Oy3vLMBazmHiHaTNMY+09sDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816614; c=relaxed/simple;
	bh=/hS2L66KadqEmOnpUA9RHLLLQuqUw8pdpPT+C+u5SPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ2QDSl0V+UcUwBks1JXXxQSh9Hps27pWGTShp7CXO3n/c72tvtP03CfhtqAZgcoq/5331pwqiw+MZWJXD1QjIchElWVEUmGfDybA8SZl3T9OwQHIMPu0ZYri3uJ+97eV8HJJbqsyJ1ZvTou+NiC4lGipGSrRp690v4SqFtDoz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8GkMqCE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8GkMqCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718816613; x=1750352613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/hS2L66KadqEmOnpUA9RHLLLQuqUw8pdpPT+C+u5SPk=;
  b=B8GkMqCEKDllJWUuRSbl4lCFPa0L/x7GXys2q7PVuZLNriocOx+x+3J6
   CX5/fnvVdFxAzPaTvm6zBBom6RvRHv4366JTg1TjhqI2BOBRdluFsA/H3
   m9usZtOVsw0WVGx3ArEn0alHP19K7/qF7KCQfcUeW164GYDT2ul6HgETT
   a2wS4Gfx/B7nye9see3IwEHveqZIdGVCIrBKmn1CObRjB9DXoBjhc3HVw
   h5qOwsji3pi38O/s4Z8NMOjUrS32dhWEY4oFRkGlpjqEI8GfMMHnE8b/6
   EFF0zqy5rfuij3JAKPmBoqS0zuWrEiDnArQvtU46VhVGzoI25vv86my5b
   w==;
X-CSE-ConnectionGUID: jtygmIHZSbO7Ni4i8//law==
X-CSE-MsgGUID: bPEmZYkhRwquWVqvCcLq+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15529441"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15529441"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:03:32 -0700
X-CSE-ConnectionGUID: /2DxfLgATLyqWdOR28FTXA==
X-CSE-MsgGUID: nlmwYjJOQpeXkCF2eBmolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42102985"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jun 2024 10:03:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJyiV-0006n0-3D;
	Wed, 19 Jun 2024 17:03:27 +0000
Date: Thu, 20 Jun 2024 01:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to
 dump a pipeline to the log
Message-ID: <202406200005.K2Kdd3VC-lkp@intel.com>
References: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 91798162245991e26949ef62851719bb2177a9c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-renesas-vsp1-Drop-vsp1_entity_get_pad_format-wrapper/20240619-081928
base:   91798162245991e26949ef62851719bb2177a9c2
patch link:    https://lore.kernel.org/r/20240619001722.9749-12-laurent.pinchart%2Brenesas%40ideasonboard.com
patch subject: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to dump a pipeline to the log
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240620/202406200005.K2Kdd3VC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200005.K2Kdd3VC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200005.K2Kdd3VC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/vsp1/vsp1_pipe.c:304:43: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
                                             ^
   1 warning generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:736:2: error: expected expression
           vsp1_pipeline_dump(pipe, "LIF setup");
           ^
   drivers/media/platform/renesas/vsp1/vsp1_pipe.h:160:42: note: expanded from macro 'vsp1_pipeline_dump'
                   __vsp1_pipeline_dump(NULL, pipe, msg);  \
                                                           ^
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c:736:39: error: expected ')'
           vsp1_pipeline_dump(pipe, "LIF setup");
                                                ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:736:2: note: to match this '('
           vsp1_pipeline_dump(pipe, "LIF setup");
           ^
   drivers/media/platform/renesas/vsp1/vsp1_pipe.h:157:41: note: expanded from macro 'vsp1_pipeline_dump'
   #define vsp1_pipeline_dump(pipe, msg)                   \
                                                           ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:912:2: error: expected expression
           vsp1_pipeline_dump(pipe, "atomic update");
           ^
   drivers/media/platform/renesas/vsp1/vsp1_pipe.h:160:42: note: expanded from macro 'vsp1_pipeline_dump'
                   __vsp1_pipeline_dump(NULL, pipe, msg);  \
                                                           ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:912:43: error: expected ')'
           vsp1_pipeline_dump(pipe, "atomic update");
                                                    ^
   drivers/media/platform/renesas/vsp1/vsp1_drm.c:912:2: note: to match this '('
           vsp1_pipeline_dump(pipe, "atomic update");
           ^
   drivers/media/platform/renesas/vsp1/vsp1_pipe.h:157:41: note: expanded from macro 'vsp1_pipeline_dump'
   #define vsp1_pipeline_dump(pipe, msg)                   \
                                                           ^
   4 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_video.c:533:2: error: expected expression
           vsp1_pipeline_dump(pipe, "video");
           ^
   drivers/media/platform/renesas/vsp1/vsp1_pipe.h:160:42: note: expanded from macro 'vsp1_pipeline_dump'
                   __vsp1_pipeline_dump(NULL, pipe, msg);  \
                                                           ^
>> drivers/media/platform/renesas/vsp1/vsp1_video.c:533:35: error: expected ')'
           vsp1_pipeline_dump(pipe, "video");
                                            ^
   drivers/media/platform/renesas/vsp1/vsp1_video.c:533:2: note: to match this '('
           vsp1_pipeline_dump(pipe, "video");
           ^
   drivers/media/platform/renesas/vsp1/vsp1_pipe.h:157:41: note: expanded from macro 'vsp1_pipeline_dump'
   #define vsp1_pipeline_dump(pipe, msg)                   \
                                                           ^
   2 errors generated.


vim +736 drivers/media/platform/renesas/vsp1/vsp1_drm.c

   622	
   623	/**
   624	 * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
   625	 * @dev: the VSP device
   626	 * @pipe_index: the DRM pipeline index
   627	 * @cfg: the LIF configuration
   628	 *
   629	 * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
   630	 * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
   631	 * source pads, and the LIF sink pad.
   632	 *
   633	 * The @pipe_index argument selects which DRM pipeline to setup. The number of
   634	 * available pipelines depend on the VSP instance.
   635	 *
   636	 * As the media bus code on the blend unit source pad is conditioned by the
   637	 * configuration of its sink 0 pad, we also set up the formats on all blend unit
   638	 * sinks, even if the configuration will be overwritten later by
   639	 * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
   640	 * a well defined state.
   641	 *
   642	 * Return 0 on success or a negative error code on failure.
   643	 */
   644	int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
   645			      const struct vsp1_du_lif_config *cfg)
   646	{
   647		struct vsp1_device *vsp1 = dev_get_drvdata(dev);
   648		struct vsp1_drm_pipeline *drm_pipe;
   649		struct vsp1_pipeline *pipe;
   650		unsigned long flags;
   651		unsigned int i;
   652		int ret;
   653	
   654		if (pipe_index >= vsp1->info->lif_count)
   655			return -EINVAL;
   656	
   657		drm_pipe = &vsp1->drm->pipe[pipe_index];
   658		pipe = &drm_pipe->pipe;
   659	
   660		if (!cfg) {
   661			struct vsp1_brx *brx;
   662	
   663			mutex_lock(&vsp1->drm->lock);
   664	
   665			brx = to_brx(&pipe->brx->subdev);
   666	
   667			/*
   668			 * NULL configuration means the CRTC is being disabled, stop
   669			 * the pipeline and turn the light off.
   670			 */
   671			ret = vsp1_pipeline_stop(pipe);
   672			if (ret == -ETIMEDOUT)
   673				dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
   674	
   675			for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
   676				struct vsp1_rwpf *rpf = pipe->inputs[i];
   677	
   678				if (!rpf)
   679					continue;
   680	
   681				/*
   682				 * Remove the RPF from the pipe and the list of BRx
   683				 * inputs.
   684				 */
   685				WARN_ON(!rpf->entity.pipe);
   686				rpf->entity.pipe = NULL;
   687				list_del(&rpf->entity.list_pipe);
   688				pipe->inputs[i] = NULL;
   689	
   690				brx->inputs[rpf->brx_input].rpf = NULL;
   691			}
   692	
   693			drm_pipe->du_complete = NULL;
   694			pipe->num_inputs = 0;
   695	
   696			dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
   697				__func__, pipe->lif->index,
   698				BRX_NAME(pipe->brx));
   699	
   700			list_del(&pipe->brx->list_pipe);
   701			pipe->brx->pipe = NULL;
   702			pipe->brx = NULL;
   703	
   704			mutex_unlock(&vsp1->drm->lock);
   705	
   706			vsp1_dlm_reset(pipe->output->dlm);
   707			vsp1_device_put(vsp1);
   708	
   709			dev_dbg(vsp1->dev, "%s: pipeline disabled\n", __func__);
   710	
   711			return 0;
   712		}
   713	
   714		/* Reset the underrun counter */
   715		pipe->underrun_count = 0;
   716	
   717		drm_pipe->width = cfg->width;
   718		drm_pipe->height = cfg->height;
   719		pipe->interlaced = cfg->interlaced;
   720	
   721		dev_dbg(vsp1->dev, "%s: configuring LIF%u with format %ux%u%s\n",
   722			__func__, pipe_index, cfg->width, cfg->height,
   723			pipe->interlaced ? "i" : "");
   724	
   725		mutex_lock(&vsp1->drm->lock);
   726	
   727		/* Setup formats through the pipeline. */
   728		ret = vsp1_du_pipeline_setup_inputs(vsp1, pipe);
   729		if (ret < 0)
   730			goto unlock;
   731	
   732		ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
   733		if (ret < 0)
   734			goto unlock;
   735	
 > 736		vsp1_pipeline_dump(pipe, "LIF setup");
   737	
   738		/* Enable the VSP1. */
   739		ret = vsp1_device_get(vsp1);
   740		if (ret < 0)
   741			goto unlock;
   742	
   743		/*
   744		 * Register a callback to allow us to notify the DRM driver of frame
   745		 * completion events.
   746		 */
   747		drm_pipe->du_complete = cfg->callback;
   748		drm_pipe->du_private = cfg->callback_data;
   749	
   750		/* Disable the display interrupts. */
   751		vsp1_write(vsp1, VI6_DISP_IRQ_STA(pipe_index), 0);
   752		vsp1_write(vsp1, VI6_DISP_IRQ_ENB(pipe_index), 0);
   753	
   754		/* Configure all entities in the pipeline. */
   755		vsp1_du_pipeline_configure(pipe);
   756	
   757	unlock:
   758		mutex_unlock(&vsp1->drm->lock);
   759	
   760		if (ret < 0)
   761			return ret;
   762	
   763		/* Start the pipeline. */
   764		spin_lock_irqsave(&pipe->irqlock, flags);
   765		vsp1_pipeline_run(pipe);
   766		spin_unlock_irqrestore(&pipe->irqlock, flags);
   767	
   768		dev_dbg(vsp1->dev, "%s: pipeline enabled\n", __func__);
   769	
   770		return 0;
   771	}
   772	EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
