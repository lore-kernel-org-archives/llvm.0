Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B798A446A5
	for <llvm@lists.linux.dev>; Sat,  1 Jun 2024 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717285280; cv=none; b=B1HwDZRZQMM5wom28W/AUeu7oWClPzyTUJFJf2Uu1W3bB/uYcCgL+/IlfsHuZ63oBg+APW3JhlyiDLYVCGsmyi7rH4JbO7cyUpJzT2kOej+HEHtJjJbUQ+5/xD3LSlSHgtLZmNRndc8UvEvt/38Mdfve1UYHB8PpJt9BGLBdgHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717285280; c=relaxed/simple;
	bh=FmvqevEnqgVG3f18m0kOVP2Uxy2zchTMI7AloT2hyhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNA1AzBhahryY9ZefvQrc1r8d5cImQsuGZg6j5GzhDkVPg/+Sq3Afrp71qcZOzBlUf2JWZ9SNFywABXovHLZ5sTSm1ldxMONACsuhs38cHhZpYXfkCj6FXpE8AjyNzvR2afNmCtvwTCvgexI5yABrGVXv4NrENb8lDRb47q1lFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSuHrJOM; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSuHrJOM"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfa7faffa6cso1539932276.0
        for <llvm@lists.linux.dev>; Sat, 01 Jun 2024 16:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717285278; x=1717890078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4FOUlc5EDq/I7DD/WiBWLN5W19MKLu5xl8To+MXnS0=;
        b=PSuHrJOMMIgIabh0INCIwmF9ApZIY13HDndJfm2D19hDChW40mZlgPSaOUsK7S32sU
         mrKKi8It7U9o/hL340+8ZIf04fPFeQcx46tmzd57HL6Asg6xfxW9EudvrwD9CQry09O9
         679OYkWlSi7IOXhcdbqMsKtqjG8rWnRb6spj92I1pmeBTcPB6rZbugyGFNfw17q0+cEM
         jK4+6EQ8NsDhcgA7AQEzw1Gs53m5eWGijYjalGePLACwLI3MqzRKYogM3vpJcUZliIBB
         MGqfNd1e7U4YulT2W5ADBCdSV1WfkhnBd0dhaFaa+iLNkx2HQk2KsVI2tefhSyXykH0a
         M6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717285278; x=1717890078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4FOUlc5EDq/I7DD/WiBWLN5W19MKLu5xl8To+MXnS0=;
        b=rYRscKWV1Npbqr4oHq33JZ5Hu6YixALib/IpPkUEBTUnd2/L7BEMvXnU3AATXFsG+A
         UjNYN+kspDEd6d/Y14YL6d1e0LR+FQpl/ukTadi1tV8JzgMYKwbVON/Iw09JhtjJhmi9
         ymtDQQSotUcH9yzZ4iTGljVmYRcYKKrv2R4Tfim7VowtW8TXKki30pQKMa0Jxzk3nSm5
         kp0yL5krSeeQh8lKmlQ6KNW842eVhYYzpOP429nolGhkaK0C7kJWVfG0gAFxbNGiBTJx
         kMZkiDIMa1ZAyGwpvhyRgIfszGnVYNKbZbcmVyXHdYewsDo53U0xDOmgfZOJDGU9UPaE
         z4NA==
X-Gm-Message-State: AOJu0YxWcT9X2cB9l9ee5LM02WdJa9poa53qqh8F4ySic7BRsQ9YCS3V
	o6vYY8iUncyalnRwbAJtY+5ZrmpFi0bNnYMc53b0n71DGjvCnOc2X7UMTmMzDcXWoQ/4KUMZgka
	+N0Am8DHujJyU1y6F8OU3FiHBHvbOuCsOU9lv
X-Google-Smtp-Source: AGHT+IGoJGrV89s6wgpWQzLAiysiCfFoPAHgS9BdWTDh4qzRR4oPAXSK/QX/xarY7MY0WiL5wbkjQVluVFnWtAem6Lw=
X-Received: by 2002:a25:b1a4:0:b0:dfa:47cf:d293 with SMTP id
 3f1490d57ef6-dfa73dbc2e9mr5287912276.40.1717285277431; Sat, 01 Jun 2024
 16:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405280616.wcOGWJEj-lkp@intel.com>
In-Reply-To: <202405280616.wcOGWJEj-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 1 Jun 2024 16:41:05 -0700
Message-ID: <CAJuCfpF=55_2j8oECernpWq9GXV09RjHexLS7+k4YjaOeO1=Vg@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: proc_do_static_key
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   2bfcfd584ff5ccc8bb7acde19b42570414bf880b
> commit: 8d469d0bee74d3f2d02f0b232933a3f084d9cbf7 lib: introduce early boo=
t parameter to avoid page_ext memory overhead
> date:   5 weeks ago
> config: arm64-randconfig-002-20240528 (https://download.01.org/0day-ci/ar=
chive/20240528/202405280616.wcOGWJEj-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfd=
cc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240528/202405280616.wcOGWJEj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405280616.wcOGWJEj-lkp=
@intel.com/

Fix is posted at
https://lore.kernel.org/all/20240601233831.617124-1-surenb@google.com/

>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: proc_do_static_key
>    >>> referenced by alloc_tag.c
>    >>>               lib/alloc_tag.o:(memory_allocation_profiling_sysctls=
) in archive vmlinux.a
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
