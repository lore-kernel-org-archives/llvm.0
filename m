Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D81DB375;
	Sat, 11 Oct 2025 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760223165; cv=none; b=P0oA3XmTK9Kna+lLo14gPOk6HgESQ+Z+AGDph1L8IcUBTCTRnxAmxdAlWnG7GEcobhOz7w2l5qSbOYPMyPw5mLvoUlurrj/FHzcgYdBwechOZPlfc3qLP9cOc5LMSd7X9xUWF0AgWhm70ts5MRmue5WDIRx+ZFEqlNglrtfiATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760223165; c=relaxed/simple;
	bh=39aEW7WT6egEmH98C8dv81gYPI+ol6nebw6+hN45GcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mS4kpLz06fs3Ab7J8TyduKSHcVP0/pg1O47gfhuzbk7HXaxQ957L+VWj1Qtfq950AWnF2mQ1gFyldKnjzb0uK2JrOhdkafwd9l6IBtPf31Nw+Nxwt5PjoERFVUnY7CfphssW4jfHrOeOAMmTmROl3SFsxX/yl8oTKFp40XV2YmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuF3MVWd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuF3MVWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760223163; x=1791759163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39aEW7WT6egEmH98C8dv81gYPI+ol6nebw6+hN45GcQ=;
  b=CuF3MVWdyZ8Ed+9cygNagk0aK1huvhuP7PueiierqytssDfFmRNCv0+A
   NwowJUh/J7uxzOvCB15wor1sUHMBoGX0y2Xrt2HaMNnpHuajURmJeyRqL
   gH9MzCtswqJxloU4fuly7nzQqS4zRige1I+Q6RCWhTyTXAcU/BMEZOzeA
   JEk1CrKeDb7QiFOMTdImizaNxdRz2mnvY7oAVlipbZHvWKP7V3o/HKT7M
   /ICaWuEdvfl6VviH/vz6hM06VPYWJFnEWqIpXKezIKmqKcpuqE71Z34FI
   LSk8c6HmlfemWT3FANls6Q1sqUCAoweOzOQTHKh07bjdglwQs0K6LsLjE
   A==;
X-CSE-ConnectionGUID: 7sZmBdN5ROeeplxqEB/cBg==
X-CSE-MsgGUID: KgZeLzuSTP26+JPnKO3o2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="80045081"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="80045081"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 15:52:42 -0700
X-CSE-ConnectionGUID: i6goDT2cTSyMixLjxjzG1w==
X-CSE-MsgGUID: mkfI73rzQS+u4j40+Ez7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="186548729"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 15:52:41 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7iS7-000429-1Q;
	Sat, 11 Oct 2025 22:52:39 +0000
Date: Sun, 12 Oct 2025 06:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v4 3/3] drivers/accel/ethosu/ethosu_gem.c:222:3: error:
 expected expression
Message-ID: <202510120638.PuCJGPan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v4
head:   bda00258ea5f94c45ae1bb74a5f43610d31b75c8
commit: bda00258ea5f94c45ae1bb74a5f43610d31b75c8 [3/3] accel: Add Arm Ethos-U NPU driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251012/202510120638.PuCJGPan-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120638.PuCJGPan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120638.PuCJGPan-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ethosu/ethosu_gem.c:222:3: error: expected expression
                   u32 element_size = BIT((fm->precision >> 1) & 0x3);
                   ^
>> drivers/accel/ethosu/ethosu_gem.c:224:60: error: use of undeclared identifier 'element_size'
                   addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
                                                                            ^
   drivers/accel/ethosu/ethosu_gem.c:393:4: error: expected expression
                           u64 srclen = dma_length(info, &st.dma, &st.dma.src);
                           ^
