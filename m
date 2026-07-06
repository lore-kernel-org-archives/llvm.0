Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE202E7631;
	Mon,  6 Jul 2026 06:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317792; cv=none; b=YFPUVfrFKzn4XXJkCx9iAWw0i2jfnHmYh+8nv84jh2I/+lVJMrE/o2j7Xglr5/qESH8cxaNTOKlBrlwDyUGyy17gxDSWHMHBbx0skfxv5NYJAm+zrcBg53eDOYZrsVsni4z2C42+SEr4ik6J7GFjlgnKNoZIJdebcNUI5GuaGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317792; c=relaxed/simple;
	bh=tWHXrrqFFUnE4OkZ1yowgyom7dwOzPnCZ4Ds/tYatOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NMDTwP72iuNdK1VbRtigGYqdUf9byaLUOXMM7t/Aq/f3JTrzTvdnpDcT4FhrcpPukWb8hwLyknTQOk/WaW8mQ66db8jS8Alk1wzWixYPonNAkcton0GvXUF9wwMFpCQgHd0Q29KvztCIKWx1u7LhgtEFb8gm9IFh7irG3Nl6+I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXiFFb0q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXiFFb0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783317791; x=1814853791;
  h=date:from:to:cc:subject:message-id;
  bh=tWHXrrqFFUnE4OkZ1yowgyom7dwOzPnCZ4Ds/tYatOc=;
  b=VXiFFb0q6pWyNbRXIEHQXgaxKpuk7Pqm6hFEaTxI4C+RBdy1uNM2I59U
   SJ5BYtMxpEkJzYM+HDohM+rCiKLVRI2LydSjUmVLz6zXv/gKryfLPihuA
   rJJ5VSVfiYac4MOi2i1DM1P+zHXQaW53fGWOopkY1yeFO6CjKUjqNmRCG
   Wfv1AGucAhOeEve1JTHmCtvmHQ3BeF9MPzDg3oyWRl4U3KyNHMjQ557PR
   EADCjOoQw1cBS/FJg1vqSG/Zq5DqM7rnAVpK+S6wK8J6p1HPSXQZVIBc9
   ntvToL11xyRrMtyIIwsFfT9ALnPjVDQ+llZSMcHXl07O4YB5mD3Zldwu2
   A==;
X-CSE-ConnectionGUID: MFbnr3fdRsyk5DM1P+vafg==
X-CSE-MsgGUID: SQ87SzHGQaKqXyaaQiw3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87623145"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87623145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 23:03:10 -0700
X-CSE-ConnectionGUID: U3j5VZzHQ4+0pObMsDO4sQ==
X-CSE-MsgGUID: cMIUyxukQq2Xj6Iw9MEuHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253745011"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2026 23:03:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgcQ5-00000000E7t-0Dsb;
	Mon, 06 Jul 2026 06:03:05 +0000
Date: Mon, 06 Jul 2026 14:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:drivers-for-7.3 3/12]
 drivers/soc/qcom/socinfo.c:428:4: error: use of undeclared identifier
 'QCOM_ID_SDM850'
Message-ID: <202607061318.4kbb1336-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.3
head:   889ee1f4f6633f8300500b529518d30bec282762
commit: 743af1d6a8b4bfa62dd01b5c2d81b1c62ea597f7 [3/12] soc: qcom: socinfo: Add SoC ID for SDM850
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260706/202607061318.4kbb1336-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061318.4kbb1336-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061318.4kbb1336-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/socinfo.c:428:4: error: use of undeclared identifier 'QCOM_ID_SDM850'
     428 |         { qcom_board_id(SDM850) },
         |           ^
   drivers/soc/qcom/socinfo.c:25:27: note: expanded from macro 'qcom_board_id'
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^
   <scratch space>:80:1: note: expanded from here
      80 | QCOM_ID_SDM850
         | ^
>> drivers/soc/qcom/socinfo.c:566:22: error: invalid application of 'sizeof' to an incomplete type 'const struct soc_id[]'
     566 |         for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   2 errors generated.


