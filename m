Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520077;
	b=Vz6vV+5tOl+xGuupkIFqZprSzMu1TI2DwXrywuBFCSRtukmVKeocC0Kn+ymiRR3Eg979
	 6vbgAq5arbMC8GwX5YfaAdrD3W3u+W2QbBqu/aTc6LO48ax2w+0YHfmHSkY9+yjb5wy7Z
	 MSlDxB9/z6JlW28sbT56DATEVfXdK+Bt2pcyGTeShsM7xOzqJFRmqlsFcXYsz1dOK/PNw
	 woJ/MdZtu9k8gGABTIggx3TxWS5oE0l2pKZ2eb0Ubb+z+xS5tqDdtlv7pajbxV4O8RHQ2
	 h43QoI1us3mcOG2s1S3aumGWxMLqdwiApL7C0F1A24fiPuxEug3pyTm9Mm5xEbv4E1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520077;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+J9GQjUNT01Gj9Fh2m3qeWW3L/qkOgGF7bEux+qtfmU=;
	b=jMRIvxvTLDuZcMnFYnvyiZfQl6o/tZKNxRqMC8zIzKS9yckohLPVSDY1deE50WQ4VgXO
	 3RGgyAAnzS5RAzpoI6Ts2T8DUdKqCzP2VQqDZmcEZvXpRDq/OzHLNNswzk+lJkqO7FgYY
	 h0LnBrOmA2lmRY/7WBQKZPwrA0AnJBB3Nm0glmREUmNat2L9xK25f9NMfrMLJYxfho75Z
	 iFap04QHJcTWKxUWu0De7+FCFwcVHzgTGMCT+mb5zAJ1GzRoi0WFubCF07fXD8VV82opD
	 Y2AAZEoyIRtSktrXsEA9flaU4iaQ/kKQqwDlmsAIIc8MvQWsRYB8PJoG73BVMYIYAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Br/N0DgE";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0656606A323;
	Thu, 12 Nov 2026 21:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0656606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Br/N0DgE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794520077; x=1826056077;
  h=date:from:to:cc:subject:message-id;
  bh=j4V6Hc/f3HC8uCaG8vfUtufcSht2rAkutp8a6qVTcQA=;
  b=Br/N0DgE3Ty4u2j5SB7nSigrTiJj9VkRj8K4b15rRM2lmgfbWBcdpuKc
   OvPwiCDBe+FrXx6Mf4vYTMX7KuUeA6m7WKhMWiBeGd4BJ4FTGat1gY/Jb
   UhQB3wYkirv9mW1ZtGqKscAqs0OC8aVRBIfNDzeCDo4kiSAEsPnoHIicr
   dcZnIuw5U8z+xknA1lDqVDqOhvEhZ+1Um4UyjMysziw0YVRO6sjtrpkok
   DuP6PYMQ0w8ezUVnLVo2hY7EHp1screMhvTUII1BHfThJhWwHCZep57pf
   oMXQh7UYv4ZgtsBQUfQXG8d/cxwRP71dd2t5sPxExEYGIQJ9D//P0MEhG
   A==;
X-CSE-ConnectionGUID: SnFjZOeiRO2eCSWykvKsLQ==
X-CSE-MsgGUID: u2Nz0w8rSWSU8r0x4fDVsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3226753"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3226753"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 13:47:56 -0800
X-CSE-ConnectionGUID: jyblrXRgRmetFo4429/O8A==
X-CSE-MsgGUID: 0mU/g6LLQrmlX0v+TI+bpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8858995"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2026 13:47:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRce8-0000000124d-1vXK;
	Thu, 12 Nov 2026 21:47:52 +0000
Date: Fri, 13 Nov 2026 05:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 441/444]
 drivers/scsi/3w-xxxx.c:1027:2: warning: releasing mutex
 'tw_device_extension_list[iminor(file_inode(file))]->ioctl_lock' that was not
 held
Message-ID: <202611130539.SaEmyHNM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   31d2f6adb5d0feeb2be269c03dc5bb6245e05a88
commit: 3d606dbf0b3cbf6ee5188f36136fc48d9a7f4182 [441/444] treewide: Annotate interruptible and killable locks with range acquire
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611130539.SaEmyHNM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c628d639fc66f8e6d8ab1f0cc6b1df38f974e020)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130539.SaEmyHNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130539.SaEmyHNM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/3w-xxxx.c:1027:2: warning: releasing mutex 'tw_device_extension_list[iminor(file_inode(file))]->ioctl_lock' that was not held [-Wthread-safety-analysis]
    1027 |         mutex_unlock(&tw_dev->ioctl_lock);
         |         ^
   1 warning generated.


vim +1027 drivers/scsi/3w-xxxx.c

