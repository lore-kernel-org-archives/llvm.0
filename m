Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC5171B4;
	Fri,  9 Jun 2023 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686329919; x=1717865919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6INKds2DlLwXJTo0xAjqFhrQvssfKdbM/SBY2w+Y9Rw=;
  b=X6l0FpNlPce8+xi2Nt4JiDOVOhGHHcr4lGKra9O9KAQHRU+Mk7l5oHE4
   Z3z76dNspB8oUXEoJwo41IEwgKkrwo2FgKXKKmYVRWQeI6iCWV7g7Pu03
   Iew35d+OqzRj+qpoWi8b/7anvkU31juzZIgD3tsiI2wGnzQ0Vr48wYewP
   2Aa6tr/9WDXrqiZp9KS5z0N7zbdR8dNDLt79K+wpp38GmTkY7C4qqodz7
   PvkCD9ht4bojC04CBlllVO95DLkKJpqa6c4mcxtV7vTWYfx5OM9RpkNoE
   /U9BOIq6yGjCS1az3TFHuIGyg0hdy/eMQQIKHd+1b5oJ4Agdb8YXp6mRW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386008327"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="386008327"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 09:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687803766"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="687803766"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2023 09:58:37 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7fRc-0009Ey-11;
	Fri, 09 Jun 2023 16:58:36 +0000
Date: Sat, 10 Jun 2023 00:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [linux-next:master 3357/8413] drivers/scsi/FlashPoint.c:1712:12:
 warning: stack frame size (1056) exceeds limit (1024) in
 'FlashPoint_HandleInterrupt'
Message-ID: <202306100035.VTusNhm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53ab6975c12d1ad86c599a8927e8c698b144d669
commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [3357/8413] kbuild: Enable -fstrict-flex-arrays=3
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306100035.VTusNhm4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=df8fc4e934c12b906d08050d7779f292b9c5c6b5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout df8fc4e934c12b906d08050d7779f292b9c5c6b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100035.VTusNhm4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/BusLogic.c:51:
>> drivers/scsi/FlashPoint.c:1712:12: warning: stack frame size (1056) exceeds limit (1024) in 'FlashPoint_HandleInterrupt' [-Wframe-larger-than]
    1712 | static int FlashPoint_HandleInterrupt(void *pcard)
         |            ^
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
554b117e8fab4f Colin Ian King  2022-07-30  1715  	unsigned char thisCard, result, bm_status;
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
554b117e8fab4f Colin Ian King  2022-07-30  1726  	if (RD_HARPOON(ioport + hp_int_status) & EXT_STATUS_ON)
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
