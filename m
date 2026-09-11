Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10542C4F7
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108892; cv=none; b=saLo8fWDHNb27if1M7G0j46EOg7Bg8WqH8mY1fGan3B8nezENFzuUDoVmcTMM2um0sirFKVHI5BQDNA+c1g/IWTHnPsMtHv0c5IhZo64bEwhZAx9fMbQlwlQ2O0N03PD8BVo0HmSPZsmw2IM8mxbSexQa1xEAh2g7CBhg1bD33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108892; c=relaxed/simple;
	bh=cBSJ7IpgdZG9WZqNT7t64eRfTKJAWfYRAikJYu7cyIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBmtVnAnJuuSpaJZOIfqn9fVZ57ocQ/TpYQ4dMqGWeLb0QlcIV9dUp9OYqAJ4jofoFfHdsGx30d7SiC7KOsbb3KoK9ULI3ZgXF9frncBnqyhsv6h4EV6mw9rYl2EypvpiZSQTgex8Abl1i0J1UyrXL8+6p1jro0oMfzIIVAZC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ircJB2gM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ircJB2gM"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso450633a12.2
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789108879; x=1789713679; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqnrRH3JnuYg9d568dJH6IC4tGq2CueKpd9gXMr6rl0=;
        b=ircJB2gMVFL+3O5eKzqzZubpYdgpMvrCpuB+VEa6qnbaZuF/MTDJldIOruGtprH2QP
         G8nphzpbkM2UvDbBs0y7MgnmmlaW3rie2E0Jpi3eeWC458EJcMZCU/mQ75N6fGA3gcbo
         Fdel/kbo14AVc7fE6OgO0DIKIrGiXRAdMr2yypFNHC1zzq2xidbRnPBOqp2sHMxccug+
         Bnddx60McNOVOtER5St3n3mgk8058CgqUqv58R0eh4//zloqW5CXYqaxoVj84raBFa7M
         FRR63ABUTyms2TBemTo0loDYc9iaTLfplX6fhr8jZZmiNDHfpM29kmt+nn9gxDD2Xlhc
         8rxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108879; x=1789713679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqnrRH3JnuYg9d568dJH6IC4tGq2CueKpd9gXMr6rl0=;
        b=qqD4uYGGwwFsVo/C46RMYQnW0+X9AgFMAKTK969OJYf2e2qUshyfyGRwXoT6cUjdxT
         HPgctcyPsYpfazgs3CTGb1Me2OVejpf98ltsVzpYQUPWDNC5FaPm42qerjUwwtoJSDwV
         ztNSgLe3H87sQ6OT6QAR+VlL7ldkdZWJPytyHjf2/GwNe8971v0HCnKKn1ktlOPXpgHx
         OMAm1D+yDrD6J7uNT/PEmOVb5kIKCA1o/22Jj6m+rJsYYaw0uJ12VMoGmlDyQQ0N08BB
         RoSg3m+hf+AnafTetWkQdnHZ6Ec1rubbXCCbbaOlegBLKJe2G/sw+xAVE2JureccFfB2
         NSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVdE/QfGSWrMvKvNalbP5RM5Y+PjRsimOHwLggGGV3sMW2LTi5fOkZWKMyjDEyWrKWxefT@lists.linux.dev
X-Gm-Message-State: AFuF++n41P79IqpIRiJYtoH1AXzsVlSjSNgHmXo9GwadYzNPW9v3SxYS
	pxSOIMylTp5t9AZQeQRYm3Sz377jJKWtLucLJ++sW23boOQD8uezRpeE
X-Gm-Gg: AYBFou2zM3mNaAL4kdYGVG7KO4kQXm3CVgbBMgEbC6pmRguABNwZeW6p0CyQIPT/9Az
	gJZSqfMinl5+JtJ4WDtosn3vmv0VrBxLnBh9hHiGVJgP8mSyZ2/QSPcg15ZU1dKdD8gh03WWlcy
	hRWy5gXewafSFQJMOA8aeYA30RmhiW2QCKPon6n61sFtM4KL/U7RejnGc+h3QxQf4CWRbFgmKDc
	K5Uut2nb64UEBG104Ya69knSX3K6UwujU89oELMrhxm0V56hzfyeZF8eyvcu4YQ9pPBL9xhRO7J
	arX3DDn678py+0uFN/95oY4uXXFHFbagYeQeFVPPil4861HRu8ncqsBa1Z1jQA+u3h6K+nSnM/F
	vs2T4nFnBgkh6sQ61vg1Ck3JI0R5rCJ/81CSvKz2x56Yi/kReBLyd5w/Tj5ifSVsPEa3lCYc0hl
	GdppblYaUcRFrFiAUy3pe+GEw+ah5WuPyGBlvnitYlTcLyG9ZfuiQY8J8EbDGKPzz9WNhcYadBc
	HlwXC4DI5HxWzcMtzGOCXyOnz8TSVJUbA==
