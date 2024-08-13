Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B91A2560;
	Tue, 13 Aug 2024 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723578452; cv=none; b=LIO066+BG3THsoqqQbMbRCCRu2vWK/zTHSSxXDHEn/DJw1zezKyr1/Quxd7RxQiNxf89QNWjlM9K+AhvZ0s9AhICWvx8g3YI9dGxb4Ijl5KgXvuVWVK2Qn8i5FARPwFNBRPY9wl2ny++tO+FgFDZYhVj/wj3KbEorcOS/YoWuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723578452; c=relaxed/simple;
	bh=D9EmZGcYIFN8nYMccR92qu5/EAch3Hfp/dc2IkePFKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODWBNYqJ1FDTr8pAsF2WfPHuMRaejMswtONNLSjwOmlK3WW+2pT0q9Gj2yC6+WK1lAfBIfwk9tvW5VM6X5JM6siVdPK251boTYmU5CgNIu7j2JSMajvT3Xn7zezKGc7/pME6yPRm706JQpkLeITNGXFYByT9rHmlC2zzmLoUGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j32K/454; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j32K/454"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb4c4de4cbso3878945a91.1;
        Tue, 13 Aug 2024 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723578451; x=1724183251; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q3nYgmk8Cs4TQTo24ByTlBnkZOowuAYQrFozF+3KiU=;
        b=j32K/454JYhY8DgmE+pwB+9CKZVE3tkQ4SaB7qOV6QDhMOyN3FqYUMTXndljSDtQrX
         JkFlgnJQEk0Rde0l+yne1XNfdDroclJ1B66oNLe/V0NlAPmLsHeouwBRkcEgAfxBFogN
         VbFd+W/JXG4H7tqi4iMHqCSM0REWaE41HJ2ui0keZEHhxMayqqcJit7d1/EmzaE90Gpf
         HclZG05xwO5F3t+ghB68AkNhROiHnkkRKN2HCAgR9tgeHfDXnQ2YzV2FvMIh7k7+OjHB
         CeffgluxKXkQeP4wA26NHo8PIMMgVSuwApPIGrix5Ot+7tfxMTKkPhtEoVx+UmgSvfHe
         bc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723578451; x=1724183251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Q3nYgmk8Cs4TQTo24ByTlBnkZOowuAYQrFozF+3KiU=;
        b=aazwfkFMHwicymHsoMeh/uGXYXbiugVIp17Ikos/ntv6Ce69ww76USV//Zdn0uzXp6
         WkgvPXiK2sfIKRmzs7JXSlrE7mkG6evsUDyMPVIRvMuSpvoQEsrts/Cu8OGCb45pc6Cu
         AYXAjvT8R85rqqJW9cPUZ/tk09xKYCRwugzcytJnCyYNhy9ucNlkYP4tzszcfm0XEeWm
         9jgPl9K3cPA9Nc6TIRMAjBATuTxOhJBINMpojfoO625ANhwaQLQnciugwUrz2mPHUvd8
         d3K1MvruCVKH2cQFcoqlCrAnfFFVtnn2vClZoAdSKgHnBSnlX0QZCN14mXzyteR5hyc/
         PDRw==
X-Forwarded-Encrypted: i=1; AJvYcCUfJwDT43o7YxPReIAgmcMNYZ9cLxq6JJSrTppyymFwPIJILAkCEf4y6QD7IZcUT+DAt5oox5KDNEfsIOUNuEjPtSUzjfegMmk3l+GauXAIfLefve6lfPPSxl31HfAGQcVD07g=
X-Gm-Message-State: AOJu0YzVA8ckEPaDOb3uN29IXkNkBJiUNJAWvv5AJx6X7eqjmuMjTRC2
	Udj+WloLUtls0VWOeO53YN5aDwNmfgpQGyrW2+rEqDpyJZq0HZhB
X-Google-Smtp-Source: AGHT+IG8lCzp7wbUsXu/ZQE/fHDUHeqmPZEqw7QhDJ3UBx2HARa4UT5RJdLBClplYVQC2+1y95B9yA==
X-Received: by 2002:a17:90a:668b:b0:2ca:f39c:8d76 with SMTP id 98e67ed59e1d1-2d3aab7b382mr688666a91.39.1723578450490;
        Tue, 13 Aug 2024 12:47:30 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcfe3e12sm7736720a91.41.2024.08.13.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:47:29 -0700 (PDT)
Date: Tue, 13 Aug 2024 12:47:27 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Kees Cook <kees@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	llvm-bugs@lists.llvm.org
Subject: Re: lib/test_bitmap.c:1278:2: error: call to
 '__compiletime_assert_127' declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(~var)
Message-ID: <Zru4T-aIsqeM9Fxk@yury-ThinkPad>
References: <202408131601.Aj9JmK7K-lkp@intel.com>
 <2690861a-e726-4149-98ff-d26ec6d595ac@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2690861a-e726-4149-98ff-d26ec6d595ac@intel.com>

