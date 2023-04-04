Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC38808
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 07:22:48 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id cf7so37589732ybb.5
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680592967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OB8OSUN7Vvr0sVYshNaX1SO5hOSZi9YBfiFSXREOEkI=;
        b=TWtEM95XyhvTb/wU2EpSFRep4YUtOYRIvjQWk09A/4LHnSNP+0lW+T/3cJnpqMVyUw
         O3/6ThxemKiaCvTXxPUrHS5xXV3U9olL3TcNDiBjeWCezGph9CZLqZT2roj5P0CbYi/X
         GpKHBlr7mo0CyxUMo5CLEXs0jzsedpGaq/k6ZMTtRwyJYOzoOOom88CT2XCuRaBSUFeh
         nxmOc5s/o9COtu5SMBY48d2tEo2EWb7iTmTpUl0mCSgVFPqL/uzoEvEZ4SEn5S0L1ssu
         tiFvpltlyNhLGWcCYe07WYKD0IlCmoCbcF4i+iuo6d0sSk/bRg20N3LR6PKgZF8AjvY+
         JrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB8OSUN7Vvr0sVYshNaX1SO5hOSZi9YBfiFSXREOEkI=;
        b=44D1zDmMe409+tWeqZhmpy9TSTKVN1/DGroZ7FvIRLncZeFxQXM6YEiIAJO4fCGD1m
         TSrVfvAaicFC+xc7dzAjL6jOR88GbQBEqW+Nf3BnH7moHjzCg9cEL9vWyLXPBLZgaaWe
         G4Wf5iaTJMAuLCQVKK+091ehWp6vzPj8Osx+Z3BE2uNHe8DGKWeSJDSBxdNHC8e7H4Iv
         bIVTRzMi11cldAVCvE/ROa2dEx5bquPQ6q+Y/6hKHFi2zQXUWliR+uYeg+ODmXPFWh9Z
         I6hO2LHrp/DgmE4YbUR+6jk0Gm6/GTUMFwhF/6rZIigFQGWirUB7y08aI3qxocyhu/4r
         KPOw==
X-Gm-Message-State: AAQBX9dExwpR0DvRuI8BPyU9Q32+FAR5YK006iC6xFDV205t+Gb4hWLu
	ktGKAi9J2VSCYcCF36QIv0mdW/ikwTs5qPOkX7PIhw==
X-Google-Smtp-Source: AKy350abU+tGGnGRM5zvhWPceLnBcyt6uZGcTor/qlHy1+gIjGkIQdbLJBmC9a7TR+xzeoxBpCOPmSMebyXdmZhtt6U=
X-Received: by 2002:a25:ca46:0:b0:b74:77fa:581d with SMTP id
 a67-20020a25ca46000000b00b7477fa581dmr1030652ybg.4.1680592967245; Tue, 04 Apr
 2023 00:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304040830.kPrP1Qew-lkp@intel.com>
In-Reply-To: <202304040830.kPrP1Qew-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Apr 2023 09:22:36 +0200
Message-ID: <CACRpkdaHRT7Gx3WZRzT+-6zsUmigHr4+56YCiUH6+T6ArV=Lhg@mail.gmail.com>
Subject: Re: [linux-next:master 932/8744] arch/mips/ar7/gpio.c:19:19: error:
 field has incomplete type 'struct gpio_chip'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 2:58=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:

> Note: the linux-next/master HEAD 31bd35b66249699343d2416658f57e97314a433a=
 builds fine.
>       It may have been fixed somewhere.

Yeah it is fixed somewhere:

commit 424b21e01aafc98a9c086f00b3ad1874302b92fc
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Mar 8 15:52:53 2023 +0100

    mips: ar7: include linux/gpio/driver.h

(...)

Yours,
Linus Walleij
