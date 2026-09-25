Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9744AAC5E;
	Fri, 25 Sep 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347424; cv=none; b=JzqXapLDwbbo3nlK4LZFuvpv7bPmeu5eNhT2ZdikfRQNVQvNKmaYcMiSsX67IDsxUO2/CZ3OfaDNH3qyqURjdOjN1TAcdGM1r7CVzzuTWaI+TS5IUsUh2w7G04AKI6d5ptI5pob3NdGcC9pfOfXII19zvEg5cefte36lEo+KtV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347424; c=relaxed/simple;
	bh=9HM4UsWQBGK/mbQbcbu9DPBCCwPgL2hX3Fa5hdPaRtc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u1JVP4PllgK7dOMSklzQc/J/y2sh7EjNWrXqW2+vIWH24Hy1XMZglWIpdl/6GX9NISsPt/me6Xs1AmaizwJe6o284Kk4GQowO7zODKf//LI7XS62H2V4C+KpCG/EjLDeQhBklCDmOSLMRYPuFrLhV6JooO0GEMFOjOpFHdFKsk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DI51xN0/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DI51xN0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790347417; x=1821883417;
  h=date:from:to:cc:subject:message-id;
  bh=9HM4UsWQBGK/mbQbcbu9DPBCCwPgL2hX3Fa5hdPaRtc=;
  b=DI51xN0/fex+ooPzN6//P2o6USowzM8dzT7MsufkzAK4xUiZGailm/8/
   7NDS5rSnU5EcQfrpIgYp+vXGq8GfyjTxtf0AeHXBuB/05J96q9AhvIVvG
   3YzTkVHeXQWyH4wSc+3AhCQbCWPDkfgUHVz5dBzrWVlqlrMkIHzT5X/pt
   l8YlmKmf8r6Ycb/5b8IUy/Q6JlzOk5dFVyqtsk4zEZa1Nn8LMeE/QRhyX
   CRt7tv7L82Egg7a0JQ8EDiLd4gVVqRze1Al5xfhbhygqtea5jNiJpsbwp
   aXoBlzOwpu75nJIZSUL2heMVNc2/eVx1INPfXVs4inX/FGyETAAd0XTxE
   Q==;
X-CSE-ConnectionGUID: 9/bXetgJRFCnT6fs4GhKKw==
X-CSE-MsgGUID: lKZUnesGTliy0859Gb1YLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116663355"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116663355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:43:29 -0700
X-CSE-ConnectionGUID: KxlbPD7jSoi0kl4ym0haIA==
X-CSE-MsgGUID: 3iUsNH4sT5y/0kKEbNDEcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="303858751"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 07:43:27 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA792-00000000Kls-3zu4;
	Fri, 25 Sep 2026 14:43:24 +0000
Date: Fri, 25 Sep 2026 22:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:drivers-for-7.4 34/34]
 drivers/soc/qcom/socinfo.c:545:4: error: use of undeclared identifier
 'QCOM_ID_SM8975'
Message-ID: <202609252228.RuCRTT9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.4
head:   f255e2055701285d6b5f11d2a6facc6614c51ed7
commit: f255e2055701285d6b5f11d2a6facc6614c51ed7 [34/34] soc: qcom: socinfo: Add SM8975 SoC ID
config: arm-randconfig-1003-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252228.RuCRTT9k-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252228.RuCRTT9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252228.RuCRTT9k-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/socinfo.c:453:4: error: use of undeclared identifier 'QCOM_ID_SM7250'
     453 |         { qcom_board_id(SM7250) },
         |           ^
   drivers/soc/qcom/socinfo.c:25:27: note: expanded from macro 'qcom_board_id'
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^
   <scratch space>:216:1: note: expanded from here
     216 | QCOM_ID_SM7250
         | ^
>> drivers/soc/qcom/socinfo.c:545:4: error: use of undeclared identifier 'QCOM_ID_SM8975'
     545 |         { qcom_board_id(SM8975) },
         |           ^
   drivers/soc/qcom/socinfo.c:25:27: note: expanded from macro 'qcom_board_id'
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^
   <scratch space>:106:1: note: expanded from here
     106 | QCOM_ID_SM8975
         | ^
   drivers/soc/qcom/socinfo.c:568:22: error: invalid application of 'sizeof' to an incomplete type 'const struct soc_id[]'
     568 |         for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   3 errors generated.


