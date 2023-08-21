Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457D6FC0;
	Mon, 21 Aug 2023 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692636663; x=1724172663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PBJffWpzwg35B5A1PLMPnKYjSv1HUzvwSCHDGqqxaQ=;
  b=kceJnYpdOQ4Uq62w101uNUdktbOmAtt/Ymxh+zRyMC8Ojrl5tMelQC02
   fWo1AAftsfrdDJl8DgtDNTMA2mCSe+vPorbdmQ5SBx1oL6nyvA47O0bfW
   yUDdNOErOt9ztpDCsC6bODE0Njxc3Ba4tPrIf5XYoyZcpyJ1c0SqWLe7w
   iNy8H6SJjcudiWnkeu0cHpamMphDanlA/n7LlC7w+98iXRn9rPisFNrTk
   qtXHGIwX3b66Xvmj7NU9pTT2qalurIVHOGt3SvvuqCwoty1/I0UEcZZUv
   VpXVvhaR+VZOQKzQmxo++0OaSARlixrafBmRaGZfX0AS6m+F7sd48ji6J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353219255"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="353219255"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850247052"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="850247052"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 09:50:55 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY87C-0000ho-2X;
	Mon, 21 Aug 2023 16:50:54 +0000
Date: Tue, 22 Aug 2023 00:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Robin Murphy <robin.murphy@arm.com>, Hannes Reinecke <hare@suse.de>
Subject: drivers/scsi/FlashPoint.c:1712:12: warning: stack frame size (2672)
 exceeds limit (2048) in 'FlashPoint_HandleInterrupt'
Message-ID: <202308220007.nW9DjlBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 9f7c2232e131b1de2ee4abadfce5d8f010e223c6 scsi: BusLogic: Remove bus_to_virt()
date:   1 year, 2 months ago
config: powerpc64-randconfig-r032-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220007.nW9DjlBp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220007.nW9DjlBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220007.nW9DjlBp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/BusLogic.c:51:
>> drivers/scsi/FlashPoint.c:1712:12: warning: stack frame size (2672) exceeds limit (2048) in 'FlashPoint_HandleInterrupt' [-Wframe-larger-than]
   static int FlashPoint_HandleInterrupt(void *pcard)
              ^
   1 warning generated.


vim +/FlashPoint_HandleInterrupt +1712 drivers/scsi/FlashPoint.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1702  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1703  /*---------------------------------------------------------------------
^1da177e4c3f41 Linus Torvalds  2005-04-16  1704   *
d8b6b8bd8a99ee Alexey Dobriyan 2006-03-08  1705   * Function: FlashPoint_HandleInterrupt
^1da177e4c3f41 Linus Torvalds  2005-04-16  1706   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  1707   * Description: This is our entry point when an interrupt is generated
^1da177e4c3f41 Linus Torvalds  2005-04-16  1708   *              by the card and the upper level driver passes it on to
^1da177e4c3f41 Linus Torvalds  2005-04-16  1709   *              us.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1710   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  1711   *---------------------------------------------------------------------*/
391e2f25601e34 Khalid Aziz     2013-05-16 @1712  static int FlashPoint_HandleInterrupt(void *pcard)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1713  {
69eb2ea4779336 Alexey Dobriyan 2006-03-08  1714  	struct sccb *currSCCB;
db038cf86fc63d Alexey Dobriyan 2006-03-08  1715  	unsigned char thisCard, result, bm_status, bm_int_st;
c823feeb33161c Alexey Dobriyan 2006-03-08  1716  	unsigned short hp_int;
db038cf86fc63d Alexey Dobriyan 2006-03-08  1717  	unsigned char i, target;
391e2f25601e34 Khalid Aziz     2013-05-16  1718  	struct sccb_card *pCurrCard = pcard;
391e2f25601e34 Khalid Aziz     2013-05-16  1719  	u32 ioport;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1720  
391e2f25601e34 Khalid Aziz     2013-05-16  1721  	thisCard = pCurrCard->cardIndex;
391e2f25601e34 Khalid Aziz     2013-05-16  1722  	ioport = pCurrCard->ioPort;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1723  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1724  	MDISABLE_INT(ioport);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1725  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1726  	if ((bm_int_st = RD_HARPOON(ioport + hp_int_status)) & EXT_STATUS_ON)
391e2f25601e34 Khalid Aziz     2013-05-16  1727  		bm_status = RD_HARPOON(ioport + hp_ext_status) &
391e2f25601e34 Khalid Aziz     2013-05-16  1728  					(unsigned char)BAD_EXT_STATUS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1729  	else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1730  		bm_status = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1731  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1732  	WR_HARPOON(ioport + hp_int_mask, (INT_CMD_COMPL | SCSI_INTERRUPT));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1733  
391e2f25601e34 Khalid Aziz     2013-05-16  1734  	while ((hp_int = RDW_HARPOON((ioport + hp_intstat)) &
391e2f25601e34 Khalid Aziz     2013-05-16  1735  				FPT_default_intena) | bm_status) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1736  
391e2f25601e34 Khalid Aziz     2013-05-16  1737  		currSCCB = pCurrCard->currentSCCB;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1738  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1739  		if (hp_int & (FIFO | TIMEOUT | RESET | SCAM_SEL) || bm_status) {
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1740  			result =
391e2f25601e34 Khalid Aziz     2013-05-16  1741  			    FPT_SccbMgr_bad_isr(ioport, thisCard, pCurrCard,
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1742  						hp_int);
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1743  			WRW_HARPOON((ioport + hp_intstat),
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1744  				    (FIFO | TIMEOUT | RESET | SCAM_SEL));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1745  			bm_status = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1746  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1747  			if (result) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1748  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1749  				MENABLE_INT(ioport);
5c1b85e209af41 Alexey Dobriyan 2006-03-08  1750  				return result;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1751  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1752  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1753  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1754  		else if (hp_int & ICMD_COMP) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1755  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1756  			if (!(hp_int & BUS_FREE)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1757  				/* Wait for the BusFree before starting a new command.  We
^1da177e4c3f41 Linus Torvalds  2005-04-16  1758  				   must also check for being reselected since the BusFree
^1da177e4c3f41 Linus Torvalds  2005-04-16  1759  				   may not show up if another device reselects us in 1.5us or
^1da177e4c3f41 Linus Torvalds  2005-04-16  1760  				   less.  SRR Wednesday, 3/8/1995.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1761  				 */
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1762  				while (!
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1763  				       (RDW_HARPOON((ioport + hp_intstat)) &
5c04a7b8981f28 Alexey Dobriyan 2006-03-08  1764  					(BUS_FREE | RSEL))) ;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1765  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1766  
391e2f25601e34 Khalid Aziz     2013-05-16  1767  			if (pCurrCard->globalFlags & F_HOST_XFER_ACT)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1768  
47b5d69c4aa753 James Bottomley 2005-04-24  1769  				FPT_phaseChkFifo(ioport, thisCard);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1770  

:::::: The code at line 1712 was first introduced by commit
:::::: 391e2f25601e34a7d7e5dc155e487bc58dffd8c6 [SCSI] BusLogic: Port driver to 64-bit.

:::::: TO: Khalid Aziz <khalid.aziz@oracle.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