vim +/QCOM_ID_SDM850 +428 drivers/soc/qcom/socinfo.c

   253	
   254	static const struct soc_id soc_id[] = {
   255		{ qcom_board_id(MSM8260) },
   256		{ qcom_board_id(MSM8660) },
   257		{ qcom_board_id(APQ8060) },
   258		{ qcom_board_id(MSM8960) },
   259		{ qcom_board_id(APQ8064) },
   260		{ qcom_board_id(MSM8930) },
   261		{ qcom_board_id(MSM8630) },
   262		{ qcom_board_id(MSM8230) },
   263		{ qcom_board_id(APQ8030) },
   264		{ qcom_board_id(MSM8627) },
   265		{ qcom_board_id(MSM8227) },
   266		{ qcom_board_id(MSM8660A) },
   267		{ qcom_board_id(MSM8260A) },
   268		{ qcom_board_id(APQ8060A) },
   269		{ qcom_board_id(MSM8974) },
   270		{ qcom_board_id(MSM8225) },
   271		{ qcom_board_id(MSM8625) },
   272		{ qcom_board_id(MPQ8064) },
   273		{ qcom_board_id(MSM8960AB) },
   274		{ qcom_board_id(APQ8060AB) },
   275		{ qcom_board_id(MSM8260AB) },
   276		{ qcom_board_id(MSM8660AB) },
   277		{ qcom_board_id(MSM8930AA) },
   278		{ qcom_board_id(MSM8630AA) },
   279		{ qcom_board_id(MSM8230AA) },
   280		{ qcom_board_id(MSM8626) },
   281		{ qcom_board_id(MSM8610) },
   282		{ qcom_board_id(APQ8064AB) },
   283		{ qcom_board_id(MSM8930AB) },
   284		{ qcom_board_id(MSM8630AB) },
   285		{ qcom_board_id(MSM8230AB) },
   286		{ qcom_board_id(APQ8030AB) },
   287		{ qcom_board_id(MSM8226) },
   288		{ qcom_board_id(MSM8526) },
   289		{ qcom_board_id(APQ8030AA) },
   290		{ qcom_board_id(MSM8110) },
   291		{ qcom_board_id(MSM8210) },
   292		{ qcom_board_id(MSM8810) },
   293		{ qcom_board_id(MSM8212) },
   294		{ qcom_board_id(MSM8612) },
   295		{ qcom_board_id(MSM8112) },
   296		{ qcom_board_id(MSM8125) },
   297		{ qcom_board_id(MSM8225Q) },
   298		{ qcom_board_id(MSM8625Q) },
   299		{ qcom_board_id(MSM8125Q) },
   300		{ qcom_board_id(APQ8064AA) },
   301		{ qcom_board_id(APQ8084) },
   302		{ qcom_board_id(MSM8130) },
   303		{ qcom_board_id(MSM8130AA) },
   304		{ qcom_board_id(MSM8130AB) },
   305		{ qcom_board_id(MSM8627AA) },
   306		{ qcom_board_id(MSM8227AA) },
   307		{ qcom_board_id(APQ8074) },
   308		{ qcom_board_id(MSM8274) },
   309		{ qcom_board_id(MSM8674) },
   310		{ qcom_board_id(MDM9635) },
   311		{ qcom_board_id_named(MSM8974PRO_AC, "MSM8974PRO-AC") },
   312		{ qcom_board_id(MSM8126) },
   313		{ qcom_board_id(APQ8026) },
   314		{ qcom_board_id(MSM8926) },
   315		{ qcom_board_id(IPQ8062) },
   316		{ qcom_board_id(IPQ8064) },
   317		{ qcom_board_id(IPQ8066) },
   318		{ qcom_board_id(IPQ8068) },
   319		{ qcom_board_id(MSM8326) },
   320		{ qcom_board_id(MSM8916) },
   321		{ qcom_board_id(MSM8994) },
   322		{ qcom_board_id_named(APQ8074PRO_AA, "APQ8074PRO-AA") },
   323		{ qcom_board_id_named(APQ8074PRO_AB, "APQ8074PRO-AB") },
   324		{ qcom_board_id_named(APQ8074PRO_AC, "APQ8074PRO-AC") },
   325		{ qcom_board_id_named(MSM8274PRO_AA, "MSM8274PRO-AA") },
   326		{ qcom_board_id_named(MSM8274PRO_AB, "MSM8274PRO-AB") },
   327		{ qcom_board_id_named(MSM8274PRO_AC, "MSM8274PRO-AC") },
   328		{ qcom_board_id_named(MSM8674PRO_AA, "MSM8674PRO-AA") },
   329		{ qcom_board_id_named(MSM8674PRO_AB, "MSM8674PRO-AB") },
   330		{ qcom_board_id_named(MSM8674PRO_AC, "MSM8674PRO-AC") },
   331		{ qcom_board_id_named(MSM8974PRO_AA, "MSM8974PRO-AA") },
   332		{ qcom_board_id_named(MSM8974PRO_AB, "MSM8974PRO-AB") },
   333		{ qcom_board_id(APQ8028) },
   334		{ qcom_board_id(MSM8128) },
   335		{ qcom_board_id(MSM8228) },
   336		{ qcom_board_id(MSM8528) },
   337		{ qcom_board_id(MSM8628) },
   338		{ qcom_board_id(MSM8928) },
   339		{ qcom_board_id(MSM8510) },
   340		{ qcom_board_id(MSM8512) },
   341		{ qcom_board_id(MSM8936) },
   342		{ qcom_board_id(MDM9640) },
   343		{ qcom_board_id(MSM8939) },
   344		{ qcom_board_id(APQ8036) },
   345		{ qcom_board_id(APQ8039) },
   346		{ qcom_board_id(MSM8236) },
   347		{ qcom_board_id(MSM8636) },
   348		{ qcom_board_id(MSM8909) },
   349		{ qcom_board_id(MSM8996) },
   350		{ qcom_board_id(APQ8016) },
   351		{ qcom_board_id(MSM8216) },
   352		{ qcom_board_id(MSM8116) },
   353		{ qcom_board_id(MSM8616) },
   354		{ qcom_board_id(MSM8992) },
   355		{ qcom_board_id(APQ8092) },
   356		{ qcom_board_id(APQ8094) },
   357		{ qcom_board_id(MSM8209) },
   358		{ qcom_board_id(MSM8208) },
   359		{ qcom_board_id(MDM9209) },
   360		{ qcom_board_id(MDM9309) },
   361		{ qcom_board_id(MDM9609) },
   362		{ qcom_board_id(MSM8239) },
   363		{ qcom_board_id(MSM8952) },
   364		{ qcom_board_id(APQ8009) },
   365		{ qcom_board_id(MSM8956) },
   366		{ qcom_board_id(MSM8929) },
   367		{ qcom_board_id(MSM8629) },
   368		{ qcom_board_id(MSM8229) },
   369		{ qcom_board_id(APQ8029) },
   370		{ qcom_board_id(APQ8056) },
   371		{ qcom_board_id(MSM8609) },
   372		{ qcom_board_id(APQ8076) },
   373		{ qcom_board_id(MSM8976) },
   374		{ qcom_board_id(IPQ8065) },
   375		{ qcom_board_id(IPQ8069) },
   376		{ qcom_board_id(MDM9650) },
   377		{ qcom_board_id(MDM9655) },
   378		{ qcom_board_id(MDM9250) },
   379		{ qcom_board_id(MDM9255) },
   380		{ qcom_board_id(MDM9350) },
   381		{ qcom_board_id(APQ8052) },
   382		{ qcom_board_id(MDM9607) },
   383		{ qcom_board_id(APQ8096) },
   384		{ qcom_board_id(MSM8998) },
   385		{ qcom_board_id(MSM8953) },
   386		{ qcom_board_id(MSM8937) },
   387		{ qcom_board_id(APQ8037) },
   388		{ qcom_board_id(MDM8207) },
   389		{ qcom_board_id(MDM9207) },
   390		{ qcom_board_id(MDM9307) },
   391		{ qcom_board_id(MDM9628) },
   392		{ qcom_board_id(MSM8909W) },
   393		{ qcom_board_id(APQ8009W) },
   394		{ qcom_board_id(MSM8996L) },
   395		{ qcom_board_id(MSM8917) },
   396		{ qcom_board_id(APQ8053) },
   397		{ qcom_board_id(MSM8996SG) },
   398		{ qcom_board_id(APQ8017) },
   399		{ qcom_board_id(MSM8217) },
   400		{ qcom_board_id(MSM8617) },
   401		{ qcom_board_id(MSM8996AU) },
   402		{ qcom_board_id(APQ8096AU) },
   403		{ qcom_board_id(APQ8096SG) },
   404		{ qcom_board_id(MSM8940) },
   405		{ qcom_board_id(SDX201) },
   406		{ qcom_board_id(SDM660) },
   407		{ qcom_board_id(SDM630) },
   408		{ qcom_board_id(APQ8098) },
   409		{ qcom_board_id(MSM8920) },
   410		{ qcom_board_id(SDM845) },
   411		{ qcom_board_id(MDM9206) },
   412		{ qcom_board_id(IPQ8074) },
   413		{ qcom_board_id(SDA660) },
   414		{ qcom_board_id(SDM658) },
   415		{ qcom_board_id(SDA658) },
   416		{ qcom_board_id(SDA630) },
   417		{ qcom_board_id(MSM8905) },
   418		{ qcom_board_id(SDX202) },
   419		{ qcom_board_id(SDM670) },
   420		{ qcom_board_id(SDM450) },
   421		{ qcom_board_id(SM8150) },
   422		{ qcom_board_id(SDA845) },
   423		{ qcom_board_id(IPQ8072) },
   424		{ qcom_board_id(IPQ8076) },
   425		{ qcom_board_id(IPQ8078) },
   426		{ qcom_board_id(SDM636) },
   427		{ qcom_board_id(SDA636) },
 > 428		{ qcom_board_id(SDM850) },
   429		{ qcom_board_id(SDM632) },
   430		{ qcom_board_id(SDA632) },
   431		{ qcom_board_id(SDA450) },
   432		{ qcom_board_id(SDM439) },
   433		{ qcom_board_id(SDM429) },
   434		{ qcom_board_id(SM8250) },
   435		{ qcom_board_id(SA8155) },
   436		{ qcom_board_id(SDA439) },
   437		{ qcom_board_id(SDA429) },
   438		{ qcom_board_id(SM7150) },
   439		{ qcom_board_id(SM7150P) },
   440		{ qcom_board_id(IPQ8070) },
   441		{ qcom_board_id(IPQ8071) },
   442		{ qcom_board_id(QM215) },
   443		{ qcom_board_id(IPQ8072A) },
   444		{ qcom_board_id(IPQ8074A) },
   445		{ qcom_board_id(IPQ8076A) },
   446		{ qcom_board_id(IPQ8078A) },
   447		{ qcom_board_id(SM6125) },
   448		{ qcom_board_id(IPQ8070A) },
   449		{ qcom_board_id(IPQ8071A) },
   450		{ qcom_board_id(IPQ8172) },
   451		{ qcom_board_id(IPQ8173) },
   452		{ qcom_board_id(IPQ8174) },
   453		{ qcom_board_id(IPQ6018) },
   454		{ qcom_board_id(IPQ6028) },
   455		{ qcom_board_id(SDM429W) },
   456		{ qcom_board_id(SM4250) },
   457		{ qcom_board_id(IPQ6000) },
   458		{ qcom_board_id(IPQ6010) },
   459		{ qcom_board_id(SC7180) },
   460		{ qcom_board_id(SM6350) },
   461		{ qcom_board_id(QCM2150) },
   462		{ qcom_board_id(SDA429W) },
   463		{ qcom_board_id(SM8350) },
   464		{ qcom_board_id(QCM2290) },
   465		{ qcom_board_id(SM7125) },
   466		{ qcom_board_id(SM6115) },
   467		{ qcom_board_id(IPQ5010) },
   468		{ qcom_board_id(IPQ5018) },
   469		{ qcom_board_id(IPQ5028) },
   470		{ qcom_board_id(SC8280XP) },
   471		{ qcom_board_id(IPQ6005) },
   472		{ qcom_board_id(QRB5165) },
   473		{ qcom_board_id(SM8450) },
   474		{ qcom_board_id(SM7225) },
   475		{ qcom_board_id(SA8295P) },
   476		{ qcom_board_id(SA8540P) },
   477		{ qcom_board_id(QCM4290) },
   478		{ qcom_board_id(QCS4290) },
   479		{ qcom_board_id(SM7325) },
   480		{ qcom_board_id_named(SM8450_2, "SM8450") },
   481		{ qcom_board_id_named(SM8450_3, "SM8450") },
   482		{ qcom_board_id(SC7280) },
   483		{ qcom_board_id(SC7180P) },
   484		{ qcom_board_id(QCM6490) },
   485		{ qcom_board_id(QCS6490) },
   486		{ qcom_board_id(SM7325P) },
   487		{ qcom_board_id(IPQ5000) },
   488		{ qcom_board_id(IPQ0509) },
   489		{ qcom_board_id(IPQ0518) },
   490		{ qcom_board_id(SM7450) },
   491		{ qcom_board_id(SM6375) },
   492		{ qcom_board_id(IPQ9514) },
   493		{ qcom_board_id(IPQ9550) },
   494		{ qcom_board_id(IPQ9554) },
   495		{ qcom_board_id(IPQ9570) },
   496		{ qcom_board_id(IPQ9574) },
   497		{ qcom_board_id(SM8550) },
   498		{ qcom_board_id(IPQ5016) },
   499		{ qcom_board_id(IPQ9510) },
   500		{ qcom_board_id(QRB4210) },
   501		{ qcom_board_id(QRB2210) },
   502		{ qcom_board_id(SAR2130P) },
   503		{ qcom_board_id(SM8475) },
   504		{ qcom_board_id(SM8475P) },
   505		{ qcom_board_id(SA8255P) },
   506		{ qcom_board_id(SA8650P) },
   507		{ qcom_board_id(SA8775P) },
   508		{ qcom_board_id(QRU1000) },
   509		{ qcom_board_id(SM8475_2) },
   510		{ qcom_board_id(QDU1000) },
   511		{ qcom_board_id(SM7450P) },
   512		{ qcom_board_id(X1E80100) },
   513		{ qcom_board_id(SM8650) },
   514		{ qcom_board_id(SM4450) },
   515		{ qcom_board_id(SAR1130P) },
   516		{ qcom_board_id(QDU1010) },
   517		{ qcom_board_id(QRU1032) },
   518		{ qcom_board_id(QRU1052) },
   519		{ qcom_board_id(QRU1062) },
   520		{ qcom_board_id(IPQ5332) },
   521		{ qcom_board_id(IPQ5322) },
   522		{ qcom_board_id(IPQ5312) },
   523		{ qcom_board_id(IPQ5302) },
   524		{ qcom_board_id(QCS8550) },
   525		{ qcom_board_id(QCM8550) },
   526		{ qcom_board_id(SM8750)  },
   527		{ qcom_board_id(IPQ5300) },
   528		{ qcom_board_id(SM7635) },
   529		{ qcom_board_id(SM6650) },
   530		{ qcom_board_id(SM6650P) },
   531		{ qcom_board_id(IPQ5321) },
   532		{ qcom_board_id(IPQ5424) },
   533		{ qcom_board_id(QCM6690) },
   534		{ qcom_board_id(QCS6690) },
   535		{ qcom_board_id(SM7750) },
   536		{ qcom_board_id(SM8850) },
   537		{ qcom_board_id(IPQ5404) },
   538		{ qcom_board_id(QCS9100) },
   539		{ qcom_board_id(QCS8300) },
   540		{ qcom_board_id(QCS8275) },
   541		{ qcom_board_id(QCS9075) },
   542		{ qcom_board_id(QCS615) },
   543		{ qcom_board_id(SA8797P) },
   544		{ qcom_board_id(CQ7790M) },
   545		{ qcom_board_id(CQ7790S) },
   546		{ qcom_board_id(CQ2390M) },
   547		{ qcom_board_id(CQ2390S) },
   548		{ qcom_board_id(IQ2390S) },
   549		{ qcom_board_id(IPQ5200) },
   550		{ qcom_board_id(IPQ5210) },
   551		{ qcom_board_id(QCF2200) },
   552		{ qcom_board_id(QCF3200) },
   553		{ qcom_board_id(QCF3210) },
   554		{ qcom_board_id(IPQ9620) },
   555		{ qcom_board_id(IPQ9650) },
   556		{ qcom_board_id(IPQ9610) },
   557		{ qcom_board_id(IPQ9630) },
   558		{ qcom_board_id(IPQ9640) },
   559		{ qcom_board_id(IPQ9670) },
   560	};
   561	
   562	static const char *socinfo_machine(struct device *dev, unsigned int id)
   563	{
   564		int idx;
   565	
 > 566		for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
   567			if (soc_id[idx].id == id)
   568				return soc_id[idx].name;
   569		}
   570	
   571		return NULL;
   572	}
   573	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
