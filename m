Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE351353A87;
	Thu, 10 Sep 2026 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079727; cv=none; b=MSwlB7Gi+xjvGS8J3jZOIJBKTXh/pmG2AuCMs/4oS5q8Ox8OX4/xseqmjLLbZcqSqt9DLUjHcwJTbc1wUV4j/cZy++bIoxEVcHNOxi/NK/kWDHeBAyoQKI+XZv+mvnZAILRPA1weIiBBp4IuAfxjZNuqt1MekDRllfgujP5dWRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079727; c=relaxed/simple;
	bh=0VW+qtvSUgh4xyQN099hXLbA85ebdbDwoAQ1pLlmu/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7qI4zCeLWYLpBUX4T4jhgMIAdfubsQ0QX6h/YRfCg1b3J/QYVIPOLraF2822oc1/Fh37a/eH2A4WYzQw8/kSGcKGGD0FOm7HCeXIGCIIciab6/lT11BVYkOTd71HLnCeBvEOkwOZXLPIVjKXiUmIJJ2yVCaAs7aS1PXV39vLeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjfXeFxv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjfXeFxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9654F1F000FF;
	Thu, 10 Sep 2026 22:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789079725;
	bh=STkBHGrY8NPn9tPJq9ZdQdMGtxmiRBYe6smZsSwC3qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fjfXeFxvAmvRp5i10QZQUXJHVhAIlZR2E5BxaUeqTMPZBl0d3wuAExfDvBibSwnDC
	 yr3Bhcxo6q93dW5Yd6zgLhCM36coB5mJgWNID03esCLuLu0gWhkCLFaRmX2mWb5MsA
	 G6L8IrLiVJDrqChJr1OYCIfA5FtTnxxX4N2tXrPiHuKFpOp0a/DQHmpaVS85/JRMa6
	 PLVDcSZxU7GRQul6JODgziZN0vnr3e3ZRLQxuU7xxq6jLaDeahBA/ffOeeSPeovLqq
	 sqQsHclNV/fDSSfL0jSxDleafLFwKzVIiJfEK80fjdeCEsjmMyo9qyc784Hcn02G8W
	 c2H8RPwQ6cmsg==
Date: Thu, 10 Sep 2026 15:35:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: lib/base64.c:58:18: warning: implicit conversion from 'int' to
 's8' (aka 'signed char') changes value from 131 to -125
Message-ID: <20260910223520.GA3375179@ax162>
References: <202609110514.S0a0FD6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609110514.S0a0FD6a-lkp@intel.com>

On Fri, Sep 11, 2026 at 06:07:30AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   50d05c7c76c96b90462f24debacca971d2e86713
> commit: c4eb7ad32eab13ba64cc452c6f43d518b63f5e03 lib/base64: optimize base64_decode() with reverse lookup tables
> date:   10 months ago
> config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260911/202609110514.S0a0FD6a-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110514.S0a0FD6a-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609110514.S0a0FD6a-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 131 to -125 [-Wconstant-conversion]
>       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
>       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
>          |                                       ~
>       49 |         [0 ... 0x1f] = -1, \
>       50 |         INIT_32(0x20, ch_62, ch_63), \
>       51 |         INIT_32(0x40, ch_62, ch_63), \
>       52 |         INIT_32(0x60, ch_62, ch_63), \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
>       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
>       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
>          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    lib/base64.c:43:48: note: expanded from macro 'INIT_4'
>       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
>          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:42:48: note: expanded from macro 'INIT_2'
>       42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
>          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>       34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>          |                                              ~~~~~~~~~~^~~~
>    lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 130 to -126 [-Wconstant-conversion]
>       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
>       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
>          |                                       ~
>       49 |         [0 ... 0x1f] = -1, \
>       50 |         INIT_32(0x20, ch_62, ch_63), \
>       51 |         INIT_32(0x40, ch_62, ch_63), \
>       52 |         INIT_32(0x60, ch_62, ch_63), \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
>       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
>       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
>          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    lib/base64.c:43:48: note: expanded from macro 'INIT_4'
>       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
>          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:42:24: note: expanded from macro 'INIT_2'
>       42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
>          |                        ^~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>       34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>          |                                              ~~~~~~~~~~^~~~
>    lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 129 to -127 [-Wconstant-conversion]
>       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
>       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
>          |                                       ~
>       49 |         [0 ... 0x1f] = -1, \
>       50 |         INIT_32(0x20, ch_62, ch_63), \
>       51 |         INIT_32(0x40, ch_62, ch_63), \
>       52 |         INIT_32(0x60, ch_62, ch_63), \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
>       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
>       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
>          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    lib/base64.c:43:24: note: expanded from macro 'INIT_4'
>       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
>          |                        ^~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:42:48: note: expanded from macro 'INIT_2'
>       42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
>          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>       34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>          |                                              ~~~~~~~~~~^~~~
>    lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 128 to -128 [-Wconstant-conversion]
>       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
>       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
>          |                                       ~
>       49 |         [0 ... 0x1f] = -1, \
>       50 |         INIT_32(0x20, ch_62, ch_63), \
>       51 |         INIT_32(0x40, ch_62, ch_63), \
>       52 |         INIT_32(0x60, ch_62, ch_63), \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
>       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
>       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
>          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    lib/base64.c:43:24: note: expanded from macro 'INIT_4'
>       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)

I have not looked into the legitimacy of this warning yet but it comes
about from a recent change to fix -Wconstant-conversion in clang:

  https://github.com/llvm/llvm-project/commit/a5ef934a8d295dc03be3960f2b3744ec2e53238e

-- 
Cheers,
Nathan
