Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30062146D47;
	Fri,  3 May 2024 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714721488; cv=none; b=YfAFCofpLIGfbWPRiUrDNDwEVyJsnOJ7waMo8+o5zgMH+IKzTYNuEoQ7THtGr14uhIXLi1Wg8CfYAngCFVpzp5++DLViyy4vUXEfDheR8kmc9dPFmWxqvqPgav0JITAF7TzLQtjVajhpxJKbICpO88x6BLJpBMLlbEs0W2bw48Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714721488; c=relaxed/simple;
	bh=Gc4djTBtObY0h62fDkMvDtlBXqN7n7ktTjv2c6Vl+uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpTawxdx9Z2sIn2WrKhYD45qXTxxDnDkIs3WhjOEuf1mXV4/EXiUKGbvamIxHgu5UIb3iKo2Y2T7KaKJOC8NShNvY0d6XsxH7ayaY/V5xR+OpB5H9/U+PrZ+kEJoSFo/4YeQNIwQGtuEGPrVVDBqhw0PXMrNTAthAVbG7szLlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOlBit0Y; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOlBit0Y"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2b3e2d3d05cso240339a91.3;
        Fri, 03 May 2024 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714721486; x=1715326286; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBJPEifz25GdxrBh67MwwLl1hBjEU8P66YKu8Xq9ipc=;
        b=KOlBit0YZV8XONY0M6Nhize1yuCVZzGpNipZpYNrvrLKCFLnZLT4ZAbjG5lKw0pQ4H
         Bk3JC2ShbPAorajbiFsGyKg6z3rqcRbt5nFYkemX6XUpHTQCFn+v91wRoa4V/Xtm+7vI
         4gpYaAKMtEx0DSuMqPUdv3WNHADeLMHZanpxCvplneDwZi2QIDbtvqc/gDIJCd9z2sQV
         dA2tVoWaS7PD8tjng5hv0gED9eoE4AUDtBwex/4dXqLHlVgZ9YIeQ2eXhal/WpzP/Xte
         qNPFxXO5/0kgKbd6meyESwXVgn/Uz3bf9t6Yd/NQUsp08S0+RSo77NDCyUt/Y88iSz4L
         nWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714721486; x=1715326286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBJPEifz25GdxrBh67MwwLl1hBjEU8P66YKu8Xq9ipc=;
        b=aO6ZfogWXnZI/SsVcsMztLv95FUi3s/F7Nzc9U2oHi+Rhd1Y5TeC5d8GKEYZHY8jhe
         GFF0CxvnvqUOOQxWMMrGsmhcZjp/HVBAAMLYLPUZrso40cVwgFwKM97Hdr+xYHeUVvz4
         A9yjEvQCKEbyxyEmCGz97jjWJbTvgGbuEZSEjeEyhKbtI5fba8ImKEi/qW4LwIMatu9F
         Xc/tQtLuKRVA0q5sNZ4L4lTTcCCIAsjINkkq/uqGNSZj/AK2Zd7N6TpNEC8mCmMqge+R
         5Ro5uYvaSutTmbo8DHRLSMnyFeu09f/Y25aywXXRU+0FHCyyQzhdIRmIFn0Zkv98LC3w
         Xs1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMesGI+Vx/cobHwcNWcmouA0eeow+inFK6i4xW4echdXVPby8AVSGKUw8LUm5dz4iEboWb4JqZf1mqD0u05Vn6ozZ5GdOBlh1ZTEA+K65fmsmEHbkWAM7uSxwvssDNgNAL3K4=
X-Gm-Message-State: AOJu0YyqllXR3d1o3cfRNM6llTmVsN+/9RPvv7+uDIloz5cGqlSpXh7B
	bDbYLFiTFqi7ZvSqwRVy9Ty2WG79eNpXs9K9ssc2PWgNbvrqxc4p
X-Google-Smtp-Source: AGHT+IEw8A0A28k01RSLjPxHQROMoSuGmXo0jFsuCjTGzEotjig4VlnU3p+JE+9u141yjcgJdlbzDA==
X-Received: by 2002:a17:902:ecc7:b0:1e9:a06a:c3c3 with SMTP id a7-20020a170902ecc700b001e9a06ac3c3mr2086965plh.5.1714721486241;
        Fri, 03 May 2024 00:31:26 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b001e28f7c4233sm2568889plc.236.2024.05.03.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 00:31:25 -0700 (PDT)
Date: Fri, 3 May 2024 15:31:22 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
Message-ID: <ZjSSylciH+qJeEEG@visitorckw-System-Product-Name>
References: <20240502092443.6845-2-visitorckw@gmail.com>
 <202405030808.UsoMKFNP-lkp@intel.com>
 <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name>
 <20240503041701.GA3660305@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503041701.GA3660305@thelio-3990X>