>> drivers/accel/ethosu/ethosu_gem.c:399:43: error: use of undeclared identifier 'srclen'; did you mean 'strlen'?
                                   st.dma.src.region, st.dma.src.offset, srclen,
                                                                         ^~~~~~
                                                                         strlen
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                ^
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                          ^
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^
   include/linux/string.h:201:24: note: 'strlen' declared here
   extern __kernel_size_t strlen(const char *);
                          ^
   4 errors generated.


vim +222 drivers/accel/ethosu/ethosu_gem.c

   180	
   181	static u64 feat_matrix_length(struct ethosu_validated_cmdstream_info *info,
   182				      struct feat_matrix *fm,
   183				      u32 x, u32 y, u32 c)
   184	{
   185		int storage = fm->precision >> 14;
   186		int tile = 0;
   187	
   188		if (fm->region < 0)
   189			return U64_MAX;
   190	
   191		switch (storage) {
   192		case 0:
   193			if (x >= fm->width0 + 1) {
   194				x -= fm->width0 + 1;
   195				tile += 1;
   196			}
   197			if (y >= fm->height[tile] + 1) {
   198				y -= fm->height[tile] + 1;
   199				tile += 2;
   200			}
   201			break;
   202		case 1:
   203			if (y >= fm->height[1] + 1) {
   204				y -= fm->height[1] + 1;
   205				tile = 2;
   206			} else if (y >= fm->height[0] + 1) {
   207				y -= fm->height[0] + 1;
   208				tile = 1;
   209			}
   210			break;
   211		}
   212		if (fm->base[tile] == U64_MAX)
   213			return U64_MAX;
   214	
   215		u64 addr = fm->base[tile] + y * fm->stride_y;
   216	
   217		switch ((fm->precision >> 6) & 0x3) { // format
   218		case 0: //nhwc:
   219			addr += x * fm->stride_x + c;
   220			break;
   221		case 1: //nhcwb16:
 > 222			u32 element_size = BIT((fm->precision >> 1) & 0x3);
   223	
 > 224			addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
   225			break;
   226		}
   227	
   228		info->region_size[fm->region] = max(info->region_size[fm->region], addr + 1);
   229	
   230		return addr;
   231	}
   232	
   233	static int calc_sizes(struct drm_device *ddev,
   234			      struct ethosu_validated_cmdstream_info *info,
   235			      u16 op, struct cmd_state *st,
   236			      bool ifm, bool ifm2, bool weight, bool scale)
   237	{
   238		u64 len;
   239	
   240		if (ifm) {
   241			if (st->ifm.stride_kernel == U16_MAX)
   242				return -EINVAL;
   243			u32 stride_y = ((st->ifm.stride_kernel >> 8) & 0x2) +
   244				((st->ifm.stride_kernel >> 1) & 0x1) + 1;
   245			u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +
   246				(st->ifm.stride_kernel & 0x1) + 1;
   247			u32 ifm_height = st->ofm.height[2] * stride_y +
   248				st->ifm.height[2] - (st->ifm.pad_top + st->ifm.pad_bottom);
   249			u32 ifm_width  = st->ofm.width * stride_x +
   250				st->ifm.width - (st->ifm.pad_left + st->ifm.pad_right);
   251	
   252			len = feat_matrix_length(info, &st->ifm, ifm_width,
   253						 ifm_height, st->ifm.depth);
   254			dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
   255				op, st->ifm.region, st->ifm.base[0], len);
   256			if (len == U64_MAX)
   257				return -EINVAL;
   258		}
   259	
   260		if (ifm2) {
   261			len = feat_matrix_length(info, &st->ifm2, st->ifm.depth,
   262						 0, st->ofm.depth);
   263			dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
   264				op, st->ifm2.region, st->ifm2.base[0], len);
   265			if (len == U64_MAX)
   266				return -EINVAL;
   267		}
   268	
   269		if (weight) {
   270			dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
   271				op, st->weight[0].region, st->weight[0].base,
   272				st->weight[0].base + st->weight[0].length - 1);
   273			if (st->weight[0].region < 0 || st->weight[0].base == U64_MAX ||
   274			    st->weight[0].length == U32_MAX)
   275				return -EINVAL;
   276			info->region_size[st->weight[0].region] =
   277				max(info->region_size[st->weight[0].region],
   278				    st->weight[0].base + st->weight[0].length);
   279		}
   280	
   281		if (scale) {
   282			dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
   283				op, st->scale[0].region, st->scale[0].base,
   284				st->scale[0].base + st->scale[0].length - 1);
   285			if (st->scale[0].region < 0 || st->scale[0].base == U64_MAX ||
   286			    st->scale[0].length == U32_MAX)
   287				return -EINVAL;
   288			info->region_size[st->scale[0].region] =
   289				max(info->region_size[st->scale[0].region],
   290				    st->scale[0].base + st->scale[0].length);
   291		}
   292	
   293		len = feat_matrix_length(info, &st->ofm, st->ofm.width,
   294					 st->ofm.height[2], st->ofm.depth);
   295		dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
   296			op, st->ofm.region, st->ofm.base[0], len);
   297		if (len == U64_MAX)
   298			return -EINVAL;
   299		info->output_region[st->ofm.region] = true;
   300	
   301		return 0;
   302	}
   303	
   304	static int calc_sizes_elemwise(struct drm_device *ddev,
   305				       struct ethosu_validated_cmdstream_info *info,
   306				       u16 op, struct cmd_state *st,
   307				       bool ifm, bool ifm2)
   308	{
   309		u32 height, width, depth;
   310		u64 len;
   311	
   312		if (ifm) {
   313			height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
   314			width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
   315			depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
   316	
   317			len = feat_matrix_length(info, &st->ifm, width,
   318						 height, depth);
   319			dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
   320				op, st->ifm.region, st->ifm.base[0], len);
   321			if (len == U64_MAX)
   322				return -EINVAL;
   323		}
   324	
   325		if (ifm2) {
   326			height = st->ifm2.broadcast & 0x1 ? 0 : st->ofm.height[2];
   327			width = st->ifm2.broadcast & 0x2 ? 0 : st->ofm.width;
   328			depth = st->ifm2.broadcast & 0x4 ? 0 : st->ofm.depth;
   329	
   330			len = feat_matrix_length(info, &st->ifm2, width,
   331						 height, depth);
   332			dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
   333				op, st->ifm2.region, st->ifm2.base[0], len);
   334			if (len == U64_MAX)
   335				return -EINVAL;
   336		}
   337	
   338		len = feat_matrix_length(info, &st->ofm, st->ofm.width,
   339					 st->ofm.height[2], st->ofm.depth);
   340		dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
   341			op, st->ofm.region, st->ofm.base[0], len);
   342		if (len == U64_MAX)
   343			return -EINVAL;
   344		info->output_region[st->ofm.region] = true;
   345	
   346		return 0;
   347	}
   348	
   349	static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
   350							  u32 __user *ucmds,
   351							  struct ethosu_gem_object *bo,
   352							  u32 size)
   353	{
   354		struct ethosu_validated_cmdstream_info *info;
   355		u32 *bocmds = bo->base.vaddr;
   356		struct cmd_state st;
   357		int i, ret;
   358	
   359		cmd_state_init(&st);
   360	
   361		info = kzalloc(sizeof(*info), GFP_KERNEL);
   362		if (!info)
   363			return -ENOMEM;
   364		info->cmd_size = size;
   365	
   366		for (i = 0; i < size / 4; i++) {
   367			bool use_ifm, use_ifm2, use_scale;
   368			u16 cmd, param;
   369			u32 cmds[2];
   370			u64 addr;
   371	
   372			if (get_user(cmds[0], ucmds++)) {
   373				ret = -EFAULT;
   374				goto fault;
   375			}
   376			bocmds[i] = cmds[0];
   377	
   378			cmd = cmds[0];
   379			param = cmds[0] >> 16;
   380	
   381			if (cmd & 0x4000) {
   382				if (get_user(cmds[1], ucmds++)) {
   383					ret = -EFAULT;
   384					goto fault;
   385				}
   386				i++;
   387				bocmds[i] = cmds[1];
   388				addr = cmd_to_addr(cmds);
   389			}
   390	
   391			switch (cmd) {
   392			case NPU_OP_DMA_START:
   393				u64 srclen = dma_length(info, &st.dma, &st.dma.src);
   394				u64 dstlen = dma_length(info, &st.dma, &st.dma.dst);
   395	
   396				if (st.dma.dst.region >= 0)
   397					info->output_region[st.dma.dst.region] = true;
   398				dev_dbg(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
 > 399					st.dma.src.region, st.dma.src.offset, srclen,
   400					st.dma.dst.region, st.dma.dst.offset, dstlen);
   401				break;
   402			case NPU_OP_CONV:
   403			case NPU_OP_DEPTHWISE:
   404				use_ifm2 = param & 0x1;  // weights_ifm2
   405				use_scale = !(st.ofm.precision & 0x100);
   406				ret = calc_sizes(ddev, info, cmd, &st, true, use_ifm2,
   407						 !use_ifm2, use_scale);
   408				if (ret)
   409					goto fault;
   410				break;
   411			case NPU_OP_POOL:
   412				use_ifm = param != 0x4;  // pooling mode
   413				use_scale = !(st.ofm.precision & 0x100);
   414				ret = calc_sizes(ddev, info, cmd, &st, use_ifm, false,
   415						 false, use_scale);
   416				if (ret)
   417					goto fault;
   418				break;
   419			case NPU_OP_ELEMENTWISE:
   420				use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) ||
   421					(param == 6) || (param == 7) || (param == 0x24));
   422				use_ifm = st.ifm.broadcast != 8;
   423				ret = calc_sizes_elemwise(ddev, info, cmd, &st, use_ifm, use_ifm2);
   424				if (ret)
   425					goto fault;
   426				break;
   427			case NPU_OP_RESIZE: // U85 only
   428				WARN_ON(1); // TODO
   429				break;
   430			case NPU_SET_KERNEL_WIDTH_M1:
   431				st.ifm.width = param;
   432				break;
   433			case NPU_SET_KERNEL_HEIGHT_M1:
   434				st.ifm.height[2] = param;
   435				break;
   436			case NPU_SET_KERNEL_STRIDE:
   437				st.ifm.stride_kernel = param;
   438				break;
   439			case NPU_SET_IFM_PAD_TOP:
   440				st.ifm.pad_top = param & 0x7f;
   441				break;
   442			case NPU_SET_IFM_PAD_LEFT:
   443				st.ifm.pad_left = param & 0x7f;
   444				break;
   445			case NPU_SET_IFM_PAD_RIGHT:
   446				st.ifm.pad_right = param & 0xff;
   447				break;
   448			case NPU_SET_IFM_PAD_BOTTOM:
   449				st.ifm.pad_bottom = param & 0xff;
   450				break;
   451			case NPU_SET_IFM_DEPTH_M1:
   452				st.ifm.depth = param;
   453				break;
   454			case NPU_SET_IFM_PRECISION:
   455				st.ifm.precision = param;
   456				break;
   457			case NPU_SET_IFM_BROADCAST:
   458				st.ifm.broadcast = param;
   459				break;
   460			case NPU_SET_IFM_REGION:
   461				st.ifm.region = param & 0x7f;
   462				break;
   463			case NPU_SET_IFM_WIDTH0_M1:
   464				st.ifm.width0 = param;
   465				break;
   466			case NPU_SET_IFM_HEIGHT0_M1:
   467				st.ifm.height[0] = param;
   468				break;
   469			case NPU_SET_IFM_HEIGHT1_M1:
   470				st.ifm.height[1] = param;
   471				break;
   472			case NPU_SET_IFM_BASE0:
   473			case NPU_SET_IFM_BASE1:
   474			case NPU_SET_IFM_BASE2:
   475			case NPU_SET_IFM_BASE3:
   476				st.ifm.base[cmd & 0x3] = addr;
   477				break;
   478			case NPU_SET_IFM_STRIDE_X:
   479				st.ifm.stride_x = addr;
   480				break;
   481			case NPU_SET_IFM_STRIDE_Y:
   482				st.ifm.stride_y = addr;
   483				break;
   484			case NPU_SET_IFM_STRIDE_C:
   485				st.ifm.stride_c = addr;
   486				break;
   487	
   488			case NPU_SET_OFM_WIDTH_M1:
   489				st.ofm.width = param;
   490				break;
   491			case NPU_SET_OFM_HEIGHT_M1:
   492				st.ofm.height[2] = param;
   493				break;
   494			case NPU_SET_OFM_DEPTH_M1:
   495				st.ofm.depth = param;
   496				break;
   497			case NPU_SET_OFM_PRECISION:
   498				st.ofm.precision = param;
   499				break;
   500			case NPU_SET_OFM_REGION:
   501				st.ofm.region = param & 0x7;
   502				break;
   503			case NPU_SET_OFM_WIDTH0_M1:
   504				st.ofm.width0 = param;
   505				break;
   506			case NPU_SET_OFM_HEIGHT0_M1:
   507				st.ofm.height[0] = param;
   508				break;
   509			case NPU_SET_OFM_HEIGHT1_M1:
   510				st.ofm.height[1] = param;
   511				break;
   512			case NPU_SET_OFM_BASE0:
   513			case NPU_SET_OFM_BASE1:
   514			case NPU_SET_OFM_BASE2:
   515			case NPU_SET_OFM_BASE3:
   516				st.ofm.base[cmd & 0x3] = addr;
   517				break;
   518			case NPU_SET_OFM_STRIDE_X:
   519				st.ofm.stride_x = addr;
   520				break;
   521			case NPU_SET_OFM_STRIDE_Y:
   522				st.ofm.stride_y = addr;
   523				break;
   524			case NPU_SET_OFM_STRIDE_C:
   525				st.ofm.stride_c = addr;
   526				break;
   527	
   528			case NPU_SET_IFM2_BROADCAST:
   529				st.ifm2.broadcast = param;
   530				break;
   531			case NPU_SET_IFM2_PRECISION:
   532				st.ifm2.precision = param;
   533				break;
   534			case NPU_SET_IFM2_REGION:
   535				st.ifm2.region = param & 0x7;
   536				break;
   537			case NPU_SET_IFM2_WIDTH0_M1:
   538				st.ifm2.width0 = param;
   539				break;
   540			case NPU_SET_IFM2_HEIGHT0_M1:
   541				st.ifm2.height[0] = param;
   542				break;
   543			case NPU_SET_IFM2_HEIGHT1_M1:
   544				st.ifm2.height[1] = param;
   545				break;
   546			case NPU_SET_IFM2_BASE0:
   547			case NPU_SET_IFM2_BASE1:
   548			case NPU_SET_IFM2_BASE2:
   549			case NPU_SET_IFM2_BASE3:
   550				st.ifm2.base[cmd & 0x3] = addr;
   551				break;
   552			case NPU_SET_IFM2_STRIDE_X:
   553				st.ifm2.stride_x = addr;
   554				break;
   555			case NPU_SET_IFM2_STRIDE_Y:
   556				st.ifm2.stride_y = addr;
   557				break;
   558			case NPU_SET_IFM2_STRIDE_C:
   559				st.ifm2.stride_c = addr;
   560				break;
   561	
   562			case NPU_SET_WEIGHT_REGION:
   563				st.weight[0].region = param & 0x7;
   564				break;
   565			case NPU_SET_SCALE_REGION:
   566				st.scale[0].region = param & 0x7;
   567				break;
   568			case NPU_SET_WEIGHT_BASE:
   569				st.weight[0].base = addr;
   570				break;
   571			case NPU_SET_WEIGHT_LENGTH:
   572				st.weight[0].length = cmds[1];
   573				break;
   574			case NPU_SET_SCALE_BASE:
   575				st.scale[0].base = addr;
   576				break;
   577			case NPU_SET_SCALE_LENGTH:
   578				st.scale[0].length = cmds[1];
   579				break;
   580			case NPU_SET_WEIGHT1_BASE:
   581				st.weight[1].base = addr;
   582				break;
   583			case NPU_SET_WEIGHT1_LENGTH:
   584				st.weight[1].length = cmds[1];
   585				break;
   586			case NPU_SET_SCALE1_BASE: // NPU_SET_WEIGHT2_BASE (U85)
   587				if (0 /*U85*/)
   588					st.weight[2].base = addr;
   589				else
   590					st.scale[1].base = addr;
   591				break;
   592			case NPU_SET_SCALE1_LENGTH: // NPU_SET_WEIGHT2_LENGTH (U85)
   593				if (0 /*U85*/)
   594					st.weight[1].length = cmds[1];
   595				else
   596					st.scale[1].length = cmds[1];
   597				break;
   598			case NPU_SET_WEIGHT3_BASE:
   599				st.weight[3].base = addr;
   600				break;
   601			case NPU_SET_WEIGHT3_LENGTH:
   602				st.weight[3].length = cmds[1];
   603				break;
   604	
   605			case NPU_SET_DMA0_SRC_REGION:
   606				if (param & 0x100)
   607					st.dma.src.region = -1;
   608				else
   609					st.dma.src.region = param & 0x7;
   610				st.dma.mode = (param >> 9) & 0x3;
   611				break;
   612			case NPU_SET_DMA0_DST_REGION:
   613				if (param & 0x100)
   614					st.dma.dst.region = -1;
   615				else
   616					st.dma.dst.region = param & 0x7;
   617				break;
   618			case NPU_SET_DMA0_SIZE0:
   619				st.dma.size0 = param;
   620				break;
   621			case NPU_SET_DMA0_SIZE1:
   622				st.dma.size1 = param;
   623				break;
   624			case NPU_SET_DMA0_SRC_STRIDE0:
   625				st.dma.src.stride[0] = ((s64)addr << 24) >> 24;
   626				break;
   627			case NPU_SET_DMA0_SRC_STRIDE1:
   628				st.dma.src.stride[1] = ((s64)addr << 24) >> 24;
   629				break;
   630			case NPU_SET_DMA0_DST_STRIDE0:
   631				st.dma.dst.stride[0] = ((s64)addr << 24) >> 24;
   632				break;
   633			case NPU_SET_DMA0_DST_STRIDE1:
   634				st.dma.dst.stride[1] = ((s64)addr << 24) >> 24;
   635				break;
   636			case NPU_SET_DMA0_SRC:
   637				st.dma.src.offset = addr;
   638				break;
   639			case NPU_SET_DMA0_DST:
   640				st.dma.dst.offset = addr;
   641				break;
   642			case NPU_SET_DMA0_LEN:
   643				st.dma.src.len = st.dma.dst.len = addr;
   644				break;
   645			default:
   646				break;
   647			}
   648		}
   649	
   650		for (i = 0; i < NPU_BASEP_REGION_MAX; i++) {
   651			if (!info->region_size[i])
   652				continue;
   653			dev_dbg(ddev->dev, "region %d max size: 0x%llx\n",
   654				i, info->region_size[i]);
   655		}
   656	
   657		bo->info = info;
   658		return 0;
   659	
   660	fault:
   661		kfree(info);
   662		return ret;
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
