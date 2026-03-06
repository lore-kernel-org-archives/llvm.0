Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE683822BD;
	Fri,  6 Mar 2026 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795016; cv=none; b=plCc+5WrjpRE9SviTBTTZNIumLFVVUOSGwZfu8O6GUDB9g/Z8lFbTbly2Jo/t8o1G5yQVhDeDOsVtbwXiaPgLgAFmNkTsUCPJyejX4Hk8qBakdnvJOCxgMPLHnRf481ZwAcyiJMn2fQc57GEWv1zCyBZPMUhgZyi3mkQbInxxy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795016; c=relaxed/simple;
	bh=W6oaerldGrMMAIFR+SHW2W3DI6S8RTaTTbAbiMfmsgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgNSvRYbckqjtQJ1TuLnIbd2msMyqk+E+Ib8pGTujexgo7oq1zYQ60LXAq13btsEL8CDN9ry/vW+jPi/VNMbNaALnvjjTgDFgNwAbmYlTYTwPH0feLTrYty++GoR8P2/q3HHJUuTxu7vrq9YKys6DdrXYvp+pXY1L4xoW0k8oPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Milcmb8o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Milcmb8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772795012; x=1804331012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W6oaerldGrMMAIFR+SHW2W3DI6S8RTaTTbAbiMfmsgs=;
  b=Milcmb8oXsjPotI3QxBf1tf++DI7AL9VmyufQA3+J1kaguLGTl8vOkUU
   dwczfjBe4GNRxcPmCenR1vhTrKRKQTK91m4E14Qqr7Ft+rps2NpDLY14b
   utR1nK9OdCEobT4o5twzIY+e95PjMrH9H4ZuO+4VgOb+UdKruO796CcTT
   BNmGSb+TW2GUQUviUPRv4D39MDQZBQE69i8MOzxZxtYfSbrzFDUj1g2KH
   sXb6Nr+Vi49P0orml7Vg4A/BIzkUPkqcvPGGL7Kho9nZV5qVL+VfAac8/
   VyOPd0MekoSYONGYDSriUdePJxpXdr8jrzsSdXhSRBJJK6gEPuGNVSGG9
   g==;
X-CSE-ConnectionGUID: x9JmeZ7kQaeC4nVUAHjIuQ==
X-CSE-MsgGUID: 5lf+52BlTsGZju1gEbAZIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84984927"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84984927"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:03:31 -0800
X-CSE-ConnectionGUID: IJJ5UzUjRvGFEGba92yTFg==
X-CSE-MsgGUID: dX3LLMmYRqqXMBAqholaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="215679225"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 03:03:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vySxq-000000000lF-3xHK;
	Fri, 06 Mar 2026 11:03:26 +0000
Date: Fri, 6 Mar 2026 19:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay
 values
Message-ID: <202603061813.ClFYVtLL-lkp@intel.com>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>

Hi Frieder,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/spi-Add-rx_sampling_delay_ns-parameter-for-clock-to-RX-delay/20260304-004536
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6%40kontron.de
patch subject: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay values
config: um-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061813.ClFYVtLL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061813.ClFYVtLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061813.ClFYVtLL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/toshiba.c:11:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/mtd/nand/spi/toshiba.c:285:2: error: unterminated function-like macro invocation
     285 |         SPINAND_INFO("TC58NYG0S3HBAI4",
         |         ^
   include/linux/mtd/spinand.h:676:9: note: macro 'SPINAND_INFO' defined here
     676 | #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,  \
         |         ^
>> drivers/mtd/nand/spi/toshiba.c:328:3: error: expected expression
     328 | };
         |   ^
>> drivers/mtd/nand/spi/toshiba.c:328:3: error: expected '}'
   drivers/mtd/nand/spi/toshiba.c:110:60: note: to match this '{'
     110 | static const struct spinand_info toshiba_spinand_table[] = {
         |                                                            ^
>> drivers/mtd/nand/spi/toshiba.c:283:38: error: expected ';' after top level declarator
     283 |                      SPINAND_RX_SAMPLING_DELAY(6)),
         |                                                    ^
         |                                                    ;
   1 warning and 4 errors generated.


vim +285 drivers/mtd/nand/spi/toshiba.c

