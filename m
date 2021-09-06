Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35863FC0
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 23:42:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="218195591"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; 
   d="gz'50?scan'50,208,50";a="218195591"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 16:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; 
   d="gz'50?scan'50,208,50";a="546453282"
Received: from lkp-server01.sh.intel.com (HELO 53c23d017ad5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2021 16:42:47 -0700
Received: from kbuild by 53c23d017ad5 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mNOGE-0001Dc-Pr; Mon, 06 Sep 2021 23:42:46 +0000
Date: Tue, 7 Sep 2021 07:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11748/12015] drivers/scsi/st.c:3826:2: error:
 unannotated fall-through between switch labels
Message-ID: <202109070707.4pPukuYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7800ca95d0ed11b492962dc3abc2181c9d5f7f82
commit: e747832c1bfc7547a9361e5858cdafdfa78d672c [11748/12015] Merge remote-tracking branch 'kspp-gustavo/for-next/kspp'
config: x86_64-randconfig-r022-20210906 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6fe2beba7d2a41964af658c8c59dd172683ef739)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e747832c1bfc7547a9361e5858cdafdfa78d672c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e747832c1bfc7547a9361e5858cdafdfa78d672c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/scsi/st.c:3826:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
           default:
           ^
   drivers/scsi/st.c:3826:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 error generated.


vim +3826 drivers/scsi/st.c

