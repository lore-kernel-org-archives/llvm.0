Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566B37C11D
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 22:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775599536; cv=pass; b=QXYqlEdGW+XoN6Yx5+a2X0BELnYOQOJUKm7El9U7zr4r2+hNAzn9lNLMeEHCL8nd2qAO4whRlM+JBd6Ypx7h/7iF2Q8pVSWltgoUc8iC54trKchqZjNeQobudCvzZCiTzAWKx9kvyulZwSMwh6vG6J0WQxgzjpviiaY0WHZRJlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775599536; c=relaxed/simple;
	bh=iLatwWqBYFmxk9mYv2vpAYMFlXcmULXHBcnERT3qdlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYAd0NHsRa6sooza+ouFCpJ0jETXDpWIK/VBtBBdEE2nsrVi8arV8hQiDj/NhG8bIh/vIWS1MuAeIJNQyUQMVNvSp9wehp2ivV9vFWiZhXh9yeRbFmT506ZBK80EKHDZR7uF9BP/mGfAr9ABdOCG3lziVBDdbzgwKxq64ZMV0Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Th0vJSFk; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Th0vJSFk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso3302809f8f.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 15:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775599533; cv=none;
        d=google.com; s=arc-20240605;
        b=YP/yCJqVix1WiDxtA9eQ0Sxt7YRDpa84yC/YRuxGYm8h3x63YQfYlFD7S0VWD8pxiQ
         Kgipd6UcLwQHj65/qY43CQRbd74vJN7jWUf3+z7gCnlbcUM+GduwwJuQu6STSSjgImzW
         78UMWUH6wL/4/oPEJWj+pAXtAXQKvINxxG/u3hebpxpqKiGRB+3qpLCUykXyfa0Uimox
         vyi/GdXbOIcxeQYjUuaAMqjdR0PQ748GLokwnR3maWTD9F0ZIQEj24HCx/LvCHr0P4pN
         //S/bcvpeA7tLwVHoUGPvEP/0acHLASiN0OYVhEO8RSI6AhxPqL9+A8vwLs2oFQl4Xcv
         jTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MG6irsax2dWjsgBAdF5tVJt+HiAYcnDKOtc9l26Py+M=;
        fh=gvbyzM9a7u4ixi434G3SMbzKZVRzNGjemOlroznaEUs=;
        b=QYKyfzjWpgNAb+Lt8WAKCCdmL4ktY6PvvZWcme6xb7RNR03yuVd4cGf6y97vH+YbF2
         F9JroPgrZXsDR0mGHkEuWpYEYLBr9UsrD9x8awKhoohnEo2sjn/2lSTurGVJgMYN91uZ
         B3k4xwnTyBSqZy43FqGVpuWt4Bjtnn727T/mI3/x1h+LWmRw7VdCUrm/BZx7j+GVCERg
         sBMu3gGmfJdl9FtxcL02+tXziwM0vnecETX52kemK65gqQbN94ndrmQOBgWR4eC8Ujas
         nm6S6XrywLLCVlzM4UBT42uKsRVR3JEVVmUAO+JQa9zDBMGa9XGKOghXLxmYsAg2B7ps
         Sehw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775599533; x=1776204333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG6irsax2dWjsgBAdF5tVJt+HiAYcnDKOtc9l26Py+M=;
        b=Th0vJSFkvxBL17k1p1kFXlN7RzQVjKkJP7PCRgB3gd8UwYmFvAkQH9wGJhCjNAxsq5
         rCS8z7wjvORr8O0IGqrOgo3uDLURn+tm3334cSGFoHzqzRB0n7vdc1Ea9jtVCohZWcPF
         iWgm8Qv6+UrGObphpgQuEIkBHPzxej/PskHx1LoqnNwMd4moeQkK+hKPRwaHLbdBJA3w
         U1L+s2ek9XfI0spV7rP4jH4ZDrAUhaZ5DL4Y4A1eG/CqpisBXH2twU1YIxdaVkpaQan9
         scQ9AtvUaprbysHFCcEUe5Cl5nJpjdj9mqFL3WUtWgzlsKTASR8/jmWJ7kCqqDJyRr60
         5KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775599533; x=1776204333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MG6irsax2dWjsgBAdF5tVJt+HiAYcnDKOtc9l26Py+M=;
        b=P8NmEA0g+Q2akuT4ICFqwNrLOAEnVd6jGptUJAy/L0r0ocioG3gV34fPnUzJHH8wxu
         S0O/6Ykyv2vWU3xdS+/U81XrXGOMyj9ido1LwCp8PzTaHIrT8SDaxA7NqGYqe/f8Wj7Z
         FYJKQIuj1SIKxQkfYZz66N/XG2NmXAFddqwJmxe1s5OPtpFfD74p3rQgUrxwjgKmAimy
         H1hq65HJAF5JhoTgIKA4f1LkCKeJZ0avyQAvD/JOPuXNpryjy5ilnj7rgexzDzSWF9jT
         WSjPI160iF8MrOqiTC/v2KQa1sY7HkmVt4/rNgFwI7wlY7nLK4KH/rXL7KEhW05uXDvr
         ZEPw==
