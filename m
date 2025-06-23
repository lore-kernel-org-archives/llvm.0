Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E101F4604;
	Mon, 23 Jun 2025 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672175; cv=none; b=kmohuRplQ8RAbCsMhHI0vxbs9uR2RAHH84aiIG2ksnmZywnwHel42+ifWJDMH/9C6akYZ+ucDntVNkXB22BZJn14RXUF3ouOGciJ3/hs8Rn75LgptmcaEvuXi867UDbGgX8y6Fkf3BqFu8whWX8nJbWhBZh8Ql9muftAymSaFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672175; c=relaxed/simple;
	bh=VSYp52/7gHd8QnJTkiyJpfzhrDPHfxuHC2PxmZcAHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6eRfAyHZhDGep0fNGGjMF0mjDcjJg0uWN1jjXymfbqI6kqY24zqdKESgwlH5dsodKrtvx+NfrB8GBb6qQqDKRh13hCvwBHFcC3rIFQ2J1bi7EJJRoomb+hAUJs0VQ2ppaYUba1mE1x48jnOLlvYey0zdi3CzeCo9lMopRuGMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIBhvDvr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIBhvDvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672173; x=1782208173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VSYp52/7gHd8QnJTkiyJpfzhrDPHfxuHC2PxmZcAHRI=;
  b=dIBhvDvriHzeQy9hTMkeroo7jCmYhf5IyuAH7UQSW8DfCo/ZUNWYc1EN
   q0dp32m49jQDOaKPXQxQ9JuQaAkiCytpKO9Hpj/+CI6FKBhFETZ/yrwSo
   nq/VdZ1IktN0j/mKvMO9TY9i53cvURzBYSJd7O6JlsqLXa81hUKxK6ty5
   KSSjyXEGpEu8vUUgzX/mpN0vTSYsclxb9cYdFgAKt965cGxcUNNyd8xfY
   IbGw74j5lHc5ER8Gx7vfF9pvsGHbsC+M2zPXmvJS7zJojNLooZxip1+cz
   nspU8LbKy1lQeGxBIs+XEm8kfKfGQYIuTUKsOTkgT0XefXEZ7xa4ke3t8
   g==;
X-CSE-ConnectionGUID: pez6j0KZRFiZe2Md+OsdZg==
X-CSE-MsgGUID: qClq7oLYTV+8rX7d0TwwiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="78284753"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="78284753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:49:32 -0700
X-CSE-ConnectionGUID: Mt2tP9cgR+W5f4dhJusvjw==
X-CSE-MsgGUID: /6+XAWJfTfib3DXUeJrElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155932290"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2025 02:49:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdnr-000Nv4-2n;
	Mon, 23 Jun 2025 09:49:27 +0000
