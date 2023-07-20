Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE1649;
	Thu, 20 Jul 2023 01:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689816490; x=1721352490;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dXOFo9Gd0dzUlCQd5Ntigd3GSgKuKJu19R/bLJw8JSc=;
  b=iJwL2dPWKg6eqkQDehH9t07WLdt2AvscOLrwAo8ylaRHHuqNd/jyVqJa
   bQaqzjxiqAahIER9hgXcFJBzEcGiZtJP7ZrJzIcKQ/drcHEfsy+Nf563X
   W8tThfZLWFypfR33lfKihfVGpsFXH140KlxWNIpQEM+VxHpC2Dw8EfOXs
   Bvf7V6bD1nJSJ/g6D+bcubinqRgRKRd1UBBHNkm+HeYsd+CweggTjYM3V
   UspUOv1x9MXmTg0QY41T35uw5z/5KUAZqOO2dtdCh8aRtjMImdiLkwWWV
   I0n/HPj6CDYvTGyu+6CITLO2t2+uUAmC/xh3FbYPpJ2f90MmzmWsrk5WC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365490972"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="365490972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 18:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794246806"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="794246806"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 18:28:04 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMISZ-0005eZ-1b;
	Thu, 20 Jul 2023 01:28:03 +0000
Date: Thu, 20 Jul 2023 09:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 36/9999]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2692:1: warning: stack frame size
 (2160) exceeds limit (2048) in 'nv50_display_create'
Message-ID: <202307200934.h7ry641C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d54cfc420586425d418a53871290cc4a59d33501
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200934.h7ry641C-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200934.h7ry641C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200934.h7ry641C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/dispnv50/disp.c:1390:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1390 |         int ret;
         |             ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:1414:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1414 |         int ret;
         |             ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2692:1: warning: no previous prototype for function 'nv50_display_create' [-Wmissing-prototypes]
    2692 | nv50_display_create(struct drm_device *dev)
         | ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2691:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2691 | int
         | ^
         | static 
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2692:1: warning: stack frame size (2160) exceeds limit (2048) in 'nv50_display_create' [-Wframe-larger-than]
    2692 | nv50_display_create(struct drm_device *dev)
         | ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2066:1: warning: stack frame size (2304) exceeds limit (2048) in 'nv50_disp_atomic_commit_core' [-Wframe-larger-than]
    2066 | nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
         | ^
   5 warnings generated.


vim +/nv50_display_create +2692 drivers/gpu/drm/nouveau/dispnv50/disp.c

