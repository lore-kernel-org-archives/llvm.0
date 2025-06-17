Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371002C08B6
	for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153736; cv=none; b=Ktjaabm8l6Ng7xDBMNkx+9ic6eBCOQ1fipFGqY2cVE2De4ASI7fq+M9c8/c4GtA+5GAj81hus4Yfxmm5agcUGFDpb3e2AB2wP2Qnl/dCpGzkwzMyIYUU+es/9atj6bZJP5zuMMgr3lr+sBZbYhyeyq7yN2oBk1m/GDZI7+/gN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153736; c=relaxed/simple;
	bh=yU8B2S0rvUJRYS4eDEpg/4azZ5qYIqxzpKab9dnBZz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c88eLMF8PdwmI/AJvvx8iGDjHszp6XBeGXYlwV9zU2Da6R0K91FRlEqJAtjqMnSIcichUlktm2cxcdamYGm68f4uaVgYI/2ANDAcQI6DFuYytVQ6+thboa/+XD8JDSqx7rhalj/puW3oCxB25LeVf79Qsc4y2yRmJqHGCRjDx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HboJ9PAC; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HboJ9PAC"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87f25076697so688108241.2
        for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750153734; x=1750758534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJabXLtW1m0bIrhc/aru55FQgKQQl5SUoAdpl7Ryqe0=;
        b=HboJ9PAC0LcpA3IqXFI8kPjVXB463fE/WgCn6xOjqjMtrxDDB8bJfWDwmwPr3wa4K/
         9kTSZFNpgWLdvK0jJrKguqhcD7sgZ9ckKRpwP+kWqnxY2g+EwUXQvZ/0pF4WWaAYBzRD
         JM4syc2UzVYYT4OYlnyEABo1lCWiA/J+ADd4OOyIg5nepYjc6soNWJywrRXu7iBuKrxh
         VeuaAlBQCVuD2hfmvSk37VbGZpWPAJBddxcUTeZkUk3XOigNwycC8Q8dfZGjVEuiVNUx
         G8ajuPTdzKzydFtCm021bD1GUX0zlQOhmuUPlxwW22JRLuXfARJ1tBCWhvFF+otnLESo
         FZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153734; x=1750758534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJabXLtW1m0bIrhc/aru55FQgKQQl5SUoAdpl7Ryqe0=;
        b=a2fsbeVRhVJyRJCVmopf89PA5wOCcMc3EG+F9NtqLymzHDe+o7h9/cRDlv1N1mLdCC
         FzWqGNHEMNSHRctlCpiNTdAW4+e7DzkeyqfZC/qRydr0LdDG3gcfGhd0pM+SXnhrLRLy
         b3Qx7NanJ5P3foYq5Za1jnPx0d/I65y2y9FJglm8YQBC+oHt4TN/W7dA+t7MAWsakRXo
         OMS9O+yh8osDIp43dPrm/h7G6QmoLfbMlrvP/Sa56KJLR179C2wi2ZFZcGdhdGTQylvq
         +4KbDDfkXaSXeqdcAwysAt+DZxcCfKHwurYu2ISPNYBDntDFeviR5KRxsMAHDDkUC6uC
         dRtA==
X-Forwarded-Encrypted: i=1; AJvYcCUwJUonFI/7YuFgHitsmL3u4BodUwvDZzB+7jqeHJzYB0vKs9DcfR8r7dI8XbhQPNDtfL4m@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhh4Aya9rqM4365xED5gjOJ/pMjvfg9DXtz+eAOA27E2kPx7mX
	gLNtx4ijRB8c6+laFXkQfq+gENm/ztD4h2csw/N5LV1VSgnQlJC8XToj6mINmLisB8ZLTLKpQ81
	3mCiVtEGMDYniFVWLE5OXfCgf4lpM8nUt/avBkl3QEg==
X-Gm-Gg: ASbGncuQaq/8dy+BIJCF45kCVPOUhX+wQBLWZYExh6ZpbU30+hw/ehVtEJ6HgsAGtEe
	JXRgF/XTixlCzGdi0ZgXfy2vyiUxtOscwLyAGD5d7YnT0rjxoZfwyjYUhP/Al5RIiWEe9Z+eQ70
	IZDGhFI3BUxSf9M3dkvTaZbmIokDH7++M5dok6PrBBV/KpBH0v+gYTsPDsGq4lu59A02BmM1UkT
	aHIC13wwXQXgWo=
