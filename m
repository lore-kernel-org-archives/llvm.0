Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A86256A;
	Fri,  3 May 2024 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714721944; cv=none; b=Mop3562Ib/WGAAuojl3jBmm1hjT/94gc5lnm8VLurZI8aG5N+dvpnBH2NSGy/b9BfqnYRpFtRoLQh3s/jfdAjWKaIz+4GYFxqcgNXAlRROtq5UyxEyXSSwWnekWKZrfeU4+zevgo2GmMWBOeqDx4lCr4WrbZzsMufh5SxkbKrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714721944; c=relaxed/simple;
	bh=oszJiJoomjNbOX3NCTArUXDepO6ONUu7ddcYazmoJOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8LCkyWfkh6pd2q6mx1M+U5jcLqD3YU+AEOCBw2uOsRvIVdcO5tupJhft6qw5AqfXlS/xLwSK8gFijv2OnitHCb4VyJlUIl1/kCPFeQX3rgg+FJPw2IYA/g8yyDo9H1v2ASy5C66E6Kq6wRJiwyvmZp3d9dk7KXBqK9KNYePBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZzqRK58; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZzqRK58"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ec400f9afdso4924935ad.0;
        Fri, 03 May 2024 00:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714721942; x=1715326742; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VE8NNXN2k0iL+12mXpHucz/vI3BQBfSfFA4U/Wwoncg=;
        b=OZzqRK58Oe6PhIDd0f+pZESklwvMcXEXKdSm1yi3L52sINW5XKWbLUSkqENePglnRv
         m0iX5tDkg5j8NJt4RJC3bGkSqh2azp5Cyf1AprzOM+vvuQKVlwfaJu0TWC1eMkMuKq51
         GOJ+bcZnHX8HKui6GrYIfqCgdv5cDhlL7vxG02OyBXpzJ6v4FtG8fTrwuhrQpP7OqWby
         hniCwYCEC7QP6pWoVH8BaxHtcz5bVAq5n9+p2OQxHuLuX/6Qdl+3f14uMxIqt8Jv4ywL
         EA1iaUyUbHsARp45GKOr9HKSEnvmjBOe6Jhe1gMlfu1EO6+eonMBuwDAioW3qrTK045Z
         4qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714721942; x=1715326742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VE8NNXN2k0iL+12mXpHucz/vI3BQBfSfFA4U/Wwoncg=;
        b=QBDwL3AYnTqtJ8o1X4uW16fmvx6leT4oR/q+Wg1KUq39uBjAgseKZK3hySkI+nAVva
         ITpfMf6j5wPsS7TvYBrbzmTxUzl53ycNMMsOIYCuCOUjVe1Bq1ydawxRZMTrROXEbH6n
         bmPzWhIj/7GWaK8bZTf7dtjVCHbQ3nBUgWd0WYqgsiAX/nkYdKgGyRtg0W+JIHZO9UNs
         A3e4WqghxajdkWeacZAJDO+sKrVLJfT8iQr4hUKqRRHoIQnDXvItIW7GaH6cXE24rQXD
         7XoMQ90Fqo4yHvCU6d9frsBGOy0ftQsQutG6h2Z/ZGWZcyXRYbKNqFE4RevzN8w3Xidm
         oxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk4dRUakXC/IiJLD1mZtJhfvgqO05M5hd0lwiJBnw8ArDkU29O84t5TgzkcnASv181c0MCEpchXXDXv3MMVfdoh/RkKYUpRxToRNCTR36IU95D3vNe50ZHT7CNa1M2uH6UjjM=
X-Gm-Message-State: AOJu0Yyzu594xLqi34cRb0XvMHBeDSzsXBh7kL7uDaeLuIt7urs483rT
	gF81CIf8nOA+zoiVA7KGnS20/cNHRYO2tVos0wX21ytEVg/dZJKE
X-Google-Smtp-Source: AGHT+IFuIgNl7wfEY/kaaHMaoUe+XsFnxiY6FgeHPQ1c9RuMUXSKGcF1pq066TlNmlL6h7aPduAnQQ==
X-Received: by 2002:a05:6a20:96d2:b0:1af:667b:44ff with SMTP id hq18-20020a056a2096d200b001af667b44ffmr1813038pzc.0.1714721942332;
        Fri, 03 May 2024 00:39:02 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d1-20020a170902654100b001e435350a7bsm2631073pln.259.2024.05.03.00.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 00:39:01 -0700 (PDT)
Date: Fri, 3 May 2024 15:38:59 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
Message-ID: <ZjSUk4vgsQ63wfcn@visitorckw-System-Product-Name>
References: <20240502092443.6845-2-visitorckw@gmail.com>
 <202405030808.UsoMKFNP-lkp@intel.com>
 <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name>
 <20240503041701.GA3660305@thelio-3990X>
 <ZjSSylciH+qJeEEG@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjSSylciH+qJeEEG@visitorckw-System-Product-Name>

