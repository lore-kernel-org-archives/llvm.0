Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872545DF14
	for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688953; cv=none; b=Sj9OnW1Hrfnkiq1C5CVawCWap577PCePfoGaPTuy3mX3n2yz3roKX4cpkQ27BFNMXBKRHV7tLPI8DrtiWaXLz37UEHzCTNHvUYHwFiu0KzoV5jS0DHyL9yPgzxulhtB7IRw3WTJmnCFwVsi/KLfC2tFEDCJ3KSRHNisugummX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688953; c=relaxed/simple;
	bh=J1Eh87exaeIqhSJ2xckKK13Ql6copBnHSNLxq/anaEY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBNbwd+h8V/9Kq9peSiLyptO05d9qT8kTbZkd5qqK4VJNABtAB5zdoYeAVWt05FhT2k3i0HIYgXeRtCP2/xuTa5UGuSMY43ydhhlqXOFciQDqfp7TGfu9Alkembeh/0gbVY0Q02KjjqcAPu6SGcp1jbSCCflxGdkqLO1U6EwMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nPJ7MbWj; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nPJ7MbWj"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57b9so1354770241.3
        for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 00:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706688950; x=1707293750; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJuQVGRQgRfQiaBbW4EPCfZyZEN2R21Dmrhs2oCHDQY=;
        b=nPJ7MbWjjduR91bCAYErSHp1xeEc1f1vRDCNmGDf6URqqJYIYtfDHQszANU5YrEZXp
         yRU3iw1XOL4vE3fiTRRU6XjclWGl1e20eJHd9M7kk9JE9PWk/Ujfe2KSo1kPW01AU9f/
         t591GQ2m09r08QUjokHQjHtdPZowfKqDUM7LqmhVQOpKzqsKXB96EynfO2RQxvrq+j2s
         YF9RjERQsOlxOTMAH8UIzPfkOMXvVgeyu2FNlyqXClczIHQ/JqIkUxGLSiDeldDDKWHw
         dKmpDrwkC5A6leGNIvJJdYPm1vcMCsf1HPCw5akdxbBhjt7CHkw/pPPA8xp9n4Z6L8vx
         PGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688950; x=1707293750;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJuQVGRQgRfQiaBbW4EPCfZyZEN2R21Dmrhs2oCHDQY=;
        b=LsAK5I+h80BBzIOarWccv3GQDmcCqelzawsZA/jvL5LIgqrcvBM7Efmo7LNdPX8ZKE
         YPrlFvGQCcnWnbg1od7ww4TsDC6loeC9DW2INmNk12HpMJQnwOLrqEs18euVrhePx2HB
         TL/OD+5hauJHoPMlpo+UB9X1TkcX3VC/tXAnrEAJJ3e++fi9sC71S+hqE2YNTogc2b3L
         l8gp2F9HufmEtuN3TIqtFCthsiFDkIbb12BKTJ7DRXzxNRbV4EhLqwXZSPRqdEaJCx8C
         xholcBIBMuI6WT4NToZNO8gs8FzVg0p0HVW1c/a7KBrAY+CZrhc3blRJtK06tCr0sxiA
         6t5A==
X-Gm-Message-State: AOJu0YyOfWxTIzWqtaIZo7oK1p9nUKmdkrnCB2shMGsmHH0BFF3F78FH
	XkfUOtfY23Icgu6PCh7eKZ2MZXQ4+tURgJ/Z0/KT+XvOtS3JZQE5TmkydB0bnjZeBA0kJ/fMhla
	LVfKoeDo13QyujM/M/lUzBmwh4DHEWVi1mfurzw==
X-Google-Smtp-Source: AGHT+IHmH+EcUVvbDOhbGLOKPjWQwf2roORx1o7B063JUtriItFaM5RD1XHVGWJ3oUTkmxz2fozm6H+WuPvsPTItnuw=
X-Received: by 2002:a05:6102:e11:b0:467:c665:f567 with SMTP id
 o17-20020a0561020e1100b00467c665f567mr559840vst.35.1706688950233; Wed, 31 Jan
 2024 00:15:50 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 31 Jan 2024 00:15:49 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <202401310855.aA6wzlm2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130124828.14678-21-brgl@bgdev.pl> <202401310855.aA6wzlm2-lkp@intel.com>
