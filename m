Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890C344DA9;
	Thu,  7 May 2026 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778189206; cv=none; b=GEo8G/UeovdFXtu7i6yEjXjTiDfUJ0o3P4ulB3c9w6J23hB1T5B/7uU17Ue+6WQ9cKr3yABqvo/NJmwOVyeKz0dlbL2xQ3IUKWcTiW+SGj/nlUc1iwlLJFkYUG2jrx2vkpMarO83ZmRNXP7i5fUX+w9qp6qBHYHdSV2EsN89ccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778189206; c=relaxed/simple;
	bh=t0Uakq/a0DnCKQo9NghMYfrsU0uJ8KzyaF5E5MjtFto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bh6JgGB7N7q6SgU+Th+WiAwBeDG0TG4+xhH5CTAJjWCZrTXTcTh2L8XQKPyh9f2Ol7B8YHKxCOGH796OPiTG+Bf+4hhZ2pzAaLMZTOVURiHR6RXgnjjxMPTh45Z5rDm5lUkksG6NOftvJB6pdNgQOWCDBFeF9SeUm59KO3LMQRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKI1m5SS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKI1m5SS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778189203; x=1809725203;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t0Uakq/a0DnCKQo9NghMYfrsU0uJ8KzyaF5E5MjtFto=;
  b=bKI1m5SShHKrGZMUpWv/PBpajq3K3RsVXPgG3NF9aoNmjdBu21ErhUz8
   KAR1PYsikps9Y6PpHbFmPFIoQQAH74X19VtJZpefc9Q+ZWzCET+wRmARr
   /TXBWXakD4mJlxEz5LDzau0JVgd0gTP61iI+q87Ne79/2uV/J3iTA9hcm
   ovqD2DRbV6n9FMiRV5gYblnyCbex3uBzys0/kyziqDVZrGRFphHWymdru
   p5lpRuMDAgTlXuKxtv1WeCX8bKC/sb2+0YEWjHvv8pTKBfWQ7J5YZqGio
   WGP7KCcah5Npl2Xbu21jV4SXMgZWqtfkmIzl2oOAwl0UF151jUtNZ+/QA
   g==;
X-CSE-ConnectionGUID: mDnJoonWSSmjuqasDI8yzA==
X-CSE-MsgGUID: cg2Wim3fRlq792ijp4qtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90613778"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="90613778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 14:26:41 -0700
X-CSE-ConnectionGUID: 4o5vx8GNRJGrxACa9ru9EA==
X-CSE-MsgGUID: SvYXRR8mRkS13285h7s34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="232033844"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2026 14:26:39 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL6Ev-000000000SJ-0WHZ;
	Thu, 07 May 2026 21:26:37 +0000
Date: Fri, 08 May 2026 05:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:dev/selfref 16/33] .vmlinux.export.c:26111:2:
 error: embedding a #include directive within macro arguments is not supported
