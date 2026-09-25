Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D72D63E5
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361388; cv=none; b=sVTfi//r95VhWeieRm1w9Z2mdVWY1GGQKf+1LrDyWIlBaybrstZLw9/DtV2D4HI/9avI+sjoVt5ha5JLQmpSI4qDtk3QlL1CXqKjyQDETFa4X0c/YIvqDqDz37gCT5zcHa8/yQWzZtQfjVcdJH5JFkw62XUTo8sRY9M20wakMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361388; c=relaxed/simple;
	bh=ttsxstSQkiFn6W0emOQF/sZm8xB1JLtPixjXhsyDNfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yr4qdOMb5/T+piG7h4q9plPfseeKTlp9H8fpKTRrPQFtjO2gtxzAnfhpM1BvYxryP0RS+x1fTOHuvdeDuJL6H/0Im95YftKZWRKLduGcdrm1G8SkZ88WwPDvCfXIt/y6zuVzXrekF8vHS/nx6lloME/2A+/mKaKUMFW2XFTKc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N847Y7n0; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N847Y7n0"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e820df9dso994694e87.2
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 11:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361385; x=1790966185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTI8JOYIkeEhDhIISZUKJnYZH98Is2I5ZYdQTGS/9Yo=;
        b=N847Y7n09LqJhzwFWRBPs4p9J1i0WpOOR5OYf7+jZsJDcxFO48Nifr5N2jGwN/bimQ
         c7XlpICN2FRGzC4A2UxCGKIXiki01CZAB4w6XXd/lFeyUU1659abV2kFyoKHhUrT3xl0
         29faSO4vcarfQzq1hqgFDfF7ty5LNvyaFp+LT0HhugTCvJu3og6oZasEhdhyb7Gk2Goo
         WiTch38L6jug5O8TrjqJ1dl5nMjk9MYf7axDM3MmcyHf0rf9z3Brwh11G9BvsNhpTqQk
         kPzCPKtYDQVGu/rcoRh9JQWvRTfYeib9ZphQu8DCWCH2DGlUelCVlgjSXa0n90JjaZXC
         opPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361385; x=1790966185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTI8JOYIkeEhDhIISZUKJnYZH98Is2I5ZYdQTGS/9Yo=;
        b=ttOrB6dC4ZTz1WFLFWDSXjLgOz9wtDLW0OFJnwNl5t63X1Tgj6WnrgL12WA4rN0/M8
         0kT/iO20DzNpjyKrcpaf2N5XtsDVXVbhOgwG82r+zbWzIvhMEiqOJ9JyE/9EuVH1Ohd1
         4AmYNCmpKYYhVvkeeDKoVHH/grQ865dh/rxBkt3ZcywpoPBCk2BWNJjlwH44o35jVF4Z
         BLMaMc9y5rz6gkqKY5kPA2msEoDI4ZR2yOJzLH8NaIP5X1RUJcRKH4OROtIbQJfuTdxM
         PPTMKsy/OrOIQd46DZUouF+3aOUdNYBDxrxQg8kdWX93xS3RVnWJ24DDKmio7bTkw+7A
         myUg==
X-Forwarded-Encrypted: i=1; AKwUvBw4jVGdQROu899i3aVxOb0Rx7el0BiQOY6bDnr8sizkxYM6Xt7e0yAANrSaoddOHKnCDJVg@lists.linux.dev
X-Gm-Message-State: AFuF++meAlvlXzmSX+pigEw58kiH5vwjwgy29KIgF8Her0eD+DBJ37/w
	GCHgPyo8X/4L6uwryxaA3RahTQnnrVRozEd1AWJgVSPqAFy/JkRget2E
X-Gm-Gg: AYBFou3uUKd0FQpJzhLq96rz53lpsiE3nt2JMoZ6/yqGqN/orUCs8UlXgkPwFqGvyEn
	mQUAAoyTOVtYLl68fT0jllIAuNOQflfElC44NqMBs59F7Al7Zi0rF0bL265DjcGLt/Cp/ihRRUV
	MFs7lhyLyq1S/QZWJhbTbFk/w3qqvk925wZLjDYJUtQX7J6zPWmbCXRf3BiDrvE7c8NiDF5rbEM
	Kj3WP1JGu8HI9YYembuzCUhjntDpPLu5eF4aAY/eCyVGVShHQaIw4q8/fW75uxQ7Wm58mmjvV7m
	MCIBZokcE2PWetah74f5ggy6Y/aq8jXbyz2l6dxPAzpk8Tw0Ji70JDHMMxTUIU590a6qd+cCFc9
	v7mx9W9f8C1578q4f8f2wmCH0HpCznWt3xvxN6QZGqraYJ15DVjlMgVQtTqKwG9DDVpPGZg9cUU
	kB4sqlIjkuGiJWwUAbFUcWD3QHk4kYk5nlmAPnt37YDEcPpePMJ2gxxi/Q2j0IRIEhHgxXoXXUQ
	MgUzg/nG80O40m2IQNSvCva7ZqtR+N7oYHtfgyayT8QhKm9jT8/MCkewT54AGCzHm/eQFUzx0AC
	Hlk36g==
X-Received: by 2002:a05:6512:128a:b0:5b6:183d:2a72 with SMTP id 2adb3069b0e04-5b8df092a18mr2193674e87.18.1790361384899;
        Fri, 25 Sep 2026 11:36:24 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e85e560esm649366e87.73.2026.09.25.11.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:36:24 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 09/10] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri, 25 Sep 2026 21:36:05 +0300
Message-ID: <20260925183605.129614-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ara694wYo2qwBo5j@ashevche-desk.local>
References: <20260918122517.377565-1-zoone.rupert@gmail.com> <20260918122517.377565-10-zoone.rupert@gmail.com> <178992913316.706584.1446996024286841775.b4-review@b4> <20260921183106.231972-1-zoone.rupert@gmail.com> <20260922005347.069c490e@jic23-hlaptop> <20260925175816.75842-1-zoone.rupert@gmail.com> <ara694wYo2qwBo5j@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 25, 2026 at 09:18:31PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 08:58:16PM +0300, Rupesh Majhi wrote:
> > context_lock_struct() is needed because clang rejects the existing
> > __acquires(indio_dev) on a type that is not a lock. The header
> > suppression list hides that today.
>
> But why you can't supply the full lock to the __acquires()? If
> to_iio_dev_opaque() is a macro it should all work.

to_iio_dev_opaque() needs iio-opaque.h, which drivers do not include,
and pulling it into iio.h makes clang 23 crash on the container_of().
An accessor works though:

  struct mutex *__iio_dev_mode_mutex(struct iio_dev *indio_dev);
  void __iio_dev_mode_lock(struct iio_dev *indio_dev)
	__acquires(__iio_dev_mode_mutex(indio_dev));

With the core helpers locking through it too, clang checks them as
well, so context_lock_struct() and __no_context_analysis both go away.
I will use that in v9.

Rupesh
