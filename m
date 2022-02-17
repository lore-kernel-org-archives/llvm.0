Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2486C28E1
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 09:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645088979; x=1676624979;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=QLImBsVrgi/x/4Rm0YNgTPeFNVR7cNvUKbkdLBPpB9M=;
  b=JUEuDXvKip0FkqMyUOR4lQbMfdUKQzlW4yG/O5ldG3SRyvGgqEnoF6/H
   Zb8gTOvpqsvMJRbyJjtCEgAp9v9hVPjart9aIgvBH0U/i4SBqOV/qZmNA
   cG62gO2o5Bok6qba0PzRsboSKInCUngDCr5CxOaIad+GMch+qoh13gBi6
   E0A+suoiRGF9pui/6OE2KfFhh0uI44iCuPYs+w79am+ULBjUCuLh4SEpg
   0LXm+ZnY44U8eQZZeRd0ChEnwahVeh515y9CcIXMEaO6THl4LUEVspJAL
   3RunO2KIYmhGUn1dBORdyWv2Yju/5pSJDYmWy98dSed+6bic2Nk8ddsCX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="231455283"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="231455283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 01:09:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="503416358"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO ldmartin-desk2) ([10.252.137.102])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 01:09:37 -0800
Date: Thu, 17 Feb 2022 01:09:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, intel-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	"javierm@redhat.com Jani Nikula" <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of
 type 'struct dma_buf_map'
Message-ID: <20220217090937.luhryuuoj6fqj6w6@ldmartin-desk2>
X-Patchwork-Hint: comment
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>

On Wed, Feb 16, 2022 at 10:36:25PM -0800, Lucas De Marchi wrote:
>+Javier
>
>
>On Thu, Feb 17, 2022 at 02:25:08PM +0800, kernel test robot wrote:
>>tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>head:   e141e36b2871c529379f7ec7d5d6ebae3137a51b
>>commit: 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
>>config: mips-buildonly-randconfig-r002-20220217 (https://download.01.org/0day-ci/archive/20220217/202202171455.bclm1YBC-lkp@intel.com/config)
>>compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
>>reproduce (this is a W=1 build):
>>       wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>       chmod +x ~/bin/make.cross
>>       # install mips cross compiling tool for clang build
>>       # apt-get install binutils-mips-linux-gnu
>>       git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
>>       git fetch --no-tags drm-tip drm-tip
>>       git checkout 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f
>>       # save the config file to linux build tree
>>       mkdir build_dir
>>       COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/solomon/
>>
>>If you fix the issue, kindly add following tag as appropriate
>>Reported-by: kernel test robot <lkp@intel.com>
>>
>>All error/warnings (new ones prefixed by >>):
>>
>>>>drivers/gpu/drm/solomon/ssd130x.c:447:74: warning: declaration of 'struct dma_buf_map' will not be visible outside of this function [-Wvisibility]
>>  static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>>                                                                           ^

just did a dim rebuild-tip and added a fixup to drm-misc-next.

+Cc other maintainers

--------------------8<------------------------
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 19697c8c5a2c..92c1902f53e4 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -444,7 +444,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
  	kfree(buf);
  }
  
-static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *map,
  				struct drm_rect *rect)
  {
  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
--------------------8<------------------------

Lucas De Marchi

>
>this is now called iosys_map in drm-intel... drm-tip will need a fixup
>for the merge.
>
>>>>drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of type 'struct dma_buf_map'
>>          void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
>>                       ~~~^
>
>this shouldn't really be done.
>
>Lucas De Marchi