Message-ID: <202605080531.oz3J0QI0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/nbdd0121/linux dev/selfref
head:   203279ba2de08693b2c4bdf039f8f05c73065849
commit: c644329589488c860f84c92ee6318e7ade37dddd [16/33] rust: pin-init: in=
ternal: make `make_closure` inherent methods
config: arm64-randconfig-003-20260507 (https://download.01.org/0day-ci/arch=
ive/20260508/202605080531.oz3J0QI0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260508/202605080531.oz3J0QI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080531.oz3J0QI0-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                       ^
   .vmlinux.export.c:11731:521: warning: null character ignored [-Wnull-cha=
racter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
    ^
   .vmlinux.export.c:11731:522: warning: null character ignored [-Wnull-cha=
racter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
            ^
   .vmlinux.export.c:11731:523: warning: null character ignored [-Wnull-cha=
racter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                    ^
   .vmlinux.export.c:11731:524: warning: null character ignored [-Wnull-cha=
racter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                            ^
   .vmlinux.export.c:11731:525: warning: null character ignored [-Wnull-cha=
racter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                    ^
   .vmlinux.export.c:11731:1025: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                  ^
   .vmlinux.export.c:11731:1026: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                          ^
   .vmlinux.export.c:11731:1027: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                  ^
   .vmlinux.export.c:11731:1028: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                          ^
   .vmlinux.export.c:11731:1029: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                  ^
   .vmlinux.export.c:11731:1030: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                          ^
   .vmlinux.export.c:11731:1031: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                  ^
   .vmlinux.export.c:11731:1032: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                          ^
   .vmlinux.export.c:11731:1033: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
       ^
   .vmlinux.export.c:11731:1034: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
               ^
   .vmlinux.export.c:11731:1035: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                       ^
   .vmlinux.export.c:11731:1036: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                               ^
   .vmlinux.export.c:11731:1037: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                       ^
   .vmlinux.export.c:11731:1038: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                               ^
   .vmlinux.export.c:11731:1039: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                       ^
   .vmlinux.export.c:11731:1040: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                               ^
   .vmlinux.export.c:11731:1041: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                       ^
   .vmlinux.export.c:11731:1042: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
    ^
   .vmlinux.export.c:11731:1043: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
            ^
   .vmlinux.export.c:11731:1044: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                    ^
   .vmlinux.export.c:11731:1045: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                            ^
   .vmlinux.export.c:11731:1046: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                    ^
   .vmlinux.export.c:11731:1047: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                            ^
   .vmlinux.export.c:11731:1048: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                    ^
   .vmlinux.export.c:11731:1049: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                            ^
   .vmlinux.export.c:11731:1050: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                    ^
   .vmlinux.export.c:11731:1051: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
 ^
   .vmlinux.export.c:11731:1052: warning: null character ignored [-Wnull-ch=
aracter]
    11731 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57PXBekmiam_8pin_init12InPlaceWrite=
B1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2A_10___internal11InitClosure=
NCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_initB3w_IB3Q_NCINv=
Ms2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11___make_initNCINvMB1S_INtB1S_6Dev=
resB2a_E3newB3w_INtNtB11_6result6ResultB2a_B3w_EE0B3w_E0B1P_B<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5=
sK6KjdJJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12ma=
ybe_uninit11MaybeUninitINtNtBa_6devres5InnerNtNtNtBa_3pci2io3BarEEEINtCs57P=
XBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINt=
NtB2A_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlace=
InitB1P_E8pin_initB3w_IB3Q_NCINvMs2_NvB1S_1__INtB5F_12___ThePinDataB2a_E11_=
__make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3w_INtNtB11_6result6ResultB2a_=
B3w_EE0B3w_E0B1P_B<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000>KSYMTAB_FUNC(_RINvMNtNtCshc5sK6KjdJJ_6kernel2io3memNtB3_9I=
oRequest11iomap_sizedKj0_EB7_, "");
          |                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
         ^
>> .vmlinux.export.c:26111:2: error: embedding a #include directive within =
macro arguments is not supported
    26111 | #include <linux/module.h>
          |  ^
   .vmlinux.export.c:11725:1: note: expansion of macro 'KSYMTAB_FUNC' reque=
sted here
    11725 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerINtNtNtBa_2io3mem14ExclusiveIoMemKj0_EEEEINtCs57PXBekmiam_8pin_=
init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2S_10___int=
ernal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_=
initB3O_IB48_NCINvMs2_NvB1S_1__INtB5X_12___ThePinDataB2a_E11___make_initNCI=
NvMB1S_INtB1S_6DevresB2a_E3newB3O_INtNtB11_6result6ResultB2a_<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U=
+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5sK6Kjd=
JJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_un=
init11MaybeUninitINtNtBa_6devres5InnerINtNtNtBa_2io3mem14ExclusiveIoMemKj0_=
EEEEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5er=
ror5ErrorINtNtB2S_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4i=
nit11InPlaceInitB1P_E8pin_initB3O_IB48_NCINvMs2_NvB1S_1__INtB5X_12___ThePin=
DataB2a_E11___make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3O_INtNtB11_6resul=
t6ResultB2a_<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U=
+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+00=
00><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000>=
<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+=
0000>KSYMTAB_FUNC(_RNvMsj_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB5_9UniqueAr=
cINtNtB9_6devres5InnerNtNtB9_3i2c12RegistrationEE10new_uninitB9_, "");
          | ^
>> .vmlinux.export.c:11725:1: error: unterminated function-like macro invoc=
ation
    11725 | KSYMTAB_FUNC(_RINvXsi_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB6_9=
UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_6=
devres5InnerINtNtNtBa_2io3mem14ExclusiveIoMemKj0_EEEEINtCs57PXBekmiam_8pin_=
init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5error5ErrorINtNtB2S_10___int=
ernal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4init11InPlaceInitB1P_E8pin_=
initB3O_IB48_NCINvMs2_NvB1S_1__INtB5X_12___ThePinDataB2a_E11___make_initNCI=
NvMB1S_INtB1S_6DevresB2a_E3newB3O_INtNtB11_6result6ResultB2a_<U+0000><U+000=
0><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><=
U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0=
000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U=
+0000><U+0000><U+0000><U+0000><U+0000>SYMBOL_FLAGS(_RINvXsi_NtNtCshc5sK6Kjd=
JJ_6kernel4sync3arcINtB6_9UniqueArcINtNtNtCsbsbRiabPlh9_4core3mem12maybe_un=
init11MaybeUninitINtNtBa_6devres5InnerINtNtNtBa_2io3mem14ExclusiveIoMemKj0_=
EEEEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1P_E14write_pin_initNtNtBa_5er=
ror5ErrorINtNtB2S_10___internal11InitClosureNCINvYINtB6_3ArcB1P_EINtNtBa_4i=
nit11InPlaceInitB1P_E8pin_initB3O_IB48_NCINvMs2_NvB1S_1__INtB5X_12___ThePin=
DataB2a_E11___make_initNCINvMB1S_INtB1S_6DevresB2a_E3newB3O_INtNtB11_6resul=
t6ResultB2a_<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000=
><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U=
+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+00=
00><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000>=
<U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+0000><U+=
0000>KSYMTAB_FUNC(_RNvMsj_NtNtCshc5sK6KjdJJ_6kernel4sync3arcINtB5_9UniqueAr=
cINtNtB9_6devres5InnerNtNtB9_3i2c12RegistrationEE10new_uninitB9_, "");
          | ^
   include/linux/export-internal.h:62:9: note: macro 'KSYMTAB_FUNC' defined=
 here
      62 | #define KSYMTAB_FUNC(name, ns)  __KSYMTAB(name, KSYM_FUNC(name),=
 ns)
         |         ^
   266 warnings and 2 errors generated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