Date: Wed, 31 Jan 2024 00:15:49 -0800
Message-ID: <CAMRc=McDJK61czn-yDdHAN6e5YWVb9UVG5pFJx=NynFaxSTB4g@mail.gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 01:41:11 +0100, kernel test robot <lkp@intel.com> said:
> Hi Bartosz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on brgl/gpio/for-next]
> [also build test ERROR on linus/master v6.8-rc2 next-20240130]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-protect-the-list-of-GPIO-devices-with-SRCU/20240130-205537
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> patch link:    https://lore.kernel.org/r/20240130124828.14678-21-brgl%40bgdev.pl
> patch subject: [PATCH 20/22] gpio: protect the pointer to gpio_chip in gpio_device with SRCU
> config: x86_64-buildonly-randconfig-004-20240131 (https://download.01.org/0day-ci/archive/20240131/202401310855.aA6wzlm2-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310855.aA6wzlm2-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401310855.aA6wzlm2-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/gpio/gpiolib-sysfs.c:481:3: error: cannot jump from this goto statement to its label
>      481 |                 goto done;
>          |                 ^
>    drivers/gpio/gpiolib-sysfs.c:490:25: note: jump bypasses initialization of variable with __attribute__((cleanup))
>      490 |         CLASS(gpio_chip_guard, guard)(desc);
>          |                                ^
>    1 error generated.
>

I fixed it up like this:

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c45b71adff2c..6a421309319e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -477,8 +477,8 @@ static ssize_t export_store(const struct class *class,
 	long gpio;

 	status = kstrtol(buf, 0, &gpio);
-	if (status < 0)
-		goto done;
+	if (status)
+		return status;

 	desc = gpio_to_desc(gpio);
 	/* reject invalid GPIOs */

There's no reason to jump to done here only to print the error code.

Bart

>
> vim +481 drivers/gpio/gpiolib-sysfs.c
>
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  464
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  465  /*
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  466   * /sys/class/gpio/export ... write-only
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  467   *	integer N ... number of GPIO to export (full access)
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  468   * /sys/class/gpio/unexport ... write-only
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  469   *	integer N ... number of GPIO to unexport
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  470   */
> 75a2d4226b5371 Greg Kroah-Hartman  2023-03-25  471  static ssize_t export_store(const struct class *class,
> 75a2d4226b5371 Greg Kroah-Hartman  2023-03-25  472  				const struct class_attribute *attr,
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  473  				const char *buf, size_t len)
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  474  {
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  475  	struct gpio_desc *desc;
> 513246a34b8dc5 Bartosz Golaszewski 2023-12-21  476  	int status, offset;
> 513246a34b8dc5 Bartosz Golaszewski 2023-12-21  477  	long gpio;
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  478
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  479  	status = kstrtol(buf, 0, &gpio);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  480  	if (status < 0)
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01 @481  		goto done;
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  482
> f13a0b0bb46f07 Linus Walleij       2018-09-13  483  	desc = gpio_to_desc(gpio);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  484  	/* reject invalid GPIOs */
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  485  	if (!desc) {
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  486  		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  487  		return -EINVAL;
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  488  	}
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  489
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  490  	CLASS(gpio_chip_guard, guard)(desc);
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  491  	if (!guard.gc)
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  492  		return -ENODEV;
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  493
> 23cf00ddd2e1aa Matti Vaittinen     2021-03-29  494  	offset = gpio_chip_hwgpio(desc);
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  495  	if (!gpiochip_line_is_valid(guard.gc, offset)) {
> 23cf00ddd2e1aa Matti Vaittinen     2021-03-29  496  		pr_warn("%s: GPIO %ld masked\n", __func__, gpio);
> 23cf00ddd2e1aa Matti Vaittinen     2021-03-29  497  		return -EINVAL;
> 23cf00ddd2e1aa Matti Vaittinen     2021-03-29  498  	}
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  499
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  500  	/* No extra locking here; FLAG_SYSFS just signifies that the
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  501  	 * request and export were done by on behalf of userspace, so
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  502  	 * they may be undone on its behalf too.
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  503  	 */
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  504
> 95a4eed7dd5b7c Andy Shevchenko     2022-02-01  505  	status = gpiod_request_user(desc, "sysfs");
> 95a4eed7dd5b7c Andy Shevchenko     2022-02-01  506  	if (status)
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  507  		goto done;
> e10f72bf4b3e88 Andrew Jeffery      2017-11-30  508
> e10f72bf4b3e88 Andrew Jeffery      2017-11-30  509  	status = gpiod_set_transitory(desc, false);
> 95dd1e34ff5bbe Boerge Struempfel   2023-11-29  510  	if (status) {
> 95dd1e34ff5bbe Boerge Struempfel   2023-11-29  511  		gpiod_free(desc);
> 95dd1e34ff5bbe Boerge Struempfel   2023-11-29  512  		goto done;
> 95dd1e34ff5bbe Boerge Struempfel   2023-11-29  513  	}
> 95dd1e34ff5bbe Boerge Struempfel   2023-11-29  514
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  515  	status = gpiod_export(desc, true);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  516  	if (status < 0)
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  517  		gpiod_free(desc);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  518  	else
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  519  		set_bit(FLAG_SYSFS, &desc->flags);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  520
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  521  done:
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  522  	if (status)
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  523  		pr_debug("%s: status %d\n", __func__, status);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  524  	return status ? : len;
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  525  }
> d83bb159f4c6af Greg Kroah-Hartman  2017-06-08  526  static CLASS_ATTR_WO(export);
> 0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  527
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