On Fri, May 03, 2024 at 03:31:26PM +0800, Kuan-Wei Chiu wrote:
> On Thu, May 02, 2024 at 09:17:01PM -0700, Nathan Chancellor wrote:
> > Hi Kuan-Wei,
> > 
> > On Fri, May 03, 2024 at 09:34:28AM +0800, Kuan-Wei Chiu wrote:
> > > On Fri, May 03, 2024 at 08:49:00AM +0800, kernel test robot wrote:
> > > > Hi Kuan-Wei,
> > > > 
> > > > kernel test robot noticed the following build errors:
> > > > 
> > > > [auto build test ERROR on linus/master]
> > > > [also build test ERROR on v6.9-rc6 next-20240502]
> > > > [cannot apply to akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > > 
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-test_bitops-Add-benchmark-test-for-fns/20240502-172638
> > > > base:   linus/master
> > > > patch link:    https://lore.kernel.org/r/20240502092443.6845-2-visitorckw%40gmail.com
> > > > patch subject: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
> > > > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/config)
> > > > compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202405030808.UsoMKFNP-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > > >> lib/test_bitops.c:56:39: error: variable 'tmp' set but not used [-Werror,-Wunused-but-set-variable]
> > > >       56 |         static volatile __used unsigned long tmp __initdata;
> > > >          |                                              ^
> > > >    1 error generated.
> > > > 
> > > > 
> > > > vim +/tmp +56 lib/test_bitops.c
> > > > 
> > > >     52	
> > > >     53	static int __init test_fns(void)
> > > >     54	{
> > > >     55		static unsigned long buf[10000] __initdata;
> > > >   > 56		static volatile __used unsigned long tmp __initdata;
> > > 
> > > I apologize for causing the compilation failure with clang. I'm not
> > > very familiar with clang and I'm not sure why something marked as
> > > __used would result in the warning mentioned above. Perhaps clang does
> > > not support attribute((used))? Is there a way to work around this
> > > issue?
> > 
> > It looks like __attribute__((__used__)) is not enough to stop clang from
> > warning, unlike GCC. I can likely fix that in clang if it is acceptable
> > to the clang maintainers (although more below on why this might be
> > intentional) but the warning will still need to be resolved for older
> > versions. Looking at the current clang source code and tests, it looks
> > like __attribute__((__unused__)) should silence the warning, which the
> > kernel has available as __always_unused or __maybe_unused, depending on
> > the context.
> > 
> > $ cat test.c
> > void foo(void)
> > {
> >         int a;
> >         a = 1;
> > }
> > 
> > void bar(void)
> > {
> >         static int b;
> >         b = 2;
> > }
> > 
> > void baz(void)
> > {
> >         static int c __attribute__((__used__));
> >         c = 3;
> > }
> > 
> > void quux(void)
> > {
> >         static int d __attribute__((__unused__));
> >         d = 4;
> > }
> > 
> > void foobar(void)
> > {
> >         static int e __attribute__((__used__)) __attribute__((__unused__));
> >         e = 1;
> > }
> > 
> > $ gcc -Wunused-but-set-variable -c -o /dev/null test.c
> > test.c: In function ‘foo’:
> > test.c:3:13: warning: variable ‘a’ set but not used [-Wunused-but-set-variable]
> >     3 |         int a;
> >       |             ^
> > test.c: In function ‘bar’:
> > test.c:9:20: warning: variable ‘b’ set but not used [-Wunused-but-set-variable]
> >     9 |         static int b;
> >       |                    ^
> > 
> > $ clang -fsyntax-only -Wunused-but-set-variable test.c
> > test.c:3:6: warning: variable 'a' set but not used [-Wunused-but-set-variable]
> >     3 |         int a;
> >       |             ^
> > test.c:9:13: warning: variable 'b' set but not used [-Wunused-but-set-variable]
> >     9 |         static int b;
> >       |                    ^
> > test.c:15:13: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> >    15 |         static int c __attribute__((__used__));
> >       |                    ^
> > 3 warnings generated.
> > 
> > I've attached a diff below that resolves the warning for me and it has
> > no code generation differences based on objdump. While having used and
> > unused attributes together might look unusual, reading the GCC attribute
> > manual makes it seem like these attributes fulfill similar yet different
> > roles, __unused__ prevents any unused warnings while __used__ forces the
> > variable to be emitted:
> > 
> > https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/Common-Variable-Attributes.html#index-unused-variable-attribute
> > 
> > A strict reading of that does not make it seem like __used__ implies
> > disabling unused warnings, so I can understand why clang's behavior is
> > the way that it is.
> > 
> Thank you for your explanation and providing the solution. I tested the
> diff stat you provided, and it works well for me.
> 
Should I submit an updated version of the patch to the bitmap
maintainer, or should this be a separate patch since the patch causing
build failure has already been accepted? My instinct is the latter, but
I'm concerned it might make git bisection more challenging.

Regards,
Kuan-Wei
> > 
> > diff --git a/lib/test_bitops.c b/lib/test_bitops.c
> > index 5c627b525a48..28c91072cf85 100644
> > --- a/lib/test_bitops.c
> > +++ b/lib/test_bitops.c
> > @@ -53,7 +53,7 @@ static unsigned long order_comb_long[][2] = {
> >  static int __init test_fns(void)
> >  {
> >  	static unsigned long buf[10000] __initdata;
> > -	static volatile __used unsigned long tmp __initdata;
> > +	static volatile __always_unused __used unsigned long tmp __initdata;
> >  	unsigned int i, n;
> >  	ktime_t time;
> >  