^1da177e4c3f41 Linus Torvalds      2005-04-16   873  
^1da177e4c3f41 Linus Torvalds      2005-04-16   874  /* This function handles ioctl for the character device */
f4927c45beda9a Arnd Bergmann       2010-04-27   875  static long tw_chrdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds      2005-04-16   876  {
^1da177e4c3f41 Linus Torvalds      2005-04-16   877  	int request_id;
^1da177e4c3f41 Linus Torvalds      2005-04-16   878  	dma_addr_t dma_handle;
^1da177e4c3f41 Linus Torvalds      2005-04-16   879  	unsigned short tw_aen_code;
^1da177e4c3f41 Linus Torvalds      2005-04-16   880  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds      2005-04-16   881  	unsigned int data_buffer_length = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16   882  	unsigned long data_buffer_length_adjusted = 0;
496ad9aa8ef448 Al Viro             2013-01-23   883  	struct inode *inode = file_inode(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16   884  	unsigned long *cpu_addr;
^1da177e4c3f41 Linus Torvalds      2005-04-16   885  	long timeout;
^1da177e4c3f41 Linus Torvalds      2005-04-16   886  	TW_New_Ioctl *tw_ioctl;
^1da177e4c3f41 Linus Torvalds      2005-04-16   887  	TW_Passthru *passthru;
^1da177e4c3f41 Linus Torvalds      2005-04-16   888  	TW_Device_Extension *tw_dev = tw_device_extension_list[iminor(inode)];
^1da177e4c3f41 Linus Torvalds      2005-04-16   889  	int retval = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16   890  	void __user *argp = (void __user *)arg;
^1da177e4c3f41 Linus Torvalds      2005-04-16   891  
^1da177e4c3f41 Linus Torvalds      2005-04-16   892  	dprintk(KERN_WARNING "3w-xxxx: tw_chrdev_ioctl()\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16   893  
c45d15d24eb2b4 Arnd Bergmann       2010-06-02   894  	mutex_lock(&tw_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16   895  	/* Only let one of these through at a time */
f4927c45beda9a Arnd Bergmann       2010-04-27   896  	if (mutex_lock_interruptible(&tw_dev->ioctl_lock)) {
c45d15d24eb2b4 Arnd Bergmann       2010-06-02   897  		mutex_unlock(&tw_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16   898  		return -EINTR;
f4927c45beda9a Arnd Bergmann       2010-04-27   899  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   900  
^1da177e4c3f41 Linus Torvalds      2005-04-16   901  	/* First copy down the buffer length */
^1da177e4c3f41 Linus Torvalds      2005-04-16   902  	if (copy_from_user(&data_buffer_length, argp, sizeof(unsigned int)))
^1da177e4c3f41 Linus Torvalds      2005-04-16   903  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16   904  
^1da177e4c3f41 Linus Torvalds      2005-04-16   905  	/* Check size */
^1da177e4c3f41 Linus Torvalds      2005-04-16   906  	if (data_buffer_length > TW_MAX_IOCTL_SECTORS * 512) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   907  		retval = -EINVAL;
^1da177e4c3f41 Linus Torvalds      2005-04-16   908  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16   909  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   910  
^1da177e4c3f41 Linus Torvalds      2005-04-16   911  	/* Hardware can only do multiple of 512 byte transfers */
^1da177e4c3f41 Linus Torvalds      2005-04-16   912  	data_buffer_length_adjusted = (data_buffer_length + 511) & ~511;
^1da177e4c3f41 Linus Torvalds      2005-04-16   913  
^1da177e4c3f41 Linus Torvalds      2005-04-16   914  	/* Now allocate ioctl buf memory */
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22   915  	cpu_addr = dma_alloc_coherent(&tw_dev->tw_pci_dev->dev, data_buffer_length_adjusted + sizeof(TW_New_Ioctl), &dma_handle, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds      2005-04-16   916  	if (cpu_addr == NULL) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   917  		retval = -ENOMEM;
^1da177e4c3f41 Linus Torvalds      2005-04-16   918  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16   919  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   920  
^1da177e4c3f41 Linus Torvalds      2005-04-16   921  	tw_ioctl = (TW_New_Ioctl *)cpu_addr;
^1da177e4c3f41 Linus Torvalds      2005-04-16   922  
^1da177e4c3f41 Linus Torvalds      2005-04-16   923  	/* Now copy down the entire ioctl */
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22   924  	if (copy_from_user(tw_ioctl, argp, data_buffer_length + sizeof(TW_New_Ioctl)))
^1da177e4c3f41 Linus Torvalds      2005-04-16   925  		goto out2;
^1da177e4c3f41 Linus Torvalds      2005-04-16   926  
^1da177e4c3f41 Linus Torvalds      2005-04-16   927  	passthru = (TW_Passthru *)&tw_ioctl->firmware_command;
^1da177e4c3f41 Linus Torvalds      2005-04-16   928  
^1da177e4c3f41 Linus Torvalds      2005-04-16   929  	/* See which ioctl we are doing */
^1da177e4c3f41 Linus Torvalds      2005-04-16   930  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   931  		case TW_OP_NOP:
^1da177e4c3f41 Linus Torvalds      2005-04-16   932  			dprintk(KERN_WARNING "3w-xxxx: tw_chrdev_ioctl(): caught TW_OP_NOP.\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16   933  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   934  		case TW_OP_AEN_LISTEN:
^1da177e4c3f41 Linus Torvalds      2005-04-16   935  			dprintk(KERN_WARNING "3w-xxxx: tw_chrdev_ioctl(): caught TW_AEN_LISTEN.\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16   936  			memset(tw_ioctl->data_buffer, 0, data_buffer_length);
^1da177e4c3f41 Linus Torvalds      2005-04-16   937  
e83b47309f7331 John Garry          2026-08-31   938  			spin_lock_irqsave(&tw_dev->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16   939  			if (tw_dev->aen_head == tw_dev->aen_tail) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   940  				tw_aen_code = TW_AEN_QUEUE_EMPTY;
^1da177e4c3f41 Linus Torvalds      2005-04-16   941  			} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16   942  				tw_aen_code = tw_dev->aen_queue[tw_dev->aen_head];
^1da177e4c3f41 Linus Torvalds      2005-04-16   943  				if (tw_dev->aen_head == TW_Q_LENGTH - 1) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   944  					tw_dev->aen_head = TW_Q_START;
^1da177e4c3f41 Linus Torvalds      2005-04-16   945  				} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16   946  					tw_dev->aen_head = tw_dev->aen_head + 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16   947  				}
^1da177e4c3f41 Linus Torvalds      2005-04-16   948  			}
e83b47309f7331 John Garry          2026-08-31   949  			spin_unlock_irqrestore(&tw_dev->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16   950  			memcpy(tw_ioctl->data_buffer, &tw_aen_code, sizeof(tw_aen_code));
^1da177e4c3f41 Linus Torvalds      2005-04-16   951  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   952  		case TW_CMD_PACKET_WITH_DATA:
^1da177e4c3f41 Linus Torvalds      2005-04-16   953  			dprintk(KERN_WARNING "3w-xxxx: tw_chrdev_ioctl(): caught TW_CMD_PACKET_WITH_DATA.\n");
e83b47309f7331 John Garry          2026-08-31   954  			spin_lock_irqsave(&tw_dev->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16   955  
^1da177e4c3f41 Linus Torvalds      2005-04-16   956  			tw_state_request_start(tw_dev, &request_id);
^1da177e4c3f41 Linus Torvalds      2005-04-16   957  
^1da177e4c3f41 Linus Torvalds      2005-04-16   958  			/* Flag internal command */
^1da177e4c3f41 Linus Torvalds      2005-04-16   959  			tw_dev->srb[request_id] = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16   960  
^1da177e4c3f41 Linus Torvalds      2005-04-16   961  			/* Flag chrdev ioctl */
^1da177e4c3f41 Linus Torvalds      2005-04-16   962  			tw_dev->chrdev_request_id = request_id;
^1da177e4c3f41 Linus Torvalds      2005-04-16   963  
^1da177e4c3f41 Linus Torvalds      2005-04-16   964  			tw_ioctl->firmware_command.request_id = request_id;
^1da177e4c3f41 Linus Torvalds      2005-04-16   965  
^1da177e4c3f41 Linus Torvalds      2005-04-16   966  			/* Load the sg list */
^1da177e4c3f41 Linus Torvalds      2005-04-16   967  			switch (TW_SGL_OUT(tw_ioctl->firmware_command.opcode__sgloffset)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   968  			case 2:
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22   969  				tw_ioctl->firmware_command.byte8.param.sgl[0].address = dma_handle + sizeof(TW_New_Ioctl);
^1da177e4c3f41 Linus Torvalds      2005-04-16   970  				tw_ioctl->firmware_command.byte8.param.sgl[0].length = data_buffer_length_adjusted;
^1da177e4c3f41 Linus Torvalds      2005-04-16   971  				break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   972  			case 3:
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22   973  				tw_ioctl->firmware_command.byte8.io.sgl[0].address = dma_handle + sizeof(TW_New_Ioctl);
^1da177e4c3f41 Linus Torvalds      2005-04-16   974  				tw_ioctl->firmware_command.byte8.io.sgl[0].length = data_buffer_length_adjusted;
^1da177e4c3f41 Linus Torvalds      2005-04-16   975  				break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   976  			case 5:
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22   977  				passthru->sg_list[0].address = dma_handle + sizeof(TW_New_Ioctl);
^1da177e4c3f41 Linus Torvalds      2005-04-16   978  				passthru->sg_list[0].length = data_buffer_length_adjusted;
^1da177e4c3f41 Linus Torvalds      2005-04-16   979  				break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   980  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16   981  
^1da177e4c3f41 Linus Torvalds      2005-04-16   982  			memcpy(tw_dev->command_packet_virtual_address[request_id], &(tw_ioctl->firmware_command), sizeof(TW_Command));
^1da177e4c3f41 Linus Torvalds      2005-04-16   983  
^1da177e4c3f41 Linus Torvalds      2005-04-16   984  			/* Now post the command packet to the controller */
^1da177e4c3f41 Linus Torvalds      2005-04-16   985  			tw_post_command_packet(tw_dev, request_id);
e83b47309f7331 John Garry          2026-08-31   986  			spin_unlock_irqrestore(&tw_dev->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16   987  
^1da177e4c3f41 Linus Torvalds      2005-04-16   988  			timeout = TW_IOCTL_CHRDEV_TIMEOUT*HZ;
^1da177e4c3f41 Linus Torvalds      2005-04-16   989  
^1da177e4c3f41 Linus Torvalds      2005-04-16   990  			/* Now wait for the command to complete */
^1da177e4c3f41 Linus Torvalds      2005-04-16   991  			timeout = wait_event_timeout(tw_dev->ioctl_wqueue, tw_dev->chrdev_request_id == TW_IOCTL_CHRDEV_FREE, timeout);
^1da177e4c3f41 Linus Torvalds      2005-04-16   992  
^1da177e4c3f41 Linus Torvalds      2005-04-16   993  			/* We timed out, and didn't get an interrupt */
^1da177e4c3f41 Linus Torvalds      2005-04-16   994  			if (tw_dev->chrdev_request_id != TW_IOCTL_CHRDEV_FREE) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   995  				/* Now we need to reset the board */
^1da177e4c3f41 Linus Torvalds      2005-04-16   996  				printk(KERN_WARNING "3w-xxxx: scsi%d: Character ioctl (0x%x) timed out, resetting card.\n", tw_dev->host->host_no, cmd);
^1da177e4c3f41 Linus Torvalds      2005-04-16   997  				retval = -EIO;
4fe48187da5a02 Adam Radford        2007-01-04   998  				if (tw_reset_device_extension(tw_dev)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   999  					printk(KERN_WARNING "3w-xxxx: tw_chrdev_ioctl(): Reset failed for card %d.\n", tw_dev->host->host_no);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1000  				}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1001  				goto out2;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1002  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1003  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1004  			/* Now copy in the command packet response */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1005  			memcpy(&(tw_ioctl->firmware_command), tw_dev->command_packet_virtual_address[request_id], sizeof(TW_Command));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1006  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1007  			/* Now complete the io */
e83b47309f7331 John Garry          2026-08-31  1008  			spin_lock_irqsave(&tw_dev->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1009  			tw_dev->posted_request_count--;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1010  			tw_dev->state[request_id] = TW_S_COMPLETED;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1011  			tw_state_request_finish(tw_dev, request_id);
e83b47309f7331 John Garry          2026-08-31  1012  			spin_unlock_irqrestore(&tw_dev->host->host_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1013  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1014  		default:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1015  			retval = -ENOTTY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1016  			goto out2;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1017  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1018  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1019  	/* Now copy the response to userspace */
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22  1020  	if (copy_to_user(argp, tw_ioctl, sizeof(TW_New_Ioctl) + data_buffer_length))
^1da177e4c3f41 Linus Torvalds      2005-04-16  1021  		goto out2;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1022  	retval = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1023  out2:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1024  	/* Now free ioctl buf memory */
0fb9125e2aff08 Gustavo A. R. Silva 2022-09-22  1025  	dma_free_coherent(&tw_dev->tw_pci_dev->dev, data_buffer_length_adjusted + sizeof(TW_New_Ioctl), cpu_addr, dma_handle);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1026  out:
a12e25bd59e36d Jes Sorensen        2006-01-11 @1027  	mutex_unlock(&tw_dev->ioctl_lock);
c45d15d24eb2b4 Arnd Bergmann       2010-06-02  1028  	mutex_unlock(&tw_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1029  	return retval;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1030  } /* End tw_chrdev_ioctl() */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1031  

:::::: The code at line 1027 was first introduced by commit
:::::: a12e25bd59e36d12dcd026ffa3c65d48b5cf5442 [SCSI] sem2mutex 3w-[x9]xxx

:::::: TO: Jes Sorensen <jes@trained-monkey.org>
:::::: CC: James Bottomley <jejb@mulgrave.(none)>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