8038e6456a3e6f Kai Makisara      2016-02-09  3348  
8038e6456a3e6f Kai Makisara      2016-02-09  3349  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3350  /* Partition the tape into two partitions if size > 0 or one partition if
^1da177e4c3f41 Linus Torvalds    2005-04-16  3351     size == 0.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3352  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3353     The block descriptors are read and written because Sony SDT-7000 does not
^1da177e4c3f41 Linus Torvalds    2005-04-16  3354     work without this (suggestion from Michael Schaefer <Michael.Schaefer@dlr.de>).
^1da177e4c3f41 Linus Torvalds    2005-04-16  3355  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3356     My HP C1533A drive returns only one partition size field. This is used to
^1da177e4c3f41 Linus Torvalds    2005-04-16  3357     set the size of partition 1. There is no size field for the default partition.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3358     Michael Schaefer's Sony SDT-7000 returns two descriptors and the second is
^1da177e4c3f41 Linus Torvalds    2005-04-16  3359     used to set the size of partition 1 (this is what the SCSI-3 standard specifies).
^1da177e4c3f41 Linus Torvalds    2005-04-16  3360     The following algorithm is used to accommodate both drives: if the number of
^1da177e4c3f41 Linus Torvalds    2005-04-16  3361     partition size fields is greater than the maximum number of additional partitions
^1da177e4c3f41 Linus Torvalds    2005-04-16  3362     in the mode page, the second field is used. Otherwise the first field is used.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3363  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3364     For Seagate DDS drives the page length must be 8 when no partitions is defined
^1da177e4c3f41 Linus Torvalds    2005-04-16  3365     and 10 when 1 partition is defined (information from Eric Lee Green). This is
^1da177e4c3f41 Linus Torvalds    2005-04-16  3366     is acceptable also to some other old drives and enforced if the first partition
^1da177e4c3f41 Linus Torvalds    2005-04-16  3367     size field is used for the first additional partition size.
8038e6456a3e6f Kai Makisara      2016-02-09  3368  
8038e6456a3e6f Kai Makisara      2016-02-09  3369     For drives that advertize SCSI-3 or newer, use the SSC-3 methods.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3370   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3371  static int partition_tape(struct scsi_tape *STp, int size)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3372  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3373  	int result;
8038e6456a3e6f Kai Makisara      2016-02-09  3374  	int target_partition;
8038e6456a3e6f Kai Makisara      2016-02-09  3375  	bool scsi3 = STp->device->scsi_level >= SCSI_3, needs_format = false;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3376  	int pgo, psd_cnt, psdo;
8038e6456a3e6f Kai Makisara      2016-02-09  3377  	int psum = PP_MSK_PSUM_MB, units = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3378  	unsigned char *bp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3379  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3380  	result = read_mode_page(STp, PART_PAGE, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3381  	if (result) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3382  		DEBC_printk(STp, "Can't read partition mode page.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3383  		return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3384  	}
8038e6456a3e6f Kai Makisara      2016-02-09  3385  	target_partition = 1;
8038e6456a3e6f Kai Makisara      2016-02-09  3386  	if (size < 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3387  		target_partition = 0;
8038e6456a3e6f Kai Makisara      2016-02-09  3388  		size = -size;
8038e6456a3e6f Kai Makisara      2016-02-09  3389  	}
8038e6456a3e6f Kai Makisara      2016-02-09  3390  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3391  	/* The mode page is in the buffer. Let's modify it and write it. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3392  	bp = (STp->buffer)->b_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3393  	pgo = MODE_HEADER_LENGTH + bp[MH_OFF_BDESCS_LENGTH];
b30d8bca5b525b Hannes Reinecke   2014-06-25  3394  	DEBC_printk(STp, "Partition page length is %d bytes.\n",
b30d8bca5b525b Hannes Reinecke   2014-06-25  3395  		    bp[pgo + MP_OFF_PAGE_LENGTH] + 2);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3396  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3397  	psd_cnt = (bp[pgo + MP_OFF_PAGE_LENGTH] + 2 - PART_PAGE_FIXED_LENGTH) / 2;
8038e6456a3e6f Kai Makisara      2016-02-09  3398  
8038e6456a3e6f Kai Makisara      2016-02-09  3399  	if (scsi3) {
8038e6456a3e6f Kai Makisara      2016-02-09  3400  		needs_format = (bp[pgo + PP_OFF_FLAGS] & PP_MSK_POFM) != 0;
8038e6456a3e6f Kai Makisara      2016-02-09  3401  		if (needs_format && size == 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3402  			/* No need to write the mode page when clearing
8038e6456a3e6f Kai Makisara      2016-02-09  3403  			 *  partitioning
8038e6456a3e6f Kai Makisara      2016-02-09  3404  			 */
8038e6456a3e6f Kai Makisara      2016-02-09  3405  			DEBC_printk(STp, "Formatting tape with one partition.\n");
8038e6456a3e6f Kai Makisara      2016-02-09  3406  			result = format_medium(STp, 0);
8038e6456a3e6f Kai Makisara      2016-02-09  3407  			goto out;
8038e6456a3e6f Kai Makisara      2016-02-09  3408  		}
8038e6456a3e6f Kai Makisara      2016-02-09  3409  		if (needs_format)  /* Leave the old value for HP DATs claiming SCSI_3 */
8038e6456a3e6f Kai Makisara      2016-02-09  3410  			psd_cnt = 2;
8038e6456a3e6f Kai Makisara      2016-02-09  3411  		if ((bp[pgo + PP_OFF_FLAGS] & PP_MSK_PSUM_UNITS) == PP_MSK_PSUM_UNITS) {
8038e6456a3e6f Kai Makisara      2016-02-09  3412  			/* Use units scaling for large partitions if the device
8038e6456a3e6f Kai Makisara      2016-02-09  3413  			 * suggests it and no precision lost. Required for IBM
8038e6456a3e6f Kai Makisara      2016-02-09  3414  			 * TS1140/50 drives that don't support MB units.
8038e6456a3e6f Kai Makisara      2016-02-09  3415  			 */
8038e6456a3e6f Kai Makisara      2016-02-09  3416  			if (size >= 1000 && (size % 1000) == 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3417  				size /= 1000;
8038e6456a3e6f Kai Makisara      2016-02-09  3418  				psum = PP_MSK_PSUM_UNITS;
8038e6456a3e6f Kai Makisara      2016-02-09  3419  				units = 9; /* GB */
8038e6456a3e6f Kai Makisara      2016-02-09  3420  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3421  		}
8038e6456a3e6f Kai Makisara      2016-02-09  3422  		/* Try it anyway if too large to specify in MB */
8038e6456a3e6f Kai Makisara      2016-02-09  3423  		if (psum == PP_MSK_PSUM_MB && size >= 65534) {
8038e6456a3e6f Kai Makisara      2016-02-09  3424  			size /= 1000;
8038e6456a3e6f Kai Makisara      2016-02-09  3425  			psum = PP_MSK_PSUM_UNITS;
8038e6456a3e6f Kai Makisara      2016-02-09  3426  			units = 9;  /* GB */
8038e6456a3e6f Kai Makisara      2016-02-09  3427  		}
8038e6456a3e6f Kai Makisara      2016-02-09  3428  	}
8038e6456a3e6f Kai Makisara      2016-02-09  3429  
8038e6456a3e6f Kai Makisara      2016-02-09  3430  	if (size >= 65535 ||  /* Does not fit into two bytes */
8038e6456a3e6f Kai Makisara      2016-02-09  3431  	    (target_partition == 0 && psd_cnt < 2)) {
8038e6456a3e6f Kai Makisara      2016-02-09  3432  		result = -EINVAL;
8038e6456a3e6f Kai Makisara      2016-02-09  3433  		goto out;
8038e6456a3e6f Kai Makisara      2016-02-09  3434  	}
8038e6456a3e6f Kai Makisara      2016-02-09  3435  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3436  	psdo = pgo + PART_PAGE_FIXED_LENGTH;
8038e6456a3e6f Kai Makisara      2016-02-09  3437  	/* The second condition is for HP DDS which use only one partition size
8038e6456a3e6f Kai Makisara      2016-02-09  3438  	 * descriptor
8038e6456a3e6f Kai Makisara      2016-02-09  3439  	 */
8038e6456a3e6f Kai Makisara      2016-02-09  3440  	if (target_partition > 0 &&
8038e6456a3e6f Kai Makisara      2016-02-09  3441  	    (psd_cnt > bp[pgo + PP_OFF_MAX_ADD_PARTS] ||
8038e6456a3e6f Kai Makisara      2016-02-09  3442  	     bp[pgo + PP_OFF_MAX_ADD_PARTS] != 1)) {
8038e6456a3e6f Kai Makisara      2016-02-09  3443  		bp[psdo] = bp[psdo + 1] = 0xff;  /* Rest to partition 0 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3444  		psdo += 2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3445  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3446  	memset(bp + psdo, 0, bp[pgo + PP_OFF_NBR_ADD_PARTS] * 2);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3447  
b30d8bca5b525b Hannes Reinecke   2014-06-25  3448  	DEBC_printk(STp, "psd_cnt %d, max.parts %d, nbr_parts %d\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  3449  		    psd_cnt, bp[pgo + PP_OFF_MAX_ADD_PARTS],
b30d8bca5b525b Hannes Reinecke   2014-06-25  3450  		    bp[pgo + PP_OFF_NBR_ADD_PARTS]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3451  
8038e6456a3e6f Kai Makisara      2016-02-09  3452  	if (size == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3453  		bp[pgo + PP_OFF_NBR_ADD_PARTS] = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3454  		if (psd_cnt <= bp[pgo + PP_OFF_MAX_ADD_PARTS])
^1da177e4c3f41 Linus Torvalds    2005-04-16  3455  		    bp[pgo + MP_OFF_PAGE_LENGTH] = 6;
b30d8bca5b525b Hannes Reinecke   2014-06-25  3456  		DEBC_printk(STp, "Formatting tape with one partition.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3457  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3458  		bp[psdo] = (size >> 8) & 0xff;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3459  		bp[psdo + 1] = size & 0xff;
8038e6456a3e6f Kai Makisara      2016-02-09  3460  		if (target_partition == 0)
8038e6456a3e6f Kai Makisara      2016-02-09  3461  			bp[psdo + 2] = bp[psdo + 3] = 0xff;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3462  		bp[pgo + 3] = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3463  		if (bp[pgo + MP_OFF_PAGE_LENGTH] < 8)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3464  		    bp[pgo + MP_OFF_PAGE_LENGTH] = 8;
8038e6456a3e6f Kai Makisara      2016-02-09  3465  		DEBC_printk(STp,
8038e6456a3e6f Kai Makisara      2016-02-09  3466  			    "Formatting tape with two partitions (%i = %d MB).\n",
8038e6456a3e6f Kai Makisara      2016-02-09  3467  			    target_partition, units > 0 ? size * 1000 : size);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3468  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3469  	bp[pgo + PP_OFF_PART_UNITS] = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3470  	bp[pgo + PP_OFF_RESERVED] = 0;
8038e6456a3e6f Kai Makisara      2016-02-09  3471  	if (size != 1 || units != 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3472  		bp[pgo + PP_OFF_FLAGS] = PP_BIT_IDP | psum |
8038e6456a3e6f Kai Makisara      2016-02-09  3473  			(bp[pgo + PP_OFF_FLAGS] & 0x07);
8038e6456a3e6f Kai Makisara      2016-02-09  3474  		bp[pgo + PP_OFF_PART_UNITS] = units;
8038e6456a3e6f Kai Makisara      2016-02-09  3475  	} else
8038e6456a3e6f Kai Makisara      2016-02-09  3476  		bp[pgo + PP_OFF_FLAGS] = PP_BIT_FDP |
8038e6456a3e6f Kai Makisara      2016-02-09  3477  			(bp[pgo + PP_OFF_FLAGS] & 0x1f);
8038e6456a3e6f Kai Makisara      2016-02-09  3478  	bp[pgo + MP_OFF_PAGE_LENGTH] = 6 + psd_cnt * 2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3479  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3480  	result = write_mode_page(STp, PART_PAGE, 1);
8038e6456a3e6f Kai Makisara      2016-02-09  3481  
8038e6456a3e6f Kai Makisara      2016-02-09  3482  	if (!result && needs_format)
8038e6456a3e6f Kai Makisara      2016-02-09  3483  		result = format_medium(STp, 1);
8038e6456a3e6f Kai Makisara      2016-02-09  3484  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3485  	if (result) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3486  		st_printk(KERN_INFO, STp, "Partitioning of tape failed.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3487  		result = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3488  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3489  
8038e6456a3e6f Kai Makisara      2016-02-09  3490  out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3491  	return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3492  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3493  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3494  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3495  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3496  /* The ioctl command */
dba7688fc9037c Christoph Hellwig 2021-07-24  3497  static long st_ioctl(struct file *file, unsigned int cmd_in, unsigned long arg)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3498  {
dba7688fc9037c Christoph Hellwig 2021-07-24  3499  	void __user *p = (void __user *)arg;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3500  	int i, cmd_nr, cmd_type, bt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3501  	int retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3502  	unsigned int blk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3503  	struct scsi_tape *STp = file->private_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3504  	struct st_modedef *STm;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3505  	struct st_partstat *STps;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3506  
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3507  	if (mutex_lock_interruptible(&STp->lock))
^1da177e4c3f41 Linus Torvalds    2005-04-16  3508  		return -ERESTARTSYS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3509  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3510  	DEB(
^1da177e4c3f41 Linus Torvalds    2005-04-16  3511  	if (debugging && !STp->in_use) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3512  		st_printk(ST_DEB_MSG, STp, "Incorrect device.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3513  		retval = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3514  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3515  	} ) /* end DEB */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3516  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3517  	STm = &(STp->modes[STp->current_mode]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3518  	STps = &(STp->ps[STp->partition]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3519  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3520  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3521  	 * If we are in the middle of error recovery, don't let anyone
^1da177e4c3f41 Linus Torvalds    2005-04-16  3522  	 * else try and use this device.  Also, if error recovery fails, it
^1da177e4c3f41 Linus Torvalds    2005-04-16  3523  	 * may try and take the device offline, in which case all further
^1da177e4c3f41 Linus Torvalds    2005-04-16  3524  	 * access to the device is prohibited.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3525  	 */
906d15fbd23c12 Christoph Hellwig 2014-10-11  3526  	retval = scsi_ioctl_block_when_processing_errors(STp->device, cmd_in,
83ff6fe8580a7c Al Viro           2008-03-02  3527  			file->f_flags & O_NDELAY);
906d15fbd23c12 Christoph Hellwig 2014-10-11  3528  	if (retval)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3529  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3530  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3531  	cmd_type = _IOC_TYPE(cmd_in);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3532  	cmd_nr = _IOC_NR(cmd_in);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3533  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3534  	if (cmd_type == _IOC_TYPE(MTIOCTOP) && cmd_nr == _IOC_NR(MTIOCTOP)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3535  		struct mtop mtc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3536  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3537  		if (_IOC_SIZE(cmd_in) != sizeof(mtc)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3538  			retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3539  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3540  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3541  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3542  		i = copy_from_user(&mtc, p, sizeof(struct mtop));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3543  		if (i) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3544  			retval = (-EFAULT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3545  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3546  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3547  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3548  		if (mtc.mt_op == MTSETDRVBUFFER && !capable(CAP_SYS_ADMIN)) {
b30d8bca5b525b Hannes Reinecke   2014-06-25  3549  			st_printk(KERN_WARNING, STp,
b30d8bca5b525b Hannes Reinecke   2014-06-25  3550  				  "MTSETDRVBUFFER only allowed for root.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3551  			retval = (-EPERM);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3552  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3553  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3554  		if (!STm->defined &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3555  		    (mtc.mt_op != MTSETDRVBUFFER &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3556  		     (mtc.mt_count & MT_ST_OPTIONS) == 0)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3557  			retval = (-ENXIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3558  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3559  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3560  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3561  		if (!STp->pos_unknown) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3562  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3563  			if (STps->eof == ST_FM_HIT) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3564  				if (mtc.mt_op == MTFSF || mtc.mt_op == MTFSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3565                                      mtc.mt_op == MTEOM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3566  					mtc.mt_count -= 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3567  					if (STps->drv_file >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3568  						STps->drv_file += 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3569  				} else if (mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3570  					mtc.mt_count += 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3571  					if (STps->drv_file >= 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3572  						STps->drv_file += 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3573  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3574  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3575  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3576  			if (mtc.mt_op == MTSEEK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3577  				/* Old position must be restored if partition will be
^1da177e4c3f41 Linus Torvalds    2005-04-16  3578                                     changed */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3579  				i = !STp->can_partitions ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3580  				    (STp->new_partition != STp->partition);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3581  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3582  				i = mtc.mt_op == MTREW || mtc.mt_op == MTOFFL ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3583  				    mtc.mt_op == MTRETEN || mtc.mt_op == MTEOM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3584  				    mtc.mt_op == MTLOCK || mtc.mt_op == MTLOAD ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3585  				    mtc.mt_op == MTFSF || mtc.mt_op == MTFSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3586  				    mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3587  				    mtc.mt_op == MTCOMPRESSION;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3588  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3589  			i = flush_buffer(STp, i);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3590  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3591  				retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3592  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3593  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3594  			if (STps->rw == ST_WRITING &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3595  			    (mtc.mt_op == MTREW || mtc.mt_op == MTOFFL ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3596  			     mtc.mt_op == MTSEEK ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3597  			     mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3598  				i = st_int_ioctl(STp, MTWEOF, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3599  				if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3600  					retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3601  					goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3602  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3603  				if (mtc.mt_op == MTBSF || mtc.mt_op == MTBSFM)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3604  					mtc.mt_count++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3605  				STps->rw = ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3606  			     }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3607  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3608  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3609  			/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3610  			 * If there was a bus reset, block further access
^1da177e4c3f41 Linus Torvalds    2005-04-16  3611  			 * to this device.  If the user wants to rewind the tape,
^1da177e4c3f41 Linus Torvalds    2005-04-16  3612  			 * then reset the flag and allow access again.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3613  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3614  			if (mtc.mt_op != MTREW &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3615  			    mtc.mt_op != MTOFFL &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3616  			    mtc.mt_op != MTRETEN &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3617  			    mtc.mt_op != MTERASE &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3618  			    mtc.mt_op != MTSEEK &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3619  			    mtc.mt_op != MTEOM) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3620  				retval = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3621  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3622  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3623  			reset_state(STp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3624  			/* remove this when the midlevel properly clears was_reset */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3625  			STp->device->was_reset = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3626  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3627  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3628  		if (mtc.mt_op != MTNOP && mtc.mt_op != MTSETBLK &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3629  		    mtc.mt_op != MTSETDENSITY && mtc.mt_op != MTWSM &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3630  		    mtc.mt_op != MTSETDRVBUFFER && mtc.mt_op != MTSETPART)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3631  			STps->rw = ST_IDLE;	/* Prevent automatic WEOF and fsf */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3632  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3633  		if (mtc.mt_op == MTOFFL && STp->door_locked != ST_UNLOCKED)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3634  			do_door_lock(STp, 0);	/* Ignore result! */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3635  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3636  		if (mtc.mt_op == MTSETDRVBUFFER &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3637  		    (mtc.mt_count & MT_ST_OPTIONS) != 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3638  			retval = st_set_options(STp, mtc.mt_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3639  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3640  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3641  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3642  		if (mtc.mt_op == MTSETPART) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3643  			if (!STp->can_partitions ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3644  			    mtc.mt_count < 0 || mtc.mt_count >= ST_NBR_PARTITIONS) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3645  				retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3646  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3647  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3648  			if (mtc.mt_count >= STp->nbr_partitions &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3649  			    (STp->nbr_partitions = nbr_partitions(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3650  				retval = (-EIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3651  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3652  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3653  			if (mtc.mt_count >= STp->nbr_partitions) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3654  				retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3655  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3656  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3657  			STp->new_partition = mtc.mt_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3658  			retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3659  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3660  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3661  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3662  		if (mtc.mt_op == MTMKPART) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3663  			if (!STp->can_partitions) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3664  				retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3665  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3666  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3667  			i = do_load_unload(STp, file, 1);
8038e6456a3e6f Kai Makisara      2016-02-09  3668  			if (i < 0) {
8038e6456a3e6f Kai Makisara      2016-02-09  3669  				retval = i;
8038e6456a3e6f Kai Makisara      2016-02-09  3670  				goto out;
8038e6456a3e6f Kai Makisara      2016-02-09  3671  			}
8038e6456a3e6f Kai Makisara      2016-02-09  3672  			i = partition_tape(STp, mtc.mt_count);
8038e6456a3e6f Kai Makisara      2016-02-09  3673  			if (i < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3674  				retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3675  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3676  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3677  			for (i = 0; i < ST_NBR_PARTITIONS; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3678  				STp->ps[i].rw = ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3679  				STp->ps[i].at_sm = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3680  				STp->ps[i].last_block_valid = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3681  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3682  			STp->partition = STp->new_partition = 0;
8038e6456a3e6f Kai Makisara      2016-02-09  3683  			STp->nbr_partitions = mtc.mt_count != 0 ? 2 : 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3684  			STps->drv_block = STps->drv_file = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3685  			retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3686  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3687  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3688  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3689  		if (mtc.mt_op == MTSEEK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3690  			i = set_location(STp, mtc.mt_count, STp->new_partition, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3691  			if (!STp->can_partitions)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3692  				STp->ps[0].rw = ST_IDLE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3693  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3694  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3695  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3696  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3697  		if (mtc.mt_op == MTUNLOAD || mtc.mt_op == MTOFFL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3698  			retval = do_load_unload(STp, file, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3699  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3700  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3701  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3702  		if (mtc.mt_op == MTLOAD) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3703  			retval = do_load_unload(STp, file, max(1, mtc.mt_count));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3704  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3705  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3706  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3707  		if (mtc.mt_op == MTLOCK || mtc.mt_op == MTUNLOCK) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3708  			retval = do_door_lock(STp, (mtc.mt_op == MTLOCK));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3709  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3710  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3711  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3712  		if (STp->can_partitions && STp->ready == ST_READY &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3713  		    (i = switch_partition(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3714  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3715  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3716  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3717  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3718  		if (mtc.mt_op == MTCOMPRESSION)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3719  			retval = st_compression(STp, (mtc.mt_count & 1));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3720  		else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3721  			retval = st_int_ioctl(STp, mtc.mt_op, mtc.mt_count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3722  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3723  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3724  	if (!STm->defined) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3725  		retval = (-ENXIO);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3726  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3727  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3728  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3729  	if ((i = flush_buffer(STp, 0)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3730  		retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3731  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3732  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3733  	if (STp->can_partitions &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  3734  	    (i = switch_partition(STp)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3735  		retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3736  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3737  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3738  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3739  	if (cmd_type == _IOC_TYPE(MTIOCGET) && cmd_nr == _IOC_NR(MTIOCGET)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3740  		struct mtget mt_status;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3741  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3742  		if (_IOC_SIZE(cmd_in) != sizeof(struct mtget)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3743  			 retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3744  			 goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3745  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3746  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3747  		mt_status.mt_type = STp->tape_type;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3748  		mt_status.mt_dsreg =
^1da177e4c3f41 Linus Torvalds    2005-04-16  3749  		    ((STp->block_size << MT_ST_BLKSIZE_SHIFT) & MT_ST_BLKSIZE_MASK) |
^1da177e4c3f41 Linus Torvalds    2005-04-16  3750  		    ((STp->density << MT_ST_DENSITY_SHIFT) & MT_ST_DENSITY_MASK);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3751  		mt_status.mt_blkno = STps->drv_block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3752  		mt_status.mt_fileno = STps->drv_file;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3753  		if (STp->block_size != 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3754  			if (STps->rw == ST_WRITING)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3755  				mt_status.mt_blkno +=
^1da177e4c3f41 Linus Torvalds    2005-04-16  3756  				    (STp->buffer)->buffer_bytes / STp->block_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3757  			else if (STps->rw == ST_READING)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3758  				mt_status.mt_blkno -=
^1da177e4c3f41 Linus Torvalds    2005-04-16  3759                                          ((STp->buffer)->buffer_bytes +
^1da177e4c3f41 Linus Torvalds    2005-04-16  3760                                           STp->block_size - 1) / STp->block_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3761  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3762  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3763  		mt_status.mt_gstat = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3764  		if (STp->drv_write_prot)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3765  			mt_status.mt_gstat |= GMT_WR_PROT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3766  		if (mt_status.mt_blkno == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3767  			if (mt_status.mt_fileno == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3768  				mt_status.mt_gstat |= GMT_BOT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3769  			else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3770  				mt_status.mt_gstat |= GMT_EOF(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3771  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3772  		mt_status.mt_erreg = (STp->recover_reg << MT_ST_SOFTERR_SHIFT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3773  		mt_status.mt_resid = STp->partition;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3774  		if (STps->eof == ST_EOM_OK || STps->eof == ST_EOM_ERROR)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3775  			mt_status.mt_gstat |= GMT_EOT(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3776  		else if (STps->eof >= ST_EOM_OK)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3777  			mt_status.mt_gstat |= GMT_EOD(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3778  		if (STp->density == 1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3779  			mt_status.mt_gstat |= GMT_D_800(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3780  		else if (STp->density == 2)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3781  			mt_status.mt_gstat |= GMT_D_1600(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3782  		else if (STp->density == 3)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3783  			mt_status.mt_gstat |= GMT_D_6250(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3784  		if (STp->ready == ST_READY)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3785  			mt_status.mt_gstat |= GMT_ONLINE(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3786  		if (STp->ready == ST_NO_TAPE)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3787  			mt_status.mt_gstat |= GMT_DR_OPEN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3788  		if (STps->at_sm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3789  			mt_status.mt_gstat |= GMT_SM(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3790  		if (STm->do_async_writes ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3791                      (STm->do_buffer_writes && STp->block_size != 0) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3792  		    STp->drv_buffer != 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3793  			mt_status.mt_gstat |= GMT_IM_REP_EN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3794  		if (STp->cleaning_req)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3795  			mt_status.mt_gstat |= GMT_CLN(0xffffffff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3796  
1207045da5a7c9 Arnd Bergmann     2018-09-07  3797  		retval = put_user_mtget(p, &mt_status);
1207045da5a7c9 Arnd Bergmann     2018-09-07  3798  		if (retval)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3799  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3800  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3801  		STp->recover_reg = 0;		/* Clear after read */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3802  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3803  	}			/* End of MTIOCGET */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3804  	if (cmd_type == _IOC_TYPE(MTIOCPOS) && cmd_nr == _IOC_NR(MTIOCPOS)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3805  		struct mtpos mt_pos;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3806  		if (_IOC_SIZE(cmd_in) != sizeof(struct mtpos)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3807  			 retval = (-EINVAL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3808  			 goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3809  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3810  		if ((i = get_location(STp, &blk, &bt, 0)) < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3811  			retval = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3812  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3813  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3814  		mt_pos.mt_blkno = blk;
1207045da5a7c9 Arnd Bergmann     2018-09-07  3815  		retval = put_user_mtpos(p, &mt_pos);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3816  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3817  	}
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3818  	mutex_unlock(&STp->lock);
d320a9551e394c Arnd Bergmann     2019-03-15  3819  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3820  	switch (cmd_in) {
dba7688fc9037c Christoph Hellwig 2021-07-24  3821  	case SG_IO:
dba7688fc9037c Christoph Hellwig 2021-07-24  3822  	case SCSI_IOCTL_SEND_COMMAND:
dba7688fc9037c Christoph Hellwig 2021-07-24  3823  	case CDROM_SEND_PACKET:
dba7688fc9037c Christoph Hellwig 2021-07-24  3824  		if (!capable(CAP_SYS_RAWIO))
dba7688fc9037c Christoph Hellwig 2021-07-24  3825  			return -EPERM;
^1da177e4c3f41 Linus Torvalds    2005-04-16 @3826  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3827  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3828  	}
dba7688fc9037c Christoph Hellwig 2021-07-24  3829  
a9c9a6f741cdaa Linus Torvalds    2021-09-02  3830  	retval = scsi_ioctl(STp->device, NULL, file->f_mode, cmd_in, p);
dba7688fc9037c Christoph Hellwig 2021-07-24  3831  	if (!retval && cmd_in == SCSI_IOCTL_STOP_UNIT) {
d320a9551e394c Arnd Bergmann     2019-03-15  3832  		/* unload */
d320a9551e394c Arnd Bergmann     2019-03-15  3833  		STp->rew_at_close = 0;
d320a9551e394c Arnd Bergmann     2019-03-15  3834  		STp->ready = ST_NO_TAPE;
d320a9551e394c Arnd Bergmann     2019-03-15  3835  	}
d320a9551e394c Arnd Bergmann     2019-03-15  3836  	return retval;
d320a9551e394c Arnd Bergmann     2019-03-15  3837  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3838   out:
28f85009e0cf6a Matthias Kaehlcke 2007-07-29  3839  	mutex_unlock(&STp->lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3840  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3841  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3842  

:::::: The code at line 3826 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ew6BAiZeqk4r7MaW
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ew6BAiZeqk4r7MaW--