X-Google-Smtp-Source: AGHT+IFqlwLfs3w5t0Kke4vusAJ0LDpMDoRdBhRndcFHTCxIPX6kVlBZ7kOElI3G6E8LB5BuhyWmQMy9mQlLjgSj4NQ=
X-Received: by 2002:a05:6102:4b88:b0:4e7:db33:5725 with SMTP id
 ada2fe7eead31-4e7f632331bmr9323586137.3.1750153734104; Tue, 17 Jun 2025
 02:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYssELHcYKwgGNBMLrfeKZa9swGdLrH7gxqzd4P0kaOiZg@mail.gmail.com>
 <7c101fe5-7c73-4916-a832-d656511eeab8@heusel.eu> <ec18001d-7123-4d13-aea7-a28594cd137b@redhat.com>
In-Reply-To: <ec18001d-7123-4d13-aea7-a28594cd137b@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 17 Jun 2025 15:18:42 +0530
X-Gm-Features: AX0GCFuBeLu3_hPbiCBoM4g8VWlAFlv6r7WSlxB2DJ9al6JMin7gQdwU7P-bZ5E
Message-ID: <CA+G9fYvoYSpyxpBAcAje6X7707+y9cc84mUrWMvdLtZc3Np1eQ@mail.gmail.com>
Subject: Re: clang: selftests/mm gup_longterm error while loading shared
 libraries liburing.so.2 cannot open shared object file No such file or directory
To: David Hildenbrand <david@redhat.com>
Cc: Christian Heusel <christian@heusel.eu>, clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	Zi Yan <ziy@nvidia.com>, lorenzo.stoakes@oracle.com, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Jun 2025 at 01:58, David Hildenbrand <david@redhat.com> wrote:
>
> On 16.06.25 21:14, Christian Heusel wrote:
> > On 25/06/16 11:02PM, Naresh Kamboju wrote:
> >> The following test regressions noticed while running selftests/mm gup_=
longterm
> >> test cases on Dragonboard-845c, Dragonboard-410c, rock-pi-4, qemu-arm6=
4 and
> >> qemu-x86_64 this build have required selftest/mm/configs included and =
toolchain
> >> is clang nightly.
> >>
> >> Regressions found on Dragonboard-845c, Dragonboard-410c, rock-pi-4,
> >> qemu-arm64 and qemu-x86_64
> >>    -  selftests mm gup_longterm fails
> >>
> >> Regression Analysis:
> >>   - New regression? Yes
> >>   - Reproducibility? Yes
> >>
> >> Test regression: selftests mm gup_longterm error while loading shared
> >> libraries liburing.so.2 cannot open shared object file No such file or
> >> directory
>  >> Test regression: selftests mm cow error while loading shared
> libraries>> liburing.so.2 cannot open shared object file No such file or
> directory
> >
> > These do not really look like kernel regressions, rather like a bug in
> > the userspace testing tool =F0=9F=A4=94 Could it be that the tests were=
 not
> > rebuilt for the new liburing or that the dependency is not installed in
> > the test environment?
>
> It looks like the tests were build with liburing around, and then ran
> without liburing around.
>
> Note that the file for example has:
>
> #ifdef LOCAL_CONFIG_HAVE_LIBURING
> #include <liburing.h>
> #endif /* LOCAL_CONFIG_HAVE_LIBURING */
>
> You should be running into similar issues with cow.c, which uses the
> exact same approach for detecting+linking liburing.
>
> So seems like something is off in your testing environment?

The kselftest built with cross toolchain((gcc-13 and clang) vs (arm64 / x86=
_64))
and tar / zipped and exported to NFS and mounted by DUT the
device under test by using overlayfs.

The tar / zipped file has all installed binaries and script files to run te=
sts.

However, The missing debian package onto the userspace has been installed
 + liburing-dev today. This will fix the reported problem.

- Naresh

>
> --
> Cheers,
>
> David / dhildenb
>
