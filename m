Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F172224D4;
	Fri,  3 May 2024 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714709823; cv=none; b=OP9wPqD+s3Og418ql2Tr3FEGyqykXrqpdchK8Izrbwrymic1gxtZxszqp0rIYkOmepte30I4ZirYWrgcWvRHSqxAOlZuia2oa+R2SX3Alss47mP1/09VFg4VVQlVxXVxn0KiVBwqLJ6CNdXZMJIG6KWnyhbTZEmCq94q2O1UM48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714709823; c=relaxed/simple;
	bh=+77gXF+2Fs3aDCwsghEAa4FAkn9gW5nCs2KKb1Am1Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2IYXwLYpoNT03lxy6AmKLXMRfK239s4ZufsCRhK5VfHN0cuXbemCYR/4gO40sDgyKI/aQOo3He51QwcjsFh3xUn54KBcfNzGtKI0glrrO8NhuJiK5h8zaZV+C018NZmM6fA6Wi6fAWGolyl7/rOZUZFQOGMc0UlpHvBZiZsX4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufHuTrjd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufHuTrjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4974C116B1;
	Fri,  3 May 2024 04:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714709822;
	bh=+77gXF+2Fs3aDCwsghEAa4FAkn9gW5nCs2KKb1Am1Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufHuTrjdZaPgXcofCA5rYp7MkSyotlWZd4h8tNGGr8YcWroWvePDGNxCmnZUvyWWZ
	 Yj8xU//vU5yNQslnJ+gKR0cYY4sfZiuh1zrfcrxEqKde5vqlDDEWyyYPzhfYtTu5qI
	 pRuWyPF7Uhkxbyq2iUkNN58/Cjl1mjDvVHEUGr7ZMWo57BUES3Dd9cQvgQlFmx3W0T
	 oUw04rOa9d6qHTnx+QOlM5ZmUAaUvTzYQ43Z/TWGfFIqCSv+FpKYLaJyKjvSlLAtUs
	 H7okmlL4Kw1wh9Gsc7umZWV4WhBAI+uiZJ59wwUAz1oWCJK/P7PGpL69TFXQVDpXqU
	 a1WXcnMo2X4Kg==
Date: Thu, 2 May 2024 21:17:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
Message-ID: <20240503041701.GA3660305@thelio-3990X>
References: <20240502092443.6845-2-visitorckw@gmail.com>
 <202405030808.UsoMKFNP-lkp@intel.com>
 <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name>

Hi Kuan-Wei,

On Fri, May 03, 2024 at 09:34:28AM +0800, Kuan-Wei Chiu wrote:
> On Fri, May 03, 2024 at 08:49:00AM +0800, kernel test robot wrote:
> > Hi Kuan-Wei,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.9-rc6 next-20240502]
> > [cannot apply to akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-test_bitops-Add-benchmark-test-for-fns/20240502-172638
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20240502092443.6845-2-visitorckw%40gmail.com
> > patch subject: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/config)
> > compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405030808.UsoMKFNP-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> lib/test_bitops.c:56:39: error: variable 'tmp' set but not used [-Werror,-Wunused-but-set-variable]
> >       56 |         static volatile __used unsigned long tmp __initdata;
> >          |                                              ^
> >    1 error generated.
> > 
> > 
> > vim +/tmp +56 lib/test_bitops.c
> > 
> >     52	
> >     53	static int __init test_fns(void)
> >     54	{
> >     55		static unsigned long buf[10000] __initdata;
> >   > 56		static volatile __used unsigned long tmp __initdata;
> 
> I apologize for causing the compilation failure with clang. I'm not
> very familiar with clang and I'm not sure why something marked as
> __used would result in the warning mentioned above. Perhaps clang does
> not support attribute((used))? Is there a way to work around this
> issue?

It looks like __attribute__((__used__)) is not enough to stop clang from
warning, unlike GCC. I can likely fix that in clang if it is acceptable
to the clang maintainers (although more below on why this might be
intentional) but the warning will still need to be resolved for older
versions. Looking at the current clang source code and tests, it looks
like __attribute__((__unused__)) should silence the warning, which the
kernel has available as __always_unused or __maybe_unused, depending on
the context.

$ cat test.c
void foo(void)
{
        int a;
        a = 1;
}

void bar(void)
{
        static int b;
        b = 2;
}

void baz(void)
{
        static int c __attribute__((__used__));
        c = 3;
}

void quux(void)
{
        static int d __attribute__((__unused__));
        d = 4;
}

void foobar(void)
{
        static int e __attribute__((__used__)) __attribute__((__unused__));
        e = 1;
}

$ gcc -Wunused-but-set-variable -c -o /dev/null test.c
test.c: In function ‘foo’:
test.c:3:13: warning: variable ‘a’ set but not used [-Wunused-but-set-variable]
    3 |         int a;
      |             ^
test.c: In function ‘bar’:
test.c:9:20: warning: variable ‘b’ set but not used [-Wunused-but-set-variable]
    9 |         static int b;
      |                    ^

$ clang -fsyntax-only -Wunused-but-set-variable test.c
test.c:3:6: warning: variable 'a' set but not used [-Wunused-but-set-variable]
    3 |         int a;
      |             ^
test.c:9:13: warning: variable 'b' set but not used [-Wunused-but-set-variable]
    9 |         static int b;
      |                    ^
test.c:15:13: warning: variable 'c' set but not used [-Wunused-but-set-variable]
   15 |         static int c __attribute__((__used__));
      |                    ^
3 warnings generated.

I've attached a diff below that resolves the warning for me and it has
no code generation differences based on objdump. While having used and
unused attributes together might look unusual, reading the GCC attribute
manual makes it seem like these attributes fulfill similar yet different
roles, __unused__ prevents any unused warnings while __used__ forces the
variable to be emitted:

https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/Common-Variable-Attributes.html#index-unused-variable-attribute

A strict reading of that does not make it seem like __used__ implies
disabling unused warnings, so I can understand why clang's behavior is
the way that it is.

Cheers,
Nathan

diff --git a/lib/test_bitops.c b/lib/test_bitops.c
index 5c627b525a48..28c91072cf85 100644
--- a/lib/test_bitops.c
+++ b/lib/test_bitops.c
@@ -53,7 +53,7 @@ static unsigned long order_comb_long[][2] = {
 static int __init test_fns(void)
 {
 	static unsigned long buf[10000] __initdata;
-	static volatile __used unsigned long tmp __initdata;
+	static volatile __always_unused __used unsigned long tmp __initdata;
 	unsigned int i, n;
 	ktime_t time;
 
