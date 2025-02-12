Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F33820A5E8
	for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739361218; cv=none; b=EtrLoCnxnDlU8kuHRAClgSiSBBY5f++Wbx15w2wA+zRJVYKbn6DSuT9u5KV/W0ZmWyut6zD7ufnqWDUKKcT8Xwd1256kG9RL3GtT+iC2NkMLJNJpGSlQ0DWTeZxuhscsOk0Y3KQuBOlz1BVhVRiNfAAff95FI8riYV6vECXxiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739361218; c=relaxed/simple;
	bh=F/Y6oZFsQtTxUrr9YYdhPnGY9CZOnlMoNkfED6ENZxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ag3FKOYnrPvnLNJ7drv9j6NPNIVnGitex80xWPCsgVjzoGXWKwOkkDg61axmiYw4+T28UIketegK2tW+LwnTBM21wAVVnqz/87Tt0i8+RmbcEK/UzCN0b7qXGmXeQvHwcuTGEOuA2YSk4H6VVv3Y0iM8jp9AZYr3QRllXjS6xL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9m4IyV3; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9m4IyV3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso9940319a12.1
        for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739361214; x=1739966014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ve4GUfiMGd+JubWtGmw2gMxfkFox9RovPabXzAhTLMg=;
        b=K9m4IyV3NWHOF1hdeu4JR1YC1Ic87C3fmgTj7ty+kRysmN98R0ql4f2sCKCo3ovfqN
         b6O8Pe4qQcspBw/6OkGBzmwqehImUSbeJ2WC3Ll4o/3zwur9zPB/qjXnMk6VLcnYeMxB
         He+6YGMLPncyvxBivVm4AZB5q9lrRgCj2N8yOKzAi2zKm/1ZWJEz6cnFSFFOpiyzS69A
         GRDI5uBa7QvrrtiJvemt3BmTGTw3vFs9clM2HNR7JF2CgOBs6uxoYKw7/rbsV8dpFLH1
         0XRnH4Fb59Qlp3Q+yuJQXyRqRWHJdpuyxRNpghbRut7nPc1Ok9q9pNkAU/utVxaXv4r7
         FJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739361214; x=1739966014;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ve4GUfiMGd+JubWtGmw2gMxfkFox9RovPabXzAhTLMg=;
        b=PmFvMCMjXLqvX8nRJtfuqf2osUNT+vVBuKGFJnUeKR3PL6RJanjB5AKAfsfrABPx01
         XY9JSTDq5hUZDOtLvXz7M29wmzZ1Clki7qzXXZDzVn878lvI4ctqGRX+8CyzRiYpgVSG
         B7Ic4IWWCuO54uAwd+HqmJQV2aCr+w4DSev/syCmRZQIh+qT6AYrw4aXlPvgVbyaND5b
         HljfhfTp1tO0kttT36bJAVccn0zXcoYq9NtGairkdLCEHqb1W3wm/3aGBHSU3xVtdNnX
         MBl0qndPhEOJxD02kf+f3PR5ArvGkgHSQtz0TWirKasID+bwugo/OBT/a31O1vRMBnkk
         2G9w==
X-Forwarded-Encrypted: i=1; AJvYcCXnW5acl2+M5C5NC4qWNjEl6ufb0RBhkulqs32+LbVun9EnW7qSTXvgI+BJQQgAHA18/3om@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsa3IbSY8DoBjNMa+L5uRdluuQIfoWsTQCxMZr3LBNo8g9ju+8
	1ZGr8dCa04NeTbaUGXEnKeZorenCAQC2um4XzjHl/VPu5LBHU+tzqfC1U5tVgrI=
X-Gm-Gg: ASbGncv0CjECFrXV8RTUQLK0/3DHgfGwtLQxCYEMzKGnLeLkY9z6frvGr+uTekHqErO
	JVM8hmTGfo8arEBf+Xg96l41IfaQ/MlRhdCWvfmLguoWTkSC5Wc6wpbSK6WhYNvxwt1a6wc9K7g
	QlsJgs6xZ6ZHpyhAsKYSV5UmyGHM63FEM5eYDt8IGp/5Hb/fFHzRcc8UzwQ1Wjl/O47kH+9JzP4
	kqUToH8zuw0QrIHfa+i9D+nAzddmJgeXUYHsyfG3rml3N5PWVvi6C8AzDwwo9PeLEJm8Vamngfj
	kyCT1lkTG3YDstESRXwX
X-Google-Smtp-Source: AGHT+IEW37Ln8Rw9wZCx5hEW7SwbEBmh4Q/tDMUHGy/4+ny+FLprR4PjEwKabrQy3taBn4EwI9h/ug==
X-Received: by 2002:a05:6402:4605:b0:5dc:8f03:bb5c with SMTP id 4fb4d7f45d1cf-5deadd9217bmr2454917a12.11.1739361213657;
        Wed, 12 Feb 2025 03:53:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de46b7b480sm10008537a12.36.2025.02.12.03.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:53:33 -0800 (PST)
Date: Wed, 12 Feb 2025 14:53:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>,
	David Gow <davidgow@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
Message-ID: <3dabe058-2308-4990-8e5d-0af1efd27431@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>

Hi Tamir,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/ww_mutex-convert-self-test-to-KUnit/20250211-000245
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e%40gmail.com
patch subject: [PATCH] ww_mutex: convert self-test to KUnit
config: i386-randconfig-141-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121806.CS6r741y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502121806.CS6r741y-lkp@intel.com/

smatch warnings:
kernel/locking/ww_mutex_kunit.c:238 test_abba_gen_params() warn: shift has higher precedence than mask
kernel/locking/ww_mutex_kunit.c:249 test_abba() warn: shift has higher precedence than mask

vim +238 kernel/locking/ww_mutex_kunit.c

70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  231  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  232  static const void *test_abba_gen_params(const void *prev, char *desc)
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  233  {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  234  	static unsigned int storage;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  235  	const unsigned int *next = gen_range(&storage, 0b00, 0b11, prev);
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  236  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  237  	if (next != NULL) {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10 @238  		const bool trylock = *next & 0b01 >> 0;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  239  		const bool resolve = *next & 0b10 >> 1;

The shifts here are weird...  A zero shift is strange but even the 1 shift
is odd.  The current code is equivalent to:

	const bool resolve = *next & (0b10 >> 1);

But changing it to:

	const bool resolve = (*next & 0b10) >> 1;

Doesn't make sense either...  Probably that makes less sense actually.
What are you trying to communicate with this code?

daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  240  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  241  		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "trylock=%d,resolve=%d", trylock, resolve);
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  242  	}
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  243  	return next;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  244  }
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  245  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  246  static void test_abba(struct kunit *test)
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  247  {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  248  	const unsigned int *param = test->param_value;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10 @249  	const bool trylock = *param & 0b01 >> 0;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  250  	const bool resolve = *param & 0b10 >> 1;

Same.

70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  251  	struct test_abba abba;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  252  	struct ww_acquire_ctx ctx;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  253  	int err;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  254  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  255  	ww_mutex_init(&abba.a_mutex, &ww_class);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  256  	ww_mutex_init(&abba.b_mutex, &ww_class);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  257  	INIT_WORK_ONSTACK(&abba.work, test_abba_work);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

