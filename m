Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638482D8399
	for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 03:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976019; cv=pass; b=mg5QMHjQ0yp3QFWlOV5CjQBoyLqDIOaJ5SKxjW9ils0Xg+A0SdCJK9fYnTu7ADYB7qIIReiqIUvWadikgaH8Qy7w9rPN5Zj1rIzCF8Bq5dnU6pyZy8tkvfPpHWi+VlQ3PAqdqWfjZXmjT+t/SM2SPy3ue8SEgj/xoncCD4yz1ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976019; c=relaxed/simple;
	bh=RM61q1uWCHCZRwTddCQGqRStiqTB47nu5R9QT11eXPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTNNjYFltF1Edkoyn2x5AzsdLEESKzBeCamVOrZZ144M4eYnX6hlBbEkAXn/u4VUimHppDQ5SUmJP51VSHtcFgU9JSS/uFGEJqFiDt83sOOIuornUbQqftrlVV6dl5ovAKoje39TlQblzr73BSEeb+rLdLE66uKN80FV7UB11Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXKWsLEF; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXKWsLEF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-668d41905a4so579679a12.0
        for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 20:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773976017; cv=none;
        d=google.com; s=arc-20240605;
        b=DD0VL9XVCtgZZc2h0IHrdWCqh8dsqS2Axf+WmC1/LKLcXDju88rm/nIcOQm/QHjybX
         Am4ObC4haISuImuF1sp2h6pP1Ou1Lv585XqpceAM6WjAYGoB1f/qqtg93YWu1etEUlyY
         4A9F8FPOff3zUdcRJR7mlhDJe45yIqrPbR12syIBFaZmbjAfx27bt2BHxF/SXuynWfUg
         Y2MMUY3NxvRGWBGxjtNv9pBmh6mLyfaRY2WQDXBssQvGpUENWKUFu+Wwa/i4qBXsChKu
         FlhL7c7Bo8sjCj4AAVFAZwTOnynam0L/m8+eaLQYKdfiKW8sKYCjxNDZQNGykWEclTFF
         5NAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uh2XnjWm7w7sL+W4dFrZCyFtW9ll5NN+pKsvTMlZQ8Y=;
        fh=KO4i6r6wid3dGLX70OIdYVzkvlpNkyh9COfjIk6bkxQ=;
        b=Gfjmac8OBpesFjDi1aLYIFLMPprtkEMaGdIN4kcrVVvNH2zS6I1rWEjk0qsEe2Jx+t
         85874Zgln/9rzAlB1YGqI8npf80Y+liJaECz4ZPKRLHOjYtjCUbGccfI8M1vRUptaJGs
         WskYltt97bIny9zpw6sZMn0kaOf3o5yJSeOGpJGyB3pJM2lOP4Ew5WzpCv572dr8hQQX
         DeQ8lSvcxmQFCFYjWnIRDMgLxzmfmIwyu9MIyE4cN7kF6Ayxi0kBViWKixpHgI5aCetT
         wsqrdufREmz9KKtytoT9Hwb7t4BKZzRSjXCN4tCQ4QFgVS6GsWfe+z2W51OBuPg82l5y
         GAmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773976017; x=1774580817; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh2XnjWm7w7sL+W4dFrZCyFtW9ll5NN+pKsvTMlZQ8Y=;
        b=nXKWsLEFSs6BBFQtj/TnQJt6kbYlSCYHULR1QwinmBD3dWKNa5q5vxiBqHf6Elj2+k
         5gSKxL7b2IsTatmve0EYFrktBVBRAv1FQCowc2br5bphbwT07+qiHSd8vCP/oC2lG2e9
         cr3YdKmKoyI/90I3Z9i+2ytJkTIYpFq/lhHX56Es/23I5PtGH1bbraikwmR/JdtoBHiO
         2zMK/yc9isH03EL6M1s+2jsLvGpPQj1sfxS1tYWuuK8P/h4FLKOCrP/I7OKu4B5X4RMM
         QVfZUdIWmzN1NuXj4zTSGBcnMnTwP/L/zxHly3Ju2hNpKWi4uaaNp8Z2qAkZPC+Sx0NN
         9mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773976017; x=1774580817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh2XnjWm7w7sL+W4dFrZCyFtW9ll5NN+pKsvTMlZQ8Y=;
        b=K1DbXNaTLkK1OfxMbGBpAPMmmQE2B3ng+RbunCsIldBGUbzHEiZIfPkNHyAc39Nwzw
         o5ijwrd03MrhKtxjTva6OqRqRilgw3idfTKhX319p5zPrn/OQSyExu+SJCU72fiV40ak
         UEubT91QgF+e/lVdyekAHLiT0J7/ydFLABEm/nI/X2R08/ZkNO6GifnUl++VowvYMqdA
         C+Xly0Rm2YLrB6MF+igPLMjZJzGOG4RRJcrHw2LmSwg1YbeZ+lMR8OQaCbmjEQmPNKMo
         0w/Ef5Rvlj1Ctq0xoWI9KuR2xARFBpEgLQlOm6vq0CKL0hm7ZfqeNLcoGMJwp5j+1GYc
         WcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj0z1o5cknz3kSU8Gajo0e6VbWxSHUeE5ilnmwyNOJqAW0HZnEBV47AXjtLIBwOkRHC9eY@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc1KOHztpkSfk26o/KlWt1amOQLKljF36hcowTJHASuP54btja
	iTi+NeCKyOLBXpaFACrsjHR5EX2STY52xRoSWo2bVTDZZJ5rwsLiFySwk26xnnKnkPjPWTIpNHN
	CSmaUFVT3wSXW9YDgftK+1ePoUJCTATI=