X-Forwarded-Encrypted: i=1; AJvYcCUAVU6wk1AGNWoz0bkfUllZ1fdD2fMA+g4tzegpAynTuA5uCd9fUoPneviTJdN/RH9Cc1zS@lists.linux.dev
X-Gm-Message-State: AOJu0YzxTHUaT6phkM6p87HyrojV1h+ieav5AWqeO67gyRkCwFlxzW/+
	QKlsK3TBVoZsVBI2B1Ty0xHmMtPvYZtOqkw9RQpSrrV2kHPK9P49cSFbKroEDdgF0BB3VTJrlUv
	RVxaC6N1YdTdx+eL0iAtGp/WukemUnMydkqtq9m7x
X-Gm-Gg: AeBDietlLbI5YdZnqPiOyH2ppOTI3jW7by7E0hxRq4fORbtuwVF1iSLgb7lw1Ptzi/R
	pONUI7LLYBRSec70YoAhwobgmWzb/88miT1QWPPAifofo6JUfSpVoKLL64SL+8b59wyHtFpBv4w
	vOlj8Ka2TG4DBBel6NbjC4LdcH9pZf9i96N+HhcCcySPgFSWFw4qLZo0pawlO+P6FjXRUUcAqKN
	mM1blQ8Y0nSHdZc3c83z3WVpUP2/Ia6jS5PUfWAfPLIzV4LIhUMcn5Te3ETx3P7EPEq3U3lgw8R
	XegCk52C/gW68N1+w07GNM+40ssblE+HngR2Cq/HgA2TA1cK
X-Received: by 2002:a05:6000:22c8:b0:439:a95b:3c43 with SMTP id
 ffacd0b85a97d-43d292c6b32mr27982031f8f.21.1775599532335; Tue, 07 Apr 2026
 15:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604071509.y5vLetYd-lkp@intel.com> <20260407145902.057044dc19e7313b21418ff4@linux-foundation.org>
In-Reply-To: <20260407145902.057044dc19e7313b21418ff4@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Apr 2026 00:05:20 +0200
X-Gm-Features: AQROBzBS8AAmv7_Gd4m6Vdm8r3Fj8wyDr1G_Q3blKHwyOYaH046KJHSKTcfAdPg
Message-ID: <CAH5fLgjuFLXRgiHD27ErSRgxu7-uzqjf8z3H9Bj0=xKSaCHW_Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 113/133] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 11:59=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 07 Apr 2026 15:58:09 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> > head:   3fa44141e0bbd5062f2ef0c5cdddd98275d3223e
> > commit: 694fc0bd3ca5420f4e1105d2dec02327cfc5d64b [113/133] userfaultfd:=
 introduce vm_uffd_ops
> > config: x86_64-randconfig-074-20260407 (https://download.01.org/0day-ci=
/archive/20260407/202604071509.y5vLetYd-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260407/202604071509.y5vLetYd-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604071509.y5vLetYd-l=
kp@intel.com/
>
> Various forms of "userfaultfd: introduce vm_uffd_ops" have been in
> mm.git since March 6.  Thanks (much), but is it possible to get more
> timely notifications?
>
> > All errors (new ones prefixed by >>):
> >
> > >> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be share=
d between threads safely
> >    --> drivers/android/binder/page_range.rs:146:23
> >    |
> >    146   | static BINDER_VM_OPS: bindings::vm_operations_struct =3D pin=
_init::zeroed();
> >    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kerne=
l::bindings::vm_uffd_ops` cannot be shared between threads safely
> >    |
> >    =3D help: within `kernel::bindings::vm_operations_struct`, the trait=
 `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
> >    note: required because it appears within the type `kernel::bindings:=
:vm_operations_struct`
> >    --> rust/bindings/bindings_generated.rs:74703:12
> >    |
> >    74703 | pub struct vm_operations_struct {
> >    |            ^^^^^^^^^^^^^^^^^^^^
> >    =3D note: shared static variables must have a type that implements `=
Sync`
>
> We've seen this one before.  Sorry, I'm (still) not set up for
> build-testing rusty things and I suspect I'm not the only one.
>
> Alice, Miguel: please can you help us here?

Hi Andrew,

I introduced this bug in commit 8ef2c15aeae0 ("rust_binder: check
ownership before using vma") and fixed it again in commit ec327abae5ed
("rust_binder: use AssertSync for BINDER_VM_OPS"). This means that the
bug is present from v7.0-rc4 and was fixed as of v7.0-rc7. To avoid
this build failure, the "userfaultfd: introduce vm_uffd_ops" commit
must either be on top of v7.0-rc7, or it must be on a base that does
not include v7.0-rc4.

Alice