Date: Mon, 23 Jun 2025 17:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <202506231722.jPtC2RyB-lkp@intel.com>
References: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master media-tree/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Use-correct-pads-for-xlate_streams/20250619-161847
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619081546.1582969-13-sakari.ailus%40linux.intel.com
patch subject: [PATCH 12/13] media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
config: arm-imx_v4_v5_defconfig (https://download.01.org/0day-ci/archive/20250623/202506231722.jPtC2RyB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231722.jPtC2RyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231722.jPtC2RyB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-mc.c:628:2: error: call to undeclared function 'for_each_active_route'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     628 |         for_each_active_route(&state->routing, route) {
         |         ^
   drivers/media/v4l2-core/v4l2-mc.c:628:47: error: expected ';' after expression
     628 |         for_each_active_route(&state->routing, route) {
         |                                                      ^
         |                                                      ;
   drivers/media/v4l2-core/v4l2-mc.c:634:4: error: 'continue' statement not in loop statement
     634 |                         continue;
         |                         ^
   drivers/media/v4l2-core/v4l2-mc.c:637:4: error: 'continue' statement not in loop statement
     637 |                         continue;
         |                         ^
>> drivers/media/v4l2-core/v4l2-mc.c:681:10: error: call to undeclared function 'v4l2_subdev_find_route'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     681 |         route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
         |                 ^
>> drivers/media/v4l2-core/v4l2-mc.c:681:8: error: incompatible integer to pointer conversion assigning to 'struct v4l2_subdev_route *' from 'int' [-Wint-conversion]
     681 |         route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     682 |                                        sink_stream, true, 0);
         |                                        ~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/for_each_active_route +628 drivers/media/v4l2-core/v4l2-mc.c

   615	
   616	static int
   617	__v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
   618				   struct media_pad *src_pad, u64 __src_streams,
   619				   struct media_pad **__sink_pad, u64 *__sink_streams)
   620	{
   621		struct v4l2_subdev_route *route;
   622		u64 src_streams = 0, sink_streams = 0;
   623		bool has_sink_pad = false;
   624		unsigned int sink_pad;
   625	
   626		dev_dbg(state->sd->dev, "%s: source enabled, pad/streams %u/%#llx\n",
   627			state->sd->entity.name, src_pad->index, __src_streams);
 > 628		for_each_active_route(&state->routing, route) {
   629			dev_dbg(state->sd->dev, "%s: %u/%u -> %u/%u, flags %x\n",
   630				state->sd->entity.name,
   631				route->sink_pad, route->sink_stream, route->source_pad,
   632				route->source_stream, route->flags);
   633			if (route->source_pad != src_pad->index)
   634				continue;
   635	
   636			if (!(BIT_ULL(route->source_stream) & __src_streams))
   637				continue;
   638	
   639			if (!has_sink_pad) {
   640				has_sink_pad = true;
   641				sink_pad = route->sink_pad;
   642			}
   643	
   644			if (route->sink_pad != sink_pad) {
   645				dev_dbg(state->sd->dev,
   646					"sink pads (%u vs. %u) differ\n",
   647					route->sink_pad, sink_pad);
   648				return -EMLINK;
   649			}
   650	
   651			sink_streams |= BIT_ULL(route->sink_stream);
   652			src_streams |= BIT_ULL(route->source_stream);
   653		}
   654	
   655		*__sink_pad = has_sink_pad ? &state->sd->entity.pads[sink_pad] : NULL;
   656		*__sink_streams = sink_streams;
   657	
   658		return 0;
   659	}
   660	
   661	static int v4l2_mc_downpath_enabled(struct media_pad *sink_pad,
   662					    unsigned int sink_stream,
   663					    bool (*func)(struct video_device *vdev),
   664					    struct media_pad **__sink_pad,
   665					    u64 *__sink_streams)
   666	{
   667		struct v4l2_subdev_state *state;
   668		struct v4l2_subdev_route *route;
   669		struct v4l2_subdev *sd;
   670		struct media_pad *source_pad, *tmp_pad;
   671		u32 source_stream;
   672	
   673		if (!is_media_entity_v4l2_subdev(sink_pad->entity))
   674			return -ENXIO;
   675	
   676		sd = media_entity_to_v4l2_subdev(sink_pad->entity);
   677		dev_dbg(sd->dev, "path_enabled: found sub-device %s\n",
   678			sd->entity.name);
   679	
   680		state = v4l2_subdev_lock_and_get_active_state(sd);
 > 681		route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
   682					       sink_stream, true, 0);
   683		if (IS_ERR(route)) {
   684			v4l2_subdev_unlock_state(state);
   685			dev_dbg(sd->dev,
   686				"path_enabled: can't find opposite route for %s:%u/%u",
   687				sd->entity.name, sink_pad->index, sink_stream);
   688			return 2;
   689		}
   690	
   691		source_pad = &sd->entity.pads[route->source_pad];
   692		v4l2_subdev_unlock_state(state);
   693	
   694		tmp_pad = sink_pad;
   695		sink_pad = media_pad_remote_pad_unique(source_pad);
   696		if (IS_ERR(sink_pad)) {
   697			dev_dbg(sd->dev,
   698				"path_enabled: can't find remote source for %s:%u\n",
   699				source_pad->entity->name, source_pad->index);
   700			return PTR_ERR(sink_pad);
   701		}
   702	
   703		if (is_media_entity_v4l2_video_device(sink_pad->entity)) {
   704			struct video_device *vdev;
   705	
   706			vdev = media_entity_to_video_device(sink_pad->entity);
   707			if (!vdev)
   708				return -ENXIO;
   709	
   710			dev_dbg(vdev->dev_parent,
   711				"path_enabled: found video device %s\n",
   712				vdev->name);
   713	
   714			if (!*__sink_pad) {
   715				*__sink_pad = tmp_pad;
   716				dev_dbg(sd->dev, "path_enabled: sink %u/%u\n",
   717					tmp_pad->index, sink_stream);
   718			} else if (tmp_pad != *__sink_pad) {
   719				dev_dbg(sd->dev,
   720					"path_enabled: pads %s/%u and %s/%u differ\n",
   721					tmp_pad->entity->name, tmp_pad->index,
   722					(*__sink_pad)->entity->name,
   723					(*__sink_pad)->index);
   724				return -EXDEV;
   725			}
   726	
   727			*__sink_streams |= BIT_ULL(sink_stream);
   728	
   729			return func(vdev);
   730		}
   731	
   732		return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
   733						__sink_pad, __sink_streams);
   734	}
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