X-Received: by 2002:a05:6a21:a95:b0:3da:6bdd:2c74 with SMTP id adf61e73a8af0-3daed306372mr6132777637.10.1789108878903;
        Thu, 10 Sep 2026 23:41:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:e7d0:6323:1ab1:99bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615a84bsm674786a12.1.2026.09.10.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:41:18 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:41:14 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: lib/base64.c:58:18: warning: implicit conversion from 'int' to
 's8' (aka 'signed char') changes value from 131 to -125
Message-ID: <aqOiihm0Mz0zCnw0@google.com>
References: <202609110514.S0a0FD6a-lkp@intel.com>
 <20260910223520.GA3375179@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910223520.GA3375179@ax162>

On Thu, Sep 10, 2026 at 03:35:20PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 11, 2026 at 06:07:30AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   50d05c7c76c96b90462f24debacca971d2e86713
> > commit: c4eb7ad32eab13ba64cc452c6f43d518b63f5e03 lib/base64: optimize base64_decode() with reverse lookup tables
> > date:   10 months ago
> > config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260911/202609110514.S0a0FD6a-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110514.S0a0FD6a-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609110514.S0a0FD6a-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 131 to -125 [-Wconstant-conversion]
> >       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
> >       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
> >          |                                       ~
> >       49 |         [0 ... 0x1f] = -1, \
> >       50 |         INIT_32(0x20, ch_62, ch_63), \
> >       51 |         INIT_32(0x40, ch_62, ch_63), \
> >       52 |         INIT_32(0x60, ch_62, ch_63), \
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
> >       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
> >          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
> >       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
> >          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    lib/base64.c:43:48: note: expanded from macro 'INIT_4'
> >       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
> >          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:42:48: note: expanded from macro 'INIT_2'
> >       42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
> >          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:34:42: note: expanded from macro 'INIT_1'
> >       34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> >          |                                              ~~~~~~~~~~^~~~
> >    lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 130 to -126 [-Wconstant-conversion]
> >       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
> >       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
> >          |                                       ~
> >       49 |         [0 ... 0x1f] = -1, \
> >       50 |         INIT_32(0x20, ch_62, ch_63), \
> >       51 |         INIT_32(0x40, ch_62, ch_63), \
> >       52 |         INIT_32(0x60, ch_62, ch_63), \
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
> >       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
> >          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
> >       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
> >          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    lib/base64.c:43:48: note: expanded from macro 'INIT_4'
> >       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
> >          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:42:24: note: expanded from macro 'INIT_2'
> >       42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
> >          |                        ^~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:34:42: note: expanded from macro 'INIT_1'
> >       34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> >          |                                              ~~~~~~~~~~^~~~
> >    lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 129 to -127 [-Wconstant-conversion]
> >       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
> >       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
> >          |                                       ~
> >       49 |         [0 ... 0x1f] = -1, \
> >       50 |         INIT_32(0x20, ch_62, ch_63), \
> >       51 |         INIT_32(0x40, ch_62, ch_63), \
> >       52 |         INIT_32(0x60, ch_62, ch_63), \
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
> >       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
> >          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
> >       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
> >          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    lib/base64.c:43:24: note: expanded from macro 'INIT_4'
> >       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
> >          |                        ^~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:42:48: note: expanded from macro 'INIT_2'
> >       42 | #define INIT_2(v, ...) INIT_1(v, __VA_ARGS__), INIT_1((v) + 1, __VA_ARGS__)
> >          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:34:42: note: expanded from macro 'INIT_1'
> >       34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> >          |                                              ~~~~~~~~~~^~~~
> >    lib/base64.c:58:18: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 128 to -128 [-Wconstant-conversion]
> >       58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
> >       48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
> >          |                                       ~
> >       49 |         [0 ... 0x1f] = -1, \
> >       50 |         INIT_32(0x20, ch_62, ch_63), \
> >       51 |         INIT_32(0x40, ch_62, ch_63), \
> >       52 |         INIT_32(0x60, ch_62, ch_63), \
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:46:50: note: expanded from macro 'INIT_32'
> >       46 | #define INIT_32(v, ...) INIT_16(v, __VA_ARGS__), INIT_16((v) + 16, __VA_ARGS__)
> >          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    lib/base64.c:45:49: note: expanded from macro 'INIT_16'
> >       45 | #define INIT_16(v, ...) INIT_8(v, __VA_ARGS__), INIT_8((v) + 8, __VA_ARGS__)
> >          |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    lib/base64.c:43:24: note: expanded from macro 'INIT_4'
> >       43 | #define INIT_4(v, ...) INIT_2(v, __VA_ARGS__), INIT_2((v) + 2, __VA_ARGS__)
> 
> I have not looked into the legitimacy of this warning yet but it comes
> about from a recent change to fix -Wconstant-conversion in clang:
> 
>   https://github.com/llvm/llvm-project/commit/a5ef934a8d295dc03be3960f2b3744ec2e53238e
> 
This looks like a false positive rather than a real bug in the C code.
The warning triggers because (v) - '0' + 52 evaluates to >= 128 during
macro expansion which overflows s8.

However, that branch is guarded by (v) >= '0' && (v) <= '9', which is a
compile time constant false for those values, so the branch is never
taken. It seems clang is diagnosing constant conversions in
unreachable branches of compile time conditional expressions.

Regards,
Kuan-Wei
