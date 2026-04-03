Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDED3AD539;
	Fri,  3 Apr 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223519; cv=none; b=fZEvq1F91n2FaGieG9oCJ8fijIBjMA8XdM8zVJ7YsQPXfX4bN5sR3WZ+43bR4iFWrefSqT3P5vHK/tT8OUdLneRJpaIIuUy0XQyVzoDaAzP5iWNxprPOj6ZSDUeLp9zJu3zIk735FY4dh54sDZ7q6i23gzLRdjGRsZtK9L2GOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223519; c=relaxed/simple;
	bh=AwOA4SLRxZRisk1NDPzgFXl9cwWqTfVaYRf2Q2i40g0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iysh5fTaVrHoE2EA6jEpD08R0QjlnmEEW09CoJgLFADOTPPFssJEe+DQMk/W3QFSP587giEx5GIbTpYC7owYKmo6cGH9qxny9M4gOCckFJFlNBsE1dEald+Lx/QcP7Ieq3y7NHNcysotDKbmZK7vTPTea8vwBoJ2H/PpK3/DWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwRVa8gE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwRVa8gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775223517; x=1806759517;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AwOA4SLRxZRisk1NDPzgFXl9cwWqTfVaYRf2Q2i40g0=;
  b=SwRVa8gE8RrrnWRL23Mlof6il78o6HToUSWt4Z4FuVWiKPqQIviCOtV4
   +ggybPEMLvMGjYC0NBW8+mVklIqFyV0318TpSmrZg/p8rR3l6lXDvbAfj
   Em16hf9Cqcsgf3g7uGsogwbkxwm6GvRmJxMkQNbsDvoq2q+2cXKGV/KqM
   N8oT+DyCQAKFUHeCNbrH+rilrFN82FmOHt5ouBFlG9V3ljXXqkif63DMI
   GUFgq6XFtSFsD6bHXy1SKd004YoO4O5cRtD9kbMG0Kr9sa6mHkp515U+v
   wsj229rxsDj8FEhJu1czjwhJ5Y9jxGf6X7Crh8R9PPcwx/xJHMUG22oe8
   A==;
X-CSE-ConnectionGUID: WuVgYYlXRUOOMohRZkU+UQ==
X-CSE-MsgGUID: QE3ZCjQ7SLKeSI8nBiE4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="63834064"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="63834064"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 06:38:37 -0700
X-CSE-ConnectionGUID: 8ZosNzQ5Rc+K9dhmTDnJCw==
X-CSE-MsgGUID: HrPefFyFRrqRqL3YvD0pCA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 03 Apr 2026 06:38:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8ejJ-000000009JF-0gPc;
	Fri, 03 Apr 2026 13:38:33 +0000
Date: Fri, 03 Apr 2026 15:37:50 +0200
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Makefile:2254: *** extraneous 'endif'.  Stop.
Message-ID: <202604031539.Wm2bolgE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuil=
d-move-vmlinux-a-build-rule-to-scripts-Makefile-vmlinux_a/20260403-055837
head:   d1f7b869b59d7f31d1d0ab5021809fcc11b69ca7
commit: d1f7b869b59d7f31d1d0ab5021809fcc11b69ca7 kbuild: distributed build =
support for Clang ThinLTO
date:   16 hours ago
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260403/202604031539.Wm2bolgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031539.Wm2bolgE-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.


vim +/endif +2254 Makefile

^1da177e4c3f41 Linus Torvalds  2005-04-16  2251 =20
46b7c49254f89d SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA  2020-03-01  2252) endif=
 # config-build
2042b5486bd311 Masahiro Yamada 2019-08-11  2253  endif # mixed-build
688931a5ad4e55 Masahiro Yamada 2019-03-19 @2254  endif # need-sub-make
^1da177e4c3f41 Linus Torvalds  2005-04-16  2255 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