vim +/QCOM_ID_SM8975 +545 drivers/soc/qcom/socinfo.c

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
   428		{ qcom_board_id(SDM850) },
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
 > 453		{ qcom_board_id(SM7250) },
   454		{ qcom_board_id(IPQ6018) },
   455		{ qcom_board_id(IPQ6028) },
   456		{ qcom_board_id(SDM429W) },
   457		{ qcom_board_id(SM4250) },
   458		{ qcom_board_id(IPQ6000) },
   459		{ qcom_board_id(IPQ6010) },
   460		{ qcom_board_id(SC7180) },
   461		{ qcom_board_id(SM6350) },
   462		{ qcom_board_id(QCM2150) },
   463		{ qcom_board_id(SDA429W) },
   464		{ qcom_board_id(SM8350) },
   465		{ qcom_board_id(QCM2290) },
   466		{ qcom_board_id(SM7125) },
   467		{ qcom_board_id(SM6115) },
   468		{ qcom_board_id(IPQ5010) },
   469		{ qcom_board_id(IPQ5018) },
   470		{ qcom_board_id(IPQ5028) },
   471		{ qcom_board_id(SC8280XP) },
   472		{ qcom_board_id(IPQ6005) },
   473		{ qcom_board_id(QRB5165) },
   474		{ qcom_board_id(SM8450) },
   475		{ qcom_board_id(SM7225) },
   476		{ qcom_board_id(SA8295P) },
   477		{ qcom_board_id(SA8540P) },
   478		{ qcom_board_id(QCM4290) },
   479		{ qcom_board_id(QCS4290) },
   480		{ qcom_board_id(SM7325) },
   481		{ qcom_board_id_named(SM8450_2, "SM8450") },
   482		{ qcom_board_id_named(SM8450_3, "SM8450") },
   483		{ qcom_board_id(SC7280) },
   484		{ qcom_board_id(SC7180P) },
   485		{ qcom_board_id(QCM6490) },
   486		{ qcom_board_id(QCS6490) },
   487		{ qcom_board_id(SM7325P) },
   488		{ qcom_board_id(IPQ5000) },
   489		{ qcom_board_id(IPQ0509) },
   490		{ qcom_board_id(IPQ0518) },
   491		{ qcom_board_id(SM7450) },
   492		{ qcom_board_id(SM6375) },
   493		{ qcom_board_id(IPQ9514) },
   494		{ qcom_board_id(IPQ9550) },
   495		{ qcom_board_id(IPQ9554) },
   496		{ qcom_board_id(IPQ9570) },
   497		{ qcom_board_id(IPQ9574) },
   498		{ qcom_board_id(SM8550) },
   499		{ qcom_board_id(IPQ5016) },
   500		{ qcom_board_id(IPQ9510) },
   501		{ qcom_board_id(QRB4210) },
   502		{ qcom_board_id(QRB2210) },
   503		{ qcom_board_id(SAR2130P) },
   504		{ qcom_board_id(SM8475) },
   505		{ qcom_board_id(SM8475P) },
   506		{ qcom_board_id(SA8255P) },
   507		{ qcom_board_id(SA8650P) },
   508		{ qcom_board_id(SA8775P) },
   509		{ qcom_board_id(QRU1000) },
   510		{ qcom_board_id(SM8475_2) },
   511		{ qcom_board_id(QDU1000) },
   512		{ qcom_board_id(SM7450P) },
   513		{ qcom_board_id(X1E80100) },
   514		{ qcom_board_id(SM8650) },
   515		{ qcom_board_id(SM4450) },
   516		{ qcom_board_id(SAR1130P) },
   517		{ qcom_board_id(QDU1010) },
   518		{ qcom_board_id(QRU1032) },
   519		{ qcom_board_id(QRU1052) },
   520		{ qcom_board_id(QRU1062) },
   521		{ qcom_board_id(IPQ5332) },
   522		{ qcom_board_id(IPQ5322) },
   523		{ qcom_board_id(IPQ5312) },
   524		{ qcom_board_id(IPQ5302) },
   525		{ qcom_board_id(QCS8550) },
   526		{ qcom_board_id(QCM8550) },
   527		{ qcom_board_id(SM8750)  },
   528		{ qcom_board_id(IPQ5300) },
   529		{ qcom_board_id(SM7635) },
   530		{ qcom_board_id(SM6650) },
   531		{ qcom_board_id(SM6650P) },
   532		{ qcom_board_id(IPQ5321) },
   533		{ qcom_board_id(IPQ5424) },
   534		{ qcom_board_id(QCM6690) },
   535		{ qcom_board_id(QCS6690) },
   536		{ qcom_board_id(SM7750) },
   537		{ qcom_board_id(SM8850) },
   538		{ qcom_board_id(IPQ5404) },
   539		{ qcom_board_id(QCS9100) },
   540		{ qcom_board_id(QCS8300) },
   541		{ qcom_board_id(QCS8275) },
   542		{ qcom_board_id(QCS9075) },
   543		{ qcom_board_id(QCS615) },
   544		{ qcom_board_id(SA8797P) },
 > 545		{ qcom_board_id(SM8975) },
   546		{ qcom_board_id(CQ7790M) },
   547		{ qcom_board_id(CQ7790S) },
   548		{ qcom_board_id(CQ2390M) },
   549		{ qcom_board_id(CQ2390S) },
   550		{ qcom_board_id(IQ2390S) },
   551		{ qcom_board_id(IPQ5200) },
   552		{ qcom_board_id(IPQ5210) },
   553		{ qcom_board_id(QCF2200) },
   554		{ qcom_board_id(QCF3200) },
   555		{ qcom_board_id(QCF3210) },
   556		{ qcom_board_id(IPQ9620) },
   557		{ qcom_board_id(IPQ9650) },
   558		{ qcom_board_id(IPQ9610) },
   559		{ qcom_board_id(IPQ9630) },
   560		{ qcom_board_id(IPQ9640) },
   561		{ qcom_board_id(IPQ9670) },
   562	};
   563	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