X-Gm-Gg: ATEYQzxUEJM07jdBKCw6QgIKpj/PX54691/eto8oCP8ODtBuSczM3r7c8oTWDwM0/Yy
	zBgoZovolMv6Z9RxPXUyTf+S31CV0XEhEWlPOOzEATpK6lu/gQM8RXf2CC/pgUetIAf5aTe0Ccl
	4ahxrH+sbFtSmT4/+Jy9l90/QdWTaXyzX8Isu7bEkOkyh5FJ+jMBEnWHIcerjDoTJvypul7tftm
	yPnx/da1ynL9ueSHgTqII0I5T+oiTDz71m6EQ2uwcMrfqz3hIdfE2YioSmtLahCzOsGGe9pWcsC
	zlqRAQ==
X-Received: by 2002:a17:906:240e:b0:b97:f12a:3f8c with SMTP id
 a640c23a62f3a-b982f1ffa96mr69781266b.20.1773976016363; Thu, 19 Mar 2026
 20:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317061700.7734-1-linux.amoon@gmail.com> <202603200758.vueafhDW-lkp@intel.com>
In-Reply-To: <202603200758.vueafhDW-lkp@intel.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 20 Mar 2026 08:36:40 +0530
X-Gm-Features: AaiRm5341vISAh2YMw8-vBK1a-KteoqiImPAmam6qIBBOzrX-3-bGM_THq4e-Z8
Message-ID: <CANAwSgS=TzC=QVs2Mw1qJxDffj5H6gU7Ak=Kdd_pCf_1sgY74Q@mail.gmail.com>
Subject: Re: [PATCH next v1] r8169: Fix PHY lookup for mdiobus_get_phy() and
 improve error reporting during probe
To: kernel test robot <lkp@intel.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Niklas Cassel <cassel@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel test robot,

On Fri, 20 Mar 2026 at 05:25, kernel test robot <lkp@intel.com> wrote:
>
> Hi Anand,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 95c541ddfb0815a0ea8477af778bb13bb075079a]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/r8169-Fix-PHY-lookup-for-mdiobus_get_phy-and-improve-error-reporting-during-probe/20260317-183327
> base:   95c541ddfb0815a0ea8477af778bb13bb075079a
> patch link:    https://lore.kernel.org/r/20260317061700.7734-1-linux.amoon%40gmail.com
> patch subject: [PATCH next v1] r8169: Fix PHY lookup for mdiobus_get_phy() and improve error reporting during probe
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603200758.vueafhDW-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200758.vueafhDW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603200758.vueafhDW-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):

Please discard this patch.

Thanks
-Anand