26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2690  
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2691  int
e225f446a0808c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2012-11-21 @2692  nv50_display_create(struct drm_device *dev)
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2693  {
1167c6bc51880c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2016-05-18  2694  	struct nvif_device *device = &nouveau_drm(dev)->client.device;
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-31  2695  	struct nouveau_drm *drm = nouveau_drm(dev);
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-31  2696  	struct dcb_table *dcb = &drm->vbios.dcb;
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2697  	struct drm_connector *connector, *tmp;
e225f446a0808c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2012-11-21  2698  	struct nv50_disp *disp;
cb75d97e9c7774 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-11  2699  	struct dcb_output *dcbe;
7c5f6a87b2337c drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-03-04  2700  	int crtcs, ret, i;
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2701  	bool has_mst = nv50_has_mst(drm);
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2702  
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2703  	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2704  	if (!disp)
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2705  		return -ENOMEM;
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-31  2706  
839ca903f12ef8 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2016-11-04  2707  	mutex_init(&disp->mutex);
839ca903f12ef8 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2016-11-04  2708  
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-31  2709  	nouveau_display(dev)->priv = disp;
e225f446a0808c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2012-11-21  2710  	nouveau_display(dev)->dtor = nv50_display_destroy;
e225f446a0808c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2012-11-21  2711  	nouveau_display(dev)->init = nv50_display_init;
e225f446a0808c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2012-11-21  2712  	nouveau_display(dev)->fini = nv50_display_fini;
0ad72863ea426d drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2014-08-10  2713  	disp->disp = &nouveau_display(dev)->disp;
839ca903f12ef8 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2016-11-04  2714  	dev->mode_config.funcs = &nv50_disp_func;
0e94043ee1d98d drivers/gpu/drm/nouveau/dispnv50/disp.c Gerd Hoffmann         2018-09-05  2715  	dev->mode_config.quirk_addfb_prefer_xbgr_30bpp = true;
7a962f2b7276cc drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs            2019-06-11  2716  	dev->mode_config.normalize_zpos = true;
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2717  
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2718  	/* small shared memory area we use for notifiers and semaphores */
81b615798e9459 drivers/gpu/drm/nouveau/dispnv50/disp.c Christian König       2020-09-08  2719  	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
81b615798e9459 drivers/gpu/drm/nouveau/dispnv50/disp.c Christian König       2020-09-08  2720  			     NOUVEAU_GEM_DOMAIN_VRAM,
bb6178b04f5ef6 drivers/gpu/drm/nouveau/nv50_display.c  Maarten Lankhorst     2014-01-09  2721  			     0, 0x0000, NULL, NULL, &disp->sync);
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2722  	if (!ret) {
81b615798e9459 drivers/gpu/drm/nouveau/dispnv50/disp.c Christian König       2020-09-08  2723  		ret = nouveau_bo_pin(disp->sync, NOUVEAU_GEM_DOMAIN_VRAM, true);
04c8c21085e130 drivers/gpu/drm/nouveau/nv50_display.c  Marcin Slusarz        2012-11-25  2724  		if (!ret) {
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2725  			ret = nouveau_bo_map(disp->sync);
04c8c21085e130 drivers/gpu/drm/nouveau/nv50_display.c  Marcin Slusarz        2012-11-25  2726  			if (ret)
04c8c21085e130 drivers/gpu/drm/nouveau/nv50_display.c  Marcin Slusarz        2012-11-25  2727  				nouveau_bo_unpin(disp->sync);
04c8c21085e130 drivers/gpu/drm/nouveau/nv50_display.c  Marcin Slusarz        2012-11-25  2728  		}
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2729  		if (ret)
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2730  			nouveau_bo_ref(NULL, &disp->sync);
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2731  	}
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2732  
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2733  	if (ret)
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2734  		goto out;
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2735  
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2736  	/* allocate master evo channel */
9ca6f1ebba1024 drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs            2018-05-08  2737  	ret = nv50_core_new(drm, &disp->core);
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2738  	if (ret)
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2739  		goto out;
b5a794b0f1fdf1 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-10-16  2740  
fa1232ea845155 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2741  	disp->core->func->init(disp->core);
4a2cb4181b077c drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2742  	if (disp->core->func->caps_init) {
4a2cb4181b077c drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2743  		ret = disp->core->func->caps_init(drm, disp);
4a2cb4181b077c drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2744  		if (ret)
4a2cb4181b077c drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2745  			goto out;
4a2cb4181b077c drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2746  	}
fa1232ea845155 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2020-05-11  2747  
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2748  	/* Assign the correct format modifiers */
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2749  	if (disp->disp->object.oclass >= TU102_DISP)
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2750  		nouveau_display(dev)->format_modifiers = wndwc57e_modifiers;
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2751  	else
0508831470fb5b drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs            2020-07-24  2752  	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_FERMI)
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2753  		nouveau_display(dev)->format_modifiers = disp90xx_modifiers;
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2754  	else
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2755  		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2756  
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2757  	/* FIXME: 256x256 cursors are supported on Kepler, however unlike Maxwell and later
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2758  	 * generations Kepler requires that we use small pages (4K) for cursor scanout surfaces. The
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2759  	 * proper fix for this is to teach nouveau to migrate fbs being used for the cursor plane to
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2760  	 * small page allocations in prepare_fb(). When this is implemented, we should also force
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2761  	 * large pages (128K) for ovly fbs in order to fix Kepler ovlys.
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2762  	 * But until then, just limit cursors to 128x128 - which is small enough to avoid ever using
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2763  	 * large pages.
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2764  	 */
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2765  	if (disp->disp->object.oclass >= GM107_DISP) {
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2766  		dev->mode_config.cursor_width = 256;
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2767  		dev->mode_config.cursor_height = 256;
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2768  	} else if (disp->disp->object.oclass >= GK104_DISP) {
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2769  		dev->mode_config.cursor_width = 128;
d3999c1f7bbbc1 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-03-04  2770  		dev->mode_config.cursor_height = 128;
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2771  	} else {
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2772  		dev->mode_config.cursor_width = 64;
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2773  		dev->mode_config.cursor_height = 64;
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2774  	}
d3b2f0f7921c75 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2021-01-18  2775  
438d99e3b17520 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2776  	/* create crtc objects to represent the hw heads */
facaed62b4cba3 drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs            2018-05-08  2777  	if (disp->disp->object.oclass >= GV100_DISP)
facaed62b4cba3 drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs            2018-05-08  2778  		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
facaed62b4cba3 drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs            2018-05-08  2779  	else
0d4a2c5767dc61 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2018-05-08  2780  	if (disp->disp->object.oclass >= GF110_DISP)
eba5e56db65b7a drivers/gpu/drm/nouveau/nv50_display.c  Ilia Mirkin           2017-07-03  2781  		crtcs = nvif_rd32(&device->object, 0x612004) & 0xf;
63718a0730c666 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-11-16  2782  	else
eba5e56db65b7a drivers/gpu/drm/nouveau/nv50_display.c  Ilia Mirkin           2017-07-03  2783  		crtcs = 0x3;
63718a0730c666 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-11-16  2784  
eba5e56db65b7a drivers/gpu/drm/nouveau/nv50_display.c  Ilia Mirkin           2017-07-03  2785  	for (i = 0; i < fls(crtcs); i++) {
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2786  		struct nv50_head *head;
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2787  
eba5e56db65b7a drivers/gpu/drm/nouveau/nv50_display.c  Ilia Mirkin           2017-07-03  2788  		if (!(crtcs & (1 << i)))
eba5e56db65b7a drivers/gpu/drm/nouveau/nv50_display.c  Ilia Mirkin           2017-07-03  2789  			continue;
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2790  
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2791  		head = nv50_head_create(dev, i);
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2792  		if (IS_ERR(head)) {
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2793  			ret = PTR_ERR(head);
438d99e3b17520 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2794  			goto out;
438d99e3b17520 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2795  		}
438d99e3b17520 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2796  
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2797  		if (has_mst) {
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2798  			head->msto = nv50_msto_new(dev, head, i);
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2799  			if (IS_ERR(head->msto)) {
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2800  				ret = PTR_ERR(head->msto);
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2801  				head->msto = NULL;
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2802  				goto out;
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2803  			}
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2804  
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2805  			/*
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2806  			 * FIXME: This is a hack to workaround the following
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2807  			 * issues:
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2808  			 *
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2809  			 * https://gitlab.gnome.org/GNOME/mutter/issues/759
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2810  			 * https://gitlab.freedesktop.org/xorg/xserver/merge_requests/277
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2811  			 *
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2812  			 * Once these issues are closed, this should be
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2813  			 * removed
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2814  			 */
481404957a14f9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2815  			head->msto->encoder.possible_crtcs = crtcs;
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2816  		}
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2817  	}
5ff0cb1ce25363 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2019-09-13  2818  
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2819  	/* create encoder/connector objects based on VBIOS DCB table */
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2820  	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
3c7fc252b3fab0 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul            2018-07-12  2821  		connector = nouveau_connector_create(dev, dcbe);
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2822  		if (IS_ERR(connector))
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2823  			continue;
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2824  
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2825  		if (dcbe->location == DCB_LOC_ON_CHIP) {
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2826  			switch (dcbe->type) {
cb75d97e9c7774 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-11  2827  			case DCB_OUTPUT_TMDS:
cb75d97e9c7774 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-11  2828  			case DCB_OUTPUT_LVDS:
cb75d97e9c7774 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-11  2829  			case DCB_OUTPUT_DP:
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2830  				ret = nv50_sor_create(connector, dcbe);
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2831  				break;
cb75d97e9c7774 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-11  2832  			case DCB_OUTPUT_ANALOG:
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2833  				ret = nv50_dac_create(connector, dcbe);
8eaa9669f8dc7f drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-06  2834  				break;
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2835  			default:
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2836  				ret = -ENODEV;
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2837  				break;
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2838  			}
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2839  		} else {
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2840  			ret = nv50_pior_create(connector, dcbe);
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2841  		}
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2842  
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2843  		if (ret) {
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2844  			NV_WARN(drm, "failed to create encoder %d/%d/%d: %d\n",
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2845  				     dcbe->location, dcbe->type,
eb6313add6dddf drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-02-11  2846  				     ffs(dcbe->or) - 1, ret);
94f54f5336aac6 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2013-03-05  2847  			ret = 0;
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2848  		}
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2849  	}
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2850  
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2851  	/* cull any connectors we created that don't have an encoder */
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2852  	list_for_each_entry_safe(connector, tmp, &dev->mode_config.connector_list, head) {
62afb4ad425af2 drivers/gpu/drm/nouveau/dispnv50/disp.c José Roberto de Souza 2019-09-13  2853  		if (connector->possible_encoders)
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2854  			continue;
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2855  
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2012-07-31  2856  		NV_WARN(drm, "%s has no encoders, removing\n",
8c6c361ac6490e drivers/gpu/drm/nouveau/nv50_display.c  Jani Nikula           2014-06-03  2857  			connector->name);
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2858  		connector->funcs->destroy(connector);
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2859  	}
83fc083cbbe014 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-05  2860  
2ae4c5f6ff7310 drivers/gpu/drm/nouveau/dispnv50/disp.c Mario Kleiner         2018-07-16  2861  	/* Disable vblank irqs aggressively for power-saving, safe on nv50+ */
2ae4c5f6ff7310 drivers/gpu/drm/nouveau/dispnv50/disp.c Mario Kleiner         2018-07-16  2862  	dev->vblank_disable_immediate = true;
2ae4c5f6ff7310 drivers/gpu/drm/nouveau/dispnv50/disp.c Mario Kleiner         2018-07-16  2863  
742db30c4ee6cd drivers/gpu/drm/nouveau/dispnv50/disp.c Takashi Iwai          2020-01-13  2864  	nv50_audio_component_init(drm);
742db30c4ee6cd drivers/gpu/drm/nouveau/dispnv50/disp.c Takashi Iwai          2020-01-13  2865  
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2866  out:
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2867  	if (ret)
e225f446a0808c drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs            2012-11-21  2868  		nv50_display_destroy(dev);
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2869  	return ret;
26f6d88b327060 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs            2011-07-04  2870  }
c586f30bf74cb5 drivers/gpu/drm/nouveau/dispnv50/disp.c James Jones           2020-02-10  2871  

:::::: The code at line 2692 was first introduced by commit
:::::: e225f446a0808ce38b124df489d0568c05c3057a drm/nouveau: rename nvd0_display to nv50_display to reflect reality since merge

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