10949af1681d5bb Schrempf Frieder 2018-11-08  109  
10949af1681d5bb Schrempf Frieder 2018-11-08  110  static const struct spinand_info toshiba_spinand_table[] = {
798fcdd010006e8 Yoshio Furuyama  2020-03-24  111  	/* 3.3V 1Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  112  	SPINAND_INFO("TC58CVG0S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  113  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xC2),
377e517b5fa5359 Boris Brezillon  2018-11-04  114  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  115  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  116  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  117  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  118  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  119  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  120  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  121  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  122  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  123  	/* 3.3V 2Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  124  	SPINAND_INFO("TC58CVG1S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  125  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xCB),
377e517b5fa5359 Boris Brezillon  2018-11-04  126  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  127  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  128  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  129  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  130  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  131  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  132  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  133  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  134  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  135  	/* 3.3V 4Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  136  	SPINAND_INFO("TC58CVG2S0HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  137  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xCD),
377e517b5fa5359 Boris Brezillon  2018-11-04  138  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
9ee0f956cfbb87b Robert Marko     2020-01-03  139  		     NAND_ECCREQ(8, 512),
9ee0f956cfbb87b Robert Marko     2020-01-03  140  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
9ee0f956cfbb87b Robert Marko     2020-01-03  141  					      &write_cache_variants,
9ee0f956cfbb87b Robert Marko     2020-01-03  142  					      &update_cache_variants),
9ee0f956cfbb87b Robert Marko     2020-01-03  143  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  144  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  145  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  146  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  147  	/* 1.8V 1Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  148  	SPINAND_INFO("TC58CYG0S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  149  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xB2),
377e517b5fa5359 Boris Brezillon  2018-11-04  150  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  151  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  152  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  153  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  154  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  155  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  156  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  157  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  158  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  159  	/* 1.8V 2Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  160  	SPINAND_INFO("TC58CYG1S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  161  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xBB),
377e517b5fa5359 Boris Brezillon  2018-11-04  162  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  163  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  164  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  165  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  166  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  167  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  168  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  169  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  170  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  171  	/* 1.8V 4Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  172  	SPINAND_INFO("TC58CYG2S0HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  173  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xBD),
377e517b5fa5359 Boris Brezillon  2018-11-04  174  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
10949af1681d5bb Schrempf Frieder 2018-11-08  175  		     NAND_ECCREQ(8, 512),
10949af1681d5bb Schrempf Frieder 2018-11-08  176  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
10949af1681d5bb Schrempf Frieder 2018-11-08  177  					      &write_cache_variants,
10949af1681d5bb Schrempf Frieder 2018-11-08  178  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  179  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  180  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  181  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  182  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  183  
798fcdd010006e8 Yoshio Furuyama  2020-03-24  184  	/*
798fcdd010006e8 Yoshio Furuyama  2020-03-24  185  	 * 2nd generation serial nand has HOLD_D which is equivalent to
798fcdd010006e8 Yoshio Furuyama  2020-03-24  186  	 * QE_BIT.
798fcdd010006e8 Yoshio Furuyama  2020-03-24  187  	 */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  188  	/* 3.3V 1Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  189  	SPINAND_INFO("TC58CVG0S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  190  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE2),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  191  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  192  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  193  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  194  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  195  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  196  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  197  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  198  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  199  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  200  	/* 3.3V 2Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  201  	SPINAND_INFO("TC58CVG1S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  202  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xEB),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  203  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  204  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  205  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  206  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  207  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  208  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  209  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  210  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  211  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  212  	/* 3.3V 4Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  213  	SPINAND_INFO("TC58CVG2S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  214  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xED),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  215  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  216  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  217  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  218  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  219  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  220  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  221  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  222  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  223  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  224  	/* 3.3V 8Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  225  	SPINAND_INFO("TH58CVG3S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  226  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  227  		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  228  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  229  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  230  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  231  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  232  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  233  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  234  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  235  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  236  	/* 1.8V 1Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  237  	SPINAND_INFO("TC58CYG0S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  238  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xD2),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  239  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  240  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  241  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  242  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  243  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  244  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  245  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  246  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  247  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  248  	/* 1.8V 2Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  249  	SPINAND_INFO("TC58CYG1S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  250  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xDB),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  251  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  252  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  253  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  254  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  255  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  256  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  257  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  258  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  259  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  260  	/* 1.8V 4Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  261  	SPINAND_INFO("TC58CYG2S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  262  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xDD),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  263  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  264  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  265  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  266  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  267  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  268  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  269  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  270  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  271  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  272  	/* 1.8V 8Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  273  	SPINAND_INFO("TH58CYG3S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  274  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xD4),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  275  		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  276  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  277  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  278  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  279  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  280  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  281  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  282  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03 @283  		     SPINAND_RX_SAMPLING_DELAY(6)),
dabd64be75ae38b Sridharan S N    2023-06-23  284  	/* 1.8V 1Gb (1st generation) */
dabd64be75ae38b Sridharan S N    2023-06-23 @285  	SPINAND_INFO("TC58NYG0S3HBAI4",
dabd64be75ae38b Sridharan S N    2023-06-23  286  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA1),
dabd64be75ae38b Sridharan S N    2023-06-23  287  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
dabd64be75ae38b Sridharan S N    2023-06-23  288  		     NAND_ECCREQ(8, 512),
dabd64be75ae38b Sridharan S N    2023-06-23  289  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  290  					      &write_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  291  					      &update_cache_variants),
dabd64be75ae38b Sridharan S N    2023-06-23  292  		     0,
dabd64be75ae38b Sridharan S N    2023-06-23  293  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  294  				     tx58cxgxsxraix_ecc_get_status),
dabd64be75ae38b Sridharan S N    2023-06-23  295  	/* 1.8V 4Gb (1st generation) */
dabd64be75ae38b Sridharan S N    2023-06-23  296  	SPINAND_INFO("TH58NYG2S3HBAI4",
dabd64be75ae38b Sridharan S N    2023-06-23  297  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xAC),
dabd64be75ae38b Sridharan S N    2023-06-23  298  		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 2, 1),
dabd64be75ae38b Sridharan S N    2023-06-23  299  		     NAND_ECCREQ(8, 512),
dabd64be75ae38b Sridharan S N    2023-06-23  300  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  301  					      &write_cache_x4_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  302  					      &update_cache_x4_variants),
dabd64be75ae38b Sridharan S N    2023-06-23  303  		     SPINAND_HAS_QE_BIT,
dabd64be75ae38b Sridharan S N    2023-06-23  304  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  305  				     tx58cxgxsxraix_ecc_get_status),
dabd64be75ae38b Sridharan S N    2023-06-23  306  	/* 1.8V 8Gb (1st generation) */
dabd64be75ae38b Sridharan S N    2023-06-23  307  	SPINAND_INFO("TH58NYG3S0HBAI6",
dabd64be75ae38b Sridharan S N    2023-06-23  308  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA3),
dabd64be75ae38b Sridharan S N    2023-06-23  309  		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
dabd64be75ae38b Sridharan S N    2023-06-23  310  		     NAND_ECCREQ(8, 512),
dabd64be75ae38b Sridharan S N    2023-06-23  311  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  312  					      &write_cache_x4_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  313  					      &update_cache_x4_variants),
dabd64be75ae38b Sridharan S N    2023-06-23  314  		     SPINAND_HAS_QE_BIT,
dabd64be75ae38b Sridharan S N    2023-06-23  315  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  316  				     tx58cxgxsxraix_ecc_get_status),
10949af1681d5bb Schrempf Frieder 2018-11-08  317  };
10949af1681d5bb Schrempf Frieder 2018-11-08  318  
10949af1681d5bb Schrempf Frieder 2018-11-08  319  static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops = {
10949af1681d5bb Schrempf Frieder 2018-11-08  320  };
10949af1681d5bb Schrempf Frieder 2018-11-08  321  
10949af1681d5bb Schrempf Frieder 2018-11-08  322  const struct spinand_manufacturer toshiba_spinand_manufacturer = {
10949af1681d5bb Schrempf Frieder 2018-11-08  323  	.id = SPINAND_MFR_TOSHIBA,
10949af1681d5bb Schrempf Frieder 2018-11-08  324  	.name = "Toshiba",
f1541773af49ecd Chuanhong Guo    2020-02-08  325  	.chips = toshiba_spinand_table,
f1541773af49ecd Chuanhong Guo    2020-02-08  326  	.nchips = ARRAY_SIZE(toshiba_spinand_table),
10949af1681d5bb Schrempf Frieder 2018-11-08  327  	.ops = &toshiba_spinand_manuf_ops,
10949af1681d5bb Schrempf Frieder 2018-11-08 @328  };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