On Tue, Aug 13, 2024 at 04:38:10PM +0200, Alexander Lobakin wrote:
> From: Kernel Test Robot <lkp@intel.com>
> Date: Tue, 13 Aug 2024 17:00:56 +0800
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   d74da846046aeec9333e802f5918bd3261fb5509
> > commit: 7adaf37f7f104a7ee5f150af491674ccbbfc4114 lib/bitmap: add compile-time test for __assign_bit() optimization
> > date:   4 months ago
> > config: um-randconfig-r132-20240812 (https://download.01.org/0day-ci/archive/20240813/202408131601.Aj9JmK7K-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131601.Aj9JmK7K-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408131601.Aj9JmK7K-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> lib/test_bitmap.c:1278:2: error: call to '__compiletime_assert_127' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(~var)
> >     1278 |         BUILD_BUG_ON(!__builtin_constant_p(~var));
> >          |         ^
> >    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
> >       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
> >          |         ^
> >    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
> >       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >          |                                     ^
> >    include/linux/compiler_types.h:460:2: note: expanded from macro 'compiletime_assert'
> >      460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >          |         ^
> >    include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
> >      448 |         __compiletime_assert(condition, msg, prefix, suffix)
> >          |         ^
> >    include/linux/compiler_types.h:441:4: note: expanded from macro '__compiletime_assert'
> >      441 |                         prefix ## suffix();                             \
> >          |                         ^
> >    <scratch space>:193:1: note: expanded from here
> >      193 | __compiletime_assert_127
> >          | ^
> >    1 error generated.
> > 
> > 
> > vim +1278 lib/test_bitmap.c
> > 
> > 291f93ca339f5b Barry Song        2021-08-06  1227  
> > 2356d198d2b4dd Yury Norov        2023-07-17  1228  /*
> > 2356d198d2b4dd Yury Norov        2023-07-17  1229   * FIXME: Clang breaks compile-time evaluations when KASAN and GCOV are enabled.
> > 2356d198d2b4dd Yury Norov        2023-07-17  1230   * To workaround it, GCOV is force-disabled in Makefile for this configuration.
> > 2356d198d2b4dd Yury Norov        2023-07-17  1231   */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1232  static void __init test_bitmap_const_eval(void)
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1233  {
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1234  	DECLARE_BITMAP(bitmap, BITS_PER_LONG);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1235  	unsigned long initvar = BIT(2);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1236  	unsigned long bitopvar = 0;
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1237  	unsigned long var = 0;
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1238  	int res;
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1239  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1240  	/*
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1241  	 * Compilers must be able to optimize all of those to compile-time
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1242  	 * constants on any supported optimization level (-O2, -Os) and any
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1243  	 * architecture. Otherwise, trigger a build bug.
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1244  	 * The whole function gets optimized out then, there's nothing to do
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1245  	 * in runtime.
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1246  	 */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1247  
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1248  	/* Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }` */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1249  	bitmap_clear(bitmap, 0, BITS_PER_LONG);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1250  	if (!test_bit(7, bitmap))
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1251  		bitmap_set(bitmap, 5, 2);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1252  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1253  	/* Equals to `unsigned long bitopvar = BIT(20)` */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1254  	__change_bit(31, &bitopvar);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1255  	bitmap_shift_right(&bitopvar, &bitopvar, 11, BITS_PER_LONG);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1256  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1257  	/* Equals to `unsigned long var = BIT(25)` */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1258  	var |= BIT(25);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1259  	if (var & BIT(0))
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1260  		var ^= GENMASK(9, 6);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1261  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1262  	/* __const_hweight<32|64>(GENMASK(6, 5)) == 2 */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1263  	res = bitmap_weight(bitmap, 20);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1264  	BUILD_BUG_ON(!__builtin_constant_p(res));
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1265  	BUILD_BUG_ON(res != 2);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1266  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1267  	/* !(BIT(31) & BIT(18)) == 1 */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1268  	res = !test_bit(18, &bitopvar);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1269  	BUILD_BUG_ON(!__builtin_constant_p(res));
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1270  	BUILD_BUG_ON(!res);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1271  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1272  	/* BIT(2) & GENMASK(14, 8) == 0 */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1273  	res = initvar & GENMASK(14, 8);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1274  	BUILD_BUG_ON(!__builtin_constant_p(res));
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1275  	BUILD_BUG_ON(res);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1276  
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1277  	/* ~BIT(25) */
> > dc34d5036692c6 Alexander Lobakin 2022-06-24 @1278  	BUILD_BUG_ON(!__builtin_constant_p(~var));
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1279  	BUILD_BUG_ON(~var != ~BIT(25));
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1280  
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1281  	/* ~BIT(25) | BIT(25) == ~0UL */
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1282  	bitmap_complement(&var, &var, BITS_PER_LONG);
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1283  	__assign_bit(25, &var, true);
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1284  
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1285  	/* !(~(~0UL)) == 1 */
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1286  	res = bitmap_full(&var, BITS_PER_LONG);
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1287  	BUILD_BUG_ON(!__builtin_constant_p(res));
> > 7adaf37f7f104a Alexander Lobakin 2024-03-27  1288  	BUILD_BUG_ON(!res);
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1289  }
> > dc34d5036692c6 Alexander Lobakin 2022-06-24  1290  
> > 
> > :::::: The code at line 1278 was first introduced by commit
> > :::::: dc34d5036692c614eef23c1130ee42a201c316bf lib: test_bitmap: add compile-time optimization/evaluations assertions
> > 
> > :::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
> > :::::: CC: Yury Norov <yury.norov@gmail.com>
> 
> + Cc Clang folks.
> 
> clang-dev 20 issue?
> 
> Thanks,
> Olek

Seems like that. Looping LLVM-bugs <llvm-bugs@lists.llvm.org>.

Thanks,
Yury