On Thu, May 02, 2024 at 09:17:01PM -0700, Nathan Chancellor wrote:
> Hi Kuan-Wei,
> 
> On Fri, May 03, 2024 at 09:34:28AM +0800, Kuan-Wei Chiu wrote:
> > On Fri, May 03, 2024 at 08:49:00AM +0800, kernel test robot wrote:
> > > Hi Kuan-Wei,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [auto build test ERROR on linus/master]
> > > [also build test ERROR on v6.9-rc6 next-20240502]
> > > [cannot apply to akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-test_bitops-Add-benchmark-test-for-fns/20240502-172638
> > > base:   linus/master
> > > patch link:    https://lore.kernel.org/r/20240502092443.6845-2-visitorckw%40gmail.com
> > > patch subject: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
> > > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/config)
> > > compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202405030808.UsoMKFNP-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> lib/test_bitops.c:56:39: error: variable 'tmp' set but not used [-Werror,-Wunused-but-set-variable]
> > >       56 |         static volatile __used unsigned long tmp __initdata;
> > >          |                                              ^
> > >    1 error generated.
> > > 
> > > 
> > > vim +/tmp +56 lib/test_bitops.c
> > > 
> > >     52	
> > >     53	static int __init test_fns(void)
> > >     54	{
> > >     55		static unsigned long buf[10000] __initdata;
> > >   > 56		static volatile __used unsigned long tmp __initdata;
> > 
> > I apologize for causing the compilation failure with clang. I'm not
> > very familiar with clang and I'm not sure why something marked as
> > __used would result in the warning mentioned above. Perhaps clang does
> > not support attribute((used))? Is there a way to work around this
> > issue?
> 
> It looks like __attribute__((__used__)) is not enough to stop clang from
> warning, unlike GCC. I can likely fix that in clang if it is acceptable
> to the clang maintainers (although more below on why this might be
> intentional) but the warning will still need to be resolved for older
> versions. Looking at the current clang source code and tests, it looks
> like __attribute__((__unused__)) should silence the warning, which the
> kernel has available as __always_unused or __maybe_unused, depending on
> the context.
> 
> $ cat test.c
> void foo(void)
> {
>         int a;
>         a = 1;
> }
> 
> void bar(void)
> {
>         static int b;
>         b = 2;
> }
> 
> void baz(void)
> {
>         static int c __attribute__((__used__));
>         c = 3;
> }
> 
> void quux(void)
> {
>         static int d __attribute__((__unused__));
>         d = 4;
> }
> 
> void foobar(void)
> {
>         static int e __attribute__((__used__)) __attribute__((__unused__));
>         e = 1;
> }
> 
> $ gcc -Wunused-but-set-variable -c -o /dev/null test.c
> test.c: In function ‘foo’:
> test.c:3:13: warning: variable ‘a’ set but not used [-Wunused-but-set-variable]
>     3 |         int a;
>       |             ^
> test.c: In function ‘bar’:
> test.c:9:20: warning: variable ‘b’ set but not used [-Wunused-but-set-variable]
>     9 |         static int b;
>       |                    ^
> 
> $ clang -fsyntax-only -Wunused-but-set-variable test.c
> test.c:3:6: warning: variable 'a' set but not used [-Wunused-but-set-variable]
>     3 |         int a;
>       |             ^
> test.c:9:13: warning: variable 'b' set but not used [-Wunused-but-set-variable]
>     9 |         static int b;
>       |                    ^
> test.c:15:13: warning: variable 'c' set but not used [-Wunused-but-set-variable]
>    15 |         static int c __attribute__((__used__));
>       |                    ^
> 3 warnings generated.
> 
> I've attached a diff below that resolves the warning for me and it has
> no code generation differences based on objdump. While having used and
> unused attributes together might look unusual, reading the GCC attribute
> manual makes it seem like these attributes fulfill similar yet different
> roles, __unused__ prevents any unused warnings while __used__ forces the
> variable to be emitted:
> 
> https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/Common-Variable-Attributes.html#index-unused-variable-attribute
> 
> A strict reading of that does not make it seem like __used__ implies
> disabling unused warnings, so I can understand why clang's behavior is
> the way that it is.
> 
Thank you for your explanation and providing the solution. I tested the
diff stat you provided, and it works well for me.

Regards,
Kuan-Wei
> 
> diff --git a/lib/test_bitops.c b/lib/test_bitops.c
> index 5c627b525a48..28c91072cf85 100644
> --- a/lib/test_bitops.c
> +++ b/lib/test_bitops.c
> @@ -53,7 +53,7 @@ static unsigned long order_comb_long[][2] = {
>  static int __init test_fns(void)
>  {
>  	static unsigned long buf[10000] __initdata;
> -	static volatile __used unsigned long tmp __initdata;
> +	static volatile __always_unused __used unsigned long tmp __initdata;
>  	unsigned int i, n;
>  	ktime_t time;
>  
